Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sv6OK-0002QG-Jv
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Jul 2012 14:45:09 +0200
Received: by wibhq4 with SMTP id hq4so388879wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jul 2012 05:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=qncNIZ+S04v9b3n73BDDLVsg35nbGwReM8f/LdDYb/8=;
	b=lyvyTEpi/BD/kJ0wvr3kAhLYUdP9VFewAddscnJoKqod4gl86AIirAsNCtH+tMr5//
	1R6bcnl8QBJu+0yrkimYqo+8kZ/61dduVx9snxIxNgB1Sa1NItZuWH8iNjThIz0BRnkx
	jTF95X35dhqZunnAC444Acad8RXQbKWFQFc9+9xGv6FeJid1hkad+n2n/k9cRKtRMcsL
	xnjP4xTjTRgylRhikxXReDArF+UfkNXSr830qrGJrk6Ugai115IZAEeOuaZEA686Pl5d
	og8/BDOc58Y0jU08fGh+q4VaIKYD82LHbtbKpX+2AS8C/Vqli7U6nP5VNdf8G7V9MvDA
	ygig==
Received: by 10.180.20.99 with SMTP id m3mr13304693wie.16.1343478815651;
	Sat, 28 Jul 2012 05:33:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ck9sm6070023wib.2.2012.07.28.05.33.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Jul 2012 05:33:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Jul 2012 14:33:13 +0200
Message-Id: <4a5a3a693bc3a78813f11c7858b3e9aa957d1bb9.1343478744.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343478744.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343478744.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/5] libwnck: use gobject-introspection-stub instead of -native which was removed in oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Jul 2012 12:45:09 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb |   10 +++-------
 meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb |   10 ++--------
 2 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb
index e2a3e3d..e54b8d3 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.0.2.bb
@@ -5,14 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 BPN = "libwnck"
 
 SECTION = "x11/libs"
-DEPENDS = "gobject-introspection-native gtk+3 gdk-pixbuf-native"
+DEPENDS = "gobject-introspection-stub gtk+3 gdk-pixbuf-native"
+
+PR = "r1"
 
 inherit gnome
 SRC_URI[archive.md5sum] = "e4ea87320dd0600a81c50186e3804aae"
 SRC_URI[archive.sha256sum] = "4946b612c22d53238810d431f1b05c21f073f201edfd247ff74e2fa228618083"
-
-EXTRA_OECONF += "--enable-introspection=no"
-
-do_configure_prepend() {
-	sed -i '/GOBJECT_INTROSPECTION_CHECK([0.6.14])/d' configure.ac
-}
diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb b/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb
index 6c8ca28..935d4a3 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck_2.30.5.bb
@@ -2,17 +2,11 @@ DESCRIPTION = "Window navigation construction toolkit"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-PR = "r1"
+PR = "r2"
 
 SECTION = "x11/libs"
-DEPENDS = "gobject-introspection-native gtk+ gdk-pixbuf-native"
+DEPENDS = "gobject-introspection-stub gtk+ gdk-pixbuf-native"
 
 inherit gnome
 SRC_URI[archive.md5sum] = "4162d5b96151e6d24ec02ae3a822203c"
 SRC_URI[archive.sha256sum] = "56b6681e89cd45491bb640165d62276d81369a08974042b26645dc1e0e954cc1"
-
-EXTRA_OECONF += "--enable-introspection=no"
-
-do_configure_prepend() {
-	sed -i '/GOBJECT_INTROSPECTION_CHECK([0.6.14])/d' configure.ac
-}
-- 
1.7.8.6



