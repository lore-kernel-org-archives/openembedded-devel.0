Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id C103577D81
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 20:36:03 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id b9so409475wra.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 13:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=c6UnD5YOl7zr+jK20WDPU3b4mee8vGdzNMYxvenUoRc=;
	b=HXT0N/vj3Ll/MZ9DJQnBIit0xCkR1txb8Ed4lgDnMsccB07nzA+AUp9Zy84rc1e7/Y
	/f/cqVgLQKforioPTL3i8DiNrSRRhUwOpVul8Yp8Tdu6AVj4yFPuMTbys8hk3JuM8EDp
	Z1BMCHgkeQRpD4bPMcusGARpFx0Jev9IWSbgKTYQHMK3IwkXmhxEri2Td5WX2p/jF/aI
	qKF6kckfv7I/2mpNwCODUXXSy8VvggesQoZMoegxezGgH4+OPgwOhjFnrwky4CQpuNas
	kBOTMAn123UkxZKzWD0b8XcZ+5nwOBRxd5LmveNkopyO7aMPfPB1FoZ8ZHuu2vUslWGd
	J+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=c6UnD5YOl7zr+jK20WDPU3b4mee8vGdzNMYxvenUoRc=;
	b=QOAhCNWKVJhxp3kzhOqylyPXRya3dFrn+YTPDOhe73q67AivxTGWwAZKlM+grQFVmA
	7egCBTQudVpcNPCCKyvCz5aoEgItqgvFJ0ueYiwX84UMLXaEkTux9bEJc3cJZ7nbqckY
	aCUdM0jmXsd/HixKKo8mCLocvRLBJMb+uKRQDvvahnoQ5XheLgukT5b6oSV0xN5qAGXY
	3FJbXZsPAkwKl2PG2A+jKzrTyuhhHxj9XOw8IlyFuW0ljVJ/M+Y6FEBfH7qxuKEG3GIj
	nZJys8wiVyUXcSJmtY17SJxwTXc4bGMddlAx8oWp8ZLpGYJPienI7j8lbhV+ZTKfk0bj
	IxLA==
X-Gm-Message-State: AHPjjUhFUVjVjYb69aXvhx4JzGCu3+7CxlHeN+bw4b0GynC3ZVwt8+S9
	VbEbLM65LFp6Nly767e2q1/XHQ==
X-Google-Smtp-Source: AOwi7QA1ksTiWI9Am2a4DW9h2OhsLLIDda/64JjC+uNGR8Ta2f+sJ2FI4TncFCELm76PwC9GQxuCdg==
X-Received: by 10.223.182.166 with SMTP id j38mr2637589wre.55.1505853364279;
	Tue, 19 Sep 2017 13:36:04 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 10sm159073wrt.59.2017.09.19.13.36.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 13:36:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Sep 2017 22:38:29 +0200
Message-Id: <20170919203829.22710-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-browser][PATCH] firefox: fix build failures
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
X-List-Received-Date: Tue, 19 Sep 2017 20:36:04 -0000

* use --x-includes and --x-libraries parameters to prevent
  using host paths
* we cannot just disable x11 support with --without-x, because
  cairo-gtk2 (with or without -x11 suffix) from:
  _PLATFORM_DEFAULT_TOOLKIT=cairo-gtk2
  explicitly sets MOZ_X11=1 which cannot be used together --without-x:
  if test "$MOZ_X11"; then
    if test "$WITHOUT_X11"; then
        AC_MSG_ERROR([--without-x specified and MOZ_X11 still defined])
    fi
  ...
* fixes http://errors.yoctoproject.org/Errors/Details/155964/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../firefox/firefox/remove_AC_PATH_XTRA.patch      | 59 ----------------------
 recipes-mozilla/firefox/firefox_45.9.0esr.bb       |  2 +-
 2 files changed, 1 insertion(+), 60 deletions(-)
 delete mode 100644 recipes-mozilla/firefox/firefox/remove_AC_PATH_XTRA.patch

