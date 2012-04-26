Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SNOJb-00063X-LF
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2012 15:00:58 +0200
Received: by wibhj13 with SMTP id hj13so1041181wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2012 05:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=gsPdgChWSnFtcq7nn96PpaLdAyLxNj5NYMqxHOQzKuA=;
	b=gCDsXv/YpnmL4T85ASqBc5SpVLPK4Qyoh95vJ2VtjY9VNDbUrjwF99VTMJIFPBDkdn
	IcMlZcNzj+wQoWEItQSyDgzSTqOlr+MtaMbnao/nz1Y1+tzipY+oOAJssg3olT1C5smd
	1OsZxsf/1xox50YmDxSdgscu4c72UCvdnoxQ34ExliBJaWVvx/gEfIquTS9l91XQyMte
	lY78UqQHObhnCLBUE6OuNvshJOBvypWU15JXlyKNQbBgqr8PCAtF/kimErucPt8UZaMf
	eJC4VTvZzIjPynEzYH9EzvOTseen0Q1eH8zgyLsskubG1/6Vv1d+d6FPFe6lQwFyF7n3
	y5DA==
Received: by 10.180.81.166 with SMTP id b6mr51061994wiy.0.1335444678824;
	Thu, 26 Apr 2012 05:51:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e6sm44579723wix.8.2012.04.26.05.51.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 05:51:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Apr 2012 14:50:12 +0200
Message-Id: <750e6392954d6fab7a3650bbeaa3ae48ff00e617.1335444528.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
Subject: [[meta-oe][meta-efl] 07/15] meta-efl: add recipes for new released versions
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
X-List-Received-Date: Thu, 26 Apr 2012 13:00:59 -0000

* drop/reset PR where possible as PV is increased
* remove RREPLACES for versions before meta-efl was created

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/conf/distro/include/efl-from-svn.inc      |   17 ++++-
 meta-efl/recipes-efl/e17/e-module.inc              |    2 +-
 .../e17/e-wm-theme-illume-efenniht_svn.bb          |    1 -
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |    1 -
 meta-efl/recipes-efl/e17/edje-viewer_svn.bb        |    1 -
 meta-efl/recipes-efl/e17/elementary-alarm_svn.bb   |    1 -
 meta-efl/recipes-efl/e17/elfe_svn.bb               |    2 +-
 meta-efl/recipes-efl/e17/elmdentica_svn.bb         |    1 -
 meta-efl/recipes-efl/e17/enjoy_svn.bb              |    1 -
 meta-efl/recipes-efl/e17/eve_svn.bb                |    1 -
 meta-efl/recipes-efl/e17/exalt_svn.bb              |    1 -
 meta-efl/recipes-efl/e17/expedite.inc              |   27 +++++++
 meta-efl/recipes-efl/e17/expedite_1.2.0.bb         |   10 +++
 meta-efl/recipes-efl/e17/expedite_svn.bb           |   35 ++-------
 meta-efl/recipes-efl/e17/exquisite-theme-illume.bb |    1 -
 meta-efl/recipes-efl/e17/exquisite_svn.bb          |    1 -
 meta-efl/recipes-efl/e17/places_svn.bb             |    2 +-
 meta-efl/recipes-efl/e17/screenshot_svn.bb         |    2 +-
 meta-efl/recipes-efl/e17/waker_svn.bb              |    1 -
 .../recipes-efl/efl/e-wm-illume-dict-pl_git.bb     |    1 -
 meta-efl/recipes-efl/efl/ecore.inc                 |   20 +-----
 meta-efl/recipes-efl/efl/ecore_1.2.0.bb            |   11 +++
 meta-efl/recipes-efl/efl/ecore_svn.bb              |    6 +-
 meta-efl/recipes-efl/efl/edb_svn.bb                |    1 -
 meta-efl/recipes-efl/efl/edbus.inc                 |   14 +---
 meta-efl/recipes-efl/efl/edbus_1.2.0.bb            |   11 +++
 meta-efl/recipes-efl/efl/edbus_svn.bb              |    6 +-
 meta-efl/recipes-efl/efl/edje.inc                  |    4 +-
 meta-efl/recipes-efl/efl/edje_1.2.0.bb             |   10 +++
 meta-efl/recipes-efl/efl/edje_svn.bb               |    6 +-
 meta-efl/recipes-efl/efl/eet_1.6.0.bb              |   10 +++
 meta-efl/recipes-efl/efl/eet_svn.bb                |    6 +-
 meta-efl/recipes-efl/efl/eeze.inc                  |    2 +-
 meta-efl/recipes-efl/efl/eeze_1.2.0.bb             |   10 +++
 meta-efl/recipes-efl/efl/eeze_svn.bb               |    6 +-
 .../efl/efreet/changeset_trunk_r57435.patch        |   11 ---
 meta-efl/recipes-efl/efl/efreet_1.2.0.bb           |   10 +++
 meta-efl/recipes-efl/efl/efreet_svn.bb             |    6 +-
 meta-efl/recipes-efl/efl/eina.inc                  |    2 -
 meta-efl/recipes-efl/efl/eina_1.2.0.bb             |   10 +++
 meta-efl/recipes-efl/efl/eina_svn.bb               |    4 +-
 meta-efl/recipes-efl/efl/eio.inc                   |    1 +
 meta-efl/recipes-efl/efl/eio_1.0.0.bb              |   10 +++
 meta-efl/recipes-efl/efl/eio_svn.bb                |    6 +-
 .../efl/elementary-theme-efenniht_svn.bb           |    1 -
 meta-efl/recipes-efl/efl/elementary.inc            |   71 +++++++++++++++++
 meta-efl/recipes-efl/efl/elementary_1.0.0.bb       |   10 +++
 meta-efl/recipes-efl/efl/elementary_svn.bb         |   82 ++------------------
 meta-efl/recipes-efl/efl/elsa_svn.bb               |    1 -
 meta-efl/recipes-efl/efl/embryo.inc                |    7 +--
 meta-efl/recipes-efl/efl/embryo_1.2.0.bb           |   10 +++
 meta-efl/recipes-efl/efl/embryo_svn.bb             |    4 +-
 meta-efl/recipes-efl/efl/emotion.inc               |   17 ++++
 meta-efl/recipes-efl/efl/emotion_1.0.0.bb          |   10 +++
 meta-efl/recipes-efl/efl/emotion_svn.bb            |   25 ++----
 meta-efl/recipes-efl/efl/engrave_svn.bb            |    1 -
 meta-efl/recipes-efl/efl/epdf_svn.bb               |    1 -
 meta-efl/recipes-efl/efl/epeg_svn.bb               |    1 -
 meta-efl/recipes-efl/efl/ethumb.inc                |   22 +++++
 meta-efl/recipes-efl/efl/ethumb_1.0.0.bb           |   10 +++
 meta-efl/recipes-efl/efl/ethumb_svn.bb             |   29 ++-----
 meta-efl/recipes-efl/efl/evas.inc                  |   27 +------
 meta-efl/recipes-efl/efl/evas_1.2.0.bb             |   10 +++
 meta-efl/recipes-efl/efl/evas_svn.bb               |    6 +-
 meta-efl/recipes-efl/efl/imlib2_svn.bb             |    1 -
 meta-efl/recipes-efl/efl/libeflvala_svn.bb         |    1 -
 meta-efl/recipes-efl/efl/libeweather_svn.bb        |    1 -
 67 files changed, 363 insertions(+), 277 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/expedite.inc
 create mode 100644 meta-efl/recipes-efl/e17/expedite_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/ecore_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/edbus_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/edje_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/eet_1.6.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/eeze_1.2.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/efreet/changeset_trunk_r57435.patch
 create mode 100644 meta-efl/recipes-efl/efl/efreet_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/eina_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/eio_1.0.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/elementary.inc
 create mode 100644 meta-efl/recipes-efl/efl/elementary_1.0.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/embryo_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion.inc
 create mode 100644 meta-efl/recipes-efl/efl/emotion_1.0.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/ethumb.inc
 create mode 100644 meta-efl/recipes-efl/efl/ethumb_1.0.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas_1.2.0.bb

