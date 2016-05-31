Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 37E64771BE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2016 14:08:39 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id fg1so24998938pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2016 07:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BLlqRupXbzmTHwDUTkgLo+m6FV5wxx0N9EoSP8zaJ64=;
	b=wc4e4pYK3eAdXRo+Y5AKlYo3fptfEMZ1vn3N3SBK5zWZBUOHIitEnkCwCfuAVppP3V
	KpIPGghlMbijmZ2m+hp9D+8UhCIup+2RTlL4EhfsGBD4gBEt7a0BThR8c8eIH73K03ov
	mL/guvD/X5LDsnMwoIvsko/nFBturmSUOfy0rkm8brKi13QHTujiVIFm44nCsGaz4Z6f
	KeINCQYXE/Z9IVxk4X+FvfYjMFArwEQbf+Whrkj7MYGQ4Phot5Nb8MlLMiyEnftYq70L
	HJ0JFu6rZ71JCGGUnhu6hMroD1LjDboQEuXi/IEn3a5FnaJzSl4TKzJPOTJ0HV2tsXz2
	Sjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BLlqRupXbzmTHwDUTkgLo+m6FV5wxx0N9EoSP8zaJ64=;
	b=WSxNyiO7YVdzOlJn0nQJRE8YxNKeY52TTJZnvRNRWU89aovhCJfm+rIUkcO3NmPbLr
	mMOH0eziIjsZhYOmNW6etQQ7SwbxpABgNPw277YnPG71nZNCH9rsUpnAgWwyt/4cZp9g
	haG54HT96XicvzgeiIp0fYWZU4MxYRNaEKZyTVRYitm3OrQ/6Z0Ej5StbunuJTemhF2v
	NhW1G6YiTj6wIott7oVmc6dKC3Nj6hHZ0AP1C0fdXQ7xZpSRCNynTQKlLR7XYVbf/KWF
	a72YGa73SaRTXvO3yZ2dv/vBLblvDidn0X3/ErluCyXerNK6iOgNwnpWWURwNGtcqLP2
	duLQ==
X-Gm-Message-State: ALyK8tJrALMsTyXT/kFwijKSdNJRA+N+HLOiSvRdu9HnFWziiqsJ8y9b2kwHB3JzUDOAPA==
X-Received: by 10.66.242.3 with SMTP id wm3mr55763508pac.81.1464703720628;
	Tue, 31 May 2016 07:08:40 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	ap3sm17071677pad.33.2016.05.31.07.08.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 May 2016 07:08:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 May 2016 07:08:26 -0700
Message-Id: <1464703706-28401-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1464703706-28401-1-git-send-email-akuster808@gmail.com>
References: <1464703706-28401-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-python][jethro][PATCH 2/2] python-cryptography: fix compile issue with openssl 1.0.2h
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
X-List-Received-Date: Tue, 31 May 2016 14:08:40 -0000

From: Armin Kuster <akuster@mvista.com>

this fixes:

error: 'SSLv2_method' redeclared as different kind of symbol
|  SSL_METHOD* (*SSLv2_method)(void) = NULL;

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../Comment_lingering_SSLv2_symbol.patch           | 25 ++++++++
 .../Remove_SSLv2_bindings.patch                    | 70 ++++++++++++++++++++++
 .../python/python-cryptography_0.8.1.bb            |  2 +
 3 files changed, 97 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-cryptography/Comment_lingering_SSLv2_symbol.patch
 create mode 100644 meta-python/recipes-devtools/python/python-cryptography/Remove_SSLv2_bindings.patch

diff --git a/meta-python/recipes-devtools/python/python-cryptography/Comment_lingering_SSLv2_symbol.patch b/meta-python/recipes-devtools/python/python-cryptography/Comment_lingering_SSLv2_symbol.patch
new file mode 100644
index 0000000..c8dbee2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-cryptography/Comment_lingering_SSLv2_symbol.patch
@@ -0,0 +1,25 @@
+From f326e4a97cce6b9479560ce0c65ad18d54393f96 Mon Sep 17 00:00:00 2001
+From: Cory Benfield <lukasaoz@gmail.com>
+Date: Mon, 14 Dec 2015 15:37:46 +0000
+Subject: [PATCH] Comment lingering SSLv2 symbol.
+
+---
+ src/_cffi_src/openssl/ssl.py | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+Index: cryptography-0.8.1/src/cryptography/hazmat/bindings/openssl/ssl.py
+===================================================================
+--- cryptography-0.8.1.orig/src/cryptography/hazmat/bindings/openssl/ssl.py
++++ cryptography-0.8.1/src/cryptography/hazmat/bindings/openssl/ssl.py
+@@ -372,6 +372,11 @@ const long SSL_OP_LEGACY_SERVER_CONNECT
+ #else
+ static const long Cryptography_HAS_SECURE_RENEGOTIATION = 1;
+ #endif
++
++/* Cryptography now compiles out all SSLv2 bindings. This exists to allow
++ * clients that use it to check for SSLv2 support to keep functioning as
++ * expected.
++ */
+ static const long Cryptography_HAS_SSL2 = 0;
+ 
+ #ifdef OPENSSL_NO_SSL3_METHOD
diff --git a/meta-python/recipes-devtools/python/python-cryptography/Remove_SSLv2_bindings.patch b/meta-python/recipes-devtools/python/python-cryptography/Remove_SSLv2_bindings.patch
new file mode 100644
index 0000000..f0c9abc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-cryptography/Remove_SSLv2_bindings.patch
@@ -0,0 +1,70 @@
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
+This fixes the compile issue after updating to openssl 1.0.2h. refactored to apply to jethro.
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/_cffi_src/openssl/ssl.py                            | 17 +----------------
+ .../hazmat/bindings/openssl/_conditional.py             |  6 ------
+ 2 files changed, 1 insertion(+), 22 deletions(-)
+
+Index: cryptography-0.8.1/src/cryptography/hazmat/bindings/openssl/ssl.py
+===================================================================
+--- cryptography-0.8.1.orig/src/cryptography/hazmat/bindings/openssl/ssl.py
++++ cryptography-0.8.1/src/cryptography/hazmat/bindings/openssl/ssl.py
+@@ -262,15 +262,6 @@ unsigned long SSL_CTX_add_extra_chain_ce
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
+@@ -381,14 +372,7 @@ const long SSL_OP_LEGACY_SERVER_CONNECT
+ #else
+ static const long Cryptography_HAS_SECURE_RENEGOTIATION = 1;
+ #endif
+-#ifdef OPENSSL_NO_SSL2
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
+@@ -574,12 +558,6 @@ CONDITIONAL_NAMES = {
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
diff --git a/meta-python/recipes-devtools/python/python-cryptography_0.8.1.bb b/meta-python/recipes-devtools/python/python-cryptography_0.8.1.bb
index cd10118..86bf0dc 100644
--- a/meta-python/recipes-devtools/python/python-cryptography_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python-cryptography_0.8.1.bb
@@ -8,6 +8,8 @@ SRCNAME = "cryptography"
 SRC_URI = "https://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
            file://run-ptest \
            file://build_fix_openssl_1.0.1g.patch \
+           file://Remove_SSLv2_bindings.patch \
+           file://Comment_lingering_SSLv2_symbol.patch \
 "
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.3.5


