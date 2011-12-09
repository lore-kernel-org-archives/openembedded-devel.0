Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RYw0D-0005cd-Hy
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 09:40:21 +0100
Received: by eaal1 with SMTP id l1so2322eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2011 00:33:29 -0800 (PST)
Received: by 10.213.114.130 with SMTP id e2mr1573567ebq.7.1323419609305;
	Fri, 09 Dec 2011 00:33:29 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id z54sm28373802eeh.5.2011.12.09.00.33.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 00:33:28 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Dec 2011 09:33:21 +0100
Message-Id: <1323419602-13546-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-efl 1/2] evas: build in buffer engine and eet loader statically
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
X-List-Received-Date: Fri, 09 Dec 2011 08:40:21 -0000

These two are always needed according to http://trac.enlightenment.org/e/wiki/Compilation

This should also avoid errors like this:

ERR<1829>:ecore_evas ecore_evas_buffer.c:623 ecore_evas_buffer_allocfunc_new() evas_engine_info_set() init engine 'buffer' failed.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-efl/recipes-efl/efl/evas.inc |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/evas.inc b/meta-efl/recipes-efl/efl/evas.inc
index 1328309..fd644de 100644
--- a/meta-efl/recipes-efl/efl/evas.inc
+++ b/meta-efl/recipes-efl/efl/evas.inc
@@ -8,7 +8,7 @@ DEPENDS_virtclass-native = "freetype-native libxext-native libpng-native jpeg-na
 inherit efl
 
 BBCLASSEXTEND = "native"
-INC_PR = "r2"
+INC_PR = "r3"
 FILESPATHPKG =. "${BPN}-${PV}:${BPN}:"
 
 python populate_packages_prepend () {
@@ -32,7 +32,6 @@ FILES_${PN}-dbg += "${libdir}/evas/modules/*/*/*/.debug/"
 PACKAGES_DYNAMIC = "evas-engine-* evas-loader-* evas-saver-*"
 
 RRECOMMENDS_${PN} = " \
-  evas-engine-buffer \
   evas-engine-fb \
   evas-engine-software-generic \
   evas-engine-software-x11 \
@@ -42,7 +41,6 @@ RRECOMMENDS_${PN} = " \
  \
   evas-loader-png \
   evas-loader-jpeg \
-  evas-loader-eet \
   evas-loader-gif \
   evas-loader-svg \
 "
@@ -87,13 +85,14 @@ EVAS_OECONF = " \
                 --enable-fb \
                 --disable-directfb \
                 --disable-sdl \
-                --enable-buffer \
+                --enable-buffer=static \
+                --enable-static-software-generic \
                 --disable-software-ddraw \
                 --disable-software-qtopia \
                 --disable-software-xcb \
                 --disable-xrender-xcb \
                 --disable-glitz-x11 \
-                --enable-image-loader-eet \
+                --enable-image-loader-eet=static \
                 --disable-image-loader-edb \
                 --enable-image-loader-png \
                 --enable-image-loader-jpeg \
-- 
1.7.2.5



