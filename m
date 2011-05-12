Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QKdea-0005dn-2w
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 23:42:40 +0200
Received: (qmail 10108 invoked by uid 503); 12 May 2011 21:09:29 -0000
Received: from b9.ovh.net (HELO mail411.ha.ovh.net) (213.186.33.59)
	by 64.mail-out.ovh.net with SMTP; 12 May 2011 21:09:28 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 12 May 2011 23:39:54 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 12 May 2011 23:39:51 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 May 2011 23:31:03 +0200
Message-Id: <1305235863-16025-4-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1305235863-16025-1-git-send-email-eric@eukrea.com>
References: <1305235863-16025-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 6027786626366680396
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 3/3] qt4-4.7.3: add translations'support
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
X-List-Received-Date: Thu, 12 May 2011 21:42:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

this patch should bring back translations support in qt4.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
it's currently build tested for qt4-embedded.
---
 recipes/qt4/qt-4.7.3.inc                    |   14 ++++----------
 recipes/qt4/qt-4.7.3/fix-translations.patch |   22 ++++++++++++++++++++++
 recipes/qt4/qt4-embedded.inc                |    2 +-
 recipes/qt4/qt4-x11-free.inc                |    2 +-
 4 files changed, 28 insertions(+), 12 deletions(-)
 create mode 100644 recipes/qt4/qt-4.7.3/fix-translations.patch

diff --git a/recipes/qt4/qt-4.7.3.inc b/recipes/qt4/qt-4.7.3.inc
index 4e9c96a..4dfebd1 100644
--- a/recipes/qt4/qt-4.7.3.inc
+++ b/recipes/qt4/qt-4.7.3.inc
@@ -10,9 +10,11 @@ SRC_URI = "\
 	file://0006-freetype-host-includes.patch \
 	file://0001-Added-Openembedded-crossarch-option.patch \
 	file://0010-phonon-gstreamer-rgb-endianess.patch \
+	file://fix-translations.patch \
 	file://g++.conf \
 	file://linux.conf \
-           "
+	"
+
 # Set necessary variables in the profile
 SRC_URI += "file://qte.sh"
 
@@ -22,7 +24,7 @@ FILES_${QT_BASE_NAME}-tools                += "${bindir}/qml"
 
 do_configure_prepend() {
     for pro in $(find ${S} -name "*.pro") ; do
-        sed -i 's:$$QT_BUILD_TREE/bin/lrelease:${OE_QMAKE_LRELEASE}:g' $pro
+        sed -i 's:$$LRELEASE:${STAGING_BINDIR_NATIVE}/lrelease4:g' $pro
     done
 
     sed -i s:SEDME:${S}: ${WORKDIR}/linux.conf
@@ -34,10 +36,6 @@ do_configure_prepend() {
     ${S}/configure
 }
 
-do_configure_append() {
-    sed -e '/QMAKE_TARGET /d' -e '/TARGET /d' -i ${S}/translations/Makefile
-}
-
 QT_GLFLAGS ?= ""
 QT_CONFIG_FLAGS += " -javascript-jit -script -scripttools -declarative -xmlpatterns -no-rpath -qt3support -reduce-relocations -silent ${QT_GLFLAGS}"
 
@@ -48,10 +46,6 @@ do_compile() {
     fi
 
     unset CFLAGS CXXFLAGS
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/rcc4 ${S}/bin/rcc
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/moc4 ${S}/bin/moc
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/uic4 ${S}/bin/uic
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/lrelease4 ${S}/bin/lrelease
 
     oe_runmake ${EXTRA_ENV}
 }
diff --git a/recipes/qt4/qt-4.7.3/fix-translations.patch b/recipes/qt4/qt-4.7.3/fix-translations.patch
new file mode 100644
index 0000000..5994775
--- /dev/null
+++ b/recipes/qt4/qt-4.7.3/fix-translations.patch
@@ -0,0 +1,22 @@
+diff --git a/translations/translations.pro b/translations/translations.pro
+index cdaf04a..24fa668 100644
+--- a/translations/translations.pro
++++ b/translations/translations.pro
+@@ -20,7 +20,7 @@ updateqm.name = LRELEASE ${QMAKE_FILE_IN}
+ updateqm.CONFIG += no_link
+ QMAKE_EXTRA_COMPILERS += updateqm
+ 
+-isEmpty(vcproj) {
++!isEmpty(vcproj) {
+     QMAKE_LINK = @: IGNORE THIS LINE
+     OBJECTS_DIR =
+     win32:CONFIG -= embed_manifest_exe
+@@ -30,7 +30,7 @@ isEmpty(vcproj) {
+     phony_src.input = PHONY_DEPS
+     phony_src.output = phony.c
+     phony_src.variable_out = GENERATED_SOURCES
+-    phony_src.commands = echo int main() { return 0; } > phony.c
++    phony_src.commands = echo "int main() { return 0\; }" > phony.c
+     phony_src.name = CREATE phony.c
+     phony_src.CONFIG += combine
+     QMAKE_EXTRA_COMPILERS += phony_src
diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
index af9d545..79ce005 100644
--- a/recipes/qt4/qt4-embedded.inc
+++ b/recipes/qt4/qt4-embedded.inc
@@ -4,7 +4,7 @@ LICENSE = "GPL QPL"
 PRIORITY = "optional"
 HOMEPAGE = "http://www.trolltech.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r28"
+INC_PR = "r29"
 
 QT_BASE_NAME ?= "qt4-embedded"
 QT_BASE_LIB  ?= "libqt-embedded"
diff --git a/recipes/qt4/qt4-x11-free.inc b/recipes/qt4/qt4-x11-free.inc
index c407422..f63c9d2 100644
--- a/recipes/qt4/qt4-x11-free.inc
+++ b/recipes/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.trolltech.com"
 LICENSE = "GPL QPL"
 DEPENDS += "virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r24"
+INC_PR = "r25"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-${PV}.tar.gz \
            file://0001-cross-compile.patch \
-- 
1.7.0.4



