Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF891C5DF77
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:28 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24499.1786747578737338341
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rlYLGnE7;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1997439a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747578; x=1787352378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=go1v7gYQg6aBb+BveOYyJxP5lVB5MBDJRNDhHEfRjLE=;
        b=rlYLGnE7pDTbI6og55y/GtBRFUWsEBCiUmnX5mPsXkVALNphPzFAOB+rBftPf2vu8r
         rOMV/t8bElg6b7t51DdE4864xIYm4fPe5mUwRqFsU1zryjqyqfSs+L+4CHNLf6/u1X2F
         plcwbb/NdHvAwyW1KdHD7JfZl6FgsBuDEP2NB+UcIe8IRRMUcTGXVqsL1SZrumCKokgm
         AFQfbv61pUxCrytX65sY6QNqDSFT9pdJkCzkZ/LRG3S1h8oa1kkYpLUWZkeJtY7y5P2/
         y4w+qCJ+qtjwEpa14QZZNLx4QKauqhOs0bQ9QvpET7YqTeHnPHzAdOH3LRHzunyViZIV
         zb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747578; x=1787352378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=go1v7gYQg6aBb+BveOYyJxP5lVB5MBDJRNDhHEfRjLE=;
        b=SBzAv2DbKrOMaMgBQvkBGo3dkW5mAYQSdmSncwOOXB+PufBgQMjgziKFWCVE1lGx2X
         TN5WKW2SHyz6v1LzKf2QJLPB86LsmPtZyeAyOpUhA7ZBWV61tfOk0yGwKFs4pzLYHeQ3
         258EGAPF4wrBk1THO/dA45Zhi0lShBU0GoBOSV3c81V5W4cuvxaNLEzDoN6LzrLTikwv
         aomhvuaDWuDbieSZqqoHldHgG/jUXQw/c/s67SZ+v8uO4sWRG8cP4AudCMV9nUxAuG9I
         Dbt0iKGgebs+ES7JTKwBYDm4L2bdbWNHdYwIFysrW9ZYo2tj68IYi4jPeD3sUoaESu2H
         PQgQ==
X-Gm-Message-State: AOJu0Yx3u4McAbEx3lwFPfByKoCx+jUnW/u4uSrIhQJZ8G6AFiGXnIQn
	MPlIkgteJaBk6AL3+jU3E8chyEZ8kabT5+GiUWNoXTtKqJqFDWrxr1SPPUyYsg==
X-Gm-Gg: AR+sD11cop/ZGQhmCaAls6Ihqu0iNV8CpJOT//kVxfnNOVCoxPVfxet5xowJSg5T6pM
	FlrVNyDp4yo0jnJh5w0VA78rnwghC/6kZ5R597u2WPYvkfQMhVdgM2n+28b/uKBcfiBTcgJH3aI
	9CyKe06es8ilXTkb2v3g5ULeltQNN5F+AKrq8/NyEDIUnu6PIqGKc8PQjINFb1zIaP3FNNwEl8s
	ZPxOYcCwRg98ArflMth2vv6kE328F1q097o/2CCa4IljPpgQir23a0YCx44wq4K0v9Sb4qMn7hA
	eJ/ReRWrLH80GaHKFh5p2gjM+lOoss/5perfYuN7WnkYubuWsFQOvYFiukzjDIkfbyp49IvU6ri
	26QUDF0s3WUlGZBi9ll/3qa1Yf7JR+f7bNK6m6F0ukGh5rPOUo2ki25KkpucIp2uAIB5cy0rebL
	23kySeahQnrGtx/uWA4Ed9aCWHFqh+nmw/G7He7njQo6tGttQgwwXdaQY7XhP7yxtnVJ0NiwqIw
	T1t9JINM08bXvgTwmMYRQYNqODvJyTrwzGMqU8mzScEheuT1GIl7KikA35A7lYmJzoU7PVUo4RX
	uEmDvUEtswaKcEkv0XaOy0aunITNBA4MI5nNqkMPerCiPfRkqlXSEo6Vl4AdZ0Vg6gknYaddu27
	ZbAXWoV9/Vq71JhxMWUOsODU346bekTEBGgQ8XZyx3asvdw==
