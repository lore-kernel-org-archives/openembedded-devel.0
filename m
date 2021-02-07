Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.20884.1612709174483448648
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 06:46:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XhbfBvPm;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id c12so14043331wrc.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 06:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qONfy3IJUGXzVib3r6P4fNQ5ozfBA+4PvxVQ4grzttw=;
        b=XhbfBvPmbYm70t3wxu4Nl0ZZ0KqCwH+rE4DCQgHFwpVDTHeqm8sc5ckUq77uImLME2
         Xp19xjBSGt6Qwl2HLFQWyNnC+kmOKmiro33QTVCAbg7hz+wNfCK7C3jI+hieuziX56Fn
         qsrM02d1Ety1zYoT5+MRyGogBndW+kp08Y5JcIN1y5khlXO2vOVpS6Z9+wEp6OMeAgRx
         i23hc/jguUa6Bc0TvgQ0Ihx/pscvtk46UlShmmF6MXfixs1mP02CxCoQHjiEKElbfSrd
         U/Cq9NeNlH1Kz+NPGB6740lbZVYyRzuqgPA2YY4kp2/xj0hYWUOEGs9PDEKhZYugAzjd
         YCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qONfy3IJUGXzVib3r6P4fNQ5ozfBA+4PvxVQ4grzttw=;
        b=jzkKCB3oLR+ju4Id+TrUiW0UtuIcQmGRiGGjYmGrC0AdBvByW/P1PYOB9fUOaQQDRe
         yoMFoHVSZYh6K4i7s0AXQwgKaS4PXjChLsDOXRN/0TtuisP6NzyyyeaHSjHQnVbX6dtJ
         Tx+VpV+uwtZR1AD03eX16ns5gnEPK0uuk5t8P7Nl7O18TbArej+j4rgnoxAP2CcESO9U
         UxBRLagTsL4z9/ieu7/9q+F0chvWAKT55Dvr3Km2el/AtGsUOudNB1+Zat12hwbFnhfW
         h6AZZSF/K7MrjcAtmYHzmj2AZw39P8tHEmPRIeSrE0ece+FHPs2ks2KnTBkW1vDoqYYM
         WiDA==
X-Gm-Message-State: AOAM530Xufej5Q47OSbwXT7juoY3pXNsDAdlWBFYTc1/JTEaXnu/Tuhn
	W4X/hjba0X2CRmmLIIiFQeiZIJ3t8oiYEQ==
X-Google-Smtp-Source: ABdhPJyC1cy0cZOTB92dnRhYMWmtFwhoGFmm5lxL0h/Iazor2HzFMcl1q31D0Sepdkq2sFiyqUpjsQ==
X-Received: by 2002:adf:f849:: with SMTP id d9mr15622422wrq.349.1612709172738;
        Sun, 07 Feb 2021 06:46:12 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id i20sm15123591wmq.7.2021.02.07.06.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 06:46:12 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] pidgin: upgrade to 2.14.1 and fix autoconf-2.71 compatibility
Date: Sun,  7 Feb 2021 15:46:05 +0100
Message-Id: <20210207144605.3784078-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210207144605.3784078-1-Martin.Jansa@gmail.com>
References: <20210207144605.3784078-1-Martin.Jansa@gmail.com>
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

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...gure.ac-fix-build-with-autoconf-2.71.patch | 205 ++++++++++++++++++
 ...able-few-languages-not-compatible-wi.patch |  49 +++++
 .../pidgin/pidgin-cross-python-265.patch      |  42 ----
 .../pidgin/pidgin/use_py3.patch               |  20 --
 .../{pidgin_2.13.0.bb => pidgin_2.14.1.bb}    |  14 +-
 5 files changed, 259 insertions(+), 71 deletions(-)
 create mode 100644 meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac-fix-build-with-autoconf-2.71.patch
 create mode 100644 meta-oe/recipes-support/pidgin/pidgin/0002-configure.ac-disable-few-languages-not-compatible-wi.patch
 delete mode 100644 meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
 delete mode 100644 meta-oe/recipes-support/pidgin/pidgin/use_py3.patch
 rename meta-oe/recipes-support/pidgin/{pidgin_2.13.0.bb => pidgin_2.14.1.bb} (92%)

diff --git a/meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac-fix-build-with-autoconf-2.71.patch b/meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac-fix-build-with-autoconf-2.71.patch
new file mode 100644
index 0000000000..1c43266a30
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac-fix-build-with-autoconf-2.71.patch
@@ -0,0 +1,205 @@
+From 932a4c40ec78747d0ee073a8bdc5218de30affbe Mon Sep 17 00:00:00 2001
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
+ ABOUT-NLS      |  1 +
+ Makefile.am    |  6 +---
+ configure.ac   |  6 ++--
+ po/Makevars    | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ po/POTFILES.in |  1 -
+ 5 files changed, 87 insertions(+), 9 deletions(-)
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
+diff --git a/po/Makevars b/po/Makevars
+new file mode 100644
+index 0000000..0c1178d
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
index 0000000000..e8793b2bdd
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/pidgin/0002-configure.ac-disable-few-languages-not-compatible-wi.patch
@@ -0,0 +1,49 @@
+From e27dd5cf8f737c6ec6c05795966099796f63873e Mon Sep 17 00:00:00 2001
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
similarity index 92%
rename from meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb
rename to meta-oe/recipes-support/pidgin/pidgin_2.14.1.bb
index fdc79e81b2..9a90f36322 100644
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
@@ -41,6 +41,7 @@ PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[nss] = "--enable-nss,--disable-nss,nss nspr,libpurple-plugin-ssl-nss"
 
 EXTRA_OECONF = " \
+    --with-python=python3 \
     --disable-perl \
     --disable-tcl \
     --disable-gevolution \
@@ -51,11 +52,6 @@ EXTRA_OECONF = " \
     --disable-screensaver \
 "
 
-do_configure_prepend() {
-    touch ${S}/po/Makefile
-    sed -i "s#PY_VERSION=`$PYTHON -c 'import sys ; print sys.version[0:3]'`#PY_VERSION=${PYTHON_BASEVERSION}#g" ${S}/configure.ac
-}
-
 OE_LT_RPATH_ALLOW=":${libdir}/purple-2:"
 OE_LT_RPATH_ALLOW[export]="1"
 
-- 
2.27.0

