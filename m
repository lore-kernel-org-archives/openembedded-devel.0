Return-Path: <andre.paiusco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B06C54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 20:07:52 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.3568.1709842069410992669
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 12:07:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZUHc8LAc;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: andre.paiusco@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-567fbbd7658so1465080a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 12:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709842067; x=1710446867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VvjXHE7SHxLYnG5QQ5zMgzhkstwK6Rk+860ZC8iNmZg=;
        b=ZUHc8LAcFeH8kCNy87ONLPr8u3o90A0g8rqLrF7Izd5zDxDGV6Q8PQ+RoiKF1biDbn
         zHNRiF2MS2MHmNcoG2jRzedcrVNbPgDfKoF8dk3jmBiki7C5wsRkuPRQBoKJdW35tXfY
         5WI9/pFY/J/eK5Ch2A8Ku9nIGBii2xFCsAtSXmqYt92BgZQAdf8Soak9w5U7I6kG1yMa
         A6wacTyjOG/jKnUMzo9igEV47qPdJaJs+PilcPySH0Gnf4JrT9YqLZti9u1E2LXifgw1
         zDIWx+VxVVVAAmmKPkS4xUjIiAaZ74tR7pwgSV8LmFhlKCZznlzbt2PtKX2l3xAVrolo
         thQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709842067; x=1710446867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvjXHE7SHxLYnG5QQ5zMgzhkstwK6Rk+860ZC8iNmZg=;
        b=E1NmkXR0x6lbOijSnYXFIeGCE0E2W/1otjjg3O7pPxAdh1wS42c2DpUiLz1nicewY8
         FhFuWmBaJQDf4zTwEwPZAXuYhiHGyQHS9UCK/ohn48gDoSxZVQ6QsI/foFolgrP3FSeH
         G1G3eOAtf1+Un0+U1g8LQWworzGyI4nGW6fmreFKHDft4K9pXDdqWpxm0TpHVJ2YkRFh
         4c5xHoC73Nh6EbZ9LmWSm/RhSBT+HyKuIXu2yY6NOU7X66kzPZtRImMb37Bq94Te3R7o
         OuEFE16znaUGyKaq9O5Cj1DOC4WZi9O1SOsdsP3daUZD0yIvCqBUE4MiaycMvfW8sSNi
         G8hg==
X-Gm-Message-State: AOJu0Yx+5gctmxqUosOi+Pwggi52Wk0vxewUw9C0ajSuP5EanqFl6pIv
	b9pRAsXBJ+5nNfQC1kMdEGw7JAlHm7pYFwEyCyflPWFExMZ4CeFd8q53+RXB
X-Google-Smtp-Source: AGHT+IHZFgcoMrPBKPhVHMiGMhOXWfqnFecTK9Qra5jBIz4eZRB7JY8YLNvRNY+BaqxGB0w6/XAP7Q==
X-Received: by 2002:a50:8a9b:0:b0:567:6bf:dcac with SMTP id j27-20020a508a9b000000b0056706bfdcacmr621342edj.36.1709842067339;
        Thu, 07 Mar 2024 12:07:47 -0800 (PST)
Received: from localhost.localdomain (84-107-6-196.cable.dynamic.v4.ziggo.nl. [84.107.6.196])
        by smtp.gmail.com with ESMTPSA id p8-20020a05640243c800b00567fd12c7f8sm1660889edc.60.2024.03.07.12.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 12:07:47 -0800 (PST)
From: Andre Paiusco <andre.paiusco@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Andre Paiusco <andre.paiusco@gmail.com>
Subject: [PATCH v4] ydotool: Add new package
Date: Thu,  7 Mar 2024 21:07:46 +0100
Message-ID: <20240307200746.26808-1-andre.paiusco@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 20:07:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109209

CC: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Andre Paiusco <andre.paiusco@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 .../recipes-graphics/ydotool/ydotool_git.bb   | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ydotool/ydotool_git.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 6e2012dae..16d919cb6 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -611,6 +611,7 @@ RDEPENDS:packagegroup-meta-oe-graphics ="\
     xcursorgen \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xscreensaver", "", d)} \
     yad \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "ydotool", "", d)} \
     parallel-deqp-runner \
     ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "opengl vulkan", "vulkan-cts", "", d)} \
diff --git a/meta-oe/recipes-graphics/ydotool/ydotool_git.bb b/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
new file mode 100644
index 000000000..2525ea70b
--- /dev/null
+++ b/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
@@ -0,0 +1,20 @@
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
+inherit cmake systemd pkgconfig features_check
+
+REQUIRED_DISTRO_FEATURES = "systemd"
+
+EXTRA_OECMAKE = "\
+    -DBUILD_DOCS=OFF \
+"
+
+SYSTEMD_SERVICE:${PN} = "ydotoold.service
\ No newline at end of file
-- 
2.44.0


