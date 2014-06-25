Return-Path: <morphis@gravedo.de>
X-Greylist: delayed 588 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 25 Jun 2014 08:05:11 UTC
Received: from gravedo.de (gravedo.de [85.214.79.159])
	by mail.openembedded.org (Postfix) with ESMTP id 56FCB62252
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 08:05:11 +0000 (UTC)
Received: by gravedo.de (Postfix, from userid 7791)
	id 388CB3B34112; Wed, 25 Jun 2014 09:55:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
	version=3.3.1
Received: from localhost (dslb-092-077-006-204.pools.arcor-ip.net
	[92.77.6.204]) by gravedo.de (Postfix) with ESMTPSA id 3C4D93B3410E;
	Wed, 25 Jun 2014 09:55:21 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jun 2014 09:55:17 +0200
Message-Id: <1403682917-7598-3-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1403682917-7598-1-git-send-email-morphis@gravedo.de>
References: <1403682917-7598-1-git-send-email-morphis@gravedo.de>
Subject: [PATCH 2/2] qtwebengine: add initial recipe for git version only
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
X-List-Received-Date: Wed, 25 Jun 2014 08:05:15 -0000

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes-qt/qt5/qtwebengine.inc                     |  44 +++++++
 ...ild-time-only-dependency-on-x11-libraries.patch | 137 +++++++++++++++++++++
 ...ip-unwanted-echo-compiling-prefix-from-CC.patch |  38 ++++++
 ...upplied-by-environment-variable-NINJA_PAT.patch |  36 ++++++
 recipes-qt/qt5/qtwebengine_git.bb                  |  24 ++++
 5 files changed, 279 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebengine.inc
 create mode 100644 recipes-qt/qt5/qtwebengine/0001-Drop-build-time-only-dependency-on-x11-libraries.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0001-Strip-unwanted-echo-compiling-prefix-from-CC.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0002-Use-ninja-supplied-by-environment-variable-NINJA_PAT.patch
 create mode 100644 recipes-qt/qt5/qtwebengine_git.bb

