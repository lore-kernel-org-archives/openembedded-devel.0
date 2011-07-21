Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qjywy-0006ho-Ob
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jul 2011 21:30:26 +0200
Received: by ewy5 with SMTP id 5so1514762ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2011 12:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=LF+VngELa/Sa/WrN1a+6IByZt+na1mtG2ZtsaYvGGbs=;
	b=mROOYSVJT7uah4SDbkgNYc06AlAMoTQlMCkokTYebcq7J3IFnkBMhDYJuFxjCQ0ic/
	cEMP6AytQJj70UiX3Ls5cvEtjrVF/HA5R4tMrr9zvfjVsOEppyjeG6sUfQpSlYuNp5Bz
	mIHQCFK4g9vbisKu5VbS34jra52jkUPiT9bsE=
Received: by 10.204.65.210 with SMTP id k18mr187265bki.319.1311276224725;
	Thu, 21 Jul 2011 12:23:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q1sm4658726faa.1.2011.07.21.12.23.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jul 2011 12:23:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jul 2011 21:23:16 +0200
Message-Id: <324de1646ac31c8a9f01c0004db85350b517224e.1311276122.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <6d30a1f529038189a2f6e228066050d6b203baac.1311276122.git.Martin.Jansa@gmail.com>
References: <6d30a1f529038189a2f6e228066050d6b203baac.1311276122.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1311276122.git.Martin.Jansa@gmail.com>
References: <cover.1311276122.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/4] foxtrotgps: fix build with curl-7.21.8 and newer
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
X-List-Received-Date: Thu, 21 Jul 2011 19:30:26 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../foxtrotgps-1.0.1/remove.unused.header.patch    |   40 ++++++++++++++++++++
 .../foxtrotgps/foxtrotgps_1.0.1.bb                 |    6 ++-
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/foxtrotgps/foxtrotgps-1.0.1/remove.unused.header.patch

diff --git a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps-1.0.1/remove.unused.header.patch b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps-1.0.1/remove.unused.header.patch
new file mode 100644
index 0000000..d80d321
--- /dev/null
+++ b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps-1.0.1/remove.unused.header.patch
@@ -0,0 +1,40 @@
+curl/types.h was removed in
+https://github.com/bagder/curl/commit/2ef7a28a71f819343afefa721e5497119fb2cee0#include/curl
+and is not available in curl-7.21.8 and newer
+
+=== modified file 'foxtrotgps-1.0.1/src/friends.c'
+--- foxtrotgps-1.0.1.orig/src/friends.c	2011-05-01 20:51:37 +0000
++++ foxtrotgps-1.0.1/src/friends.c	2011-07-21 15:34:03 +0000
+@@ -17,7 +17,6 @@
+ #include <gtk/gtk.h>
+ 
+ #include <curl/curl.h>
+-#include <curl/types.h>
+ #include <curl/easy.h>
+ 
+ 
+
+=== modified file 'foxtrotgps-1.0.1/src/tile_management.c'
+--- foxtrotgps-1.0.1.orig/src/tile_management.c	2011-06-02 11:25:49 +0000
++++ foxtrotgps-1.0.1/src/tile_management.c	2011-07-21 15:34:06 +0000
+@@ -8,7 +8,6 @@
+ #include <glib/gprintf.h>
+ #include <string.h>
+ #include <curl/curl.h>
+-#include <curl/types.h> 
+ #include <curl/easy.h> 
+ #include <math.h>
+ #include "globals.h"
+
+=== modified file 'foxtrotgps-1.0.1/src/util.h'
+--- foxtrotgps-1.0.1.orig/src/util.h	2010-04-13 02:20:30 +0000
++++ foxtrotgps-1.0.1/src/util.h	2011-07-21 15:34:05 +0000
+@@ -2,7 +2,6 @@
+ #include <gtk/gtk.h>
+ 
+ #include <curl/curl.h>
+-#include <curl/types.h>
+ #include <curl/easy.h>
+ int
+ sql_execute(char *db_name, char *sql, int (*cb_func)(void*,int,char**,char**));
+
diff --git a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.0.1.bb b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.0.1.bb
index c517f08..2a8293e 100644
--- a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.0.1.bb
+++ b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.0.1.bb
@@ -5,11 +5,13 @@ SECTION = "x11/applications"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "curl gtk+ gconf libglade sqlite3 libexif gpsd"
+PR = "r1"
 
-SRC_URI = "http://www.foxtrotgps.org/releases/${P}.tar.gz"
+SRC_URI = "http://www.foxtrotgps.org/releases/${P}.tar.gz \
+           file://remove.unused.header.patch"
 SRC_URI[md5sum] = "982d14cdb0439cc4d6aa6cefc232124d"
 SRC_URI[sha256sum] = "059158fd8e61137e2e6d6e01685add7fb85cce8483faa99efb01187f2ba50841"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig perlnative
 
 RRECOMMENDS_${PN} = "gpsd"
-- 
1.7.6



