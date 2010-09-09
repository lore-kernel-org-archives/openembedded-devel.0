Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Otmux-0002d3-1e
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 21:36:20 +0200
Received: (qmail 10287 invoked by uid 503); 9 Sep 2010 19:47:06 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 9 Sep 2010 19:47:05 -0000
Received: (qmail 24426 invoked by uid 503); 9 Sep 2010 19:19:34 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 9 Sep 2010 19:19:34 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 9 Sep 2010 21:35:35 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 9 Sep 2010 21:35:33 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Sep 2010 21:34:08 +0200
Message-Id: <1284060848-18286-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <i6atdj$5b0$1@dough.gmane.org>
References: <i6atdj$5b0$1@dough.gmane.org>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3964575047651667273
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] fix bitbake ERRORS for machine not having virtual/egl
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
X-List-Received-Date: Thu, 09 Sep 2010 19:36:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* several recipes depend on virtual/egl which currently has only one
provider : powervr-drivers/libgles-omap. This provider sets
COMPATIBLE_MACHINE to a few TI based machines.
When building for machines which don't provide virtual/egl, we get
the following errors :
ERROR: '['path_to/openembedded/recipes/qt4/qt4-embedded-gles_4.6.3.bb']'
      RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity
     'qt4-embedded-gles' but it wasn't found in any PACKAGE or RPROVIDES
     variables of any buildable targets.
ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime
     entity 'virtual/egl' but it wasn't found in any PACKAGE or RPROVIDES
     variables

* This patch creates a egl.inc which contains the compatible machines for
recipes depending on virtual/egl and thus will workaround this error.

Signed-off-by: Eric Bénard <eric@eukrea.com>
Acked-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/egl/egl.inc                        |    2 ++
 recipes/irrlicht/irrlicht-examples-gles.bb |    1 +
 recipes/ogre/ogre-egl_svn.bb               |    1 +
 recipes/powervr-drivers/bc-cube_0.1.0.bb   |    1 +
 recipes/powervr-drivers/bc-cube_0.2.0.bb   |    1 +
 recipes/qt4/qt4-embedded-gles_4.6.0.bb     |    1 +
 recipes/qt4/qt4-embedded-gles_4.6.2.bb     |    1 +
 recipes/qt4/qt4-embedded-gles_4.6.3.bb     |    1 +
 recipes/qt4/qt4-x11-free-gles_4.5.2.bb     |    1 +
 recipes/qt4/qt4-x11-free-gles_4.6.0.bb     |    1 +
 recipes/qt4/qt4-x11-free-gles_4.6.2.bb     |    1 +
 recipes/qt4/qt4-x11-free-gles_4.6.3.bb     |    1 +
 recipes/xbmc/xbmc_svn.bb                   |    1 +
 13 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 recipes/egl/egl.inc

diff --git a/recipes/egl/egl.inc b/recipes/egl/egl.inc
new file mode 100644
index 0000000..cc4ca82
--- /dev/null
+++ b/recipes/egl/egl.inc
@@ -0,0 +1,2 @@
+COMPATIBLE_MACHINE = "omap3"
+
diff --git a/recipes/irrlicht/irrlicht-examples-gles.bb b/recipes/irrlicht/irrlicht-examples-gles.bb
index 6bce68a..e515fc7 100644
--- a/recipes/irrlicht/irrlicht-examples-gles.bb
+++ b/recipes/irrlicht/irrlicht-examples-gles.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Irrlicht 3D rendering engine "
 LICENSE = "zlib"
 DEPENDS = "virtual/libx11 libxxf86vm virtual/egl"
+require recipes/egl/egl.inc
 
 SRCREV = "2409"
 PV = "1.6+svnr${SRCPV}"
diff --git a/recipes/ogre/ogre-egl_svn.bb b/recipes/ogre/ogre-egl_svn.bb
index caa96c3..5cb7393 100644
--- a/recipes/ogre/ogre-egl_svn.bb
+++ b/recipes/ogre/ogre-egl_svn.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "OGRE (Object-Oriented Graphics Rendering Engine) is a scene-oriented, flexible 3D engine "
 LICENSE = "LGPL"
 DEPENDS = "gtk+ wgois cppunit zziplib boost freeimage freetype virtual/libx11 virtual/egl"
+require recipes/egl/egl.inc
 
 PR = "r3"
 
diff --git a/recipes/powervr-drivers/bc-cube_0.1.0.bb b/recipes/powervr-drivers/bc-cube_0.1.0.bb
index 6323a79..62dfc5b 100644
--- a/recipes/powervr-drivers/bc-cube_0.1.0.bb
+++ b/recipes/powervr-drivers/bc-cube_0.1.0.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "TI Texture streaming using bufferclass API demo (spinning video cube)"
 LICENSE = "TI-BSD/GPLv2"
 DEPENDS = "virtual/egl"
+require recipes/egl/egl.inc
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/apps_processors/OMAP35x_AM35x_Video_Texture_Streaming/1_0/exports/bc-cat-${PV}.tar.gz \
            file://bc-cat-0.1.0-BC_PIX_FMT_.patch;striplevel=0"
diff --git a/recipes/powervr-drivers/bc-cube_0.2.0.bb b/recipes/powervr-drivers/bc-cube_0.2.0.bb
index cf2aa95..c639283 100644
--- a/recipes/powervr-drivers/bc-cube_0.2.0.bb
+++ b/recipes/powervr-drivers/bc-cube_0.2.0.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "TI Texture streaming using bufferclass API demo (spinning video cube)"
 LICENSE = "TI-BSD/GPLv2"
 DEPENDS = "virtual/egl"
