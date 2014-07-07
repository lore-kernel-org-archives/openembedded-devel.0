Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id A6E2470386
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Jul 2014 10:45:42 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id hi2so15576799wib.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jul 2014 03:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RG254ubBKcRWpMGf1dGqTppw7FlW6asCdoc17mC2aIo=;
	b=ZphTz1gUySif63SkAVKHewPGt0dGHySa2xNai6a8uNTB7/tAnfMf/+s4UaTdoczV6f
	C5LwXMRsosrgAzUx3z3v7Lt7CksXbWB/5js2DZFLnV7ef/ynuaVCWvO0uPGaxHGUCVLJ
	cRBc82GUdvui7ZcRBj46YHX7QdDtID0ESNudtLghUaIC9j/lNdym6tOdMr6kRIEeU2uv
	SkeRJcl5R3SjnVUpQ5DJ+N5SERJHd476gRdfI+lBvlgwM9gQNaqm59KZPvfPmd4DHnZw
	bSeZGf08xSMFYH4At/NGkPznVym266wIkWBI0tTH3U7UHeox4bldaeXpsqDYCJ6UXZYM
	DJ7Q==
X-Received: by 10.180.76.132 with SMTP id k4mr36078191wiw.1.1404729934758;
	Mon, 07 Jul 2014 03:45:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o9sm67063354wib.22.2014.07.07.03.45.34 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jul 2014 03:45:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Jul 2014 12:45:18 +0200
Message-Id: <1404729919-2903-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1404729919-2903-1-git-send-email-Martin.Jansa@gmail.com>
References: <1404729919-2903-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 6/7] recipes: add missing intltool-native dependency
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
X-List-Received-Date: Mon, 07 Jul 2014 10:45:45 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb                         | 2 +-
 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb      | 2 +-
 .../recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
index 611e83e..a54a3a2 100644
--- a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
+++ b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Take photos and videos with your webcam, with fun graphical effects"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
 
-DEPENDS = "gtk+ gstreamer gst-plugins-base libcanberra udev librsvg gnome-desktop evolution-data-server"
+DEPENDS = "gtk+ gstreamer gst-plugins-base libcanberra udev librsvg gnome-desktop evolution-data-server intltool-native"
 
 PR = "r2"
 
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
index 94bfa3b..4fd38a0 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 PR = "r1"
 
 SECTION = "x11/gnome"
-DEPENDS = "obexd gnome-doc-utils-native gnome-doc-utils gconf gtk+ dbus-glib libunique libnotify bluez4 gnome-keyring virtual/libx11 libxi"
+DEPENDS = "obexd gnome-doc-utils-native gnome-doc-utils gconf gtk+ dbus-glib libunique libnotify bluez4 gnome-keyring virtual/libx11 libxi intltool-native"
 
 inherit gnomebase gtk-icon-cache
 
diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
index 1c14952..ce4b64e 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11/gnome"
 PR = "r2"
 
-DEPENDS = "libgtop gtkmm glibmm gnome-doc-utils gnome-icon-theme libwnck gtk+ dbus-glib librsvg"
+DEPENDS = "libgtop gtkmm glibmm gnome-doc-utils gnome-icon-theme libwnck gtk+ dbus-glib librsvg intltool-native"
 
 inherit gnome
 SRC_URI[archive.md5sum] = "3f0bca9b0ebc7a365466851cd580d167"
-- 
2.0.0


