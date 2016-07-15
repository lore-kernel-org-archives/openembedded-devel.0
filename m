Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id AE2A2606D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 19:03:49 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id p126so1740393qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 12:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1Xc28YNKXYS5V6chs1ZiyVPE/YfZWkmPfnGCYmkHgtI=;
	b=dIin8A++GS9jezbMufAAbeg0qqYBDcqW6rnzgqDVYK6ab+1dq30e3ZR8n6oLZwe3Ok
	dSfOOfNDEmKsqtxNHVAjrAchmi+ajRnuz36c4DJOiPfPuDxWJHS/4SomzWU8AjoGIEaY
	s/VuIMxQ5fDa2xLog7ck8tsxiLcGnrCQQGT7Lldvg5GJDW2/D0TE1BuYczedPXilndxz
	TngNOKRu2iYfGxNzU4j753sheEmFiRCL+h618Uj9NFPEtXiiqJfj49kRlyV/Ce8KzGiq
	RcwXrfizv+PGWMMJUsS1ciA3x5ksW8A2etjVrgg1LfgSzq+Dxdb6hQJY3EGc/ut9tsxW
	Gxnw==
X-Gm-Message-State: ALyK8tKQu0Qlb6WeBBdTYaRPisC/QvHXghte81cU952HSnhmq5e8INkfNvez/gFMSFvxYw==
X-Received: by 10.55.39.142 with SMTP id n136mr27946247qkn.149.1468609430124; 
	Fri, 15 Jul 2016 12:03:50 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 1sm1785472qtv.13.2016.07.15.12.03.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Jul 2016 12:03:49 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jul 2016 15:03:30 -0400
