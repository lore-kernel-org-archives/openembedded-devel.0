Return-Path: <andre.paiusco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36155C54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 16:28:21 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.27840.1709828898011445475
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 08:28:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z+ZOPzh1;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: andre.paiusco@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d09cf00214so14559831fa.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 08:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709828896; x=1710433696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ru8lM1fKG8Vzjb8HFqztsbSpZ3UczgFFzDdgAwL/qk=;
        b=Z+ZOPzh1ao8WdKIkeEyupYhN+e5p7ZdYnoVlDA59imyUane5t2HOIBN8R0quz+mKnD
         JlM9Ir/7mY4c81pDx6UEA/frpSVXbHmR+3B2ff+MQ6hORbbCDi6icjzeE1Umwwr1Np/I
         dxdER8ScEOY1Zo1vrm2wRz8CN/XC1xcj+MV6uoRba4w01tS4HPmcJiRL5v87+dpetzln
         hgkZJwKMFSSstEhH8dBUoDY5WXmYJEpkm5x7Z2sKF5zD04Mxdiqb7cmC5O+zyxaYlK4f
         jM4idZPnYYjywqYZZQJWYo4zjnYwuGOq+6gitamChw1iiwnutv1Qj7+llsoePj21PqsY
         CoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709828896; x=1710433696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Ru8lM1fKG8Vzjb8HFqztsbSpZ3UczgFFzDdgAwL/qk=;
        b=cnng1DtNdbZBs/aEevzCj2dOdYF1ZUnxfU1NFpLIqTAAp7t1Lq3Xp6/aNCYbtaktRM
         DhDkP1zT3KmHUfvA0e/kahC1k1ePnWPdp9221kJQI+xlj4J13cz01pLPjC3qJ0QvvQ++
         O7PRS7iAZ2Yvt1OGeXB0cfZRC78TIwGD4O+M3y7InYJhxCSvDElBeHecXrFHkHNEALZb
         E3QpbtjQZf6odHqr1uvZiHe/aiJPpN6gCmjazbgfnNrycY3ZcvrGTJJYioz2uG50NP46
         RwocXWzcEpELncLzc6Hu4RLusRbJVr5MlASP6MNzjELt9+QrczHM7BHo0k/1I/leIM9S
         RKLQ==
X-Gm-Message-State: AOJu0YzuwzKU3nIGGCV+3q3FwASz4+ghKa0H/0h8rYjszOO8tDCWKRdl
	y2bMB9pso2Dri9rfKAElmq6Y8DoJpcguplFPenaJDr9FO3qsrsLvt5OYps6f
X-Google-Smtp-Source: AGHT+IH8pdPMsfTzYcXR5WcWzaXgZ6uv0WrlF2RVoUoe/gdhc9v4/4DGgWZ7LE5jSbsR4f+mGvRlrg==
X-Received: by 2002:a05:651c:198c:b0:2d3:ffa0:8782 with SMTP id bx12-20020a05651c198c00b002d3ffa08782mr2021791ljb.43.1709828895608;
        Thu, 07 Mar 2024 08:28:15 -0800 (PST)
Received: from localhost.localdomain (84-107-6-196.cable.dynamic.v4.ziggo.nl. [84.107.6.196])
        by smtp.gmail.com with ESMTPSA id y6-20020a056402358600b005645961ad39sm8094464edc.47.2024.03.07.08.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 08:28:15 -0800 (PST)
From: Andre Paiusco <andre.paiusco@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andre Paiusco <andre.paiusco@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] ydotool: Add new package
Date: Thu,  7 Mar 2024 17:27:12 +0100
Message-ID: <20240307162712.9329-2-andre.paiusco@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 16:28:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109201

CC: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Andre Paiusco <andre.paiusco@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb      |  1 +
 .../recipes-graphics/ydotool/ydotool_git.bb    | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ydotool/ydotool_git.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 6e2012dae..dd033208b 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -611,6 +611,7 @@ RDEPENDS:packagegroup-meta-oe-graphics ="\
     xcursorgen \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xscreensaver", "", d)} \
     yad \
+    ydotool \
     parallel-deqp-runner \
     ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "opengl vulkan", "vulkan-cts", "", d)} \
diff --git a/meta-oe/recipes-graphics/ydotool/ydotool_git.bb b/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
new file mode 100644
index 000000000..928f5f79b
--- /dev/null
+++ b/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Generic Linux command-line automation tool (no X!)"
+DESCRIPTION = "ydotool is not limited to Wayland. You can use it on anything as long as it accepts keyboard/mouse/whatever input."
+LICENSE = "AGPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=eb1e647870add0502f8f010b19de32af"
+
+DEPENDS = "systemd"
+PV = "1.0.4+git"
+
+SRC_URI = "git://github.com/ReimuNotMoe/ydotool;protocol=https;branch=master"
+SRCREV = "c07ae72be46c40912023b91b8ba737630d8720e1"
+
+inherit cmake systemd pkgconfig
+
+EXTRA_OECMAKE = "\
+    -DBUILD_DOCS=OFF \
+"
+
+SYSTEMD_SERVICE:${PN} = "ydotoold.service
\ No newline at end of file
-- 
2.44.0


