Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.34979.1612789907221898253
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:11:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tYopgKSt;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id g6so4049762wrs.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Feb 2021 05:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qNW4fgntVYCAODLwvn/dU+FDRy9NW6v2qccjWSpyh7E=;
        b=tYopgKStm9yFvD2QPh15ZJxzaXjpyAX6YXLegHKRbf5y/zgZVpU/s+qAcUH+sc7S0b
         KtuInAK09g4IAZnF5nNXaaqVDlAfdJOSMfPKREaP6XgJJh0ZVOFFA2neTJFgj1y4f8HY
         7WjRedsvkpItVuR4IyT/wmN6wm6sioI9s7CoyF7wox7bhqrZmJXEeNF5i9jVR3sSaqVB
         c0Pycx1ncJtJPJ9r2YIFv9t/BLjKvYmgx+Dw3cyXE+35jc/g7sgeDFdCxMkXAaptLtuw
         kJl/KYs7r6a0czPrVRR7VLGBivckMzojorqxNgij5vhSZAQIObN5y0TsEveetNiLtFzz
         JQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qNW4fgntVYCAODLwvn/dU+FDRy9NW6v2qccjWSpyh7E=;
        b=UIK7aDU37UXCv/8tdi0cd/Rxsrk3DWaJe3bkK2PMGxukNc/+dLeXRhW3PHmwjNOuhZ
         5HIWtg+8259IHE+lBev90UaYJa8/PVTk2j5l2Tv3tPQdrzzykii8AxX4kcbRckoDA2kg
         b06shdgIiEyFvdRlCL07RXGv809ddk+FsH8Gizzf7n85PfQ7tPfk5J4kMcE6hrSKDXoR
         eOSzjy2hNxoiAz3DW0HYItIheGIKefE5Q5kcb3SAUToFdHOwKW2tmf9ToqySla4msgT7
         5ffcDw7U6ZY1bwxIkSHf2LRsmZ+QkF5sQ11Q3evoU2Ls/3Dpfi7e9knfhlse1AkfeZDl
         TaTQ==
X-Gm-Message-State: AOAM530DiJjBo6GjN6dayYU/gROgIQCXmJNAnQMemMb1cqX05ixlZd6C
	3eYSzjbZqhzfx2OmkB0XQ1O3pRnYZkMyVg==
X-Google-Smtp-Source: ABdhPJzBtWCib2Kv8WofpgDGR12H2u4fJONd/ZuyqjeKr32APuaR+GbxojwirW1RinMtMgM+JWZl3A==
X-Received: by 2002:a5d:58ec:: with SMTP id f12mr19485943wrd.134.1612789905479;
        Mon, 08 Feb 2021 05:11:45 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a21sm17158483wmb.5.2021.02.08.05.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:11:44 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCHv2] pidgin: upgrade to 2.14.1 and fix autoconf-2.71 compatibility
Date: Mon,  8 Feb 2021 14:11:41 +0100
Message-Id: <20210208131141.1045202-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* also log.do_configure is showing this since switch to python3:
  DEBUG: Executing shell function do_configure
  File "<string>", line 1
    import sys ; print sys.version[0:3]
                       ^
  SyntaxError: invalid syntax

  and this whole line doesn't make much sense and PY_VERSION shouldn't be used in configure.ac since:

  commit 9087a59b1c3f9708642a2327b0cf6ecceac0a66f
  Author: Martin Jansa <Martin.Jansa@gmail.com>
  Date:   Thu May 5 16:58:59 2016 +0200

    pidgin: use pkg-config instead of hardcoded paths or python-config

* use separate recipe for libgnt (needed only when consoleui PACKAGECONFIG is enabled)
  with 0.14.0 release libgnt was moved to separate repository

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...son-import-changes-from-3.0.-version.patch | 215 ++++++++++++++++
 .../recipes-support/pidgin/libgnt_2.14.1.bb   |  20 ++
 ...gure.ac-fix-build-with-autoconf-2.71.patch | 229 ++++++++++++++++++
 ...able-few-languages-not-compatible-wi.patch |  49 ++++
 .../pidgin/pidgin-cross-python-265.patch      |  42 ----
 .../pidgin/pidgin/use_py3.patch               |  20 --
 .../{pidgin_2.13.0.bb => pidgin_2.14.1.bb}    |  22 +-
 7 files changed, 521 insertions(+), 76 deletions(-)
 create mode 100644 meta-oe/recipes-support/pidgin/libgnt/0001-meson-import-changes-from-3.0.-version.patch
 create mode 100644 meta-oe/recipes-support/pidgin/libgnt_2.14.1.bb
 create mode 100644 meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac-fix-build-with-autoconf-2.71.patch
 create mode 100644 meta-oe/recipes-support/pidgin/pidgin/0002-configure.ac-disable-few-languages-not-compatible-wi.patch
 delete mode 100644 meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
 delete mode 100644 meta-oe/recipes-support/pidgin/pidgin/use_py3.patch
 rename meta-oe/recipes-support/pidgin/{pidgin_2.13.0.bb => pidgin_2.14.1.bb} (86%)

