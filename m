Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3844.1794729084244864087
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=CykL6dZ9;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so3168515eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729084; x=1795333884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWp+KZT6nHz90CHpjftbquedAY0gUMeIKpKz734mMq8=;
        b=CykL6dZ95WIjmcPcvmgSl6GSb0ZWhdTJPtIVQFeg1YacV0IDlavSF1O6Pdd16Gy5gp
         s82bm8Qu7KsUmAbGx+NqqAX/X+h2iKOwZnszgsJKL6jg/Kg5ZbOJN3vW77vWekrUYIb8
         z6E6y3ecSbBdp4q4LaRoYBiIG6U6fx99We4bXOfgsGCH94UDeHlKRt5O42QkgNGcKfvK
         xS6qbRyXcnCqyjsVJRQG+J8sDh5S6JpnbigzHsTkh8PGZXjizKTIfG2a/skB7WJOJWzo
         mqZREGlC4LEcIWBB5gngavTuDObum2qqsxBInfdAed2wL4Avv+K/QSqZhYhi2+pODIxs
         pgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729084; x=1795333884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GWp+KZT6nHz90CHpjftbquedAY0gUMeIKpKz734mMq8=;
        b=f4/4xQibbLQW6r+f73jZUxrmLwq/pKypqRcfmdg/jpYVSxJldqvxWQmTGTUoEBHyOv
         g5YIjax8ykxlUAnWq+p4cNsSc0OexsWtpO0Gj2Xyhhv4w4Io4KmwNSXmdl1usiinmfmQ
         nsj/B/+ZmUuQaXXqx63lVRbh2kqxOrKqzw0KSLLW4h/qEofMYkqOab+2QIrE+6+6c2VM
         q9rFnjMO+NCEB/1yB/ZUAXSeg0CJzvA+/8G79eL7VR3SyiwafW5d2vuTnOvkx5QR5rUB
         n44I7KsQ7wMoazKp4wfX54JrS3rDtaYgYW4VC/JhrneuXirWv/orrpnTIfg4SPSDuenW
         RlYw==
X-Gm-Message-State: APuU4Z+DtbwazmDpOLtOdVHkuQ8Bqv5CI4+9jldNjyvQYW5Dvx82AJCO
	4DM4iuZMIAA6/fq3uMSKDhkqzeVzYFqeASjVM7zn2N2wyoNr9hHCPTazS4YixWNu
X-Gm-Gg: AYBFou3H5FA+MNx23nHRXOeC1NIGd9JWN2KjAYTarOZpWU9tH6LNt8+mtjUF9HXNMFz
	2/iFZg1NVjjjmH72RF+IMn4QERhQLBtO6O3mZGjJ77R+Ek3tiLT+fy9EME6TItBTP2V9Kz5dzMX
	DUk9AyJEZpcLZobYnnRQh0NPwr+1bsKkT1oDHfAykPAPyUZRAqsiK8g1iOgLmFLqHDpXh8MKQ+5
	R2DVV8W4jYkqNzGLaoMnz4qT82fgelr2KacLwJpDfEuPg/LB4iz/ZwKNeEf3QIZu9aqJv4h4g1c
	9yseYe7g3PmQBCz3KUGwIljNVgOV/DSZcyB2ifnipiqGc235WrG1RdNMveDWIaR+wB8QJVJB/H9
	bE7oRO5MRVPx+/shBYZIlWNo/7yPGCUsMvaWn9zZB8BS2I0zJPlToKpRLxuqhSspz9sv2tffMQ2
	mD9XiIzQhbx4FZWH2rcnW1oPryS0/lKv5AO84bYtvju5s8zZEQ1SyiblxVV63nu72LHM7FzTgH4
	Gz0rTh33l7N/rURf2zCcVXXVP3Ep55x24LM3tHd1tBj8kwI731x4y4HLjxj0nWaS9BDWJZ+B3qW
	1pRg2/eNsZVWmgzKCQ5wycTO77CQW+0pnqMdAXMa3aJtVdQIHpFAbmZQDMfc5R9MlurgaoBcKH3
	0hy0BCnbO7tOpnuW0u7VuI0/z2RXcsJPw0QnYjvy+a+CILKnmRIe4zYOiNd7DQyB8+nmqTK92Kt
	9q5ENRJB2sYw13KUcjWQpqJlJFRBomLsbpSRyE3ciwllhDP17fwzbzzvxm8QjSrJ9LkOZENhHCK
	Orn/1eF9KokH2j3d9Mq3tDrxeJZhyQT0yYQMusqPeDIIA+ZVF+M443BzdyDvvISNfRX0HnX4unX
	BMhhzhErsN0NQlazt0cFkrC39A==
