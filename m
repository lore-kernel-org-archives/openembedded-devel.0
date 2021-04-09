Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web12.3632.1617934871655985584
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f6K8UQj5;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id h6-20020a0568300346b02901b71a850ab4so4317010ote.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=rKKfj9VBQWtd3STTFjUDPwyH1qGcIP8ChAoyZaoEa1M=;
        b=f6K8UQj5/FBp8CfWg4G/wwrQu94ADJ71NNx1LPZIjwqaNFrB6t52/6a4xtGT8P4CKO
         bHaWjXmI9xT2xC9DbWKv/JuG4pdiOJVbxuZ2LDw5vNt6sguOG7YRFwg6dHoUx7iLlX3W
         M7ppb+1nd7f/QCkOroaX7a7RNlQu4QuIc4AsUbbUb4JUeeJMCIhfu8DGQkfgi/eu/Rtv
         2KEe+rO8lNiC+FlLqSe6k3d/Xvl0d/GlCD1X8Y3ZN6RQmcn/Lugod4QzfDXVvKIcgnsJ
         XICRIZSI0y0BHzsTEsyib8fPlE83GmMT+d4h+wrlu6KGocsB/x23YNXE7c7J7Zj4Sd8L
         eM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=rKKfj9VBQWtd3STTFjUDPwyH1qGcIP8ChAoyZaoEa1M=;
        b=SXjbgxobsYs0jds9IxwMf3gLGl9ZfHhbhn3qnbkSAwxJ17IXQcT+4SezsXYZPricSZ
         ZIqSPVPXn5kfABCSm9koL575/oFuOe/zZUfWOFAcd5szM5ZHr5w69hTEZjNoRyzPC76T
         CVQePjTCJ8FVfrZWl+EMkMpHdpsuKgMe+7Y/6ODM0TLTKFAd2vfxETeqRrSgejpGCMIW
         /4xAe5wdIsz7iFAwxSDShM+3ZvPz4CbHnNtd2w5KqpArG2U6YdeZ09MzC5TPlKCcfVYv
         o3v204VetfcTT1aExCW0NckLCyFLRV+9xCN/PmW1RgoH9o6QzWfXLEUjMDn3QgICOLFg
         7FIg==
X-Gm-Message-State: AOAM530XoRsHpD0/r3Kg7YBVjmeDT9zhsVbXrOngD40EEV3lyif55iqv
	DXsEAU+bBQqQQZj2V1ezSWH1OiCHKfQ=
X-Google-Smtp-Source: ABdhPJw05P5hAz3RyI/CQBG0eqsKNn2q0gb8PGVHXR/sp0HOFmn+V9ohWMCz9zci6p9DaMNdqGelYw==
X-Received: by 2002:a9d:6e18:: with SMTP id e24mr10479929otr.284.1617934870328;
        Thu, 08 Apr 2021 19:21:10 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:10 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 20/36] pidgin: upgrade to 2.14.2
Date: Thu,  8 Apr 2021 19:20:33 -0700
Message-Id: <84c73f49aa2bb6e5f5ec4deb0bfb0160d4c53ea6.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* drop --with-python=python3 as it was renamed to --with-python3 and it defaults to
  python3 now anyway
  https://reviews.imfreedom.org/r/550/

* add PACKAGECONFIG for cyrus-sasl, it's enabled by default since:
  commit 8d6c390002378664dea48e8766a0e4f063b12f78
  Author: Gary Kramlich <grim@reaperworld.com>
  Date:   Mon Jul 13 03:34:57 2020 -0500

    Enable cyrus-sasl support by default
  but cyrus-sasl is in meta-networking layer, so we want to keep it disabled by default

* drop patches for autoconf-2.71, it was resolved upstream in:
  commit aedf4a502e3b5875966e3f8277d7d43a0d9497a2
  Author: Gary Kramlich <grim@reaperworld.com>
  Date:   Mon Mar 29 22:56:22 2021 -0500

    Fix a bug where autoconf 2.71 complains about AC_PROG_INTLTOOL not being used.

