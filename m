Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.25362.1612728036401943128
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 12:00:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MShQoSJm;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id nm1so7057875pjb.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 12:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+YU+zqQgxAdY9bKDPfUjUWP1edReXiTB03DgrrfiEUg=;
        b=MShQoSJmtxN1QFvT5fVqIQXi0+/0pQ0rf2kKIkXb4FK6NYbDhVOXgd922Km+hAb0UG
         sH2YNsIU7il5f3FaO5XwEfy41T7vmp1urS/Ic/XYSE0NwGon3G7b7BXORdIVQ844+nJR
         q1NJkxKW+zGG2Z7IxkA1DpQePDaw7DwFqsvbmpb9VEdxac9SuZHxfA4loIYBcmJaFqOL
         xamoSj+AvDhjNVy8bIS4QFqSeqqosBoT8AWIZHlYlJMtBFkux0lOXD3mgHVQBeniTVjf
         sEEunEZuBVkfGkeSpgGeh7m7mpJw7Gyj3FFrO2h+ISWCUJ9xvyTalYjtIxL08FzVSCm7
         o3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+YU+zqQgxAdY9bKDPfUjUWP1edReXiTB03DgrrfiEUg=;
        b=YtrWfb3lHI0koj61xUl+D+9fnewq7YSdIq4kGbwWSGIuhUL1cdVCuQt4amvr600Vb0
         qkakq4ZVH0xoz/ZSA0nc63lVxi4CTJyanNUisxk1sW8/DAqk6FqEf46eb1gUXkXWir5H
         rX1Jm8ibbTLk89/4Gp70NJzOJmlNeNIVk/7e5YfNg0aUZI011U5GL6u0r+OLazxxyfvI
         xRQmp4Q3YOgAgqqG4TsQcnFSxgqT0yr1HcPSdgoObGBXmQ8/0HDenbPEbc1DtGrNzQ37
         lBjcqBCtky3HKk9y+AyEJQu18BNF1j1q9ye9/AxLsGZmsA/OYi9aJOi9OeHhczkVYIDB
         6Pew==
X-Gm-Message-State: AOAM531xYgCgF4dbIQMYrcJAqIE5NHHQWMZeDHQGLUxVTds76vyEHqTR
	a2cpNXB4gIYBYP128Gdhy++ZA/6cWIE=
X-Google-Smtp-Source: ABdhPJy/2sDFiWgt1CJQTzGkKwfliOie8SpCQjDEitU2BXEEdMXo/zCR37bLWxEZCpXRyMQA7TtuCA==
X-Received: by 2002:a17:902:eccb:b029:de:8483:505d with SMTP id a11-20020a170902eccbb02900de8483505dmr13697749plh.63.1612728035531;
        Sun, 07 Feb 2021 12:00:35 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id n15sm16485200pgl.31.2021.02.07.12.00.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 12:00:35 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] enca: Fix SRC_URI
Date: Sun,  7 Feb 2021 20:00:33 +0000
Message-Id: <20210207200033.48185-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The project appears to have moved.
Update HOMEPAGE and SRC_URI. bz2 is not available, use gz
Update HASH accordingly.

Fixes:
WARNING: enca-1.9-r0 do_fetch: Failed to fetch URL http://www.sourcefiles.org/Networking/Tools/Miscellanenous/enca-1.9.tar.bz2, attempting MIRRORS if available

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/enca/enca_1.9.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/enca/enca_1.9.bb b/meta-oe/recipes-support/enca/enca_1.9.bb
index bf19843b2..b0ba3aede 100644
--- a/meta-oe/recipes-support/enca/enca_1.9.bb
+++ b/meta-oe/recipes-support/enca/enca_1.9.bb
@@ -1,21 +1,20 @@
 SUMMARY = "Enca is an Extremely Naive Charset Analyser"
 SECTION = "libs"
-HOMEPAGE = "http://trific.ath.cx/software/enca/"
+HOMEPAGE = "https://cihar.com/software/enca/"
 
 DEPENDS += "gettext-native"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=24b9569831c46d4818450b55282476b4"
 
-SRC_URI = "http://www.sourcefiles.org/Networking/Tools/Miscellanenous/enca-${PV}.tar.bz2 \
+SRC_URI = "https://dl.cihar.com/enca/enca-${PV}.tar.gz \
     file://configure-hack.patch \
     file://dont-run-tests.patch \
     file://configure-remove-dumbness.patch \
     file://makefile-remove-tools.patch \
     file://libenca-003-iconv.patch "
 
-SRC_URI[md5sum] = "b3581e28d68d452286fb0bfe58bed3b3"
-SRC_URI[sha256sum] = "02acfef2b24a9c842612da49338138311f909f1cd33933520c07b8b26c410f4d"
+SRC_URI[sha256sum] = "75a38ed23bac37cc12166cc5edc8335c3af862adc202f84823d3aef3e2208e47"
 
 inherit autotools
 
-- 
2.25.1