+require recipes/egl/egl.inc
 
 PR = "r2"
 
diff --git a/recipes/qt4/qt4-embedded-gles_4.6.0.bb b/recipes/qt4/qt4-embedded-gles_4.6.0.bb
index 3b3ea15..3e132bf 100644
--- a/recipes/qt4/qt4-embedded-gles_4.6.0.bb
+++ b/recipes/qt4/qt4-embedded-gles_4.6.0.bb
@@ -10,3 +10,4 @@ require qt-4.6.0.inc
 FILESPATHPKG .= ":qt4-embedded-${PV}:qt4-embedded"
 
 DEPENDS += "virtual/egl"
+require recipes/egl/egl.inc
diff --git a/recipes/qt4/qt4-embedded-gles_4.6.2.bb b/recipes/qt4/qt4-embedded-gles_4.6.2.bb
index 21c461a..0b047fc 100644
--- a/recipes/qt4/qt4-embedded-gles_4.6.2.bb
+++ b/recipes/qt4/qt4-embedded-gles_4.6.2.bb
@@ -11,3 +11,4 @@ SRC_URI += "file://cursor-hack.diff"
 FILESPATHPKG .= ":qt4-embedded-${PV}:qt4-embedded"
 
 DEPENDS += "virtual/egl"
+require recipes/egl/egl.inc
diff --git a/recipes/qt4/qt4-embedded-gles_4.6.3.bb b/recipes/qt4/qt4-embedded-gles_4.6.3.bb
index 21c461a..0b047fc 100644
--- a/recipes/qt4/qt4-embedded-gles_4.6.3.bb
+++ b/recipes/qt4/qt4-embedded-gles_4.6.3.bb
@@ -11,3 +11,4 @@ SRC_URI += "file://cursor-hack.diff"
 FILESPATHPKG .= ":qt4-embedded-${PV}:qt4-embedded"
 
 DEPENDS += "virtual/egl"
+require recipes/egl/egl.inc
diff --git a/recipes/qt4/qt4-x11-free-gles_4.5.2.bb b/recipes/qt4/qt4-x11-free-gles_4.5.2.bb
index 3fe7218..57e1524 100644
--- a/recipes/qt4/qt4-x11-free-gles_4.5.2.bb
+++ b/recipes/qt4/qt4-x11-free-gles_4.5.2.bb
@@ -11,6 +11,7 @@ require qt4-x11-free_${PV}.bb
 PR = "${INC_PR}.3"
 
 DEPENDS += "virtual/egl"
+require recipes/egl/egl.inc
 PROVIDES += "qt4-x11-free"
 #SRC_URI += "file://sgx-hack.patch"
 SRC_URI += "file://hack-out-pg_config.patch"
diff --git a/recipes/qt4/qt4-x11-free-gles_4.6.0.bb b/recipes/qt4/qt4-x11-free-gles_4.6.0.bb
index dfd53e5..0821595 100644
--- a/recipes/qt4/qt4-x11-free-gles_4.6.0.bb
+++ b/recipes/qt4/qt4-x11-free-gles_4.6.0.bb
@@ -13,4 +13,5 @@ QT_CONFIG_FLAGS += " \
 FILESPATHPKG .= ":qt4-x11-free-${PV}:qt4-x11-free"
 
 DEPENDS += "virtual/egl"
+require recipes/egl/egl.inc
 PROVIDES += "qt4-x11-free"
diff --git a/recipes/qt4/qt4-x11-free-gles_4.6.2.bb b/recipes/qt4/qt4-x11-free-gles_4.6.2.bb
index 307770f..b7cbde5 100644
--- a/recipes/qt4/qt4-x11-free-gles_4.6.2.bb
+++ b/recipes/qt4/qt4-x11-free-gles_4.6.2.bb
@@ -13,4 +13,5 @@ QT_CONFIG_FLAGS += " \
 FILESPATHPKG .= ":qt4-x11-free-${PV}:qt4-x11-free"
 
 DEPENDS += "virtual/egl"
+require recipes/egl/egl.inc
 PROVIDES += "qt4-x11-free"
diff --git a/recipes/qt4/qt4-x11-free-gles_4.6.3.bb b/recipes/qt4/qt4-x11-free-gles_4.6.3.bb
index 307770f..b7cbde5 100644
--- a/recipes/qt4/qt4-x11-free-gles_4.6.3.bb
+++ b/recipes/qt4/qt4-x11-free-gles_4.6.3.bb
@@ -13,4 +13,5 @@ QT_CONFIG_FLAGS += " \
 FILESPATHPKG .= ":qt4-x11-free-${PV}:qt4-x11-free"
 
 DEPENDS += "virtual/egl"
+require recipes/egl/egl.inc
 PROVIDES += "qt4-x11-free"
diff --git a/recipes/xbmc/xbmc_svn.bb b/recipes/xbmc/xbmc_svn.bb
index 5b1d8bb..b42d7fa 100644
--- a/recipes/xbmc/xbmc_svn.bb
+++ b/recipes/xbmc/xbmc_svn.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "XBMC Media Center"
 LICENSE = "xbmc"
 
 DEPENDS = "libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl libmodplug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo2 enca avahi libsamplerate0 libxrandr bzip2 virtual/libsdl"
+require recipes/egl/egl.inc
 
 SRCREV = "e2ab481ebe964321c358ab9d6402088c714adcbe"
 
-- 
1.6.3.3



