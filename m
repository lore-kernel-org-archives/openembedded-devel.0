Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.891.1617743948062948031
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Apr 2021 14:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V0Jn5U4P;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id n2so17914358ejy.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Apr 2021 14:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XnU+Nw5NpnSiqu1HlwMGk27wOZtAn6AW9BrM4wljBhc=;
        b=V0Jn5U4PRdkiHKydUBNLGgftZaCK198DmX2JQ4QFnAc7TcBC/qGj9C4xXVrkqizjCV
         o6UibvY+SFh3D73MrU0Oah8qNyRZC6JkEKq5sJjongFgXbaWVpPMtBBBIW63Azja6JlV
         V7HC+K9E8LzzAixyBwISHqekr9GRQVXr0mse984i3v9jpP+F8HG3WixrpOws/IX22U1v
         aZ2z717Q1hkCI1X6tdOqYT+GRzOMtlGfNKrExDamxAWZNoxJ4aCdbngYAhBAXqYEwyjO
         OETE0irsRhr9FINMz0YIFFyHHAkcqgVupXfXHAOPe8CrsyZGrF/HSUBsoJUih+wy95gQ
         m+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XnU+Nw5NpnSiqu1HlwMGk27wOZtAn6AW9BrM4wljBhc=;
        b=qercxOFJ3d8Rx6Miqfq/FKg8rjFJpaUGB9UOlnEijwjgpW3zn3XEs4EvSrPJusQWJi
         QXeIqVK2SndgrnV06kJPbFL6D2D93gJhF5NPOEATJtwVHJyIrD7rPRWvz2IrmH7/jski
         Jl9wz5SbD+vdWjtAvHC+IbE8DOA5U/02kPNHKMmIHEb8Ko5iAzKWL4XQs7hPHTZpalr1
         5Le6gitfBfE9qL72BTPoZyeBe2b8HNjmnAb/NsyTHyPSlOaB5J/Y1nY/JhXpffDCd3cA
         muXYhZRawMREqmb0O4HKIcQmsAI1x9uxeD2cq5caBHENDHXt0h2SvdfHmo5yi47AiUtt
         FZDg==
X-Gm-Message-State: AOAM530MSmfJFkjCzH9EbEdWFgFmyV2Zm03qyNi68twJDw810v75pEix
	ucV233G73H5bCHDgZFlzZ7dgaFYIHvc=
X-Google-Smtp-Source: ABdhPJzKzqPn6nX+AYQlQI2/B0CAAM4pvCwv+ZpfEHDi/z1T+Jq8JlRb95IABOMxQXepPQssrno0Dw==
X-Received: by 2002:a17:907:2677:: with SMTP id ci23mr18676595ejc.271.1617743946311;
        Tue, 06 Apr 2021 14:19:06 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y21sm6381295edv.31.2021.04.06.14.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 14:19:05 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] pidgin: upgrade to 2.14.2
Date: Tue,  6 Apr 2021 23:19:03 +0200
Message-Id: <20210406211903.1957515-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

* drop --with-python=3Dpython3 as it was renamed to --with-python3 and it d=
efaults to
  python3 now anyway
  https://reviews.imfreedom.org/r/550/

* add PACKAGECONFIG for cyrus-sasl, it's enabled by default since:
  commit 8d6c390002378664dea48e8766a0e4f063b12f78
  Author: Gary Kramlich <grim@reaperworld.com>
  Date:   Mon Jul 13 03:34:57 2020 -0500

    Enable cyrus-sasl support by default
  but cyrus-sasl is in meta-networking layer, so we want to keep it disable=
d by default

* drop patches for autoconf-2.71, it was resolved upstream in:
  commit aedf4a502e3b5875966e3f8277d7d43a0d9497a2
  Author: Gary Kramlich <grim@reaperworld.com>
  Date:   Mon Mar 29 22:56:22 2021 -0500

    Fix a bug where autoconf 2.71 complains about AC_PROG_INTLTOOL not bein=
g used.

* 2.14.1 was sometimes failing with
  cat ../../pidgin-2.14.1/libpurple/account.h ../../pidgin-2.14.1/libpurple=
