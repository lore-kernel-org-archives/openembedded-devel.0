Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1AA306600B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 19:58:29 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5NJwPdT009008 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 20:58:25 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8n-YGmFkBk9T
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 20:58:25 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5NJwKYb008977
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 20:58:22 +0100
Message-ID: <1403553494.2104.119.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Jun 2014 20:58:14 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [meta-oe][PATCH] recipes: Add missing intltool-native dependencies
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
X-List-Received-Date: Mon, 23 Jun 2014 19:58:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
index ce4dd90..26fbeb2 100644
--- a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
+++ b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "GNOME Terminal"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5b51eba4ba4cafe64073227530c061ed"
-DEPENDS = "gtk+ glib-2.0 startup-notification dbus-glib vte gnome-doc-utils"
+DEPENDS = "gtk+ glib-2.0 startup-notification dbus-glib vte gnome-doc-utils intltool-native"
 PR = "r1"
 
 inherit gnome
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.10.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.10.1.bb
index cf0ab0c..5c0e07c 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.10.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.10.1.bb
@@ -2,7 +2,7 @@ require gvfs.inc
 
 BPN = "gvfs"
 
-DEPENDS = "gvfs gnome-disk-utility libgnome-keyring"
+DEPENDS = "gvfs gnome-disk-utility libgnome-keyring intltool-native"
 PR = "${INC_PR}.0"
 
 # we need gdu files only: reduce files to delete in libexecdir
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomeui.inc b/meta-gnome/recipes-gnome/libgnome/libgnomeui.inc
index b000d72..26997b8 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomeui.inc
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomeui.inc
@@ -3,7 +3,7 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 SECTION = "x11/gnome/libs"
-DEPENDS = "libgnome libgnomecanvas libbonoboui libgnome-keyring"
+DEPENDS = "libgnome libgnomecanvas libbonoboui libgnome-keyring intltool-native"
 
 inherit gnome 
 