* 2.14.1 was sometimes failing with
  cat ../../pidgin-2.14.1/libpurple/account.h ../../pidgin-2.14.1/libpurple/accountopt.h ../../pidgin-2.14.1/libpurple/blist.h ../../pidgin-2.14.1/libpurple/buddyicon.h ../../pidgin-2.14.1/libpurple/certificate.h ../../pidgin-2.14.1/libpurple/cipher.h ../../pidgin-2.14.1/libpurple/circbuffer.h ../../pidgin-2.14.1/libpurple/cmds.h ../../pidgin-2.14.1/libpurple/connection.h ../../pidgin-2.14.1/libpurple/conversation.h ../../pidgin-2.14.1/libpurple/core.h ../../pidgin-2.14.1/libpurple/dbus-maybe.h ../../pidgin-2.14.1/libpurple/debug.h ../../pidgin-2.14.1/libpurple/desktopitem.h ../../pidgin-2.14.1/libpurple/eventloop.h ../../pidgin-2.14.1/libpurple/ft.h ../../pidgin-2.14.1/libpurple/gaim-compat.h ../../pidgin-2.14.1/libpurple/glibcompat.h
  ../../pidgin-2.14.1/libpurple/idle.h ../../pidgin-2.14.1/libpurple/imgstore.h ../../pidgin-2.14.1/libpurple/log.h ../../pidgin-2.14.1/libpurple/media.h ../../pidgin-2.14.1/libpurple/media-gst.h ../../pidgin-2.14.1/libpurple/mediamanager.h ../../pidgin-2.14.1/libpurple/mime.h ../../pidgin-2.14.1/libpurple/nat-pmp.h ../../pidgin-2.14.1/libpurple/network.h ../../pidgin-2.14.1/libpurple/notify.h ../../pidgin-2.14.1/libpurple/ntlm.h ../../pidgin-2.14.1/libpurple/plugin.h ../../pidgin-2.14.1/libpurple/pluginpref.h ../../pidgin-2.14.1/libpurple/pounce.h ../../pidgin-2.14.1/libpurple/prefs.h ../../pidgin-2.14.1/libpurple/privacy.h ../../pidgin-2.14.1/libpurple/proxy.h ../../pidgin-2.14.1/libpurple/prpl.h ../../pidgin-2.14.1/libpurple/request.h ../../pidgin-2.14.1/libpurple/roomlist.h ../../pidgin-2.14.1/libpurple/savedstatuses.h 
  ../../pidgin-2.14.1/libpurple/server.h ../../pidgin-2.14.1/libpurple/signals.h ../../pidgin-2.14.1/libpurple/smiley.h ../../pidgin-2.14.1/libpurple/dnsquery.h ../../pidgin-2.14.1/libpurple/dnssrv.h ../../pidgin-2.14.1/libpurple/status.h ../../pidgin-2.14.1/libpurple/stringref.h ../../pidgin-2.14.1/libpurple/stun.h ../../pidgin-2.14.1/libpurple/sound.h ../../pidgin-2.14.1/libpurple/sound-theme.h ../../pidgin-2.14.1/libpurple/sound-theme-loader.h ../../pidgin-2.14.1/libpurple/sslconn.h ../../pidgin-2.14.1/libpurple/theme.h ../../pidgin-2.14.1/libpurple/theme-loader.h ../../pidgin-2.14.1/libpurple/theme-manager.h 
  ../../pidgin-2.14.1/libpurple/upnp.h ../../pidgin-2.14.1/libpurple/util.h ../../pidgin-2.14.1/libpurple/value.h ../../pidgin-2.14.1/libpurple/xmlnode.h ../../pidgin-2.14.1/libpurple/whiteboard.h ../../pidgin-2.14.1/libpurple/media/backend-iface.h ../../pidgin-2.14.1/libpurple/media/candidate.h ../../pidgin-2.14.1/libpurple/media/codec.h ../../pidgin-2.14.1/libpurple/media/enum-types.h purple.h version.h marshallers.h | python3 ../../pidgin-2.14.1/libpurple/dbus-analyze-types.py --keyword=enum --verbatim > purple-client-bindings.h
  cat: marshallers.h: No such file or directory
  cat: marshallers.h: No such file or directory
  cat: marshallers.h: No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 92926a3e45dadb55cfcacb892c01d512c42d53c4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...gure.ac-fix-build-with-autoconf-2.71.patch | 229 ------------------
 ...able-few-languages-not-compatible-wi.patch |  49 ----
 .../{pidgin_2.14.1.bb => pidgin_2.14.2.bb}    |   6 +-
 3 files changed, 2 insertions(+), 282 deletions(-)
 delete mode 100644 meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac-fix-build-with-autoconf-2.71.patch
 delete mode 100644 meta-oe/recipes-support/pidgin/pidgin/0002-configure.ac-disable-few-languages-not-compatible-wi.patch
 rename meta-oe/recipes-support/pidgin/{pidgin_2.14.1.bb => pidgin_2.14.2.bb} (94%)

