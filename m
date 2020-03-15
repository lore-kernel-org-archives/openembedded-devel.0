Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id EB27761C60
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2020 23:44:21 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id cy12so1981270qvb.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2020 16:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lBsMYtx7MvJQs15qySaxNWvqsaVZ89OIw2Mvuxjc8uE=;
	b=cZBROGg5DA7glTP4UTJZalh49DYsvWhqKeQg85zMuLpZoDFivdpyGIrSFBxU8ctUub
	h/mkkuo5PiuLF6RoNOP46uUG+lvLbjuHGgZAkr7nFVvfrAk2C/ntpfmfypWyIIastJ29
	z36iHkbyTdkZjO6kuchgaJFEjRjM3S6envDvBcG2f2zkMeW18H+V6g/ZHa2r9qllEG8M
	UoszdZ5UrkKFnTn8wN6O1sXKBfDr0+1WycB81vjSZeK0csvkN1ud33FO3E61EY2Y3ZnX
	rd6b6f75txcnCOlBGa8NsU4ZDPLYGvnR2eDEmRtt0P24q0a67a2G8YVkY8xuPa+rcP88
	gnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lBsMYtx7MvJQs15qySaxNWvqsaVZ89OIw2Mvuxjc8uE=;
	b=PQJGEa77lKLDvRoqLspWCchK89MbRN0ATO0gyfeTEVYLw0oQC7ibM+DwP2dlmCq1aQ
	XoygD0ABavVZBdjiHtQ1iDVTGjrb/wjpTuU98sobGdtBCYaFHmba991nKwjDm0ewrfFO
	l3DP6yjlA0lcPf3zBJSk+M5xWHvjVH763p7/ueyzJcdhOC5IBdXLWkv+zPPQ5bhRaWM8
	IMj/p7wl7nTozu7c4DLFJPNv/NAe3RpCDQy3iKejR9J6BmJXbL2BjlDNnA2valacmaW2
	G9veWnq0wL704M5z6bh+54eIOf2rvI5E0hDC96/LxT3J3YVr/LmZVUDGBL7OAlN6T5n6
	jNDw==
X-Gm-Message-State: ANhLgQ1qMpdKtXGCc984BAI5qBYRG3xn62dbuGHnX392kM4p9fEoBlmD
	qLC11aYr929HGG5XoOfEku290zLcPlkq7T4dwBw=
X-Google-Smtp-Source: ADFU+vvqmbjz81HBYJKOiX3oYpo3jziovroLcIZmiBw+l03D1UdUbo4p18ALnewPbjTICxqJG8Bhzq+9LvFCm9JnHUo=
X-Received: by 2002:ad4:45a7:: with SMTP id y7mr22603428qvu.146.1584315862381; 
	Sun, 15 Mar 2020 16:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200311070359.18480-1-nick83ola@gmail.com>
	<20200311070359.18480-3-nick83ola@gmail.com>
In-Reply-To: <20200311070359.18480-3-nick83ola@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 Mar 2020 16:43:56 -0700
Message-ID: <CAMKF1sqcprj2Yq3vKnrD2s0Firk8YSmjZDMq2s72SqOnVVRA0g@mail.gmail.com>
To: Nicola Lunghi <nick83ola@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Parthiban Nallathambi <parthitce@gmail.com>
Subject: Re: [meta-python][PATCH 3/3] python3-matplotlib: fix dependencies and license
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
X-List-Received-Date: Sun, 15 Mar 2020 23:44:22 -0000
Content-Type: text/plain; charset="UTF-8"

please rebase on master-next and resend.

