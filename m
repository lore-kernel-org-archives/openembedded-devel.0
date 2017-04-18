Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id DE9F571BEE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:21:56 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 34so152013pgx.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZEfrAM80b0LQXXJ6Ek8J4COnOc9uzhdW4TJgyDX9XqM=;
	b=EEorIZ/HUc/18ejeo/MufBQMQYAd6qlU64fRd3R68ZukOTQKKkwSQ+7AfwXhXGDSrb
	wNa0IKfM/bYpbXEqVHojtp273SJsu/LpD0N/huiYTuph3G66wfVngADhYPyb4j7iTGhm
	pIsMgpch1zqKc9Qdc5c7qzNnmTZ/F9VupuafdqQlknjCtwo3kw2G0IfDrvZMtlSIIxej
	sKqoUQthcFr0b17vEJQrm4aAcly8OBEQOQo4FdmZeClAPpo0nO9hL0SQuD+MxgKPKuE7
	q9Eo74gp2oOqvugK0d94jHbRuJene9pgb2XjZ8AeWxFoxltvVas1OndRb4305luOgYjk
	itNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZEfrAM80b0LQXXJ6Ek8J4COnOc9uzhdW4TJgyDX9XqM=;
	b=GLyJRtMFD7d8xfCSCShDjO5Tn25QQSAml9+9igek+8zJFBqX6QDTJfQvTod4aLY6vF
	ADK9yXUNkV7xGv+h9saUcTewdewM3d2VtajyywSb9XdTdvDLSjtbTE+wphVH8GHgwWEO
	UPitQQPbM4FzVWojWk1IAFaF208xFs9dyY1ZpnFuq791rnHsfV03OPLLsJ8wMQ36TEp0
	Li2AfPegqkQqNiuGXSkERJeh/IOsxpg0/CfYSVNtylsQ4azYkZxAD4Ia8RVpwv765c1b
	/sw8JldPaAUV4u185G904qWc58/Wyr9E6zGUzHuSCb3KSmagzoH0Chu95VyKmoNYVj4R
	GO1Q==
X-Gm-Message-State: AN3rC/5E2V2uQusuoD5ZK72R8jbineiTYaWh9RU9RdWZIXr6mjCSRa7B
	4NWcqKTgjFDVsFpk
X-Received: by 10.84.129.67 with SMTP id 61mr25351637plb.16.1492539717456;
	Tue, 18 Apr 2017 11:21:57 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.21.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:21:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:14 -0700
Message-Id: <20170418182142.27253-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-networking][ 04/32] libnetfilter-conntrack: Upgrade to 1.0.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Apr 2017 18:21:57 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libnetfilter/files/replace-VLAs-in-union.patch | 89 ----------------------
 ...ck_1.0.4.bb => libnetfilter-conntrack_1.0.6.bb} |  5 +-
 2 files changed, 2 insertions(+), 92 deletions(-)
 delete mode 100644 meta-networking/recipes-filter/libnetfilter/files/replace-VLAs-in-union.patch
 rename meta-networking/recipes-filter/libnetfilter/{libnetfilter-conntrack_1.0.4.bb => libnetfilter-conntrack_1.0.6.bb} (75%)

