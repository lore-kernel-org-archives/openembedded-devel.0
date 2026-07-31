Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142D7C5516D
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 18:02:02 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2083.1785520921237581776
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2026 11:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aQ7f6syI;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84a2dcede83so1934618b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 11:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785520920; x=1786125720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q1rfUxOaQJZJaWUn6tb66Dua4sUoCkkPSk1OqqP9erM=;
        b=aQ7f6syII+Q9lq81xd8r9P5dZwbmA+f56NXctplEcS34LvSwwVGfcoJFcSYQa8FYhv
         VdDxqLfefqiBZLZs/2qGqwPErmFaGRoyo0QXTxFk9WAeDv3H4e11XZwVhD7vH5SjFtl0
         9kDiSih8G9/nsHGOn+RSUslBuB3amdmMkxFaj0uZZ9+UswBwfx9zNvCeY375eWNgA+fF
         frJfQrl4jwNRFQX8StukYk8d1LziqzmO/cQ1H/HPLeeo2Hu77OhAk8cmFjNa4b4JAzKA
         /m3umlHEbPeQ4lPk0EuSAimYYXZwoYRLInOOFjLMYz5UDhD/Qu/hVk9Vo8lkUDVbR8ng
         7yVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785520920; x=1786125720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q1rfUxOaQJZJaWUn6tb66Dua4sUoCkkPSk1OqqP9erM=;
        b=hTg/3Ct7NQQEwBagfeQQAqfBbuDbWY/iqPvtXEQPL5CaAxojNfHGfS8EeO1wU9Rw+J
         RL1jZ6HseZyOYm68Au+uI9zAHFr8R/8ucndj8opdFqcD3JI6qyLtKJEeRExCFQLMno/W
         De1HwTbcgoLnImCfs6OYZgAxdYfTJJsmTwDM0pWujuqjZNPV+XjxRHXQfw5dWU6qvsyx
         Rcic6KQUdIlMJQ6RfurzXaiAvBWCm5Dr3kH/tztvwavDbVjB5aZ8NS8fcC+E2BXfxA0l
         l4BeCKCCyFGkSljy1ZYt/vJGQyY/dxFhm7jftV4x+/hk6zFHPoV5PfSNmRSBsahFviIm
         gW9w==
X-Gm-Message-State: AOJu0Yy7kEYjD5WK0zzqscv/U4s/7i1UhxKVgqewaWWa6ArNyH9/CnLy
	m2NIkXXx77YfT2ObERH2nYCYzNFVI2a9c/5PqqW5ofET43r8AcswUjYn2yOwedcl
X-Gm-Gg: AR+sD11tp3AmmmRdBR1n64Ju8kU7ULL9yVgOhTGvul40RqunHFp1GR6gkaZM2yfqdFS
	jBwdRoiMu+i4WFNgsptzgOQW8Q9XQYdcTGvivdxdRf1ZFFq9g536mA9I04saEQTIeilGlS0RrlR
	SPoGLhf9D3O0UYgoS7kYHdS5REwscKpMJsYYykl+mKhvyqEQEKLB4fK57bs01smqqqIQ6cGnl4+
	XBFF8e8hkp8QnCAvRuUuT5z5bMp/L8L8LLzw5X/ZKBVKuHMnGbgUMfu85ENdPnfa5KcYdDxyGR/
	uLeLv0NUytcoO5WmWRB5jQkxNDwgO2NrPpKjorTP2OHel5mlZPVHQ/LClfg4bWaCtTGzpvf/QHF
	PPeJ5+gAMqiQY8GPv1wJle1ujgQ1HbO6oJYT4x8P5HmZyDgw9mxNF49SGG+UwHDiCN1+a3uqQuG
	uLsLxJW657owPhqlVnJUeG/vIcAf+bKlzYoRpgPNbfVH/LGsPUyo8ZV3Fp92EHwlpATdEAYsVVE
	CWU0teTgEez2Qiqtxh47v29yASGiIVtIoXmORKTLr3Gt59nPYlsvUOnn7ZRu+wC7nj4t8Wsy2v3
	LJtNZW1OWl/P3AFTqg7T8S2BWtZCNxUn6XNyV6QgznePJIzEf4AZdo41IKSEwXXQq2o4EblcOdd
	tsA==
X-Received: by 2002:a05:6a20:6a1c:b0:3c3:9eae:3679 with SMTP id adf61e73a8af0-3c92a989408mr622668637.71.1785520920437;
        Fri, 31 Jul 2026 11:02:00 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06fc98sm8047821eec.21.2026.07.31.11.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:01:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/2] libsdl3: Fix build with cmake 4.4
Date: Fri, 31 Jul 2026 11:01:56 -0700
Message-ID: <20260731180157.1304292-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 18:02:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128586

cmake's check_symbol_exists() does not forward CMAKE_REQUIRED_FLAGS to the
try_compile() it runs, unlike check_include_file() and
Internal/CheckSourceCompiles which both pass it along as
-DCOMPILE_DEFINITIONS. So the -D_GNU_SOURCE=1 that SDL adds to
CMAKE_REQUIRED_FLAGS never reaches any symbol check, and every glibc
extension hidden behind __USE_GNU is detected as missing.