diff --git a/meta-oe/recipes-support/pidgin/libgnt/0001-meson-import-changes-from-3.0.-version.patch b/meta-oe/recipes-support/pidgin/libgnt/0001-meson-import-changes-from-3.0.-version.patch
new file mode 100644
index 0000000000..8bb60b5557
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/libgnt/0001-meson-import-changes-from-3.0.-version.patch
@@ -0,0 +1,215 @@
+From 51d66c1c257f7487497f562033ac32ac75f648cb Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Mon, 8 Feb 2021 12:27:51 +0100
+Subject: [PATCH] meson: import changes from 3.0.* version
+
+* we need to use the meson option to disable introspection and docs
+
+Upstream-Status: Backport
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ meson.build       | 139 ++++++++++++++++++++++++++++------------------
+ meson_options.txt |   5 ++
+ 2 files changed, 90 insertions(+), 54 deletions(-)
+ create mode 100644 meson_options.txt
+
+diff --git a/meson.build b/meson.build
+index 1084c82..ed040b4 100644
+--- a/meson.build
++++ b/meson.build
+@@ -53,9 +53,9 @@ compiler = meson.get_compiler('c')
+ pkgconfig = import('pkgconfig')
+ 
+ # #######################################################################
+-# # Check for GLib 2.16
++# # Check for GLib 2.44
+ # #######################################################################
+-glib = dependency('glib-2.0', version : '>= 2.16.0')
++glib = dependency('glib-2.0', version : '>= 2.44.0')
+ gobject = dependency('gobject-2.0')
+ gmodule = dependency('gmodule-2.0')
+ gnome = import('gnome')
+@@ -63,74 +63,88 @@ gnome = import('gnome')
+ #######################################################################
+ # Check for LibXML2
+ #######################################################################
+-libxml = dependency('libxml-2.0', version : '>= 2.6.0', required : false)
+-gnt_config.set('NO_LIBXML', not libxml.found())
++libxml = dependency('libxml-2.0', version : '>= 2.6.0')
+ 
+ #######################################################################
+ # Check for ncurses and other things used by it
+ #######################################################################
+ ncurses_available = true
+-ncurses_inc = []
+-# The order of this list is important to the condition that follows.
+-ncurses_libs = [
+-	compiler.find_library('ncursesw', required : false),
+-	compiler.find_library('panelw', required : false),
+-	compiler.find_library('tinfow', required : false),
+-]
+-if not ncurses_libs[0].found() or not ncurses_libs[1].found()
+-	ncurses_available = false
+-endif
++ncurses_widechar = true
++ncurses_header = 'ncurses.h'
++# Some distros put the headers in ncursesw/, some don't. These are ordered to
++# pick the last available as most-specific version.
++ncursesw_header_paths = ['', 'ncursesw/']
+ 
+-if host_machine.system() == 'windows'
+-	# FIXME: $host ?
+-	ncurses_sys_prefix = '/usr/$host/sys-root/mingw'
++ncurses = [
++	dependency('ncursesw', required : false),
++	dependency('panelw', required : false),
++]
++if ncurses[0].found() and ncurses[1].found()
++	foreach location : ncursesw_header_paths
++		f = location + 'ncurses.h'
++		if compiler.has_header_symbol(f, 'get_wch',
++		    prefix : '#define _XOPEN_SOURCE_EXTENDED')
++			ncurses_header = f
++		endif
++	endforeach
+ else
+-	ncurses_sys_prefix = '/usr'
+-endif
+-
+-ncurses_sys_dirs = [ncurses_sys_prefix + '/include/ncursesw',
+-                    ncurses_sys_prefix + '/include']
+-
+-if ncurses_available
+-	# Some distros put the headers in ncursesw/, some don't
+-	found_ncurses_h = false
+-	foreach location : ncurses_sys_dirs
+-		f = location + '/ncurses.h'
+-		if not found_ncurses_h
++	ncurses_available = false
++	ncurses_inc = []
++	ncurses_libs = [
++		compiler.find_library('ncursesw', required : false),
++		compiler.find_library('panelw', required : false)
++	]
++	if ncurses_libs[0].found() and ncurses_libs[1].found()
++		foreach location : ncursesw_header_paths
++			f = location + 'ncurses.h'
+ 			if compiler.has_header_symbol(f, 'get_wch',
+ 			    prefix : '#define _XOPEN_SOURCE_EXTENDED')
+-				if location != '.'
+-					ncurses_inc += [include_directories(location)]
+-				endif
+-				found_ncurses_h = true
++				ncurses_available = true
++				ncurses_header = f
+ 			endif
+-		endif
+-	endforeach
++		endforeach
+ 
+-	if not found_ncurses_h
+-		ncurses_inc = []
+-		ncurses_libs = []
+-		ncurses_available = false
++		if ncurses_available
++			ncurses = declare_dependency(
++			    include_directories : ncurses_inc,
++			    dependencies : ncurses_libs
++			)
++		endif
+ 	endif
+-else
++endif
++
++if not ncurses_available
+ 	# ncursesw was not found. Look for plain old ncurses
+-	# The order of this list is important to the condition that follows.
+-	ncurses_libs = [
+-		compiler.find_library('ncurses', required : false),
+-		compiler.find_library('panel', required : false),
+-		compiler.find_library('tinfo', required : false),
++	ncurses = [
++		dependency('ncurses', required : false),
++		dependency('panel', required : false),
+ 	]
+-	ncurses_available = ncurses_libs[0].found() and ncurses_libs[1].found()
+-	gnt_config.set('NO_WIDECHAR', true)
++	if ncurses[0].found() and ncurses_libs[1].found()
++		ncurses_available = true
++	else
++		ncurses_libs = [
++			compiler.find_library('ncurses', required : false),
++			compiler.find_library('panel', required : false),
++		]
++		ncurses_available = ncurses_libs[0].found() and ncurses_libs[1].found()
++		ncurses = declare_dependency(dependencies : ncurses_libs)
++	endif
++	ncurses_widechar = false
+ endif
++
++if not ncurses_available and host_machine.system() == 'windows'
++	# Try pdcurses too.
++	ncurses_header = 'curses.h'
++	ncurses_libs = compiler.find_library('pdcurses', required : false)
++	ncurses_available = compiler.has_header(ncurses_header) and ncurses_libs.found()
++	ncurses = declare_dependency(dependencies : ncurses_libs)
++endif
++
+ if not ncurses_available
+ 	error('ncurses could not be found!')
+ endif
+-
+-ncurses = declare_dependency(
+-    include_directories : ncurses_inc,
+-    dependencies : ncurses_libs
+-)
++gnt_config.set('NCURSES_HEADER', ncurses_header)
++gnt_config.set10('NCURSES_WIDECHAR', ncurses_widechar)
+ 
+ libgnt_SOURCES = [
+ 	'gntwidget.c',
+@@ -191,7 +205,10 @@ libgnt_headers = [
+ ]
+ 
+ # Check for Python headers
+-python_dep = dependency('python2', required : false)
++python_dep = dependency('python3-embed', required: false)
++if not python_dep.found()
++	python_dep = dependency('python3', required : false)
++endif
+ gnt_config.set('USE_PYTHON', python_dep.found())
+ 
+ configure_file(output : 'gntconfig.h',
+@@ -233,6 +250,20 @@ pkgconfig.generate(
+     variables : ['plugindir = ${libdir}/gnt'],
+     )
+ 
++if get_option('introspection')
++	libgnt_gir = gnome.generate_gir(libgnt,
++	    sources : libgnt_headers + [gnt_h],
++	    includes : 'GObject-2.0',
++	    namespace : 'Gnt',
++	    symbol_prefix : 'gnt',
++	    identifier_prefix : 'Gnt',
++	    nsversion : '@0@.@1@'.format(gnt_major_version, gnt_minor_version),
++	    install : true,
++	    extra_args : ['-DGNT_COMPILATION', '--quiet'])
++endif
++
+ subdir('wms')
+ subdir('test')
+-subdir('doc')
++if get_option('doc')
++	subdir('doc')
++endif
+diff --git a/meson_options.txt b/meson_options.txt
+new file mode 100644
+index 0000000..f2414e2
+--- /dev/null
++++ b/meson_options.txt
+@@ -0,0 +1,5 @@
++option('doc', type : 'boolean', value : true, yield : true,
++       description : 'build documentation with gtk-doc')
++
++option('introspection', type : 'boolean', value : true, yield : true,
++       description : 'build introspection data')
diff --git a/meta-oe/recipes-support/pidgin/libgnt_2.14.1.bb b/meta-oe/recipes-support/pidgin/libgnt_2.14.1.bb
new file mode 100644
index 0000000000..67d8cc87ce
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/libgnt_2.14.1.bb
@@ -0,0 +1,20 @@
+SUMMARY = "GNT: The GLib Ncurses Toolkit"
+
+SECTION = "libs"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c9a1abacd0166f595a9fbe6afb1f0d5e"
+DEPENDS = "glib-2.0 ncurses libxml2 glib-2.0-native"
+
+inherit meson
+
+# SRCREV = "0a44b1d01c41"
+# SRC_URI = "hg://keep.imfreedom.org/${BPN};module=${BPN}
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/pidgin/${BPN}/${PV}/${BP}.tar.xz \
+    file://0001-meson-import-changes-from-3.0.-version.patch \
+"
+SRC_URI[sha256sum] = "5ec3e68e18f956e9998d79088b299fa3bca689bcc95c86001bc5da17c1eb4bd8"
+
+EXTRA_OEMESON = "-Dintrospection=false -Ddoc=false"
+
+FILES_${PN} += "${libdir}/gnt/s.so ${libdir}/gnt/irssi.so"
diff --git a/meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac-fix-build-with-autoconf-2.71.patch b/meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac-fix-build-with-autoconf-2.71.patch
new file mode 100644
index 0000000000..cfb0290f9b
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac-fix-build-with-autoconf-2.71.patch
@@ -0,0 +1,229 @@
+From e03d3ef5aadd582ebf7102b7d5785fed177a0cb1 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sun, 7 Feb 2021 13:25:29 +0100
+Subject: [PATCH] configure.ac: fix build with autoconf-2.71
+
+* fixes:
+  | autoreconf: running: intltoolize --copy --force
+  | ERROR: 'IT_PROG_INTLTOOL' must appear in configure.ac for intltool to work.
+  | autoreconf: error: intltoolize failed with exit status: 1
+
+* replace AM_GLIB_GNU_GETTEXT with AM_GNU_GETTEXT as suggested in:
+  https://wiki.gnome.org/Initiatives/GnomeGoals/GettextMigration
+  https://blogs.gnome.org/jjardon/2010/10/08/use-upstream-gettext-instead-the-glib-one/
+  because the former is causing issues with autoconf-2.71:
+
+  -m4trace:configure.ac:266: -1- _m4_warn([obsolete], [The macro `AC_TRY_LINK' is obsolete.
+  -You should run autoupdate.], [../autoconf-2.71/lib/autoconf/general.m4:2920: AC_TRY_LINK is expanded from...
+  -../autoconf-2.71/lib/m4sugar/m4sh.m4:699: AS_IF is expanded from...
+  -../autoconf-2.71/lib/autoconf/headers.m4:89: _AC_CHECK_HEADER_COMPILE is expanded from...
+  -../autoconf-2.71/lib/autoconf/headers.m4:56: AC_CHECK_HEADER is expanded from...
+  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m4:150: GLIB_WITH_NLS is expanded from...
+  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m4:370: GLIB_GNU_GETTEXT is expanded from...
+  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m4:470: AM_GLIB_GNU_GETTEXT is expanded from...
+  -configure.ac:266: the top level])
+  -m4trace:configure.ac:266: -1- m4_pattern_allow([^ENABLE_NLS$])
+  -m4trace:configure.ac:266: -1- _m4_warn([obsolete], [The macro `AC_OUTPUT_COMMANDS' is obsolete.
+  -You should run autoupdate.], [../autoconf-2.71/lib/autoconf/status.m4:1025: AC_OUTPUT_COMMANDS is expanded from...
+  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m4:150: GLIB_WITH_NLS is expanded from...
+  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m4:370: GLIB_GNU_GETTEXT is expanded from...
+  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m4:470: AM_GLIB_GNU_GETTEXT is expanded from...
+  -configure.ac:266: the top level])
+
+  and then configure fails with:
+
+  configure.ac:2621: error: `po/stamp-it' is already registered with AC_CONFIG_COMMANDS.
+  autoconf-2.71/lib/autoconf/status.m4:1008: AC_CONFIG_COMMANDS is expanded from...
+  configure.ac:2621: the top level
+
+* add AM_GNU_GETTEXT_VERSION as well to resolve warning with autoconf-2.71
+  configure.ac: warning: AM_GNU_GETTEXT is used, but not AM_GNU_GETTEXT_VERSION or AM_GNU_GETTEXT_REQUIRE_VERSION
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ ABOUT-NLS          |  1 +
+ Makefile.am        |  6 +---
+ configure.ac       |  6 ++--
+ pidgin/Makefile.am |  7 ++--
+ po/Makevars        | 82 ++++++++++++++++++++++++++++++++++++++++++++++
+ po/POTFILES.in     |  1 -
+ 6 files changed, 92 insertions(+), 11 deletions(-)
+ create mode 100644 ABOUT-NLS
+ create mode 100644 po/Makevars
+
+diff --git a/ABOUT-NLS b/ABOUT-NLS
+new file mode 100644
+index 0000000..0a9d56d
+--- /dev/null
++++ b/ABOUT-NLS
+@@ -0,0 +1 @@
++<https://www.gnu.org/software/gettext/manual/html_node/Users.html>
+diff --git a/Makefile.am b/Makefile.am
+index f8e2bc9..a74145f 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -13,9 +13,6 @@ EXTRA_DIST = \
+ 		fix-casts.sh \
+ 		gaim.pc.in \
+ 		gaim-uninstalled.pc.in \
+-		intltool-extract.in \
+-		intltool-merge.in \
+-		intltool-update.in \
+ 		package_revision.h \
+ 		pidgin.apspec.in \
+ 		pidgin.spec.in \
+@@ -139,5 +136,4 @@ endif
+ distuninstallcheck_listfiles = \
+ 	find . -type f -print | grep -v perl | grep -v Purple.3pm | grep -v Pidgin.3pm
+ 
+-DISTCLEANFILES= intltool-extract intltool-merge intltool-update \
+-			package_revision_raw.txt
++DISTCLEANFILES=package_revision_raw.txt
+diff --git a/configure.ac b/configure.ac
+index 81d8592..e2280cd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -43,7 +43,7 @@ fi
+ 
+ AC_CANONICAL_HOST
+ AC_CONFIG_HEADERS([config.h])
+-AM_INIT_AUTOMAKE([1.9 -Wno-portability dist-bzip2])
++AM_INIT_AUTOMAKE([1.9 -Wno-portability dist-bzip2 foreign])
+ dnl TODO: Always use AM_SILENT_RULES when we depend on automake >= 1.11
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ 
+@@ -257,12 +257,12 @@ dnl #######################################################################
+ AC_ARG_ENABLE(nls, AC_HELP_STRING([--disable-nls], [disable installation of translation files]), enable_i18n="$enableval", enable_i18n=yes)
+ 
+ if test x$enable_i18n = xyes; then
+-	AC_PROG_INTLTOOL
+ 	GETTEXT_PACKAGE=pidgin
+ 	AC_SUBST(GETTEXT_PACKAGE)
+ 
+ 	ALL_LINGUAS="af am ar ar_SA as ast az be@latin bg bn_IN bn br brx bs ca ca@valencia cs da de dz el en_AU en_CA en_GB eo es_AR es et eu fa fi fr ga gl gu he hi hr hu id it ja ka kk km kn ko ks ku_IQ ku lt lv mai mhr mk ml mn mr ms_MY my_MM nb ne nl nn oc or pa pl ps pt_BR pt ro ru sd si sk sl sq sr@latin sr sv sw ta te th tr tt uk ur uz vi xh zh_CN zh_HK zh_TW"
+-	AM_GLIB_GNU_GETTEXT
++	AM_GNU_GETTEXT([external])
++	AM_GNU_GETTEXT_VERSION([0.21])
+ 
+ 	dnl If we don't have msgfmt, then po/ is going to fail -- ensure that
+ 	dnl AM_GLIB_GNU_GETTEXT found it.
+diff --git a/pidgin/Makefile.am b/pidgin/Makefile.am
+index 2278b88..4d32c53 100644
+--- a/pidgin/Makefile.am
++++ b/pidgin/Makefile.am
+@@ -192,13 +192,16 @@ DESKTOP_FILE=data/pidgin.desktop
+ appsdir = $(datadir)/applications
+ apps_in_files = data/pidgin.desktop.in
+ apps_DATA = $(apps_in_files:.desktop.in=.desktop)
+-@INTLTOOL_DESKTOP_RULE@
++
++data/pidgin.desktop: data/pidgin.desktop.in
++	$(AM_V_GEN)$(MSGFMT) --desktop --template $< -d $(top_srcdir)/po -o $@
+ 
+ appdatadir = $(datarootdir)/appdata
+ appdata_DATA = $(appdata_in_files:.xml.in=.xml)
+ appdata_in_files = data/pidgin.appdata.xml.in
+ 
+-@INTLTOOL_XML_RULE@
++data/pidgin.appdata.xml: data/pidgin.appdata.xml.in
++	$(AM_V_GEN)$(MSGFMT) --xml --template $< -d $(top_srcdir)/po -o $@ || cp $< $@
+ 
+ endif # INSTALL_I18N
+ 
+diff --git a/po/Makevars b/po/Makevars
+new file mode 100644
+index 0000000..970237a
+--- /dev/null
++++ b/po/Makevars
+@@ -0,0 +1,82 @@
++# Makefile variables for PO directory in any package using GNU gettext.
++#
++# Copyright (C) 2003-2019 Free Software Foundation, Inc.
++# This file is free software; the Free Software Foundation gives
++# unlimited permission to use, copy, distribute, and modify it.
++
++# Usually the message domain is the same as the package name.
++DOMAIN = $(PACKAGE)
++
++# These two variables depend on the location of this directory.
++subdir = po
++top_builddir = ..
++
++# These options get passed to xgettext.
++XGETTEXT_OPTIONS = --keyword=_ --keyword=N_ --from-code=UTF-8
++
++# This is the copyright holder that gets inserted into the header of the
++# $(DOMAIN).pot file.  Set this to the copyright holder of the surrounding
++# package.  (Note that the msgstr strings, extracted from the package's
++# sources, belong to the copyright holder of the package.)  Translators are
++# expected to transfer the copyright for their translations to this person
++# or entity, or to disclaim their copyright.  The empty string stands for
++# the public domain; in this case the translators are expected to disclaim
++# their copyright.
++COPYRIGHT_HOLDER = Free Software Foundation, Inc.
++
++# This tells whether or not to prepend "GNU " prefix to the package
++# name that gets inserted into the header of the $(DOMAIN).pot file.
++# Possible values are "yes", "no", or empty.  If it is empty, try to
++# detect it automatically by scanning the files in $(top_srcdir) for
++# "GNU packagename" string.
++PACKAGE_GNU =
++
++# This is the email address or URL to which the translators shall report
++# bugs in the untranslated strings:
++# - Strings which are not entire sentences, see the maintainer guidelines
++#   in the GNU gettext documentation, section 'Preparing Strings'.
++# - Strings which use unclear terms or require additional context to be
++#   understood.
++# - Strings which make invalid assumptions about notation of date, time or
++#   money.
++# - Pluralisation problems.
++# - Incorrect English spelling.
++# - Incorrect formatting.
++# It can be your email address, or a mailing list address where translators
++# can write to without being subscribed, or the URL of a web page through
++# which the translators can contact you.
++MSGID_BUGS_ADDRESS =
++
++# This is the list of locale categories, beyond LC_MESSAGES, for which the
++# message catalogs shall be used.  It is usually empty.
++EXTRA_LOCALE_CATEGORIES =
++
++# This tells whether the $(DOMAIN).pot file contains messages with an 'msgctxt'
++# context.  Possible values are "yes" and "no".  Set this to yes if the
++# package uses functions taking also a message context, like pgettext(), or
++# if in $(XGETTEXT_OPTIONS) you define keywords with a context argument.
++USE_MSGCTXT = no
++
++# These options get passed to msgmerge.
++# Useful options are in particular:
++#   --previous            to keep previous msgids of translated messages,
++#   --quiet               to reduce the verbosity.
++MSGMERGE_OPTIONS =
++
++# These options get passed to msginit.
++# If you want to disable line wrapping when writing PO files, add
++# --no-wrap to MSGMERGE_OPTIONS, XGETTEXT_OPTIONS, and
++# MSGINIT_OPTIONS.
++MSGINIT_OPTIONS =
++
++# This tells whether or not to regenerate a PO file when $(DOMAIN).pot
++# has changed.  Possible values are "yes" and "no".  Set this to no if
++# the POT file is checked in the repository and the version control
++# program ignores timestamps.
++PO_DEPENDS_ON_POT = no
++
++# This tells whether or not to forcibly update $(DOMAIN).pot and
++# regenerate PO files on "make dist".  Possible values are "yes" and
++# "no".  Set this to no if the POT file and PO files are maintained
++# externally.
++DIST_DEPENDS_ON_UPDATE_PO = no
+diff --git a/po/POTFILES.in b/po/POTFILES.in
+index a5691a1..b494bf3 100644
+--- a/po/POTFILES.in
++++ b/po/POTFILES.in
+@@ -1,4 +1,3 @@
+-[encoding: UTF-8]
+ finch/finch.c
+ finch/gntaccount.c
+ finch/gntblist.c
diff --git a/meta-oe/recipes-support/pidgin/pidgin/0002-configure.ac-disable-few-languages-not-compatible-wi.patch b/meta-oe/recipes-support/pidgin/pidgin/0002-configure.ac-disable-few-languages-not-compatible-wi.patch
new file mode 100644
index 0000000000..99c523d5d9
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/pidgin/0002-configure.ac-disable-few-languages-not-compatible-wi.patch
@@ -0,0 +1,49 @@
+From 861c8a63c36f9ee7d46238c9bc13a2c1f14372c3 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sun, 7 Feb 2021 14:35:14 +0000
+Subject: [PATCH] configure.ac: disable few languages not compatible with
+ modern gettext
+
+* as pidgin-3 development is moving to meson and probably
+  most of these changes won't be applicable there, lets just
+  disable them until someone interested steps-up to maintain it
+
+* these 3 fail with:
+cd ../../pidgin-2.14.1/po && rm -f brx.gmo && pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o brx.1po brx.po pidgin.pot && pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o brx.gmo brx.1po && rm -f brx.1po
+cd ../../pidgin-2.14.1/po && rm -f zh_HK.gmo && pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o zh_HK.1po zh_HK.po pidgin.pot && pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o zh_HK.gmo zh_HK.1po && rm -f zh_HK.1po
+cd ../../pidgin-2.14.1/po && rm -f zh_TW.gmo && pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o zh_TW.1po zh_TW.po pidgin.pot && pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o zh_TW.gmo zh_TW.1po && rm -f zh_TW.1po
+zh_HK.1po:2790: 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: The string refers to arguments both through absolute argument numbers and through unnumbered argument specifications.
+pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt: found 1 fatal error
+zh_TW.1po:2790: 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: The string refers to arguments both through absolute argument numbers and through unnumbered argument specifications.
+pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt: found 1 fatal error
+zh_HK.1po: 3234 translated messages.
+make[3]: *** [Makefile:415: ../../pidgin-2.14.1/po/zh_HK.gmo] Error 1
+make[3]: *** Waiting for unfinished jobs....
+zh_TW.1po: 3234 translated messages.
+make[3]: *** [Makefile:415: ../../pidgin-2.14.1/po/zh_TW.gmo] Error 1
+brx.1po:778: number of format specifications in 'msgid' and 'msgstr' does not match
+brx.1po:3179: number of format specifications in 'msgid' and 'msgstr' does not match
+brx.1po:5175: format specifications in 'msgid_plural' and 'msgstr[0]' for argument 1 are not the same
+brx.1po:5184: format specifications in 'msgid_plural' and 'msgstr[0]' for argument 1 are not the same
+brx.1po:7754: format specifications in 'msgid_plural' and 'msgstr[0]' for argument 1 are not the same
+pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt: found 8 fatal errors
+brx.1po: 3246 translated messages.
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index e2280cd..9332932 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -260,7 +260,7 @@ if test x$enable_i18n = xyes; then
+ 	GETTEXT_PACKAGE=pidgin
+ 	AC_SUBST(GETTEXT_PACKAGE)
+ 
+-	ALL_LINGUAS="af am ar ar_SA as ast az be@latin bg bn_IN bn br brx bs ca ca@valencia cs da de dz el en_AU en_CA en_GB eo es_AR es et eu fa fi fr ga gl gu he hi hr hu id it ja ka kk km kn ko ks ku_IQ ku lt lv mai mhr mk ml mn mr ms_MY my_MM nb ne nl nn oc or pa pl ps pt_BR pt ro ru sd si sk sl sq sr@latin sr sv sw ta te th tr tt uk ur uz vi xh zh_CN zh_HK zh_TW"
++	ALL_LINGUAS="af am ar ar_SA as ast az be@latin bg bn_IN bn br bs ca ca@valencia cs da de dz el en_AU en_CA en_GB eo es_AR es et eu fa fi fr ga gl gu he hi hr hu id it ja ka kk km kn ko ks ku_IQ ku lt lv mai mhr mk ml mn mr ms_MY my_MM nb ne nl nn oc or pa pl ps pt_BR pt ro ru sd si sk sl sq sr@latin sr sv sw ta te th tr tt uk ur uz vi xh zh_CN"
+ 	AM_GNU_GETTEXT([external])
+ 	AM_GNU_GETTEXT_VERSION([0.21])
+ 
diff --git a/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch b/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
deleted file mode 100644
index 312fc8593f..0000000000
--- a/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 855cc20bafa30597ae7a62f7672d42654b25cde0 Mon Sep 17 00:00:00 2001
-From: Herrie <github.com@herrie.org>
-Date: Mon, 24 Jul 2017 21:30:16 +0200
-Subject: [PATCH] Use pkg-config instead of ${PYTHON}-config to find python
-
----
- configure.ac | 21 ++++++++-------------
- 1 file changed, 8 insertions(+), 13 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d20a18e..c741829 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1567,20 +1567,15 @@ AM_CONDITIONAL(ENABLE_DBUS, test "x$enable_dbus" = "xyes")
- dnl Check for Python headers (currently useful only for libgnt)
- dnl (Thanks to XChat)
- if test "x$enable_consoleui" = "xyes" -a ! -z "$PYTHON" -a x"$PYTHON" != x"no" ; then
--	AC_MSG_CHECKING(for Python compile flags)
--	if test -f ${PYTHON}-config; then
--		PY_CFLAGS=`${PYTHON}-config --includes`
--		PY_LIBS=`${PYTHON}-config --libs`
--		AC_DEFINE(USE_PYTHON, [1], [Define if python headers are available.])
--		AC_MSG_RESULT(ok)
--	else
--		AC_MSG_RESULT([Cannot find ${PYTHON}-config])
--		PY_CFLAGS=""
--		PY_LIBS=""
--	fi
-+        AC_MSG_CHECKING(for Python compile flags)
-+        PKG_CHECK_MODULES(PY, python, [
-+                AC_SUBST(PY_CFLAGS)
-+                AC_SUBST(PY_LIBS)
-+        ], [
-+                AC_MSG_RESULT(no)
-+                AC_MSG_ERROR([Can't find python])
-+        ])
- fi
--AC_SUBST(PY_CFLAGS)
--AC_SUBST(PY_LIBS)
- 
- dnl #######################################################################
- dnl # Check for Mono support
diff --git a/meta-oe/recipes-support/pidgin/pidgin/use_py3.patch b/meta-oe/recipes-support/pidgin/pidgin/use_py3.patch
deleted file mode 100644
index c7b4163cb5..0000000000
--- a/meta-oe/recipes-support/pidgin/pidgin/use_py3.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- a/configure.ac
-+++ b/configure.ac
-@@ -1488,7 +1488,7 @@ AC_ARG_WITH([python],
- 
- if test "x$enable_dbus" = "xyes" || test "x$enable_consoleui" = "xyes" ; then
- 	if test -z "$PYTHON" -o "x$PYTHON" = "xyes"; then
--		AC_PATH_PROG([PYTHON], [python], [no])
-+		AC_PATH_PROG([PYTHON], [python3], [no])
- 	fi
- 
- 	if test x"$PYTHON" = x"no" ; then
-@@ -1568,7 +1568,7 @@ dnl Check for Python headers (currently
- dnl (Thanks to XChat)
- if test "x$enable_consoleui" = "xyes" -a ! -z "$PYTHON" -a x"$PYTHON" != x"no" ; then
-         AC_MSG_CHECKING(for Python compile flags)
--        PKG_CHECK_MODULES(PY, python, [
-+        PKG_CHECK_MODULES(PY, python3, [
-                 AC_SUBST(PY_CFLAGS)
-                 AC_SUBST(PY_LIBS)
-         ], [
diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb b/meta-oe/recipes-support/pidgin/pidgin_2.14.1.bb
similarity index 86%
rename from meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb
rename to meta-oe/recipes-support/pidgin/pidgin_2.14.1.bb
index fdc79e81b2..d22380eb0d 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.14.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "multi-protocol instant messaging client"
+
 SECTION = "x11/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
@@ -10,12 +11,11 @@ SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/pidgin/pidgin-${PV}.tar.bz2 \
     file://sanitize-configure.ac.patch \
     file://purple-OE-branding-25.patch \
-    file://pidgin-cross-python-265.patch \
-    file://use_py3.patch \
+    file://0001-configure.ac-fix-build-with-autoconf-2.71.patch \
+    file://0002-configure.ac-disable-few-languages-not-compatible-wi.patch \
 "
 
-SRC_URI[md5sum] = "423403494fe1951e47cc75231f743bb0"
-SRC_URI[sha256sum] = "2747150c6f711146bddd333c496870bfd55058bab22ffb7e4eb784018ec46d8f"
+SRC_URI[sha256sum] = "f132e18d551117d9e46acce29ba4f40892a86746c366999166a3862b51060780"
 
 PACKAGECONFIG ??= "gnutls consoleui avahi dbus idn nss \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtk startup-notification', '', d)} \
@@ -34,13 +34,14 @@ PACKAGECONFIG[idn] = "--enable-idn,--disable-idn,libidn"
 PACKAGECONFIG[gtk] = "--enable-gtkui,--disable-gtkui,gtk+"
 PACKAGECONFIG[x11] = "--with-x=yes --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR},--with-x=no,virtual/libx11"
 PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
-PACKAGECONFIG[consoleui] = "--enable-consoleui --with-ncurses-headers=${STAGING_INCDIR},--disable-consoleui,ncurses"
+PACKAGECONFIG[consoleui] = "--enable-consoleui --with-ncurses-headers=${STAGING_INCDIR},--disable-consoleui,libgnt"
 PACKAGECONFIG[gnutls] = "--enable-gnutls --with-gnutls-includes=${STAGING_INCDIR} --with-gnutls-libs=${STAGING_LIBDIR},--disable-gnutls,gnutls,libpurple-plugin-ssl-gnutls"
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus dbus-glib"
 PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[nss] = "--enable-nss,--disable-nss,nss nspr,libpurple-plugin-ssl-nss"
 
 EXTRA_OECONF = " \
+    --with-python=python3 \
     --disable-perl \
     --disable-tcl \
     --disable-gevolution \
@@ -51,17 +52,12 @@ EXTRA_OECONF = " \
     --disable-screensaver \
 "
 
-do_configure_prepend() {
-    touch ${S}/po/Makefile
-    sed -i "s#PY_VERSION=`$PYTHON -c 'import sys ; print sys.version[0:3]'`#PY_VERSION=${PYTHON_BASEVERSION}#g" ${S}/configure.ac
-}
-
 OE_LT_RPATH_ALLOW=":${libdir}/purple-2:"
 OE_LT_RPATH_ALLOW[export]="1"
 
-PACKAGES =+ "libpurple-dev libpurple libgnt libgnt-dev finch finch-dev ${PN}-data"
+PACKAGES =+ "libpurple-dev libpurple finch finch-dev ${PN}-data"
 
-RPROVIDES_${PN}-dbg += "libpurple-dbg libgnt-dbg finch-dbg"
+RPROVIDES_${PN}-dbg += "libpurple-dbg finch-dbg"
 
 LEAD_SONAME = "libpurple.so.0"
 FILES_libpurple     = "${libdir}/libpurple*.so.* ${libdir}/purple-2 ${bindir}/purple-* ${sysconfdir}/gconf/schemas/purple* ${datadir}/purple/ca-certs"
@@ -72,8 +68,6 @@ FILES_libpurple-dev = "${libdir}/libpurple*.la \
                        ${libdir}/purple-2/liboscar.so \
                        ${libdir}/purple-2/libymsg.so \
                        ${datadir}/aclocal"
-FILES_libgnt         = "${libdir}/libgnt.so.* ${libdir}/gnt/*.so"
-FILES_libgnt-dev     = "${libdir}/gnt/*.la"
 FILES_finch          = "${bindir}/finch"
 FILES_finch-dev      = "${libdir}/finch/*.la"
 
-- 
2.27.0

