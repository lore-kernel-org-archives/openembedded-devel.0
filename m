Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SphwU-0002I6-Ox
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 17:38:06 +0200
Received: by eeit10 with SMTP id t10so471938eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 08:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=q9LR5/LcxP5zAU7pTgGOXXsPL+oIa3bBIen6X601e80=;
	b=ooO+lk/2KDHWBRUskzbevuvjLHfgCtRRC0CdJd77ODY6NmwM3qOYf1hCvnYVknR7eb
	vHalJRMdrxby3cG+AUmLLzAa7A1mxF7trayiQUOcPpKVgufxIFYHLGjENfYndS0aNuNU
	bLN3S1IO61oUjXDH2mwSnZC5utb2/Ad6MD8MKjohdl+U+2b/6Rce7svr2VRelVo82rKU
	/o6yv4XdIKlHZk243DYJWHEbu3fn0zvZx18S2VEYpAZ9DQxWQX/itUMwcNMvUraG4jx5
	prJdn23KiBZuEsvD28lbpLE9SlNtG/nQxb7FLD6zaeXDywu1o9MQFGZVNyw/o1ZVof1K
	iGfg==
Received: by 10.14.99.132 with SMTP id x4mr471313eef.1.1342193211963;
	Fri, 13 Jul 2012 08:26:51 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id t3sm26188589eeb.15.2012.07.13.08.26.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 08:26:50 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 17:26:45 +0200
Message-Id: <1342193205-25293-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlfUp9ye/5bnHuqeDf9TT3YBh20q1c1HCQ49EjSQBlB9FfW3utQXgPKyiFVU+ho7BzOD1lO
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][meta-efl][PATCH] various: update ; proto= to ; protocol= in SRC_URI
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
X-List-Received-Date: Fri, 13 Jul 2012 15:38:06 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-efl/recipes-devtools/python/python-efl.inc    |    2 +-
 meta-efl/recipes-efl/e17/e-module.inc              |    2 +-
 .../e17/e-wm-theme-illume-efenniht_svn.bb          |    2 +-
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |    2 +-
 meta-efl/recipes-efl/e17/edje-viewer_svn.bb        |    2 +-
 meta-efl/recipes-efl/e17/elementary-alarm_svn.bb   |    2 +-
 meta-efl/recipes-efl/e17/elmdentica_svn.bb         |    2 +-
 meta-efl/recipes-efl/e17/emprint_svn.bb            |    2 +-
 meta-efl/recipes-efl/e17/enjoy_svn.bb              |    2 +-
 meta-efl/recipes-efl/e17/eve_svn.bb                |    2 +-
 meta-efl/recipes-efl/e17/exalt_svn.bb              |    2 +-
 meta-efl/recipes-efl/e17/expedite_svn.bb           |    2 +-
 meta-efl/recipes-efl/e17/exquisite-theme-illume.bb |    2 +-
 meta-efl/recipes-efl/e17/exquisite_svn.bb          |    2 +-
 meta-efl/recipes-efl/e17/rage_svn.bb               |    2 +-
 meta-efl/recipes-efl/e17/waker_svn.bb              |    2 +-
 meta-efl/recipes-efl/efl/azy_svn.bb                |    2 +-
 meta-efl/recipes-efl/efl/ecore_svn.bb              |    2 +-
 meta-efl/recipes-efl/efl/edb_svn.bb                |    2 +-
 meta-efl/recipes-efl/efl/edbus_svn.bb              |    2 +-
 meta-efl/recipes-efl/efl/edje_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/eet_svn.bb                |    2 +-
 meta-efl/recipes-efl/efl/eeze_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/efreet_svn.bb             |    2 +-
 meta-efl/recipes-efl/efl/eina_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/eio_svn.bb                |    2 +-
 .../efl/elementary-theme-efenniht_svn.bb           |    4 ++--
 meta-efl/recipes-efl/efl/elementary_svn.bb         |    2 +-
 meta-efl/recipes-efl/efl/elsa_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/embryo_svn.bb             |    2 +-
 meta-efl/recipes-efl/efl/emotion_svn.bb            |    2 +-
 meta-efl/recipes-efl/efl/engrave_svn.bb            |    2 +-
 meta-efl/recipes-efl/efl/epdf_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/epeg_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/ethumb_svn.bb             |    2 +-
 meta-efl/recipes-efl/efl/evas_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/imlib2_svn.bb             |    2 +-
 meta-efl/recipes-efl/efl/libeflvala_svn.bb         |    2 +-
 meta-efl/recipes-efl/efl/libeweather_svn.bb        |    2 +-
 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |    6 +++---
 meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb     |    2 +-
 meta-oe/recipes-multimedia/jack/jack_0.121.0.bb    |    2 +-
 .../recipes-support/opencv/opencv-samples_2.4.bb   |    2 +-
 meta-oe/recipes-support/opencv/opencv_2.4.bb       |    2 +-
 toolchain-layer/recipes-devtools/gcc/gcc-4.6.inc   |    2 +-
 45 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/meta-efl/recipes-devtools/python/python-efl.inc b/meta-efl/recipes-devtools/python/python-efl.inc
