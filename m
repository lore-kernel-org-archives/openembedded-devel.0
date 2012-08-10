Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szpgf-0001GZ-1g
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:55:37 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1218754wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Sqli7OgBCMjNJ/1RF6AJ1Rp587nvjPu+LyrKOkDZuRs=;
	b=c3ReBAb5RJGrxUS4r/gFeWObZZBAPLVH2HD9iYQhjOGsC9gB7+Wp14tTgkaVoLRw5J
	sntLAvWMVzRHwXxb4c7Wunql5POhP/vCkbQ47Upx2koX3lzdeJLDICe5gMz/L/Gj69Gr
	JnJbikZ6rUg6rO5fqigp8XggHXmzlq2DrVSu2Zax4sSWUUyDqHEQbYioVherFCRRcA2v
	w1DyyOm3LEa9Dj3vHkZ9TWwLL4RRyF2FOxKX/ZPjsAlYPdpt56LNcNfcAkg3B7qqMgpl
	V6V7JYIrYQSR/z1W9FtA5Ubz9dzFktT/+fVWurt46yAaWAWCvzvalNE2sjgW13cQvsp0
	GolQ==
Received: by 10.180.109.166 with SMTP id ht6mr6203605wib.11.1344606229590;
	Fri, 10 Aug 2012 06:43:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ep14sm8240186wid.0.2012.08.10.06.43.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:43:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:42:56 +0200
Message-Id: <30224eaf04b0482579ecab30ef44293b50fa1b82.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 01/46] meta-efl: unify tabs/spaces usage
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
X-List-Received-Date: Fri, 10 Aug 2012 13:55:37 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e.bbclass                         |    4 +-
 meta-efl/classes/efl.bbclass                       |    8 ++--
 meta-efl/recipes-devtools/python/python-efl.inc    |   30 ++++++++++----------
 .../e17/e-wm-theme-illume-efenniht_svn.bb          |    6 ++--
 meta-efl/recipes-efl/e17/e-wm/applications.menu    |    6 ++--
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |    2 +-
 meta-efl/recipes-efl/e17/enjoy_svn.bb              |   10 +++---
 meta-efl/recipes-efl/e17/exalt-client_svn.bb       |    4 +-
 meta-efl/recipes-efl/e17/exalt_svn.bb              |   12 ++++----
 .../recipes-efl/e17/illume-keyboards-shr_git.bb    |    4 +-
 meta-efl/recipes-efl/e17/news_svn.bb               |    4 +-
 meta-efl/recipes-efl/e17/places_svn.bb             |    2 +-
 meta-efl/recipes-efl/e17/rain_svn.bb               |    4 +-
 meta-efl/recipes-efl/e17/screenshot_svn.bb         |    2 +-
 meta-efl/recipes-efl/efl/ecore.inc                 |    4 +-
 meta-efl/recipes-efl/efl/edje-fpu.inc              |    6 ++--
 meta-efl/recipes-efl/efl/edje.inc                  |   14 ++++----
 .../efl/elementary-theme-efenniht_svn.bb           |    6 ++--
 meta-efl/recipes-efl/efl/imlib2_svn.bb             |    4 +-
 19 files changed, 66 insertions(+), 66 deletions(-)

diff --git a/meta-efl/classes/e.bbclass b/meta-efl/classes/e.bbclass
index 375f914..4bcc2bc 100644
--- a/meta-efl/classes/e.bbclass
+++ b/meta-efl/classes/e.bbclass
@@ -3,12 +3,12 @@ SECTION = "e/apps"
 inherit e-base autotools pkgconfig binconfig
 
 do_prepsources () {
-	make clean distclean || true
+    make clean distclean || true
 }
 addtask prepsources after do_patch before do_configure
 
 do_configure_append() {
-	find ${S} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
+    find ${S} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
 }
 
 export CURL_CONFIG = "${STAGING_BINDIR_CROSS}/curl-config"