X-Received: by 2002:a05:7301:da09:b0:36a:1434:c691 with SMTP id 5a478bee46e88-37967506836mr7441128eec.14.1794729083480;
        Sat, 14 Nov 2026 23:51:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 75/96] xmlsec1: upgrade 1.3.12 -> 1.3.13
Date: Sat, 14 Nov 2026 23:48:53 -0800
Message-ID: <20261115074918.2932593-75-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132345
Content-Type: text/plain; charset="utf-8"

Refresh 0003-xmlsec1-add-new-recipe.patch and drop
0008-unit_tests-guard-xmlDebugDumpDocument-with-LIBXML_DEB.patch, the
unit test no longer calls xmlDebugDumpDocument.

Add a patch to skip the DES key in the new encryption fuzzer when DES
is disabled, which it is by default here. COPYING only changed its
wording.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../xmlsec1/0003-xmlsec1-add-new-recipe.patch | 25 ++++++------
 ...xmlDebugDumpDocument-with-LIBXML_DEB.patch | 26 ------------
 ...kip-the-DES-key-when-DES-is-disabled.patch | 40 +++++++++++++++++++
 .../{xmlsec1_1.3.12.bb => xmlsec1_1.3.13.bb}  |  6 +--
 4 files changed, 56 insertions(+), 41 deletions(-)
 delete mode 100644 meta-oe/recipes-support/xmlsec1/xmlsec1/0008-unit_tests-guard-xmlDebugDumpDocument-with-LIBXML_DEB.patch
 create mode 100644 meta-oe/recipes-support/xmlsec1/xmlsec1/0009-oss-fuzz-enc-Skip-the-DES-key-when-DES-is-disabled.patch
 rename meta-oe/recipes-support/xmlsec1/{xmlsec1_1.3.12.bb => xmlsec1_1.3.13.bb} (90%)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/0003-xmlsec1-add-new-recipe.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0003-xmlsec1-add-new-recipe.patch
index 9a0752dec0..793c655dce 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/0003-xmlsec1-add-new-recipe.patch
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0003-xmlsec1-add-new-recipe.patch
@@ -16,13 +16,16 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 
 Refreshed for xmlsec1 1.3.11 (examples/Makefile rewritten upstream).
 ---
+ examples/Makefile | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
 diff --git a/examples/Makefile b/examples/Makefile
-index dfba58e..f6f4d51 100644
+index fb656d5..3e7c9d3 100644
 --- a/examples/Makefile
 +++ b/examples/Makefile
-@@ -12,6 +12,12 @@ PROGRAMS = \
+@@ -17,6 +17,12 @@ PROGRAMS = \
  	$(PROGRAMS_DEC)
-
+ 
  # try to find pkg-config, if available
 +# OE: allow building from a separate build dir against the cross build tree
 +top_srcdir ?= ..
@@ -30,20 +33,18 @@ index dfba58e..f6f4d51 100644
 +CFLAGS += -I$(top_srcdir)/include
 +LDLIBS += -L$(top_builddir)/src/.libs
 +
- XMLSEC_PKG_CONFIG = "xmlsec1"
+ XMLSEC_PKG_CONFIG = xmlsec1
  PKG_CONFIG := $(shell command -v pkg-config 2> /dev/null)
  XMLSEC_CHECK := $(shell $(PKG_CONFIG) --exists $(XMLSEC_PKG_CONFIG) 2> /dev/null && echo "found")
-@@ -40,6 +46,11 @@ endif
- # rules
- all: $(PROGRAMS)
-
+@@ -56,6 +62,11 @@ all: $(PROGRAMS)
+ %: %.c
+ 	$(CC) $(CFLAGS) -o $@ $< $(LDLIBS)
+ 
 +DESTDIR = /usr/share/xmlsec1
 +install-ptest:
 +	if [ ! -d $(DESTDIR) ]; then mkdir -p $(DESTDIR); fi
 +	cp * $(DESTDIR)
 +
  clean:
