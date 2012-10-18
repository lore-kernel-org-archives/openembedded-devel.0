Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TOwO1-0004n4-0h
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Oct 2012 22:08:09 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so2254822wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2012 12:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8DwDBlY5BRaIE0HSzztECLRGoKby8kf6aZXVH9imbbw=;
	b=UkF9ThFvY2SnrCOTK+PXzObIIPbaY76V4nnEKzkyxj8TD0U80zlgWrXH+hdxX4Uj9K
	o/Hvld9c4INfMadzWZWe4R+3UBqTkgOv9FRTRQsxtEQTqEZAly8PLawMnwjWglAMYE8A
	ZP6qey1kUrQ0va3RlMvomv9CmTHGRAs5hlAtwK6OeFxxRAkDZdBVaAelWg81Zf9i2iI4
	29O6SicJj5dufnHCl02WALSE5xEH/ogzit/iwI2XH6gVZKSg60s2zod2qzj/fU23cvWN
	UHYe/3L48mbcC+cQajmREOucDozoJPVIyVOn5Todd5oJBur2UpNLz1HLSGoe/np0DrfJ
	ICLg==
Received: by 10.180.19.71 with SMTP id c7mr13597802wie.2.1350590089464;
	Thu, 18 Oct 2012 12:54:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v3sm31100287wiw.7.2012.10.18.12.54.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Oct 2012 12:54:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Oct 2012 21:54:31 +0200
Message-Id: <ba8a3e71ad6e1ca180e2998525129b907948a0db.1350589969.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1350589969.git.Martin.Jansa@gmail.com>
References: <cover.1350589969.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1350589969.git.Martin.Jansa@gmail.com>
References: <cover.1350589969.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/5] ecore: drop libxputil from DEPENDS
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
X-List-Received-Date: Thu, 18 Oct 2012 20:08:09 -0000

* it was removed from oe-core
  http://git.openembedded.org/openembedded-core/commit/?id=5b3748d463a6666c0d8e2624092619da8d8e6328
* it needs to be explicitly disabled now, because recipe was removed in
  oe-core, but files still stay in sysroot and we cannot even
  cleansstate it now without recipes around.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/ecore.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/ecore.inc b/meta-efl/recipes-efl/efl/ecore.inc
index 9faaf3a..7744501 100644
--- a/meta-efl/recipes-efl/efl/ecore.inc
+++ b/meta-efl/recipes-efl/efl/ecore.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Ecore is the Enlightenment application framework library"
 LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d6ff2c3c85de2faf5fd7dcd9ccfc8886"
 DEPENDS = "virtual/libiconv tslib curl eet evas glib-2.0 gnutls \
-           libxtst libxcomposite libxinerama libxscrnsaver libxdamage libxrandr libxcursor libxprintutil"
+           libxtst libxcomposite libxinerama libxscrnsaver libxdamage libxrandr libxcursor"
 DEPENDS_virtclass-native = "eet-native evas-native gettext-native"
 # optional
 # DEPENDS += "directfb virtual/libsdl openssl virtual/libiconv"
@@ -10,7 +10,7 @@ DEPENDS_virtclass-native = "eet-native evas-native gettext-native"
 inherit efl gettext
 
 BBCLASSEXTEND = "native"
-INC_PR = "r0"
+INC_PR = "r1"
 
 do_configure_prepend() {
     touch ${S}/po/Makefile.in.in || true
@@ -78,6 +78,7 @@ ECORE_OECONF = "\
   --enable-inotify \
   --disable-ecore-desktop \
   --disable-ecore-x-xcb \
+  --disable-ecore-x-xprint \
   --disable-ecore-directfb \
   --disable-ecore-sdl \
   --enable-ecore-evas-opengl-x11 \
-- 
1.7.12.4