diff --git a/meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac-fix-build-with-autoconf-2.71.patch b/meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac-fix-build-with-autoconf-2.71.patch
deleted file mode 100644
index cfb0290f9b7..00000000000
--- a/meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac-fix-build-with-autoconf-2.71.patch
+++ /dev/null
@@ -1,229 +0,0 @@
-From e03d3ef5aadd582ebf7102b7d5785fed177a0cb1 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sun, 7 Feb 2021 13:25:29 +0100
-Subject: [PATCH] configure.ac: fix build with autoconf-2.71
-
-* fixes:
-  | autoreconf: running: intltoolize --copy --force
-  | ERROR: 'IT_PROG_INTLTOOL' must appear in configure.ac for intltool to work.
-  | autoreconf: error: intltoolize failed with exit status: 1
-
-* replace AM_GLIB_GNU_GETTEXT with AM_GNU_GETTEXT as suggested in:
-  https://wiki.gnome.org/Initiatives/GnomeGoals/GettextMigration
-  https://blogs.gnome.org/jjardon/2010/10/08/use-upstream-gettext-instead-the-glib-one/
-  because the former is causing issues with autoconf-2.71:
-
-  -m4trace:configure.ac:266: -1- _m4_warn([obsolete], [The macro `AC_TRY_LINK' is obsolete.
-  -You should run autoupdate.], [../autoconf-2.71/lib/autoconf/general.m4:2920: AC_TRY_LINK is expanded from...
-  -../autoconf-2.71/lib/m4sugar/m4sh.m4:699: AS_IF is expanded from...
-  -../autoconf-2.71/lib/autoconf/headers.m4:89: _AC_CHECK_HEADER_COMPILE is expanded from...
-  -../autoconf-2.71/lib/autoconf/headers.m4:56: AC_CHECK_HEADER is expanded from...
-  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m4:150: GLIB_WITH_NLS is expanded from...
-  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m4:370: GLIB_GNU_GETTEXT is expanded from...
-  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m4:470: AM_GLIB_GNU_GETTEXT is expanded from...
-  -configure.ac:266: the top level])
-  -m4trace:configure.ac:266: -1- m4_pattern_allow([^ENABLE_NLS$])
-  -m4trace:configure.ac:266: -1- _m4_warn([obsolete], [The macro `AC_OUTPUT_COMMANDS' is obsolete.
-  -You should run autoupdate.], [../autoconf-2.71/lib/autoconf/status.m4:1025: AC_OUTPUT_COMMANDS is expanded from...
-  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m4:150: GLIB_WITH_NLS is expanded from...
-  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m4:370: GLIB_GNU_GETTEXT is expanded from...
-  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m4:470: AM_GLIB_GNU_GETTEXT is expanded from...
-  -configure.ac:266: the top level])
-
-  and then configure fails with:
-
-  configure.ac:2621: error: `po/stamp-it' is already registered with AC_CONFIG_COMMANDS.
-  autoconf-2.71/lib/autoconf/status.m4:1008: AC_CONFIG_COMMANDS is expanded from...
-  configure.ac:2621: the top level
-
-* add AM_GNU_GETTEXT_VERSION as well to resolve warning with autoconf-2.71
-  configure.ac: warning: AM_GNU_GETTEXT is used, but not AM_GNU_GETTEXT_VERSION or AM_GNU_GETTEXT_REQUIRE_VERSION
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- ABOUT-NLS          |  1 +
- Makefile.am        |  6 +---
- configure.ac       |  6 ++--
- pidgin/Makefile.am |  7 ++--
- po/Makevars        | 82 ++++++++++++++++++++++++++++++++++++++++++++++
- po/POTFILES.in     |  1 -
- 6 files changed, 92 insertions(+), 11 deletions(-)
- create mode 100644 ABOUT-NLS
- create mode 100644 po/Makevars
-
-diff --git a/ABOUT-NLS b/ABOUT-NLS
-new file mode 100644
-index 0000000..0a9d56d
---- /dev/null
-+++ b/ABOUT-NLS
-@@ -0,0 +1 @@
-+<https://www.gnu.org/software/gettext/manual/html_node/Users.html>
-diff --git a/Makefile.am b/Makefile.am
-index f8e2bc9..a74145f 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -13,9 +13,6 @@ EXTRA_DIST = \
- 		fix-casts.sh \
- 		gaim.pc.in \
- 		gaim-uninstalled.pc.in \
--		intltool-extract.in \
--		intltool-merge.in \
--		intltool-update.in \
- 		package_revision.h \
- 		pidgin.apspec.in \
- 		pidgin.spec.in \
-@@ -139,5 +136,4 @@ endif
- distuninstallcheck_listfiles = \
- 	find . -type f -print | grep -v perl | grep -v Purple.3pm | grep -v Pidgin.3pm
- 
--DISTCLEANFILES= intltool-extract intltool-merge intltool-update \
--			package_revision_raw.txt
-+DISTCLEANFILES=package_revision_raw.txt
-diff --git a/configure.ac b/configure.ac
-index 81d8592..e2280cd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -43,7 +43,7 @@ fi
- 
- AC_CANONICAL_HOST
- AC_CONFIG_HEADERS([config.h])
--AM_INIT_AUTOMAKE([1.9 -Wno-portability dist-bzip2])
-+AM_INIT_AUTOMAKE([1.9 -Wno-portability dist-bzip2 foreign])
- dnl TODO: Always use AM_SILENT_RULES when we depend on automake >= 1.11
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- 
-@@ -257,12 +257,12 @@ dnl #######################################################################
- AC_ARG_ENABLE(nls, AC_HELP_STRING([--disable-nls], [disable installation of translation files]), enable_i18n="$enableval", enable_i18n=yes)
- 
- if test x$enable_i18n = xyes; then
--	AC_PROG_INTLTOOL
- 	GETTEXT_PACKAGE=pidgin
- 	AC_SUBST(GETTEXT_PACKAGE)
- 
- 	ALL_LINGUAS="af am ar ar_SA as ast az be@latin bg bn_IN bn br brx bs ca ca@valencia cs da de dz el en_AU en_CA en_GB eo es_AR es et eu fa fi fr ga gl gu he hi hr hu id it ja ka kk km kn ko ks ku_IQ ku lt lv mai mhr mk ml mn mr ms_MY my_MM nb ne nl nn oc or pa pl ps pt_BR pt ro ru sd si sk sl sq sr@latin sr sv sw ta te th tr tt uk ur uz vi xh zh_CN zh_HK zh_TW"
--	AM_GLIB_GNU_GETTEXT
-+	AM_GNU_GETTEXT([external])
-+	AM_GNU_GETTEXT_VERSION([0.21])
- 
- 	dnl If we don't have msgfmt, then po/ is going to fail -- ensure that
- 	dnl AM_GLIB_GNU_GETTEXT found it.
-diff --git a/pidgin/Makefile.am b/pidgin/Makefile.am
-index 2278b88..4d32c53 100644
---- a/pidgin/Makefile.am
-+++ b/pidgin/Makefile.am
-@@ -192,13 +192,16 @@ DESKTOP_FILE=data/pidgin.desktop
- appsdir = $(datadir)/applications
- apps_in_files = data/pidgin.desktop.in
- apps_DATA = $(apps_in_files:.desktop.in=.desktop)
--@INTLTOOL_DESKTOP_RULE@
-+
-+data/pidgin.desktop: data/pidgin.desktop.in
-+	$(AM_V_GEN)$(MSGFMT) --desktop --template $< -d $(top_srcdir)/po -o $@
- 
- appdatadir = $(datarootdir)/appdata
- appdata_DATA = $(appdata_in_files:.xml.in=.xml)
- appdata_in_files = data/pidgin.appdata.xml.in
- 
--@INTLTOOL_XML_RULE@
-+data/pidgin.appdata.xml: data/pidgin.appdata.xml.in
-+	$(AM_V_GEN)$(MSGFMT) --xml --template $< -d $(top_srcdir)/po -o $@ || cp $< $@
- 
- endif # INSTALL_I18N
- 
-diff --git a/po/Makevars b/po/Makevars
-new file mode 100644
-index 0000000..970237a
---- /dev/null
-+++ b/po/Makevars
-@@ -0,0 +1,82 @@
-+# Makefile variables for PO directory in any package using GNU gettext.
-+#
-+# Copyright (C) 2003-2019 Free Software Foundation, Inc.
-+# This file is free software; the Free Software Foundation gives
-+# unlimited permission to use, copy, distribute, and modify it.
-+
-+# Usually the message domain is the same as the package name.
-+DOMAIN = $(PACKAGE)
-+
-+# These two variables depend on the location of this directory.
-+subdir = po
-+top_builddir = ..
-+
-+# These options get passed to xgettext.
-+XGETTEXT_OPTIONS = --keyword=_ --keyword=N_ --from-code=UTF-8
-+
-+# This is the copyright holder that gets inserted into the header of the
-+# $(DOMAIN).pot file.  Set this to the copyright holder of the surrounding
-+# package.  (Note that the msgstr strings, extracted from the package's
-+# sources, belong to the copyright holder of the package.)  Translators are
-+# expected to transfer the copyright for their translations to this person
-+# or entity, or to disclaim their copyright.  The empty string stands for
-+# the public domain; in this case the translators are expected to disclaim
-+# their copyright.
-+COPYRIGHT_HOLDER = Free Software Foundation, Inc.
-+
-+# This tells whether or not to prepend "GNU " prefix to the package
-+# name that gets inserted into the header of the $(DOMAIN).pot file.
-+# Possible values are "yes", "no", or empty.  If it is empty, try to
-+# detect it automatically by scanning the files in $(top_srcdir) for
-+# "GNU packagename" string.
-+PACKAGE_GNU =
-+
-+# This is the email address or URL to which the translators shall report
-+# bugs in the untranslated strings:
-+# - Strings which are not entire sentences, see the maintainer guidelines
-+#   in the GNU gettext documentation, section 'Preparing Strings'.
-+# - Strings which use unclear terms or require additional context to be
-+#   understood.
-+# - Strings which make invalid assumptions about notation of date, time or
-+#   money.
-+# - Pluralisation problems.
-+# - Incorrect English spelling.
-+# - Incorrect formatting.
-+# It can be your email address, or a mailing list address where translators
-+# can write to without being subscribed, or the URL of a web page through
-+# which the translators can contact you.
-+MSGID_BUGS_ADDRESS =
-+
-+# This is the list of locale categories, beyond LC_MESSAGES, for which the
-+# message catalogs shall be used.  It is usually empty.
-+EXTRA_LOCALE_CATEGORIES =
-+
-+# This tells whether the $(DOMAIN).pot file contains messages with an 'msgctxt'
-+# context.  Possible values are "yes" and "no".  Set this to yes if the
-+# package uses functions taking also a message context, like pgettext(), or
-+# if in $(XGETTEXT_OPTIONS) you define keywords with a context argument.
-+USE_MSGCTXT = no
-+
-+# These options get passed to msgmerge.
-+# Useful options are in particular:
-+#   --previous            to keep previous msgids of translated messages,
-+#   --quiet               to reduce the verbosity.
-+MSGMERGE_OPTIONS =
-+
-+# These options get passed to msginit.
-+# If you want to disable line wrapping when writing PO files, add
-+# --no-wrap to MSGMERGE_OPTIONS, XGETTEXT_OPTIONS, and
-+# MSGINIT_OPTIONS.
-+MSGINIT_OPTIONS =
-+
-+# This tells whether or not to regenerate a PO file when $(DOMAIN).pot
-+# has changed.  Possible values are "yes" and "no".  Set this to no if
-+# the POT file is checked in the repository and the version control
-+# program ignores timestamps.
-+PO_DEPENDS_ON_POT = no
-+
-+# This tells whether or not to forcibly update $(DOMAIN).pot and
-+# regenerate PO files on "make dist".  Possible values are "yes" and
-+# "no".  Set this to no if the POT file and PO files are maintained
-+# externally.
-+DIST_DEPENDS_ON_UPDATE_PO = no
-diff --git a/po/POTFILES.in b/po/POTFILES.in
-index a5691a1..b494bf3 100644
---- a/po/POTFILES.in
-+++ b/po/POTFILES.in
-@@ -1,4 +1,3 @@
--[encoding: UTF-8]
- finch/finch.c
- finch/gntaccount.c
- finch/gntblist.c
diff --git a/meta-oe/recipes-support/pidgin/pidgin/0002-configure.ac-disable-few-languages-not-compatible-wi.patch b/meta-oe/recipes-support/pidgin/pidgin/0002-configure.ac-disable-few-languages-not-compatible-wi.patch
deleted file mode 100644
index 99c523d5d9d..00000000000
--- a/meta-oe/recipes-support/pidgin/pidgin/0002-configure.ac-disable-few-languages-not-compatible-wi.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 861c8a63c36f9ee7d46238c9bc13a2c1f14372c3 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sun, 7 Feb 2021 14:35:14 +0000
-Subject: [PATCH] configure.ac: disable few languages not compatible with
- modern gettext
-
-* as pidgin-3 development is moving to meson and probably
-  most of these changes won't be applicable there, lets just
-  disable them until someone interested steps-up to maintain it
-
-* these 3 fail with:
-cd ../../pidgin-2.14.1/po && rm -f brx.gmo && pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o brx.1po brx.po pidgin.pot && pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o brx.gmo brx.1po && rm -f brx.1po
-cd ../../pidgin-2.14.1/po && rm -f zh_HK.gmo && pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o zh_HK.1po zh_HK.po pidgin.pot && pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o zh_HK.gmo zh_HK.1po && rm -f zh_HK.1po
-cd ../../pidgin-2.14.1/po && rm -f zh_TW.gmo && pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o zh_TW.1po zh_TW.po pidgin.pot && pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbose -o zh_TW.gmo zh_TW.1po && rm -f zh_TW.1po
-zh_HK.1po:2790: 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: The string refers to arguments both through absolute argument numbers and through unnumbered argument specifications.
-pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt: found 1 fatal error
-zh_TW.1po:2790: 'msgstr' is not a valid C format string, unlike 'msgid'. Reason: The string refers to arguments both through absolute argument numbers and through unnumbered argument specifications.
-pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt: found 1 fatal error
-zh_HK.1po: 3234 translated messages.
-make[3]: *** [Makefile:415: ../../pidgin-2.14.1/po/zh_HK.gmo] Error 1
-make[3]: *** Waiting for unfinished jobs....
-zh_TW.1po: 3234 translated messages.
-make[3]: *** [Makefile:415: ../../pidgin-2.14.1/po/zh_TW.gmo] Error 1
-brx.1po:778: number of format specifications in 'msgid' and 'msgstr' does not match
-brx.1po:3179: number of format specifications in 'msgid' and 'msgstr' does not match
-brx.1po:5175: format specifications in 'msgid_plural' and 'msgstr[0]' for argument 1 are not the same
-brx.1po:5184: format specifications in 'msgid_plural' and 'msgstr[0]' for argument 1 are not the same
-brx.1po:7754: format specifications in 'msgid_plural' and 'msgstr[0]' for argument 1 are not the same
-pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt: found 8 fatal errors
-brx.1po: 3246 translated messages.
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index e2280cd..9332932 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -260,7 +260,7 @@ if test x$enable_i18n = xyes; then
- 	GETTEXT_PACKAGE=pidgin
- 	AC_SUBST(GETTEXT_PACKAGE)
- 
--	ALL_LINGUAS="af am ar ar_SA as ast az be@latin bg bn_IN bn br brx bs ca ca@valencia cs da de dz el en_AU en_CA en_GB eo es_AR es et eu fa fi fr ga gl gu he hi hr hu id it ja ka kk km kn ko ks ku_IQ ku lt lv mai mhr mk ml mn mr ms_MY my_MM nb ne nl nn oc or pa pl ps pt_BR pt ro ru sd si sk sl sq sr@latin sr sv sw ta te th tr tt uk ur uz vi xh zh_CN zh_HK zh_TW"
-+	ALL_LINGUAS="af am ar ar_SA as ast az be@latin bg bn_IN bn br bs ca ca@valencia cs da de dz el en_AU en_CA en_GB eo es_AR es et eu fa fi fr ga gl gu he hi hr hu id it ja ka kk km kn ko ks ku_IQ ku lt lv mai mhr mk ml mn mr ms_MY my_MM nb ne nl nn oc or pa pl ps pt_BR pt ro ru sd si sk sl sq sr@latin sr sv sw ta te th tr tt uk ur uz vi xh zh_CN"
- 	AM_GNU_GETTEXT([external])
- 	AM_GNU_GETTEXT_VERSION([0.21])
- 
diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.14.1.bb b/meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb
similarity index 94%
rename from meta-oe/recipes-support/pidgin/pidgin_2.14.1.bb
rename to meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb
index d22380eb0df..ba0dca233ba 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.14.1.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb
@@ -11,11 +11,9 @@ SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/pidgin/pidgin-${PV}.tar.bz2 \
     file://sanitize-configure.ac.patch \
     file://purple-OE-branding-25.patch \
-    file://0001-configure.ac-fix-build-with-autoconf-2.71.patch \
-    file://0002-configure.ac-disable-few-languages-not-compatible-wi.patch \
 "
 
-SRC_URI[sha256sum] = "f132e18d551117d9e46acce29ba4f40892a86746c366999166a3862b51060780"
+SRC_URI[sha256sum] = "19654ad276b149646371fbdac21bc7620742f2975f7399fed0ffc1a18fbaf603"
 
 PACKAGECONFIG ??= "gnutls consoleui avahi dbus idn nss \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtk startup-notification', '', d)} \
@@ -39,9 +37,9 @@ PACKAGECONFIG[gnutls] = "--enable-gnutls --with-gnutls-includes=${STAGING_INCDIR
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus dbus-glib"
 PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[nss] = "--enable-nss,--disable-nss,nss nspr,libpurple-plugin-ssl-nss"
+PACKAGECONFIG[cyrus-sasl] = "--enable-cyrus-sasl,--disable-cyrus-sasl,cyrus-sasl"
 
 EXTRA_OECONF = " \
-    --with-python=python3 \
     --disable-perl \
     --disable-tcl \
     --disable-gevolution \
-- 
2.17.1