diff --git a/recipes-mozilla/firefox/firefox/remove_AC_PATH_XTRA.patch b/recipes-mozilla/firefox/firefox/remove_AC_PATH_XTRA.patch
deleted file mode 100644
index 69d297e..0000000
--- a/recipes-mozilla/firefox/firefox/remove_AC_PATH_XTRA.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-Drop unused X_* flags.
-
-There are actually causing harm doing cross builds since they are picking
-up $includedir which  is /usr/include and pouring that into CFLAGS in
-case of cairo, which ends up referening to build host's include paths
-
-Luckily, we have a QA check to catch such issues
-
-ERROR: firefox-45.9.0esr-r0 do_package_qa: QA Issue: firefox: The compile log indicates that host include and/or library paths were used.
-         Please check the log '/mnt/a/oe/build/tmp/work/corei7-64-bec-linux/firefox/45.9.0esr-r0/temp/log.do_compile' for more information. [compile-host-path]
-
-This patch fixes it
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: firefox-45.9.0esr/configure
-===================================================================
---- firefox-45.9.0esr.orig/configure
-+++ firefox-45.9.0esr/configure
-@@ -30605,10 +30605,6 @@ sed 's/$/,/' >> $CONFIG_STATUS <<EOF
-     (''' MACOS_SDK_DIR ''', r''' $MACOS_SDK_DIR ''')
-     (''' MACOS_PRIVATE_FRAMEWORKS_DIR ''', r''' $MACOS_PRIVATE_FRAMEWORKS_DIR ''')
-     (''' GMAKE ''', r''' $GMAKE ''')
--    (''' X_CFLAGS ''', r''' $X_CFLAGS ''')
--    (''' X_PRE_LIBS ''', r''' $X_PRE_LIBS ''')
--    (''' X_LIBS ''', r''' $X_LIBS ''')
--    (''' X_EXTRA_LIBS ''', r''' $X_EXTRA_LIBS ''')
-     (''' SOLARIS_SUNPRO_CC ''', r''' $SOLARIS_SUNPRO_CC ''')
-     (''' SOLARIS_SUNPRO_CXX ''', r''' $SOLARIS_SUNPRO_CXX ''')
-     (''' MOZ_THUMB2 ''', r''' $MOZ_THUMB2 ''')
-Index: firefox-45.9.0esr/js/src/configure
-===================================================================
---- firefox-45.9.0esr.orig/js/src/configure
-+++ firefox-45.9.0esr/js/src/configure
-@@ -17188,10 +17188,6 @@ sed 's/$/,/' >> $CONFIG_STATUS <<EOF
-     (''' MACOSX_DEPLOYMENT_TARGET ''', r''' $MACOSX_DEPLOYMENT_TARGET ''')
-     (''' MACOS_SDK_DIR ''', r''' $MACOS_SDK_DIR ''')
-     (''' GMAKE ''', r''' $GMAKE ''')
--    (''' X_CFLAGS ''', r''' $X_CFLAGS ''')
--    (''' X_PRE_LIBS ''', r''' $X_PRE_LIBS ''')
--    (''' X_LIBS ''', r''' $X_LIBS ''')
--    (''' X_EXTRA_LIBS ''', r''' $X_EXTRA_LIBS ''')
-     (''' MOZILLA_SYMBOLVERSION ''', r''' $MOZILLA_SYMBOLVERSION ''')
-     (''' JS_SHELL_NAME ''', r''' $JS_SHELL_NAME ''')
-     (''' JS_CONFIG_NAME ''', r''' $JS_CONFIG_NAME ''')
-Index: firefox-45.9.0esr/gfx/cairo/cairo/src/moz.build
-===================================================================
---- firefox-45.9.0esr.orig/gfx/cairo/cairo/src/moz.build
-+++ firefox-45.9.0esr/gfx/cairo/cairo/src/moz.build
-@@ -246,9 +246,6 @@ if CONFIG['MOZ_WIDGET_TOOLKIT'] == 'qt':
-     CFLAGS += CONFIG['MOZ_QT_CFLAGS']
-     CXXFLAGS += CONFIG['MOZ_QT_CFLAGS']
- 
--if CONFIG['MOZ_X11']:
--    CFLAGS += CONFIG['XCFLAGS']
--
- if CONFIG['MOZ_ENABLE_CAIRO_FT']:
-     CFLAGS += CONFIG['CAIRO_FT_CFLAGS']
-     CXXFLAGS += CONFIG['CAIRO_FT_CFLAGS']
diff --git a/recipes-mozilla/firefox/firefox_45.9.0esr.bb b/recipes-mozilla/firefox/firefox_45.9.0esr.bb
index 51b6a16..a46d8e9 100644
--- a/recipes-mozilla/firefox/firefox_45.9.0esr.bb
+++ b/recipes-mozilla/firefox/firefox_45.9.0esr.bb
@@ -43,7 +43,6 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/source/firefox
            file://0002-use-pkg-config-to-find-nspr.patch \
            file://0003-do-not-link-against-crmf-library-it-is-not-there.patch \
            file://gcc7.patch \
-           file://remove_AC_PATH_XTRA.patch \
            file://add-libresolv.patch \
 "
 SRC_URI_append_libc-musl = "\
@@ -69,6 +68,7 @@ S = "${WORKDIR}/firefox-45.9.0esr"
 MOZ_APP_BASE_VERSION = "45.9"
 
 inherit mozilla
+EXTRA_OECONF_append = " --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR}"
 EXTRA_OECONF_append_libc-musl = " --disable-jemalloc"
 
 EXTRA_OEMAKE += "installdir=${libdir}/${PN}"
-- 
2.14.1


