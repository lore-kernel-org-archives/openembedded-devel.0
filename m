Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel.mcdougall@liftoffsoftware.com>)
	id 1Sd6L7-0008N3-C5 for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2012 23:03:25 +0200
Received: by yhjj56 with SMTP id j56so1547136yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2012 13:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=Ql+agiCgiqMJ51tq6/xp1k0QNPfCh5B/auDnKJjOC2s=;
	b=AVBU+P6Ei785hDBjM2m9ZMeAm2LxKp0kSMt8B61pFTUaF72ZjBnSCZp5Oa6RPd3YUV
	n3NHzWnVQquG/KuXUrVO7inJIvgEeYsfP37XzJ+XP1IghnL+Weh97HdR7oim3T1KVkb3
	/EF0QagUwpXJB1LhLGLgVl0Gg+3B9j7Q1DXmcTxaRXtXJpdz5GqmOJ+MvVunGeZlgjOy
	naWhG3qDvX47vitBx7y0Sa51SioeguMwMWJaZ488hkB5c+geXwW9Gg9KjDIk9LI2K8eW
	jVQ/FLTIjY5MmFZkwFQklWngeqVGSW36+1VvQvDWwxpxGfb0dExM5ANB8mpIM7nA3w+y
	MR2g==
Received: by 10.101.73.15 with SMTP id a15mr2874830anl.76.1339188774764;
	Fri, 08 Jun 2012 13:52:54 -0700 (PDT)
Received: from htpc.lan (c-69-180-64-152.hsd1.fl.comcast.net. [69.180.64.152])
	by mx.google.com with ESMTPS id
	e5sm11268999ani.18.2012.06.08.13.52.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jun 2012 13:52:54 -0700 (PDT)
From: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2012 16:52:38 -0400
Message-Id: <1339188758-10480-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQk6oC6utydaHblEBUq5QPy6sA9+LzO0PbN6RBXCmzF80wYHLhCjAXomvjYCwIOuqID+knQh
Subject: [meta-oe][PATCH] python-matplotlib : Add recipe for matplotlib 1.1.0.
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
X-List-Received-Date: Fri, 08 Jun 2012 21:03:25 -0000

Adding python-matplotlib recipe.  I'm sure many folks will find this useful.

Signed-off-by: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
---
 .../python/python-matplotlib/fix_setup.patch       |   29 ++++++++++++++++
 .../python/python-matplotlib/fix_setupext.patch    |   29 ++++++++++++++++
 .../python/python-matplotlib_1.1.0.bb              |   36 ++++++++++++++++++++
 3 files changed, 94 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-matplotlib/fix_setup.patch
 create mode 100644 meta-oe/recipes-devtools/python/python-matplotlib/fix_setupext.patch
 create mode 100644 meta-oe/recipes-devtools/python/python-matplotlib_1.1.0.bb

diff --git a/meta-oe/recipes-devtools/python/python-matplotlib/fix_setup.patch b/meta-oe/recipes-devtools/python/python-matplotlib/fix_setup.patch
new file mode 100644
index 0000000..9381583
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-matplotlib/fix_setup.patch
@@ -0,0 +1,29 @@
+This fixes the dependency checks inside of setup.py since things like
+'import numpy' won't work with bitbake.
+
+diff --git a/setup.py b/setup.py
+index 2f13821..e6d6ed0 100644
+--- a/setup.py
++++ b/setup.py
+@@ -113,12 +113,6 @@ if 1:
+     baseline_images = [chop_package(f) for f in baseline_images]
+     package_data['matplotlib'].extend(baseline_images)
+ 
+-if not check_for_numpy():
+-    sys.exit(1)
+-
+-if not check_for_freetype():
+-    sys.exit(1)
+-
+ build_ft2font(ext_modules, packages)
+ build_ttconv(ext_modules, packages)
+ build_contour(ext_modules, packages)
+@@ -129,7 +123,7 @@ build_tri(ext_modules, packages)
+ 
+ print_raw("")
+ print_raw("OPTIONAL BACKEND DEPENDENCIES")
+-has_libpng = check_for_libpng()
++has_libpng = True
+ 
+ if has_libpng and options['build_agg']:
+     build_agg(ext_modules, packages)
diff --git a/meta-oe/recipes-devtools/python/python-matplotlib/fix_setupext.patch b/meta-oe/recipes-devtools/python/python-matplotlib/fix_setupext.patch
new file mode 100644
index 0000000..e071595
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-matplotlib/fix_setupext.patch
@@ -0,0 +1,29 @@
+This fixes the numpy import problem in setupext.py using a hard-coded path.
+
+diff --git a/setupext.py b/setupext.py
+index 962cedc..82297c4 100644
+--- a/setupext.py
++++ b/setupext.py
+@@ -176,10 +176,7 @@ if os.path.exists(setup_cfg):
+     except: pass
+ 
+ # For get_base_flags:
+-if options['basedirlist']:
+-    basedirlist = options['basedirlist'].split()
+-else:
+-    basedirlist = basedir[sys.platform]
++basedirlist = [os.environ['STAGING_LIBDIR']]
+ print("basedirlist is: %s" % basedirlist)
+ 
+ if options['display_status']:
+@@ -555,8 +552,8 @@ def check_for_numpy():
+ 
+ def add_numpy_flags(module):
+     "Add the modules flags to build extensions which use numpy"
+-    import numpy
+-    module.include_dirs.append(numpy.get_include())
++    # Hard-coded path for OE since I know this is where numpy's include dir will be
++    module.include_dirs.append(os.path.join(os.environ['STAGING_LIBDIR'], 'python2.7/site-packages/numpy/core/include/'))
+ 
+ def add_png_flags(module):
+     try_pkgconfig(module, 'libpng', 'png')
diff --git a/meta-oe/recipes-devtools/python/python-matplotlib_1.1.0.bb b/meta-oe/recipes-devtools/python/python-matplotlib_1.1.0.bb
new file mode 100644
index 0000000..788ba2f
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-matplotlib_1.1.0.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "matplotlib is a python 2D plotting library which produces publication quality figures in a variety of hardcopy formats"
+SECTION = "devel/python"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://README.txt;md5=83c5bf8b16a5f99507f2f47a21ae3b81"
+PR = "r1"
+
+DEPENDS += "python-numpy freetype libpng"
+RDEPENDS_${PN} = "python-core python-distutils python-numpy freetype libpng"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/matplotlib/matplotlib-${PV}.tar.gz \
+           file://fix_setup.patch \
+           file://fix_setupext.patch \
+	  "
+
+S = "${WORKDIR}/matplotlib-${PV}"
+
+EXTRA_OECONF = "--disable-docs --with-python-includes=${STAGING_INCDIR}/../"
+
+inherit distutils
+
+do_compile_prepend() {
+         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+         ${STAGING_BINDIR_NATIVE}/python setup.py build ${DISTUTILS_BUILD_ARGS} || \
+         true
+}
+
+# need to export these variables for python-config to work
+export PYTHONPATH
+export BUILD_SYS
+export HOST_SYS
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+
+SRC_URI[md5sum] = "57a627f30b3b27821f808659889514c2"
+SRC_URI[sha256sum] = "be37e1d86c65ecacae6683f8805e051e9904e5f2e02bf2b7a34262c46a6d06a7"
-- 
1.7.9.5