diff --git a/meta-efl/classes/efl.bbclass b/meta-efl/classes/efl.bbclass
index 792343b..7cf8556 100644
--- a/meta-efl/classes/efl.bbclass
+++ b/meta-efl/classes/efl.bbclass
@@ -10,13 +10,13 @@ inherit e-base autotools
 # evas-native looks at this var, so keep it
 
 do_configure_prepend() {
-	autopoint || touch config.rpath
+    autopoint || touch config.rpath
 }
 
 do_install_prepend () {
-	for i in `find ${S}/ -name "*.pc" -type f` ; do \
-		sed -i -e 's:-L${STAGING_LIBDIR}:-L\$\{libdir\}:g' -e 's:-I${STAGING_LIBDIR}:-I\$\{libdir\}:g' -e 's:-I${STAGING_INCDIR}:-I\$\{includedir\}:g' $i
-	done
+    for i in `find ${S}/ -name "*.pc" -type f` ; do \
+        sed -i -e 's:-L${STAGING_LIBDIR}:-L\$\{libdir\}:g' -e 's:-I${STAGING_LIBDIR}:-I\$\{libdir\}:g' -e 's:-I${STAGING_INCDIR}:-I\$\{includedir\}:g' $i
+    done
 }
 
 PACKAGES =+ "${PN}-themes"
diff --git a/meta-efl/recipes-devtools/python/python-efl.inc b/meta-efl/recipes-devtools/python/python-efl.inc
index 6ca5e3f..a4df6a6 100644
--- a/meta-efl/recipes-devtools/python/python-efl.inc
+++ b/meta-efl/recipes-devtools/python/python-efl.inc
@@ -20,24 +20,24 @@ S = "${WORKDIR}/${SRCNAME}"
 
 
 do_configure_prepend() {
-	# prefix CYTHON_.*_INCLUDEDIR with path to STAGING_DIR_HOST also use $PKG_CONFIG instead of pkg-config directly
-        sed -i "s#\`\$PKG_CONFIG --variable=includedir \"python-evas#${STAGING_DIR_HOST}\`\$PKG_CONFIG --variable=includedir \"python-evas#g" ${S}/configure.ac
+    # prefix CYTHON_.*_INCLUDEDIR with path to STAGING_DIR_HOST also use $PKG_CONFIG instead of pkg-config directly
+    sed -i "s#\`\$PKG_CONFIG --variable=includedir \"python-evas#${STAGING_DIR_HOST}\`\$PKG_CONFIG --variable=includedir \"python-evas#g" ${S}/configure.ac
 }
 
 do_install_append() {
-	if [ -e examples ]; then
-		for i in `find examples -name "*.edc"`; do
-			cd ${S}/`dirname $i`
-			echo "Generating .edj file for $i..."
-			edje_cc `basename $i`
-			echo "Removing sources in this directory..."
-			rm -f *.edc *.png *.ttf *.jpeg
-		done
-		cd ${S}
-		install -d ${D}${datadir}/${PN}/
-		cp -a examples ${D}${datadir}/${PN}/
-		find ${D}${datadir}/${PN}/examples -name ".svn" | xargs rm -rf
-	fi
+    if [ -e examples ]; then
+        for i in `find examples -name "*.edc"`; do
+            cd ${S}/`dirname $i`
+            echo "Generating .edj file for $i..."
+            edje_cc `basename $i`
+            echo "Removing sources in this directory..."
+            rm -f *.edc *.png *.ttf *.jpeg
+        done
+        cd ${S}
+        install -d ${D}${datadir}/${PN}/
+        cp -a examples ${D}${datadir}/${PN}/
+        find ${D}${datadir}/${PN}/examples -name ".svn" | xargs rm -rf
+    fi
 }
 
 FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/*.egg/*/*/.debug"
diff --git a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb b/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
index 5ff0681..1bf5f1d 100644
--- a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
@@ -24,12 +24,12 @@ SRC_URI = "${E_SVN}/trunk/THEMES;module=${SRCNAME};protocol=http \
 S = "${WORKDIR}/${SRCNAME}"
 
 do_compile() {
-	${STAGING_BINDIR_NATIVE}/edje_cc -id ${S}/images ${S}/efenniht.edc -o ${S}/efenniht.edj
+    ${STAGING_BINDIR_NATIVE}/edje_cc -id ${S}/images ${S}/efenniht.edc -o ${S}/efenniht.edj
 }
 
 do_install() {
-        install -d ${D}${datadir}/enlightenment/data/themes/
-        install -m 0644 ${S}/efenniht.edj ${D}${datadir}/enlightenment/data/themes/
+    install -d ${D}${datadir}/enlightenment/data/themes/
+    install -m 0644 ${S}/efenniht.edj ${D}${datadir}/enlightenment/data/themes/
 }
 
 FILES_${PN} = "${datadir}/enlightenment/data/themes/"
