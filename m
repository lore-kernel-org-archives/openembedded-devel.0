Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A33C36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 22:13:14 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.770.1743545593382449307
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 15:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=09sJHj9f;
 spf=pass (domain: smile.fr, ip: 209.85.221.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-3913b539aabso3552044f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 15:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1743545591; x=1744150391; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=goLvACtKP8HO4PIq1bwHAH0/18AvwRc9GAMYvJ8vccs=;
        b=09sJHj9fX3DQ1A+oZAljbI5tq/AdQBEQtZqOrkCetKLKQzC3YT3WwH0YUL4Hy7F6Tp
         UX7+V8w2N5VchaBWgL4DFTtN/oRLQ3HuM36VhG1qfqxVY1UWWlV8FFqBFnwY9RejDf7E
         t8o3TfTQ97YNypjUs6ArCCFfukh1Cg8eb9xgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743545591; x=1744150391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=goLvACtKP8HO4PIq1bwHAH0/18AvwRc9GAMYvJ8vccs=;
        b=Gni/DYMglrAfhuhpn0+ulLDl5GmHoFAlS+iI8NjSwHq/nP1oQTFDaLxt03zgCIOWvT
         hB2eUuZpRVeWyCqrEpgHvCd4zlnunRAb1InkF+M5Toy9PiB3AX7JryJRz0EVNujXtC2v
         goRfBZ+8aSmckR+K4N8mUd9ciic/Z0K5XmW0fl3uDFPdMJptuK96HUqmFSU2McK6E++8
         V5kDvL2gptY3J3d3y5suDXCV+G+V50ZBlXti1UoujQgDzMzkaGXhpkKHclTMwG8Ep2I2
         aOqHN1mNx8RR/u8NV5ZsKy2S2ylyrNHgTkzGAM6a47/nf/1KjCrxwhP6zuwPwqFhLOJT
         MPRA==
X-Gm-Message-State: AOJu0Yw6EGcENZsAVeGc9rXe8Q6A5CJhucX92q5jiTGr1oVIN7v1KxA9
	dyvVO50CSQiRBpxuaPX8K55T0ON3Mw7vzjyisDc+axJmvDt0DBfG7ilPMo8YOS/FweoM6YkSrRS
	1kc+0rA==
X-Gm-Gg: ASbGncve7Ml2hoHGIVcw5/k/x1hhc3xGexWXyjTXLeirpFuyGhAzzKUI/ldVh3zpNyV
	N56LOgO5/qP7j0Ka98cQIotaIbAzfTXkP8PD/s2GFVLEet/d/SSyN4o7+xBHQXXnyCKvtA6xnYC
	BWY2raisiJTIB4gfUZNehCi4UBr3RnKm8T3HJsNIk5wVkNigdG4CyoXipvQmV5qyZWsV+gIIj2J
	eM6+Haaf3DS/CEe8Na5QZW77Tqd1kyquRI9c7WGkONcDPq1V0iozyxDAei/K73HXVE/U4QMbC19
	g/U4n7jQfH1JieHjd4A+HB3bBLiMykkdB77YdocgDowlw0USpzPz5cuDDeujJLnZvvjqYW2PzdT
	osn6G4bTQX4XFfWGd0sloDYPvMogPArDL1yVXmjUxyMgDZXnBGiA=
X-Google-Smtp-Source: AGHT+IG6ZZTTwWdg+Z9CVITBxzKAy24YS23B9LaUL0gY+S/Ns+w7U/bA4JyzfH8g8NN575/MVnaF4A==
X-Received: by 2002:a5d:5f55:0:b0:391:22a9:4427 with SMTP id ffacd0b85a97d-39c120dad24mr11028209f8f.12.1743545591046;
        Tue, 01 Apr 2025 15:13:11 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb000deef0005681450959a41ab2.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:5681:4509:59a4:1ab2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a41e8sm15442423f8f.92.2025.04.01.15.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 15:13:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] cmatrix: Fix host-based non-reproducibility
Date: Wed,  2 Apr 2025 00:12:49 +0200
Message-Id: <20250401221249.2506503-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 22:13:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116489

From: Yoann Congal <yoann.congal@smile.fr>

cmatrix configuration code choose where to install fonts based on what
directory exists on build host. This is not reproducible[0].

Remove the existence check and change the lists to the ones matching
OpenEmbedded paths.

