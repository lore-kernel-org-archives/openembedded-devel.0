Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3982777097
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Oct 2015 19:55:32 +0000 (UTC)
Received: by pacfv12 with SMTP id fv12so139717213pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Oct 2015 12:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JiHfWQ6oMCr3H/kHEGgeTuYoBW4XCmuaIGGKBxz8+YI=;
	b=boeVE6CDY9OpN6bh1Z475QOfM+dWNs/lw0i+iHLjcrHtkUWslh/V+BypBEuWthYevt
	o93C2fgRilkiv3DLj1jDZAtQufF2/4+DxV0ksY5dNDdnSU5gtH14uGPIuQqTMAH//CNd
	Hh+frOzCFFuimlCyNgux9dKprIPjItFYARzsTuyiw23LGfaYmkeK1Hbhh5w08gP7ZWkh
	B3M5N/xFOsQLhzbQs7GV1+kHpcSeGZdL10n/N82YeoU0JrsNihP38kXSo3o5OYWCysUu
	0KMi2Bv7WM5JO3KV5S+ESoWZx2GbMCSiDAR2+xWzf30Bd/5/6wHdnjzz7La4e8OchZ/W
	vZyw==
X-Received: by 10.68.206.40 with SMTP id ll8mr28952894pbc.62.1443902132730;
	Sat, 03 Oct 2015 12:55:32 -0700 (PDT)
Received: from imac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by smtp.gmail.com with ESMTPSA id
	tp6sm18820319pbc.81.2015.10.03.12.55.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 03 Oct 2015 12:55:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Oct 2015 12:55:25 -0700
Message-Id: <1443902125-30247-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1443902125-30247-1-git-send-email-raj.khem@gmail.com>
References: <1443902125-30247-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] libnetfilter: Avoid using VLAs
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
X-List-Received-Date: Sat, 03 Oct 2015 19:55:33 -0000

VLAs in non POD data types like structures and unions
are not a standard feature of C language and gcc has specific
implementation which other compilers dont have specifically clang, and
they refuse to implement it since its non standard.

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
2.6.0


