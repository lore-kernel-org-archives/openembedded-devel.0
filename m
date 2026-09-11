Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A35C88E5A
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:18:06 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40465.1789136285265351429
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 07:18:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ltN3yCO6;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso9119785ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 07:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789136285; x=1789741085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P1Xgezra4e2VnmRHA2cPcvWmdNpvCf43rZjU9Ev/7Us=;
        b=ltN3yCO6HEK03F89Qhbn/BvzHeZv5lXWDULlkCMxuwtNMvvRE8gLFaoMqGFzYdUdbJ
         /sal6J41OKefKvUISxqsclptvA7ALp9g4V21n+wM/yox9c5PVDSeofeHlLViYHtNdmXb
         maN9oofX36R9xcHjZhgKZdScCne5nNARXxVTnVJJnXVWeop7dGtuVQWi55e1VujTcL3A
         TIIpEB4epIDkkCTgL55HwqVkSNPY2eHbBtx74mMM2l+K7aiRQwx8kEiaNNCkS/G2jZEN
         e6uitJbexmoGPMzQhWrbaoJqW8ru8B2cBIrpgSMJvU0OU1aYpzB2Orerj6GgXfxYBDuT
         7cqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136285; x=1789741085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P1Xgezra4e2VnmRHA2cPcvWmdNpvCf43rZjU9Ev/7Us=;
        b=KXE53CYoTgGt3QtTvgJ0b9G2tWF/k4m63kWXWEVU6wd5jEtgpm4O0mOwWK0p7LVssf
         Sc8JIptJt/V/uNIZBNa8FAU6FO2tTr849V7wkeblsTyLMcJKP2vtUvbk5FRgG9X5CVMD
         vvINBmIOg/gqTzIhemkS7T3OgjpVwV7te7piveDxBYihwrQh6I7+4hiCiOOQV9Dm/Qwx
         ORz4rOlBVjHs5J0fIDkEF7iSOMlS7xeZibiaOPzi5yfDHx8uxZUUw/EGS2SBUBc3XU6W
         er+lchSYBiaOsm6I7s9a+DSdHVkQ6nEZAQYWm1QI3sDdpvs+RKnXZlLP1m8ErsNmi3pm
         DohA==
X-Gm-Message-State: AFuF++lKaDSzVTiVxoWzr01srbBODcxfRUhz+4S5NpAgExHouNx0ZbZL
	77Ax15CmKf++1EOKfT/C6iKayNwSL2EMMDOchhTJeDj9Hn/cokrWNZCjFrW06A==
X-Gm-Gg: AYBFou2l6sHFeHM/J9NngBHWHUraL85fZBPcTbeXOzbR+nt/lOLVS3Yp79m7bUTo7kz
	fAmqUw2celbL4GS7IYTSibfuZpD7ugj8MJQvotRUJ5zsdmzWNcAaRI6nn0se9pst9Gzi6Ug/HLC
	tjjIKY9IdOpQN6zUtb5+9KOYIEABQz3o0xd1whNVfC5amTvbJrcdHKjdBBBjqKVfG5ORScArLRY
	MJijlcDWft0HuFqy1hPGBEETuL/qiBxjZmAoxsfd7lMFqJuuVThLFQGmbnmApiGJRyE/qje4+v2
	g8ru5NGcFG6qyG5xLmiop4maCvzi43+mX5DLjDbMD7I/xkHjbdMTf93eO1m2PdRP1TlFd/Mdy6S
	MLZ/IFbTHy3hPRR7w5+zygt8zMrqw7WmzoSRdY8NQ7nny6n8FdVbHFGnvD6aHvEZOyzO2+aq7qz
	3mtrEACt7D/Fwz3ZMvKuqbkZntsntri+y5PgIFQOZyxh43og+eLZ8V5j9j5YaKqnH/GutCasj6Z
	qzMEdosgAseyMmVVeTLgv49BvmYaTUd45VSOqW7WKJ42++bWBxiLKmUHNpI04cDOetdOc402ope
	r0EdU16VAT+wJ5EdQysNRv3fKf73JfsuR0/5F+fmeWTg5M4ynFCiAgUaICXz3Nzs9caoE4neeiu
	fhwdXL2plB0USb5J6kztIeywYpU+1xDKMqYYxUIjzTbiF+dRax47suHaVfQ==
X-Received: by 2002:a17:903:acd:b0:2da:e967:7953 with SMTP id d9443c01a7336-2dd2a336839mr84225175ad.12.1789136284286;
        Fri, 11 Sep 2026 07:18:04 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50efsm7840791eec.28.2026.09.11.07.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:18:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/7] extract-cert: fix build with OpenSSL 4
Date: Fri, 11 Sep 2026 07:17:54 -0700
Message-ID: <20260911141756.2275517-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911141756.2275517-1-khem.raj@oss.qualcomm.com>
References: <20260911141756.2275517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 14:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129969

OpenSSL 4.0 removed the ENGINE API. <openssl/engine.h> still exists as a
source-compatibility stub, so both binaries fail to link:

  ld.lld: error: undefined symbol: ENGINE_load_builtin_engines
  ld.lld: error: undefined symbol: ENGINE_by_id
  ld.lld: error: undefined symbol: ENGINE_init
  ld.lld: error: undefined symbol: ENGINE_ctrl_cmd_string
  ld.lld: error: undefined symbol: ENGINE_load_public_key

The ENGINE use is confined to the "pkcs11:" input branch of each tool, so
compile that branch out on OpenSSL 4 and diagnose the unsupported input
instead. Reading certificates and public keys from PEM files, which is
what the kernel build and most other users do, is unaffected.