- 	rm -rf $(PROGRAMS)
-
---
-2.34.1
+ 	rm -rf $(PROGRAMS) *.o
+ 
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/0008-unit_tests-guard-xmlDebugDumpDocument-with-LIBXML_DEB.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0008-unit_tests-guard-xmlDebugDumpDocument-with-LIBXML_DEB.patch
deleted file mode 100644
index 2f753db12c..0000000000
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/0008-unit_tests-guard-xmlDebugDumpDocument-with-LIBXML_DEB.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 24 Jun 2026 00:00:00 +0000
-Subject: [PATCH] unit_tests: guard xmlDebugDumpDocument with LIBXML_DEBUG_ENABLED
-
-libxml2 2.14 removed the tree-debugging module; in 2.15 LIBXML_DEBUG_ENABLED
-is no longer defined and xmlDebugDumpDocument() is not declared. The transform
-helpers unit test called it unconditionally, which fails to compile with a
-strict compiler (-Werror=implicit-function-declaration). Only emit the debug
-dump when the libxml2 debug module is available.
-
-Upstream-Status: Submitted [https://github.com/lsh123/xmlsec/issues]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
---- a/apps/unit_tests/transform_helpers_unit_tests.c
-+++ b/apps/unit_tests/transform_helpers_unit_tests.c
-@@ -288,7 +288,9 @@
-     nonceContent = xmlNodeGetContent(nonceNode);
-     if((nonceContent == NULL) || (xmlStrcmp(nonceContent, BAD_CAST "000102030405060708090a0b") != 0)) {
-         testLog("Error: ChaCha20-Poly1305 params write serialized unexpected nonce\n");
-+#ifdef LIBXML_DEBUG_ENABLED
-         xmlDebugDumpDocument(stdout, doc);
-+#endif /* LIBXML_DEBUG_ENABLED */
- 
-         xmlFree(nonceContent);
-         xmlFreeDoc(doc);
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/0009-oss-fuzz-enc-Skip-the-DES-key-when-DES-is-disabled.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0009-oss-fuzz-enc-Skip-the-DES-key-when-DES-is-disabled.patch
new file mode 100644
index 0000000000..7be1bc922e
--- /dev/null
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0009-oss-fuzz-enc-Skip-the-DES-key-when-DES-is-disabled.patch
@@ -0,0 +1,40 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 12 Nov 2026 00:00:00 -0800
+Subject: [PATCH] oss-fuzz: enc: Skip the DES key when DES is disabled
+
+The encryption fuzzer refers to xmlSecOpenSSLKeyDataDesId
+unconditionally, so it fails to build with --disable-des:
+
+  oss-fuzz/xmlsec_enc_target.c:108:13: error: use of undeclared identifier 'xmlSecOpenSSLKeyDataDesId'
+
+Guard it with XMLSEC_NO_DES like the rest of the apps.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+--- a/apps/oss-fuzz/xmlsec_enc_target.c
++++ b/apps/oss-fuzz/xmlsec_enc_target.c
+@@ -104,10 +104,20 @@
+     int i;
+ 
+     for (i = 0; i < G_SYM_NKEYS; ++i) {
+-        xmlSecKeyDataId id = g_sym_keys[i].is_des ?
++        xmlSecKeyDataId id;
++        xmlSecKeyPtr key;
++
++#ifndef XMLSEC_NO_DES
++        id = g_sym_keys[i].is_des ?
+             xmlSecOpenSSLKeyDataDesId :
+             xmlSecOpenSSLKeyDataAesId;
+-        xmlSecKeyPtr key = xmlSecKeyReadMemory(id,
++#else /* XMLSEC_NO_DES */
++        if (g_sym_keys[i].is_des) {
++            continue;
++        }
++        id = xmlSecOpenSSLKeyDataAesId;
++#endif /* XMLSEC_NO_DES */
++        key = xmlSecKeyReadMemory(id,
+             (const xmlSecByte*)g_sym_keys[i].material,
+             g_sym_keys[i].size);
+ 
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.12.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.13.bb
similarity index 90%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.12.bb
rename to meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.13.bb
index b46e76a24d..a06ec311b9 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.12.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.13.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://www.aleksey.com/xmlsec/"
 DEPENDS = "libtool libxml2 libxslt zlib"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=352791d62092ea8104f085042de7f4d0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9d595462ce402837a45beefc1ef6c70a"
 
 SECTION = "libs"
 
@@ -18,11 +18,11 @@ SRC_URI = "https://github.com/lsh123/xmlsec/releases/download/${PV}/${BP}.tar.gz
            file://0003-xmlsec1-add-new-recipe.patch \
            file://0005-nss-nspr-fix-for-multilib.patch \
            file://0006-xmlsec1-Fix-configure-QA-error-caused-by-host-lookup.patch \
-           file://0008-unit_tests-guard-xmlDebugDumpDocument-with-LIBXML_DEB.patch \
+           file://0009-oss-fuzz-enc-Skip-the-DES-key-when-DES-is-disabled.patch \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "24045199af12d93fe5fdbbbf7e386e823e4842071e9432e2b90ac108b889a923"
+SRC_URI[sha256sum] = "7e500061eed734c55d74c786998e7562e55b1aaa72a2dff8ce3130b4c5b832d5"
 
 UPSTREAM_CHECK_URI = "https://github.com/lsh123/xmlsec/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