diff --git a/recipes-qt/qt5/qtwebengine.inc b/recipes-qt/qt5/qtwebengine.inc
new file mode 100644
index 0000000..b6f56ae
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine.inc
@@ -0,0 +1,44 @@
+SUMMARY = "QtWebEngine combines the power of Chromium and Qt"
+LICENSE = "LGPL-2.1 & BSD"
+LIC_FILES_CHKSUM = " \
+  file://src/core/browser_context_qt.cpp;md5=c23e24b6a534c8b6cc879a397b35db29;beginline=1;endline=40 \
+  file://src/3rdparty/chromium/LICENSE;md5=d2d164565cc10f298390174d9cb6d18d \
+"
+DEPENDS += " \
+    ninja-native \
+    qtbase qtdeclarative qtxmlpatterns qtquickcontrols \
+    libdrm fontconfig pixman openssl pango cairo icu pciutils \
+"
+
+inherit qmake5
+inherit gettext
+inherit pythonnative
+inherit perlnative
+
+require recipes-qt/qt5/qt5.inc
+
+S = "${WORKDIR}/git"
+
+# To avoid trouble start with not separated build directory
+SEPB = "${S}"
+B = "${SEPB}"
+
+do_configure() {
+    # replace LD with CXX, to workaround a possible gyp inheritssue?
+    LD="${CXX}" export LD
+    CC="${CC}" export CC
+    CXX="${CXX}" export CXX
+    CC_host="gcc" export CC_host
+    CXX_host="g++" export CXX_host
+
+    # qmake can't find the OE_QMAKE_* variables on it's own so directly passing them as
+    # arguments here
+    ${OE_QMAKE_QMAKE} -r QTWEBENGINE_ROOT="${S}" NINJA_PATH="${STAGING_BINDIR_NATIVE}/ninja" \
+        QMAKE_CXX="${OE_QMAKE_CXX}" QMAKE_CC="${OE_QMAKE_CC}" \
+        QMAKE_LINK="${OE_QMAKE_LINK}" \
+        QMAKE_CFLAGS="${OE_QMAKE_CFLAGS}" \
+        QMAKE_CXXFLAGS="${OE_QMAKE_CXXFLAGS}" \
+        QMAKE_AR="${OE_QMAKE_AR}"
+}
+
+PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
diff --git a/recipes-qt/qt5/qtwebengine/0001-Drop-build-time-only-dependency-on-x11-libraries.patch b/recipes-qt/qt5/qtwebengine/0001-Drop-build-time-only-dependency-on-x11-libraries.patch
new file mode 100644
index 0000000..7ee38d0
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0001-Drop-build-time-only-dependency-on-x11-libraries.patch
@@ -0,0 +1,137 @@
+From f5c8e973f0a246691b71c256361bfa82619ee2ef Mon Sep 17 00:00:00 2001
+From: Simon Busch <morphis@gravedo.de>
+Date: Fri, 20 Jun 2014 09:05:12 +0200
+Subject: [PATCH 1/2] Drop build time only dependency on x11 libraries
+
+Signed-off-by: Simon Busch <morphis@gravedo.de>
+---
+ src/3rdparty/chromium/build/linux/system.gyp | 114 ---------------------------
+ 1 file changed, 114 deletions(-)
+
+diff --git a/src/3rdparty/chromium/build/linux/system.gyp b/src/3rdparty/chromium/build/linux/system.gyp
+index 9911317..85016b8 100644
+--- a/src/3rdparty/chromium/build/linux/system.gyp
++++ b/src/3rdparty/chromium/build/linux/system.gyp
+@@ -786,119 +786,5 @@
+         }],
+       ],
+     },
+-    {
+-      'target_name': 'x11',
+-      'type': 'none',
+-      'toolsets': ['host', 'target'],
+-      'conditions': [
+-        ['_toolset=="target"', {
+-          'direct_dependent_settings': {
+-            'cflags': [
+-              '<!@(<(pkg-config) --cflags x11)',
+-            ],
+-          },
+-          'link_settings': {
+-            'ldflags': [
+-              '<!@(<(pkg-config) --libs-only-L --libs-only-other x11 xi)',
+-            ],
+-            'libraries': [
+-              '<!@(<(pkg-config) --libs-only-l x11 xi)',
+-            ],
+-          },
+-        }, {
+-          'direct_dependent_settings': {
+-            'cflags': [
+-              '<!@(pkg-config --cflags x11)',
+-            ],
+-          },
+-          'link_settings': {
+-            'ldflags': [
+-              '<!@(pkg-config --libs-only-L --libs-only-other x11 xi)',
+-            ],
+-            'libraries': [
+-              '<!@(pkg-config --libs-only-l x11 xi)',
+-            ],
+-          },
+-        }],
+-      ],
+-    },
+-    {
+-      'target_name': 'xext',
+-      'type': 'none',
+-      'conditions': [
+-        ['_toolset=="target"', {
+-          'direct_dependent_settings': {
+-            'cflags': [
+-              '<!@(<(pkg-config) --cflags xext)',
+-            ],
+-          },
+-          'link_settings': {
+-            'ldflags': [
+-              '<!@(<(pkg-config) --libs-only-L --libs-only-other xext)',
+-            ],
+-            'libraries': [
+-              '<!@(<(pkg-config) --libs-only-l xext)',
+-            ],
+-          },
+-        }],
+-      ],
+-    },
+-    {
+-      'target_name': 'xfixes',
+-      'type': 'none',
+-      'conditions': [
+-        ['_toolset=="target"', {
+-          'direct_dependent_settings': {
+-            'cflags': [
+-              '<!@(<(pkg-config) --cflags xfixes)',
+-            ],
+-          },
+-          'link_settings': {
+-            'ldflags': [
+-              '<!@(<(pkg-config) --libs-only-L --libs-only-other xfixes)',
+-            ],
+-            'libraries': [
+-              '<!@(<(pkg-config) --libs-only-l xfixes)',
+-            ],
+-          },
+-        }],
+-      ],
+-    },
+-    {
+-      'target_name': 'xrandr',
+-      'type': 'none',
+-      'toolsets': ['host', 'target'],
+-      'conditions': [
+-        ['_toolset=="target"', {
+-          'direct_dependent_settings': {
+-            'cflags': [
+-              '<!@(<(pkg-config) --cflags xrandr)',
+-            ],
+-          },
+-          'link_settings': {
+-            'ldflags': [
+-              '<!@(<(pkg-config) --libs-only-L --libs-only-other xrandr)',
+-            ],
+-            'libraries': [
+-              '<!@(<(pkg-config) --libs-only-l xrandr)',
+-            ],
+-          },
+-        }, {
+-          'direct_dependent_settings': {
+-            'cflags': [
+-              '<!@(pkg-config --cflags xrandr)',
+-            ],
+-          },
+-          'link_settings': {
+-            'ldflags': [
+-              '<!@(pkg-config --libs-only-L --libs-only-other xrandr)',
+-            ],
+-            'libraries': [
+-              '<!@(pkg-config --libs-only-l xrandr)',
+-            ],
+-          },
+-        }],
+-      ],
+-    },
+   ],
+ }
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qtwebengine/0001-Strip-unwanted-echo-compiling-prefix-from-CC.patch b/recipes-qt/qt5/qtwebengine/0001-Strip-unwanted-echo-compiling-prefix-from-CC.patch
new file mode 100644
index 0000000..6b31598
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0001-Strip-unwanted-echo-compiling-prefix-from-CC.patch
@@ -0,0 +1,38 @@
+From 7a3179fee9c88ce3dd018b2f159e1b5df74fc7cc Mon Sep 17 00:00:00 2001
+From: Simon Busch <morphis@gravedo.de>
+Date: Fri, 20 Jun 2014 19:04:14 +0200
+Subject: [PATCH] Strip unwanted "@echo compiling &&" prefix from ${CC}
+
+Causes problems when called from a perl script:
+
+@echo compiling  && arm-webos-linux-gnueabi-gcc -march=armv7-a -mthumb-interwork -mfloat-abi=softfp -mfpu=neon --sysroot=/home/morphis/work/wop/webos-ports/tmp-eglibc/sysroots/tenderloinCan't exec "@echo": No such file or directory at /home/morphis/work/wop/webos-ports/tmp-eglibc/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.3/IPC/Open3.pm line 288.
+open2: exec of @echo compiling && arm-webos-linux-gnueabi-gcc -march=armv7-a -mthumb-interwork -mfloat-abi=softfp -mfpu=neon --sysroot=/home/morphis/work/wop/webos-ports/tmp-eglibc/sysroots/tenderloin -E -P -x c++ -DENABLE_CUSTOM_SCHEME_HANDLER=0 -DENABLE_SVG_FONTS=1 -DENABLE_GDI_FONTS_ON_WINDOWS=0 -DENABLE_HARFBUZZ_ON_WINDOWS=1 -DWTF_USE_CONCATENATED_IMPULSE_RESPONSES=1 -DENABLE_INPUT_SPEECH=1 -DENABLE_INPUT_MULTIPLE_FIELDS_UI=1 -DENABLE_LEGACY_NOTIFICATIONS=1 -DENABLE_MEDIA_CAPTURE=0 -DENABLE_NAVIGATOR_CONTENT_UTILS=1 -DENABLE_ORIENTATION_EVENTS=0 -DENABLE_WEB_AUDIO=1 -DWTF_USE_WEBAUDIO_FFMPEG=1 -DENABLE_OPENTYPE_VERTICAL=1 -DWTF_USE_DEFAULT_RENDER_THEME=1 css/html.css failed at ../build/scripts/preprocessor.pm line 81
+Traceback (most recent call last):
+  File "../build/scripts/action_useragentstylesheets.py", line 124, in <module>
+    sys.exit(main(sys.argv))
+  File "../build/scripts/action_useragentstylesheets.py", line 118, in main
+    assert returnCode == 0
+AssertionError
+
+Signed-off-by: Simon Busch <morphis@gravedo.de>
+---
+ .../WebKit/Source/build/scripts/action_useragentstylesheets.py         | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/3rdparty/chromium/third_party/WebKit/Source/build/scripts/action_useragentstylesheets.py b/src/3rdparty/chromium/third_party/WebKit/Source/build/scripts/action_useragentstylesheets.py
+index c0712b3..8460637 100644
+--- a/src/3rdparty/chromium/third_party/WebKit/Source/build/scripts/action_useragentstylesheets.py
++++ b/src/3rdparty/chromium/third_party/WebKit/Source/build/scripts/action_useragentstylesheets.py
+@@ -112,6 +112,9 @@ def main(args):
+     command.extend([outputH, outputCpp])
+     command.extend(styleSheets)
+ 
++    if os.environ["CC"].startswith("@echo"):
++        os.environ["CC"] = os.environ["CC"].replace("@echo compiling  &&", "")
++
+     # Do it. check_call is new in 2.5, so simulate its behavior with call and
+     # assert.
+     returnCode = subprocess.call(command)
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qtwebengine/0002-Use-ninja-supplied-by-environment-variable-NINJA_PAT.patch b/recipes-qt/qt5/qtwebengine/0002-Use-ninja-supplied-by-environment-variable-NINJA_PAT.patch
new file mode 100644
index 0000000..c64b32a
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0002-Use-ninja-supplied-by-environment-variable-NINJA_PAT.patch
@@ -0,0 +1,36 @@
+From 2fe53c4c28f91941ee3b446e88f519feb2edc457 Mon Sep 17 00:00:00 2001
+From: Simon Busch <morphis@gravedo.de>
+Date: Fri, 20 Jun 2014 09:09:12 +0200
+Subject: [PATCH 2/2] Use ninja supplied by environment variable NINJA_PATH
+
+Signed-off-by: Simon Busch <morphis@gravedo.de>
+---
+ tools/qmake/mkspecs/features/functions.prf | 14 ++------------
+ 1 file changed, 2 insertions(+), 12 deletions(-)
+
+diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
+index 4dcd8ed..8725fd2 100644
+--- a/tools/qmake/mkspecs/features/functions.prf
++++ b/tools/qmake/mkspecs/features/functions.prf
+@@ -84,16 +84,6 @@ defineReplace(which) {
+ }
+ 
+ defineReplace(findOrBuildNinja) {
+-    git_chromium_src_dir = $$system("git config qtwebengine.chromiumsrcdir")
+-    # Fall back to the snapshot path if git does not know about chromium sources (i.e. init-repository.py has not been used)
+-    isEmpty(git_chromium_src_dir): git_chromium_src_dir = "src/3rdparty/chromium"
+-
+-    out = $$absolute_path("$$git_chromium_src_dir/../ninja/ninja", "$$QTWEBENGINE_ROOT")
+-    win32: out = $$system_path($${out}.exe)
+-
+-    # If we did not find ninja, then we bootstrap it.
+-    !exists($$out) {
+-        system("python $$dirname(out)/bootstrap.py")
+-    }
+-    return($$out)
++    message(Using ninja from path $$NINJA_PATH)
++    return($$NINJA_PATH)
+ }
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
new file mode 100644
index 0000000..f4964bf
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -0,0 +1,24 @@
+require qt5-git.inc
+require ${PN}.inc
+
+# QtWebEngine has it's own version format currently and doesn't follow the major Qt
+# versions (but it's release are at the same time as of major Qt releases). We're tracking
+# the master branch which will lead to 1.0 when Qt 5.4 is released here.
+PV = "0.9.99+git${SRCPV}"
+
+QT_MODULE_BRANCH = "master"
+
+# For now we have to define SRC_URI here again as qt5-git.inc points to
+# qt.gitorious.org/qt/ but qtwebengine is still on qt.gitorious.org/qt-labs/ which will
+# switch soon.
+SRC_URI = " \
+    git://gitorious.org/qt-labs/qtwebengine.git;name=qtwebengine;protocol=git;branch=${QT_MODULE_BRANCH} \
+    git://gitorious.org/qt-labs/chromium.git;name=chromium;protocol=git;branch=${QT_MODULE_BRANCH};destsuffix=git/src/3rdparty \
+    file://0001-Drop-build-time-only-dependency-on-x11-libraries.patch \
+    file://0002-Use-ninja-supplied-by-environment-variable-NINJA_PAT.patch \
+    file://0001-Strip-unwanted-echo-compiling-prefix-from-CC.patch \
+"
+SRCREV_qtwebengine = "21f6ce84ecca9a4ff2aa980b21d2e5174c78d14b"
+SRCREV_chromium = "1f3cc8c2618979b557d60ef1ad984a49dca83bff"
+
+SRCREV_FORMAT = "qtwebengine"
-- 
1.9.1