Providers supersede engines, but none exposes an equivalent of the pkcs11
engine's LOAD_CERT_CTRL command, so there is nothing to port to yet.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ot-use-the-ENGINE-API-with-OpenSSL-4.patch | 99 +++++++++++++++++++
 .../extract-cert/extract-cert_0.3.bb          |  4 +-
 2 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/extract-cert/extract-cert/0001-Do-not-use-the-ENGINE-API-with-OpenSSL-4.patch

diff --git a/meta-oe/recipes-devtools/extract-cert/extract-cert/0001-Do-not-use-the-ENGINE-API-with-OpenSSL-4.patch b/meta-oe/recipes-devtools/extract-cert/extract-cert/0001-Do-not-use-the-ENGINE-API-with-OpenSSL-4.patch
new file mode 100644
index 0000000000..97ed51af5b
--- /dev/null
+++ b/meta-oe/recipes-devtools/extract-cert/extract-cert/0001-Do-not-use-the-ENGINE-API-with-OpenSSL-4.patch
@@ -0,0 +1,99 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 3 Sep 2026 01:30:00 +0000
+Subject: [PATCH] Do not use the ENGINE API with OpenSSL 4
+
+OpenSSL 4.0 removed the ENGINE API.  <openssl/engine.h> still exists, but
+only as a source-compatibility stub, so both binaries now fail to link:
+
+  ld.lld: error: undefined symbol: ENGINE_load_builtin_engines
+  ld.lld: error: undefined symbol: ENGINE_by_id
+  ld.lld: error: undefined symbol: ENGINE_init
+  ld.lld: error: undefined symbol: ENGINE_ctrl_cmd_string
+  ld.lld: error: undefined symbol: ENGINE_load_public_key
+
+The ENGINE use is confined to the "pkcs11:" input branch of each tool, so
+compile that branch out on OpenSSL 4 and diagnose the unsupported input
+instead.  Reading certificates and public keys from PEM files - which is
+what the kernel build and most other users actually do - is unaffected.
+
+Providers supersede engines, but no provider exposes an equivalent of the
+pkcs11 engine's LOAD_CERT_CTRL command, so there is nothing to port to
+yet; pkcs11-provider based support would be a separate feature.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+--- a/extract-cert.c
++++ b/extract-cert.c
+@@ -21,7 +21,9 @@
+ #include <openssl/bio.h>
+ #include <openssl/pem.h>
+ #include <openssl/err.h>
++#if OPENSSL_VERSION_MAJOR < 4
+ #include <openssl/engine.h>
++#endif
+ 
+ #define PKEY_ID_PKCS7 2
+ 
+@@ -112,6 +114,16 @@
+ 		fclose(f);
+ 		exit(0);
+ 	} else if (!strncmp(cert_src, "pkcs11:", 7)) {
++#if OPENSSL_VERSION_MAJOR >= 4
++		/*
++		 * OpenSSL 4.0 removed the ENGINE API, and with it the pkcs11
++		 * engine that was used here to pull an object off a token.  No
++		 * provider based replacement for the engine's LOAD_CERT_CTRL
++		 * command exists, so fail loudly rather than quietly emitting
++		 * nothing.
++		 */
++		ERR(1, "PKCS#11 URIs require OpenSSL < 4.0 (ENGINE API removed)");
++#else
+ 		ENGINE *e;
+ 		struct {
+ 			const char *cert_id;
+@@ -134,6 +146,7 @@
+ 		ENGINE_ctrl_cmd(e, "LOAD_CERT_CTRL", 0, &parms, NULL, 1);
+ 		ERR(!parms.cert, "Get X.509 from PKCS#11");
+ 		write_cert(parms.cert);
++#endif
+ 	} else {
+ 		BIO *b;
+ 		X509 *x509;
+--- a/spki-hash.c
++++ b/spki-hash.c
+@@ -23,7 +23,9 @@
+ #include <openssl/bio.h>
+ #include <openssl/pem.h>
+ #include <openssl/err.h>
++#if OPENSSL_VERSION_MAJOR < 4
+ #include <openssl/engine.h>
++#endif
+ 
+ #define PKEY_ID_PKCS7 2
+ 
+@@ -110,6 +112,14 @@
+ 	src = argv[1];
+ 
+ 	if (!strncmp(src, "pkcs11:", 7)) {
++#if OPENSSL_VERSION_MAJOR >= 4
++		/*
++		 * OpenSSL 4.0 removed the ENGINE API, and with it the pkcs11
++		 * engine that was used here to load a public key off a token.
++		 * Fail loudly rather than quietly hashing nothing.
++		 */
++		ERR(1, "PKCS#11 URIs require OpenSSL < 4.0 (ENGINE API removed)");
++#else
+ 		ENGINE *e;
+ 		ENGINE_load_builtin_engines();
+ 		drain_openssl_errors();
+@@ -124,6 +134,7 @@
+ 
+ 		key = ENGINE_load_public_key(e, src, NULL, NULL);
+ 		ERR(!key, "ENGINE_load_public_key");
++#endif
+ 	} else {
+ 		BIO *b;
+ 
diff --git a/meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb b/meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb
index 83e9383d4a..ded919e063 100644
--- a/meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb
+++ b/meta-oe/recipes-devtools/extract-cert/extract-cert_0.3.bb
@@ -4,7 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "openssl"
 
-SRC_URI = "git://git.pengutronix.de/git/extract-cert;protocol=https;branch=master;"
+SRC_URI = "git://git.pengutronix.de/git/extract-cert;protocol=https;branch=master; \
+           file://0001-Do-not-use-the-ENGINE-API-with-OpenSSL-4.patch \
+           "
 SRCREV = "d652b4e8279aef2a85f58676ab472744bafeafc9"
 
 