Message-Id: <1468609410-20791-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-cryptography: update to version 1.4 and remove patches now available with the latest release
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
X-List-Received-Date: Fri, 15 Jul 2016 19:03:54 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...s_1.1.bb => python-cryptography-vectors_1.4.bb} |  6 +-
 .../Comment_lingering_SSLv2_symbol.patch           | 24 -------
 .../Remove_SSLv2_bindings.patch                    | 75 ----------------------
 .../build_fix_openssl_1.0.1g.patch                 | 28 --------
 ...ptography_1.1.bb => python-cryptography_1.4.bb} |  9 +--
 5 files changed, 6 insertions(+), 136 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography-vectors_1.1.bb => python-cryptography-vectors_1.4.bb} (55%)
 delete mode 100644 meta-python/recipes-devtools/python/python-cryptography/Comment_lingering_SSLv2_symbol.patch
 delete mode 100644 meta-python/recipes-devtools/python/python-cryptography/Remove_SSLv2_bindings.patch
 delete mode 100644 meta-python/recipes-devtools/python/python-cryptography/build_fix_openssl_1.0.1g.patch
 rename meta-python/recipes-devtools/python/{python-cryptography_1.1.bb => python-cryptography_1.4.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_1.1.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_1.4.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python-cryptography-vectors_1.1.bb
rename to meta-python/recipes-devtools/python/python-cryptography-vectors_1.4.bb
index 2150e50..0313c81 100644
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors_1.1.bb
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors_1.4.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
 DEPENDS = "python-cryptography"
 SRCNAME = "cryptography_vectors"
 
-SRC_URI = "https://pypi.python.org/packages/source/c/cryptography-vectors/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://files.pythonhosted.org/packages/source/c/cryptography-vectors/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-SRC_URI[md5sum] = "0ad422501074929c06b7edd40df41844"
-SRC_URI[sha256sum] = "a929fbb0eac391c93c5745451a4d4157a8bc18eb2e69faf3af1d825ceacbf32c"
+SRC_URI[md5sum] = "b8555dfadafc4ecab4ee4650430d9cab"
+SRC_URI[sha256sum] = "0728815ef0c53d67fd437aa5220450a9752d41ecb28108f5df628a092ff466ea"
 
 inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python-cryptography/Comment_lingering_SSLv2_symbol.patch b/meta-python/recipes-devtools/python/python-cryptography/Comment_lingering_SSLv2_symbol.patch
deleted file mode 100644
index b28e7ef..0000000
--- a/meta-python/recipes-devtools/python/python-cryptography/Comment_lingering_SSLv2_symbol.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From f326e4a97cce6b9479560ce0c65ad18d54393f96 Mon Sep 17 00:00:00 2001
-From: Cory Benfield <lukasaoz@gmail.com>
-Date: Mon, 14 Dec 2015 15:37:46 +0000
-Subject: [PATCH] Comment lingering SSLv2 symbol.
-
----
- src/_cffi_src/openssl/ssl.py | 4 ++++
- 1 file changed, 4 insertions(+)
-
-Index: cryptography-1.1/src/_cffi_src/openssl/ssl.py
-===================================================================
---- cryptography-1.1.orig/src/_cffi_src/openssl/ssl.py
-+++ cryptography-1.1/src/_cffi_src/openssl/ssl.py
-@@ -421,6 +421,10 @@ const long SSL_OP_LEGACY_SERVER_CONNECT
- static const long Cryptography_HAS_SECURE_RENEGOTIATION = 1;
- #endif
- 
-+/* Cryptography now compiles out all SSLv2 bindings. This exists to allow
-+ * clients that use it to check for SSLv2 support to keep functioning as
-+ * expected.
-+ */
- static const long Cryptography_HAS_SSL2 = 0;
- 
- #ifdef OPENSSL_NO_SSL3_METHOD
diff --git a/meta-python/recipes-devtools/python/python-cryptography/Remove_SSLv2_bindings.patch b/meta-python/recipes-devtools/python/python-cryptography/Remove_SSLv2_bindings.patch
deleted file mode 100644
index 8522325..0000000
--- a/meta-python/recipes-devtools/python/python-cryptography/Remove_SSLv2_bindings.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 90c6a53a885dd5c66992309e0af98ac554f1bb97 Mon Sep 17 00:00:00 2001
-From: Cory Benfield <lukasaoz@gmail.com>
-Date: Mon, 14 Dec 2015 08:35:20 +0000
-Subject: [PATCH] Remove SSLv2 bindings.
-
-This commit removes bindings that allow users to set SSLv2 handshake
-methods. These are regarded as unnecessary and out-of-date: see #2527.
-This commit does leave in a few options that refer to SSLv2 in order to
-avoid breaking deployments that rely on them, and in order to allow
-users to continue to request that SSLv2 not be enabled at all in their
-OpenSSL.
-
-Upstream-Status: Backport
-
-This fixes the compile issue after updating to openssl 1.0.2h
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- src/_cffi_src/openssl/ssl.py                            | 17 +----------------
- .../hazmat/bindings/openssl/_conditional.py             |  6 ------
- 2 files changed, 1 insertion(+), 22 deletions(-)
-
-Index: cryptography-1.1/src/_cffi_src/openssl/ssl.py
-===================================================================
---- cryptography-1.1.orig/src/_cffi_src/openssl/ssl.py
-+++ cryptography-1.1/src/_cffi_src/openssl/ssl.py
-@@ -292,15 +292,6 @@ unsigned long SSL_CTX_add_extra_chain_ce
- 
- /*  methods */
- 
--/* SSLv2 support is compiled out of some versions of OpenSSL.  These will
-- * get special support when we generate the bindings so that if they are
-- * available they will be wrapped, but if they are not they won't cause
-- * problems (like link errors).
-- */
--const SSL_METHOD *SSLv2_method(void);
--const SSL_METHOD *SSLv2_server_method(void);
--const SSL_METHOD *SSLv2_client_method(void);
--
- /*
-  * TLSv1_1 and TLSv1_2 are recent additions.  Only sufficiently new versions of
-  * OpenSSL support them.
-@@ -429,14 +420,8 @@ const long SSL_OP_LEGACY_SERVER_CONNECT
- #else
- static const long Cryptography_HAS_SECURE_RENEGOTIATION = 1;
- #endif
--#ifdef OPENSSL_NO_SSL2
-+
- static const long Cryptography_HAS_SSL2 = 0;
--SSL_METHOD* (*SSLv2_method)(void) = NULL;
--SSL_METHOD* (*SSLv2_client_method)(void) = NULL;
--SSL_METHOD* (*SSLv2_server_method)(void) = NULL;
--#else
--static const long Cryptography_HAS_SSL2 = 1;
--#endif
- 
- #ifdef OPENSSL_NO_SSL3_METHOD
- static const long Cryptography_HAS_SSL3_METHOD = 0;
-Index: cryptography-1.1/src/cryptography/hazmat/bindings/openssl/_conditional.py
-===================================================================
---- cryptography-1.1.orig/src/cryptography/hazmat/bindings/openssl/_conditional.py
-+++ cryptography-1.1/src/cryptography/hazmat/bindings/openssl/_conditional.py
-@@ -274,12 +274,6 @@ CONDITIONAL_NAMES = {
-         "TLSv1_2_client_method",
-     ],
- 
--    "Cryptography_HAS_SSL2": [
--        "SSLv2_method",
--        "SSLv2_client_method",
--        "SSLv2_server_method",
--    ],
--
-     "Cryptography_HAS_SSL3_METHOD": [
-         "SSLv3_method",
-         "SSLv3_client_method",
diff --git a/meta-python/recipes-devtools/python/python-cryptography/build_fix_openssl_1.0.1g.patch b/meta-python/recipes-devtools/python/python-cryptography/build_fix_openssl_1.0.1g.patch
deleted file mode 100644
index d08994f..0000000
--- a/meta-python/recipes-devtools/python/python-cryptography/build_fix_openssl_1.0.1g.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-build issue do to openssl 1.0.1g upgrade
-
-BIO *BIO_new_mem_buf(void *, int);
-      ^
-In file included from /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/include/openssl/asn1.h:65:0,
-from build/temp.linux-x86_64-2.7/_openssl.c:413:
-
-
-Upstream-Status: Pending
-
-seems to be a known issue
-https://github.com/pyca/cryptography/issues/2750
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
-Index: src/_cffi_src/openssl/bio.py
-===================================================================
---- a/src/_cffi_src/openssl/bio.py
-+++ b/src/_cffi_src/openssl/bio.py
-@@ -99,7 +99,7 @@ BIO *BIO_pop(BIO *);
- BIO *BIO_next(BIO *);
- BIO *BIO_find_type(BIO *, int);
- BIO_METHOD *BIO_s_mem(void);
--BIO *BIO_new_mem_buf(void *, int);
-+BIO *BIO_new_mem_buf(const void *, int);
- BIO_METHOD *BIO_s_file(void);
- BIO *BIO_new_file(const char *, const char *);
- BIO *BIO_new_fp(FILE *, int);
diff --git a/meta-python/recipes-devtools/python/python-cryptography_1.1.bb b/meta-python/recipes-devtools/python/python-cryptography_1.4.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python-cryptography_1.1.bb
rename to meta-python/recipes-devtools/python/python-cryptography_1.4.bb
index 665a4cb..a6b5bd0 100644
--- a/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
+++ b/meta-python/recipes-devtools/python/python-cryptography_1.4.bb
@@ -4,13 +4,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
 DEPENDS += " python-cffi-native python-cffi python-enum34 python-six python-pyasn1"
 SRCNAME = "cryptography"
 
-SRC_URI = "file://run-ptest \
-           file://build_fix_openssl_1.0.1g.patch \
-           file://Remove_SSLv2_bindings.patch \
-           file://Comment_lingering_SSLv2_symbol.patch"
+SRC_URI = "file://run-ptest"
 
-SRC_URI[md5sum] = "dd06da41535184f48f2c8e8b74dd570f"
-SRC_URI[sha256sum] = "059bc6428b1d0e2317f505698602642f1d8dda5b120ec573a59a430d8cb7a32d"
+SRC_URI[md5sum] = "a9763e3831cc7cdb402c028fac1ceb39"
+SRC_URI[sha256sum] = "bb149540ed90c4b2171bf694fe6991d6331bc149ae623c8ff419324f4222d128"
 
 inherit pypi setuptools
 
-- 
1.9.1