diff --git a/meta-efl/conf/distro/include/efl-from-svn.inc b/meta-efl/conf/distro/include/efl-from-svn.inc
index 03f203c..b2d27fa 100644
--- a/meta-efl/conf/distro/include/efl-from-svn.inc
+++ b/meta-efl/conf/distro/include/efl-from-svn.inc
@@ -1,10 +1,14 @@
-EFL_PREFERRED_VERSION ?= "1.1.%"
+EFL_PREFERRED_VERSION ?= "1.2.0+svn%"
+EFL_PREFERRED_VERSION_1.0 ?= "1.0.0+svn%"
+EFL_PREFERRED_VERSION_EET ?= "1.6.0+svn%"
+
 PREFERRED_VERSION_ecore ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_ecore-native ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_edbus ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_edbus-native ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_edje ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_edje-native ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_edje-nativesdk ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_eeze ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_eeze-native ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_efreet ?= "${EFL_PREFERRED_VERSION}"
@@ -17,5 +21,12 @@ PREFERRED_VERSION_evas ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_evas-native ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_expedite ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_expedite-native ?= "${EFL_PREFERRED_VERSION}"
-PREFERRED_VERSION_eet ?= "1.5.%"
-PREFERRED_VERSION_eet-native ?= "1.5%"
+
+PREFERRED_VERSION_eet ?= "${EFL_PREFERRED_VERSION_EET}"
+PREFERRED_VERSION_eet-native ?= "${EFL_PREFERRED_VERSION_EET}"
+
+PREFERRED_VERSION_eio ?= "${EFL_PREFERRED_VERSION_1.0}"
+PREFERRED_VERSION_eio-native ?= "${EFL_PREFERRED_VERSION_1.0}"
+PREFERRED_VERSION_emotion ?= "${EFL_PREFERRED_VERSION_1.0}"
+PREFERRED_VERSION_ethumb ?= "${EFL_PREFERRED_VERSION_1.0}"
+PREFERRED_VERSION_elementary ?= "${EFL_PREFERRED_VERSION_1.0}"
diff --git a/meta-efl/recipes-efl/e17/e-module.inc b/meta-efl/recipes-efl/e17/e-module.inc
index 97081aa..2c1706e 100644
--- a/meta-efl/recipes-efl/e17/e-module.inc
+++ b/meta-efl/recipes-efl/e17/e-module.inc
@@ -3,7 +3,7 @@ SECTION = "x11/multimedia"
 DEPENDS = "e-wm"
 
 SRCREV = "${EFL_SRCREV}"
-INC_PR = "r5"
+INC_PR = "r0"
 
 SRCNAME = "E-MODULES-EXTRA/${PN}"
 
diff --git a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb b/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
index d5d87e5..038a19f 100644
--- a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=f523ab5986cc79b52a90d2ac3d5454
 
 SRCREV = "${EFL_SRCREV}"
 PV = "0.0+svnr${SRCPV}"
-PR = "r1"
 
 inherit e-base allarch
 
diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index ec921af..dd62eeb 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -4,7 +4,6 @@ LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2667a0f4120372ea91f7467cdff4095f"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
-PR = "r24"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e update-alternatives gettext
diff --git a/meta-efl/recipes-efl/e17/edje-viewer_svn.bb b/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
index 3056540..f59cbb1 100644
--- a/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
+++ b/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "Edje_Viewer is just that."
 LICENSE = "MIT BSD"
 DEPENDS = "elementary"
 PV = "0.0.0+svnr${SRCPV}"
-PR = "r3"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e
diff --git a/meta-efl/recipes-efl/e17/elementary-alarm_svn.bb b/meta-efl/recipes-efl/e17/elementary-alarm_svn.bb
index c930a0c..e25ced6 100644
--- a/meta-efl/recipes-efl/e17/elementary-alarm_svn.bb
+++ b/meta-efl/recipes-efl/e17/elementary-alarm_svn.bb
@@ -3,7 +3,6 @@ LICENSE = "GPL"
 DEPENDS = "elementary"
 SECTION = "x11"
 PV = "0.0.0+svnr${SRCPV}"
-PR = "r2"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e
diff --git a/meta-efl/recipes-efl/e17/elfe_svn.bb b/meta-efl/recipes-efl/e17/elfe_svn.bb
index 5206e24..33b8d05 100644
--- a/meta-efl/recipes-efl/e17/elfe_svn.bb
+++ b/meta-efl/recipes-efl/e17/elfe_svn.bb
@@ -1,7 +1,7 @@
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 PV = "0.0.1+svnr${SRCPV}"
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.0"
 
 require e-module.inc
 
diff --git a/meta-efl/recipes-efl/e17/elmdentica_svn.bb b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
index 013a7de..5235dee 100644
--- a/meta-efl/recipes-efl/e17/elmdentica_svn.bb
+++ b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
@@ -12,7 +12,6 @@ S = "${WORKDIR}/${SRCNAME}"
 EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc"
 
 PV = "0.9.9+svnr${SRCPV}"
-PR = "r3"
 SRCREV = "${EFL_SRCREV}"
 
 RDEPENDS_${PN} = "${PN}-themes"
diff --git a/meta-efl/recipes-efl/e17/enjoy_svn.bb b/meta-efl/recipes-efl/e17/enjoy_svn.bb
index 8f701a3..e1facd7 100644
--- a/meta-efl/recipes-efl/e17/enjoy_svn.bb
+++ b/meta-efl/recipes-efl/e17/enjoy_svn.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0f507c68d42d1cc0fcb507d007112bf2"
 DEPENDS = "evas ecore edje elementary emotion lightmediascanner"
 SRCREV = "${EFL_SRCREV}"
 PV = "0.0+svnr${SRCPV}"
-PR = "r4"
 
 DEPENDS += "gst-plugins-good ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugins-ugly', d)}"
 
diff --git a/meta-efl/recipes-efl/e17/eve_svn.bb b/meta-efl/recipes-efl/e17/eve_svn.bb
index 1111553..9806d4f 100644
--- a/meta-efl/recipes-efl/e17/eve_svn.bb
+++ b/meta-efl/recipes-efl/e17/eve_svn.bb
@@ -3,7 +3,6 @@ LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 DEPENDS = "evas ecore edje elementary webkit-efl"
 PV = "0.3.0.0+svnr${SRCPV}"
-PR = "r3"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e gettext
diff --git a/meta-efl/recipes-efl/e17/exalt_svn.bb b/meta-efl/recipes-efl/e17/exalt_svn.bb
index 712204f..06fb5bd 100644
--- a/meta-efl/recipes-efl/e17/exalt_svn.bb
+++ b/meta-efl/recipes-efl/e17/exalt_svn.bb
@@ -7,7 +7,6 @@ RDEPENDS_${PN} = "vpnc wpa-supplicant"
 
 PV = "0.9+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
-PR = "r1"
 
 inherit e
 SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
