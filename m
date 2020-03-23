Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.45036.1584929292980979966
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2020 19:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nyNKQgBr;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: nick83ola@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id b2so15056414wrj.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2020 19:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hTZt9KxIoRoduV2ewN5VL+k+FpeqS8p4WDJbFfeLBYs=;
        b=nyNKQgBrty/9HqJzWSRp8e9Va1s+tICau1dZiITTMtdflB2RM3fpuAJJzEuvFKX3tP
         NKgF5TpZxLlpwpMwfZGCC00u42tII9rZOSXosvnor3XPaRImds8GN6xOdI3TPbFrH4tR
         8UO7ru/8xFgriIS1N22JPDbW3t73YgTx5TXcaGjRBZTYvy46zuXNO+bh2Ail+vit0ePL
         zF2KZXscqBW2fCVjQMIP2EPa26G84W+iemcOAzlBZg0cQw5ULlAgrCyCocmY0DEMwW2I
         OK7s00JNSps0DlT4nuEH22B5etmA+JLG7DgWxQJyDLV3HxDgEo6ECevW75z6KcV/J/m8
         /NNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hTZt9KxIoRoduV2ewN5VL+k+FpeqS8p4WDJbFfeLBYs=;
        b=FF47AzVnKCAwr+m+uagkJwgG1eOExk1tU/tUzSNcV9SuL8qlA4Kxy8UIMrREz11hnn
         HCzkz2VKty0rEPH3bT7MyW4Ej5sOOMQAH2Iq3JZ+6w/zLdgpHRBv02hDhzl80PqkQjLe
         YQ0qzlYJ14CViqHS4lHtS10/JKBXlhvw1/st8R3zKVNOGioXP0pioYpRbT7YOs9qTWoH
         9DZ+TfJW/B2o725wbddU2+/Mxlf6Sb5Ojr+AqKqBHBRonmc+R3hjcSls+dY1vyf+zpkB
         2MNS7IbvsnuyVpYbR4/08T54djkA8KlHIufscoizjiKos5o0h5k2Iy0CcGpzGfXkKYcn
         ECgg==
X-Gm-Message-State: ANhLgQ2/Gijfij17o0L6M5C6RrOE47+fi9X9+H30MTpASPKv0jh1IPjW
	RM4Djtw7zt7SvJ0YVI4mMakuE8o9QM4=
X-Google-Smtp-Source: ADFU+vvYgEMGk8BiIMhQtIjRCz1rY2JeEXt9rh+ooR6RwEb6rEKlJJCy4Z+1+yG+TPO2iTbtT8dlSQ==
X-Received: by 2002:adf:ab5d:: with SMTP id r29mr22598205wrc.158.1584929291131;
        Sun, 22 Mar 2020 19:08:11 -0700 (PDT)
Return-Path: <nick83ola@gmail.com>
Received: from nick-beastie.garage.tyco.com ([79.97.95.10])
        by smtp.gmail.com with ESMTPSA id j124sm10242811wmb.25.2020.03.22.19.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2020 19:08:09 -0700 (PDT)
From: "Nicola Lunghi" <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Nicola Lunghi <nick83ola@gmail.com>
Subject: [meta-python][PATCH v2] python-matplotlib: remove leftover file fix_setupext.patch
Date: Mon, 23 Mar 2020 02:08:03 +0000
Message-Id: <20200323020802.12318-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On commit:

3468447d96 python-matplotlib: remove the python 2.x version of the recipe

was forgotten to remove this patch file.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../python-matplotlib/fix_setupext.patch      | 110 ------------------
 1 file changed, 110 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch

