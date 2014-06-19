Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 726FB7014A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 09:59:54 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id t60so2129668wes.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 02:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aOz9jlPgbUT8xR2NdBxf+a2DkT1bUFvWqGYxZz0EAzs=;
	b=v9japgfjPgmo57SHebYuGyhde1kGXK+I1Un9ameMiv74TNLEZB6gkQQ16wG3tNsJrd
	+j2PiCKg1wd61u2ZT3mAm/lOhLcuyNVv145xfx7TW8C6Fk6qPQ9kwr+EAhrvgd8cim8M
	C0sRPF9jGbhrxtiEmJIXhYM/hDUpUv1QI5GEFJNnrXz7ynlDKZ0l9trabGhRTNl+Aocg
	8OqxFeLBtFl584lgUzJJFOTlxRE7t57GFUQ4KDjNtwc1FH9Bnmy5vrhsIgeWDNTrmOtB
	5Y9EB4OTNWJiJzervNS2CFRnXukSaVX2OZUPm4oOKy6cAMVzrdsgQ8RGL0nU/sBnjunj
	D7+Q==
X-Received: by 10.180.184.36 with SMTP id er4mr5020214wic.37.1403171995846;
	Thu, 19 Jun 2014 02:59:55 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	nb8sm31874005wic.18.2014.06.19.02.59.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 02:59:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:30 +0200
Message-Id: <1403171993-26208-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 02/25] libgnomekbd, gnome-control-center, gnome-settings-daemon: Blacklist because of broken libgnomekbd with B!=S
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
X-List-Received-Date: Thu, 19 Jun 2014 09:59:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb   | 2 ++
 .../recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb | 2 ++
 meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb                 | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
index 5cc7ad1..ad0318e 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
@@ -2,6 +2,8 @@ SUMMARY = "GNOME control center"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
+PNBLACKLIST[gnome-control-center] = "BROKEN: depends on broken libgnomekbd"
+
 DEPENDS = "desktop-file-utils-native gnome-menus libunique dbus-glib gnome-desktop libxml2 metacity gconf gnome-settings-daemon librsvg pango libgnomekbd libxklavier libcanberra libgtop libxscrnsaver"
 
 PR = "r1"
diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
index 34c9197..8fdadcd 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 PR = "r7"
 
+PNBLACKLIST[gnome-control-center] = "BROKEN: depends on broken libgnomekbd"
+
 DEPENDS = "libxxf86misc libsndfile1 libxtst glib-2.0 polkit gtk+ gconf dbus-glib libnotify libgnomekbd libxklavier gnome-doc-utils gnome-desktop"
 
 inherit gnome
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
index 48ec450..e9ca2a7 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
@@ -6,6 +6,8 @@ SECTION = "x11/gnome/libs"
 
 DEPENDS = "gconf gtk+ glib-2.0 libxklavier"
 
+PNBLACKLIST[libgnomekbd] = "BROKEN: wasn't updated to work with B!=S"
+
 inherit gnome
 
 SRC_URI[archive.md5sum] = "de32a6e3e3464b566eecdc4332bf34bd"
-- 
2.0.0