/accountopt.h ../../pidgin-2.14.1/libpurple/blist.h ../../pidgin-2.14.1/lib=
purple/buddyicon.h ../../pidgin-2.14.1/libpurple/certificate.h ../../pidgin=
-2.14.1/libpurple/cipher.h ../../pidgin-2.14.1/libpurple/circbuffer.h ../..=
/pidgin-2.14.1/libpurple/cmds.h ../../pidgin-2.14.1/libpurple/connection.h =
../../pidgin-2.14.1/libpurple/conversation.h ../../pidgin-2.14.1/libpurple/=
core.h ../../pidgin-2.14.1/libpurple/dbus-maybe.h ../../pidgin-2.14.1/libpu=
rple/debug.h ../../pidgin-2.14.1/libpurple/desktopitem.h ../../pidgin-2.14.=
1/libpurple/eventloop.h ../../pidgin-2.14.1/libpurple/ft.h ../../pidgin-2.1=
4.1/libpurple/gaim-compat.h ../../pidgin-2.14.1/libpurple/glibcompat.h ../.=
./pidgin-2.14.1/libpurple/idle.h ../../pidgin-2.14.1/libpurple/imgstore.h .=
./../pidgin-2.14.1/libpurple/log.h ../../pidgin-2.14.1/libpurple/media.h ..=
/../pidgin-2.14.1/libpurple/media-gst.h ../../pidgin-2.14.1/libpurple/media=
manager.h ../../pidgin-2.14.1/libpurple/mime.h ../../pidgin-2.14.1/libpurpl=
e/nat-pmp.h ../../pidgin-2.14.1/libpurple/network.h ../../pidgin-2.14.1/lib=
purple/notify.h ../../pidgin-2.14.1/libpurple/ntlm.h ../../pidgin-2.14.1/li=
bpurple/plugin.h ../../pidgin-2.14.1/libpurple/pluginpref.h ../../pidgin-2.=
14.1/libpurple/pounce.h ../../pidgin-2.14.1/libpurple/prefs.h ../../pidgin-=
2.14.1/libpurple/privacy.h ../../pidgin-2.14.1/libpurple/proxy.h ../../pidg=
in-2.14.1/libpurple/prpl.h ../../pidgin-2.14.1/libpurple/request.h ../../pi=
dgin-2.14.1/libpurple/roomlist.h ../../pidgin-2.14.1/libpurple/savedstatuse=
s.h ../../pidgin-2.14.1/libpurple/server.h ../../pidgin-2.14.1/libpurple/si=
gnals.h ../../pidgin-2.14.1/libpurple/smiley.h ../../pidgin-2.14.1/libpurpl=
e/dnsquery.h ../../pidgin-2.14.1/libpurple/dnssrv.h ../../pidgin-2.14.1/lib=
purple/status.h ../../pidgin-2.14.1/libpurple/stringref.h ../../pidgin-2.14=
.1/libpurple/stun.h ../../pidgin-2.14.1/libpurple/sound.h ../../pidgin-2.14=
.1/libpurple/sound-theme.h ../../pidgin-2.14.1/libpurple/sound-theme-loader=
.h ../../pidgin-2.14.1/libpurple/sslconn.h ../../pidgin-2.14.1/libpurple/th=
eme.h ../../pidgin-2.14.1/libpurple/theme-loader.h ../../pidgin-2.14.1/libp=
urple/theme-manager.h ../../pidgin-2.14.1/libpurple/upnp.h ../../pidgin-2.1=
4.1/libpurple/util.h ../../pidgin-2.14.1/libpurple/value.h ../../pidgin-2.1=
4.1/libpurple/xmlnode.h ../../pidgin-2.14.1/libpurple/whiteboard.h ../../pi=
dgin-2.14.1/libpurple/media/backend-iface.h ../../pidgin-2.14.1/libpurple/m=
edia/candidate.h ../../pidgin-2.14.1/libpurple/media/codec.h ../../pidgin-2=
.14.1/libpurple/media/enum-types.h purple.h version.h marshallers.h | pytho=
n3 ../../pidgin-2.14.1/libpurple/dbus-analyze-types.py --keyword=3Denum --v=
erbatim > purple-client-bindings.h
  cat: marshallers.h: No such file or directory
  cat: marshallers.h: No such file or directory
  cat: marshallers.h: No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...gure.ac-fix-build-with-autoconf-2.71.patch | 229 ------------------
 ...able-few-languages-not-compatible-wi.patch |  49 ----
 .../{pidgin_2.14.1.bb =3D> pidgin_2.14.2.bb}    |   6 +-
 3 files changed, 2 insertions(+), 282 deletions(-)
 delete mode 100644 meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac=
-fix-build-with-autoconf-2.71.patch
 delete mode 100644 meta-oe/recipes-support/pidgin/pidgin/0002-configure.ac=