HAVE_GETRESUID being unset is fatal, since SDL_gtk.c then compiles its own
static fallback which collides with the <unistd.h> declaration:

  SDL_gtk.c:90:19: error: static declaration of 'getresuid' follows
                          non-static declaration

Pass _GNU_SOURCE via CMAKE_REQUIRED_DEFINITIONS as well. This also restores
detection of memfd_create, ppoll, posix_spawn_file_actions_addchdir,
fopen64 and fseeko64, which were silently disabled.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...SOURCE-via-CMAKE_REQUIRED_DEFINITION.patch | 53 +++++++++++++++++++
 .../libsdl3/libsdl3_3.4.12.bb                 |  4 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/libsdl3/libsdl3/0001-cmake-Pass-_GNU_SOURCE-via-CMAKE_REQUIRED_DEFINITION.patch

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3/0001-cmake-Pass-_GNU_SOURCE-via-CMAKE_REQUIRED_DEFINITION.patch b/meta-oe/recipes-graphics/libsdl3/libsdl3/0001-cmake-Pass-_GNU_SOURCE-via-CMAKE_REQUIRED_DEFINITION.patch
new file mode 100644
index 0000000000..e6d372c4c0
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3/0001-cmake-Pass-_GNU_SOURCE-via-CMAKE_REQUIRED_DEFINITION.patch
@@ -0,0 +1,53 @@
+From c8a74ad998879e52badd09e9e52477c8e87d0e5d Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 31 Jul 2026 02:25:45 -0700
+Subject: [PATCH] cmake: Pass _GNU_SOURCE via CMAKE_REQUIRED_DEFINITIONS too
+
+CMake's check_symbol_exists() does not forward CMAKE_REQUIRED_FLAGS to the
+try_compile() it performs - it only forwards CMAKE_REQUIRED_DEFINITIONS,
+CMAKE_REQUIRED_INCLUDES, CMAKE_REQUIRED_LINK_OPTIONS and
+CMAKE_REQUIRED_LIBRARIES. Its sibling modules (CheckIncludeFile,
+Internal/CheckSourceCompiles) do pass CMAKE_REQUIRED_FLAGS along as
+-DCOMPILE_DEFINITIONS, which is why only check_symbol_exists() is affected.
+
+As a result the -D_GNU_SOURCE=1 added to CMAKE_REQUIRED_FLAGS never reaches
+any check_symbol_exists() test, and every glibc extension guarded by
+__USE_GNU in the system headers is detected as missing:
+
+  HAVE_GETRESUID, HAVE_GETRESGID, HAVE_MEMFD_CREATE, HAVE_PPOLL,
+  HAVE_POSIX_SPAWN_FILE_ACTIONS_ADDCHDIR, LIBC_HAS_FOPEN64, ...
+
+Most of these just silently disable functionality, but HAVE_GETRESUID being
+unset is a hard build failure, because src/core/unix/SDL_gtk.c then defines
+its own static fallback which collides with the declaration in <unistd.h>:
+
+  SDL_gtk.c:90:19: error: static declaration of 'getresuid' follows
+                          non-static declaration
+  /usr/include/unistd.h:755:12: note: previous declaration is here
+
+Add -D_GNU_SOURCE=1 to CMAKE_REQUIRED_DEFINITIONS as well so that the
+symbol checks see it too.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ CMakeLists.txt | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 93a99bc..e37858d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -122,6 +122,11 @@ set(SDL_CHECK_REQUIRED_LINK_OPTIONS "" CACHE STRING "Extra link options (for CMA
+ mark_as_advanced(SDL_CHECK_REQUIRED_INCLUDES SDL_CHECK_REQUIRED_LINK_OPTIONS)
+
+ string(APPEND CMAKE_REQUIRED_FLAGS " -D_GNU_SOURCE=1")
++# check_symbol_exists() does not forward CMAKE_REQUIRED_FLAGS to try_compile(),
++# so _GNU_SOURCE has to be passed via CMAKE_REQUIRED_DEFINITIONS as well,
++# otherwise every check for a glibc extension (getresuid, memfd_create, ppoll,
++# posix_spawn_file_actions_addchdir, ...) is misdetected as missing.
++list(APPEND CMAKE_REQUIRED_DEFINITIONS "-D_GNU_SOURCE=1")
+ list(APPEND CMAKE_REQUIRED_INCLUDES ${SDL_CHECK_REQUIRED_INCLUDES})
+ list(APPEND CMAKE_REQUIRED_LINK_OPTIONS ${SDL_CHECK_REQUIRED_LINK_OPTIONS})
+
diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.12.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.12.bb
index ed1e10e858..43690bc4bb 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.12.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.12.bb
@@ -14,7 +14,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=036a54229112040a743509a86b30c80c \
                     file://src/video/yuv2rgb/LICENSE;md5=79f8f3418d91531e05f0fc94ca67e071 \
                     "

-SRC_URI = "http://www.libsdl.org/release/SDL3-${PV}.tar.gz"
+SRC_URI = "http://www.libsdl.org/release/SDL3-${PV}.tar.gz \
+           file://0001-cmake-Pass-_GNU_SOURCE-via-CMAKE_REQUIRED_DEFINITION.patch \
+"

 S = "${UNPACKDIR}/SDL3-${PV}"


