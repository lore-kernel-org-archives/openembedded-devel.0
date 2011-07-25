Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QlOqC-0002DX-CA
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jul 2011 19:21:16 +0200
Received: by wwi14 with SMTP id 14so1481947wwi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jul 2011 10:17:04 -0700 (PDT)
Received: by 10.216.136.160 with SMTP id w32mr795236wei.30.1311614223810;
	Mon, 25 Jul 2011 10:17:03 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fx12sm4487250wbb.42.2011.07.25.10.17.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jul 2011 10:17:03 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Jul 2011 19:16:51 +0200
Message-Id: <1311614211-2977-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-efl] evas: add new style GL config options
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
X-List-Received-Date: Mon, 25 Jul 2011 17:21:16 -0000

The config options changed recently, but we keep both to allow bisecting EFL_SRCREVs

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-efl/recipes-efl/efl/evas.inc |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/evas.inc b/meta-efl/recipes-efl/efl/evas.inc
index 4e6f328..3f7eed3 100644
--- a/meta-efl/recipes-efl/efl/evas.inc
+++ b/meta-efl/recipes-efl/efl/evas.inc
@@ -8,7 +8,7 @@ DEPENDS_virtclass-native = "freetype-native libxext-native libpng-native jpeg-na
 inherit efl
 
 BBCLASSEXTEND = "native"
-INC_PR = "r1"
+INC_PR = "r2"
 FILESPATHPKG =. "${BPN}-${PV}:${BPN}:"
 
 python populate_packages_prepend () {
@@ -158,6 +158,7 @@ EXTRA_OECONF = "${EVAS_OECONF} \
                 --disable-convert-32-rgb-rot-180 \
                 --enable-convert-32-rgb-rot-270 \
                 --enable-gl-x11 \
+                --enable-gl-xlib \
                 --enable-gl-flavor-gles \
                 --enable-gles-variety-${GLES} \
 "
@@ -165,6 +166,7 @@ EXTRA_OECONF_virtclass-native = "${EVAS_OECONF} \
                 --disable-software-x11 \
                 --disable-software-16-x11 \
                 --disable-gl-x11 \
+                --disable-gl-xlib \
                 --disable-xrender-x11 \
                 --disable-image-loader-gif \
                 --disable-image-loader-svg \
-- 
1.6.6.1