diff --git a/meta-efl/recipes-efl/e17/expedite.inc b/meta-efl/recipes-efl/e17/expedite.inc
new file mode 100644
index 0000000..f529963
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/expedite.inc
@@ -0,0 +1,27 @@
+DESCRIPTION = "Expedite is a comprehensive benchmarking suite for Evas"
+DEPENDS = "eet evas"
+LICENSE = "MIT BSD"
+
+INC_PR = "r0"
+
+inherit e
+
+EXTRA_OECONF = "\
+  --x-includes=${STAGING_INCDIR}/X11 \
+  --x-libraries=${STAGING_LIBDIR} \
+  --enable-simple-x11 \
+\
+  --disable-opengl-glew \
+  --enable-software-x11 \
+  --enable-xrender-x11 \
+  --enable-software-16-x11 \
+  --enable-opengl-x11 \
+  --enable-fb \
+  --disable-software-ddraw \
+  --disable-software-16-ddraw \
+  --disable-direct3d \
+  --disable-software-sdl \
+"
+
+FILES_${PN} += "${datadir}"
+RDEPENDS_${PN} = "expedite-themes evas-engine-fb evas-engine-software-generic evas-engine-software-x11 evas-engine-gl-x11 evas-loader-png"
diff --git a/meta-efl/recipes-efl/e17/expedite_1.2.0.bb b/meta-efl/recipes-efl/e17/expedite_1.2.0.bb
new file mode 100644
index 0000000..c3890ff
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/expedite_1.2.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "e9dfdf3dc35fdbec189914e3960c9949"
+SRC_URI[sha256sum] = "533b18a823c8e417bd3b04db8d4f3ad7dcb4596e14397e38dd1788d39d98fe3d"
diff --git a/meta-efl/recipes-efl/e17/expedite_svn.bb b/meta-efl/recipes-efl/e17/expedite_svn.bb
index e6dc051..f238d06 100644
--- a/meta-efl/recipes-efl/e17/expedite_svn.bb
+++ b/meta-efl/recipes-efl/e17/expedite_svn.bb
@@ -1,32 +1,11 @@
-DESCRIPTION = "Expedite is a comprehensive benchmarking suite for Evas"
-DEPENDS = "eet evas"
-LICENSE = "MIT BSD"
+require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.1.0+svnr${SRCPV}"
-PR = "r1"
+PV = "1.2.0+svnr${SRCPV}"
+PR = "${INC_PR}.0"
+DEFAULT_PREFERENCE = "-1"
 
