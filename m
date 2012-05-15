Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SUFrN-0006KO-N0
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 13:24:09 +0200
Received: by bkcjm2 with SMTP id jm2so4963289bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 04:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=xo5/rgtG9UGrnI0DlTXGrw2Zv7ljNd25G9BUVEaLhUU=;
	b=GNYrTmdlAL15MYo2whywOaXXYoaCOULatF5OGws+ockt6P4/GqLD7drI28Jk4g9caS
	huzZIgLwF8y+Z9P3vgrx8CxuB5NukU30l662/apXHvp+ex906h5kr1dava5uda7XzaYw
	CgWfWynqa2OyOkaxTYluyNG7xx3FbyQ0qPXfe7f+zhToc6bi+OBXpTsqjbN87wEvf5pu
	ALN7XG2mqa/W0Mp7KQIPYknw2db/h4aLzH9JWS790oO5v8llXJ0z30c2juNTevKHRZ/F
	aaGo3l0LzsjKp4jQZII6d4q0ub6blBeLLeYPRCTRAMfAKCDGmUJOrkyHOu9uN0vXl8yx
	UOLw==
Received: by 10.205.131.7 with SMTP id ho7mr4406892bkc.62.1337080449447;
	Tue, 15 May 2012 04:14:09 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id z14sm40842837bky.15.2012.05.15.04.14.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 May 2012 04:14:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 May 2012 13:14:04 +0200
Message-Id: <1337080444-4025-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-gnome] gnome-system-monitor: make it build by aligning includes
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
X-List-Received-Date: Tue, 15 May 2012 11:24:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../files/0001-Fix-glib-includes.patch             |  101 ++++++++++++++++++++
 .../gnome-system-monitor_2.28.2.bb                 |    2 +
 2 files changed, 103 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-Fix-glib-includes.patch

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-Fix-glib-includes.patch b/meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-Fix-glib-includes.patch
new file mode 100644
index 0000000..adcc533
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-Fix-glib-includes.patch
@@ -0,0 +1,101 @@
+From 8587e35af52f7773f62361be2e72ddf286a59185 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Tue, 15 May 2012 13:02:02 +0200
+Subject: [PATCH] Fix glib includes
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+Upstream status: unknown
+
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/interface.h       |    2 +-
+ src/load-graph.h      |    2 +-
+ src/lsof.h            |    2 +-
+ src/openfiles.h       |    2 +-
+ src/procman_gnomesu.h |    2 +-
+ src/util.cpp          |    2 +-
+ 6 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/interface.h b/src/interface.h
+index 4bda35a..b26b670 100644
+--- a/src/interface.h
++++ b/src/interface.h
+@@ -20,7 +20,7 @@
+ #ifndef _PROCMAN_INTERFACE_H_
+ #define _PROCMAN_INTERFACE_H_
+ 
+-#include <glib/gtypes.h>
++#include <glib.h>
+ #include <gtk/gtk.h>
+ #include "procman.h"
+ 
+diff --git a/src/load-graph.h b/src/load-graph.h
+index 6111c78..6e7a599 100644
+--- a/src/load-graph.h
++++ b/src/load-graph.h
+@@ -1,7 +1,7 @@
+ #ifndef _PROCMAN_LOAD_GRAPH_H_
+ #define _PROCMAN_LOAD_GRAPH_H_
+ 
+-#include <glib/gtypes.h>
++#include <glib.h>
+ #include <glibtop/cpu.h>
+ 
+ enum
+diff --git a/src/lsof.h b/src/lsof.h
+index ad7f111..da420e2 100644
+--- a/src/lsof.h
++++ b/src/lsof.h
+@@ -1,7 +1,7 @@
+ #ifndef H_PROCMAN_LSOF_1161179202
+ #define H_PROCMAN_LSOF_1161179202
+ 
+-#include <glib/gmacros.h>
++#include <glib.h>
+ #include "procman.h"
+ 
+ void procman_lsof(ProcData *data);
+diff --git a/src/openfiles.h b/src/openfiles.h
+index 38b1cc8..a8b7b05 100644
+--- a/src/openfiles.h
++++ b/src/openfiles.h
+@@ -1,7 +1,7 @@
+ #ifndef _OPENFILES_H_
+ #define _OPENFILES_H_
+ 
+-#include <glib/gtypes.h>
++#include <glib.h>
+ 
+ #include "procman.h"
+ 
+diff --git a/src/procman_gnomesu.h b/src/procman_gnomesu.h
+index fec2650..474ca9a 100644
+--- a/src/procman_gnomesu.h
++++ b/src/procman_gnomesu.h
+@@ -1,7 +1,7 @@
+ #ifndef H_GNOME_SYSTEM_MONITOR_GNOMESU_H_1132171917
+ #define H_GNOME_SYSTEM_MONITOR_GNOMESU_H_1132171917
+ 
+-#include <glib/gtypes.h>
++#include <glib.h>
+ 
+ gboolean
+ procman_gnomesu_create_root_password_dialog(const char * message);
+diff --git a/src/util.cpp b/src/util.cpp
+index 9b1c9f5..90073fe 100644
+--- a/src/util.cpp
++++ b/src/util.cpp
+@@ -1,7 +1,7 @@
+ #include <config.h>
+ 
+ #include <glib/gi18n.h>
+-#include <glib/gstring.h>
++#include <glib.h>
+ #include <gtk/gtk.h>
+ 
+ #include <glibtop/proctime.h>
+-- 
+1.7.6.5
+
diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
index aa6731d..98b7b8d 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
@@ -2,12 +2,14 @@ DESCRIPTION = "Gnome system monitor"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11/gnome"
+PR = "r1"
 
 DEPENDS = "libgtop gtkmm glibmm gnome-doc-utils gnome-icon-theme libwnck gtk+ dbus-glib librsvg"
 
 inherit gnome
 SRC_URI[archive.md5sum] = "3f0bca9b0ebc7a365466851cd580d167"
 SRC_URI[archive.sha256sum] = "b628edfd39e3a6b374ce133f367d3568475eb4e981a367f4f9d62a9784e5ae59"
+SRC_URI += "file://0001-Fix-glib-includes.patch"
 
 do_configure_prepend() {
         sed -i -e s:help::g ${S}/Makefile.am
-- 
1.7.6.5