X-Received: by 2002:a17:90b:1806:b0:381:26f:8f05 with SMTP id 98e67ed59e1d1-3933bd0f310mr10176437a91.3.1786747577948;
        Fri, 14 Aug 2026 15:46:17 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 032/109] libgnt: upgrade 2.14.1 -> 2.14.3
Date: Fri, 14 Aug 2026 15:44:18 -0700
Message-ID: <20260814224539.1523174-32-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129096

Point release with bug fixes and minor improvements.

Recipe-side changes: patches / files moved to the new version directory.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...son-import-changes-from-3.0.-version.patch | 215 ------------------
 ...e-pkg-config-to-find-ncursesw-panelw.patch | 111 +++++++++
 .../{libgnt_2.14.1.bb => libgnt_2.14.3.bb}    |   6 +-
 3 files changed, 114 insertions(+), 218 deletions(-)
 delete mode 100644 meta-oe/recipes-support/pidgin/libgnt/0001-meson-import-changes-from-3.0.-version.patch
 create mode 100644 meta-oe/recipes-support/pidgin/libgnt/0001-meson-use-pkg-config-to-find-ncursesw-panelw.patch
 rename meta-oe/recipes-support/pidgin/{libgnt_2.14.1.bb => libgnt_2.14.3.bb} (74%)