diff --git a/meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch b/meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch
deleted file mode 100644
index 21b9094a14..0000000000
--- a/meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-This fixes the numpy import problem in setupext.py using a hard-coded path.
-
-Index: matplotlib-2.0.2/setupext.py
-===================================================================
---- matplotlib-2.0.2.orig/setupext.py
-+++ matplotlib-2.0.2/setupext.py
-@@ -148,6 +148,7 @@ def has_include_file(include_dirs, filen
-     Returns `True` if `filename` can be found in one of the
-     directories in `include_dirs`.
-     """
-+    return True
-     if sys.platform == 'win32':
-         include_dirs += os.environ.get('INCLUDE', '.').split(';')
-     for dir in include_dirs:
-@@ -172,7 +173,7 @@ def get_base_dirs():
-     Returns a list of standard base directories on this platform.
-     """
-     if options['basedirlist']:
--        return options['basedirlist']
-+        return [os.environ['STAGING_LIBDIR']]
- 
-     basedir_map = {
-         'win32': ['win32_static', ],
-@@ -260,14 +261,6 @@ def make_extension(name, files, *args, *
-     `distutils.core.Extension` constructor.
-     """
-     ext = DelayedExtension(name, files, *args, **kwargs)
--    for dir in get_base_dirs():
--        include_dir = os.path.join(dir, 'include')
--        if os.path.exists(include_dir):
--            ext.include_dirs.append(include_dir)
--        for lib in ('lib', 'lib64'):
--            lib_dir = os.path.join(dir, lib)
--            if os.path.exists(lib_dir):
--                ext.library_dirs.append(lib_dir)
-     ext.include_dirs.append('.')
- 
-     return ext
-@@ -314,6 +307,7 @@ class PkgConfig(object):
-                     "    matplotlib may not be able to find some of its dependencies")
- 
-     def set_pkgconfig_path(self):
-+        return
-         pkgconfig_path = sysconfig.get_config_var('LIBDIR')
-         if pkgconfig_path is None:
-             return
-@@ -875,14 +869,14 @@ class Numpy(SetupPackage):
-             reload(numpy)
- 
-         ext = Extension('test', [])
--        ext.include_dirs.append(numpy.get_include())
-+        ext.include_dirs.append(os.path.join(os.environ['STAGING_LIBDIR'], 'python2.7/site-packages/numpy/core/include/'))
-         if not has_include_file(
-                 ext.include_dirs, os.path.join("numpy", "arrayobject.h")):
-             warnings.warn(
-                 "The C headers for numpy could not be found. "
-                 "You may need to install the development package")
- 
--        return [numpy.get_include()]
-+        return [os.path.join(os.environ['STAGING_LIBDIR'], 'python2.7/site-packages/numpy/core/include/')]
- 
-     def check(self):
-         min_version = extract_versions()['__version__numpy__']
-Index: matplotlib-2.0.2/setup.py
-===================================================================
---- matplotlib-2.0.2.orig/setup.py
-+++ matplotlib-2.0.2/setup.py
-@@ -66,28 +66,6 @@ mpl_packages = [
-     setupext.Python(),
-     setupext.Platform(),
-     'Required dependencies and extensions',
--    setupext.Numpy(),
--    setupext.Six(),
--    setupext.Dateutil(),
--    setupext.FuncTools32(),
--    setupext.Subprocess32(),
--    setupext.Pytz(),
--    setupext.Cycler(),
--    setupext.Tornado(),
--    setupext.Pyparsing(),
--    setupext.LibAgg(),
--    setupext.FreeType(),
--    setupext.FT2Font(),
--    setupext.Png(),
--    setupext.Qhull(),
--    setupext.Image(),
--    setupext.TTConv(),
--    setupext.Path(),
--    setupext.ContourLegacy(),
--    setupext.Contour(),
--    setupext.Delaunay(),
--    setupext.QhullWrap(),
--    setupext.Tri(),
-     'Optional subpackages',
-     setupext.SampleData(),
-     setupext.Toolkits(),
-@@ -100,13 +78,8 @@ mpl_packages = [
-     setupext.BackendMacOSX(),
-     setupext.BackendQt5(),
-     setupext.BackendQt4(),
--    setupext.BackendGtk3Agg(),
-     setupext.BackendGtk3Cairo(),
--    setupext.BackendGtkAgg(),
--    setupext.BackendTkAgg(),
--    setupext.BackendWxAgg(),
-     setupext.BackendGtk(),
--    setupext.BackendAgg(),
-     setupext.BackendCairo(),
-     setupext.Windowing(),
-     'Optional LaTeX dependencies',
-- 
2.20.1