index fe4521c..6ca5e3f 100644
--- a/meta-efl/recipes-devtools/python/python-efl.inc
+++ b/meta-efl/recipes-devtools/python/python-efl.inc
@@ -15,7 +15,7 @@ export HOST_SYS
 
 inherit e-base autotools pkgconfig distutils-base
 
-SRC_URI = "${E_SVN}/trunk/BINDINGS/python;module=${SRCNAME};proto=http"
+SRC_URI = "${E_SVN}/trunk/BINDINGS/python;module=${SRCNAME};protocol=http"
 S = "${WORKDIR}/${SRCNAME}"
 
 
diff --git a/meta-efl/recipes-efl/e17/e-module.inc b/meta-efl/recipes-efl/e17/e-module.inc
index 2c1706e..d3f6e1b 100644
--- a/meta-efl/recipes-efl/e17/e-module.inc
+++ b/meta-efl/recipes-efl/e17/e-module.inc
@@ -8,7 +8,7 @@ INC_PR = "r0"
 SRCNAME = "E-MODULES-EXTRA/${PN}"
 
 inherit e gettext
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
+SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
 EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc"
diff --git a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb b/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
index 038a19f..5ff0681 100644
--- a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
@@ -18,7 +18,7 @@ PV = "0.0+svnr${SRCPV}"
 inherit e-base allarch
 
 SRCNAME = "efenniht"
-SRC_URI = "${E_SVN}/trunk/THEMES;module=${SRCNAME};proto=http \
+SRC_URI = "${E_SVN}/trunk/THEMES;module=${SRCNAME};protocol=http \
            file://LICENSE \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index dd62eeb..0c9ad93 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -10,7 +10,7 @@ inherit e update-alternatives gettext
 S = "${WORKDIR}/${SRCNAME}"
 
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};proto=http \
+  ${E_SVN}/trunk;module=${SRCNAME};protocol=http \
   file://enlightenment_start.oe \
   file://applications.menu \
 "
diff --git a/meta-efl/recipes-efl/e17/edje-viewer_svn.bb b/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
index f59cbb1..c2670e0 100644
--- a/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
+++ b/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
@@ -7,7 +7,7 @@ SRCREV = "${EFL_SRCREV}"
 inherit e
 
 SRCNAME = "edje_viewer"
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
+SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
 FILES_${PN} += "${datadir}"
diff --git a/meta-efl/recipes-efl/e17/elementary-alarm_svn.bb b/meta-efl/recipes-efl/e17/elementary-alarm_svn.bb
index e25ced6..6c44109 100644
--- a/meta-efl/recipes-efl/e17/elementary-alarm_svn.bb
+++ b/meta-efl/recipes-efl/e17/elementary-alarm_svn.bb
@@ -6,7 +6,7 @@ PV = "0.0.0+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e
-SRC_URI = "${E_SVN}/trunk/TMP/st;module=${SRCNAME};proto=http;scmdata=keep"
+SRC_URI = "${E_SVN}/trunk/TMP/st;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
 RDEPENDS_${PN} = "waker"
diff --git a/meta-efl/recipes-efl/e17/elmdentica_svn.bb b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
index 5235dee..c965b68 100644
--- a/meta-efl/recipes-efl/e17/elmdentica_svn.bb
+++ b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://elmdentica.googlecode.com"
 AUTHOR = "seabra"
 
 inherit e gettext
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
+SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
 EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc"
diff --git a/meta-efl/recipes-efl/e17/emprint_svn.bb b/meta-efl/recipes-efl/e17/emprint_svn.bb
index d5c4769..777e302 100644
--- a/meta-efl/recipes-efl/e17/emprint_svn.bb
+++ b/meta-efl/recipes-efl/e17/emprint_svn.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
+SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
 FILES_${PN}-dbg += "${libdir}/${PN}/modules/.debug"
