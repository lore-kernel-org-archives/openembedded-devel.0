Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5E1C98324
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:50:22 +0000 (UTC)
Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35327.1790506216475647209
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rmFuAu69;
 spf=pass (domain: gmail.com, ip: 74.125.228.38, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-882833a9f61so316334b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506216; x=1791111016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFuuE1p1Yn3BKCoL1tfPvHDfcGt5cLds1wnnJdhhuFE=;
        b=rmFuAu69CJgigTRcAciC5L2/RP1Bnc6y3Xwcoecy92vyLhynVNNfU56h7Gtcg4JM/B
         lbqrPTXJ9gyAMKeSeslNIweV6SwVMgxUuoUm8sMyZhJAVpGSvMLXMm8S11RiffREdyN1
         tLWWpf89Jr7VrEojNhAsbJoluTLpJNMLUQxgVBD0Xq6dj7U+iWHExASIC7Z/dZs8pM1R
         lBuCriFq7chUKWTA890XFfgn7XX2hG137xd8NYW9ldZb305KLWDNGXCUHnnzCXI9kwro
         VJeQ24PB+l0JDIvyFbkrDBXVmgM9QCwg0TdWjznFnejL5ZCu+u2cAOEt5NajMu7+NE0m
         KybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506216; x=1791111016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UFuuE1p1Yn3BKCoL1tfPvHDfcGt5cLds1wnnJdhhuFE=;
        b=tydFmNoJa08WNWQ8vOIkUOPG3sNfEUj6cEXlCsIq1FpQeVOn1D4IuGsmzrrqGVTxu8
         +7BKdJ7wIb0J8tZQDmh2dFn8jQfOuovj8Pixh0pSjj78T/jquIjHiNI2SMFwgG81DX2U
         halRnszFhe+JhNv3PbtLM+JuaANOrFn6i5sVYcG46sFfldO+FjpGmM65M0lUy7WrGyvi
         8spFIKSasFJeNXdTuPLdnMRgqQOD7/kZFWiZk9x7NFLpYt3OV0RZqMaSUe/sYxV4ttvL
         gXLleLBWR0mnVVyvNreOPp6KMOHnXr+7ke/KG7/TYWjiiylQyN3bI8stO3EGQMPG7epg
         I0Bw==
X-Gm-Message-State: AFuF++lX0Ky6mEhbSVyUgc6s1c6nyX4opeItSemJPJL0x1Ah/A2wPp5n
	PJc61u4U/pNs8zqboL7P9+qrNm97DEwzuI53R7qSazi7rhfiNbvCBFb7YDuocg==
X-Gm-Gg: AYBFou1EXs1OC+L6oRVE8QFfXBx6Hwt/qZ86NEa/HmBXCqlBjAHKd7RSIdEN/fLRfjL
	NnX9UzTxLYdjmGUTeahxQSjS/WoJIhVuizm1NMUj15td1iQZCnOxHM/4afnmI7uGLcZF/mSm9Cc
	6fO5YiFW2LZZTvHT3TDH8oaRMN9gSbTurSr9ZSpLRO2v0l5yytebDw9CHfry9ErnMIRChat9Ze4
	x//LEPG/1uUTTSpJaW1haqzJksOShbmBOj35Zb2zcL8yBU2VHV28uLllZSx6ldAgDhQvz9kRXaj
	qNubiHd0fdxtBD6ywomPx7Pupb+yXQ4HSnZ01sXkKMjkueL1zFp/vWEyVkxzKgofGY9YIBLQ+jv
	40uDmrdTeXHILsj8SbPWWErRyY03CKuVVl/sdQkkkXw0jgz++/CZEG1UUtGn44ugRjVEp2RUxEa
	Q56jsdaHfjLg5x8YK7nqpXsaulDThyCEWzEDv8ml3wuPYjcxmiE8dHDSoUg1SlDtzCdmNUMyBmw
	3IThGMwA+SRJMlXQk/Ohto=
X-Received: by 2002:a05:6a00:3c94:b0:87a:9335:c93f with SMTP id d2e1a72fcca58-8802c46d8acmr4783173b3a.43.1790506215749;
        Sun, 27 Sep 2026 03:50:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:50:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 3/35] libuvc: upgrade 0.0.7 -> 0.0.8
Date: Sun, 27 Sep 2026 23:49:30 +1300
Message-ID: <20260927105002.1832451-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130337

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- Dropped patch that is merged in the upstream version
- Include tag in the SRC_URI
- Introduce packageconfig option for jpeg[1]

Changelog:
https://github.com/libuvc/libuvc/releases/tag/v0.0.8

[1]https://github.com/libuvc/libuvc/commit/94a188c874cd299c4179b58858d06b3a409f2df0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-allow-build-with-cmake-4.patch       | 40 -------------------
 .../{libuvc_0.0.7.bb => libuvc_0.0.8.bb}      | 10 +++--
 2 files changed, 6 insertions(+), 44 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/libuvc/libuvc/0001-allow-build-with-cmake-4.patch
 rename meta-multimedia/recipes-multimedia/libuvc/{libuvc_0.0.7.bb => libuvc_0.0.8.bb} (63%)

diff --git a/meta-multimedia/recipes-multimedia/libuvc/libuvc/0001-allow-build-with-cmake-4.patch b/meta-multimedia/recipes-multimedia/libuvc/libuvc/0001-allow-build-with-cmake-4.patch
deleted file mode 100644
index bc91f3bf92..0000000000
--- a/meta-multimedia/recipes-multimedia/libuvc/libuvc/0001-allow-build-with-cmake-4.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 347567b4a01079faa1e5d3796f185241efee6e4c Mon Sep 17 00:00:00 2001
-From: Alper Ak <alperyasinak1@gmail.com>
-Date: Wed, 9 Jul 2025 12:49:18 +0300
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
- compatibility
-
-Fix:
-
-| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
-|   Compatibility with CMake < 3.5 has been removed from CMake.
-|
-|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
-|   to tell CMake that the project requires at least <min> but has been updated
-|   to work with policies introduced by <max> or earlier.
-|
-|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
-|
-|
-| -- Configuring incomplete, errors occurred!
-
-Upstream-Status: Submitted [https://github.com/libuvc/libuvc/pull/294]
-
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index fbaffc9..54e7431 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.1)
-+cmake_minimum_required(VERSION 3.5)
- project(libuvc
-   VERSION 0.0.7
-   LANGUAGES C
--- 
-2.43.0
-
diff --git a/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb b/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.8.bb
similarity index 63%
rename from meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb
rename to meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.8.bb
index 9a3f718e16..0c4d765d7d 100644
--- a/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.7.bb
+++ b/meta-multimedia/recipes-multimedia/libuvc/libuvc_0.0.8.bb
@@ -4,11 +4,13 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2f1963e0bb88c93463af750daf9ba0c2"
 
-DEPENDS = "libusb jpeg"
+DEPENDS = "libusb"
 
-SRC_URI = "git://github.com/libuvc/libuvc.git;branch=master;protocol=https \
-        file://0001-allow-build-with-cmake-4.patch"
+SRC_URI = "git://github.com/libuvc/libuvc.git;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "68d07a00e11d1944e27b7295ee69673239c00b4b"
+SRCREV = "4e9fc773914377ec0bcf2f31621f56da5a0fa09f"
 
 inherit cmake pkgconfig
+
+PACKAGECONFIG ?= "jpeg"
+PACKAGECONFIG[jpeg] = "-DDISABLE_JPEG=OFF,-DDISABLE_JPEG=ON,jpeg"

