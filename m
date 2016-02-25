Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D95717720B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 03:39:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 24 Feb 2016 19:39:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,496,1449561600"; d="scan'208";a="910754773"
Received: from anguy10-mobl1.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.138.208])
	by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2016 19:39:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Feb 2016 16:38:56 +1300
Message-Id: <1456371536-22510-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-qt5][PATCH] recipetool: add support for Qt5 to meta-qt5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Feb 2016 03:39:38 -0000

Having in recent OE-Core master added build system extension
capabilities to recipetool, add a module in meta-qt5 which uses this to
enable extraction of Qt5 dependencies from cmake, qmake and autoconf
files. It's by no means perfect but does do something useful if you add
a recipe for a Qt5-using piece of software using recipetool create or
devtool add.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 lib/recipetool/__init__.py   |   3 +
 lib/recipetool/create_qt5.py | 162 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 165 insertions(+)
 create mode 100644 lib/recipetool/__init__.py
 create mode 100644 lib/recipetool/create_qt5.py

diff --git a/lib/recipetool/__init__.py b/lib/recipetool/__init__.py
new file mode 100644
index 0000000..8eda927
--- /dev/null
+++ b/lib/recipetool/__init__.py
@@ -0,0 +1,3 @@
+# Enable other layers to have modules in the same named directory
+from pkgutil import extend_path
+__path__ = extend_path(__path__, __name__)
diff --git a/lib/recipetool/create_qt5.py b/lib/recipetool/create_qt5.py
new file mode 100644
index 0000000..51708b4
--- /dev/null
+++ b/lib/recipetool/create_qt5.py
@@ -0,0 +1,162 @@
+# Recipe creation tool - Qt5 support plugin
+#
+# Copyright (C) 2016 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+import re
+import os
+
+from recipetool.create import RecipeHandler
+from recipetool.create_buildsys import CmakeExtensionHandler, AutotoolsExtensionHandler
+
+
+class Qt5AutotoolsHandler(AutotoolsExtensionHandler):
+    def process_macro(self, srctree, keyword, value, process_value, libdeps, pcdeps, deps, outlines, inherits, values):
+        if keyword == 'AX_HAVE_QT':
+            # We don't know specifically which modules it needs, but let's assume it's covered by qtbase
+            deps.append('qtbase')
+            return True
+        return False
+
+    def extend_keywords(self, keywords):
+        keywords.append('AX_HAVE_QT')
+
+    def process_prog(self, srctree, keyword, value, prog, deps, outlines, inherits, values):
+        return False
+
+
+class Qt5CmakeHandler(CmakeExtensionHandler):
+    def process_findpackage(self, srctree, fn, pkg, deps, outlines, inherits, values):
+        return False
+        cmake_qt5_pkgmap = {'qtbase': 'Qt5 Qt5Concurrent Qt5Core Qt5DBus Qt5Gui Qt5Network Qt5OpenGL Qt5OpenGLExtensions Qt5PrintSupport Qt5Sql Qt5Test Qt5Widgets Qt5Xml',
+                            'qtsvg': 'Qt5Svg',
+                            'qtdeclarative': 'Qt5Qml Qt5Quick Qt5QuickWidgets Qt5QuickTest',
+                            'qtxmlpatterns': 'Qt5XmlPatterns',
+                            'qtsystems': 'Qt5PublishSubscribe Qt5ServiceFramework Qt5SystemInfo',
+                            'qtscript': 'Qt5Script Qt5ScriptTools',
+                            'qttools': 'Qt5Designer Qt5Help Qt5LinguistTools Qt5UiPlugin Qt5UiTools',
+                            'qtenginio': 'Qt5Enginio',
+                            'qtsensors': 'Qt5Sensors',
+                            'qtmultimedia': 'Qt5Multimedia Qt5MultimediaWidgets',
+                            'qtwebchannel': 'Qt5WebChannel',
+                            'qtwebsockets': 'Qt5WebSockets',
+                            'qtserialport': 'Qt5SerialPort',
+                            'qtx11extras': 'Qt5X11Extras',
+                            'qtlocation': 'Qt5Location Qt5Positioning',
+                            'qt3d': 'Qt53DCollision Qt53DCore Qt53DInput Qt53DLogic Qt53DQuick Qt53DQuickRender Qt53DRender',
+                            }
+        for recipe, pkgs in cmake_qt5_pkgmap.iteritems():
+            if pkg in pkgs.split():
+                deps.append(recipe)
+                return True
+        return False
+
+    def post_process(self, srctree, fn, pkg, deps, outlines, inherits, values):
+        for dep in deps:
+            if dep.startswith('qt'):
+                if 'cmake_qt5' not in inherits:
+                    inherits.append('cmake_qt5')
+                break
+
+
+class Qmake5RecipeHandler(RecipeHandler):
+    # Map of QT variable items to recipes
+    qt_map = {'axcontainer': '',
+              'axserver': '',
+              'concurrent': 'qtbase',
+              'core': 'qtbase',
+              'gui': 'qtbase',
+              'dbus': 'qtbase',
+              'declarative': 'qtquick1',
+              'designer': 'qttools',
+              'help': 'qttools',
+              'multimedia': 'qtmultimedia',
+              'multimediawidgets': 'qtmultimedia',
+              'network': 'qtbase',
+              'opengl': 'qtbase',
+              'printsupport': 'qtbase',
+              'qml': 'qtdeclarative',
+              'qmltest': 'qtdeclarative',
+              'x11extras': 'qtx11extras',
+              'quick': 'qtdeclarative',
+              'script': 'qtscript',
+              'scripttools': 'qtscript',
+              'sensors': 'qtsensors',
+              'serialport': 'qtserialport',
+              'sql': 'qtbase',
+              'svg': 'qtsvg',
+              'testlib': 'qtbase',
+              'uitools': 'qttools',
+              'webkit': 'qtwebkit',
+              'webkitwidgets': 'qtwebkit',
+              'widgets': 'qtbase',
+              'winextras': '',
+              'xml': 'qtbase',
+              'xmlpatterns': 'qtxmlpatterns'}
+
+    def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
+        # There's not a conclusive way to tell a Qt2/3/4/5 .pro file apart, so we
+        # just assume that qmake5 is a reasonable default if you have this layer
+        # enabled
+        if 'buildsystem' in handled:
+            return False
+
+        unmappedqt = []
+        files = RecipeHandler.checkfiles(srctree, ['*.pro'])
+        deps = []
+        if files:
+            for fn in files:
+                self.parse_qt_pro(fn, deps, unmappedqt)
+
+            classes.append('qmake5')
+            if unmappedqt:
+                outlines.append('# NOTE: the following QT dependencies are unknown, ignoring: %s' % ' '.join(list(set(unmappedqt))))
+            if deps:
+                lines_before.append('DEPENDS = "%s"' % ' '.join(list(set(deps))))
+            handled.append('buildsystem')
+            return True
+        return False
+
+    def parse_qt_pro(self, fn, deps, unmappedqt):
+        with open(fn, 'r') as f:
+            for line in f:
+                if re.match('^QT\s*[+=]+', line):
+                    if '=' in line:
+                        for item in line.split('=')[1].split():
+                            dep = Qmake5RecipeHandler.qt_map.get(item, None)
+                            if dep:
+                                deps.append(dep)
+                            elif dep is not None:
+                                unmappedqt.append(item)
+                elif re.match('^SUBDIRS\s*[+=]+', line):
+                    if '=' in line:
+                        for item in line.split('=')[1].split():
+                            subfiles = RecipeHandler.checkfiles(os.path.join(os.path.dirname(fn), item), ['*.pro'])
+                            for subfn in subfiles:
+                                self.parse_qt_pro(subfn, deps, unmappedqt)
+                elif 'qml' in line.lower():
+                    deps.append('qtdeclarative')
+
+
+def register_recipe_handlers(handlers):
+    # Insert handler in front of default qmake handler
+    handlers.append((Qmake5RecipeHandler(), 21))
+
+def register_cmake_handlers(handlers):
+    handlers.append(Qt5CmakeHandler())
+
+def register_autotools_handlers(handlers):
+    handlers.append(Qt5AutotoolsHandler())
+
-- 
2.5.0