diff --git a/meta-efl/recipes-efl/e17/enjoy_svn.bb b/meta-efl/recipes-efl/e17/enjoy_svn.bb
index e1facd7..81be734 100644
--- a/meta-efl/recipes-efl/e17/enjoy_svn.bb
+++ b/meta-efl/recipes-efl/e17/enjoy_svn.bb
@@ -21,7 +21,7 @@ RDEPENDS += "\
        "
 
 inherit e gettext
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
+SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
 FILES_${PN} += "${datadir}/icons/"
diff --git a/meta-efl/recipes-efl/e17/eve_svn.bb b/meta-efl/recipes-efl/e17/eve_svn.bb
index 9806d4f..d760c4a 100644
--- a/meta-efl/recipes-efl/e17/eve_svn.bb
+++ b/meta-efl/recipes-efl/e17/eve_svn.bb
@@ -6,7 +6,7 @@ PV = "0.3.0.0+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e gettext
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
+SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
 do_configure_prepend() {
diff --git a/meta-efl/recipes-efl/e17/exalt_svn.bb b/meta-efl/recipes-efl/e17/exalt_svn.bb
index 06fb5bd..3207a4b 100644
--- a/meta-efl/recipes-efl/e17/exalt_svn.bb
+++ b/meta-efl/recipes-efl/e17/exalt_svn.bb
@@ -9,7 +9,7 @@ PV = "0.9+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
+SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
 EXTRA_OECONF = " \
diff --git a/meta-efl/recipes-efl/e17/expedite_svn.bb b/meta-efl/recipes-efl/e17/expedite_svn.bb
index f238d06..594de4a 100644
--- a/meta-efl/recipes-efl/e17/expedite_svn.bb
+++ b/meta-efl/recipes-efl/e17/expedite_svn.bb
@@ -6,6 +6,6 @@ PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
+  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb b/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
index ecb53cc..9037f68 100644
--- a/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
+++ b/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
@@ -15,7 +15,7 @@ ALTERNATIVE_PRIORITY = "10"
 
 SRCNAME = "b_and_w"
 
-SRC_URI = "${E_SVN}/trunk/THEMES;module=${SRCNAME};proto=http \
+SRC_URI = "${E_SVN}/trunk/THEMES;module=${SRCNAME};protocol=http \
            file://LICENSE \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/e17/exquisite_svn.bb b/meta-efl/recipes-efl/e17/exquisite_svn.bb
index a13a300..a25c4b3 100644
--- a/meta-efl/recipes-efl/e17/exquisite_svn.bb
+++ b/meta-efl/recipes-efl/e17/exquisite_svn.bb
@@ -9,7 +9,7 @@ RCONFLICTS_${PN} = "psplash virtual-psplash"
 SRCNAME = "exquisite"
 
 inherit e
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
+SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
 EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc"
diff --git a/meta-efl/recipes-efl/e17/rage_svn.bb b/meta-efl/recipes-efl/e17/rage_svn.bb
index 2823987..2038054 100644
--- a/meta-efl/recipes-efl/e17/rage_svn.bb
+++ b/meta-efl/recipes-efl/e17/rage_svn.bb
@@ -8,5 +8,5 @@ PV = "0.3.0.042+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
+SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/e17/waker_svn.bb b/meta-efl/recipes-efl/e17/waker_svn.bb
index 9eb58fc..1d6d846 100644
--- a/meta-efl/recipes-efl/e17/waker_svn.bb
+++ b/meta-efl/recipes-efl/e17/waker_svn.bb
@@ -8,7 +8,7 @@ SRCREV = "${EFL_SRCREV}"
 inherit efl
 
 SRC_URI = "\
-  ${E_SVN}/trunk/TMP/st;module=${SRCNAME};proto=http \
+  ${E_SVN}/trunk/TMP/st;module=${SRCNAME};protocol=http \
   file://0001-waker-remove-old-ecore_string_init-and-ecore_string_.patch \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/azy_svn.bb b/meta-efl/recipes-efl/efl/azy_svn.bb
index bd4268c..814fb46 100644
--- a/meta-efl/recipes-efl/efl/azy_svn.bb
+++ b/meta-efl/recipes-efl/efl/azy_svn.bb
@@ -26,6 +26,6 @@ do_install_append_virtclass-native() {
 
 inherit efl
 
-SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};proto=http;scmdata=keep"
+SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
diff --git a/meta-efl/recipes-efl/efl/ecore_svn.bb b/meta-efl/recipes-efl/efl/ecore_svn.bb
index f0e8811..05cc9db 100644
--- a/meta-efl/recipes-efl/efl/ecore_svn.bb
+++ b/meta-efl/recipes-efl/efl/ecore_svn.bb
@@ -6,7 +6,7 @@ PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
+  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
   file://fix-ecore-fb-initialization.patch \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/edb_svn.bb b/meta-efl/recipes-efl/efl/edb_svn.bb
index 3ff9d3c..9963563 100644
--- a/meta-efl/recipes-efl/efl/edb_svn.bb
+++ b/meta-efl/recipes-efl/efl/edb_svn.bb
@@ -6,5 +6,5 @@ SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 
-SRC_URI = "${E_SVN}/OLD;module=${SRCNAME};proto=http;scmdata=keep"
+SRC_URI = "${E_SVN}/OLD;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/edbus_svn.bb b/meta-efl/recipes-efl/efl/edbus_svn.bb
index f238d06..594de4a 100644
--- a/meta-efl/recipes-efl/efl/edbus_svn.bb
+++ b/meta-efl/recipes-efl/efl/edbus_svn.bb
@@ -6,6 +6,6 @@ PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
+  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/edje_svn.bb b/meta-efl/recipes-efl/efl/edje_svn.bb
index f238d06..594de4a 100644
--- a/meta-efl/recipes-efl/efl/edje_svn.bb
+++ b/meta-efl/recipes-efl/efl/edje_svn.bb
@@ -6,6 +6,6 @@ PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
+  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/eet_svn.bb b/meta-efl/recipes-efl/efl/eet_svn.bb
index 4e822d2..e9de45c 100644
--- a/meta-efl/recipes-efl/efl/eet_svn.bb
+++ b/meta-efl/recipes-efl/efl/eet_svn.bb
@@ -6,6 +6,6 @@ PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
+  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/eeze_svn.bb b/meta-efl/recipes-efl/efl/eeze_svn.bb
index f238d06..594de4a 100644
--- a/meta-efl/recipes-efl/efl/eeze_svn.bb
+++ b/meta-efl/recipes-efl/efl/eeze_svn.bb
@@ -6,6 +6,6 @@ PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
+  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/efreet_svn.bb b/meta-efl/recipes-efl/efl/efreet_svn.bb
index f238d06..594de4a 100644
--- a/meta-efl/recipes-efl/efl/efreet_svn.bb
+++ b/meta-efl/recipes-efl/efl/efreet_svn.bb
@@ -6,6 +6,6 @@ PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
+  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/eina_svn.bb b/meta-efl/recipes-efl/efl/eina_svn.bb
index f238d06..594de4a 100644
--- a/meta-efl/recipes-efl/efl/eina_svn.bb
+++ b/meta-efl/recipes-efl/efl/eina_svn.bb
@@ -6,6 +6,6 @@ PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
+  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/eio_svn.bb b/meta-efl/recipes-efl/efl/eio_svn.bb
index 4e7b7d9..f43c47f 100644
--- a/meta-efl/recipes-efl/efl/eio_svn.bb
+++ b/meta-efl/recipes-efl/efl/eio_svn.bb
@@ -6,6 +6,6 @@ PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
+  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb b/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
index 70a184a..d764e96 100644
--- a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
@@ -20,8 +20,8 @@ PV = "0.0+svnr${SRCPV}"
 inherit e-base allarch
 
 SRCNAME = "efenniht"
-SRC_URI = "${E_SVN}/trunk/THEMES;module=${SRCNAME};proto=http;name=THM_REV"
-SRC_URI += "${E_SVN}/trunk/elementary/data;module=themes;proto=http;name=ELM_REV"
+SRC_URI = "${E_SVN}/trunk/THEMES;module=${SRCNAME};protocol=http;name=THM_REV"
+SRC_URI += "${E_SVN}/trunk/elementary/data;module=themes;protocol=http;name=ELM_REV"
 SRC_URI += "file://LICENSE"
 S = "${WORKDIR}/${SRCNAME}"
 
diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index 4e7b7d9..f43c47f 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -6,6 +6,6 @@ PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
+  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/elsa_svn.bb b/meta-efl/recipes-efl/efl/elsa_svn.bb
index b8a4f63..9629610 100644
--- a/meta-efl/recipes-efl/efl/elsa_svn.bb
+++ b/meta-efl/recipes-efl/efl/elsa_svn.bb
@@ -7,7 +7,7 @@ SECTION = "e/apps"
 PR = "r1"
 
 inherit e gettext
-SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};proto=http;scmdata=keep \
+SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};protocol=http;scmdata=keep \
   file://0001-pam-use-common-auth-instead-of-system-auth.patch \
   file://xserver-nodm.service \
 "
