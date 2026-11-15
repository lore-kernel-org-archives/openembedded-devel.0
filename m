Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3809.1794728996821974184
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cQFQxBRd;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so3167737eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728996; x=1795333796; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TtJkzy9z77uetH/9gdkwhZ5L9n1e9ePJsvtKuERiAw8=;
        b=cQFQxBRde84Qdvjj/hwgNh9UUapIVQ5bYjfQRfHxIEuEV6e28WNDP3v9HgYNVQ4jNO
         zSCLQwz2KPEytNEITc2AIdGv8MHmCYiE6McU9NdIiwrhQyF2GXsfmsDEMt6YX7gvLaPF
         uxWtO+bEEYkxAtKEY++0rjiqBqO2MrWdsMv/6u3SfyKnoabk8Edz50heH1OW293JFMAx
         W0m2BlBZc90Hn7ThveDE4+GHZB2IqdJwm54NmOL2LRGpPjGeEypBnUYdLCS0mmd8Z0v0
         sSx4LfdQu++bMS3u3lELD1YBApNyrMWFnOCXrhNr8FoL0GYKT/piJsWKQ6217E5ykuCI
         SRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728996; x=1795333796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TtJkzy9z77uetH/9gdkwhZ5L9n1e9ePJsvtKuERiAw8=;
        b=hiZo7Tpv+md86voJxZWfnGVhZWLuQ6RtXOtajPjMu0iIu3VhUWnQm7eUj40uY0nh0z
         hDBuMI7M4C7Gh0UvPueJ1pofLIRE2TTp7rCRbaGtAG7ABJUurWlYBQwbcVi/ANDt3ZTR
         4SMSNKBbuQsC4JtEbRo6fh7FHKUeHOoOd0bXNwNbUPNVZtM3IPWPdNlijiMMbywkX7ZP
         veaoor2IT8HrrDTEYvrP76JaM7pIKm8BGctnSvfW7v5BhbRIDjsEi5KatUGMUWTEnHj4
         3l5M+g4Pff3eTZYbxEwHEo/TNuJKIGDkpXMe05D0unomU7r7f4y0/peIo2FPPiYpbHSu
         pQYA==
X-Gm-Message-State: APuU4Z+CLAGAGbeNEjHbsk53OtNuBwcrlEpB4TNQrf32CDj/yH0bPWxd
	PfXBgNF1V7S5IwJneAi17GdSl0ViWfzN0ESmsB2qbQisOl3iRnLnnlPEqA2+PRwI
X-Gm-Gg: AYBFou2e6WApfZ2P27OwDLjQj8kRLIDkUjVq25x8Vfk99XIKy7qIOUZwX19OvkpPVxx
	Hv4LdOab9maQhbtsqsghJNl5cq2Cu3RGw4matqhxzVVUVpsburs7d22DyxdzRQtYT+keQ/ikl8G
	Z8ZFp5naYOkD8+9YhI0G4kqPYznZubjaoZEdnPSwm+7pV5dHANrCdZVY/8VCcZlYolgYUWTQgAh
	PaJwegq/pKbu11sUDfumvsDV7UExRREIvAGCBLgf7VTse2lgFucXloY0ejikwSNv6tKEPVR+GEA
	vCG8MeM39aa+Bj5rD+Hv5OOXKy7Sw5Xf4XR1bFLXBKIf/TH/V2Cx0vci8ZNnnBo6dWPi2y4dDV6
	TmA1gtpGOJzbUcISD3ZV0ElQAy+51tPpMRB9IJ5gBiF0M5H8L/47I9pQDd8uSm6INUMG4G32+wv
	O1fSb+BwcUyW8uqVPNqkZB6SBRED5HMFeSTWSv3qEmNfn0D26G/dGTojHzKol5zXfGXZwCZ8t9e
	dUG0bCPagKGP5JIxt7tV/q4CS+zAQd45FnneqxBRX8mB5m6WtfMQRtTgecE231gDMiRlPAFj37v
	1ZeOaztKsXL/PV+M1oCgs2SCEyZYymKRglrweUQUnKRBxAMES8/oArXncUaYiZ4khF/2RlvLRWT
	NJCv7+sUhxvPIcY1zAs5ZIB/38LcOYPxVWqzeF+lXxA3llmmL8Ye1dr57SBYCpCS7rrfwGAnhvC
	rLNGnVThHRUZbR2r7PyqONlugB0fofKH+M1iHmlPQXBbo046ORE91E19mY6FUo/PAwj8C3rXnwK
	xdXoafuU64sIacLFMkKSNq2rHn1jHWkAjcquUzxBcJk6GjP+fvKp3591FqRZtrK7zFjYj7Gupiw
	m0i7
