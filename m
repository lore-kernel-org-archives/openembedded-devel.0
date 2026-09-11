Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8E7C88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:18:16 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40466.1789136286374447069
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 07:18:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kdzPf5wM;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso934497a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 07:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789136286; x=1789741086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1OYmyb4vlal9EO4Vha8rzLkOf6iLujtxN1ZB3zLlKJ4=;
        b=kdzPf5wMlb5fH2ySmfwzQxJbMqSiaUwzjS01AwJWk1kYsHtEHSEPSqOmpRZr6nXJBE
         1HoV+NwzvcdjWAYdm5sYGRWiB+DaMJIkHauxnOCExwgfcfpFcDYtF2zpLxhUskG+J9Ln
         tsLwkgzwZ4xRI14FqZbrZXFDMV6RRPWzoIh7TEvK4QZdTxr+VoHb2oFa4q/7t7Y3b2Ii
         lAUorHZpnoj6HIDo1ljGxhytPaGFoKoxPbMVQqR+7ZZuN7UfJ2WhYWRfjiOtUo/eygmt
         3i9R7Q09QFBB06L4T50RJxNeYIo0aOkltw/boTRMVTevRsz0trx/01rKcNZh6ZZ3E2xl
         v19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136286; x=1789741086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1OYmyb4vlal9EO4Vha8rzLkOf6iLujtxN1ZB3zLlKJ4=;
        b=Mx2LEovDzfN5ztxj2AvMo/4Lplj9hs8w89CgGSPt1tESUDmrGVKgnnPCaD/jhexwf3
         QpFzKcZA+xQNNXwKaNvQxDN+FaNl8OzV/u6CCo3m3Y6o+vNkfl+MF4bpRoz/jWVUAaWd
         7z4SkNtJuM/V29H+Weebh3XQPwVJsjtE7g/dTpBF8+wUiuZwlBjQY6M/GNrtb3DYIWo5
         7sh2qBul5V2dmM1yY++sBePb0NhpUvoUYyUiYShun2CraMuS3j0IOwIfkfUHFIGaUoVM
         xG7uegduun6divQmqru/MRkGC2UakeVs9QklfiuuO0JMzX4NiGFXvqvJGrmqfo/kXcqq
         jypA==
X-Gm-Message-State: AFuF++m5FhrG8FAei8FJya9sourYE6XyLrffKR4/PQVPbzK+qB8xVnrp
	AYByBjNOdcOUDEWbQshbP0vj7DFvlDbQT3BamTIzt97AKDnmDRBgmzJYGYYVCA==
X-Gm-Gg: AYBFou3lvtTaMPmMLtr7Z/MC4gFVJJnL+3BqdQ1xaOegYarHcmcMeAUL4g91MZYCstG
	rm6PmQvCMBiLwQgrVnm9+izbHgvaHV1QtQN3+NqOhAEJoDn+rttr+oo/B3zMp5tMqjIQzeIU0o7
	Mp6niCR5I1XkAAWZKHqkrkTIQ3j5XxyGFvQ/5cqJQmbHeCRJQryl8zalOv87d44S5F1mzeFFVUD
	UhXDeGi7dosue0qPrZo50BxeVuRVxaBs5Row4ocTdTUABJtZQ07k6hwHneFiHTQVE+TRoSBbCRa
	mD1YXrEq30II0+wXdH/1TObKvL9MZxYWpNelVesfkjhq/rS2n4H35ITe0XckUXnOIEXAcio9Ab9
	8VYrzPOw+f5Vg7fAp3XlZegR1ouNZLfOu71m0WDuOVoWvB/1/GU4Q9Eg3zXSvwBCDFCSN2RpDBI
	UDO8f7XeFUEUpL7Wu0aqBogl1UtuhKg53wT0giiRA6xPniZUGhK176EstWGQqE4/rR8fa6953n+
	S9FvGnZkjIZYiVa1LrzdFbiRu5uFDAusEM5RkQTe28TNh3wetKeRWtyEvtC4tAsWho8peAWkVFp
	pWec5MZW0VpoJOUk2bwlYdMAaVg4gtDDU0m3a4cEmwSkF1ZUfgPrZSY4CAsuSNbzPziE3pvN8we
	Tv7IRvtnIYeDYvH6bZrJRkBmmsI/aAy38b/SBQaMWETzq0We2ItSr2hYepw==