-inherit e
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
-S = "${WORKDIR}/${SRCNAME}"
-
-EXTRA_OECONF = "\
-  --x-includes=${STAGING_INCDIR}/X11 \
-  --x-libraries=${STAGING_LIBDIR} \
-  --enable-simple-x11 \
-\
-  --disable-opengl-glew \
-  --enable-software-x11 \
-  --enable-xrender-x11 \
-  --enable-software-16-x11 \
-  --enable-opengl-x11 \
-  --enable-fb \
-  --disable-software-ddraw \
-  --disable-software-16-ddraw \
-  --disable-direct3d \
-  --disable-software-sdl \
+SRC_URI = "\
+  ${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
 "
-
-FILES_${PN} += "${datadir}"
-RDEPENDS_${PN} = "expedite-themes evas-engine-fb evas-engine-software-generic evas-engine-software-x11 evas-engine-gl-x11 evas-loader-png"
-
+S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb b/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
index 5dabea2..ecb53cc 100644
--- a/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
+++ b/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=f523ab5986cc79b52a90d2ac3d5454
 SECTION = "x11"
 DEPENDS = "edje-native"
 PV = "1.0+svnr${SRCPV}"
-PR = "r7"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e-base update-alternatives allarch
diff --git a/meta-efl/recipes-efl/e17/exquisite_svn.bb b/meta-efl/recipes-efl/e17/exquisite_svn.bb
index fcfb65c..a13a300 100644
--- a/meta-efl/recipes-efl/e17/exquisite_svn.bb
+++ b/meta-efl/recipes-efl/e17/exquisite_svn.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "A psplash replacement for display"
 LICENSE = "MIT BSD"
 DEPENDS = "eet evas ecore embryo edje"
 PV = "0.0.1+svnr${SRCPV}"
-PR = "r11"
 SRCREV = "${EFL_SRCREV}"
 RRECOMMENDS_${PN} = "exquisite-themes"
 RCONFLICTS_${PN} = "psplash virtual-psplash"
diff --git a/meta-efl/recipes-efl/e17/places_svn.bb b/meta-efl/recipes-efl/e17/places_svn.bb
index 103d720..5c19933 100644
--- a/meta-efl/recipes-efl/e17/places_svn.bb
+++ b/meta-efl/recipes-efl/e17/places_svn.bb
@@ -2,7 +2,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 
 PV = "0.1.0+svnr${SRCPV}"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 
 require e-module.inc
 
diff --git a/meta-efl/recipes-efl/e17/screenshot_svn.bb b/meta-efl/recipes-efl/e17/screenshot_svn.bb
index 0d096fe..465ffcf 100644
--- a/meta-efl/recipes-efl/e17/screenshot_svn.bb
+++ b/meta-efl/recipes-efl/e17/screenshot_svn.bb
@@ -1,6 +1,6 @@
 LICENSE = "MIT"
 PV = "0.3.0+svnr${SRCREV}"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 SRC_URI += "file://screenshot-fix-mkinstalldirs.patch"
 
diff --git a/meta-efl/recipes-efl/e17/waker_svn.bb b/meta-efl/recipes-efl/e17/waker_svn.bb
index 72ce92a..9eb58fc 100644
--- a/meta-efl/recipes-efl/e17/waker_svn.bb
+++ b/meta-efl/recipes-efl/e17/waker_svn.bb
@@ -3,7 +3,6 @@ LICENSE = "LGPL"
 DEPENDS = "ecore edbus"
 SECTION = "console"
 PV = "0.0.0+svnr${SRCPV}"
-PR = "r1"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
diff --git a/meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb b/meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb
index bfab3c9..6247523 100644
--- a/meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb
+++ b/meta-efl/recipes-efl/efl/e-wm-illume-dict-pl_git.bb
@@ -3,7 +3,6 @@ SECTION = "x11/data"
 SRCREV = "38fdd9bb0d8296e984bb6443466801eea6f62f00"
 PV = "1.0+gitr${SRCPV}"
 PE = "1"
-PR = "r0"
 LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f523ab5986cc79b52a90d2ac3d5454a2"
 
diff --git a/meta-efl/recipes-efl/efl/ecore.inc b/meta-efl/recipes-efl/efl/ecore.inc
index 85e0204..bc4758a 100644
--- a/meta-efl/recipes-efl/efl/ecore.inc
+++ b/meta-efl/recipes-efl/efl/ecore.inc
@@ -10,7 +10,7 @@ DEPENDS_virtclass-native = "eet-native evas-native gettext-native"
 inherit efl gettext
 
 BBCLASSEXTEND = "native"
-INC_PR = "r1"
+INC_PR = "r0"
 
 do_configure_prepend() {
 	touch ${S}/po/Makefile.in.in || true
@@ -39,24 +39,6 @@ PACKAGES =+ "\
 # Some upgrade path tweaking
 AUTO_LIBNAME_PKGS = ""
 
-RREPLACES_${PN} = "libecore-ver-pre-svn-00-0 libecore-ver-pre-svn-01-0"
-REPLACES_${PN}-tests = "libecore-ver-pre-svn-01-tests"
-RREPLACES_${PN}-con = "libecore-ver-pre-svn-01-con libecore-con-ver-pre-svn-01-0"
-RREPLACES_${PN}-config = "libecore-config-ver-pre-svn-01-0"
-RREPLACES_${PN}-desktop = "libecore-desktop-ver-pre-svn-01-0"
-RREPLACES_${PN}-directfb = "libecore-directfb-ver-pre-svn-01-0"
-RREPLACES_${PN}-sdl = "libecore-sdl-ver-pre-svn-01-0"
-RREPLACES_${PN}-evas = "libecore-evas-ver-pre-svn-01-0"
-RREPLACES_${PN}-fb = "libecore-fb-ver-pre-svn-01-0"
-RREPLACES_${PN}-file = "libecore-file-ver-pre-svn-01-0"
-RREPLACES_${PN}-imf-evas = "libecore-imf-evas-ver-pre-svn-01-0"
-RREPLACES_${PN}-imf = "libecore-imf-ver-pre-svn-01-0"
-RREPLACES_${PN}-ipc = "libecore-ipc-ver-pre-svn-01-0"
-RREPLACES_${PN}-job = "libecore-job-ver-pre-svn-01-0"
-RREPLACES_${PN}-txt = "libecore-txt-ver-pre-svn-01-0"
-RREPLACES_${PN}-x = "libecore-x-ver-pre-svn-01-0"
-RREPLACES_${PN}-input = "libecore-input-ver-pre-svn-01-0"
-
 FILES_${PN} = "${libdir}/libecore*.so.* \
   ${bindir} \
 "
diff --git a/meta-efl/recipes-efl/efl/ecore_1.2.0.bb b/meta-efl/recipes-efl/efl/ecore_1.2.0.bb
new file mode 100644
index 0000000..39c58d7
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/ecore_1.2.0.bb
@@ -0,0 +1,11 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
+  file://fix-ecore-fb-initialization.patch \
+"
+
+SRC_URI[md5sum] = "64362b8ab96776a5868db4e6a8919926"
+SRC_URI[sha256sum] = "97c0f07180fcf7dec6ce39893b206ff069109ef4569ea6be2fdbb2e05f029aa9"
diff --git a/meta-efl/recipes-efl/efl/ecore_svn.bb b/meta-efl/recipes-efl/efl/ecore_svn.bb
index 078310a..f0e8811 100644
--- a/meta-efl/recipes-efl/efl/ecore_svn.bb
+++ b/meta-efl/recipes-efl/efl/ecore_svn.bb
@@ -1,8 +1,8 @@
-require ecore.inc
+require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.1.0+svnr${SRCPV}"
-PR = "${INC_PR}.1"
+PV = "1.2.0+svnr${SRCPV}"
+PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
diff --git a/meta-efl/recipes-efl/efl/edb_svn.bb b/meta-efl/recipes-efl/efl/edb_svn.bb
index 8b2338a..3ff9d3c 100644
--- a/meta-efl/recipes-efl/efl/edb_svn.bb
+++ b/meta-efl/recipes-efl/efl/edb_svn.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "Edb is the Enlightenment database library"
 LICENSE = "MIT BSD"
 DEPENDS = "zlib"
 PV = "1.0.5.050+svnr${SRCPV}"
-PR = "r1"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
diff --git a/meta-efl/recipes-efl/efl/edbus.inc b/meta-efl/recipes-efl/efl/edbus.inc
index 0ffbac4..ad20c8c 100644
--- a/meta-efl/recipes-efl/efl/edbus.inc
+++ b/meta-efl/recipes-efl/efl/edbus.inc
@@ -9,11 +9,11 @@ inherit efl
 ALLOW_EMPTY = "1"
 
 BBCLASSEXTEND = "native"
-INC_PR = "r1"
+INC_PR = "r0"
 
 SRCNAME = "e_dbus"
 
-EXTRA_OECONF = "--enable-build-test-gui"
+EXTRA_OECONF += "--enable-build-test-gui"
 
 PACKAGES =+ "${PN}-enotify ${PN}-edbus ${PN}-enm ${PN}-ehal ${PN}-econnman ${PN}-eofono ${PN}-eukit ${PN}-ebluez ${PN}-test-gui"
 FILES_${PN}-enotify = "${libdir}/libenotify.so.* ${bindir}/e-notify-send"
@@ -25,13 +25,3 @@ FILES_${PN}-eofono = "${libdir}/libeofono.so.*"
 FILES_${PN}-eukit = "${libdir}/libeukit.so.*"
 FILES_${PN}-ebluez = "${libdir}/libebluez.so.*"
 FILES_${PN}-test-gui = "${bindir}/e_dbus_hal"
-
-RREPLACES_${PN}-enotify = "libenotify1"
-RREPLACES_${PN}-edbus = "edbus"
-RREPLACES_${PN}-enm = "edbus"
-RREPLACES_${PN}-ehal = "edbus"
-RREPLACES_${PN}-econnman = "edbus"
-RREPLACES_${PN}-eofono = "edbus"
-RREPLACES_${PN}-eukit = "edbus"
-RREPLACES_${PN}-ebluez = "edbus"
-
diff --git a/meta-efl/recipes-efl/efl/edbus_1.2.0.bb b/meta-efl/recipes-efl/efl/edbus_1.2.0.bb
new file mode 100644
index 0000000..9137115
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/edbus_1.2.0.bb
@@ -0,0 +1,11 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
+"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+SRC_URI[md5sum] = "19dc0e43cd9defd5b8fdc7c8610bfe2c"
+SRC_URI[sha256sum] = "2f72b3710ae66604e37e6f6b20857caae9e2ddc7002fa402806dce14b6acbd4c"
diff --git a/meta-efl/recipes-efl/efl/edbus_svn.bb b/meta-efl/recipes-efl/efl/edbus_svn.bb
index b5469ed..f238d06 100644
--- a/meta-efl/recipes-efl/efl/edbus_svn.bb
+++ b/meta-efl/recipes-efl/efl/edbus_svn.bb
@@ -1,8 +1,8 @@
-require edbus.inc
+require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.1.0+svnr${SRCPV}"
-PR = "${INC_PR}.2"
+PV = "1.2.0+svnr${SRCPV}"
+PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
diff --git a/meta-efl/recipes-efl/efl/edje.inc b/meta-efl/recipes-efl/efl/edje.inc
index 026f454..41f04b0 100644
--- a/meta-efl/recipes-efl/efl/edje.inc
+++ b/meta-efl/recipes-efl/efl/edje.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c18cc221a14a84b033db27794dc36df8"
 inherit efl
 
 BBCLASSEXTEND = "native nativesdk"
-INC_PR = "r2"
+INC_PR = "r0"
 
 do_configure_prepend_virtclass-native() {
 	sed -i 's:EMBRYO_PREFIX"/bin:"${STAGING_BINDIR}:' ${S}/src/bin/edje_cc_out.c
@@ -48,8 +48,6 @@ DEBIAN_NOAUTONAME_${PN}-utils = "1"
 # Some upgrade path tweaking
 AUTO_LIBNAME_PKGS = ""
 
-RREPLACES_${PN} = "libedje-ver-pre-svn-00-0 libedje-ver-pre-svn-01-0"
-
 FILES_${PN}-utils = "\
   ${bindir}/edje_* \
   ${bindir}/inkscape2edc \
diff --git a/meta-efl/recipes-efl/efl/edje_1.2.0.bb b/meta-efl/recipes-efl/efl/edje_1.2.0.bb
new file mode 100644
index 0000000..cf6be25
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/edje_1.2.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "a1f848b842e049a789833f9d46ee8a8e"
+SRC_URI[sha256sum] = "0e411679a4d2710f6e3933bff4fda3966fd6140eef89b3d96d663d5f38878290"
diff --git a/meta-efl/recipes-efl/efl/edje_svn.bb b/meta-efl/recipes-efl/efl/edje_svn.bb
index 7cd2f10..f238d06 100644
--- a/meta-efl/recipes-efl/efl/edje_svn.bb
+++ b/meta-efl/recipes-efl/efl/edje_svn.bb
@@ -1,8 +1,8 @@
-require edje.inc
+require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.1.0+svnr${SRCPV}"
-PR = "${INC_PR}.1"
+PV = "1.2.0+svnr${SRCPV}"
+PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
diff --git a/meta-efl/recipes-efl/efl/eet_1.6.0.bb b/meta-efl/recipes-efl/efl/eet_1.6.0.bb
new file mode 100644
index 0000000..14ce231
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eet_1.6.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "4fb2c27bdfe4c2f56f42e5da0c518a2f"
+SRC_URI[sha256sum] = "f14872b26f0857aed18e184d5080da7ac994fa35ddc209e23be447dcc2fdbd50"
diff --git a/meta-efl/recipes-efl/efl/eet_svn.bb b/meta-efl/recipes-efl/efl/eet_svn.bb
index 41f354d..4e822d2 100644
--- a/meta-efl/recipes-efl/efl/eet_svn.bb
+++ b/meta-efl/recipes-efl/efl/eet_svn.bb
@@ -1,8 +1,8 @@
-require eet.inc
+require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.5.0+svnr${SRCPV}"
-PR = "${INC_PR}.1"
+PV = "1.6.0+svnr${SRCPV}"
+PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
diff --git a/meta-efl/recipes-efl/efl/eeze.inc b/meta-efl/recipes-efl/efl/eeze.inc
index aa4baa4..5d523c9 100644
--- a/meta-efl/recipes-efl/efl/eeze.inc
+++ b/meta-efl/recipes-efl/efl/eeze.inc
@@ -6,7 +6,7 @@ DEPENDS = "ecore eet udev"
 inherit efl
 
 BBCLASSEXTEND = "native"
-INC_PR = "r2"
+INC_PR = "r0"
 
 # Some upgrade path tweaking
 AUTO_LIBNAME_PKGS = ""
diff --git a/meta-efl/recipes-efl/efl/eeze_1.2.0.bb b/meta-efl/recipes-efl/efl/eeze_1.2.0.bb
new file mode 100644
index 0000000..9fb4e89
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eeze_1.2.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "4a5a12514e8c2de5d88d31bf4c34cac4"
+SRC_URI[sha256sum] = "4df8ace51385ab15932c856b121b14fb93f2f5a87a08004078fdff5fee451cec"
diff --git a/meta-efl/recipes-efl/efl/eeze_svn.bb b/meta-efl/recipes-efl/efl/eeze_svn.bb
index 20b06d7..f238d06 100644
--- a/meta-efl/recipes-efl/efl/eeze_svn.bb
+++ b/meta-efl/recipes-efl/efl/eeze_svn.bb
@@ -1,8 +1,8 @@
-require eeze.inc
+require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.1.0+svnr${SRCPV}"
-PR = "${INC_PR}.1"
+PV = "1.2.0+svnr${SRCPV}"
+PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
diff --git a/meta-efl/recipes-efl/efl/efreet/changeset_trunk_r57435.patch b/meta-efl/recipes-efl/efl/efreet/changeset_trunk_r57435.patch
deleted file mode 100644
index f652af2..0000000
--- a/meta-efl/recipes-efl/efl/efreet/changeset_trunk_r57435.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-Index: efreet/src/lib/efreet_desktop.c
-===================================================================
---- efreet/src/lib/efreet_desktop.c	(revision 57257)
-+++ efreet/src/lib/efreet_desktop.c	(revision 57435)
-@@ -1206,5 +1206,5 @@
-         case ECORE_FILE_EVENT_MODIFIED:
-             ext = strrchr(path, '.');
--            if (!strcmp(ext, ".desktop") || !strcmp(ext, ".directory"))
-+            if (ext && (!strcmp(ext, ".desktop") || !strcmp(ext, ".directory")))
-                 efreet_cache_desktop_update();
-             break;
diff --git a/meta-efl/recipes-efl/efl/efreet_1.2.0.bb b/meta-efl/recipes-efl/efl/efreet_1.2.0.bb
new file mode 100644
index 0000000..d1c850a
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/efreet_1.2.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "20fc8b8d364f518adf6d92c2e31650f9"
+SRC_URI[sha256sum] = "cc23bfc65528e3bc7ba078db739653d95bd9b255d565b09745a161d338d699e4"
diff --git a/meta-efl/recipes-efl/efl/efreet_svn.bb b/meta-efl/recipes-efl/efl/efreet_svn.bb
index ca4d117..f238d06 100644
--- a/meta-efl/recipes-efl/efl/efreet_svn.bb
+++ b/meta-efl/recipes-efl/efl/efreet_svn.bb
@@ -1,8 +1,8 @@
-require efreet.inc
+require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.1.0+svnr${SRCPV}"
-PR = "${INC_PR}.1"
+PV = "1.2.0+svnr${SRCPV}"
+PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
diff --git a/meta-efl/recipes-efl/efl/eina.inc b/meta-efl/recipes-efl/efl/eina.inc
index c3ecf58..8c9a0df 100644
--- a/meta-efl/recipes-efl/efl/eina.inc
+++ b/meta-efl/recipes-efl/efl/eina.inc
@@ -10,8 +10,6 @@ inherit efl
 # Some upgrade path tweaking
 AUTO_LIBNAME_PKGS = ""
 
-RREPLACES_${PN} = "libeina-ver-pre-svn-00-0 libeina-ver-pre-svn-01-0"
-
 FILES_${PN} += "${libdir}/eina"
 
 do_install_append() {
diff --git a/meta-efl/recipes-efl/efl/eina_1.2.0.bb b/meta-efl/recipes-efl/efl/eina_1.2.0.bb
new file mode 100644
index 0000000..fac3b09
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eina_1.2.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "4b1c45fdcf0acb9744c55ba2a4f3b139"
+SRC_URI[sha256sum] = "b357415be9bdcdc0dc396821cc2c08aab5bae1e6e67aeaeceb1201e9f7dcae25"
diff --git a/meta-efl/recipes-efl/efl/eina_svn.bb b/meta-efl/recipes-efl/efl/eina_svn.bb
index 8256387..f238d06 100644
--- a/meta-efl/recipes-efl/efl/eina_svn.bb
+++ b/meta-efl/recipes-efl/efl/eina_svn.bb
@@ -1,7 +1,7 @@
-require eina.inc
+require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.1.0+svnr${SRCPV}"
+PV = "1.2.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/eio.inc b/meta-efl/recipes-efl/efl/eio.inc
index 0edc07e..71a7eda 100644
--- a/meta-efl/recipes-efl/efl/eio.inc
+++ b/meta-efl/recipes-efl/efl/eio.inc
@@ -1,5 +1,6 @@
 DESCRIPTION = "Enlightenment Input Output Library"
 LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=403f20cf42c847686ac2956f14bfa30f"
 DEPENDS = "ecore eina"
 
 inherit efl
diff --git a/meta-efl/recipes-efl/efl/eio_1.0.0.bb b/meta-efl/recipes-efl/efl/eio_1.0.0.bb
new file mode 100644
index 0000000..d2a14ac
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/eio_1.0.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "9ca60516294fcbd9c919c56e3bb19568"
+SRC_URI[sha256sum] = "08967f5414614b062fae21b012680fcd6ce6c456521bb186593309451e2ff913"
diff --git a/meta-efl/recipes-efl/efl/eio_svn.bb b/meta-efl/recipes-efl/efl/eio_svn.bb
index 6a12dcf..4e7b7d9 100644
--- a/meta-efl/recipes-efl/efl/eio_svn.bb
+++ b/meta-efl/recipes-efl/efl/eio_svn.bb
@@ -1,12 +1,10 @@
-require eio.inc
+require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "0.1.0+svnr${SRCPV}"
+PV = "1.0.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=403f20cf42c847686ac2956f14bfa30f"
-
 SRC_URI = "\
   ${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
 "
diff --git a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb b/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
index 3688bfe..70a184a 100644
--- a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
@@ -16,7 +16,6 @@ SRCREV_ELM_REV ?= "${EFL_SRCREV}"
 
 SRCREV_FORMAT = "THM_REV"
 PV = "0.0+svnr${SRCPV}"
-PR = "r1"
 
 inherit e-base allarch
 
diff --git a/meta-efl/recipes-efl/efl/elementary.inc b/meta-efl/recipes-efl/efl/elementary.inc
new file mode 100644
index 0000000..46dee90
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elementary.inc
@@ -0,0 +1,71 @@
+DESCRIPTION = "EFL based widget set for mobile devices"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=10a051c72424b80bc784a3903651b43b"
+DEPENDS = "eet-native efreet evas ecore edje eet edbus ethumb poppler"
+
+inherit efl gettext
+
+INC_PR = "r0"
+
+EXTRA_OECONF = "\
+  --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
+  --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \
+  --disable-web \
+"
+
+do_compile_append() {
+        sed -i -e s:${STAGING_DIR_TARGET}::g \
+               -e s:/${TARGET_SYS}::g \
+                  elementary.pc
+}
+
+PACKAGES += "${PN}-configs ${PN}-accessibility"
+
+RDEPENDS_${PN} = "\
+  ${PN}-themes \
+  ${PN}-configs \
+"
+RSUGGESTS_${PN} = "${PN}-tests ${PN}-accessibility"
+
+FILES_${PN} += "\
+  ${libdir}/edje/modules/elm \
+  ${libdir}/elementary/modules/datetime_input_ctxpopup/*/module.so \
+"
+
+FILES_${PN}-dev += "\
+  ${libdir}/elementary/modules/datetime_input_ctxpopup/*/module.la \
+"
+
+FILES_${PN}-themes = "\
+  ${datadir}/elementary/themes \
+"
+
+FILES_${PN}-configs = "\
+  ${datadir}/elementary/config \
+"
+
+FILES_${PN}-dbg += "\
+  ${libdir}/elementary/modules/test_entry/*/.debug \
+  ${libdir}/elementary/modules/test_map/*/.debug \
+  ${libdir}/elementary/modules/access_output/*/.debug \
+  ${libdir}/elementary/modules/datetime_input_ctxpopup/*/.debug \
+  ${libdir}/edje/modules/elm/*/.debug \
+"
+
+FILES_${PN}-tests = "\
+  ${bindir}/elementary* \
+  ${datadir}/elementary/images \
+  ${datadir}/elementary/objects \
+  ${datadir}/elementary/examples \
+  ${datadir}/applications/* \
+  ${datadir}/icons/* \
+  ${libdir}/elementary/modules/test_entry/* \
+  ${libdir}/elementary/modules/test_map/* \
+"
+
+FILES_${PN}-accessibility = "\
+  ${libdir}/elementary/modules/access_output/* \
+"
+
+# Some upgrade path tweaking, as in evas
+AUTO_LIBNAME_PKGS = ""
diff --git a/meta-efl/recipes-efl/efl/elementary_1.0.0.bb b/meta-efl/recipes-efl/efl/elementary_1.0.0.bb
new file mode 100644
index 0000000..4f2111e
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elementary_1.0.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "c5bd504b03b6de0a4ffe28fa6a6233ae"
+SRC_URI[sha256sum] = "897fff5f6e81e8b01670d5f4b253141b333679d56bab89dc8a7c3f857763f94e"
diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index 171e617..4e7b7d9 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -1,77 +1,11 @@
-DESCRIPTION = "EFL based widget set for mobile devices"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=10a051c72424b80bc784a3903651b43b"
-DEPENDS = "eet-native efreet evas ecore edje eet edbus ethumb poppler"
-PV = "0.8.0+svnr${SRCPV}"
-PR = "r3"
-SRCREV = "${EFL_SRCREV}"
-
-inherit efl gettext
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
-S = "${WORKDIR}/${SRCNAME}"
-
-EXTRA_OECONF = "\
-  --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
-  --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \
-  --disable-web \
-"
-
-do_compile_append() {
-        sed -i -e s:${STAGING_DIR_TARGET}::g \
-               -e s:/${TARGET_SYS}::g \
-                  elementary.pc
-}
-
-PACKAGES += "${PN}-configs ${PN}-accessibility"
-
-RDEPENDS_${PN} = "\
-  ${PN}-themes \
-  ${PN}-configs \
-"
-RSUGGESTS_${PN} = "${PN}-tests ${PN}-accessibility"
-
-FILES_${PN} += "\
-  ${libdir}/edje/modules/elm \
-  ${libdir}/elementary/modules/datetime_input_ctxpopup/*/module.so \
-"
-
-FILES_${PN}-dev += "\
-  ${libdir}/elementary/modules/datetime_input_ctxpopup/*/module.la \
-"
-
-FILES_${PN}-themes = "\
-  ${datadir}/elementary/themes \
-"
-
-FILES_${PN}-configs = "\
-  ${datadir}/elementary/config \
-"
-
-FILES_${PN}-dbg += "\
-  ${libdir}/elementary/modules/test_entry/*/.debug \
-  ${libdir}/elementary/modules/test_map/*/.debug \
-  ${libdir}/elementary/modules/access_output/*/.debug \
-  ${libdir}/elementary/modules/datetime_input_ctxpopup/*/.debug \
-  ${libdir}/edje/modules/elm/*/.debug \
-"
+require ${BPN}.inc
 
-FILES_${PN}-tests = "\
-  ${bindir}/elementary* \
-  ${datadir}/elementary/images \
-  ${datadir}/elementary/objects \
-  ${datadir}/elementary/examples \
-  ${datadir}/applications/* \
-  ${datadir}/icons/* \
-  ${libdir}/elementary/modules/test_entry/* \
-  ${libdir}/elementary/modules/test_map/* \
-"
+SRCREV = "${EFL_SRCREV}"
+PV = "1.0.0+svnr${SRCPV}"
+PR = "${INC_PR}.0"
+DEFAULT_PREFERENCE = "-1"
 
-FILES_${PN}-accessibility = "\
-  ${libdir}/elementary/modules/access_output/* \
+SRC_URI = "\
+  ${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
 "
-
-# Some upgrade path tweaking, as in evas
-AUTO_LIBNAME_PKGS = ""
-
-RREPLACES_${PN}-themes = "libelementary-ver-pre-svn-05-themes libelementary-ver-svn-06-themes libelementary-ver-pre-svn-06-themes"
-RREPLACES_${PN}-configs = "libelementary-ver-pre-svn-05-configs libelementary-ver-svn-06-configs libelementary-ver-pre-svn-06-configs"
+S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/elsa_svn.bb b/meta-efl/recipes-efl/efl/elsa_svn.bb
index 70b56bd..1f1032f 100644
--- a/meta-efl/recipes-efl/efl/elsa_svn.bb
+++ b/meta-efl/recipes-efl/efl/elsa_svn.bb
@@ -13,7 +13,6 @@ S = "${WORKDIR}/${SRCNAME}"
 
 EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc ${@base_contains('DISTRO_FEATURES', 'pam', '', '--disable-pam', d)}"
 
-PR = "r5"
 PV = "0.0.4+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
diff --git a/meta-efl/recipes-efl/efl/embryo.inc b/meta-efl/recipes-efl/efl/embryo.inc
index efd9319..7997a5f 100644
--- a/meta-efl/recipes-efl/efl/embryo.inc
+++ b/meta-efl/recipes-efl/efl/embryo.inc
@@ -6,14 +6,9 @@ LICENSE = "MIT BSD CompuPhase"
 LIC_FILES_CHKSUM = "file://COPYING;md5=220a7f1107df42c62428d8ebe559ed14"
 
 BBCLASSEXTEND = "native"
-INC_PR = "r1"
+INC_PR = "r0"
 
 DEPENDS += "eina"
 
 # Some upgrade path tweaking
 AUTO_LIBNAME_PKGS = ""
-
-RREPLACES_${PN} = "libembryo-ver-pre-svn-00-0 libembryo-ver-pre-svn-01-0"
-
-RREPLACES_${PN}-tests = "libembryo-ver-pre-svn-00-tests libembryo-ver-pre-svn-01-tests"
-
diff --git a/meta-efl/recipes-efl/efl/embryo_1.2.0.bb b/meta-efl/recipes-efl/efl/embryo_1.2.0.bb
new file mode 100644
index 0000000..d3956ac
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/embryo_1.2.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "6c070a16d61141d695397fc248e6176e"
+SRC_URI[sha256sum] = "432838f5f02c86da785beff0a1e0210a1d3f28121bfb6d6c70300839df31a70c"
diff --git a/meta-efl/recipes-efl/efl/embryo_svn.bb b/meta-efl/recipes-efl/efl/embryo_svn.bb
index ad1bb10..f238d06 100644
--- a/meta-efl/recipes-efl/efl/embryo_svn.bb
+++ b/meta-efl/recipes-efl/efl/embryo_svn.bb
@@ -1,7 +1,7 @@
-require embryo.inc
+require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.1.0+svnr${SRCPV}"
+PV = "1.2.0+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/emotion.inc b/meta-efl/recipes-efl/efl/emotion.inc
new file mode 100644
index 0000000..4b36a35
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/emotion.inc
@@ -0,0 +1,17 @@
+DESCRIPTION = "The Enlightenment multimedia library"
+LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=69f44058245ce5c596d56bb622d5dabd"
+# we no longer build the libxine backend, since the gstreamer backend seems more promising
+DEPENDS = "eet eeze evas ecore edje gstreamer gst-plugins-base"
+
+INC_PR = "r0"
+
+inherit efl
+
+EXTRA_OECONF = "--disable-xine --enable-gstreamer --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc"
+
+PACKAGES =+ "emotion-backend-gstreamer"
+FILES_emotion-backend-gstreamer = "${libdir}/emotion/*.so"
+RRECOMMENDS_${PN} = "emotion-backend-gstreamer"
+# upgrade path from libemotion0 to libemotion1
+RREPLACES_${PN} = "libemotion0"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.0.0.bb b/meta-efl/recipes-efl/efl/emotion_1.0.0.bb
new file mode 100644
index 0000000..e189480
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/emotion_1.0.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "dc1e981c05318d2c3373acfd1cb18079"
+SRC_URI[sha256sum] = "faa1fbd30a297fdb06b8545ffb6d0d961de850f012dc1a8b3033d1800fac3a78"
diff --git a/meta-efl/recipes-efl/efl/emotion_svn.bb b/meta-efl/recipes-efl/efl/emotion_svn.bb
index f9ae8f6..4e7b7d9 100644
--- a/meta-efl/recipes-efl/efl/emotion_svn.bb
+++ b/meta-efl/recipes-efl/efl/emotion_svn.bb
@@ -1,20 +1,11 @@
-DESCRIPTION = "The Enlightenment multimedia library"
-LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=69f44058245ce5c596d56bb622d5dabd"
-# we no longer build the libxine backend, since the gstreamer backend seems more promising
-DEPENDS = "eet eeze evas ecore edje gstreamer gst-plugins-base"
-PV = "0.2.0+svnr${SRCPV}"
-PR = "r2"
+require ${BPN}.inc
+
 SRCREV = "${EFL_SRCREV}"
+PV = "1.0.0+svnr${SRCPV}"
+PR = "${INC_PR}.0"
+DEFAULT_PREFERENCE = "-1"
 
-inherit efl
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
+SRC_URI = "\
+  ${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
+"
 S = "${WORKDIR}/${SRCNAME}"
-
-EXTRA_OECONF = "--disable-xine --enable-gstreamer --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc"
-
-PACKAGES =+ "emotion-backend-gstreamer"
-FILES_emotion-backend-gstreamer = "${libdir}/emotion/*.so"
-RRECOMMENDS_${PN} = "emotion-backend-gstreamer"
-# upgrade path from libemotion0 to libemotion1
-RREPLACES_${PN} = "libemotion0"
diff --git a/meta-efl/recipes-efl/efl/engrave_svn.bb b/meta-efl/recipes-efl/efl/engrave_svn.bb
index 91cfa92..65cb41b 100644
--- a/meta-efl/recipes-efl/efl/engrave_svn.bb
+++ b/meta-efl/recipes-efl/efl/engrave_svn.bb
@@ -3,7 +3,6 @@ LICENSE = "MIT"
 # also requires yacc and lex on host
 DEPENDS = "evas ecore"
 PV = "0.0.0+svnr${SRCPV}"
-PR = "r1"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
diff --git a/meta-efl/recipes-efl/efl/epdf_svn.bb b/meta-efl/recipes-efl/efl/epdf_svn.bb
index 73c3e30..2ab1a9e 100644
--- a/meta-efl/recipes-efl/efl/epdf_svn.bb
+++ b/meta-efl/recipes-efl/efl/epdf_svn.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "Epdf is the glue between EFL and libpoppler"
 
 DEPENDS = "poppler evas ecore"
 PV = "0.1.0+svnr${SRCPV}"
-PR = "r8"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
diff --git a/meta-efl/recipes-efl/efl/epeg_svn.bb b/meta-efl/recipes-efl/efl/epeg_svn.bb
index 9d66bb3..bc45bfb 100644
--- a/meta-efl/recipes-efl/efl/epeg_svn.bb
+++ b/meta-efl/recipes-efl/efl/epeg_svn.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "Epeg is a small library for handling thumbnails."
 LICENSE = "MIT"
 DEPENDS = "jpeg"
 PV = "0.9.0+svnr${SRCPV}"
-PR = "r2"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
diff --git a/meta-efl/recipes-efl/efl/ethumb.inc b/meta-efl/recipes-efl/efl/ethumb.inc
new file mode 100644
index 0000000..92a83ee
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/ethumb.inc
@@ -0,0 +1,22 @@
+DESCRIPTION = "EFL based thumbnail generation library"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e6a6db9e80255adbafa16e817d9a4d8c"
+DEPENDS = "libexif eet-native evas ecore edje eet edbus emotion epdf"
+
+INC_PR = "r0"
+
+inherit efl
+
+EXTRA_OECONF = "\
+  --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
+  --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \
+  --disable-docs \
+"
+
+# Some upgrade path tweaking, as in evas
+AUTO_LIBNAME_PKGS = ""
+
+FILES_${PN} += "\
+    ${bindir}/ethumbd \
+    ${libexecdir}/ethumbd_slave \
+"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.0.0.bb b/meta-efl/recipes-efl/efl/ethumb_1.0.0.bb
new file mode 100644
index 0000000..23ac60c
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/ethumb_1.0.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "485b6f47bffa9e44db4aa9cf60e3bcb5"
+SRC_URI[sha256sum] = "6d162b9b401aa4f7f3387edce7cd488c33e71633091b0cc1e9540471bb400de0"
diff --git a/meta-efl/recipes-efl/efl/ethumb_svn.bb b/meta-efl/recipes-efl/efl/ethumb_svn.bb
index ddf0e61..b7014f3 100644
--- a/meta-efl/recipes-efl/efl/ethumb_svn.bb
+++ b/meta-efl/recipes-efl/efl/ethumb_svn.bb
@@ -1,25 +1,12 @@
-DESCRIPTION = "EFL based thumbnail generation library"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e6a6db9e80255adbafa16e817d9a4d8c"
-DEPENDS = "libexif eet-native evas ecore edje eet edbus emotion epdf"
-PV = "0.1.0+svnr${SRCPV}"
-PR = "r3"
-SRCREV = "${EFL_SRCREV}"
+require ${BPN}.inc
 
-inherit efl
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
-S = "${WORKDIR}/${SRCNAME}"
+SRCREV = "${EFL_SRCREV}"
+PV = "1.0.0+svnr${SRCPV}"
+PR = "${INC_PR}.0"
+DEFAULT_PREFERENCE = "-1"
 
-EXTRA_OECONF = "\
-  --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
-  --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \
-  --disable-docs \
+SRC_URI = "\
+  ${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
 "
+S = "${WORKDIR}/${SRCNAME}"
 
-# Some upgrade path tweaking, as in evas
-AUTO_LIBNAME_PKGS = ""
-
-FILES_${PN} += "\
-    ${bindir}/ethumbd \
-    ${libexecdir}/ethumbd_slave \
-"
diff --git a/meta-efl/recipes-efl/efl/evas.inc b/meta-efl/recipes-efl/efl/evas.inc
index fd644de..99ec3f3 100644
--- a/meta-efl/recipes-efl/efl/evas.inc
+++ b/meta-efl/recipes-efl/efl/evas.inc
@@ -8,7 +8,7 @@ DEPENDS_virtclass-native = "freetype-native libxext-native libpng-native jpeg-na
 inherit efl
 
 BBCLASSEXTEND = "native"
-INC_PR = "r3"
+INC_PR = "r0"
 FILESPATHPKG =. "${BPN}-${PV}:${BPN}:"
 
 python populate_packages_prepend () {
@@ -48,31 +48,6 @@ RRECOMMENDS_${PN} = " \
 # Some upgrade path tweaking
 AUTO_LIBNAME_PKGS = ""
 
-RREPLACES_${PN} = "libevas-ver-pre-svn-00-0 libevas-ver-pre-svn-01-0"
-
-RREPLACES_${PN}-tests = "libevas-ver-pre-svn-00-tests libevas-ver-pre-svn-01-tests"
-
-RREPLACES_evas-loader-pmaps = "liblibevas-ver-pre-svn-00-loader-pmaps libevas-ver-pre-svn-00-loader-pmaps "
-RREPLACES_evas-loader-eet = "liblibevas-ver-pre-svn-00-loader-eet libevas-ver-pre-svn-00-loader-eet "
-RREPLACES_evas-loader-jpeg = "liblibevas-ver-pre-svn-00-loader-jpeg libevas-ver-pre-svn-00-loader-jpeg "
-RREPLACES_evas-loader-tiff = "liblibevas-ver-pre-svn-00-loader-tiff libevas-ver-pre-svn-00-loader-tiff "
-RREPLACES_evas-loader-png = "liblibevas-ver-pre-svn-00-loader-png libevas-ver-pre-svn-00-loader-png "
-RREPLACES_evas-loader-xpm = "liblibevas-ver-pre-svn-00-loader-xpm libevas-ver-pre-svn-00-loader-xpm "
-
-RREPLACES_evas-saver-pmaps = "liblibevas-ver-pre-svn-00-saver-pmaps libevas-ver-pre-svn-00-saver-pmaps "
-RREPLACES_evas-saver-eet = "liblibevas-ver-pre-svn-00-saver-eet libevas-ver-pre-svn-00-saver-eet "
-RREPLACES_evas-saver-jpeg = "liblibevas-ver-pre-svn-00-saver-jpeg libevas-ver-pre-svn-00-saver-jpeg "
-RREPLACES_evas-saver-tiff = "liblibevas-ver-pre-svn-00-saver-tiff libevas-ver-pre-svn-00-saver-tiff "
-RREPLACES_evas-saver-png = "liblibevas-ver-pre-svn-00-saver-png libevas-ver-pre-svn-00-saver-png "
-RREPLACES_evas-saver-xpm = "liblibevas-ver-pre-svn-00-saver-xpm libevas-ver-pre-svn-00-saver-xpm "
-
-RREPLACES_evas-engine-fb = "liblibevas-ver-pre-svn-00-engine-fb libevas-ver-pre-svn-00-engine-fb "
-RREPLACES_evas-engine-software-generic = "liblibevas-ver-pre-svn-00-engine-software-generic libevas-ver-pre-svn-00-engine-software-generic "
-RREPLACES_evas-engine-software-16 = "liblibevas-ver-pre-svn-00-engine-software-16 libevas-ver-pre-svn-00-engine-software-16 "
-RREPLACES_evas-engine-buffer = "liblibevas-ver-pre-svn-00-engine-buffer libevas-ver-pre-svn-00-engine-buffer "
-RREPLACES_evas-engine-xrender-x11 = "liblibevas-ver-pre-svn-00-engine-xrender-x11 libevas-ver-pre-svn-00-engine-xrender-x11 "
-RREPLACES_evas-engine-software-x11 = "liblibevas-ver-pre-svn-00-engine-software-x11 libevas-ver-pre-svn-00-engine-software-x11 "
-
 EVAS_CPU_TWEAKS = ""
 # Disabled for now, see http://thread.gmane.org/gmane.comp.window-managers.enlightenment.devel/25194
 EVAS_CPU_TWEAKS_armv7a = "--disable-cpu-neon"
diff --git a/meta-efl/recipes-efl/efl/evas_1.2.0.bb b/meta-efl/recipes-efl/efl/evas_1.2.0.bb
new file mode 100644
index 0000000..c8870d9
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas_1.2.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "bd573ab01d678280d570cbac07ef1053"
+SRC_URI[sha256sum] = "332bdc121677f1f3319beed59513e1e7ee9d0076bed8db53db428251cc52f2c0"
diff --git a/meta-efl/recipes-efl/efl/evas_svn.bb b/meta-efl/recipes-efl/efl/evas_svn.bb
index cf9f752..f238d06 100644
--- a/meta-efl/recipes-efl/efl/evas_svn.bb
+++ b/meta-efl/recipes-efl/efl/evas_svn.bb
@@ -1,8 +1,8 @@
-require evas.inc
+require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.1.0+svnr${SRCPV}"
-PR = "${INC_PR}.2"
+PV = "1.2.0+svnr${SRCPV}"
+PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
diff --git a/meta-efl/recipes-efl/efl/imlib2_svn.bb b/meta-efl/recipes-efl/efl/imlib2_svn.bb
index fbab70f..1365efb 100644
--- a/meta-efl/recipes-efl/efl/imlib2_svn.bb
+++ b/meta-efl/recipes-efl/efl/imlib2_svn.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 DEPENDS = "freetype libpng jpeg virtual/libx11 libxext"
 PROVIDES = "virtual/imlib2"
 PV = "1.4.2.001+svnr${SRCPV}"
-PR = "r4"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
diff --git a/meta-efl/recipes-efl/efl/libeflvala_svn.bb b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
index d288f1e..0465532 100644
--- a/meta-efl/recipes-efl/efl/libeflvala_svn.bb
+++ b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SECTION = "devel"
 DEPENDS = "vala-native glib-2.0 dbus dbus-glib eina eet evas ecore edje elementary tiff"
 PV = "2011.01.13.1+svnr${SRCPV}"
-PR = "r3"
 PE = "1"
 SRCREV = "${EFL_SRCREV}"
 SRCNAME = "vala"
diff --git a/meta-efl/recipes-efl/efl/libeweather_svn.bb b/meta-efl/recipes-efl/efl/libeweather_svn.bb
index 9053c90..58ece2e 100644
--- a/meta-efl/recipes-efl/efl/libeweather_svn.bb
+++ b/meta-efl/recipes-efl/efl/libeweather_svn.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "EFL-based weather widget library"
 LICENSE = "LGPL"
 DEPENDS = "ecore edje"
 PV = "0.0.0+svnr${SRCPV}"
-PR = "r0"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
-- 
1.7.8.5



