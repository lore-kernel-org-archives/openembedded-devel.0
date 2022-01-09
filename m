Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF59C433EF
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:30:36 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.24227.1641767435433057806
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:30:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W5xf/IN7;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id a5so19416372wrh.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EeqIpcSJKNsRIvKN84gr9DYKd/3s98aTL1z+5nvYqgg=;
        b=W5xf/IN71wugG3dP+AhZjAINgww7AN0fGdMrA3RoZ0qdRb/4R8TKYwtgkn8ki8AFnL
         mYBXtwTA8IZQ+pQslg5LHdNyEpE+2CrDb/BdntDJjpDGbKEOdoVfyQRKxrovxGysIPYd
         hdgG3bMbfh6UkIuYunIUC4akrdRp/e422/E6aGyr9yYcOXaITYsWI0DxgUUcirygmAY9
         g1ZYK14ifQ9kQU8CcdbZPb9VTBJCi2QDgqOBd2Lar8oIMYOkkibr8axbhlbBh/qL6nYy
         GDDTXiesZEhLkTpmKRppxLArlX9lAhDM7J8quZt8Wa9MqcE4fkynJ/81s9L7zs+P41Dq
         pnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EeqIpcSJKNsRIvKN84gr9DYKd/3s98aTL1z+5nvYqgg=;
        b=eMvZv4977KcjHpTPTpYXR0pihM9uRv6TJZrtB0+tbD7ptPDf3O5gFbusW77kPkTjD0
         lJub8KbwTDFMhHokPifa6vw/BSG41fdGHDTN8eL/LHXBwgrq+3MIX9A3qpBHLqjPW+5W
         lrxllH8QKDg3savJeaeremQufqA+ob1BrT1EzoGtddlMWLe68A8CthxKmzDX9OzTI/30
         vR0yr7HgvFZnx4ilqdW3GPPk046MsPeMFLbYMVpOfls2uSXdHjBHQkYFd6UihRAc54x2
         DDEULwrmWc0BsfV9qQ5Wrs6DGbuqXwLGq+nYcKnYmWdkB/ux9x+dNy38I6/5qXzS7yCJ
         GxcA==
X-Gm-Message-State: AOAM533QHEBlZ8JkqoDiFYQwTXbab0CdDhcbu0tz7jcnfonAuyjI7OJa
	1gblO7+wDdYkWcmjh+XYoI9VBLLP7Go=
X-Google-Smtp-Source: 
 ABdhPJxokDZ9MTeCKGAcHqSwCKRGbjSyd5nU8z4pO82rNRCPPzAlVGprX/iLv7c4v6PuUH4EikCiNA==
X-Received: by 2002:a05:6000:1867:: with SMTP id
 d7mr62694347wri.21.1641767433929;
        Sun, 09 Jan 2022 14:30:33 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm4865979wmi.40.2022.01.09.14.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:30:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] libportal: add from oe-core
Date: Sun,  9 Jan 2022 23:30:29 +0100
Message-Id: <20220109223030.2252491-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Jan 2022 22:30:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94704

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-gnome/libportal/libportal_0.5.bb    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/libportal/libportal_0.5.bb

diff --git a/meta-gnome/recipes-gnome/libportal/libportal_0.5.bb b/meta-gnome/recipes-gnome/libportal/libportal_0.5.bb
new file mode 100644
index 000000000..67f63fea6
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libportal/libportal_0.5.bb
@@ -0,0 +1,17 @@
+SUMMARY = "libportal provides GIO-style async APIs for most Flatpak portals."
+DESCRIPTION = "It provides simple asynchronous wrappers for most Flatpak portals \
+with a familiar GObject API along side the D-Bus API"
+HOMEPAGE = "https://github.com/flatpak/libportal"
+BUGTRACKER = "https://github.com/flatpak/libportal/issues"
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
+
+SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=master"
+SRCREV = "467a397fd7996557f837cdc26ac07c01c62810e5"
+S = "${WORKDIR}/git"
+
+inherit meson gtk-doc gobject-introspection
+
+DEPENDS += "glib-2.0 glib-2.0-native gtk+3"
+
+EXTRA_OEMESON = "-Dbackends=gtk3 -Dvapi=false"
-- 
2.20.1