X-Received: by 2002:a17:90b:51c8:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-39d9bbc802bmr7093993a91.3.1789136285661;
        Fri, 11 Sep 2026 07:18:05 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50efsm7840791eec.28.2026.09.11.07.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:18:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/7] imx-cst: fix remaining build failures with OpenSSL 4
Date: Fri, 11 Sep 2026 07:17:55 -0700
Message-ID: <20260911141756.2275517-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911141756.2275517-1-khem.raj@oss.qualcomm.com>
References: <20260911141756.2275517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 14:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129970

Two more OpenSSL 4.0 breakages on top of the ASN.1 opacity already
handled by 0012-fix-openssl-4-asn1-opaque.patch.

The ENGINE API is gone. <openssl/engine.h> is still shipped as a
source-compatibility stub, so linking fails on ENGINE_free,
ENGINE_load_builtin_engines, ENGINE_by_id, ENGINE_init, ENGINE_finish,
ENGINE_ctrl_cmd and ENGINE_load_private_key. Define OPENSSL_ENGINE_STUBS,
which OpenSSL 4 provides for exactly this case: the declarations become
inline no-ops returning failure, so the file compiles and links unchanged.
OPENSSL_SUPPRESS_DEPRECATED is already defined there, so the stubs'
deprecation attributes do not trip -Werror. That leaves ENGINE_by_id()
returning NULL, which the existing code fed straight into ENGINE_init() -
a NULL dereference predating OpenSSL 4 - so check it and report what went
wrong, mentioning OpenSSL 4 so the failure is not mistaken for a missing
module. PKCS#11 backed signing genuinely is unavailable there, as no
provider exposes an equivalent of the pkcs11 engine's LOAD_CERT_CTRL.

X509_get_subject_name() now returns const X509_NAME *, so its result can
no longer be the destination of X509_NAME_add_entry_by_txt():

  src/tools/pki_tree/pki_helper.c:440:10: error: assigning to 'X509_NAME *' from 'const X509_NAME *' discards qualifiers

There is no mutable counterpart, so build the subject name standalone and
install it with X509_set_subject_name(); both setters copy it, so it is
freed once the issuer name has been set from it too.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...015-fix-openssl-4-engine-api-removal.patch | 67 +++++++++++++++++++
 ...016-fix-openssl-4-const-subject-name.patch | 48 +++++++++++++
 .../recipes-support/imx-cst/imx-cst_4.0.1.bb  |  2 +
 3 files changed, 117 insertions(+)
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0015-fix-openssl-4-engine-api-removal.patch
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0016-fix-openssl-4-const-subject-name.patch

diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0015-fix-openssl-4-engine-api-removal.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0015-fix-openssl-4-engine-api-removal.patch
new file mode 100644
index 0000000000..d4a3f0ff2e
--- /dev/null
+++ b/meta-oe/recipes-support/imx-cst/imx-cst/0015-fix-openssl-4-engine-api-removal.patch
@@ -0,0 +1,67 @@
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 3 Sep 2026 01:30:00 +0000
+Subject: Fix FTBFS with OpenSSL 4.0: ENGINE API removal
+
+OpenSSL 4.0 removed the ENGINE API. <openssl/engine.h> is still shipped,
+but only as a source-compatibility stub, so linking fails:
+
+  ld.lld: error: undefined symbol: ENGINE_free
+  ld.lld: error: undefined symbol: ENGINE_load_builtin_engines
+  ld.lld: error: undefined symbol: ENGINE_by_id
+  ld.lld: error: undefined symbol: ENGINE_init
+  ld.lld: error: undefined symbol: ENGINE_finish
+  ld.lld: error: undefined symbol: ENGINE_ctrl_cmd
+  ld.lld: error: undefined symbol: ENGINE_load_private_key
+
+Define OPENSSL_ENGINE_STUBS, which OpenSSL 4 offers exactly for this
+case: the ENGINE_* declarations become inline no-ops returning failure,
+so the file compiles and links unchanged. OPENSSL_SUPPRESS_DEPRECATED is
+already defined here, so the stubs' deprecation attributes do not trip
+-Werror either.
+
+That leaves ENGINE_by_id() returning NULL at runtime, which the existing
+code fed straight into ENGINE_init() - a NULL dereference that predates
+OpenSSL 4. Check the result and print what went wrong instead, noting the
+OpenSSL 4 situation so the failure is not mistaken for a missing module.
+
+Providers replace engines upstream, but nothing exposes an equivalent of
+the pkcs11 engine's LOAD_CERT_CTRL command yet, so PKCS#11 backed signing
+genuinely is unavailable with OpenSSL 4.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+--- a/src/lib/back_end/engine.c
++++ b/src/lib/back_end/engine.c
+@@ -4,6 +4,13 @@
+  */
+
+ #define OPENSSL_SUPPRESS_DEPRECATED
++/*
++ * OpenSSL 4.0 removed the ENGINE API.  <openssl/engine.h> still declares
++ * it for source compatibility, and defining OPENSSL_ENGINE_STUBS turns the
++ * declarations into inline no-ops so this file keeps linking.  The pkcs11
++ * engine simply does not exist there, which engine_ctx_init() reports.
++ */
++#define OPENSSL_ENGINE_STUBS
+
+ #include "engine.h"
+ #include "err.h"
+@@ -63,6 +70,16 @@
+
+ 	ctx->engine = ENGINE_by_id("pkcs11");
+
++	if (!ctx->engine) {
++		fprintf(stderr, "ERROR: cannot load the pkcs11 OpenSSL engine\n");
++#if OPENSSL_VERSION_MAJOR >= 4
++		fprintf(stderr,
++			"ERROR: OpenSSL 4.0 removed ENGINE support, so PKCS#11 "
++			"backed signing is unavailable\n");
++#endif
++		return 0;
++	}
++
+ #ifdef DEBUG
+ 	ENGINE_ctrl_cmd_string(ctx->engine, "VERBOSE", NULL, 0);
+ #endif
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0016-fix-openssl-4-const-subject-name.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0016-fix-openssl-4-const-subject-name.patch
new file mode 100644
index 0000000000..3cea584983
--- /dev/null
+++ b/meta-oe/recipes-support/imx-cst/imx-cst/0016-fix-openssl-4-const-subject-name.patch
@@ -0,0 +1,48 @@
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 3 Sep 2026 01:30:00 +0000
+Subject: Fix FTBFS with OpenSSL 4.0: const X509_get_subject_name()
+
+OpenSSL 4.0 changed X509_get_subject_name() to return a const X509_NAME *,
+so using its result as the destination of X509_NAME_add_entry_by_txt() no
+longer compiles:
+
+  src/tools/pki_tree/pki_helper.c:440:10: error: assigning to 'X509_NAME *'
+    from 'const X509_NAME *' discards qualifiers
+    [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
+
+There is no mutable counterpart to the getter (unlike X509_getm_notAfter),
+so build the subject name as a standalone X509_NAME and install it with
+X509_set_subject_name(). Both setters copy the name, so it is freed once
+the issuer name has been set from it too.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+--- a/src/tools/pki_tree/pki_helper.c
++++ b/src/tools/pki_tree/pki_helper.c
+@@ -437,11 +437,15 @@
+     if (X509_set_pubkey(x509, pkey) != 1)
+         handle_errors();
+
+-    name = X509_get_subject_name(x509);
++    name = X509_NAME_new();
++    if (!name)
++        handle_errors();
+     if (X509_NAME_add_entry_by_txt(name, "CN", MBSTRING_ASC,
+                                    (const unsigned char *) subj, -1, -1,
+                                    0) != 1)
+         handle_errors();
++    if (X509_set_subject_name(x509, name) != 1)
++        handle_errors();
+     if (sign_cert)
+     {
+         if (X509_set_issuer_name(x509, X509_get_subject_name(sign_cert)) != 1)
+@@ -452,6 +456,7 @@
+         if (X509_set_issuer_name(x509, name) != 1)
+             handle_errors();
+     }
++    X509_NAME_free(name);
+
+     if (is_ca)
+     {
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb b/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb
index 03dfdbd6f7..ec6838e95d 100644
--- a/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb
+++ b/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb
@@ -27,6 +27,8 @@ SRC_URI = "\
     file://0012-fix-openssl-4-asn1-opaque.patch \
     file://0013-convlb-remove-redundant-NULL-definition.patch \
     file://0014-fix-pointer-sign-errors-with-clang.patch \
+    file://0015-fix-openssl-4-engine-api-removal.patch \
+    file://0016-fix-openssl-4-const-subject-name.patch \
 "
 SRC_URI[sha256sum] = "fd92a1a9faa10fb81bbf752c7ee1e257f17e1ec4c2964f8a47adf8a3eaa7df41"


