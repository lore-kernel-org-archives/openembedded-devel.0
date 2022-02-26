Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F44CC433EF
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 04:11:15 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.3205.1645848674515679215
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 20:11:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EqdUj9f/;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id e6so4990134pgn.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 20:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MfdeS5qIsT2Vb86QuTpOVQlDqlO78lTFTOh1/Teaioc=;
        b=EqdUj9f/T0zzPIjhqD30y16HmLuEP6uaeJO74wG+FSukQCNqo4l9ST89Op2feOH9zn
         +RNS3Ekdz8s9P7C6xD0X3zq1HqHIqIj84J6iT9lPFDrui22orsAQ6RVuKv5m30tHpC8c
         gnC/bfHuurRp49s+u0r0fxyQuSjYr8PzcY+qCqKn3wxTwi89QaAp3mr/gnNs1MBipNci
         ElZTyA4tWXu9EnBrYpqrWnHd2785JQ2/jlRKRk79pbNBGID6g37T8N1l5Oq2E/iSHDXQ
         deYITi+ftrRHoCCjWMCP6ywuvE9T29m9bH8cy/M5MZ+DP1LKGPPBNkyEMGQNrjJVO6SD
         39jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MfdeS5qIsT2Vb86QuTpOVQlDqlO78lTFTOh1/Teaioc=;
        b=jbqFZ94nXS25ahourVe39IXzGvehffoJShO6WZY6mAFj3d6VaFasdIr2GH8sbYQla+
         IUOr+UV8a9JrfjV9/5a7joN7e6mvGqLe2/EmVpFArjo0B0NpIX+mZzzNp9Qtvmzu8O2R
         rCEUU4uI+jQ4ZqSC0BUm1Muwzl+rEhL/SLgVuV5i4UC8XCU1iq5XTABxB3foEIzLav7u
         tR8aNrAlcqTlC8lMtSsb7Ie/wGMj2POn+WS4UBNWgY4M6BytLHJZJDlKtwWqfFEZxVxO
         pCnSzKcRvUb514LFIwzzOzKgtvZtkHejs8K7mdQm1mRjl5uKqBhOoeNsrTHYu7h3wSzE
         uWGA==
X-Gm-Message-State: AOAM530A6LrwzCs07sYMRhPDP/5gkqZ4L/Ccz9aeKFxdBj0BCsXXxJOk
	MGPknyx7uUSxJ/B/0vajRXzELpf+AWY=
X-Google-Smtp-Source: 
 ABdhPJwHSLDKkVsyY2RHDDjF6j5NsyldhgUGbcanzlZ3dCDycjFzH+9hiVZC1Oy8D21zC/aEKz773w==
X-Received: by 2002:a63:110a:0:b0:34b:f642:c00b with SMTP id
 g10-20020a63110a000000b0034bf642c00bmr8863922pgl.333.1645848673515;
        Fri, 25 Feb 2022 20:11:13 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d615:a2e3:253b:5be5])
        by smtp.gmail.com with ESMTPSA id
 k20-20020a056a00135400b004ecc81067b8sm5293246pfu.144.2022.02.25.20.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 20:11:12 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-twofish: drop recipe
Date: Fri, 25 Feb 2022 20:11:03 -0800
Message-Id: <20220226041103.1398748-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 04:11:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95537

The code has not been touched since 2013 and does not build with
bdist_wheel. If you depend upon this recipe, please work with upstream
to update the package to PEP-517 packaging.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ng-return-statements-in-module-stubs.patch | 38 -------------------
 .../python/python3-twofish_0.3.0.bb           | 15 --------
 2 files changed, 53 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-twofish/0001-Fix-missing-return-statements-in-module-stubs.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-twofish/0001-Fix-missing-return-statements-in-module-stubs.patch b/meta-python/recipes-devtools/python/python3-twofish/0001-Fix-missing-return-statements-in-module-stubs.patch
deleted file mode 100644
index c25b2457e2..0000000000
--- a/meta-python/recipes-devtools/python/python3-twofish/0001-Fix-missing-return-statements-in-module-stubs.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 5704610f4b3aed5210e9c5b7c05ff8b5b2364c9c Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Mon, 12 Aug 2019 08:18:21 +0000
-Subject: [PATCH] Fix missing return statements in module stubs
-
-* fixes build with -Werror=return-type
-  twofish.c: In function 'init_twofish':
-  twofish.c:45:1: error: control reaches end of non-void function [-Werror=return-type]
-     45 | PyMODINIT_FUNC init_twofish(void) { }
-        | ^~~~~~~~~~~~~~
-  twofish.c: In function 'PyInit__twofish':
-  twofish.c:46:1: error: control reaches end of non-void function [-Werror=return-type]
-     46 | PyMODINIT_FUNC PyInit__twofish(void) { }
-        | ^~~~~~~~~~~~~~
-  cc1: some warnings being treated as errors
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Upstream-Status: Submitted [https://github.com/keybase/python-twofish/pull/6]
----
- twofish.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/twofish.c b/twofish.c
-index e324c34..d4487d8 100644
---- a/twofish.c
-+++ b/twofish.c
-@@ -42,5 +42,5 @@ DL_EXPORT(void) exp_Twofish_decrypt(Twofish_key * xkey, uint8_t c[16], uint8_t p
- We need a stub init_twofish function so the module will link as a proper module.
- Do not import _twofish from python; it will not work since _twofish is not a *real* module
- */
--PyMODINIT_FUNC init_twofish(void) { }
--PyMODINIT_FUNC PyInit__twofish(void) { }
-+PyMODINIT_FUNC init_twofish(void) { return NULL; }
-+PyMODINIT_FUNC PyInit__twofish(void) { return NULL; }
--- 
-2.17.1
-
diff --git a/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb b/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
deleted file mode 100644
index 94fb71090e..0000000000
--- a/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Bindings for the Twofish implementation by Niels Ferguson"
-DESCRIPTION = "Bindings for the Twofish implementation by Niels Ferguson\
- libtwofish-dev."
-HOMEPAGE = "http://github.com/keybase/python-twofish"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=33a63abf6d7567b1689d8ce69f00e43b"
-
-SRC_URI += "file://0001-Fix-missing-return-statements-in-module-stubs.patch"
-
-SRC_URI[md5sum] = "d7d22f16dc4ffa0e3ae2200654033abe"
-SRC_URI[sha256sum] = "b09d8bb50d33b23ff34cafb1f9209f858f752935c6a5c901efb92a41acb830fa"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


