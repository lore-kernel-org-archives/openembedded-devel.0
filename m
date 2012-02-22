Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S09cR-0001Yv-QU
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 11:40:19 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so2560024eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 02:32:02 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.14.205 as permitted sender) client-ip=10.213.14.205; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.14.205 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.14.205])
	by 10.213.14.205 with SMTP id h13mr4725437eba.5.1329906722137 (num_hops
	= 1); Wed, 22 Feb 2012 02:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=+drTW0oXog0HGD5aoXeGwZ/uSMKDghd5OxOjWzb4Rzg=;
	b=HzoBQnowXUmr2vMJlyKq763uSlSzDIYx2B8hLDWYVD876be/E1jndypK2tWm9NZuJo
	e1Be7XDt2LlSYI+hs2TVu577ZFpYvY9Lt0XM0hjNIMzDrfyoLQystp+e8C6nABqEb/fN
	pPCKUwuvDGtEXJEw4AQBhhZYZ7DnMl83Uyn4E=
Received: by 10.213.14.205 with SMTP id h13mr3770593eba.5.1329906721999;
	Wed, 22 Feb 2012 02:32:01 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm101130595eeb.7.2012.02.22.02.32.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Feb 2012 02:32:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2012 11:31:53 +0100
Message-Id: <9b2e009e52bb6afa05eb41b807ddbfa2e092dace.1329906640.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <cover.1329906639.git.Martin.Jansa@gmail.com>
References: <cover.1329906639.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] foxtrotgps: upgrade to 1.1.0
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
X-List-Received-Date: Wed, 22 Feb 2012 10:40:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../foxtrotgps-1.0.1/remove.unused.header.patch    |   40 --------------------
 .../{foxtrotgps_1.0.1.bb => foxtrotgps_1.1.0.bb}   |    8 +--
 2 files changed, 3 insertions(+), 45 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/foxtrotgps/foxtrotgps-1.0.1/remove.unused.header.patch
 rename meta-oe/recipes-navigation/foxtrotgps/{foxtrotgps_1.0.1.bb => foxtrotgps_1.1.0.bb} (61%)

diff --git a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps-1.0.1/remove.unused.header.patch b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps-1.0.1/remove.unused.header.patch
deleted file mode 100644
index d80d321..0000000
--- a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps-1.0.1/remove.unused.header.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-curl/types.h was removed in
-https://github.com/bagder/curl/commit/2ef7a28a71f819343afefa721e5497119fb2cee0#include/curl
-and is not available in curl-7.21.8 and newer
-
-=== modified file 'foxtrotgps-1.0.1/src/friends.c'
---- foxtrotgps-1.0.1.orig/src/friends.c	2011-05-01 20:51:37 +0000
-+++ foxtrotgps-1.0.1/src/friends.c	2011-07-21 15:34:03 +0000
-@@ -17,7 +17,6 @@
- #include <gtk/gtk.h>
- 
- #include <curl/curl.h>
--#include <curl/types.h>
- #include <curl/easy.h>
- 
- 
-
-=== modified file 'foxtrotgps-1.0.1/src/tile_management.c'
---- foxtrotgps-1.0.1.orig/src/tile_management.c	2011-06-02 11:25:49 +0000
-+++ foxtrotgps-1.0.1/src/tile_management.c	2011-07-21 15:34:06 +0000
-@@ -8,7 +8,6 @@
- #include <glib/gprintf.h>
- #include <string.h>
- #include <curl/curl.h>
--#include <curl/types.h> 
- #include <curl/easy.h> 
- #include <math.h>
- #include "globals.h"
-
-=== modified file 'foxtrotgps-1.0.1/src/util.h'
---- foxtrotgps-1.0.1.orig/src/util.h	2010-04-13 02:20:30 +0000
-+++ foxtrotgps-1.0.1/src/util.h	2011-07-21 15:34:05 +0000
-@@ -2,7 +2,6 @@
- #include <gtk/gtk.h>
- 
- #include <curl/curl.h>
--#include <curl/types.h>
- #include <curl/easy.h>
- int
- sql_execute(char *db_name, char *sql, int (*cb_func)(void*,int,char**,char**));
-
diff --git a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.0.1.bb b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.0.bb
similarity index 61%
rename from meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.0.1.bb
rename to meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.0.bb
index 2a8293e..2580abc 100644
--- a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.0.1.bb
+++ b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.0.bb
@@ -5,12 +5,10 @@ SECTION = "x11/applications"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "curl gtk+ gconf libglade sqlite3 libexif gpsd"
-PR = "r1"
 
-SRC_URI = "http://www.foxtrotgps.org/releases/${P}.tar.gz \
-           file://remove.unused.header.patch"
-SRC_URI[md5sum] = "982d14cdb0439cc4d6aa6cefc232124d"
-SRC_URI[sha256sum] = "059158fd8e61137e2e6d6e01685add7fb85cce8483faa99efb01187f2ba50841"
+SRC_URI = "http://www.foxtrotgps.org/releases/${P}.tar.gz"
+SRC_URI[md5sum] = "1585d332ae546a0f84e8327ac21b27b9"
+SRC_URI[sha256sum] = "2d0d66d3e6d3c6ca1c8e5d82129182a49691b9622067b7c5edf82d808ebf1a77"
 
 inherit autotools pkgconfig perlnative
 
-- 
1.7.8.4



