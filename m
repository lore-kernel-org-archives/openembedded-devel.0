Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 867C6601D4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 18:14:54 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id h10-v6so25109328wrq.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qmQdCZCsOSKkHb45B+6Pw10KJJvC0nTqMVYM5L/38x0=;
	b=W7cIb3qZsy8bU3+C9Qmo6lNjg8JRt7fiSKaNC4CWDKoaN4afsjkvmDWG8hB3uhKNTr
	2Pt/JP46VnnFCIkeDBlDrfiGgwM7P80i//sj1lEHNoaNkAr8GoLv5bJJryyi1cA2H9wX
	RskJIJbQxAH7BpvZCfCi7LD39hzvFex6VjJfn+I+IdrvdO2iFWzOlyssr2tnc2g8YvOL
	Tr6rKcBRhzsF3BFCsALubsmI5+DgdJWjTTJU0/N1Nfstl5h+FzCHvcmAol2wupActy5J
	GloA440D1+2jsHckB7T7xykvERn9vRghNO2gEE/744yScB9V7ZE1RDaQPaaj2v5hl9Jz
	ZuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qmQdCZCsOSKkHb45B+6Pw10KJJvC0nTqMVYM5L/38x0=;
	b=UfwLcZs0de9SKb/rhvxDzj005FwbPBqne85FK0fr+b3wk5yZ8Ov/afnr7vpUCzdwJn
	ba0Tu+oyPKCIieF3ZvgrROltAyMYzqJLz8m41Z02Ey1ocmao+GEWFk1E+feXTeJqsvXg
	XCUGl743DKRA1IfU0Xx3GK6mFRxPqirrnQAnEl8o/sX7iSg64P8pg+/fKQiHFh2hom6a
	J2X+t8ZFdq8RnBz7EGFQAh9PXpwbHVEJpAGJBcNErbu/El43drNcyTgkl6h9wCAyvkaK
	NN4OKXqrpJFUyL1PNq7l/zqerPr/cd4ZxUugdWqEEqbpaE0hU0sastBplHvnv7FZNngl
	jrFw==
X-Gm-Message-State: APt69E0YKCAi6UEP57NjTxB7KzaTBIluT6cy5nQC2n05DI/LZXGFPKwV
	ot32aESoL05VQl44NIbRDrWbTw==
X-Google-Smtp-Source: ADUXVKJo1hJVDvceSBNHYoPWh4kW4wUuD4IoHp3MbyCA0wwiKaccweUvZziw9d1Y/uPg+WQmXNBPIw==
X-Received: by 2002:adf:d192:: with SMTP id
	h18-v6mr1252956wri.198.1528827295097; 
	Tue, 12 Jun 2018 11:14:55 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o12-v6sm1373656wrf.30.2018.06.12.11.14.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Jun 2018 11:14:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jun 2018 18:14:51 +0000
Message-Id: <20180612181452.3205-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH][morty][meta-oe 1/2] python-matplotlib: Upgrade to 2.0.2
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
X-List-Received-Date: Tue, 12 Jun 2018 18:14:54 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../python/python-matplotlib/fix_setup.patch  |  29 ----
 .../python-matplotlib/fix_setupext.patch      | 136 +++++++++++++-----
 .../python/python-matplotlib_1.1.0.bb         |  33 -----
 .../python/python-matplotlib_2.0.2.bb         |  18 +++
 4 files changed, 121 insertions(+), 95 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-matplotlib/fix_setup.patch
 delete mode 100644 meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python-matplotlib/fix_setup.patch b/meta-python/recipes-devtools/python/python-matplotlib/fix_setup.patch
deleted file mode 100644
index 9381583537..0000000000
--- a/meta-python/recipes-devtools/python/python-matplotlib/fix_setup.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-This fixes the dependency checks inside of setup.py since things like
-'import numpy' won't work with bitbake.
-
-diff --git a/setup.py b/setup.py
-index 2f13821..e6d6ed0 100644
---- a/setup.py
-+++ b/setup.py
-@@ -113,12 +113,6 @@ if 1:
-     baseline_images = [chop_package(f) for f in baseline_images]
-     package_data['matplotlib'].extend(baseline_images)
- 
--if not check_for_numpy():
--    sys.exit(1)
--
--if not check_for_freetype():
--    sys.exit(1)
--
- build_ft2font(ext_modules, packages)
- build_ttconv(ext_modules, packages)
- build_contour(ext_modules, packages)
-@@ -129,7 +123,7 @@ build_tri(ext_modules, packages)
- 
- print_raw("")
- print_raw("OPTIONAL BACKEND DEPENDENCIES")
--has_libpng = check_for_libpng()
-+has_libpng = True
- 
- if has_libpng and options['build_agg']:
-     build_agg(ext_modules, packages)
diff --git a/meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch b/meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch
index 9a13a1850f..21b9094a14 100644
--- a/meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch
+++ b/meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch
@@ -1,40 +1,110 @@
 This fixes the numpy import problem in setupext.py using a hard-coded path.
 
