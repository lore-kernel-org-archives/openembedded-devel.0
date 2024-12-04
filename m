Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B660E7716B
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 04:55:00 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.6823.1733288097529329046
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Dec 2024 20:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JZWrxtF4;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6eeb31b10ceso55492247b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 20:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733288096; x=1733892896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J5piiAfxKBTu7pa73ZxHVO8VT87n/2UT94h3qInZ9m4=;
        b=JZWrxtF41aH2nQs7F4CmfeHrAJpovvqm2iz3kpV8TT3XCLlW7MBUTzTs4xIt6zNatN
         VVKGCv/d05SGX9YR86fV4WgKx1PhpUiqzouhBzb3O0UQD07fEupHwi7cukhKixeUGGd+
         bKN7O0pNGt/WhRBu/eGTgeoSAEOA8o53EETe2Cyemu0mCA4M9gYyxBFEIN4Ny3eu6LKI
         g+BixGnJPY6TU2ukoaNphwtDbdUKXMWYBmnmo8ZfRKx9N1VSRvq0qSq8IpwBy9W7uRy6
         htIe+2mbtMGIjdBwNohB9DpcjkG8a1uT3mZ0oXg/WxGBg85UWUkO8TtDKq1Dt4Q4X4sN
         5pRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733288096; x=1733892896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5piiAfxKBTu7pa73ZxHVO8VT87n/2UT94h3qInZ9m4=;
        b=IMmwn58kbbtUxtrsBsR08B3jiRdQOG+E5m1KQg16864rS+SZJgefR5Zi3NDDqvIoWQ
         Piw4ItvjKe6+rgfhHoyzKGj1hKPV4ALEvbo6OyC+Re9qvmvKqtaacTAm4TpMsUf19jYD
         awfUp1Zv3DrDPlnNuUMNZL4yqehym4nf3XSlYpdBxDZMzS5v/aSO/mjrjApyotPXHp+r
         McRoVngZq7cIoPlcRU9n7YWkpyrcYfg/tIjHNC0dGjv6nAwPP1Ffz3ewjLj/vF+bwHR+
         +BQ8Q5en4fjqJoOuTe8FI+FcH3rPNCS578m6n6x/4hSFG7jxcT1pmLUWj7VLIYc+nKgN
         HGVA==
X-Gm-Message-State: AOJu0YyFPhGjiLAJfre7wfS6tkPDkkkYVPqfjsIZMdI0jlWn5Io3OCxt
	cm9lPT/ISzRnimgb/mM0ll0egOD9MMGoDphHeVMWeB/hiTRs2VKzIafzpn9q
X-Gm-Gg: ASbGncsR11v52/MLAiw52/mjduoUuNVO5YdeF2TVDyTxWUejuo3Wha8f26LAwAWbzBZ
	NfFhYTzPwVBVHhoqCZDhwlegv6GxHM/Kag81Dtub9kl/PYK+/1/LcSCf57z1EjF2+0GF9+dIXvC
	OfS3hJ0aKlUwszFfL/70TIW4oVvNmu8/7jK8SckQQow6IPX0fQ4/gVSBWTYsf0IgMYNCWNoHgyH
	ud6uVIXiaQyZCsLNu8pYYFVGRt0678RKOSdovsW/tfYZmVFJbQmyyxT
X-Google-Smtp-Source: AGHT+IFp2W6PibmdILCl1hpzOGFOnwpQKhHr4XevRrpuOCfuEsfXo+UwiDgPjHPmlizF2/EDQvoqzA==
X-Received: by 2002:a05:690c:c08:b0:6ef:579c:38e6 with SMTP id 00721157ae682-6efbd3fd769mr35874337b3.28.1733288096047;
        Tue, 03 Dec 2024 20:54:56 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ef4db292fdsm31111617b3.8.2024.12.03.20.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 20:54:55 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 22.11.0 -> 22.12.0
Date: Tue,  3 Dec 2024 23:54:07 -0500
Message-ID: <20241204045407.2978-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Dec 2024 04:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114193

License-Update: Add JSON parsing library under MIT license.
  https://github.com/nodejs/node/pull/56040/commits/27bcd103e775e00eb8d03ac37052bbd4ccb6d239

Drop backported patch fix-build-with-icu-76.patch.  It is already
integrated in this version https://github.com/nodejs/node/pull/56040/commits/c3ca978d9c73d1a96f4d5c7bfa3c10ce786b8fe9

Changelog: https://github.com/nodejs/node/blob/main/doc/changelogs/CHANGELOG_V22.md#22.12.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../oe-npm-cache                              |  0
 ....11.bb => nodejs-oe-cache-native_22.12.bb} |  0
 .../nodejs/nodejs/fix-build-with-icu-76.patch | 29 -------------------
 .../{nodejs_22.11.0.bb => nodejs_22.12.0.bb}  |  5 ++--
 4 files changed, 2 insertions(+), 32 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.11 => nodejs-oe-cache-22.12}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.11.bb => nodejs-oe-cache-native_22.12.bb} (100%)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.11.0.bb => nodejs_22.12.0.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.11/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.12/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.11/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.12/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.11.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.12.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.11.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.12.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76.patch b/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76.patch
deleted file mode 100644
index e8501bcdb..000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/fix-build-with-icu-76.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 54299ac3a3d4e4520b8604dce43c2584092ccde2 Mon Sep 17 00:00:00 2001
-From: Michael Cho <michael@michaelcho.dev>
-Date: Sun, 27 Oct 2024 10:08:07 -0400
-Subject: [PATCH] build: fix building with system icu 76
-
-ICU 76 decided to reduce overlinking[^1] thus `icu-i18n` will no longer
-add `icu-uc` when linking to shared libraries. This results in undefined
-symbols/references when trying to build with system ICU 76.
-
-[^1]: unicode-org/icu@199bc82
-
-Upstream-Status: Backport [https://github.com/nodejs/node/commit/81517faceac86497b3c8717837f491aa29a5e0f9]
----
- configure.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.py b/configure.py
-index a5f47af1748903..a4e210261e2e76 100755
---- a/configure.py
-+++ b/configure.py
-@@ -1879,7 +1879,7 @@ def icu_download(path):
-   elif with_intl == 'system-icu':
-     # ICU from pkg-config.
-     o['variables']['v8_enable_i18n_support'] = 1
--    pkgicu = pkg_config('icu-i18n')
-+    pkgicu = pkg_config(['icu-i18n', 'icu-uc'])
-     if not pkgicu[0]:
-       error('''Could not load pkg-config data for "icu-i18n".
-        See above errors or the README.md.''')
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.12.0.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.12.0.bb
index 8cbf53978..194df4c33 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.11.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.12.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=25e89142a2f4b075904a9986c45fbdb2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0bd28a461eccad39f85a29e33e8f879f"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -28,7 +28,6 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-deps-disable-io_uring-support-in-libuv.patch \
            file://0001-positional-args.patch \
            file://0001-custom-env.patch \
-           file://fix-build-with-icu-76.patch \
            file://run-ptest \
            "
 SRC_URI:append:class-target = " \
@@ -37,7 +36,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "bbf0297761d53aefda9d7855c57c7d2c272b83a7b5bad4fea9cb29006d8e1d35"
+SRC_URI[sha256sum] = "fe1bc4be004dc12721ea2cb671b08a21de01c6976960ef8a1248798589679e16"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.43.0


