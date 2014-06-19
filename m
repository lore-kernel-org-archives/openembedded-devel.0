Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 383B970181
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 09:59:58 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id l18so2083665wgh.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 02:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=74QIA5swm+DcAt+OrQPh+g8n2Zxj5Id67osEMVEkwNs=;
	b=FVKjlmHvqhfKYK6XtckZRgnvbIaxLQAdB0c/NsF5XiG0D40atUjhMKqe3uKrcZf6uv
	9SrN0CeJK6Dp94QAkpB9N7Zvl3hsLUI8thvWAzATEVYYUBFOQLeErN/ysgCup1c/PosQ
	2pxR56S7bjzgBtphEYNRxHo3lXZJcgeaW9xDugsFSR+99DosnmOjyDXj84UALBlDeso+
	mbkFmzx88fv9cOSoWv4mftqbXqAnGS01MmxWbyGGJR7WZqNob9Mtrcvcx9MVJY/cI8/9
	l/lYAanCVHIP+xNFvkCKe+e84H5ZyANbITeVwH516UuDP7sqb0FCk+wtxxR+5JUkEyBq
	NVoA==
X-Received: by 10.194.61.193 with SMTP id s1mr3983575wjr.36.1403171999563;
	Thu, 19 Jun 2014 02:59:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bx2sm7662442wjb.47.2014.06.19.02.59.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 02:59:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:33 +0200
Message-Id: <1403171993-26208-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 05/25] networkmanager, network-manager-applet, xfce4-power-manager: Blacklist because of broken networkmanager after libgcrypt-config was removed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jun 2014 09:59:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../network-manager-applet/network-manager-applet_0.9.8.0.bb            | 2 ++
 meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb   | 2 ++
 meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.2.0.bb | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.0.bb
index 8dbb3dc..95c6802 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.0.bb
@@ -2,6 +2,8 @@ SUMMARY = "GTK+ applet for NetworkManager"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
+PNBLACKLIST[network-manager-applet] = "BROKEN: depends on broken networkmanager"
+
 DEPENDS = "gnome-bluetooth polkit-gnome libnotify networkmanager dbus-glib libglade gconf gnome-keyring libgnome-keyring iso-codes"
 
 inherit gnome gtk-icon-cache
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
index 371344d..bdda59c 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b"
 
 DEPENDS = "libnl dbus dbus-glib udev wireless-tools gnutls util-linux ppp"
 
+PNBLACKLIST[networkmanager] = "BROKEN: needs to detect gcrypt from pkg-config (error: gnutls explicitly requested but gcrypt not found on system)"
+
 inherit gnome gettext systemd
 
 SRC_URI = " \
diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.2.0.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.2.0.bb
index 6e92186..2f9994f 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.2.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.2.0.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce
 
+PNBLACKLIST[xfce4-power-manager] = "BROKEN: rdepends on broken networkmanager"
+
 DEPENDS = "gtk+ glib-2.0 dbus-glib xfconf libxfce4ui libxfce4util libnotify \
            libxrandr virtual/libx11 libxext xfce4-panel"
 
-- 
2.0.0