[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/38/steps/32/logs/stdio

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...Prevent-configuration-from-reading-h.patch | 58 +++++++++++++++++++
 .../recipes-extended/cmatrix/cmatrix_2.0.bb   |  7 ++-
 2 files changed, 63 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/cmatrix/cmatrix/0001-reproducibility-Prevent-configuration-from-reading-h.patch

diff --git a/meta-oe/recipes-extended/cmatrix/cmatrix/0001-reproducibility-Prevent-configuration-from-reading-h.patch b/meta-oe/recipes-extended/cmatrix/cmatrix/0001-reproducibility-Prevent-configuration-from-reading-h.patch
new file mode 100644
index 0000000000..5f23252605
--- /dev/null
+++ b/meta-oe/recipes-extended/cmatrix/cmatrix/0001-reproducibility-Prevent-configuration-from-reading-h.patch
@@ -0,0 +1,58 @@
+From f0a48c4e42819604063e6eacb7cdb4fa22331c77 Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Tue, 1 Apr 2025 23:42:39 +0200
+Subject: [PATCH] reproducibility: Prevent configuration from reading host
+ directories
+
+Current code choose where to install fonts based on what directory
+exists on build host. This is not reproducible.
+
+Remove the existence check and change the lists to the one matching
+OpenEmbedded paths.
+
+Upstream-Status: Inappropriate [embedded specific]
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ CMakeLists.txt | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c5548b3..c9af31c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -7,8 +7,8 @@ set(VERSION "2.0")
+ 
+ # These are relative to CMAKE_INSTALL_PREFIX
+ # which by default is "/usr/local"
+-set(CONSOLE_FONTS_DIRS "share/consolefonts" "lib/kbd/consolefonts")
+-set(X_FONTS_DIRS "lib/X11/fonts/misc" "X11R6/lib/X11/fonts/misc" "share/fonts/X11/misc")
++set(CONSOLE_FONTS_DIRS "share/consolefonts")
++set(X_FONTS_DIRS "lib/X11/fonts/misc" "share/fonts/X11/misc")
+ 
+ set(MKFONTDIR "/usr/bin/mkfontdir")
+ 
+@@ -47,16 +47,13 @@ install(TARGETS cmatrix DESTINATION bin)
+ 
+ if     (UNIX)
+ 	foreach    (CONSOLE_FONTS_DIR ${CONSOLE_FONTS_DIRS})
+-		if     (IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/${CONSOLE_FONTS_DIR}")
+ 			message(STATUS "Installing matrix console fonts to ${CMAKE_INSTALL_PREFIX}/${CONSOLE_FONTS_DIR}")
+ 			install(FILES
+ 				"${CMAKE_SOURCE_DIR}/matrix.fnt"
+ 				"${CMAKE_SOURCE_DIR}/matrix.psf.gz"
+ 				DESTINATION "${CONSOLE_FONTS_DIR}")
+-		endif  ()
+ 	endforeach ()
+ 	foreach    (X_FONTS_DIR ${X_FONTS_DIRS})
+-		if     (IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/${X_FONTS_DIR}")
+ 			message(STATUS "Installing matrix X window fonts to ${CMAKE_INSTALL_PREFIX}/${X_FONTS_DIR}")
+ 			install(FILES
+ 				"${CMAKE_SOURCE_DIR}/mtx.pcf"
+@@ -67,7 +64,6 @@ if     (UNIX)
+ 				"execute_process(COMMAND \"${MKFONTDIR}\" \"${CMAKE_INSTALL_PREFIX}/${X_FONTS_DIR}\")")
+ 			install(CODE
+ 				"message(STATUS \"If this is the first time you have installed CMatrix you will probably have to restart X window in order to use the mtx.pcf font.\")")
+-		endif  ()
+ 	endforeach ()
+ endif  ()
+ 
diff --git a/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb b/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
index 6b6acf1be8..829e9588c8 100644
--- a/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
+++ b/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
@@ -3,7 +3,10 @@ SUMMARY = "Terminal based 'The Matrix' screen implementation"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "git://github.com/abishekvashok/cmatrix.git;branch=stable;protocol=https"
+SRC_URI = " \
+    git://github.com/abishekvashok/cmatrix.git;branch=stable;protocol=https \
+    file://0001-reproducibility-Prevent-configuration-from-reading-h.patch \
+"
 SRCREV = "adfdf1656f23e5ab3b52c7d7edf91249a4477e8d"
 S = "${WORKDIR}/git"
 
@@ -11,4 +14,4 @@ inherit cmake
 
 DEPENDS += "ncurses"
 
-FILES:${PN} += "${datadir}/* ${libdir}/kbd/*"
+FILES:${PN} += "${datadir}/* ${libdir}/kbd/* ${libdir}/X11/fonts/"