On Wed, Mar 11, 2020 at 12:05 AM Nicola Lunghi <nick83ola@gmail.com> wrote:
>
> * The license indicated in the old recipe (and in this) is the PSF not the BSD
> that was indicated before.
> * fixed the dependencies (looking at the recipe at meta-jupiter
> https://github.com/Xilinx/meta-jupyter/tree/master/recipes-python/
> * the setupext script was a leftover from the python2 recipe remove it for now
>   but probably has to be put updated and put back in the future:
>   -> all the module are installed by default and they have different licenses?
>
> Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> ---
>  .../python-matplotlib/fix_setupext.patch      | 110 ------------------
>  .../python/python3-matplotlib_3.1.1.bb        |  24 ++--
>  2 files changed, 17 insertions(+), 117 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch
>
> diff --git a/meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch b/meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch
> deleted file mode 100644
> index 21b9094a1..000000000
> --- a/meta-python/recipes-devtools/python/python-matplotlib/fix_setupext.patch
> +++ /dev/null
> @@ -1,110 +0,0 @@
> -This fixes the numpy import problem in setupext.py using a hard-coded path.
> -
> -Index: matplotlib-2.0.2/setupext.py
> -===================================================================
> ---- matplotlib-2.0.2.orig/setupext.py
> -+++ matplotlib-2.0.2/setupext.py
> -@@ -148,6 +148,7 @@ def has_include_file(include_dirs, filen
> -     Returns `True` if `filename` can be found in one of the
> -     directories in `include_dirs`.
> -     """
> -+    return True
> -     if sys.platform == 'win32':
> -         include_dirs += os.environ.get('INCLUDE', '.').split(';')
> -     for dir in include_dirs:
> -@@ -172,7 +173,7 @@ def get_base_dirs():
> -     Returns a list of standard base directories on this platform.
> -     """
> -     if options['basedirlist']:
> --        return options['basedirlist']
> -+        return [os.environ['STAGING_LIBDIR']]
> -
> -     basedir_map = {
> -         'win32': ['win32_static', ],
> -@@ -260,14 +261,6 @@ def make_extension(name, files, *args, *
> -     `distutils.core.Extension` constructor.
> -     """
> -     ext = DelayedExtension(name, files, *args, **kwargs)
> --    for dir in get_base_dirs():
> --        include_dir = os.path.join(dir, 'include')
> --        if os.path.exists(include_dir):
> --            ext.include_dirs.append(include_dir)
> --        for lib in ('lib', 'lib64'):
> --            lib_dir = os.path.join(dir, lib)
> --            if os.path.exists(lib_dir):
> --                ext.library_dirs.append(lib_dir)
> -     ext.include_dirs.append('.')
> -
> -     return ext
> -@@ -314,6 +307,7 @@ class PkgConfig(object):
> -                     "    matplotlib may not be able to find some of its dependencies")
> -
> -     def set_pkgconfig_path(self):
> -+        return
> -         pkgconfig_path = sysconfig.get_config_var('LIBDIR')
> -         if pkgconfig_path is None:
> -             return
> -@@ -875,14 +869,14 @@ class Numpy(SetupPackage):
> -             reload(numpy)
> -
> -         ext = Extension('test', [])
> --        ext.include_dirs.append(numpy.get_include())
> -+        ext.include_dirs.append(os.path.join(os.environ['STAGING_LIBDIR'], 'python2.7/site-packages/numpy/core/include/'))
> -         if not has_include_file(
> -                 ext.include_dirs, os.path.join("numpy", "arrayobject.h")):
> -             warnings.warn(
> -                 "The C headers for numpy could not be found. "
> -                 "You may need to install the development package")
> -
> --        return [numpy.get_include()]
> -+        return [os.path.join(os.environ['STAGING_LIBDIR'], 'python2.7/site-packages/numpy/core/include/')]
> -
> -     def check(self):
> -         min_version = extract_versions()['__version__numpy__']
> -Index: matplotlib-2.0.2/setup.py
> -===================================================================
> ---- matplotlib-2.0.2.orig/setup.py
> -+++ matplotlib-2.0.2/setup.py
> -@@ -66,28 +66,6 @@ mpl_packages = [
> -     setupext.Python(),
> -     setupext.Platform(),
> -     'Required dependencies and extensions',
> --    setupext.Numpy(),
> --    setupext.Six(),
> --    setupext.Dateutil(),
> --    setupext.FuncTools32(),
> --    setupext.Subprocess32(),
> --    setupext.Pytz(),
> --    setupext.Cycler(),
> --    setupext.Tornado(),
> --    setupext.Pyparsing(),
> --    setupext.LibAgg(),
> --    setupext.FreeType(),
> --    setupext.FT2Font(),
> --    setupext.Png(),
> --    setupext.Qhull(),
> --    setupext.Image(),
> --    setupext.TTConv(),
> --    setupext.Path(),
> --    setupext.ContourLegacy(),
> --    setupext.Contour(),
> --    setupext.Delaunay(),
> --    setupext.QhullWrap(),
> --    setupext.Tri(),
> -     'Optional subpackages',
> -     setupext.SampleData(),
> -     setupext.Toolkits(),
> -@@ -100,13 +78,8 @@ mpl_packages = [
> -     setupext.BackendMacOSX(),
> -     setupext.BackendQt5(),
> -     setupext.BackendQt4(),
> --    setupext.BackendGtk3Agg(),
> -     setupext.BackendGtk3Cairo(),
> --    setupext.BackendGtkAgg(),
> --    setupext.BackendTkAgg(),
> --    setupext.BackendWxAgg(),
> -     setupext.BackendGtk(),
> --    setupext.BackendAgg(),
> -     setupext.BackendCairo(),
> -     setupext.Windowing(),
> -     'Optional LaTeX dependencies',
> diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
> index 824680c24..1fb234c8e 100644
> --- a/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
> @@ -4,16 +4,26 @@ Matplotlib is a Python 2D plotting library which produces \
>  publication-quality figures in a variety of hardcopy formats \
>  and interactive environments across platforms."
>  HOMEPAGE = "https://github.com/matplotlib/matplotlib"
> -LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74"
> -
> -DEPENDS = "python3-numpy-native python3-numpy freetype libpng python3-dateutil python3-pytz"
> -RDEPENDS_${PN} = "python3-numpy freetype libpng python3-dateutil python3-pytz"
> +LICENSE = "PSF"
> +LIC_FILES_CHKSUM = "\
> +    file://setup.py;beginline=275;endline=275;md5=2a114620e4e6843aa7568d5902501753 \
> +    file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74 \
> +"
> +DEPENDS = "python3-numpy-native freetype libpng"
>
>  SRC_URI[md5sum] = "f894af5564a588e880644123237251b7"
>  SRC_URI[sha256sum] = "1febd22afe1489b13c6749ea059d392c03261b2950d1d45c17e3aed812080c93"
>
> -PYPI_PACKAGE = "matplotlib"
> -inherit pypi setuptools3
> +inherit pypi setuptools3 pkgconfig
> +
> +EXTRA_OECONF = "--disable-docs"
> +
> +RDEPENDS_${PN} += "\
> +    python3-numpy \
> +    python3-pyparsing \
> +    python3-cycler \
> +    python3-dateutil \
> +    python3-kiwisolver \
> +"
>
>  BBCLASSEXTEND = "native"
> --
> 2.20.1
>

