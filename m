Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qjsfg-0008Bb-TV
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jul 2011 14:48:08 +0200
Received: by fxh10 with SMTP id 10so3553272fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2011 05:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=tR9ASP7btOwfKTJlaWmGtMenL9KVXlIbczlPKe+qIMs=;
	b=Bm9tpgmJ81j6xYf90kfT92dk0gsTtiZoH0jfVTJbZ/DtZT5nfRkhCy1JET/NDcoEcE
	kl4RpLzKWpn7KyqCArlK0s2zMbfaaa531dUjr6pbyVUEXszCQXVW6UC+QS9J6xZR6bNH
	aPk9yecsEd2b3lNsIB/5t1MwDZtSmCVtBk01c=
Received: by 10.204.78.7 with SMTP id i7mr66064bkk.166.1311252238428;
	Thu, 21 Jul 2011 05:43:58 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q1sm4472555faa.3.2011.07.21.05.43.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jul 2011 05:43:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jul 2011 14:43:45 +0200
Message-Id: <1311252225-21320-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
Subject: [meta-oe][PATCH] tangogps: fix build with curl-7.21.8 and newer
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
X-List-Received-Date: Thu, 21 Jul 2011 12:48:09 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../tangogps-0.99.4/remove.unused.header.patch     |   37 ++++++++++++++++++++
 .../recipes-navigation/tangogps/tangogps_0.99.4.bb |    4 ++-
 2 files changed, 40 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/tangogps/tangogps-0.99.4/remove.unused.header.patch

diff --git a/meta-oe/recipes-navigation/tangogps/tangogps-0.99.4/remove.unused.header.patch b/meta-oe/recipes-navigation/tangogps/tangogps-0.99.4/remove.unused.header.patch
new file mode 100644
index 0000000..db8af84
--- /dev/null
+++ b/meta-oe/recipes-navigation/tangogps/tangogps-0.99.4/remove.unused.header.patch
@@ -0,0 +1,37 @@
+curl/types.h was removed in 
+https://github.com/bagder/curl/commit/2ef7a28a71f819343afefa721e5497119fb2cee0#include/curl
+and is not available in curl-7.21.8 and newer
+
+diff -uNr tangogps-0.99.4.orig//src/util.h tangogps-0.99.4/src/util.h
+--- tangogps-0.99.4.orig//src/util.h	2009-11-06 13:16:05.000000000 +0100
++++ tangogps-0.99.4/src/util.h	2011-07-21 14:36:59.208792227 +0200
+@@ -2,7 +2,6 @@
+ #include <gtk/gtk.h>
+ 
+ #include <curl/curl.h>
+-#include <curl/types.h>
+ #include <curl/easy.h>
+ int
+ sql_execute(char *db_name, char *sql, int (*cb_func)(void*,int,char**,char**));
+diff -uNr tangogps-0.99.4.orig//src/friends.c tangogps-0.99.4/src/friends.c
+--- tangogps-0.99.4.orig//src/friends.c	2010-06-25 11:40:04.000000000 +0200
++++ tangogps-0.99.4/src/friends.c	2011-07-21 14:39:14.711789408 +0200
+@@ -17,7 +17,6 @@
+ #include <gtk/gtk.h>
+ 
+ #include <curl/curl.h>
+-#include <curl/types.h>
+ #include <curl/easy.h>
+ 
+ 
+diff -uNr tangogps-0.99.4.orig//src/tile_management.c tangogps-0.99.4/src/tile_management.c
+--- tangogps-0.99.4.orig//src/tile_management.c	2010-06-25 11:40:05.000000000 +0200
++++ tangogps-0.99.4/src/tile_management.c	2011-07-21 14:38:45.030790011 +0200
+@@ -5,7 +5,6 @@
+ #include <glib/gprintf.h>
+ #include <string.h>
+ #include <curl/curl.h>
+-#include <curl/types.h> 
+ #include <curl/easy.h> 
+ #include <math.h>
+ #include "globals.h"
diff --git a/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb b/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb
index e04f0a5..3a1ea3d 100644
--- a/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb
+++ b/meta-oe/recipes-navigation/tangogps/tangogps_0.99.4.bb
@@ -5,8 +5,10 @@ SECTION = "x11/applications"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "curl gtk+ gconf sqlite3 libexif libsoup-2.4 bluez4"
+PR = "r1"
 
-SRC_URI = "http://www.tangogps.org/downloads/${P}.tar.gz"
+SRC_URI = "http://www.tangogps.org/downloads/${P}.tar.gz \
+           file://remove.unused.header.patch"
 SRC_URI[md5sum] = "0f07ede94a21eb84f5e017fa88a1fc3d"
 SRC_URI[sha256sum] = "660fdf89ef3c379f2fc0c2a9d0c9d3bfa5345835786b72bf9f513ba9ec2c812a"
 
-- 
1.7.6



