Return-Path: <andre.paiusco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF51C54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 18:58:04 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.2350.1709751479037711142
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 10:57:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G2dVVQk6;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: andre.paiusco@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-512e4f4e463so28921e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 10:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709751476; x=1710356276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lU1ZMZPhjIPJV7/Lqjh5Ezuo0+l4thl0tSnbSgLcrq8=;
        b=G2dVVQk6b9iJ3xvuyzsXgTxt5MAcpglgpKJWoRteipL7h/JfUuNy0vSuXrXVjMiIif
         HmwUSxJwvex5E1shwUZoeeahUh/vF6aodPjZ/cV/I88FOw0lMZhpeRC5X82ZEDLFwGaV
         tkb7PCBcokJDyqtJpfMxbRrN/BSYX+8covlIuvzikQ34naJwTMaAFyD7eDR9XwS6WKRw
         ehPWfXnJboIty1S4mFaHAQGPhxne/RoHqZ0mz2PeFjexwOZnvmHpiJVb3ONT6OVD1Lbd
         RozKmw5tdmu0Z70ZQj/BlYJ6P4gUOzbBBauAQGlmflsOIdn9npWfYXcprXumx+rnaLYB
         mvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709751476; x=1710356276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lU1ZMZPhjIPJV7/Lqjh5Ezuo0+l4thl0tSnbSgLcrq8=;
        b=gzzdZT9lkKJqOLhQjqT7dk1ViyzGSP7xY2jbyAAIJ3fk2NraiTrn8Q1+p4tdH+KPkf
         Qgk94tIa9g3LR5FDQ+WGeubtGkt5sbqdU6hCYRdCSA4OWrp5dN/Pv0dGtQjwW4Hp9tNW
         Lr55DwqQIZ2p3zuacQSMvO1fkxKlNuaFBaDfdjdmLCcurSrdQ1gOymoyQNJJTCZuMPfc
         jB/93z80UGeU2TG/k0JGQGEZ3RwXhWXiFzuaMSFZ16DC4C9+s5WF6UqpK7061nBAwYn2
         FdOb5maC9TMJM7RRNnOLUTkTj63J1fuade0f7LjdqSpdGcLad0s/9YfkdjB1V40X6v02
         ANGg==
X-Gm-Message-State: AOJu0YwYUNzS8zktYz7HPsxvfRcOf8NhmSqNbhhHXIWcY9G8au0/notB
	RvJkPr0olNLP+HDbZXmbSQFfj1xu7wjtqWDEvJBHsOsMJgsjPFSnh9wGH6a1
X-Google-Smtp-Source: AGHT+IEytIcvpwW6uc7vlMDnT7CxzvwKCVUGzJLwnIxozX1GGoaXTtklyJALay9R5dZ/DYI6//tVbQ==
X-Received: by 2002:a05:6512:3d05:b0:513:426e:618 with SMTP id d5-20020a0565123d0500b00513426e0618mr5797464lfv.48.1709751476005;
        Wed, 06 Mar 2024 10:57:56 -0800 (PST)
Received: from localhost.localdomain (84-107-6-196.cable.dynamic.v4.ziggo.nl. [84.107.6.196])
        by smtp.gmail.com with ESMTPSA id h5-20020a1709062dc500b00a45beb1c671sm799947eji.13.2024.03.06.10.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 10:57:55 -0800 (PST)
From: Andre Paiusco <andre.paiusco@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andre Paiusco <andre.paiusco@gmail.com>
Subject: [PATCH] ydotool: Add new package
Date: Wed,  6 Mar 2024 19:57:23 +0100
Message-ID: <20240306185724.14629-1-andre.paiusco@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 18:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109178

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
index 000000000..83ab1fc37
--- /dev/null
+++ b/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Generic Linux command-line automation tool (no X!)"
+DESCRIPTION = "ydotool is not limited to Wayland. You can use it on anything as long as it accepts keyboard/mouse/whatever input."
+LICENSE = "AGPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=eb1e647870add0502f8f010b19de32af"
+
+DEPENDS = "systemd"
+PV = "1.0.4+git${SRCPV}"
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