-Index: matplotlib-1.1.0/setupext.py
+Index: matplotlib-2.0.2/setupext.py
 ===================================================================
---- matplotlib-1.1.0.orig/setupext.py
-+++ matplotlib-1.1.0/setupext.py
-@@ -122,8 +122,8 @@ numpy_inc_dirs = []
- # matplotlib build options, which can be altered using setup.cfg
- options = {'display_status': True,
-            'verbose': False,
--           'provide_pytz': 'auto',
--           'provide_dateutil': 'auto',
-+           'provide_pytz': False,
-+           'provide_dateutil': False,
-            'build_agg': True,
-            'build_gtk': 'auto',
-            'build_gtkagg': 'auto',
-@@ -176,10 +176,7 @@ if os.path.exists(setup_cfg):
-     except: pass
+--- matplotlib-2.0.2.orig/setupext.py
++++ matplotlib-2.0.2/setupext.py
+@@ -148,6 +148,7 @@ def has_include_file(include_dirs, filen
+     Returns `True` if `filename` can be found in one of the
+     directories in `include_dirs`.
+     """
++    return True
+     if sys.platform == 'win32':
+         include_dirs += os.environ.get('INCLUDE', '.').split(';')
+     for dir in include_dirs:
+@@ -172,7 +173,7 @@ def get_base_dirs():
+     Returns a list of standard base directories on this platform.
+     """
+     if options['basedirlist']:
+-        return options['basedirlist']
++        return [os.environ['STAGING_LIBDIR']]
  
- # For get_base_flags:
--if options['basedirlist']:
--    basedirlist = options['basedirlist'].split()
--else:
--    basedirlist = basedir[sys.platform]
-+basedirlist = [os.environ['STAGING_LIBDIR']]
- print("basedirlist is: %s" % basedirlist)
+     basedir_map = {
+         'win32': ['win32_static', ],
+@@ -260,14 +261,6 @@ def make_extension(name, files, *args, *
+     `distutils.core.Extension` constructor.
+     """
+     ext = DelayedExtension(name, files, *args, **kwargs)
+-    for dir in get_base_dirs():
+-        include_dir = os.path.join(dir, 'include')
+-        if os.path.exists(include_dir):
+-            ext.include_dirs.append(include_dir)
+-        for lib in ('lib', 'lib64'):
+-            lib_dir = os.path.join(dir, lib)
+-            if os.path.exists(lib_dir):
+-                ext.library_dirs.append(lib_dir)
+     ext.include_dirs.append('.')
  
- if options['display_status']:
-@@ -555,8 +552,8 @@ def check_for_numpy():
+     return ext
+@@ -314,6 +307,7 @@ class PkgConfig(object):
+                     "    matplotlib may not be able to find some of its dependencies")
  
- def add_numpy_flags(module):
-     "Add the modules flags to build extensions which use numpy"
--    import numpy
--    module.include_dirs.append(numpy.get_include())
-+    # Hard-coded path for OE since I know this is where numpy's include dir will be
-+    module.include_dirs.append(os.path.join(os.environ['STAGING_LIBDIR'], 'python2.7/site-packages/numpy/core/include/'))
+     def set_pkgconfig_path(self):
++        return
+         pkgconfig_path = sysconfig.get_config_var('LIBDIR')
+         if pkgconfig_path is None:
+             return
+@@ -875,14 +869,14 @@ class Numpy(SetupPackage):
+             reload(numpy)
  
- def add_png_flags(module):
-     try_pkgconfig(module, 'libpng', 'png')
+         ext = Extension('test', [])
+-        ext.include_dirs.append(numpy.get_include())
++        ext.include_dirs.append(os.path.join(os.environ['STAGING_LIBDIR'], 'python2.7/site-packages/numpy/core/include/'))
+         if not has_include_file(
+                 ext.include_dirs, os.path.join("numpy", "arrayobject.h")):
+             warnings.warn(
+                 "The C headers for numpy could not be found. "
+                 "You may need to install the development package")
+ 
+-        return [numpy.get_include()]
++        return [os.path.join(os.environ['STAGING_LIBDIR'], 'python2.7/site-packages/numpy/core/include/')]
+ 
+     def check(self):
+         min_version = extract_versions()['__version__numpy__']
+Index: matplotlib-2.0.2/setup.py
+===================================================================
+--- matplotlib-2.0.2.orig/setup.py
++++ matplotlib-2.0.2/setup.py
+@@ -66,28 +66,6 @@ mpl_packages = [
+     setupext.Python(),
+     setupext.Platform(),
+     'Required dependencies and extensions',
+-    setupext.Numpy(),
+-    setupext.Six(),
+-    setupext.Dateutil(),
+-    setupext.FuncTools32(),
+-    setupext.Subprocess32(),
+-    setupext.Pytz(),
+-    setupext.Cycler(),
+-    setupext.Tornado(),
+-    setupext.Pyparsing(),
+-    setupext.LibAgg(),
+-    setupext.FreeType(),
+-    setupext.FT2Font(),
+-    setupext.Png(),
+-    setupext.Qhull(),
+-    setupext.Image(),
+-    setupext.TTConv(),
+-    setupext.Path(),
+-    setupext.ContourLegacy(),
+-    setupext.Contour(),
+-    setupext.Delaunay(),
+-    setupext.QhullWrap(),
+-    setupext.Tri(),
+     'Optional subpackages',
+     setupext.SampleData(),
+     setupext.Toolkits(),
+@@ -100,13 +78,8 @@ mpl_packages = [
+     setupext.BackendMacOSX(),
+     setupext.BackendQt5(),
+     setupext.BackendQt4(),
+-    setupext.BackendGtk3Agg(),
+     setupext.BackendGtk3Cairo(),
+-    setupext.BackendGtkAgg(),
+-    setupext.BackendTkAgg(),
+-    setupext.BackendWxAgg(),
+     setupext.BackendGtk(),
+-    setupext.BackendAgg(),
+     setupext.BackendCairo(),
+     setupext.Windowing(),
+     'Optional LaTeX dependencies',
diff --git a/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb b/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb
deleted file mode 100644
index 133e66da43..0000000000
--- a/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION = "matplotlib is a python 2D plotting library which produces publication quality figures in a variety of hardcopy formats"
-SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://README.txt;md5=83c5bf8b16a5f99507f2f47a21ae3b81"
-PR = "r1"
-
-DEPENDS += "python-numpy freetype libpng python-dateutil python-pytz"
-RDEPENDS_${PN} = "python-core python-distutils python-numpy freetype libpng python-dateutil python-pytz"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/matplotlib/matplotlib-${PV}.tar.gz \
-           file://fix_setup.patch \
-           file://fix_setupext.patch \
-"
-
-S = "${WORKDIR}/matplotlib-${PV}"
-
-EXTRA_OECONF = "--disable-docs --with-python-includes=${STAGING_INCDIR}/../"
-
-inherit distutils
-
-do_compile_prepend() {
-    ${STAGING_BINDIR_NATIVE}/python setup.py build ${DISTUTILS_BUILD_ARGS} || \
-    true
-}
-
-# need to export these variables for python-config to work
-export PYTHONPATH
-export STAGING_INCDIR
-export STAGING_LIBDIR
-
-
-SRC_URI[md5sum] = "57a627f30b3b27821f808659889514c2"
-SRC_URI[sha256sum] = "be37e1d86c65ecacae6683f8805e051e9904e5f2e02bf2b7a34262c46a6d06a7"
diff --git a/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb b/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb
new file mode 100644
index 0000000000..5b1c3f05b9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "matplotlib is a python 2D plotting library which produces publication quality figures in a variety of hardcopy formats"
+SECTION = "devel/python"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74"
+
+DEPENDS += "python-numpy freetype libpng python-dateutil python-pytz"
+RDEPENDS_${PN} = "python-core python-distutils python-numpy freetype libpng python-dateutil python-pytz"
+
+SRC_URI = "https://github.com/matplotlib/matplotlib/archive/v${PV}.tar.gz \
+           file://fix_setupext.patch \
+"
+SRC_URI[md5sum] = "89717c1ef3c6fdcd6fb1f3b597a4858c"
+SRC_URI[sha256sum] = "aebed23921562792b68b8ca355de5abc176af4424f1987e2fa95f65e5c5e7e89"
+S = "${WORKDIR}/matplotlib-${PV}"
+EXTRA_OECONF = "--disable-docs"
+
+inherit setuptools pkgconfig
+
-- 
2.17.1