diff --git a/meta-oe/recipes-support/pidgin/libgnt/0001-meson-import-changes-from-3.0.-version.patch b/meta-oe/recipes-support/pidgin/libgnt/0001-meson-import-changes-from-3.0.-version.patch
deleted file mode 100644
index 8bb60b5557..0000000000
--- a/meta-oe/recipes-support/pidgin/libgnt/0001-meson-import-changes-from-3.0.-version.patch
+++ /dev/null
@@ -1,215 +0,0 @@
-From 51d66c1c257f7487497f562033ac32ac75f648cb Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Mon, 8 Feb 2021 12:27:51 +0100
-Subject: [PATCH] meson: import changes from 3.0.* version
-
-* we need to use the meson option to disable introspection and docs
-
-Upstream-Status: Backport
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- meson.build       | 139 ++++++++++++++++++++++++++++------------------
- meson_options.txt |   5 ++
- 2 files changed, 90 insertions(+), 54 deletions(-)
- create mode 100644 meson_options.txt
-
-diff --git a/meson.build b/meson.build
-index 1084c82..ed040b4 100644
---- a/meson.build
-+++ b/meson.build
-@@ -53,9 +53,9 @@ compiler = meson.get_compiler('c')
- pkgconfig = import('pkgconfig')
- 
- # #######################################################################
--# # Check for GLib 2.16
-+# # Check for GLib 2.44
- # #######################################################################
--glib = dependency('glib-2.0', version : '>= 2.16.0')
-+glib = dependency('glib-2.0', version : '>= 2.44.0')
- gobject = dependency('gobject-2.0')
- gmodule = dependency('gmodule-2.0')
- gnome = import('gnome')
-@@ -63,74 +63,88 @@ gnome = import('gnome')
- #######################################################################
- # Check for LibXML2
- #######################################################################
--libxml = dependency('libxml-2.0', version : '>= 2.6.0', required : false)
--gnt_config.set('NO_LIBXML', not libxml.found())
-+libxml = dependency('libxml-2.0', version : '>= 2.6.0')
- 
- #######################################################################
- # Check for ncurses and other things used by it
- #######################################################################
- ncurses_available = true
--ncurses_inc = []
--# The order of this list is important to the condition that follows.
--ncurses_libs = [
--	compiler.find_library('ncursesw', required : false),
--	compiler.find_library('panelw', required : false),
--	compiler.find_library('tinfow', required : false),
--]
--if not ncurses_libs[0].found() or not ncurses_libs[1].found()
--	ncurses_available = false
--endif
-+ncurses_widechar = true
-+ncurses_header = 'ncurses.h'
-+# Some distros put the headers in ncursesw/, some don't. These are ordered to
-+# pick the last available as most-specific version.
-+ncursesw_header_paths = ['', 'ncursesw/']
- 
--if host_machine.system() == 'windows'
--	# FIXME: $host ?
--	ncurses_sys_prefix = '/usr/$host/sys-root/mingw'
-+ncurses = [
-+	dependency('ncursesw', required : false),
-+	dependency('panelw', required : false),
-+]
-+if ncurses[0].found() and ncurses[1].found()
-+	foreach location : ncursesw_header_paths
-+		f = location + 'ncurses.h'
-+		if compiler.has_header_symbol(f, 'get_wch',
-+		    prefix : '#define _XOPEN_SOURCE_EXTENDED')
-+			ncurses_header = f
-+		endif
-+	endforeach
- else
--	ncurses_sys_prefix = '/usr'
--endif
--
--ncurses_sys_dirs = [ncurses_sys_prefix + '/include/ncursesw',
--                    ncurses_sys_prefix + '/include']
--
--if ncurses_available
--	# Some distros put the headers in ncursesw/, some don't
--	found_ncurses_h = false
--	foreach location : ncurses_sys_dirs
--		f = location + '/ncurses.h'
--		if not found_ncurses_h
-+	ncurses_available = false
-+	ncurses_inc = []
-+	ncurses_libs = [
-+		compiler.find_library('ncursesw', required : false),
-+		compiler.find_library('panelw', required : false)
-+	]
-+	if ncurses_libs[0].found() and ncurses_libs[1].found()
-+		foreach location : ncursesw_header_paths
-+			f = location + 'ncurses.h'
- 			if compiler.has_header_symbol(f, 'get_wch',
- 			    prefix : '#define _XOPEN_SOURCE_EXTENDED')
--				if location != '.'
--					ncurses_inc += [include_directories(location)]
--				endif
--				found_ncurses_h = true
-+				ncurses_available = true
-+				ncurses_header = f
- 			endif
--		endif
--	endforeach
-+		endforeach
- 
--	if not found_ncurses_h
--		ncurses_inc = []
--		ncurses_libs = []
--		ncurses_available = false
-+		if ncurses_available
-+			ncurses = declare_dependency(
-+			    include_directories : ncurses_inc,
-+			    dependencies : ncurses_libs
-+			)
-+		endif
- 	endif
--else
-+endif
-+
-+if not ncurses_available
- 	# ncursesw was not found. Look for plain old ncurses
--	# The order of this list is important to the condition that follows.
--	ncurses_libs = [
--		compiler.find_library('ncurses', required : false),
--		compiler.find_library('panel', required : false),
--		compiler.find_library('tinfo', required : false),
-+	ncurses = [
-+		dependency('ncurses', required : false),
-+		dependency('panel', required : false),
- 	]
--	ncurses_available = ncurses_libs[0].found() and ncurses_libs[1].found()
--	gnt_config.set('NO_WIDECHAR', true)
-+	if ncurses[0].found() and ncurses_libs[1].found()
-+		ncurses_available = true
-+	else
-+		ncurses_libs = [
-+			compiler.find_library('ncurses', required : false),
-+			compiler.find_library('panel', required : false),
-+		]
-+		ncurses_available = ncurses_libs[0].found() and ncurses_libs[1].found()
-+		ncurses = declare_dependency(dependencies : ncurses_libs)
-+	endif
-+	ncurses_widechar = false
- endif
-+
-+if not ncurses_available and host_machine.system() == 'windows'
-+	# Try pdcurses too.
-+	ncurses_header = 'curses.h'
-+	ncurses_libs = compiler.find_library('pdcurses', required : false)
-+	ncurses_available = compiler.has_header(ncurses_header) and ncurses_libs.found()
-+	ncurses = declare_dependency(dependencies : ncurses_libs)
-+endif
-+
- if not ncurses_available
- 	error('ncurses could not be found!')
- endif
--
--ncurses = declare_dependency(
--    include_directories : ncurses_inc,
--    dependencies : ncurses_libs
--)
-+gnt_config.set('NCURSES_HEADER', ncurses_header)
-+gnt_config.set10('NCURSES_WIDECHAR', ncurses_widechar)
- 
- libgnt_SOURCES = [
- 	'gntwidget.c',
-@@ -191,7 +205,10 @@ libgnt_headers = [
- ]
- 
- # Check for Python headers
--python_dep = dependency('python2', required : false)
-+python_dep = dependency('python3-embed', required: false)
-+if not python_dep.found()
-+	python_dep = dependency('python3', required : false)
-+endif
- gnt_config.set('USE_PYTHON', python_dep.found())
- 
- configure_file(output : 'gntconfig.h',
-@@ -233,6 +250,20 @@ pkgconfig.generate(
-     variables : ['plugindir = ${libdir}/gnt'],
-     )
- 
-+if get_option('introspection')
-+	libgnt_gir = gnome.generate_gir(libgnt,
-+	    sources : libgnt_headers + [gnt_h],
-+	    includes : 'GObject-2.0',
-+	    namespace : 'Gnt',
-+	    symbol_prefix : 'gnt',
-+	    identifier_prefix : 'Gnt',
-+	    nsversion : '@0@.@1@'.format(gnt_major_version, gnt_minor_version),
-+	    install : true,
-+	    extra_args : ['-DGNT_COMPILATION', '--quiet'])
-+endif
-+
- subdir('wms')
- subdir('test')
--subdir('doc')
-+if get_option('doc')
-+	subdir('doc')
-+endif
-diff --git a/meson_options.txt b/meson_options.txt
-new file mode 100644
-index 0000000..f2414e2
---- /dev/null
-+++ b/meson_options.txt
-@@ -0,0 +1,5 @@
-+option('doc', type : 'boolean', value : true, yield : true,
-+       description : 'build documentation with gtk-doc')
-+
-+option('introspection', type : 'boolean', value : true, yield : true,
-+       description : 'build introspection data')
diff --git a/meta-oe/recipes-support/pidgin/libgnt/0001-meson-use-pkg-config-to-find-ncursesw-panelw.patch b/meta-oe/recipes-support/pidgin/libgnt/0001-meson-use-pkg-config-to-find-ncursesw-panelw.patch
new file mode 100644
index 0000000000..9d2d2ab77c
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/libgnt/0001-meson-use-pkg-config-to-find-ncursesw-panelw.patch
@@ -0,0 +1,111 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 4 Aug 2026 00:00:00 +0000
+Subject: [PATCH] meson: use pkg-config to find ncursesw/panelw
+
+The hand-rolled ncurses detection hardcodes the absolute host paths
+/usr/include/ncursesw and /usr/include when probing for ncurses.h and adds
+the matching -I to the compile line.  When cross-compiling this leaks the
+build host's ncurses headers into the target compile:
+
+  gntwm.c:170:21: error: incomplete definition of type 'PANEL'
+
+because the host's panel.h keeps PANEL opaque while the target sysroot's
+does not.
+
+Use pkg-config (ncursesw/panelw, falling back to ncurses/panel) so meson
+takes the include directories from the target sysroot.  libgnt 3.0 solves
+this the same way upstream.
+
+Upstream-Status: Inappropriate [libgnt 2.x is a maintenance-only branch;
+addressed differently in libgnt 3.0]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build | 68 ++++++++---------------------------------------------
+ 1 file changed, 10 insertions(+), 58 deletions(-)
+
+--- a/meson.build
++++ b/meson.build
+@@ -69,68 +69,28 @@
+ #######################################################################
+ # Check for ncurses and other things used by it
+ #######################################################################
+-ncurses_available = true
+-ncurses_inc = []
+-# The order of this list is important to the condition that follows.
+-ncurses_libs = [
+-	compiler.find_library('ncursesw', required : false),
+-	compiler.find_library('panelw', required : false),
+-	compiler.find_library('tinfow', required : false),
++# Use pkg-config so that cross builds pick up the include directories from
++# the target sysroot rather than the build host's /usr/include.
++ncurses_deps = [
++	dependency('ncursesw', required : false),
++	dependency('panelw', required : false),
+ ]
+-if not ncurses_libs[0].found() or not ncurses_libs[1].found()
+-	ncurses_available = false
+-endif
+-
+-if host_machine.system() == 'windows'
+-	# FIXME: $host ?
+-	ncurses_sys_prefix = '/usr/$host/sys-root/mingw'
+-else
+-	ncurses_sys_prefix = '/usr'
+-endif
++ncurses_available = ncurses_deps[0].found() and ncurses_deps[1].found()
+ 
+-ncurses_sys_dirs = [ncurses_sys_prefix + '/include/ncursesw',
+-                    ncurses_sys_prefix + '/include']
+-
+-if ncurses_available
+-	# Some distros put the headers in ncursesw/, some don't
+-	found_ncurses_h = false
+-	foreach location : ncurses_sys_dirs
+-		f = location + '/ncurses.h'
+-		if not found_ncurses_h
+-			if compiler.has_header_symbol(f, 'get_wch',
+-			    prefix : '#define _XOPEN_SOURCE_EXTENDED')
+-				if location != '.'
+-					ncurses_inc += [include_directories(location)]
+-				endif
+-				found_ncurses_h = true
+-			endif
+-		endif
+-	endforeach
+-
+-	if not found_ncurses_h
+-		ncurses_inc = []
+-		ncurses_libs = []
+-		ncurses_available = false
+-	endif
+-else
+-	# ncursesw was not found. Look for plain old ncurses
+-	# The order of this list is important to the condition that follows.
+-	ncurses_libs = [
+-		compiler.find_library('ncurses', required : false),
+-		compiler.find_library('panel', required : false),
+-		compiler.find_library('tinfo', required : false),
++if not ncurses_available
++	# ncursesw was not found. Look for plain old ncurses.
++	ncurses_deps = [
++		dependency('ncurses', required : false),
++		dependency('panel', required : false),
+ 	]
+-	ncurses_available = ncurses_libs[0].found() and ncurses_libs[1].found()
++	ncurses_available = ncurses_deps[0].found() and ncurses_deps[1].found()
+ 	gnt_config.set('NO_WIDECHAR', true)
+ endif
+ if not ncurses_available
+ 	error('ncurses could not be found!')
+ endif
+ 
+-ncurses = declare_dependency(
+-    include_directories : ncurses_inc,
+-    dependencies : ncurses_libs
+-)
++ncurses = declare_dependency(dependencies : ncurses_deps)
+ 
+ libgnt_SOURCES = [
+ 	'gntwidget.c',
diff --git a/meta-oe/recipes-support/pidgin/libgnt_2.14.1.bb b/meta-oe/recipes-support/pidgin/libgnt_2.14.3.bb
similarity index 74%
rename from meta-oe/recipes-support/pidgin/libgnt_2.14.1.bb
rename to meta-oe/recipes-support/pidgin/libgnt_2.14.3.bb
index f2fe4a7a93..ac58a135bc 100644
--- a/meta-oe/recipes-support/pidgin/libgnt_2.14.1.bb
+++ b/meta-oe/recipes-support/pidgin/libgnt_2.14.3.bb
@@ -11,13 +11,13 @@ inherit meson pkgconfig
 # SRC_URI = "hg://keep.imfreedom.org/${BPN};module=${BPN}
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/pidgin/${BPN}/${PV}/${BP}.tar.xz \
-    file://0001-meson-import-changes-from-3.0.-version.patch \
+    file://0001-meson-use-pkg-config-to-find-ncursesw-panelw.patch \
 "
-SRC_URI[sha256sum] = "5ec3e68e18f956e9998d79088b299fa3bca689bcc95c86001bc5da17c1eb4bd8"
+SRC_URI[sha256sum] = "57f5457f72999d0bb1a139a37f2746ec1b5a02c094f2710a339d8bcea4236123"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/pidgin/files/libgnt/"
 UPSTREAM_CHECK_REGEX = "${BPN}/(?P<pver>\d+(\.\d+)+)"
 
-EXTRA_OEMESON = "-Dintrospection=false -Ddoc=false"
+EXTRA_OEMESON = "-Dpython2=false -Ddoc=false"
 
 FILES:${PN} += "${libdir}/gnt/s.so ${libdir}/gnt/irssi.so"

