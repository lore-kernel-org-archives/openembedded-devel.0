Return-Path: <iillyyaa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97772C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 19:12:39 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.37095.1704222757510867114
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jan 2024 11:12:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iJx7xQYT;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: iillyyaa@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7815547f2c5so392892985a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 11:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704222756; x=1704827556; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lR7ZZqKTn5UfK+ifhXUmUIySAj3zWSWA8U47LCrKHE4=;
        b=iJx7xQYTObZ3VYFUrkayo6GUXO1qFkjSUbKG3HMbdWIJvTiyA5vQCjO5H2ATgovxxI
         7kWm6ot4h79OvrS/kE+8UMUoptTY/7qUdXl/plrSEGRh7Im/3oGi+rfBm3kRJlERri+5
         RMy63Ropi78jPN0MwimNzAcBRgZYgbRvCW2RFJ/BwDcixBu8U1OGsBJiaYPndD9vwalT
         I8VM7VjEgbJHWQCklc953WqLR2RaBUcPSkgRhN0SRHQ5CNuQHcrCazYQLC8a976nJOvn
         ENEH417a3qrt73mpMsph3OH+HDXmQiBoA921kzg7bGLEoDyf38H69xi85xfQNIqu8Qw+
         FJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704222756; x=1704827556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lR7ZZqKTn5UfK+ifhXUmUIySAj3zWSWA8U47LCrKHE4=;
        b=rUPxoJEqBpcIS7VfrOSipsBYuVoWkSFHo/fuair6GSvRpjLs4Q/rQZ4z8qKzI2dV4E
         O/uFhPkjO5h9uj/Z/2lJLVDoyCPow8b04zDi+cVfhaglq8QSJSujbF9FiWy7znTr9FNW
         0WtWZ3reQT4SZak3FTi8Ga+KiHq0Mkgbtdh2efmuYbmuf1UEgYoWqcr0byMHTqRoSmMH
         d3m8SktnywN9ehk4emiVpIkiXZFEPY0CrFmhwnXOdxIG15MI3AcwfEwSMYgnOl98XGxF
         NDokrMoT1JONFb8NR1vJ835YO0hwPLRAF6JTlxtEV2V1o7vh4XCV5iM1m0/UTZZ8fYUi
         rctQ==
X-Gm-Message-State: AOJu0Yw32kLKngMvkXi27PgUCBOuE69rlmLxzd3QP/q1akLflIAjY4KN
	/AeWBoUujnOTMwaOJspJMhfaRqS0Ca0=
X-Google-Smtp-Source: AGHT+IEpVsGI7ygjI7KIQ55PtiM7Enhhh4Kjok4K3Xz8CpWuyt1if3ncPubnCpg3N9oGaJVOGNQU7g==
X-Received: by 2002:ae9:ec12:0:b0:781:7193:9b97 with SMTP id h18-20020ae9ec12000000b0078171939b97mr6595477qkg.69.1704222756073;
        Tue, 02 Jan 2024 11:12:36 -0800 (PST)
Received: from palpot.eng.veobot.io ([50.239.151.2])
        by smtp.gmail.com with ESMTPSA id v2-20020ae9e302000000b00781d4c771c2sm990428qkf.60.2024.01.02.11.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 11:12:35 -0800 (PST)
From: "Ilya A. Kriveshko" <iillyyaa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Ilya A. Kriveshko" <iillyyaa@gmail.com>
Subject: [meta-oe][PATCH] srecord: fix install prefix
Date: Tue,  2 Jan 2024 14:12:22 -0500
Message-Id: <20240102191222.833181-1-iillyyaa@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 19:12:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108015

srecord's CMakeLists.txt was unconditionally setting CMAKE_INSTALL_PREFIX
for non-WIN32 builds, which caused it to ignore OE-supplied prefix
that contained the sysroot portion of the path.  Fixed by removing the
offending line.

Signed-off-by: Ilya A. Kriveshko <iillyyaa@gmail.com>
---
 ...rnally-supplied-CMAKE_INSTALL_PREFIX.patch | 27 +++++++++++++++++++
 .../recipes-support/srecord/srecord_1.65.0.bb |  3 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/srecord/files/0001-allow-externally-supplied-CMAKE_INSTALL_PREFIX.patch

diff --git a/meta-oe/recipes-support/srecord/files/0001-allow-externally-supplied-CMAKE_INSTALL_PREFIX.patch b/meta-oe/recipes-support/srecord/files/0001-allow-externally-supplied-CMAKE_INSTALL_PREFIX.patch
new file mode 100644
index 000000000..19b5c88f6
--- /dev/null
+++ b/meta-oe/recipes-support/srecord/files/0001-allow-externally-supplied-CMAKE_INSTALL_PREFIX.patch
@@ -0,0 +1,27 @@
+From 023b3de19a9c04858f34143d5d9b32bd0287f6d7 Mon Sep 17 00:00:00 2001
+From: "Ilya A. Kriveshko" <iillyyaa@gmail.com>
+Date: Fri, 29 Dec 2023 20:48:37 +0000
+Subject: [PATCH] Allow externally supplied CMAKE_INSTALL_PREFIX
+
+CMAKE_INSTALL_PREFIX variable is supposed to be left as a default,
+or overwritten by the packager.  In particular, OE-provided prefix
+includes the sysroots path and should be used.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+---
+ CMakeLists.txt | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 74b8108..f149917 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -32,7 +32,6 @@ include(GNUInstallDirs)
+ # FHS compliant paths for Linux installation
+ if(NOT WIN32 AND CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
+ #  set(CMAKE_INSTALL_PREFIX "/opt/${PROJECT_NAME}")
+-  set(CMAKE_INSTALL_PREFIX "/usr")
+ endif()
+ 
+ # Pull in the rest of the pieces
diff --git a/meta-oe/recipes-support/srecord/srecord_1.65.0.bb b/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
index 06ce48e65..6887f629e 100644
--- a/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
+++ b/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
@@ -4,11 +4,12 @@ LICENSE = "GPL-3.0-or-later & LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = " \
     https://sourceforge.net/projects/${BPN}/files/srecord/${@oe.utils.trim_version('${PV}', 2)}/${BP}-Source.tar.gz \
     file://0001-Disable-doxygen.patch \
-    file://0001-cmake-Do-not-try-to-compute-library-dependencies-dur.patch"
+    file://0001-cmake-Do-not-try-to-compute-library-dependencies-dur.patch \
+    file://0001-allow-externally-supplied-CMAKE_INSTALL_PREFIX.patch"
 SRC_URI[sha256sum] = "81c3d07cf15ce50441f43a82cefd0ac32767c535b5291bcc41bd2311d1337644"
 S = "${WORKDIR}/${BP}-Source"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/srecord/files/releases"
 
-- 
2.39.0


