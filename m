Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 25372605FE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2016 20:39:29 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y7so13898040pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2016 13:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XSb/l2W+t9nPjQCU+8I4kiqQp7azlEIBwe8ZyJdJu8U=;
	b=c7Q30dwOjUNdEHayO2Fqt3eePfAxQz0DEiku6Wy0mmwjLFOEOavByzUOV1fiZwEByG
	kv3CTxRL6ipu38MtXxGL4bXsZxR5RvijsizEbAJyTX8xr7kHm4bUVknGL+KH/zEFmkdJ
	RZqMKOecvm1KJbvhGoZ069xHQQ8aifAn80H5FMC7a2reIXzbV9KkWwDhgn+A4ljqtctL
	FRsbJH4eVws9D9tES6XnT/cRxqDKgv+VUnMHA+Hyz+wxnG/L8HgEriwbTJ4FPkFAi9Cy
	zX022VLxi3rvA6F2dtc5zwTaIMPdKNXes80ZG37OpRl6k4JRmnWdLIhuPlJRFLqxNrYA
	63rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XSb/l2W+t9nPjQCU+8I4kiqQp7azlEIBwe8ZyJdJu8U=;
	b=U30BzTnUvqTvbdAT/XbzaFPQjfaMHRrI3U+SMPWLPavEGhs4b6IAnqkEQRK6e8kCFy
	GZMYKTFm2H6hskmFvw9E7tB0Q+sW02ji+2KMRho+sHN2fhJC7M8hOTurkfaKQUrA3RyI
	fTrzqWmJOskKQoQpQTNJm37eYmyrOZfaBLBsigJacLwNUO4qczEAk2TRb22GLjZQP+Dp
	chsAilb5gVPrWv76IGRFGKygzwIZ+jsil4balHYI4P7PeQjRVLH6Y1Fhirv4zrFn3v+/
	9JXZ6bpx5tkRIKL7FZcJMCI0fwUNMpbVt35wpqY/hXOMI4UBhLMaHzaxjhykZv7GjYZW
	4jUg==
X-Gm-Message-State: AOPr4FXu884iGtWGCfw7Rmze/LH0JNmE7Nobg/V0srNbnRpUdzjhRn3Eq+CZOd5+0827FA==
X-Received: by 10.98.0.9 with SMTP id 9mr39458140pfa.19.1463344769895;
	Sun, 15 May 2016 13:39:29 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	d6sm42170650pfj.75.2016.05.15.13.39.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 15 May 2016 13:39:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 May 2016 13:39:26 -0700
Message-Id: <1463344766-1554-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-python][master][krogoth][PATCH] python-cryptography: fix compile issue with openssl 1.0.2h
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
X-List-Received-Date: Sun, 15 May 2016 20:39:31 -0000

From: Armin Kuster <akuster@mvista.com>

this fixes:

error: 'SSLv2_method' redeclared as different kind of symbol
|  SSL_METHOD* (*SSLv2_method)(void) = NULL;

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../Comment_lingering_SSLv2_symbol.patch           | 24 +++++++
 .../Remove_SSLv2_bindings.patch                    | 75 ++++++++++++++++++++++
 .../python/python-cryptography_1.1.bb              |  4 +-
 3 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python-cryptography/Comment_lingering_SSLv2_symbol.patch
 create mode 100644 meta-python/recipes-devtools/python/python-cryptography/Remove_SSLv2_bindings.patch

