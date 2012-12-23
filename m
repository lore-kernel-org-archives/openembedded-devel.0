Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tmkp0-0001Es-1g
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:38:26 +0100
Received: by mail-ea0-f174.google.com with SMTP id e13so2511374eaa.19
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=K4dYxBkzK420dPOfQ8fZTe8jGwc3j/4xpZgnTAtLRr0=;
	b=AhRiZBz6HWZL+bVMB4Zl/oc4loQoez/kfkC4N1Ap9QNkvA/QvcxjG+axSVTiRBQEAq
	S9p12TxODHMut7yXEDg72CSIzCPq9KKYXBXIGOtnDu6WUPyd4PmSkrXRcoKlSu55U7aF
	u+aXvGYeayDCSeH0/OE8PjlKbxMqWST39kAFIKTlWjpss6bqit5YXXs0F9SiSox4y3lf
	v4avCoWfrHlk96UUQYZgXCVNpeYnt91BRJgnW9Fm2TO10siUnL42fAt4kPZShWfZCnB1
	WFPWUPGvgX+p5HYZr8GXEsFYIQahdkDmb9PbCryRQH30yi73Uki5RcRxVOmlVRgvbIYz
	PrNw==
X-Received: by 10.14.216.70 with SMTP id f46mr48048163eep.12.1356265417767;
	Sun, 23 Dec 2012 04:23:37 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id l3sm34564368eem.14.2012.12.23.04.23.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:23:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:36 +0100
Message-Id: <7f35fdb0067843e28c60251b5c50cff256b7b310.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 11/30] omgps: fix build with gdk-pixbuf-2.26.5 from oe-core
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
X-List-Received-Date: Sun, 23 Dec 2012 12:38:28 -0000

* also add Upstream-Status to other omgps patches

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../omgps/omgps/fix.build.with.glib.2.34.patch            |  3 +++
 .../recipes-navigation/omgps/omgps/fix.capability.patch   |  3 +++
 meta-oe/recipes-navigation/omgps/omgps/gcc-4.4.patch      |  3 +++
 .../omgps/omgps/gdk-pixbuf-2.26.5.patch                   | 15 +++++++++++++++
 .../omgps/omgps/sysfs.node.2.6.32.patch                   |  3 +++
 .../omgps/omgps/use.unused.variable.patch                 |  3 +++
 meta-oe/recipes-navigation/omgps/omgps_svn.bb             |  3 ++-
 7 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-navigation/omgps/omgps/gdk-pixbuf-2.26.5.patch

diff --git a/meta-oe/recipes-navigation/omgps/omgps/fix.build.with.glib.2.34.patch b/meta-oe/recipes-navigation/omgps/omgps/fix.build.with.glib.2.34.patch
index e953663..ec3bde0 100644
--- a/meta-oe/recipes-navigation/omgps/omgps/fix.build.with.glib.2.34.patch
+++ b/meta-oe/recipes-navigation/omgps/omgps/fix.build.with.glib.2.34.patch
@@ -1,3 +1,6 @@
+Upstream-Status: Submitted
+https://code.google.com/p/omgps/issues/detail?id=15
+
 diff -uNr omgps.orig/src/dbus_intf.c omgps/src/dbus_intf.c
 --- omgps.orig/src/dbus_intf.c	2011-12-12 12:22:47.000000000 +0100
 +++ omgps/src/dbus_intf.c	2012-11-14 14:44:45.435381443 +0100
diff --git a/meta-oe/recipes-navigation/omgps/omgps/fix.capability.patch b/meta-oe/recipes-navigation/omgps/omgps/fix.capability.patch
index 56ec3a4..3ed86d8 100644
--- a/meta-oe/recipes-navigation/omgps/omgps/fix.capability.patch
+++ b/meta-oe/recipes-navigation/omgps/omgps/fix.capability.patch
@@ -1,3 +1,6 @@
+Upstream-Status: Submitted
+https://code.google.com/p/omgps/issues/detail?id=15
+
 we need to include config.h first to know if HAVE_SYS_CAPABILITY_H is enabled or no, otherwise
 sys/capability.h is not included and later used
 | src/network.c: In function 'can_ping':