X-Received: by 2002:a05:7301:1506:b0:36d:394d:e690 with SMTP id 5a478bee46e88-37969089a16mr6698872eec.40.1794728996102;
        Sat, 14 Nov 2026 23:49:56 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 22/96] libgnt: upgrade 2.14.3 -> 2.15.0
Date: Sat, 14 Nov 2026 23:48:00 -0800
Message-ID: <20261115074918.2932593-22-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132292
Content-Type: text/plain; charset="utf-8"

Drop 0001-meson-use-pkg-config-to-find-ncursesw-panelw.patch, upstream
now uses pkg-config for ncursesw and panelw, and the python2 meson
option, which was removed.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...e-pkg-config-to-find-ncursesw-panelw.patch | 111 ------------------
 .../{libgnt_2.14.3.bb => libgnt_2.15.0.bb}    |   5 +-
 2 files changed, 2 insertions(+), 114 deletions(-)
 delete mode 100644 meta-oe/recipes-support/pidgin/libgnt/0001-meson-use-pkg-config-to-find-ncursesw-panelw.patch
 rename meta-oe/recipes-support/pidgin/{libgnt_2.14.3.bb => libgnt_2.15.0.bb} (74%)

diff --git a/meta-oe/recipes-support/pidgin/libgnt/0001-meson-use-pkg-config-to-find-ncursesw-panelw.patch b/meta-oe/recipes-support/pidgin/libgnt/0001-meson-use-pkg-config-to-find-ncursesw-panelw.patch
deleted file mode 100644
index 9d2d2ab77c..0000000000
--- a/meta-oe/recipes-support/pidgin/libgnt/0001-meson-use-pkg-config-to-find-ncursesw-panelw.patch
+++ /dev/null
@@ -1,111 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 4 Aug 2026 00:00:00 +0000
-Subject: [PATCH] meson: use pkg-config to find ncursesw/panelw
-
-The hand-rolled ncurses detection hardcodes the absolute host paths
-/usr/include/ncursesw and /usr/include when probing for ncurses.h and adds
-the matching -I to the compile line.  When cross-compiling this leaks the
-build host's ncurses headers into the target compile:
-
-  gntwm.c:170:21: error: incomplete definition of type 'PANEL'
-
-because the host's panel.h keeps PANEL opaque while the target sysroot's
-does not.
-
-Use pkg-config (ncursesw/panelw, falling back to ncurses/panel) so meson
-takes the include directories from the target sysroot.  libgnt 3.0 solves
-this the same way upstream.
-
-Upstream-Status: Inappropriate [libgnt 2.x is a maintenance-only branch;
-addressed differently in libgnt 3.0]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- meson.build | 68 ++++++++---------------------------------------------
- 1 file changed, 10 insertions(+), 58 deletions(-)
-
---- a/meson.build
-+++ b/meson.build
-@@ -69,68 +69,28 @@
- #######################################################################
- # Check for ncurses and other things used by it
- #######################################################################
--ncurses_available = true
--ncurses_inc = []
--# The order of this list is important to the condition that follows.
--ncurses_libs = [
--	compiler.find_library('ncursesw', required : false),
--	compiler.find_library('panelw', required : false),
--	compiler.find_library('tinfow', required : false),
-+# Use pkg-config so that cross builds pick up the include directories from
-+# the target sysroot rather than the build host's /usr/include.
-+ncurses_deps = [
-+	dependency('ncursesw', required : false),
-+	dependency('panelw', required : false),
- ]
--if not ncurses_libs[0].found() or not ncurses_libs[1].found()
--	ncurses_available = false
--endif
--
--if host_machine.system() == 'windows'
--	# FIXME: $host ?
--	ncurses_sys_prefix = '/usr/$host/sys-root/mingw'
--else
--	ncurses_sys_prefix = '/usr'
--endif
-+ncurses_available = ncurses_deps[0].found() and ncurses_deps[1].found()
- 
--ncurses_sys_dirs = [ncurses_sys_prefix + '/include/ncursesw',
--                    ncurses_sys_prefix + '/include']
--
--if ncurses_available
--	# Some distros put the headers in ncursesw/, some don't
--	found_ncurses_h = false
--	foreach location : ncurses_sys_dirs
--		f = location + '/ncurses.h'
--		if not found_ncurses_h
--			if compiler.has_header_symbol(f, 'get_wch',
--			    prefix : '#define _XOPEN_SOURCE_EXTENDED')
--				if location != '.'
--					ncurses_inc += [include_directories(location)]
--				endif
--				found_ncurses_h = true
--			endif
--		endif
--	endforeach
--
--	if not found_ncurses_h
--		ncurses_inc = []
--		ncurses_libs = []
--		ncurses_available = false
--	endif
--else
--	# ncursesw was not found. Look for plain old ncurses
--	# The order of this list is important to the condition that follows.
--	ncurses_libs = [
--		compiler.find_library('ncurses', required : false),
--		compiler.find_library('panel', required : false),
--		compiler.find_library('tinfo', required : false),
-+if not ncurses_available
-+	# ncursesw was not found. Look for plain old ncurses.
-+	ncurses_deps = [
-+		dependency('ncurses', required : false),
-+		dependency('panel', required : false),
- 	]
--	ncurses_available = ncurses_libs[0].found() and ncurses_libs[1].found()
-+	ncurses_available = ncurses_deps[0].found() and ncurses_deps[1].found()
- 	gnt_config.set('NO_WIDECHAR', true)
- endif
- if not ncurses_available
- 	error('ncurses could not be found!')
- endif
- 
--ncurses = declare_dependency(
--    include_directories : ncurses_inc,
--    dependencies : ncurses_libs
--)
-+ncurses = declare_dependency(dependencies : ncurses_deps)
- 
- libgnt_SOURCES = [
- 	'gntwidget.c',
diff --git a/meta-oe/recipes-support/pidgin/libgnt_2.14.3.bb b/meta-oe/recipes-support/pidgin/libgnt_2.15.0.bb
similarity index 74%
rename from meta-oe/recipes-support/pidgin/libgnt_2.14.3.bb
rename to meta-oe/recipes-support/pidgin/libgnt_2.15.0.bb
index ac58a135bc..5f1b35f9d9 100644
--- a/meta-oe/recipes-support/pidgin/libgnt_2.14.3.bb
+++ b/meta-oe/recipes-support/pidgin/libgnt_2.15.0.bb
@@ -11,13 +11,12 @@ inherit meson pkgconfig
 # SRC_URI = "hg://keep.imfreedom.org/${BPN};module=${BPN}
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/pidgin/${BPN}/${PV}/${BP}.tar.xz \
-    file://0001-meson-use-pkg-config-to-find-ncursesw-panelw.patch \
 "
-SRC_URI[sha256sum] = "57f5457f72999d0bb1a139a37f2746ec1b5a02c094f2710a339d8bcea4236123"
+SRC_URI[sha256sum] = "6dce3d4f2fb33c242d8223ddda5f1042f3dfb0ad7c395d4e33a73f92423a58a3"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/pidgin/files/libgnt/"
 UPSTREAM_CHECK_REGEX = "${BPN}/(?P<pver>\d+(\.\d+)+)"
 
-EXTRA_OEMESON = "-Dpython2=false -Ddoc=false"
+EXTRA_OEMESON = "-Ddoc=false"
 
 FILES:${PN} += "${libdir}/gnt/s.so ${libdir}/gnt/irssi.so"