-disable-few-languages-not-compatible-wi.patch
 rename meta-oe/recipes-support/pidgin/{pidgin_2.14.1.bb =3D> pidgin_2.14.2=
.bb} (94%)

diff --git a/meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac-fix-bu=
ild-with-autoconf-2.71.patch b/meta-oe/recipes-support/pidgin/pidgin/0001-c=
onfigure.ac-fix-build-with-autoconf-2.71.patch
deleted file mode 100644
index cfb0290f9b..0000000000
--- a/meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac-fix-build-wit=
h-autoconf-2.71.patch
+++ /dev/null
@@ -1,229 +0,0 @@
-From e03d3ef5aadd582ebf7102b7d5785fed177a0cb1 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sun, 7 Feb 2021 13:25:29 +0100
-Subject: [PATCH] configure.ac: fix build with autoconf-2.71
-
-* fixes:
-  | autoreconf: running: intltoolize --copy --force
-  | ERROR: 'IT_PROG_INTLTOOL' must appear in configure.ac for intltool to =
work.
-  | autoreconf: error: intltoolize failed with exit status: 1
-
-* replace AM_GLIB_GNU_GETTEXT with AM_GNU_GETTEXT as suggested in:
-  https://wiki.gnome.org/Initiatives/GnomeGoals/GettextMigration
-  https://blogs.gnome.org/jjardon/2010/10/08/use-upstream-gettext-instead-=
the-glib-one/
-  because the former is causing issues with autoconf-2.71:
-
-  -m4trace:configure.ac:266: -1- _m4_warn([obsolete], [The macro `AC_TRY_L=
INK' is obsolete.
-  -You should run autoupdate.], [../autoconf-2.71/lib/autoconf/general.m4:=
2920: AC_TRY_LINK is expanded from...
-  -../autoconf-2.71/lib/m4sugar/m4sh.m4:699: AS_IF is expanded from...
-  -../autoconf-2.71/lib/autoconf/headers.m4:89: _AC_CHECK_HEADER_COMPILE i=
s expanded from...
-  -../autoconf-2.71/lib/autoconf/headers.m4:56: AC_CHECK_HEADER is expande=
d from...
-  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m=
4:150: GLIB_WITH_NLS is expanded from...
-  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m=
4:370: GLIB_GNU_GETTEXT is expanded from...
-  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m=
4:470: AM_GLIB_GNU_GETTEXT is expanded from...
-  -configure.ac:266: the top level])
-  -m4trace:configure.ac:266: -1- m4_pattern_allow([^ENABLE_NLS$])
-  -m4trace:configure.ac:266: -1- _m4_warn([obsolete], [The macro `AC_OUTPU=
T_COMMANDS' is obsolete.
-  -You should run autoupdate.], [../autoconf-2.71/lib/autoconf/status.m4:1=
025: AC_OUTPUT_COMMANDS is expanded from...
-  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m=
4:150: GLIB_WITH_NLS is expanded from...
-  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m=
4:370: GLIB_GNU_GETTEXT is expanded from...
-  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m=
4:470: AM_GLIB_GNU_GETTEXT is expanded from...
-  -configure.ac:266: the top level])
-
-  and then configure fails with:
-
-  configure.ac:2621: error: `po/stamp-it' is already registered with AC_CO=
NFIG_COMMANDS.
-  autoconf-2.71/lib/autoconf/status.m4:1008: AC_CONFIG_COMMANDS is expande=
d from...
-  configure.ac:2621: the top level
-
-* add AM_GNU_GETTEXT_VERSION as well to resolve warning with autoconf-2.71
-  configure.ac: warning: AM_GNU_GETTEXT is used, but not AM_GNU_GETTEXT_VE=
RSION or AM_GNU_GETTEXT_REQUIRE_VERSION
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
-@@ -13,9 +13,6 @@ EXTRA_DIST =3D \
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
- distuninstallcheck_listfiles =3D \
- 	find . -type f -print | grep -v perl | grep -v Purple.3pm | grep -v Pidg=
in.3pm
-=20
--DISTCLEANFILES=3D intltool-extract intltool-merge intltool-update \
--			package_revision_raw.txt
-+DISTCLEANFILES=3Dpackage_revision_raw.txt
-diff --git a/configure.ac b/configure.ac
-index 81d8592..e2280cd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -43,7 +43,7 @@ fi
-=20
- AC_CANONICAL_HOST
- AC_CONFIG_HEADERS([config.h])
--AM_INIT_AUTOMAKE([1.9 -Wno-portability dist-bzip2])
-+AM_INIT_AUTOMAKE([1.9 -Wno-portability dist-bzip2 foreign])
- dnl TODO: Always use AM_SILENT_RULES when we depend on automake >=3D 1.11
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
-=20
-@@ -257,12 +257,12 @@ dnl ################################################=
#######################
- AC_ARG_ENABLE(nls, AC_HELP_STRING([--disable-nls], [disable installation =
of translation files]), enable_i18n=3D"$enableval", enable_i18n=3Dyes)
-=20
- if test x$enable_i18n =3D xyes; then
--	AC_PROG_INTLTOOL
- 	GETTEXT_PACKAGE=3Dpidgin
- 	AC_SUBST(GETTEXT_PACKAGE)
-=20
- 	ALL_LINGUAS=3D"af am ar ar_SA as ast az be@latin bg bn_IN bn br brx bs c=
a ca@valencia cs da de dz el en_AU en_CA en_GB eo es_AR es et eu fa fi fr g=
a gl gu he hi hr hu id it ja ka kk km kn ko ks ku_IQ ku lt lv mai mhr mk ml=
 mn mr ms_MY my_MM nb ne nl nn oc or pa pl ps pt_BR pt ro ru sd si sk sl sq=
 sr@latin sr sv sw ta te th tr tt uk ur uz vi xh zh_CN zh_HK zh_TW"
--	AM_GLIB_GNU_GETTEXT
-+	AM_GNU_GETTEXT([external])
-+	AM_GNU_GETTEXT_VERSION([0.21])
-=20
- 	dnl If we don't have msgfmt, then po/ is going to fail -- ensure that
- 	dnl AM_GLIB_GNU_GETTEXT found it.
-diff --git a/pidgin/Makefile.am b/pidgin/Makefile.am
-index 2278b88..4d32c53 100644
---- a/pidgin/Makefile.am
-+++ b/pidgin/Makefile.am
-@@ -192,13 +192,16 @@ DESKTOP_FILE=3Ddata/pidgin.desktop
- appsdir =3D $(datadir)/applications
- apps_in_files =3D data/pidgin.desktop.in
- apps_DATA =3D $(apps_in_files:.desktop.in=3D.desktop)
--@INTLTOOL_DESKTOP_RULE@
-+
-+data/pidgin.desktop: data/pidgin.desktop.in
-+	$(AM_V_GEN)$(MSGFMT) --desktop --template $< -d $(top_srcdir)/po -o $@
-=20
- appdatadir =3D $(datarootdir)/appdata
- appdata_DATA =3D $(appdata_in_files:.xml.in=3D.xml)
- appdata_in_files =3D data/pidgin.appdata.xml.in
-=20
--@INTLTOOL_XML_RULE@
-+data/pidgin.appdata.xml: data/pidgin.appdata.xml.in
-+	$(AM_V_GEN)$(MSGFMT) --xml --template $< -d $(top_srcdir)/po -o $@ || cp=
 $< $@
-=20
- endif # INSTALL_I18N
-=20
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
-+DOMAIN =3D $(PACKAGE)
-+
-+# These two variables depend on the location of this directory.
-+subdir =3D po
-+top_builddir =3D ..
-+
-+# These options get passed to xgettext.
-+XGETTEXT_OPTIONS =3D --keyword=3D_ --keyword=3DN_ --from-code=3DUTF-8
-+
-+# This is the copyright holder that gets inserted into the header of the
-+# $(DOMAIN).pot file.  Set this to the copyright holder of the surrounding
-+# package.  (Note that the msgstr strings, extracted from the package's
-+# sources, belong to the copyright holder of the package.)  Translators a=
re
-+# expected to transfer the copyright for their translations to this person
-+# or entity, or to disclaim their copyright.  The empty string stands for
-+# the public domain; in this case the translators are expected to disclaim
-+# their copyright.
-+COPYRIGHT_HOLDER =3D Free Software Foundation, Inc.
-+
-+# This tells whether or not to prepend "GNU " prefix to the package
-+# name that gets inserted into the header of the $(DOMAIN).pot file.
-+# Possible values are "yes", "no", or empty.  If it is empty, try to
-+# detect it automatically by scanning the files in $(top_srcdir) for
-+# "GNU packagename" string.
-+PACKAGE_GNU =3D
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
-+# It can be your email address, or a mailing list address where translato=
rs
-+# can write to without being subscribed, or the URL of a web page through
-+# which the translators can contact you.
-+MSGID_BUGS_ADDRESS =3D
-+
-+# This is the list of locale categories, beyond LC_MESSAGES, for which the
-+# message catalogs shall be used.  It is usually empty.
-+EXTRA_LOCALE_CATEGORIES =3D
-+
-+# This tells whether the $(DOMAIN).pot file contains messages with an 'ms=
gctxt'
-+# context.  Possible values are "yes" and "no".  Set this to yes if the
-+# package uses functions taking also a message context, like pgettext(), =
or
-+# if in $(XGETTEXT_OPTIONS) you define keywords with a context argument.
-+USE_MSGCTXT =3D no
-+
-+# These options get passed to msgmerge.
-+# Useful options are in particular:
-+#   --previous            to keep previous msgids of translated messages,
-+#   --quiet               to reduce the verbosity.
-+MSGMERGE_OPTIONS =3D
-+
-+# These options get passed to msginit.
-+# If you want to disable line wrapping when writing PO files, add
-+# --no-wrap to MSGMERGE_OPTIONS, XGETTEXT_OPTIONS, and
-+# MSGINIT_OPTIONS.
-+MSGINIT_OPTIONS =3D
-+
-+# This tells whether or not to regenerate a PO file when $(DOMAIN).pot
-+# has changed.  Possible values are "yes" and "no".  Set this to no if
-+# the POT file is checked in the repository and the version control
-+# program ignores timestamps.
-+PO_DEPENDS_ON_POT =3D no
-+
-+# This tells whether or not to forcibly update $(DOMAIN).pot and
-+# regenerate PO files on "make dist".  Possible values are "yes" and
-+# "no".  Set this to no if the POT file and PO files are maintained
-+# externally.
-+DIST_DEPENDS_ON_UPDATE_PO =3D no
-diff --git a/po/POTFILES.in b/po/POTFILES.in
-index a5691a1..b494bf3 100644
---- a/po/POTFILES.in
-+++ b/po/POTFILES.in
-@@ -1,4 +1,3 @@
--[encoding: UTF-8]
- finch/finch.c
- finch/gntaccount.c
- finch/gntblist.c
diff --git a/meta-oe/recipes-support/pidgin/pidgin/0002-configure.ac-disabl=
e-few-languages-not-compatible-wi.patch b/meta-oe/recipes-support/pidgin/pi=
dgin/0002-configure.ac-disable-few-languages-not-compatible-wi.patch
deleted file mode 100644
index 99c523d5d9..0000000000
--- a/meta-oe/recipes-support/pidgin/pidgin/0002-configure.ac-disable-few-l=
anguages-not-compatible-wi.patch
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
-cd ../../pidgin-2.14.1/po && rm -f brx.gmo && pidgin/2.14.1-r0/recipe-sysr=
oot-native/usr/bin/msgmerge --for-msgfmt -o brx.1po brx.po pidgin.pot && pi=
dgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --verbo=
se -o brx.gmo brx.1po && rm -f brx.1po
-cd ../../pidgin-2.14.1/po && rm -f zh_HK.gmo && pidgin/2.14.1-r0/recipe-sy=
sroot-native/usr/bin/msgmerge --for-msgfmt -o zh_HK.1po zh_HK.po pidgin.pot=
 && pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics -=
-verbose -o zh_HK.gmo zh_HK.1po && rm -f zh_HK.1po
-cd ../../pidgin-2.14.1/po && rm -f zh_TW.gmo && pidgin/2.14.1-r0/recipe-sy=
sroot-native/usr/bin/msgmerge --for-msgfmt -o zh_TW.1po zh_TW.po pidgin.pot=
 && pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics -=
-verbose -o zh_TW.gmo zh_TW.1po && rm -f zh_TW.1po
-zh_HK.1po:2790: 'msgstr' is not a valid C format string, unlike 'msgid'. R=
eason: The string refers to arguments both through absolute argument number=
s and through unnumbered argument specifications.
-pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt: found 1 fatal error
-zh_TW.1po:2790: 'msgstr' is not a valid C format string, unlike 'msgid'. R=
eason: The string refers to arguments both through absolute argument number=
s and through unnumbered argument specifications.
-pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt: found 1 fatal error
-zh_HK.1po: 3234 translated messages.
-make[3]: *** [Makefile:415: ../../pidgin-2.14.1/po/zh_HK.gmo] Error 1
-make[3]: *** Waiting for unfinished jobs....
-zh_TW.1po: 3234 translated messages.
-make[3]: *** [Makefile:415: ../../pidgin-2.14.1/po/zh_TW.gmo] Error 1
-brx.1po:778: number of format specifications in 'msgid' and 'msgstr' does =
not match
-brx.1po:3179: number of format specifications in 'msgid' and 'msgstr' does=
 not match
-brx.1po:5175: format specifications in 'msgid_plural' and 'msgstr[0]' for =
argument 1 are not the same
-brx.1po:5184: format specifications in 'msgid_plural' and 'msgstr[0]' for =
argument 1 are not the same
-brx.1po:7754: format specifications in 'msgid_plural' and 'msgstr[0]' for =
argument 1 are not the same
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
-@@ -260,7 +260,7 @@ if test x$enable_i18n =3D xyes; then
- 	GETTEXT_PACKAGE=3Dpidgin
- 	AC_SUBST(GETTEXT_PACKAGE)
-=20
--	ALL_LINGUAS=3D"af am ar ar_SA as ast az be@latin bg bn_IN bn br brx bs c=
a ca@valencia cs da de dz el en_AU en_CA en_GB eo es_AR es et eu fa fi fr g=
a gl gu he hi hr hu id it ja ka kk km kn ko ks ku_IQ ku lt lv mai mhr mk ml=
 mn mr ms_MY my_MM nb ne nl nn oc or pa pl ps pt_BR pt ro ru sd si sk sl sq=
 sr@latin sr sv sw ta te th tr tt uk ur uz vi xh zh_CN zh_HK zh_TW"
-+	ALL_LINGUAS=3D"af am ar ar_SA as ast az be@latin bg bn_IN bn br bs ca ca=
@valencia cs da de dz el en_AU en_CA en_GB eo es_AR es et eu fa fi fr ga gl=
 gu he hi hr hu id it ja ka kk km kn ko ks ku_IQ ku lt lv mai mhr mk ml mn =
mr ms_MY my_MM nb ne nl nn oc or pa pl ps pt_BR pt ro ru sd si sk sl sq sr@=
latin sr sv sw ta te th tr tt uk ur uz vi xh zh_CN"
- 	AM_GNU_GETTEXT([external])
- 	AM_GNU_GETTEXT_VERSION([0.21])
-=20
diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.14.1.bb b/meta-oe/reci=
pes-support/pidgin/pidgin_2.14.2.bb
similarity index 94%
rename from meta-oe/recipes-support/pidgin/pidgin_2.14.1.bb
rename to meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb
index d22380eb0d..ba0dca233b 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.14.1.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb
@@ -11,11 +11,9 @@ SRC_URI =3D "\
     ${SOURCEFORGE_MIRROR}/pidgin/pidgin-${PV}.tar.bz2 \
     file://sanitize-configure.ac.patch \
     file://purple-OE-branding-25.patch \
-    file://0001-configure.ac-fix-build-with-autoconf-2.71.patch \
-    file://0002-configure.ac-disable-few-languages-not-compatible-wi.patch=
 \
 "
=20
-SRC_URI[sha256sum] =3D "f132e18d551117d9e46acce29ba4f40892a86746c366999166=
a3862b51060780"
+SRC_URI[sha256sum] =3D "19654ad276b149646371fbdac21bc7620742f2975f7399fed0=
ffc1a18fbaf603"
=20
 PACKAGECONFIG ??=3D "gnutls consoleui avahi dbus idn nss \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtk startup-notifi=
cation', '', d)} \
@@ -39,9 +37,9 @@ PACKAGECONFIG[gnutls] =3D "--enable-gnutls --with-gnutls-=
includes=3D${STAGING_INCDIR
 PACKAGECONFIG[dbus] =3D "--enable-dbus,--disable-dbus,dbus dbus-glib"
 PACKAGECONFIG[avahi] =3D "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[nss] =3D "--enable-nss,--disable-nss,nss nspr,libpurple-plug=
in-ssl-nss"
+PACKAGECONFIG[cyrus-sasl] =3D "--enable-cyrus-sasl,--disable-cyrus-sasl,cy=
rus-sasl"
=20
 EXTRA_OECONF =3D " \
-    --with-python=3Dpython3 \
     --disable-perl \
     --disable-tcl \
     --disable-gevolution \
--=20
2.30.2