diff --git a/meta-oe/recipes-navigation/omgps/omgps/gcc-4.4.patch b/meta-oe/recipes-navigation/omgps/omgps/gcc-4.4.patch
index 3eae960..41f6471 100644
--- a/meta-oe/recipes-navigation/omgps/omgps/gcc-4.4.patch
+++ b/meta-oe/recipes-navigation/omgps/omgps/gcc-4.4.patch
@@ -1,3 +1,6 @@
+Upstream-Status: Submitted
+https://code.google.com/p/omgps/issues/detail?id=15
+
 diff -uNr omgps.orig/src/include/map_repo.h omgps/src/include/map_repo.h
 --- omgps.orig/src/include/map_repo.h	2009-07-20 19:54:08.000000000 +0200
 +++ omgps/src/include/map_repo.h	2010-01-17 14:55:24.000000000 +0100
diff --git a/meta-oe/recipes-navigation/omgps/omgps/gdk-pixbuf-2.26.5.patch b/meta-oe/recipes-navigation/omgps/omgps/gdk-pixbuf-2.26.5.patch
new file mode 100644
index 0000000..6880805
--- /dev/null
+++ b/meta-oe/recipes-navigation/omgps/omgps/gdk-pixbuf-2.26.5.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Submitted
+https://code.google.com/p/omgps/issues/detail?id=15
+
+diff -uNr omgps/src/tab_scratch.c omgps.new/src/tab_scratch.c
+--- omgps/src/tab_scratch.c	2012-12-22 18:13:25.994788128 +0100
++++ omgps.new/src/tab_scratch.c	2012-12-22 18:12:45.876790644 +0100
+@@ -51,7 +51,7 @@
+ 	}
+ 
+ 	gboolean ret = gdk_pixbuf_save (pixbuf, buf, SCREENSHOT_FILE_TYPE, &err, "tEXt::Software", "omgps", NULL);
+-	gdk_pixbuf_unref(pixbuf);
++	g_object_unref(pixbuf);
+ 
+ 	if (ret) {
+ 		char buf1[128];
diff --git a/meta-oe/recipes-navigation/omgps/omgps/sysfs.node.2.6.32.patch b/meta-oe/recipes-navigation/omgps/omgps/sysfs.node.2.6.32.patch
index d18a2fd..290c5e6 100644
--- a/meta-oe/recipes-navigation/omgps/omgps/sysfs.node.2.6.32.patch
+++ b/meta-oe/recipes-navigation/omgps/omgps/sysfs.node.2.6.32.patch
@@ -1,3 +1,6 @@
+Upstream-Status: Submitted
+https://code.google.com/p/omgps/issues/detail?id=15
+
 diff -uNr omgps.orig//src/uart.c omgps/src/uart.c
 --- omgps.orig//src/uart.c	2010-08-22 23:34:09.000000000 +0200
 +++ omgps/src/uart.c	2010-08-22 23:33:54.000000000 +0200
diff --git a/meta-oe/recipes-navigation/omgps/omgps/use.unused.variable.patch b/meta-oe/recipes-navigation/omgps/omgps/use.unused.variable.patch
index 73d6dba..3ccb14e 100644
--- a/meta-oe/recipes-navigation/omgps/omgps/use.unused.variable.patch
+++ b/meta-oe/recipes-navigation/omgps/omgps/use.unused.variable.patch
@@ -1,3 +1,6 @@
+Upstream-Status: Submitted
+https://code.google.com/p/omgps/issues/detail?id=15
+
 --- a/src/settings.c	2011-12-12 13:21:30.573400795 +0100
 +++ b/src/settings.c	2011-12-12 14:11:05.269606119 +0100
 @@ -278,6 +278,9 @@
diff --git a/meta-oe/recipes-navigation/omgps/omgps_svn.bb b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
index 0d788b6..7c787a4 100644
--- a/meta-oe/recipes-navigation/omgps/omgps_svn.bb
+++ b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "gtk+ python-pygobject dbus-glib"
 SRCREV = "109"
 PV = "0.1+svnr${SRCPV}"
-PR = "r1"
+PR = "r2"
 S = "${WORKDIR}/${PN}"
 
 do_configure_prepend() {
@@ -20,6 +20,7 @@ SRC_URI = "svn://omgps.googlecode.com/svn/trunk;module=omgps;protocol=http \
            file://fix.capability.patch \
            file://use.unused.variable.patch \
            file://fix.build.with.glib.2.34.patch \
+           file://gdk-pixbuf-2.26.5.patch \
 "
 
 inherit autotools
-- 
1.8.0.2



