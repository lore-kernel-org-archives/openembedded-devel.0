Return-Path: <nick83ola@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id A080D61BD4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 07:05:02 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id v11so1111675wrm.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 00:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Gl7ruCRTQi7WKL1uW5JimNDyjhyk4sju3mGoJyBVwUI=;
	b=uf0S5GLeU3gF/h+rsn1LwmEDtsDU8MXnHK239GGA+2Vq38CQLVd0AsNHkPgq/uHtQW
	edsvmR6kTa2PQfVPsikUMQRjjb/Ug4f10tyTSo0ow8USa1bq7W1mY9rctlQmUNbUH5UL
	UqczQb1aF4yjB1HoF3wuBWRCY/ALZRmKujBEeo63JxsN7RiG9Q6OLEGPEXX8AR495dkY
	sLQfVwJPfIC9kKklsk5vyhAQfL8ylGfUswHakWbfZkZ7FxDFWEyyj9udWnPdXtJx/OKL
	Bow9PSBbSaKezbl4ssYsZScN61PBEqO6ZEmujqW7CkOGO/373LKcRibjR8+g0EJOGBsz
	m7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Gl7ruCRTQi7WKL1uW5JimNDyjhyk4sju3mGoJyBVwUI=;
	b=KQrSjQFWdN7KF8xHvW8yspVhGf/FiXphgWPZlDed8IixA055ssXLCrXsqPxxkhj44K
	bQix91KTFDSjKu9rY+1CfWW076B+j0P/+/U28HcSRvRHRc6LI64neyqyRVEDrLptQP7D
	xhCzRBkTBHdADD1bVQ1NwdJspoQ65l2VSCqWz2QntLDLauh/PK9h/vO2NkPzP5NxSnY6
	WJQVGrfTxa+VNoEHuBp7Of0iDHY0wgG+ucm/3psos1YFpXamjuYwvsJyoClL+iVRP6iV
	b5p1kUIJ7yEnRruil8dBu3iBNV9mQqZ9NO6dXoo3vDiZJahK/XpBkK0gP0aCIsefdgYJ
	fwvg==
X-Gm-Message-State: ANhLgQ2PrqbJ5I5BgmLA9crn4Lnou1CdhR1sOe2/1jvJtlZzNSodDJSS
	lX38uH+x0Ta948CFbmS/hLabUt2sus5Sow==
X-Google-Smtp-Source: ADFU+vsGEh0XfEI2WmREVO+t0iIht9LJ7uRwJ8eG2uNYMYf4yfgK/glr72azdVyT3LwV+TRgaA7gKQ==
X-Received: by 2002:adf:fd81:: with SMTP id d1mr2588528wrr.82.1583910302779;
	Wed, 11 Mar 2020 00:05:02 -0700 (PDT)
Received: from localhost.localdomain ([79.97.95.10])
	by smtp.gmail.com with ESMTPSA id f2sm9567312wrv.48.2020.03.11.00.05.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 00:05:02 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Mar 2020 07:04:02 +0000
Message-Id: <20200311070359.18480-3-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200311070359.18480-1-nick83ola@gmail.com>
References: <20200311070359.18480-1-nick83ola@gmail.com>
MIME-Version: 1.0
Cc: Parthiban Nallathambi <parthitce@gmail.com>
Subject: [meta-python][PATCH 3/3] python3-matplotlib: fix dependencies and license
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
X-List-Received-Date: Wed, 11 Mar 2020 07:05:03 -0000
Content-Transfer-Encoding: 8bit

* The license indicated in the old recipe (and in this) is the PSF not the BSD
that was indicated before.
* fixed the dependencies (looking at the recipe at meta-jupiter
https://github.com/Xilinx/meta-jupyter/tree/master/recipes-python/
* the setupext script was a leftover from the python2 recipe remove it for now
  but probably has to be put updated and put back in the future:
  -> all the module are installed by default and they have different licenses?

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../python-matplotlib/fix_setupext.patch      | 110 ------------------
 .../python/python3-matplotlib_3.1.1.bb        |  24 ++--
 2 files changed, 17 insertions(+), 117 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch

diff --git a/meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch b/meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch
deleted file mode 100644
index 21b9094a1..000000000
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
diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
index 824680c24..1fb234c8e 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
@@ -4,16 +4,26 @@ Matplotlib is a Python 2D plotting library which produces \
 publication-quality figures in a variety of hardcopy formats \
 and interactive environments across platforms."
 HOMEPAGE = "https://github.com/matplotlib/matplotlib"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74"
-
-DEPENDS = "python3-numpy-native python3-numpy freetype libpng python3-dateutil python3-pytz"
-RDEPENDS_${PN} = "python3-numpy freetype libpng python3-dateutil python3-pytz"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "\
+    file://setup.py;beginline=275;endline=275;md5=2a114620e4e6843aa7568d5902501753 \
+    file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74 \
+"
+DEPENDS = "python3-numpy-native freetype libpng"
 
 SRC_URI[md5sum] = "f894af5564a588e880644123237251b7"
 SRC_URI[sha256sum] = "1febd22afe1489b13c6749ea059d392c03261b2950d1d45c17e3aed812080c93"
 
-PYPI_PACKAGE = "matplotlib"
-inherit pypi setuptools3
+inherit pypi setuptools3 pkgconfig
+
+EXTRA_OECONF = "--disable-docs"
+
+RDEPENDS_${PN} += "\
+    python3-numpy \
+    python3-pyparsing \
+    python3-cycler \
+    python3-dateutil \
+    python3-kiwisolver \
+"
 
 BBCLASSEXTEND = "native"
-- 
2.20.1