diff --git a/meta-efl/recipes-efl/e17/e-wm/applications.menu b/meta-efl/recipes-efl/e17/e-wm/applications.menu
index 77c6f04..ed9b906 100644
--- a/meta-efl/recipes-efl/e17/e-wm/applications.menu
+++ b/meta-efl/recipes-efl/e17/e-wm/applications.menu
@@ -85,10 +85,10 @@
     <Directory>Accessories.directory</Directory>
     <Include>
       <And>
-	<Or>
+        <Or>
           <Category>Applications</Category>
-	  <Category>Utility</Category>
-	</Or>
+          <Category>Utility</Category>
+        </Or>
         <Not>
           <Category>System</Category>
           <Category>Office</Category>
diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index 6f5fab1..7cc2167 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -25,7 +25,7 @@ EXTRA_OECONF = "\
 "
 
 do_configure_prepend() {
-	autopoint || true
+    autopoint || true
 }
 
 do_install_append() {
diff --git a/meta-efl/recipes-efl/e17/enjoy_svn.bb b/meta-efl/recipes-efl/e17/enjoy_svn.bb
index 81be734..470f03d 100644
--- a/meta-efl/recipes-efl/e17/enjoy_svn.bb
+++ b/meta-efl/recipes-efl/e17/enjoy_svn.bb
@@ -35,9 +35,9 @@ do_configure_prepend() {
 }
 
 pkg_postinst_${PN} () {
-	echo "enjoy:	SCAN and LIBRARY MANAGER are not implemeted yet!"
-	echo "enjoy:	Meanwhile please run:"
-	echo "enjoy:	test-lms -m mono -p id3 -i 5000 -s /path/to/your/music/dir /home/root/.config/enjoy/media.db"
-	echo "enjoy:"
-	echo "enjoy:	Use test-lms -P to see available formats that can be scanned"
+    echo "enjoy:    SCAN and LIBRARY MANAGER are not implemeted yet!"
+    echo "enjoy:    Meanwhile please run:"
+    echo "enjoy:    test-lms -m mono -p id3 -i 5000 -s /path/to/your/music/dir /home/root/.config/enjoy/media.db"
+    echo "enjoy:"
+    echo "enjoy:    Use test-lms -P to see available formats that can be scanned"
 }
diff --git a/meta-efl/recipes-efl/e17/exalt-client_svn.bb b/meta-efl/recipes-efl/e17/exalt-client_svn.bb
index c5219b7..4938900 100644
--- a/meta-efl/recipes-efl/e17/exalt-client_svn.bb
+++ b/meta-efl/recipes-efl/e17/exalt-client_svn.bb
@@ -8,8 +8,8 @@ DEPENDS += "elementary exalt edje-native"
 CFLAGS += " -I${STAGING_INCDIR}/exalt -I${STAGING_INCDIR}/exalt_dbus"
 
 do_configure_prepend() {
-	sed -i -e /po/d configure.ac 
-	sed -i -e s:\ po::g Makefile.am
+    sed -i -e /po/d configure.ac 
+    sed -i -e s:\ po::g Makefile.am
 }
 
 FILES_${PN} += "${libdir}/enlightenment/modules/*/*.desktop \
diff --git a/meta-efl/recipes-efl/e17/exalt_svn.bb b/meta-efl/recipes-efl/e17/exalt_svn.bb
index 3207a4b..a5590e1 100644
--- a/meta-efl/recipes-efl/e17/exalt_svn.bb
+++ b/meta-efl/recipes-efl/e17/exalt_svn.bb
@@ -19,13 +19,13 @@ EXTRA_OECONF = " \
 "
 
 do_install_append() {
-	# install dbus config file
-	install -d ${D}${sysconfdir}/dbus-1/system.d/
-	install -m 0644 data/daemon/dbus/exalt.conf ${D}${sysconfdir}/dbus-1/system.d/exalt.conf
+    # install dbus config file
+    install -d ${D}${sysconfdir}/dbus-1/system.d/
+    install -m 0644 data/daemon/dbus/exalt.conf ${D}${sysconfdir}/dbus-1/system.d/exalt.conf
 
-	# install dbus service file
-	install -d ${D}${datadir}/dbus-1/system-services/	
-	install -m 0644 org.e.Exalt.service ${D}${datadir}/dbus-1/system-services/
+    # install dbus service file
+    install -d ${D}${datadir}/dbus-1/system-services/
+    install -m 0644 org.e.Exalt.service ${D}${datadir}/dbus-1/system-services/
 }
 
 FILES_${PN} += "${datadir}/dbus-1"
diff --git a/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb b/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
index 36e8505..55f3282 100644
--- a/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
+++ b/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
@@ -2,7 +2,7 @@ SECTION = "x11/data"
 
 SRC_URI = "git://git.shr-project.org/repo/illume-keyboards.git;protocol=http;branch=master \
            file://0001-Makefile-update-KEYBOARDS_DIR-for-new-illume2.patch \
-	   file://LICENSE"
+           file://LICENSE"
 S = "${WORKDIR}/git"
 
 SRCREV = "4064489f359a1addf572089b582f317dff5f50e1"
@@ -93,6 +93,6 @@ DESCRIPTION_illume-keyboard-persian = "Illume keyboard with persian layout"
 FILES_illume-keyboard-persian = "${KEYBOARDS_DIR}/Persian.kbd ${KEYBOARDS_DIR}/Persian.png"
 
 do_install() {
-	make DESTDIR=${D} install
+    make DESTDIR=${D} install
 }
 
diff --git a/meta-efl/recipes-efl/e17/news_svn.bb b/meta-efl/recipes-efl/e17/news_svn.bb
index 1e429e7..e45cd44 100644
--- a/meta-efl/recipes-efl/e17/news_svn.bb
+++ b/meta-efl/recipes-efl/e17/news_svn.bb
@@ -5,8 +5,8 @@ PR = "${INC_PR}.0"
 require e-module.inc
 
 do_configure_prepend() {
-	sed -i -e /po/d configure.ac 
-	sed -i -e s:\ po::g Makefile.am
+    sed -i -e /po/d configure.ac 
+    sed -i -e s:\ po::g Makefile.am
 }
 
 
diff --git a/meta-efl/recipes-efl/e17/places_svn.bb b/meta-efl/recipes-efl/e17/places_svn.bb
index 5c19933..6a6184b 100644
--- a/meta-efl/recipes-efl/e17/places_svn.bb
+++ b/meta-efl/recipes-efl/e17/places_svn.bb
@@ -7,7 +7,7 @@ PR = "${INC_PR}.0"
 require e-module.inc
 
 do_configure_prepend() {
-	autopoint || touch config.rpath
+    autopoint || touch config.rpath
 }
 
 # Calls /usr/bin/eject for media
diff --git a/meta-efl/recipes-efl/e17/rain_svn.bb b/meta-efl/recipes-efl/e17/rain_svn.bb
index 8738f35..917fe38 100644
--- a/meta-efl/recipes-efl/e17/rain_svn.bb
+++ b/meta-efl/recipes-efl/e17/rain_svn.bb
@@ -5,8 +5,8 @@ PR = "${INC_PR}.0"
 require e-module.inc
 
 do_configure_prepend() {
-	sed -i -e /po/d configure.ac 
-	sed -i -e s:\ po::g Makefile.am
+    sed -i -e /po/d configure.ac 
+    sed -i -e s:\ po::g Makefile.am
 }
 
 
diff --git a/meta-efl/recipes-efl/e17/screenshot_svn.bb b/meta-efl/recipes-efl/e17/screenshot_svn.bb
index 465ffcf..9689f46 100644
--- a/meta-efl/recipes-efl/e17/screenshot_svn.bb
+++ b/meta-efl/recipes-efl/e17/screenshot_svn.bb
@@ -10,7 +10,7 @@ DEPENDS += "emprint"
 RDEPENDS_${PN} += "emprint"
 
 do_configure_prepend() {
-	sed -i -e 's:AC_MSG_ERROR(emprint not found):echo foo:g' ${S}/configure.ac
+    sed -i -e 's:AC_MSG_ERROR(emprint not found):echo foo:g' ${S}/configure.ac
 }
 
 
diff --git a/meta-efl/recipes-efl/efl/ecore.inc b/meta-efl/recipes-efl/efl/ecore.inc
index bc4758a..e2fff0e 100644
--- a/meta-efl/recipes-efl/efl/ecore.inc
+++ b/meta-efl/recipes-efl/efl/ecore.inc
@@ -13,8 +13,8 @@ BBCLASSEXTEND = "native"
 INC_PR = "r0"
 
 do_configure_prepend() {
-	touch ${S}/po/Makefile.in.in || true
-	sed -i -e 's: po::g' ${S}/Makefile.am
+    touch ${S}/po/Makefile.in.in || true
+    sed -i -e 's: po::g' ${S}/Makefile.am
 }
 
 FILESPATHPKG =. "${BPN}-${PV}:${BPN}:"
diff --git a/meta-efl/recipes-efl/efl/edje-fpu.inc b/meta-efl/recipes-efl/efl/edje-fpu.inc
index 1af86e3..dc39fa9 100644
--- a/meta-efl/recipes-efl/efl/edje-fpu.inc
+++ b/meta-efl/recipes-efl/efl/edje-fpu.inc
@@ -1,6 +1,6 @@
 
 def get_edje_fpu_setting(bb, d):
-	if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
-		return "--enable-fixed-point"
-	return ""
+    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
+        return "--enable-fixed-point"
+    return ""
 
diff --git a/meta-efl/recipes-efl/efl/edje.inc b/meta-efl/recipes-efl/efl/edje.inc
index 311fb52..b3011b4 100644
--- a/meta-efl/recipes-efl/efl/edje.inc
+++ b/meta-efl/recipes-efl/efl/edje.inc
@@ -12,19 +12,19 @@ BBCLASSEXTEND = "native nativesdk"
 INC_PR = "r0"
 
 do_configure_prepend_virtclass-native() {
-	sed -i 's:EMBRYO_PREFIX"/bin:"${STAGING_BINDIR}:' ${S}/src/bin/edje_cc_out.c
-	sed -i 's: cpp -I: /usr/bin/cpp -I:' ${S}/src/bin/edje_cc_parse.c
-	sed -i 's:\"gcc -I:\"/usr/bin/gcc -I:' ${S}/src/bin/edje_cc_parse.c
+    sed -i 's:EMBRYO_PREFIX"/bin:"${STAGING_BINDIR}:' ${S}/src/bin/edje_cc_out.c
+    sed -i 's: cpp -I: /usr/bin/cpp -I:' ${S}/src/bin/edje_cc_parse.c
+    sed -i 's:\"gcc -I:\"/usr/bin/gcc -I:' ${S}/src/bin/edje_cc_parse.c
 }
 # The new lua stuff is a bit broken...
 do_configure_append() {
-	for i in $(find "${S}" -name "Makefile") ; do
-		sed -i -e 's:-L/usr/local/lib::g'  $i
-	done
+    for i in $(find "${S}" -name "Makefile") ; do
+        sed -i -e 's:-L/usr/local/lib::g'  $i
+    done
 }
 
 do_compile_append() {
-	sed -i -e s:local/::g -e 's:-L${STAGING_LIBDIR}::g' ${S}/edje.pc
+    sed -i -e s:local/::g -e 's:-L${STAGING_LIBDIR}::g' ${S}/edje.pc
 }
 
 # gain some extra performance at the expense of RAM - generally i'd say bad
diff --git a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb b/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
index d764e96..8fb2dab 100644
--- a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
@@ -26,12 +26,12 @@ SRC_URI += "file://LICENSE"
 S = "${WORKDIR}/${SRCNAME}"
 
 do_compile() {
-	${STAGING_BINDIR_NATIVE}/edje_cc -id ${S}/images -id ${WORKDIR}/themes/ ${S}/elm-efenniht.edc -o ${S}/elm-efenniht.edj
+    ${STAGING_BINDIR_NATIVE}/edje_cc -id ${S}/images -id ${WORKDIR}/themes/ ${S}/elm-efenniht.edc -o ${S}/elm-efenniht.edj
 }
 
 do_install() {
-        install -d ${D}${datadir}/elementary/themes/
-        install -m 0644 ${S}/elm-efenniht.edj ${D}${datadir}/elementary/themes/
+    install -d ${D}${datadir}/elementary/themes/
+    install -m 0644 ${S}/elm-efenniht.edj ${D}${datadir}/elementary/themes/
 }
 
 FILES_${PN} = "${datadir}/elementary/themes/"
diff --git a/meta-efl/recipes-efl/efl/imlib2_svn.bb b/meta-efl/recipes-efl/efl/imlib2_svn.bb
index 83de3fe..4cc124e 100644
--- a/meta-efl/recipes-efl/efl/imlib2_svn.bb
+++ b/meta-efl/recipes-efl/efl/imlib2_svn.bb
@@ -12,8 +12,8 @@ SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
 EXTRA_OECONF = "--with-x \
-		--x-includes=${STAGING_INCDIR} \
-		--x-libraries=${STAGING_LIBDIR} "
+                --x-includes=${STAGING_INCDIR} \
+                --x-libraries=${STAGING_LIBDIR} "
 
 # TODO: Use more fine granular version
 #OE_LT_RPATH_ALLOW=":${libdir}/imlib2/loaders:${libdir}/imlib2/filters:"
-- 
1.7.8.6



