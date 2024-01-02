Return-Path: <iillyyaa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD09C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 22:25:10 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.342.1704234305144258320
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jan 2024 14:25:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yd21c0Rf;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: iillyyaa@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7818ab57d7dso355079085a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 14:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704234303; x=1704839103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GK9ioSTeEOUv3Auu9Up8JsQ4LCz6NjPKsellx+45WJU=;
        b=Yd21c0RfRTDJLZmNqhDfbLnHsTNVQJF3542QhJTCLo7UAk4Sjy4Hj694pKfj2JOU0A
         hdrVKkIZuInAz/Nccfa3Jg1xY9LqI6zopfPU2tR9Fpa9jf4i43u06M45xTeQR7nB73tC
         jEz698tCn4gTqKoOfhepckXIaau0UrrMus9Ihud6zvtVlX14PmrYZjNiXU5EX8QQXQZU
         Oedd9411bPR8NUB109l3dXrh6XgtBu7xAAIF4Mu5BtIZvVt4l6m27rM5XF2hZ/CpGtys
         w/2fXsktDUQR+jOBPFJNHKm62dUo/ca2f1AWwODdCAg9AQFnbeY+nPmlTQkoa6t2P2+g
         kUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704234303; x=1704839103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GK9ioSTeEOUv3Auu9Up8JsQ4LCz6NjPKsellx+45WJU=;
        b=Z93d7Q4VOV/9P3bkcxb06bT6ElzewE4RilflxeffuvAyI5ga8l9ZAv9zesqlRvr0OM
         iehTj0U+BxpdqRuF5KyAiFsFXylUNKButXp+JhyX2oNJB7NeIWFvpAKSdO5/MCUzW8Os
         CSz44sTD6JynScT2vbNxi38y7dALmihOeNNiLnzv9Hi9YSY9yzwVon65BeY8lZ+mnGdK
         HKF0QxQf2cu41AcSidfYvS8Nrp51OjNiRdwtAVnIqYzZ8tQfw4pcqivjhyPwYyBajHr4
         vlx7O1Kbq9X8YQAdLiTAayhNsi3ttCpe2i1/X3p7+0wmUzBCc3UOhuKq/0SOBHPZuJXz
         xrVg==
X-Gm-Message-State: AOJu0YyFqcYYJj8ysARyLumY82IuG1wSn4+U6e1cCBmqaeFOCkal4Zlv
	0OwaROugZFHKY3ZUB1wMVdPyBGsWJNo=
X-Google-Smtp-Source: AGHT+IF1MNucmjHC0NhACxa6VT+pJU5AFGVwpT5qrFqCBj7vGe9nQuhN2a5D0PoXQrco/HoxptpkZA==
X-Received: by 2002:a05:620a:1212:b0:781:dd9a:b620 with SMTP id u18-20020a05620a121200b00781dd9ab620mr1717980qkj.121.1704234303260;
        Tue, 02 Jan 2024 14:25:03 -0800 (PST)
Received: from palpot.eng.veobot.io ([50.239.151.2])
        by smtp.gmail.com with ESMTPSA id w3-20020a05620a0e8300b00781cc3f50desm1462225qkm.0.2024.01.02.14.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 14:25:02 -0800 (PST)
From: "Ilya A. Kriveshko" <iillyyaa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Ilya A. Kriveshko" <iillyyaa@gmail.com>
Subject: [meta-oe][PATCH] srecord: fix install prefix
Date: Tue,  2 Jan 2024 17:24:59 -0500
Message-Id: <20240102222459.847246-1-iillyyaa@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 22:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108022

srecord's CMakeLists.txt was unconditionally setting CMAKE_INSTALL_PREFIX
for non-WIN32 builds, which caused it to ignore OE-supplied prefix
that contained the sysroot portion of the path.  Fixed by setting
the prefix only if it wasn't explicitly provided.

Signed-off-by: Ilya A. Kriveshko <iillyyaa@gmail.com>
---
 ...make-respect-explicit-install-prefix.patch | 31 +++++++++++++++++++
 .../recipes-support/srecord/srecord_1.65.0.bb |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/srecord/files/0001-cmake-respect-explicit-install-prefix.patch

diff --git a/meta-oe/recipes-support/srecord/files/0001-cmake-respect-explicit-install-prefix.patch b/meta-oe/recipes-support/srecord/files/0001-cmake-respect-explicit-install-prefix.patch
new file mode 100644
index 000000000..5a74323bc
--- /dev/null
+++ b/meta-oe/recipes-support/srecord/files/0001-cmake-respect-explicit-install-prefix.patch
@@ -0,0 +1,31 @@
+From 4aa8cf8c93e1fa6ffeb40fc3473f32b1b83af141 Mon Sep 17 00:00:00 2001
+From: "Ilya A. Kriveshko" <iillyyaa@gmail.com>
+Date: Tue, 2 Jan 2024 15:37:10 -0500
+Subject: [PATCH] cmake: respect explicit install prefix
+
+If CMAKE_INSTALL_PREFIX was supplied externally, use it.  This follows
+the pattern suggested by cmake documentation in:
+https://cmake.org/cmake/help/latest/variable/CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT.html
+
+Upstream-status: Submitted [https://github.com/sierrafoxtrot/srecord/pull/68]
+---
+ CMakeLists.txt | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 74b8108c..ac9f464e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -30,9 +30,9 @@ include(InstallRequiredSystemLibraries)
+ include(GNUInstallDirs)
+ 
+ # FHS compliant paths for Linux installation
+-if(NOT WIN32 AND CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
+-#  set(CMAKE_INSTALL_PREFIX "/opt/${PROJECT_NAME}")
+-  set(CMAKE_INSTALL_PREFIX "/usr")
++if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT
++        AND NOT WIN32 AND CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
++  set(CMAKE_INSTALL_PREFIX "/usr" CACHE PATH "Install prefix" FORCE)
+ endif()
+ 
+ # Pull in the rest of the pieces
diff --git a/meta-oe/recipes-support/srecord/srecord_1.65.0.bb b/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
index 06ce48e65..3e8a87d07 100644
--- a/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
+++ b/meta-oe/recipes-support/srecord/srecord_1.65.0.bb
@@ -4,11 +4,12 @@ LICENSE = "GPL-3.0-or-later & LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = " \
     https://sourceforge.net/projects/${BPN}/files/srecord/${@oe.utils.trim_version('${PV}', 2)}/${BP}-Source.tar.gz \
     file://0001-Disable-doxygen.patch \
-    file://0001-cmake-Do-not-try-to-compute-library-dependencies-dur.patch"
+    file://0001-cmake-Do-not-try-to-compute-library-dependencies-dur.patch \
+    file://0001-cmake-respect-explicit-install-prefix.patch"
 SRC_URI[sha256sum] = "81c3d07cf15ce50441f43a82cefd0ac32767c535b5291bcc41bd2311d1337644"
 S = "${WORKDIR}/${BP}-Source"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/srecord/files/releases"
 
-- 
2.39.0


