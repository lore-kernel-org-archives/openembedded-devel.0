Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1346772CFD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 May 2015 23:57:41 +0000 (UTC)
Received: by igbhj9 with SMTP id hj9so88158882igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 May 2015 16:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=w7ohntl+Cy2++51XFpoHQIvWQI4br9CnsLzAzJkydgM=;
	b=y9Go2VL5lv1KBuIo/WGX2oWXaGH+MerGKzU05cxLNX0HZhvX/CKQ6sPI/pIAs9YClJ
	IXiLSRGA44W+IcYRSwGzahuwt1iPhwnsZpGh3NkVAsZcIyUCOTrubV6GJzhFzZJrn6il
	m25g2JxGBP/7le6IFwF9H0VVzIt16vD+Zg43/IUJfWDoUSu92yIJvGiGu9IgTgZQ9vC7
	jB9P+qbn/ANP3tdJhZZZjd4TlbigmFuKL7eqH8P26VonODac2y4DUAEWeALdN0JIOyZ5
	E6ac0Jz1p7VPhhTgOmblrmnfAIJRu7MXUtbDf6Ex9gPG+DAHn3FvXE6EZM4EjGGsippi
	ZTKw==
X-Received: by 10.42.187.65 with SMTP id cv1mr18142140icb.87.1431647863023;
	Thu, 14 May 2015 16:57:43 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id m143sm394559ioe.4.2015.05.14.16.57.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 May 2015 16:57:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 May 2015 16:57:26 -0700
Message-Id: <1431647846-2409-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-browser][PATCH] cef,chromium: Separate out installs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 May 2015 23:57:43 -0000

Use specific domains for installation, so they can be built and
installed in a single build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{chromium/google-chrome => cef3/cef-simple}    |  6 ++---
 recipes-browser/chromium/cef3_280796.bb            |  1 +
 recipes-browser/chromium/chromium.inc              | 30 ++++++++++++----------
 recipes-browser/chromium/chromium/google-chrome    |  4 +--
 .../chromium/chromium/google-chrome.desktop        |  2 +-
 recipes-browser/chromium/chromium_40.0.2214.91.bb  |  4 +--
 6 files changed, 25 insertions(+), 22 deletions(-)
 copy recipes-browser/chromium/{chromium/google-chrome => cef3/cef-simple} (66%)

diff --git a/recipes-browser/chromium/chromium/google-chrome b/recipes-browser/chromium/cef3/cef-simple
similarity index 66%
copy from recipes-browser/chromium/chromium/google-chrome
copy to recipes-browser/chromium/cef3/cef-simple
index 78f4a29..ce377e1 100644
--- a/recipes-browser/chromium/chromium/google-chrome
+++ b/recipes-browser/chromium/cef3/cef-simple
@@ -1,11 +1,11 @@
 #!/bin/sh
 
 export CHROME_DEVEL_SANDBOX=/usr/sbin/chrome-devel-sandbox
-export LD_LIBRARY_PATH=/usr/lib/chrome
+export LD_LIBRARY_PATH=/usr/lib/cef3
 
 CHROME_EXTRA_ARGS=""
 if [ "${USER}" = "root" ] ; then
-	CHROME_EXTRA_ARGS="${CHROME_EXTRA_ARGS} --user-data-dir=${HOME}/.chromium/"
+	CHROME_EXTRA_ARGS="${CHROME_EXTRA_ARGS} --user-data-dir=${HOME}/.cef3/"
 fi
 
-/usr/bin/chrome/chrome ${CHROME_EXTRA_ARGS} $@
+/usr/bin/cef3/cefsimple ${CHROME_EXTRA_ARGS} $@
diff --git a/recipes-browser/chromium/cef3_280796.bb b/recipes-browser/chromium/cef3_280796.bb
index 9ca5810..9a9efe5 100644
--- a/recipes-browser/chromium/cef3_280796.bb
+++ b/recipes-browser/chromium/cef3_280796.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://people.linaro.org/~zoltan.kuscsik/chromium-browser/chromium_re
            git://github.com/kuscsik/ozone-egl.git;protocol=https;destsuffix=src/ui/ozone/platform/egl;branch=master;name=egl \
            git://chromium.googlesource.com/chromium/tools/depot_tools.git;protocol=https;destsuffix=depot_tools;branch=master;name=tools \
            file://01_get_svn_version_from_LASTCHANGE.patch \
+	   file://cef-simple \
 	  "
 SRC_URI[md5sum] = "9efbb50283b731042e62b9bd5e312b2f"
 SRC_URI[sha256sum] = "f608e97dadf6ea4d885b24fd876896d46840fa39bf743ea2025075aee9fb348d"
diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
index 72a649d..377e685 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -34,20 +34,23 @@ do_install() {
 	if [ -f "${WORKDIR}/google-chrome" ]; then
 		install -Dm 0755 ${WORKDIR}/google-chrome ${D}${bindir}/google-chrome
 	fi
+	if [ -f "${WORKDIR}/cef-simple" ]; then
+		install -Dm 0755 ${WORKDIR}/cef-simple ${D}${bindir}/cef-simple
+	fi
 	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/chrome_sandbox" ]; then
 		install -Dm 4755 ${B}/out/${CHROMIUM_BUILD_TYPE}/chrome_sandbox ${D}${sbindir}/chrome-devel-sandbox
 	fi
 	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/cefsimple" ]; then
-		install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/cefsimple ${D}${bindir}/cefsimple
+		install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/cefsimple ${D}${bindir}/${BPN}/cefsimple
 	fi
 	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/lib/libcef.so" ]; then
 		install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/lib/libcef.so ${D}${bindir}/lib/libcef.so
 	fi
 	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/chrome" ]; then
-		install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/chrome ${D}${bindir}/chrome/chrome
+		install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/chrome ${D}${bindir}/${BPN}/chrome
 	fi
 	if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/icudtl.dat" ]; then
-		install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/icudtl.dat ${D}${bindir}/chrome/icudtl.dat
+		install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/icudtl.dat ${D}${bindir}/${BPN}/icudtl.dat
 	fi
 	if [ -f "${WORKDIR}/google-chrome.desktop" ]; then
 		install -Dm 0644 ${WORKDIR}/google-chrome.desktop ${D}${datadir}/applications/google-chrome.desktop
@@ -55,7 +58,7 @@ do_install() {
 	#Chromium plugins libs
 	for f in libpdf.so libosmesa.so libffmpegsumo.so; do
 		if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/$f" ]; then
-			install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/$f ${D}${libdir}/chrome/$f
+			install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/$f ${D}${libdir}/${BPN}/$f
 		fi
 	done
 
@@ -64,7 +67,7 @@ do_install() {
 	         cef_100_percent.pak cef_200_percent.pak cef_resources.pak cef.pak \
 		 locales/en-US.pak; do
 		if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/$f" ]; then
-			install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/$f ${D}${bindir}/chrome/$f
+			install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/$f ${D}${bindir}/${BPN}/$f
 		fi
 	done
 
@@ -72,19 +75,18 @@ do_install() {
 
 PACKAGES =+ "${PN}-codecs-ffmpeg ${PN}-plugin-pdf"
 
-FILES_${PN}-codecs-ffmpeg = "${libdir}/chrome/libffmpegsumo.so"
-FILES_${PN}-plugin-pdf = "${libdir}/chrome/libpdf.so"
+FILES_${PN}-codecs-ffmpeg = "${libdir}/${BPN}/libffmpegsumo.so"
+FILES_${PN}-plugin-pdf = "${libdir}/${BPN}/libpdf.so"
+
+FILES_${PN} = "${bindir}/${BPN} ${datadir}/applications ${sbindir}/ ${libdir}/${BPN}/"
+FILES_${PN} += "${bindir} ${libdir}"
+FILES_${PN} += "${bindir}/${BPN}/*.pak"
+FILES_${PN} += "${bindir}/${BPN}/locales/*.pak"
 
-FILES_${PN} = "${bindir}/chrome/ ${bindir}/google-chrome ${datadir}/applications ${sbindir}/ ${libdir}/chrome/"
-FILES_${PN}-dbg += "${bindir}/chrome/.debug/ ${libdir}/chrome/.debug/"
+FILES_${PN}-dbg += "${bindir}/${BPN}/.debug/ ${libdir}/${BPN}/.debug/ ${libdir}/.debug/"
 
 PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
 
 INSANE_SKIP_${PN} = "ldflags"
 SOLIBS = ".so"
 FILES_SOLIBSDEV = ""
-FILES_${PN} += "${bindir} ${bindir}/chrome/ ${libdir}"
-FILES_${PN} += "${bindir}/chrome/*.pak"
-FILES_${PN} += "${bindir}/chrome/locales/*.pak"
-FILES_${PN}-dbg += "${bindir}/chrome/.debug/ ${libdir}/.debug/"
-
diff --git a/recipes-browser/chromium/chromium/google-chrome b/recipes-browser/chromium/chromium/google-chrome
index 78f4a29..b1ec288 100644
--- a/recipes-browser/chromium/chromium/google-chrome
+++ b/recipes-browser/chromium/chromium/google-chrome
@@ -1,11 +1,11 @@
 #!/bin/sh
 
 export CHROME_DEVEL_SANDBOX=/usr/sbin/chrome-devel-sandbox
-export LD_LIBRARY_PATH=/usr/lib/chrome
+export LD_LIBRARY_PATH=/usr/lib/chromium
 
 CHROME_EXTRA_ARGS=""
 if [ "${USER}" = "root" ] ; then
 	CHROME_EXTRA_ARGS="${CHROME_EXTRA_ARGS} --user-data-dir=${HOME}/.chromium/"
 fi
 
-/usr/bin/chrome/chrome ${CHROME_EXTRA_ARGS} $@
+/usr/bin/chromium/chrome ${CHROME_EXTRA_ARGS} $@
diff --git a/recipes-browser/chromium/chromium/google-chrome.desktop b/recipes-browser/chromium/chromium/google-chrome.desktop
index 76a2533..094bd82 100644
--- a/recipes-browser/chromium/chromium/google-chrome.desktop
+++ b/recipes-browser/chromium/chromium/google-chrome.desktop
@@ -107,7 +107,7 @@ Comment[zh_HK]=???????
 Comment[zh_TW]=???????
 Exec=/usr/bin/google-chrome %U
 Terminal=false
-Icon=/usr/bin/chrome/product_logo_48.png
+Icon=/usr/bin/chromium/product_logo_48.png
 Type=Application
 Categories=Network;WebBrowser;
 MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;
diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-browser/chromium/chromium_40.0.2214.91.bb
index 53af755..0a73f1e 100644
--- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
+++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
@@ -189,8 +189,8 @@ do_install_append() {
 
 	# Always adding this libdir (not just with component builds), because the
         # LD_LIBRARY_PATH line in the google-chromium script refers to it
-        install -d ${D}${libdir}/chrome/
+        install -d ${D}${libdir}/${BPN}/
         if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'component-build', 'component-build', '', d)}" ]; then
-                install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/lib/*.so ${D}${libdir}/chrome/
+                install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/lib/*.so ${D}${libdir}/${BPN}/
         fi
 }
-- 
2.1.4