diff --git a/meta-efl/recipes-efl/efl/embryo_svn.bb b/meta-efl/recipes-efl/efl/embryo_svn.bb
index f238d06..594de4a 100644
--- a/meta-efl/recipes-efl/efl/embryo_svn.bb
+++ b/meta-efl/recipes-efl/efl/embryo_svn.bb
@@ -6,6 +6,6 @@ PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
+  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/emotion_svn.bb b/meta-efl/recipes-efl/efl/emotion_svn.bb
index 4e7b7d9..f43c47f 100644
--- a/meta-efl/recipes-efl/efl/emotion_svn.bb
+++ b/meta-efl/recipes-efl/efl/emotion_svn.bb
@@ -6,6 +6,6 @@ PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
+  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/engrave_svn.bb b/meta-efl/recipes-efl/efl/engrave_svn.bb
index 65cb41b..2ebb0a1 100644
--- a/meta-efl/recipes-efl/efl/engrave_svn.bb
+++ b/meta-efl/recipes-efl/efl/engrave_svn.bb
@@ -6,5 +6,5 @@ PV = "0.0.0+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
-SRC_URI = "${E_SVN}/OLD;module=${SRCNAME};proto=http;scmdata=keep"
+SRC_URI = "${E_SVN}/OLD;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/epdf_svn.bb b/meta-efl/recipes-efl/efl/epdf_svn.bb
index 2ab1a9e..9f414cd 100644
--- a/meta-efl/recipes-efl/efl/epdf_svn.bb
+++ b/meta-efl/recipes-efl/efl/epdf_svn.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6 \
 "
 
-SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};proto=http;scmdata=keep \
+SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
 
diff --git a/meta-efl/recipes-efl/efl/epeg_svn.bb b/meta-efl/recipes-efl/efl/epeg_svn.bb
index bc45bfb..fc2a896 100644
--- a/meta-efl/recipes-efl/efl/epeg_svn.bb
+++ b/meta-efl/recipes-efl/efl/epeg_svn.bb
@@ -5,5 +5,5 @@ PV = "0.9.0+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
-SRC_URI = "${E_SVN}/OLD;module=${SRCNAME};proto=http;scmdata=keep"
+SRC_URI = "${E_SVN}/OLD;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/ethumb_svn.bb b/meta-efl/recipes-efl/efl/ethumb_svn.bb
index b7014f3..ac03014 100644
--- a/meta-efl/recipes-efl/efl/ethumb_svn.bb
+++ b/meta-efl/recipes-efl/efl/ethumb_svn.bb
@@ -6,7 +6,7 @@ PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
+  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
 
diff --git a/meta-efl/recipes-efl/efl/evas_svn.bb b/meta-efl/recipes-efl/efl/evas_svn.bb
index f238d06..594de4a 100644
--- a/meta-efl/recipes-efl/efl/evas_svn.bb
+++ b/meta-efl/recipes-efl/efl/evas_svn.bb
@@ -6,6 +6,6 @@ PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep \
+  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/imlib2_svn.bb b/meta-efl/recipes-efl/efl/imlib2_svn.bb
index 1365efb..83de3fe 100644
--- a/meta-efl/recipes-efl/efl/imlib2_svn.bb
+++ b/meta-efl/recipes-efl/efl/imlib2_svn.bb
@@ -8,7 +8,7 @@ PV = "1.4.2.001+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
+SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
 EXTRA_OECONF = "--with-x \
diff --git a/meta-efl/recipes-efl/efl/libeflvala_svn.bb b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
index 0465532..1bde2fe 100644
--- a/meta-efl/recipes-efl/efl/libeflvala_svn.bb
+++ b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
@@ -11,7 +11,7 @@ SRCNAME = "vala"
 
 inherit e-base autotools pkgconfig vala
 
-SRC_URI = "${E_SVN}/trunk/BINDINGS;module=${SRCNAME};proto=http \
+SRC_URI = "${E_SVN}/trunk/BINDINGS;module=${SRCNAME};protocol=http \
 "
 S = "${WORKDIR}/${SRCNAME}"
 