diff --git a/meta-python/recipes-devtools/python/python-cryptography/Comment_lingering_SSLv2_symbol.patch b/meta-python/recipes-devtools/python/python-cryptography/Comment_lingering_SSLv2_symbol.patch
new file mode 100644
index 0000000..b28e7ef
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-cryptography/Comment_lingering_SSLv2_symbol.patch
@@ -0,0 +1,24 @@
+From f326e4a97cce6b9479560ce0c65ad18d54393f96 Mon Sep 17 00:00:00 2001
+From: Cory Benfield <lukasaoz@gmail.com>
+Date: Mon, 14 Dec 2015 15:37:46 +0000
+Subject: [PATCH] Comment lingering SSLv2 symbol.
+
+---
+ src/_cffi_src/openssl/ssl.py | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+Index: cryptography-1.1/src/_cffi_src/openssl/ssl.py
+===================================================================
+--- cryptography-1.1.orig/src/_cffi_src/openssl/ssl.py
++++ cryptography-1.1/src/_cffi_src/openssl/ssl.py
+@@ -421,6 +421,10 @@ const long SSL_OP_LEGACY_SERVER_CONNECT
+ static const long Cryptography_HAS_SECURE_RENEGOTIATION = 1;
+ #endif
+ 
++/* Cryptography now compiles out all SSLv2 bindings. This exists to allow
++ * clients that use it to check for SSLv2 support to keep functioning as
++ * expected.
++ */
+ static const long Cryptography_HAS_SSL2 = 0;
+ 
+ #ifdef OPENSSL_NO_SSL3_METHOD
diff --git a/meta-python/recipes-devtools/python/python-cryptography/Remove_SSLv2_bindings.patch b/meta-python/recipes-devtools/python/python-cryptography/Remove_SSLv2_bindings.patch
new file mode 100644
index 0000000..8522325
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-cryptography/Remove_SSLv2_bindings.patch
@@ -0,0 +1,75 @@
+From 90c6a53a885dd5c66992309e0af98ac554f1bb97 Mon Sep 17 00:00:00 2001
+From: Cory Benfield <lukasaoz@gmail.com>
+Date: Mon, 14 Dec 2015 08:35:20 +0000
+Subject: [PATCH] Remove SSLv2 bindings.
+
+This commit removes bindings that allow users to set SSLv2 handshake
+methods. These are regarded as unnecessary and out-of-date: see #2527.
+This commit does leave in a few options that refer to SSLv2 in order to
+avoid breaking deployments that rely on them, and in order to allow
+users to continue to request that SSLv2 not be enabled at all in their
+OpenSSL.
+
+Upstream-Status: Backport
+
+This fixes the compile issue after updating to openssl 1.0.2h
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/_cffi_src/openssl/ssl.py                            | 17 +----------------
+ .../hazmat/bindings/openssl/_conditional.py             |  6 ------
+ 2 files changed, 1 insertion(+), 22 deletions(-)
+
+Index: cryptography-1.1/src/_cffi_src/openssl/ssl.py
+===================================================================
+--- cryptography-1.1.orig/src/_cffi_src/openssl/ssl.py
++++ cryptography-1.1/src/_cffi_src/openssl/ssl.py
+@@ -292,15 +292,6 @@ unsigned long SSL_CTX_add_extra_chain_ce
+ 
+ /*  methods */
+ 
+-/* SSLv2 support is compiled out of some versions of OpenSSL.  These will
+- * get special support when we generate the bindings so that if they are
+- * available they will be wrapped, but if they are not they won't cause
+- * problems (like link errors).
+- */
+-const SSL_METHOD *SSLv2_method(void);
+-const SSL_METHOD *SSLv2_server_method(void);
+-const SSL_METHOD *SSLv2_client_method(void);
+-
+ /*
+  * TLSv1_1 and TLSv1_2 are recent additions.  Only sufficiently new versions of
+  * OpenSSL support them.
+@@ -429,14 +420,8 @@ const long SSL_OP_LEGACY_SERVER_CONNECT
+ #else
+ static const long Cryptography_HAS_SECURE_RENEGOTIATION = 1;
+ #endif
+-#ifdef OPENSSL_NO_SSL2
++
+ static const long Cryptography_HAS_SSL2 = 0;
+-SSL_METHOD* (*SSLv2_method)(void) = NULL;
+-SSL_METHOD* (*SSLv2_client_method)(void) = NULL;
+-SSL_METHOD* (*SSLv2_server_method)(void) = NULL;
+-#else
+-static const long Cryptography_HAS_SSL2 = 1;
+-#endif
+ 
+ #ifdef OPENSSL_NO_SSL3_METHOD
+ static const long Cryptography_HAS_SSL3_METHOD = 0;
+Index: cryptography-1.1/src/cryptography/hazmat/bindings/openssl/_conditional.py
+===================================================================
+--- cryptography-1.1.orig/src/cryptography/hazmat/bindings/openssl/_conditional.py
++++ cryptography-1.1/src/cryptography/hazmat/bindings/openssl/_conditional.py
+@@ -274,12 +274,6 @@ CONDITIONAL_NAMES = {
+         "TLSv1_2_client_method",
+     ],
+ 
+-    "Cryptography_HAS_SSL2": [
+-        "SSLv2_method",
+-        "SSLv2_client_method",
+-        "SSLv2_server_method",
+-    ],
+-
+     "Cryptography_HAS_SSL3_METHOD": [
+         "SSLv3_method",
+         "SSLv3_client_method",
diff --git a/meta-python/recipes-devtools/python/python-cryptography_1.1.bb b/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
index c501787..665a4cb 100644
--- a/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
+++ b/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
@@ -5,7 +5,9 @@ DEPENDS += " python-cffi-native python-cffi python-enum34 python-six python-pyas
 SRCNAME = "cryptography"
 
 SRC_URI = "file://run-ptest \
-           file://build_fix_openssl_1.0.1g.patch"
+           file://build_fix_openssl_1.0.1g.patch \
+           file://Remove_SSLv2_bindings.patch \
+           file://Comment_lingering_SSLv2_symbol.patch"
 
 SRC_URI[md5sum] = "dd06da41535184f48f2c8e8b74dd570f"
 SRC_URI[sha256sum] = "059bc6428b1d0e2317f505698602642f1d8dda5b120ec573a59a430d8cb7a32d"
-- 
2.3.5


