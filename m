Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D93DD79481
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 13:09:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8PD9e8J020962
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Sep 2018 06:09:40 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 25 Sep 2018 06:09:39 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 25 Sep 2018 21:19:09 +0800
Message-ID: <1537881550-13954-3-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1537881550-13954-1-git-send-email-hongxu.jia@windriver.com>
References: <1537881550-13954-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/4] umip: support openssl 1.1.x
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
X-List-Received-Date: Tue, 25 Sep 2018 13:09:40 -0000
Content-Type: text/plain

Long time no maintain from upstream since 2013,
backport a fix from openSUSE

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../umip/files/0001-support-openssl-1.1.x.patch    | 88 ++++++++++++++++++++++
 meta-oe/recipes-connectivity/umip/umip_1.0.bb      |  3 +-
 2 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/umip/files/0001-support-openssl-1.1.x.patch

diff --git a/meta-oe/recipes-connectivity/umip/files/0001-support-openssl-1.1.x.patch b/meta-oe/recipes-connectivity/umip/files/0001-support-openssl-1.1.x.patch
new file mode 100644
index 0000000..d8355e2
--- /dev/null
+++ b/meta-oe/recipes-connectivity/umip/files/0001-support-openssl-1.1.x.patch
@@ -0,0 +1,88 @@
+From 62784e8b6df8ff3a907c1f816154808bea9d7064 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 25 Sep 2018 14:38:14 +0800
+Subject: [PATCH] support openssl 1.1.x
+
+Long time no maintain from upstream since 2013
+(git://git.umip.org/umip/umip.git), backport a
+fix from openSUSE
+
+Upstream-Status: Backport [openSUSE]
+http://ftp.gwdg.de/pub/opensuse/source/distribution/leap/15.0/repo/oss/src/mipv6d-2.0.2.umip.0.4-lp150.1.2.src.rpm
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/keygen.c | 12 ++++++++++++
+ src/mh.c     | 17 ++++++++++++++++-
+ 2 files changed, 28 insertions(+), 1 deletion(-)
+
+diff --git a/src/keygen.c b/src/keygen.c
+index e434a38..b902644 100644
+--- a/src/keygen.c
++++ b/src/keygen.c
+@@ -172,6 +172,7 @@ static void build_kgen_token(struct in6_addr *addr, uint8_t *nonce,
+ 	uint8_t tmp[20];
+ #ifdef HAVE_LIBCRYPTO
+ 	unsigned int len = 20;
++#if defined(OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER < 0x1010006fL
+ 	HMAC_CTX ctx;
+ 
+ 	HMAC_CTX_init(&ctx);
+@@ -182,6 +183,17 @@ static void build_kgen_token(struct in6_addr *addr, uint8_t *nonce,
+ 	HMAC_Final(&ctx, tmp, &len);
+ 	HMAC_CTX_cleanup(&ctx);
+ #else
++	HMAC_CTX *ctx;
++	ctx = HMAC_CTX_new();
++	HMAC_Init_ex(ctx, key_cn, sizeof(key_cn), EVP_sha1(), NULL);
++	HMAC_Update(ctx, (unsigned char *)addr, sizeof(*addr));
++	HMAC_Update(ctx, nonce, NONCE_LENGTH);
++	HMAC_Update(ctx, &id, sizeof(id));
++	HMAC_Final(ctx, tmp, &len);
++	HMAC_CTX_free(ctx);
++#endif // End of defined(OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER < 0x1010006fL
++
++#else
+ 	HMAC_SHA1_CTX ctx;
+ 
+ 	HMAC_SHA1_init(&ctx, key_cn, sizeof(key_cn));
+diff --git a/src/mh.c b/src/mh.c
+index cba9a33..212eb5a 100644
+--- a/src/mh.c
++++ b/src/mh.c
+@@ -518,9 +518,10 @@ static int calculate_auth_data(const struct iovec *iov, int iovlen,
+ 
+ #ifdef HAVE_LIBCRYPTO
+ 	unsigned int len = HMAC_SHA1_HASH_LEN;
+-	HMAC_CTX ctx;
+ 	const EVP_MD *evp_md = EVP_sha1();
+ 
++#if defined(OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER < 0x1010006fL
++	HMAC_CTX ctx;
+ 	HMAC_CTX_init(&ctx);
+ 	HMAC_Init_ex(&ctx, key, HMAC_SHA1_KEY_SIZE, evp_md, NULL);
+ 
+@@ -532,6 +533,20 @@ static int calculate_auth_data(const struct iovec *iov, int iovlen,
+ 	HMAC_Final(&ctx, buf, &len);
+ 	HMAC_CTX_cleanup(&ctx);
+ #else
++	HMAC_CTX *ctx;
++	ctx = HMAC_CTX_new();
++	HMAC_Init_ex(ctx, key, HMAC_SHA1_KEY_SIZE, evp_md, NULL);
++
++	HMAC_Update(ctx, (uint8_t *)coa, sizeof(*coa));
++	HMAC_Update(ctx, (uint8_t *)cn, sizeof(*coa));
++	for (i = 0; i < iovlen; i++) {
++		HMAC_Update(ctx, (uint8_t *)iov[i].iov_base, iov[i].iov_len);
++	}
++	HMAC_Final(ctx, buf, &len);
++	HMAC_CTX_free(ctx);
++#endif
++
++#else
+ 	HMAC_SHA1_CTX ctx;
+ 
+ 	HMAC_SHA1_init(&ctx, key, HMAC_SHA1_KEY_SIZE);
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-connectivity/umip/umip_1.0.bb b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
index cee44f6..e2abc02 100644
--- a/meta-oe/recipes-connectivity/umip/umip_1.0.bb
+++ b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://umip.org/"
 SECTION = "System Environment/Base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=073dc31ccb2ebed70db54f1e8aeb4c33"
-DEPENDS = "openssl10 ipsec-tools radvd indent-native bison-native"
+DEPENDS = "openssl ipsec-tools radvd indent-native bison-native"
 
 SRC_URI = "git://git.umip.org/umip/umip.git \
            file://add-dependency-to-support-parallel-compilation.patch \
@@ -16,6 +16,7 @@ SRC_URI = "git://git.umip.org/umip/umip.git \
            file://0001-Add-format-string-to-fprintf-call.patch \
            file://0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch \
            file://0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch \
+           file://0001-support-openssl-1.1.x.patch \
            "
 SRCREV = "cbd441c5db719db554ff2b4fcb02fef88ae2f791"
 
-- 
2.7.4


