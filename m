Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id BB49F60125
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 01:56:36 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so38141699pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Oct 2015 18:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=H6z5hH/ucEVEUo2e2rqF58SKmNcIkarFZTfc5FuY00A=;
	b=zSxjgI8/KelrCjvBZAfOHSZGbkawTIO3gF5/B3kiah98T/54cV4cJR2X6Qf4GaaBr+
	DKryXhLzJG9FazhJoTkrssd3qFwNK4bydV57PnafM6zbt44UIoBa9tlSF0Q/9cOi82pW
	QY3kmvv4q9bA36BIo6jkYiIZJe1i1HUPnrwaaeecR+TQmzHREO9oSDn1iWAjKZL+Ssee
	H0dTuigjkodxUCbuSnM8vsS8HTFdZ8Cv8SRjM1PeX23P/4YMgRaNNHy64O8qInXjZUzK
	3rzJNWyKvGDiDE9ChUlYr7Mgt4Cjf194vcFJtaYHBZgReAbNCFN7vmdobJCJ73QdZAF9
	EarA==
X-Received: by 10.66.241.40 with SMTP id wf8mr4875574pac.157.1444269396443;
	Wed, 07 Oct 2015 18:56:36 -0700 (PDT)
Received: from imac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by smtp.gmail.com with ESMTPSA id rz7sm6381659pbc.7.2015.10.07.18.56.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Oct 2015 18:56:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Oct 2015 18:56:31 -0700
Message-Id: <1444269391-3505-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.1
Subject: [meta-networking][PATCH V2 2/2] libnetfilter: Avoid using VLAs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Oct 2015 01:56:37 -0000

VLAs in composite data types like structures and unions
are not a standard feature of C language,  gcc has specific
implementations for but other compilers dont have that done specifically clang, and
the community refuses to implement it since its non standard.

Change-Id: I6ae24adb455bf262fe9406a1c8e3b3a4a0cf77d4
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libnetfilter/files/replace-VLAs-in-union.patch | 89 ++++++++++++++++++++++
 .../libnetfilter/libnetfilter-conntrack_1.0.4.bb   |  4 +-
 2 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-filter/libnetfilter/files/replace-VLAs-in-union.patch

diff --git a/meta-networking/recipes-filter/libnetfilter/files/replace-VLAs-in-union.patch b/meta-networking/recipes-filter/libnetfilter/files/replace-VLAs-in-union.patch
new file mode 100644
index 0000000..16e4af4
--- /dev/null
+++ b/meta-networking/recipes-filter/libnetfilter/files/replace-VLAs-in-union.patch
@@ -0,0 +1,89 @@
+VLAs in structs and unions (non-PODs) is unsupported in non-gcc compilers
+therefore convert it to not use VLAs instead use fixed arrays
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: libnetfilter_conntrack-1.0.4/src/conntrack/api.c
+===================================================================
+--- libnetfilter_conntrack-1.0.4.orig/src/conntrack/api.c
++++ libnetfilter_conntrack-1.0.4/src/conntrack/api.c
+@@ -954,16 +954,15 @@ int nfct_query(struct nfct_handle *h,
+ 	       const enum nf_conntrack_query qt,
+ 	       const void *data)
+ {
+-	size_t size = 4096;	/* enough for now */
+ 	union {
+-		char buffer[size];
++		char buffer[4096];
+ 		struct nfnlhdr req;
+ 	} u;
+ 
+ 	assert(h != NULL);
+ 	assert(data != NULL);
+ 
+-	if (__build_query_ct(h->nfnlssh_ct, qt, data, &u.req, size) == -1)
++	if (__build_query_ct(h->nfnlssh_ct, qt, data, &u.req, 4096) == -1)
+ 		return -1;
+ 
+ 	return nfnl_query(h->nfnlh, &u.req.nlh);
+@@ -986,16 +985,15 @@ int nfct_send(struct nfct_handle *h,
+ 	      const enum nf_conntrack_query qt,
+ 	      const void *data)
+ {
+-	size_t size = 4096;	/* enough for now */
+ 	union {
+-		char buffer[size];
++		char buffer[4096];
+ 		struct nfnlhdr req;
+ 	} u;
+ 
+ 	assert(h != NULL);
+ 	assert(data != NULL);
+ 
+-	if (__build_query_ct(h->nfnlssh_ct, qt, data, &u.req, size) == -1)
++	if (__build_query_ct(h->nfnlssh_ct, qt, data, &u.req, 4096) == -1)
+ 		return -1;
+ 
+ 	return nfnl_send(h->nfnlh, &u.req.nlh);
+Index: libnetfilter_conntrack-1.0.4/src/expect/api.c
+===================================================================
+--- libnetfilter_conntrack-1.0.4.orig/src/expect/api.c
++++ libnetfilter_conntrack-1.0.4/src/expect/api.c
+@@ -669,16 +669,15 @@ int nfexp_query(struct nfct_handle *h,
+ 	        const enum nf_conntrack_query qt,
+ 	        const void *data)
+ {
+-	size_t size = 4096;	/* enough for now */
+ 	union {
+-		char buffer[size];
++		char buffer[4096];
+ 		struct nfnlhdr req;
+ 	} u;
+ 
+ 	assert(h != NULL);
+ 	assert(data != NULL);
+ 
+-	if (__build_query_exp(h->nfnlssh_exp, qt, data, &u.req, size) == -1)
++	if (__build_query_exp(h->nfnlssh_exp, qt, data, &u.req, 4096) == -1)
+ 		return -1;
+ 
+ 	return nfnl_query(h->nfnlh, &u.req.nlh);
+@@ -701,16 +700,15 @@ int nfexp_send(struct nfct_handle *h,
+ 	       const enum nf_conntrack_query qt,
+ 	       const void *data)
+ {
+-	size_t size = 4096;	/* enough for now */
+ 	union {
+-		char buffer[size];
++		char buffer[4096];
+ 		struct nfnlhdr req;
+ 	} u;
+ 
+ 	assert(h != NULL);
+ 	assert(data != NULL);
+ 
+-	if (__build_query_exp(h->nfnlssh_exp, qt, data, &u.req, size) == -1)
++	if (__build_query_exp(h->nfnlssh_exp, qt, data, &u.req, 4096) == -1)
+ 		return -1;
+ 
+ 	return nfnl_send(h->nfnlh, &u.req.nlh);
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.4.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.4.bb
index c1df1cb..ecbc86b 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.4.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.4.bb
@@ -6,7 +6,9 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "libnfnetlink libmnl"
 
-SRC_URI = "http://www.netfilter.org/projects/libnetfilter_conntrack/files/libnetfilter_conntrack-${PV}.tar.bz2;name=tar"
+SRC_URI = "http://www.netfilter.org/projects/libnetfilter_conntrack/files/libnetfilter_conntrack-${PV}.tar.bz2;name=tar \
+           file://replace-VLAs-in-union.patch \
+"
 SRC_URI[tar.md5sum] = "18cf80c4b339a3285e78822dbd4f08d7"
 SRC_URI[tar.sha256sum] = "d9ec4a3caf49417f2b0a2d8d44249133e8c3ec78c757b7eb8c273f1cb6929c7d"
 
-- 
2.6.1