diff --git a/meta-efl/recipes-efl/efl/libeweather_svn.bb b/meta-efl/recipes-efl/efl/libeweather_svn.bb
index 58ece2e..c498278 100644
--- a/meta-efl/recipes-efl/efl/libeweather_svn.bb
+++ b/meta-efl/recipes-efl/efl/libeweather_svn.bb
@@ -5,7 +5,7 @@ PV = "0.0.0+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
-SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};proto=http;scmdata=keep"
+SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
 EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc"
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
index cd38096..0c490c3 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
+++ b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
@@ -16,9 +16,9 @@ PR = "r2"
 SRCREV_FORMAT = "source"
 
 SRC_URI = "\
-  svn://svn.webkit.org/repository/webkit/trunk;module=Source;name=source;proto=http;subdir=src \
-  svn://svn.webkit.org/repository/webkit/trunk/;module=WebKitLibraries;proto=http;subdir=src \
-  svn://svn.webkit.org/repository/webkit/trunk/;module=Tools;proto=http;subdir=src \
+  svn://svn.webkit.org/repository/webkit/trunk;module=Source;name=source;protocol=http;subdir=src \
+  svn://svn.webkit.org/repository/webkit/trunk/;module=WebKitLibraries;protocol=http;subdir=src \
+  svn://svn.webkit.org/repository/webkit/trunk/;module=Tools;protocol=http;subdir=src \
   file://0001-JavaScriptCore-add-EINA_LIBRARIES-to-shell-build-for.patch \
   file://0001-CMake-Do-not-pass-P-to-the-preprocessor-when-running.patch \
   file://CMakeLists.txt \
diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
index f061f41..dd81606 100644
--- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
+++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=78fa8dbac547bb5b2a0e6457a6cfe
 PV = "8d+1.2.1"
 PR = "r1"
 SRCREV = "837"
-SRC_URI = "svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-turbo;proto=https;module=trunk"
+SRC_URI = "svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-turbo;protocol=https;module=trunk"
 
 S = "${WORKDIR}/trunk"
 
diff --git a/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb b/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
index ca98146..111c61e 100644
--- a/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
@@ -15,7 +15,7 @@ DEPENDS = "alsa-lib"
 
 SVNPV = "${@'${PV}'.replace('.', '_')}"
 SRCREV = "4484"
-SRC_URI = "svn://subversion.jackaudio.org/jack/tags;module=RELEASE_${SVNPV};proto=http \
+SRC_URI = "svn://subversion.jackaudio.org/jack/tags;module=RELEASE_${SVNPV};protocol=http \
            file://remove-wrong-host-test.patch \
            file://jack_fix_TWL4030_alsa_capture.patch \
           "
diff --git a/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb b/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
index 90f7536..7ede7c7 100644
--- a/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
@@ -8,7 +8,7 @@ DEPENDS = "opencv"
 LIC_FILES_CHKSUM = "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932466bb14 \
 "
 
-SRC_URI = "svn://code.opencv.org/svn/opencv/branches/2.4;module=opencv;proto=http \
+SRC_URI = "svn://code.opencv.org/svn/opencv/branches/2.4;module=opencv;protocol=http \
           "
 
 SRCREV = "8988"
diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index e56eacd..942e89a 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -9,7 +9,7 @@ ARM_INSTRUCTION_SET = "arm"
 
 DEPENDS = "python-numpy v4l-utils libav gtk+ libtool swig swig-native python jpeg bzip2 zlib libpng tiff glib-2.0"
 
-SRC_URI = "svn://code.opencv.org/svn/opencv/branches/2.4;module=opencv;proto=http \
+SRC_URI = "svn://code.opencv.org/svn/opencv/branches/2.4;module=opencv;protocol=http \
            file://0001-Fix-CMakeLists.txt-numpy-detection.patch \
           "
 
diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-4.6.inc b/toolchain-layer/recipes-devtools/gcc/gcc-4.6.inc
index 0859067..20ceb49 100644
--- a/toolchain-layer/recipes-devtools/gcc/gcc-4.6.inc
+++ b/toolchain-layer/recipes-devtools/gcc/gcc-4.6.inc
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 		   file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8"
 
-SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
+SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};protocol=http \
 	   file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
 	   file://100-uclibc-conf.patch \
            file://gcc-uclibc-locale-ctype_touplow_t.patch \
-- 
1.7.7.3



