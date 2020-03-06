Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9457060C4D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Mar 2020 04:35:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0264Ykhu017526
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 Mar 2020 20:35:02 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.487.0; Thu, 5 Mar 2020 20:34:37 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 6 Mar 2020 12:34:35 +0800
Message-ID: <1583469275-310604-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] python3-pygobject: remove this recipe
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
X-List-Received-Date: Fri, 06 Mar 2020 04:35:11 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

python3-pygobject already in oe-core, previously,
we have python-pygobject in meta-oe, but recently, in order
to drop python2, we transfer python-pygobject to
python3-pygobject, so duplicated with oe-core, meantime,
this will cause test_signature failure when do yocto-check-layer
for layer meta-oe.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-python-pyobject-fix-install-dir.patch     | 121 ---------------------
 .../python/python3-pygobject_3.34.0.bb             |  33 ------
 2 files changed, 154 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python3-pygobject/0001-python-pyobject-fix-install-dir.patch
 delete mode 100644 meta-oe/recipes-devtools/python/python3-pygobject_3.34.0.bb

diff --git a/meta-oe/recipes-devtools/python/python3-pygobject/0001-python-pyobject-fix-install-dir.patch b/meta-oe/recipes-devtools/python/python3-pygobject/0001-python-pyobject-fix-install-dir.patch
deleted file mode 100644
index 848cda5..0000000
--- a/meta-oe/recipes-devtools/python/python3-pygobject/0001-python-pyobject-fix-install-dir.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From 8b4648d5bc50cb1c14961ed38bf97d5a693f5237 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 24 Jun 2019 14:51:52 +0800
-Subject: [PATCH] python-pyobject: fix the wrong install dir for python2
-
-* after upgrade to 3.32.1, pygobject switch to build with meson, and
-  default python option is python3, switch to python2
-
-* default install dir get by python.install_sources and 
-python.get_install_dir is get from python's sysconfig info,
-not like python3, for python2, the install dir include the basedir of
-recipe-sysroot-native, add stagedir option for user to config
-correct install dir.
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- gi/meson.build            | 7 +++----
- gi/overrides/meson.build  | 4 ++--
- gi/repository/meson.build | 4 ++--
- meson.build               | 4 +++-
- meson_options.txt         | 1 +
- pygtkcompat/meson.build   | 4 ++--
- 6 files changed, 13 insertions(+), 11 deletions(-)
-
-diff --git a/gi/meson.build b/gi/meson.build
-index c1afd68..249c23d 100644
---- a/gi/meson.build
-+++ b/gi/meson.build
-@@ -60,9 +60,8 @@ python_sources = [
-   'types.py',
- ]
- 
--python.install_sources(python_sources,
--  pure : false,
--  subdir : 'gi'
-+install_data(python_sources,
-+  install_dir: join_paths(stagedir, 'gi')
- )
- 
- # https://github.com/mesonbuild/meson/issues/4117
-@@ -76,7 +75,7 @@ giext = python.extension_module('_gi', sources,
-   dependencies : [python_ext_dep, glib_dep, gi_dep, ffi_dep],
-   include_directories: include_directories('..'),
-   install: true,
--  subdir : 'gi',
-+  install_dir: join_paths(stagedir, 'gi'),
-   c_args: pyext_c_args + main_c_args
- )
-
-diff --git a/gi/overrides/meson.build b/gi/overrides/meson.build
-index 6ff073f..964fef1 100644
---- a/gi/overrides/meson.build
-+++ b/gi/overrides/meson.build
-@@ -10,6 +10,6 @@ python_sources = [
-   'keysyms.py',
-   '__init__.py']
- 
--python.install_sources(python_sources,
--  subdir : join_paths('gi', 'overrides')
-+install_data(python_sources,
-+  install_dir: join_paths(stagedir, 'gi', 'overrides')
- )
-diff --git a/gi/repository/meson.build b/gi/repository/meson.build
-index fdc136b..fc88adf 100644
---- a/gi/repository/meson.build
-+++ b/gi/repository/meson.build
-@@ -1,5 +1,5 @@
- python_sources = ['__init__.py']
- 
--python.install_sources(python_sources,
--  subdir : join_paths('gi', 'repository')
-+install_data(python_sources,
-+  install_dir: join_paths(stagedir, 'gi', 'repository')
- )
-diff --git a/meson.build b/meson.build
-index d27a005..ecd55d5 100644
---- a/meson.build
-+++ b/meson.build
-@@ -165,12 +165,14 @@ else
-   py_version = pygobject_version
- endif
- 
-+stagedir = get_option('stagedir')
-+
- pkginfo_conf = configuration_data()
- pkginfo_conf.set('VERSION', py_version)
- configure_file(input : 'PKG-INFO.in',
-   output : 'PyGObject-@0@.egg-info'.format(py_version),
-   configuration : pkginfo_conf,
--  install_dir : python.get_install_dir(pure : false))
-+  install_dir : stagedir)
- 
- subdir('gi')
- subdir('pygtkcompat')
-diff --git a/meson_options.txt b/meson_options.txt
-index 5dd4cbc..21def16 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -1,3 +1,4 @@
- option('python', type : 'string', value : 'python3')
- option('pycairo', type : 'boolean', value : true, description : 'build with pycairo integration')
- option('tests', type : 'boolean', value : true, description : 'build unit tests')
-+option('stagedir', type : 'string', value : '')
-diff --git a/pygtkcompat/meson.build b/pygtkcompat/meson.build
-index 9e43c44..ef3322d 100644
---- a/pygtkcompat/meson.build
-+++ b/pygtkcompat/meson.build
-@@ -3,6 +3,6 @@ python_sources = [
-   'generictreemodel.py',
-   'pygtkcompat.py']
- 
--python.install_sources(python_sources,
--  subdir : 'pygtkcompat'
-+install_data(python_sources,
-+  install_dir: join_paths(stagedir, 'pygtkcompat')
- )
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-devtools/python/python3-pygobject_3.34.0.bb b/meta-oe/recipes-devtools/python/python3-pygobject_3.34.0.bb
deleted file mode 100644
index e06f4dc..0000000
--- a/meta-oe/recipes-devtools/python/python3-pygobject_3.34.0.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "Python GObject bindings"
-HOMEPAGE = "http://www.pygtk.org/"
-SECTION = "devel/python"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
-
-GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase gobject-introspection distutils3-base upstream-version-is-even
-
-DEPENDS += "python3 glib-2.0"
-
-SRCNAME = "pygobject"
-SRC_URI = " \
-    http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
-"
-
-SRC_URI[md5sum] = "ca1dc4f31c1d6d283758e8f315a88ab6"
-SRC_URI[sha256sum] = "87e2c9aa785f352ef111dcc5f63df9b85cf6e05e52ff04f803ffbebdacf5271a"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-UNKNOWN_CONFIGURE_WHITELIST = "introspection"
-
-PACKAGECONFIG ??= ""
-
-PACKAGECONFIG[cairo] = "-Dpycairo=true,-Dpycairo=false, cairo python-pycairo, python-pycairo"
-PACKAGECONFIG[tests] = "-Dtests=true, -Dtests=false, , "
-
-EXTRA_OEMESON_append = " -Dpython=python3"
-
-BBCLASSEXTEND = "native"
-RDEPENDS_${PN} = "python3-pkgutil"
-RDEPENDS_${PN}_class-native = ""
-- 
2.7.4