diff --git a/meta-networking/recipes-filter/libnetfilter/files/replace-VLAs-in-union.patch b/meta-networking/recipes-filter/libnetfilter/files/replace-VLAs-in-union.patch
deleted file mode 100644
index 16e4af405..000000000
--- a/meta-networking/recipes-filter/libnetfilter/files/replace-VLAs-in-union.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-VLAs in structs and unions (non-PODs) is unsupported in non-gcc compilers
-therefore convert it to not use VLAs instead use fixed arrays
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: libnetfilter_conntrack-1.0.4/src/conntrack/api.c
-===================================================================
---- libnetfilter_conntrack-1.0.4.orig/src/conntrack/api.c
-+++ libnetfilter_conntrack-1.0.4/src/conntrack/api.c
-@@ -954,16 +954,15 @@ int nfct_query(struct nfct_handle *h,
- 	       const enum nf_conntrack_query qt,
- 	       const void *data)
- {
--	size_t size = 4096;	/* enough for now */
- 	union {
--		char buffer[size];
-+		char buffer[4096];
- 		struct nfnlhdr req;
- 	} u;
- 
- 	assert(h != NULL);
- 	assert(data != NULL);
- 
--	if (__build_query_ct(h->nfnlssh_ct, qt, data, &u.req, size) == -1)
-+	if (__build_query_ct(h->nfnlssh_ct, qt, data, &u.req, 4096) == -1)
- 		return -1;
- 
- 	return nfnl_query(h->nfnlh, &u.req.nlh);
-@@ -986,16 +985,15 @@ int nfct_send(struct nfct_handle *h,
- 	      const enum nf_conntrack_query qt,
- 	      const void *data)
- {
--	size_t size = 4096;	/* enough for now */
- 	union {
--		char buffer[size];
-+		char buffer[4096];
- 		struct nfnlhdr req;
- 	} u;
- 
- 	assert(h != NULL);
- 	assert(data != NULL);
- 
--	if (__build_query_ct(h->nfnlssh_ct, qt, data, &u.req, size) == -1)
-+	if (__build_query_ct(h->nfnlssh_ct, qt, data, &u.req, 4096) == -1)
- 		return -1;
- 
- 	return nfnl_send(h->nfnlh, &u.req.nlh);
-Index: libnetfilter_conntrack-1.0.4/src/expect/api.c
-===================================================================
---- libnetfilter_conntrack-1.0.4.orig/src/expect/api.c
-+++ libnetfilter_conntrack-1.0.4/src/expect/api.c
-@@ -669,16 +669,15 @@ int nfexp_query(struct nfct_handle *h,
- 	        const enum nf_conntrack_query qt,
- 	        const void *data)
- {
--	size_t size = 4096;	/* enough for now */
- 	union {
--		char buffer[size];
-+		char buffer[4096];
- 		struct nfnlhdr req;
- 	} u;
- 
- 	assert(h != NULL);
- 	assert(data != NULL);
- 
--	if (__build_query_exp(h->nfnlssh_exp, qt, data, &u.req, size) == -1)
-+	if (__build_query_exp(h->nfnlssh_exp, qt, data, &u.req, 4096) == -1)
- 		return -1;
- 
- 	return nfnl_query(h->nfnlh, &u.req.nlh);
-@@ -701,16 +700,15 @@ int nfexp_send(struct nfct_handle *h,
- 	       const enum nf_conntrack_query qt,
- 	       const void *data)
- {
--	size_t size = 4096;	/* enough for now */
- 	union {
--		char buffer[size];
-+		char buffer[4096];
- 		struct nfnlhdr req;
- 	} u;
- 
- 	assert(h != NULL);
- 	assert(data != NULL);
- 
--	if (__build_query_exp(h->nfnlssh_exp, qt, data, &u.req, size) == -1)
-+	if (__build_query_exp(h->nfnlssh_exp, qt, data, &u.req, 4096) == -1)
- 		return -1;
- 
- 	return nfnl_send(h->nfnlh, &u.req.nlh);
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.4.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.6.bb
similarity index 75%
rename from meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.4.bb
rename to meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.6.bb
index ecbc86ba7..e4e186bdb 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.4.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.6.bb
@@ -7,10 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "libnfnetlink libmnl"
 
 SRC_URI = "http://www.netfilter.org/projects/libnetfilter_conntrack/files/libnetfilter_conntrack-${PV}.tar.bz2;name=tar \
-           file://replace-VLAs-in-union.patch \
 "
-SRC_URI[tar.md5sum] = "18cf80c4b339a3285e78822dbd4f08d7"
-SRC_URI[tar.sha256sum] = "d9ec4a3caf49417f2b0a2d8d44249133e8c3ec78c757b7eb8c273f1cb6929c7d"
+SRC_URI[tar.md5sum] = "7139c5f408dd9606ffecfd5dcda8175b"
+SRC_URI[tar.sha256sum] = "efcc08021284e75f4d96d3581c5155a11f08fd63316b1938cbcb269c87f37feb"
 
 S = "${WORKDIR}/libnetfilter_conntrack-${PV}"
 
-- 
2.12.2


