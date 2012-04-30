Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOwXn-0004q0-3L
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 21:45:59 +0200
Received: by wgbdr1 with SMTP id dr1so2626285wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Apr 2012 12:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=w7G7QFQyQ1J2dk/iw+BejXOUeKIdnl85AOoGPbHae28=;
	b=HsQHQYHKwxEBJT7oOan4XyqjeuLSNA1O0pGcyFXansAKXvMhMajlvLp5115QmC9WJo
	DcBbgZ2opKlAlbSPAj3I+v9k8Z2wykw4km0ytS6W2gxj27AMHdX6yC5ZdiR5sobmcyAf
	ZlhVrr2ZHpxizYknR+aAYbikC4mw+p2VbF0+d/lPCpauk5TvkacWhyVRE3Pr+46vCEg5
	ia1+bzVPT5hdWgDYgiumiydggzlsV5eaRK5nkMS3LQUUKE9gt6nYv7M+AQnqwOxNsivW
	agN9Z41FV4FuMsumcu270p1iL8mOCVfCU5zOkpJxHGpQKc3plDaaise8BNo8eoOzSfey
	+piQ==
Received: by 10.180.98.8 with SMTP id ee8mr31815101wib.14.1335814576800;
	Mon, 30 Apr 2012 12:36:16 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fz9sm30467820wib.3.2012.04.30.12.36.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 12:36:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 21:36:09 +0200
Message-Id: <1335814569-21635-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335766581.git.Martin.Jansa@gmail.com>
References: <cover.1335766581.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 8/8] abiword: fix build with glib-2.32
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
X-List-Received-Date: Mon, 30 Apr 2012 19:45:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../abiword/abiword/abiword.fix.glib-2.32.patch    |   21 ++++++++++++++++++++
 meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb  |    5 ++-
 2 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/abiword/abiword/abiword.fix.glib-2.32.patch

diff --git a/meta-gnome/recipes-gnome/abiword/abiword/abiword.fix.glib-2.32.patch b/meta-gnome/recipes-gnome/abiword/abiword/abiword.fix.glib-2.32.patch
new file mode 100644
index 0000000..e466ef6
--- /dev/null
+++ b/meta-gnome/recipes-gnome/abiword/abiword/abiword.fix.glib-2.32.patch
@@ -0,0 +1,21 @@
+--- abiword-2.8.6/goffice-bits/goffice/app/goffice-app.h	2012-04-30 15:06:28.000000000 +0200
++++ abiword-2.8.6.orig/goffice-bits/goffice/app/goffice-app.h	2007-01-17 00:17:27.000000000 +0100
+@@ -22,7 +22,7 @@
+ #ifndef GOFFICE_APP_H
+ #define GOFFICE_APP_H
+ 
+-#include <glib/gmacros.h>
++#include <glib.h>
+ 
+ G_BEGIN_DECLS
+ 
+--- abiword-2.8.6/src/af/util/xp/ut_go_file.h	2012-04-30 15:08:43.000000000 +0200
++++ abiword-2.8.6.orig/src/af/util/xp/ut_go_file.h	2009-08-27 15:27:10.000000000 +0200
+@@ -31,7 +31,6 @@
+ 
+ #include <glib.h>
+ #include <gsf/gsf.h>
+-#include <glib/gerror.h>
+ #include <time.h>
+ 
+ G_BEGIN_DECLS
diff --git a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
index 9c7b19f..53a980e 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
@@ -2,12 +2,13 @@ require abiword-2.5.inc
 DEPENDS += " librsvg loudmouth libwmf-native gtkmathview asio"
 RCONFLICTS_${PN} = "abiword-embedded"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.abisource.com/downloads/abiword/${PV}/source/abiword-${PV}.tar.gz;name=abiword \
            file://autogen-common.sh \
            file://nodolt.patch \
-           file://fix.no.undefined.param.patch"
+           file://fix.no.undefined.param.patch \
+           file://abiword.fix.glib-2.32.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=ecd3ac329fca77e2d0e412bec38e1c20"
 
-- 
1.7.8.6



