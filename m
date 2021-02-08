Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.29115.1612745776154153924
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 16:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rezWgXYI;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id s5so16216783edw.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 16:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O2qoJ2e3TmObBsZTHOlfO0aLav400aAkspz4dAmkhTQ=;
        b=rezWgXYIb2d9VaQrK/lhCh4BKRDKXWr21ch3Dq9ZpeiRVc6Di9eVbsm8L/y2OulJb2
         clhvC8NZXlCXrF/vSxKhp6FYuoaIYNWQ152KdA1KM19/FNcYH4O5GOoIcguafVWYAJJt
         pSw4NvLB3Z6ICii3pYOht2o+ovx59j/tK0VW3bsSy+mKhKYXDJChogLJQyQ/XG8VxjUe
         NrZpBZlMKI/WZ8asQGICJIaPB2YP1+j4rzQ8MIEmUIZr2jLmBRMEWnC0shjtpo9XWqWd
         v3k2PmCEohIXRo0v4ItkOLPcL5b2fwGCIjY75wD3AAA8GlgHIWdBJCI4ltZ/W3FQLkDw
         Bg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O2qoJ2e3TmObBsZTHOlfO0aLav400aAkspz4dAmkhTQ=;
        b=qhlPxG6NJbqFOvN/T2Zwe3Xe7rbfzcObqSEL/LzKAIoiqUJkSjuYfgyo2AuFza8EVQ
         bibWGt2HiUUQWt7oaHe233jOfGR0Qb3IVuBJ2evXWm/cj/pjV489P3Y8Y87Mqw76S+QA
         lIuTog0pZunOmEwBBc2+jyzIHv/XZDVqAIMX/HD43s6gN+W89PJ1KO4F8Jww1t/pSXxJ
         z5y1vKkkpFpu5afQHvYfWpmAx4ajhz8zlVqGUh1y+lJsGg+esMJ/zp2x3IgEPgeiZV7H
         UZFHeNnueUgkOhd1qLWNDfyjMfLtozenmNP0iqxa/43p4JZBSci7q4qc3rQM9gVS19Pz
         RasA==
X-Gm-Message-State: AOAM533Cq+vJrluJi3p/vvaD9S2iP2n1Z5Q1LbOCspXzzWUAUmowBa10
	LahYgE/FdaJY+Ol0auTtKopiipRD5NrdSbYzDCs=
X-Google-Smtp-Source: ABdhPJxOPpviZGIIOuxnreFNxEyS4YMWoBLLiHRTTtO9uFTSK7l4bwA2FmwiusfTHcQDfoBsNaXgK+96IX3ASXMIVSg=
X-Received: by 2002:a05:6402:524a:: with SMTP id t10mr14887851edd.270.1612745774284;
 Sun, 07 Feb 2021 16:56:14 -0800 (PST)
MIME-Version: 1.0
References: <20210207144605.3784078-1-Martin.Jansa@gmail.com>
 <20210207144605.3784078-2-Martin.Jansa@gmail.com> <CAMKF1sq+fjnOLG68nVu9fdM-PHLQLEPt6aN3-DM=EucMnCxJ-A@mail.gmail.com>
In-Reply-To: <CAMKF1sq+fjnOLG68nVu9fdM-PHLQLEPt6aN3-DM=EucMnCxJ-A@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 8 Feb 2021 01:56:03 +0100
Message-ID: <CA+chaQcHDgnw2H_wEKjGNXwD5iOBLGFhbxY4KDdP40xgTJgSHg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] pidgin: upgrade to 2.14.1 and fix autoconf-2.71 compatibility
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fd459d05bac8a295"

--000000000000fd459d05bac8a295
Content-Type: text/plain; charset="UTF-8"

I think future 3.x.x version moved to meson, 2.x.x will stay on autotools,
see https://keep.imfreedom.org/pidgin/pidgin/file/release-2.x.y

I have tried only with 2.71 autotools, is it worth trying to make it
backwards compatible or can we merge this after oe-core switches to 2.71?

But the error on autobuilder is a bit surprising

| checking for gnt >= 2.14.0... no
| configure: error:
|
| Finch will not be built. You must have libgnt >= 2.14.0 development
headers installed to build.

That might be autotools independent and it built for me possibly only
because I have a bbappend for it with:

# We're only interested in the libpurple libraries and not the UI or
# any other features so we keep those things disabled here.
PACKAGECONFIG_remove = "consoleui"

EXTRA_OECONF += " \
    --enable-plugins \
    --enable-debug \
"

so it wasn't even checking for gnt.

Will check tomorrow.

On Mon, Feb 8, 2021 at 1:41 AM Khem Raj <raj.khem@gmail.com> wrote:

> pidgin 2.14.x seems to have moved to use meson, I wonder if autotools
> should be dropped perhaps ? might be worth an effort to move to meson,
> I am seeing a build failure with 2.69 autotools
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/912
>
>
> On Sun, Feb 7, 2021 at 6:46 AM Martin Jansa <Martin.Jansa@gmail.com>
> wrote:
> >
> > * also log.do_configure is showing this since switch to python3:
> >   DEBUG: Executing shell function do_configure
> >   File "<string>", line 1
> >     import sys ; print sys.version[0:3]
> >                        ^
> >   SyntaxError: invalid syntax
> >
> >   and this whole line doesn't make much sense and PY_VERSION shouldn't
> be used in configure.ac since:
> >
> >   commit 9087a59b1c3f9708642a2327b0cf6ecceac0a66f
> >   Author: Martin Jansa <Martin.Jansa@gmail.com>
> >   Date:   Thu May 5 16:58:59 2016 +0200
> >
> >     pidgin: use pkg-config instead of hardcoded paths or python-config
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  ...gure.ac-fix-build-with-autoconf-2.71.patch | 205 ++++++++++++++++++
> >  ...able-few-languages-not-compatible-wi.patch |  49 +++++
> >  .../pidgin/pidgin-cross-python-265.patch      |  42 ----
> >  .../pidgin/pidgin/use_py3.patch               |  20 --
> >  .../{pidgin_2.13.0.bb => pidgin_2.14.1.bb}    |  14 +-
> >  5 files changed, 259 insertions(+), 71 deletions(-)
> >  create mode 100644
> meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac-fix-build-with-autoconf-2.71.patch
> >  create mode 100644
> meta-oe/recipes-support/pidgin/pidgin/0002-configure.ac-disable-few-languages-not-compatible-wi.patch
> >  delete mode 100644
> meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
> >  delete mode 100644 meta-oe/recipes-support/pidgin/pidgin/use_py3.patch
> >  rename meta-oe/recipes-support/pidgin/{pidgin_2.13.0.bb =>
> pidgin_2.14.1.bb} (92%)
> >
> > diff --git
> a/meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac-fix-build-with-autoconf-2.71.patch
> b/meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac-fix-build-with-autoconf-2.71.patch
> > new file mode 100644
> > index 0000000000..1c43266a30
> > --- /dev/null
> > +++
> b/meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac-fix-build-with-autoconf-2.71.patch
> > @@ -0,0 +1,205 @@
> > +From 932a4c40ec78747d0ee073a8bdc5218de30affbe Mon Sep 17 00:00:00 2001
> > +From: Martin Jansa <Martin.Jansa@gmail.com>
> > +Date: Sun, 7 Feb 2021 13:25:29 +0100
> > +Subject: [PATCH] configure.ac: fix build with autoconf-2.71
> > +
> > +* fixes:
> > +  | autoreconf: running: intltoolize --copy --force
> > +  | ERROR: 'IT_PROG_INTLTOOL' must appear in configure.ac for intltool
> to work.
> > +  | autoreconf: error: intltoolize failed with exit status: 1
> > +
> > +* replace AM_GLIB_GNU_GETTEXT with AM_GNU_GETTEXT as suggested in:
> > +  https://wiki.gnome.org/Initiatives/GnomeGoals/GettextMigration
> > +
> https://blogs.gnome.org/jjardon/2010/10/08/use-upstream-gettext-instead-the-glib-one/
> > +  because the former is causing issues with autoconf-2.71:
> > +
> > +  -m4trace:configure.ac:266: -1- _m4_warn([obsolete], [The macro
> `AC_TRY_LINK' is obsolete.
> > +  -You should run autoupdate.],
> [../autoconf-2.71/lib/autoconf/general.m4:2920: AC_TRY_LINK is expanded
> from...
> > +  -../autoconf-2.71/lib/m4sugar/m4sh.m4:699: AS_IF is expanded from...
> > +  -../autoconf-2.71/lib/autoconf/headers.m4:89:
> _AC_CHECK_HEADER_COMPILE is expanded from...
> > +  -../autoconf-2.71/lib/autoconf/headers.m4:56: AC_CHECK_HEADER is
> expanded from...
> > +
> -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m4:150:
> GLIB_WITH_NLS is expanded from...
> > +
> -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m4:370:
> GLIB_GNU_GETTEXT is expanded from...
> > +
> -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m4:470:
> AM_GLIB_GNU_GETTEXT is expanded from...
> > +  -configure.ac:266: the top level])
> > +  -m4trace:configure.ac:266: -1- m4_pattern_allow([^ENABLE_NLS$])
> > +  -m4trace:configure.ac:266: -1- _m4_warn([obsolete], [The macro
> `AC_OUTPUT_COMMANDS' is obsolete.
> > +  -You should run autoupdate.],
> [../autoconf-2.71/lib/autoconf/status.m4:1025: AC_OUTPUT_COMMANDS is
> expanded from...
> > +
> -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m4:150:
> GLIB_WITH_NLS is expanded from...
> > +
> -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m4:370:
> GLIB_GNU_GETTEXT is expanded from...
> > +
> -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettext.m4:470:
> AM_GLIB_GNU_GETTEXT is expanded from...
> > +  -configure.ac:266: the top level])
> > +
> > +  and then configure fails with:
> > +
> > +  configure.ac:2621: error: `po/stamp-it' is already registered with
> AC_CONFIG_COMMANDS.
> > +  autoconf-2.71/lib/autoconf/status.m4:1008: AC_CONFIG_COMMANDS is
> expanded from...
> > +  configure.ac:2621: the top level
> > +
> > +* add AM_GNU_GETTEXT_VERSION as well to resolve warning with
> autoconf-2.71
> > +  configure.ac: warning: AM_GNU_GETTEXT is used, but not
> AM_GNU_GETTEXT_VERSION or AM_GNU_GETTEXT_REQUIRE_VERSION
> > +
> > +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > +---
> > + ABOUT-NLS      |  1 +
> > + Makefile.am    |  6 +---
> > + configure.ac   |  6 ++--
> > + po/Makevars    | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++
> > + po/POTFILES.in |  1 -
> > + 5 files changed, 87 insertions(+), 9 deletions(-)
> > + create mode 100644 ABOUT-NLS
> > + create mode 100644 po/Makevars
> > +
> > +diff --git a/ABOUT-NLS b/ABOUT-NLS
> > +new file mode 100644
> > +index 0000000..0a9d56d
> > +--- /dev/null
> > ++++ b/ABOUT-NLS
> > +@@ -0,0 +1 @@
> > ++<https://www.gnu.org/software/gettext/manual/html_node/Users.html>
> > +diff --git a/Makefile.am b/Makefile.am
> > +index f8e2bc9..a74145f 100644
> > +--- a/Makefile.am
> > ++++ b/Makefile.am
> > +@@ -13,9 +13,6 @@ EXTRA_DIST = \
> > +               fix-casts.sh \
> > +               gaim.pc.in \
> > +               gaim-uninstalled.pc.in \
> > +-              intltool-extract.in \
> > +-              intltool-merge.in \
> > +-              intltool-update.in \
> > +               package_revision.h \
> > +               pidgin.apspec.in \
> > +               pidgin.spec.in \
> > +@@ -139,5 +136,4 @@ endif
> > + distuninstallcheck_listfiles = \
> > +       find . -type f -print | grep -v perl | grep -v Purple.3pm | grep
> -v Pidgin.3pm
> > +
> > +-DISTCLEANFILES= intltool-extract intltool-merge intltool-update \
> > +-                      package_revision_raw.txt
> > ++DISTCLEANFILES=package_revision_raw.txt
> > +diff --git a/configure.ac b/configure.ac
> > +index 81d8592..e2280cd 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -43,7 +43,7 @@ fi
> > +
> > + AC_CANONICAL_HOST
> > + AC_CONFIG_HEADERS([config.h])
> > +-AM_INIT_AUTOMAKE([1.9 -Wno-portability dist-bzip2])
> > ++AM_INIT_AUTOMAKE([1.9 -Wno-portability dist-bzip2 foreign])
> > + dnl TODO: Always use AM_SILENT_RULES when we depend on automake >= 1.11
> > + m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
> > +
> > +@@ -257,12 +257,12 @@ dnl
> #######################################################################
> > + AC_ARG_ENABLE(nls, AC_HELP_STRING([--disable-nls], [disable
> installation of translation files]), enable_i18n="$enableval",
> enable_i18n=yes)
> > +
> > + if test x$enable_i18n = xyes; then
> > +-      AC_PROG_INTLTOOL
> > +       GETTEXT_PACKAGE=pidgin
> > +       AC_SUBST(GETTEXT_PACKAGE)
> > +
> > +       ALL_LINGUAS="af am ar ar_SA as ast az be@latin bg bn_IN bn br
> brx bs ca ca@valencia cs da de dz el en_AU en_CA en_GB eo es_AR es et eu
> fa fi fr ga gl gu he hi hr hu id it ja ka kk km kn ko ks ku_IQ ku lt lv mai
> mhr mk ml mn mr ms_MY my_MM nb ne nl nn oc or pa pl ps pt_BR pt ro ru sd si
> sk sl sq sr@latin sr sv sw ta te th tr tt uk ur uz vi xh zh_CN zh_HK
> zh_TW"
> > +-      AM_GLIB_GNU_GETTEXT
> > ++      AM_GNU_GETTEXT([external])
> > ++      AM_GNU_GETTEXT_VERSION([0.21])
> > +
> > +       dnl If we don't have msgfmt, then po/ is going to fail -- ensure
> that
> > +       dnl AM_GLIB_GNU_GETTEXT found it.
> > +diff --git a/po/Makevars b/po/Makevars
> > +new file mode 100644
> > +index 0000000..0c1178d
> > +--- /dev/null
> > ++++ b/po/Makevars
> > +@@ -0,0 +1,82 @@
> > ++# Makefile variables for PO directory in any package using GNU gettext.
> > ++#
> > ++# Copyright (C) 2003-2019 Free Software Foundation, Inc.
> > ++# This file is free software; the Free Software Foundation gives
> > ++# unlimited permission to use, copy, distribute, and modify it.
> > ++
> > ++# Usually the message domain is the same as the package name.
> > ++DOMAIN = $(PACKAGE)
> > ++
> > ++# These two variables depend on the location of this directory.
> > ++subdir = po
> > ++top_builddir = ..
> > ++
> > ++# These options get passed to xgettext.
> > ++XGETTEXT_OPTIONS = --keyword=_ --keyword=N_ --from-code=UTF-8
> > ++
> > ++# This is the copyright holder that gets inserted into the header of
> the
> > ++# $(DOMAIN).pot file.  Set this to the copyright holder of the
> surrounding
> > ++# package.  (Note that the msgstr strings, extracted from the package's
> > ++# sources, belong to the copyright holder of the package.)
> Translators are
> > ++# expected to transfer the copyright for their translations to this
> person
> > ++# or entity, or to disclaim their copyright.  The empty string stands
> for
> > ++# the public domain; in this case the translators are expected to
> disclaim
> > ++# their copyright.
> > ++COPYRIGHT_HOLDER = Free Software Foundation, Inc.
> > ++
> > ++# This tells whether or not to prepend "GNU " prefix to the package
> > ++# name that gets inserted into the header of the $(DOMAIN).pot file.
> > ++# Possible values are "yes", "no", or empty.  If it is empty, try to
> > ++# detect it automatically by scanning the files in $(top_srcdir) for
> > ++# "GNU packagename" string.
> > ++PACKAGE_GNU =
> > ++
> > ++# This is the email address or URL to which the translators shall
> report
> > ++# bugs in the untranslated strings:
> > ++# - Strings which are not entire sentences, see the maintainer
> guidelines
> > ++#   in the GNU gettext documentation, section 'Preparing Strings'.
> > ++# - Strings which use unclear terms or require additional context to be
> > ++#   understood.
> > ++# - Strings which make invalid assumptions about notation of date,
> time or
> > ++#   money.
> > ++# - Pluralisation problems.
> > ++# - Incorrect English spelling.
> > ++# - Incorrect formatting.
> > ++# It can be your email address, or a mailing list address where
> translators
> > ++# can write to without being subscribed, or the URL of a web page
> through
> > ++# which the translators can contact you.
> > ++MSGID_BUGS_ADDRESS =
> > ++
> > ++# This is the list of locale categories, beyond LC_MESSAGES, for which
> the
> > ++# message catalogs shall be used.  It is usually empty.
> > ++EXTRA_LOCALE_CATEGORIES =
> > ++
> > ++# This tells whether the $(DOMAIN).pot file contains messages with an
> 'msgctxt'
> > ++# context.  Possible values are "yes" and "no".  Set this to yes if the
> > ++# package uses functions taking also a message context, like
> pgettext(), or
> > ++# if in $(XGETTEXT_OPTIONS) you define keywords with a context
> argument.
> > ++USE_MSGCTXT = no
> > ++
> > ++# These options get passed to msgmerge.
> > ++# Useful options are in particular:
> > ++#   --previous            to keep previous msgids of translated
> messages,
> > ++#   --quiet               to reduce the verbosity.
> > ++MSGMERGE_OPTIONS =
> > ++
> > ++# These options get passed to msginit.
> > ++# If you want to disable line wrapping when writing PO files, add
> > ++# --no-wrap to MSGMERGE_OPTIONS, XGETTEXT_OPTIONS, and
> > ++# MSGINIT_OPTIONS.
> > ++MSGINIT_OPTIONS =
> > ++
> > ++# This tells whether or not to regenerate a PO file when $(DOMAIN).pot
> > ++# has changed.  Possible values are "yes" and "no".  Set this to no if
> > ++# the POT file is checked in the repository and the version control
> > ++# program ignores timestamps.
> > ++PO_DEPENDS_ON_POT = no
> > ++
> > ++# This tells whether or not to forcibly update $(DOMAIN).pot and
> > ++# regenerate PO files on "make dist".  Possible values are "yes" and
> > ++# "no".  Set this to no if the POT file and PO files are maintained
> > ++# externally.
> > ++DIST_DEPENDS_ON_UPDATE_PO = no
> > +diff --git a/po/POTFILES.in b/po/POTFILES.in
> > +index a5691a1..b494bf3 100644
> > +--- a/po/POTFILES.in
> > ++++ b/po/POTFILES.in
> > +@@ -1,4 +1,3 @@
> > +-[encoding: UTF-8]
> > + finch/finch.c
> > + finch/gntaccount.c
> > + finch/gntblist.c
> > diff --git
> a/meta-oe/recipes-support/pidgin/pidgin/0002-configure.ac-disable-few-languages-not-compatible-wi.patch
> b/meta-oe/recipes-support/pidgin/pidgin/0002-configure.ac-disable-few-languages-not-compatible-wi.patch
> > new file mode 100644
> > index 0000000000..e8793b2bdd
> > --- /dev/null
> > +++
> b/meta-oe/recipes-support/pidgin/pidgin/0002-configure.ac-disable-few-languages-not-compatible-wi.patch
> > @@ -0,0 +1,49 @@
> > +From e27dd5cf8f737c6ec6c05795966099796f63873e Mon Sep 17 00:00:00 2001
> > +From: Martin Jansa <Martin.Jansa@gmail.com>
> > +Date: Sun, 7 Feb 2021 14:35:14 +0000
> > +Subject: [PATCH] configure.ac: disable few languages not compatible
> with
> > + modern gettext
> > +
> > +* as pidgin-3 development is moving to meson and probably
> > +  most of these changes won't be applicable there, lets just
> > +  disable them until someone interested steps-up to maintain it
> > +
> > +* these 3 fail with:
> > +cd ../../pidgin-2.14.1/po && rm -f brx.gmo &&
> pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o
> brx.1po brx.po pidgin.pot &&
> pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics
> --verbose -o brx.gmo brx.1po && rm -f brx.1po
> > +cd ../../pidgin-2.14.1/po && rm -f zh_HK.gmo &&
> pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o
> zh_HK.1po zh_HK.po pidgin.pot &&
> pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics
> --verbose -o zh_HK.gmo zh_HK.1po && rm -f zh_HK.1po
> > +cd ../../pidgin-2.14.1/po && rm -f zh_TW.gmo &&
> pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o
> zh_TW.1po zh_TW.po pidgin.pot &&
> pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics
> --verbose -o zh_TW.gmo zh_TW.1po && rm -f zh_TW.1po
> > +zh_HK.1po:2790: 'msgstr' is not a valid C format string, unlike
> 'msgid'. Reason: The string refers to arguments both through absolute
> argument numbers and through unnumbered argument specifications.
> > +pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt: found 1 fatal
> error
> > +zh_TW.1po:2790: 'msgstr' is not a valid C format string, unlike
> 'msgid'. Reason: The string refers to arguments both through absolute
> argument numbers and through unnumbered argument specifications.
> > +pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt: found 1 fatal
> error
> > +zh_HK.1po: 3234 translated messages.
> > +make[3]: *** [Makefile:415: ../../pidgin-2.14.1/po/zh_HK.gmo] Error 1
> > +make[3]: *** Waiting for unfinished jobs....
> > +zh_TW.1po: 3234 translated messages.
> > +make[3]: *** [Makefile:415: ../../pidgin-2.14.1/po/zh_TW.gmo] Error 1
> > +brx.1po:778: number of format specifications in 'msgid' and 'msgstr'
> does not match
> > +brx.1po:3179: number of format specifications in 'msgid' and 'msgstr'
> does not match
> > +brx.1po:5175: format specifications in 'msgid_plural' and 'msgstr[0]'
> for argument 1 are not the same
> > +brx.1po:5184: format specifications in 'msgid_plural' and 'msgstr[0]'
> for argument 1 are not the same
> > +brx.1po:7754: format specifications in 'msgid_plural' and 'msgstr[0]'
> for argument 1 are not the same
> > +pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt: found 8 fatal
> errors
> > +brx.1po: 3246 translated messages.
> > +
> > +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > +---
> > + configure.ac | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index e2280cd..9332932 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -260,7 +260,7 @@ if test x$enable_i18n = xyes; then
> > +       GETTEXT_PACKAGE=pidgin
> > +       AC_SUBST(GETTEXT_PACKAGE)
> > +
> > +-      ALL_LINGUAS="af am ar ar_SA as ast az be@latin bg bn_IN bn br
> brx bs ca ca@valencia cs da de dz el en_AU en_CA en_GB eo es_AR es et eu
> fa fi fr ga gl gu he hi hr hu id it ja ka kk km kn ko ks ku_IQ ku lt lv mai
> mhr mk ml mn mr ms_MY my_MM nb ne nl nn oc or pa pl ps pt_BR pt ro ru sd si
> sk sl sq sr@latin sr sv sw ta te th tr tt uk ur uz vi xh zh_CN zh_HK
> zh_TW"
> > ++      ALL_LINGUAS="af am ar ar_SA as ast az be@latin bg bn_IN bn br
> bs ca ca@valencia cs da de dz el en_AU en_CA en_GB eo es_AR es et eu fa
> fi fr ga gl gu he hi hr hu id it ja ka kk km kn ko ks ku_IQ ku lt lv mai
> mhr mk ml mn mr ms_MY my_MM nb ne nl nn oc or pa pl ps pt_BR pt ro ru sd si
> sk sl sq sr@latin sr sv sw ta te th tr tt uk ur uz vi xh zh_CN"
> > +       AM_GNU_GETTEXT([external])
> > +       AM_GNU_GETTEXT_VERSION([0.21])
> > +
> > diff --git
> a/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
> b/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
> > deleted file mode 100644
> > index 312fc8593f..0000000000
> > --- a/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
> > +++ /dev/null
> > @@ -1,42 +0,0 @@
> > -From 855cc20bafa30597ae7a62f7672d42654b25cde0 Mon Sep 17 00:00:00 2001
> > -From: Herrie <github.com@herrie.org>
> > -Date: Mon, 24 Jul 2017 21:30:16 +0200
> > -Subject: [PATCH] Use pkg-config instead of ${PYTHON}-config to find
> python
> > -
> > ----
> > - configure.ac | 21 ++++++++-------------
> > - 1 file changed, 8 insertions(+), 13 deletions(-)
> > -
> > -diff --git a/configure.ac b/configure.ac
> > -index d20a18e..c741829 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -1567,20 +1567,15 @@ AM_CONDITIONAL(ENABLE_DBUS, test
> "x$enable_dbus" = "xyes")
> > - dnl Check for Python headers (currently useful only for libgnt)
> > - dnl (Thanks to XChat)
> > - if test "x$enable_consoleui" = "xyes" -a ! -z "$PYTHON" -a x"$PYTHON"
> != x"no" ; then
> > --      AC_MSG_CHECKING(for Python compile flags)
> > --      if test -f ${PYTHON}-config; then
> > --              PY_CFLAGS=`${PYTHON}-config --includes`
> > --              PY_LIBS=`${PYTHON}-config --libs`
> > --              AC_DEFINE(USE_PYTHON, [1], [Define if python headers are
> available.])
> > --              AC_MSG_RESULT(ok)
> > --      else
> > --              AC_MSG_RESULT([Cannot find ${PYTHON}-config])
> > --              PY_CFLAGS=""
> > --              PY_LIBS=""
> > --      fi
> > -+        AC_MSG_CHECKING(for Python compile flags)
> > -+        PKG_CHECK_MODULES(PY, python, [
> > -+                AC_SUBST(PY_CFLAGS)
> > -+                AC_SUBST(PY_LIBS)
> > -+        ], [
> > -+                AC_MSG_RESULT(no)
> > -+                AC_MSG_ERROR([Can't find python])
> > -+        ])
> > - fi
> > --AC_SUBST(PY_CFLAGS)
> > --AC_SUBST(PY_LIBS)
> > -
> > - dnl
> #######################################################################
> > - dnl # Check for Mono support
> > diff --git a/meta-oe/recipes-support/pidgin/pidgin/use_py3.patch
> b/meta-oe/recipes-support/pidgin/pidgin/use_py3.patch
> > deleted file mode 100644
> > index c7b4163cb5..0000000000
> > --- a/meta-oe/recipes-support/pidgin/pidgin/use_py3.patch
> > +++ /dev/null
> > @@ -1,20 +0,0 @@
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -1488,7 +1488,7 @@ AC_ARG_WITH([python],
> > -
> > - if test "x$enable_dbus" = "xyes" || test "x$enable_consoleui" = "xyes"
> ; then
> > -       if test -z "$PYTHON" -o "x$PYTHON" = "xyes"; then
> > --              AC_PATH_PROG([PYTHON], [python], [no])
> > -+              AC_PATH_PROG([PYTHON], [python3], [no])
> > -       fi
> > -
> > -       if test x"$PYTHON" = x"no" ; then
> > -@@ -1568,7 +1568,7 @@ dnl Check for Python headers (currently
> > - dnl (Thanks to XChat)
> > - if test "x$enable_consoleui" = "xyes" -a ! -z "$PYTHON" -a x"$PYTHON"
> != x"no" ; then
> > -         AC_MSG_CHECKING(for Python compile flags)
> > --        PKG_CHECK_MODULES(PY, python, [
> > -+        PKG_CHECK_MODULES(PY, python3, [
> > -                 AC_SUBST(PY_CFLAGS)
> > -                 AC_SUBST(PY_LIBS)
> > -         ], [
> > diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb
> b/meta-oe/recipes-support/pidgin/pidgin_2.14.1.bb
> > similarity index 92%
> > rename from meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb
> > rename to meta-oe/recipes-support/pidgin/pidgin_2.14.1.bb
> > index fdc79e81b2..9a90f36322 100644
> > --- a/meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb
> > +++ b/meta-oe/recipes-support/pidgin/pidgin_2.14.1.bb
> > @@ -1,4 +1,5 @@
> >  SUMMARY = "multi-protocol instant messaging client"
> > +
> >  SECTION = "x11/network"
> >  LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> > @@ -10,12 +11,11 @@ SRC_URI = "\
> >      ${SOURCEFORGE_MIRROR}/pidgin/pidgin-${PV}.tar.bz2 \
> >      file://sanitize-configure.ac.patch \
> >      file://purple-OE-branding-25.patch \
> > -    file://pidgin-cross-python-265.patch \
> > -    file://use_py3.patch \
> > +    file://0001-configure.ac-fix-build-with-autoconf-2.71.patch \
> > +
> file://0002-configure.ac-disable-few-languages-not-compatible-wi.patch \
> >  "
> >
> > -SRC_URI[md5sum] = "423403494fe1951e47cc75231f743bb0"
> > -SRC_URI[sha256sum] =
> "2747150c6f711146bddd333c496870bfd55058bab22ffb7e4eb784018ec46d8f"
> > +SRC_URI[sha256sum] =
> "f132e18d551117d9e46acce29ba4f40892a86746c366999166a3862b51060780"
> >
> >  PACKAGECONFIG ??= "gnutls consoleui avahi dbus idn nss \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtk
> startup-notification', '', d)} \
> > @@ -41,6 +41,7 @@ PACKAGECONFIG[avahi] =
> "--enable-avahi,--disable-avahi,avahi"
> >  PACKAGECONFIG[nss] = "--enable-nss,--disable-nss,nss
> nspr,libpurple-plugin-ssl-nss"
> >
> >  EXTRA_OECONF = " \
> > +    --with-python=python3 \
> >      --disable-perl \
> >      --disable-tcl \
> >      --disable-gevolution \
> > @@ -51,11 +52,6 @@ EXTRA_OECONF = " \
> >      --disable-screensaver \
> >  "
> >
> > -do_configure_prepend() {
> > -    touch ${S}/po/Makefile
> > -    sed -i "s#PY_VERSION=`$PYTHON -c 'import sys ; print
> sys.version[0:3]'`#PY_VERSION=${PYTHON_BASEVERSION}#g" ${S}/configure.ac
> > -}
> > -
> >  OE_LT_RPATH_ALLOW=":${libdir}/purple-2:"
> >  OE_LT_RPATH_ALLOW[export]="1"
> >
> > --
> > 2.27.0
> >
> >
> > 
> >
>

--000000000000fd459d05bac8a295
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think future 3.x.x version moved to meson, 2.x.x will st=
ay on autotools, see=C2=A0<a href=3D"https://keep.imfreedom.org/pidgin/pidg=
in/file/release-2.x.y">https://keep.imfreedom.org/pidgin/pidgin/file/releas=
e-2.x.y</a><div><br></div><div>I have tried only with 2.71 autotools, is it=
 worth trying to make it backwards compatible or can we merge this after oe=
-core switches to 2.71?</div><div><br></div><div>But the error on autobuild=
er is a bit surprising</div><div><br></div><div>| checking for gnt &gt;=3D =
2.14.0... no<br>| configure: error:<br>|<br>| Finch will not be built. You =
must have libgnt &gt;=3D 2.14.0 development headers installed to build.<br>=
</div><div><br></div><div>That might be autotools independent and it built =
for me possibly only because I have a bbappend for it with:</div><div><br><=
/div><div># We&#39;re only interested in the libpurple libraries and not th=
e UI or<br># any other features so we keep those things disabled here.<br>P=
ACKAGECONFIG_remove =3D &quot;consoleui&quot;<br><br>EXTRA_OECONF +=3D &quo=
t; \<br>=C2=A0 =C2=A0 --enable-plugins \<br>=C2=A0 =C2=A0 --enable-debug \<=
br>&quot;<br></div><div><br></div><div>so it wasn&#39;t even checking for g=
nt.</div><div><br></div><div>Will check tomorrow.</div></div><br><div class=
=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 8, 2021=
 at 1:41 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">pidgin 2.14.x seems to have moved to use meson, I wonder if autotools=
<br>
should be dropped perhaps ? might be worth an effort to move to meson,<br>
I am seeing a build failure with 2.69 autotools<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/88/buil=
ds/912" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/88/builds/912</a><br>
<br>
<br>
On Sun, Feb 7, 2021 at 6:46 AM Martin Jansa &lt;<a href=3D"mailto:Martin.J=
ansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; * also log.do_configure is showing this since switch to python3:<br>
&gt;=C2=A0 =C2=A0DEBUG: Executing shell function do_configure<br>
&gt;=C2=A0 =C2=A0File &quot;&lt;string&gt;&quot;, line 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0import sys ; print sys.version[0:3]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 ^<br>
&gt;=C2=A0 =C2=A0SyntaxError: invalid syntax<br>
&gt;<br>
&gt;=C2=A0 =C2=A0and this whole line doesn&#39;t make much sense and PY_VE=
RSION shouldn&#39;t be used in <a href=3D"http://configure.ac" rel=3D"noref=
errer" target=3D"_blank">configure.ac</a> since:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0commit 9087a59b1c3f9708642a2327b0cf6ecceac0a66f<br>
&gt;=C2=A0 =C2=A0Author: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@g=
mail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0Date:=C2=A0 =C2=A0Thu May 5 16:58:59 2016 +0200<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0pidgin: use pkg-config instead of hardcoded paths =
or python-config<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...gure.ac-fix-build-with-autoconf-2.71.patch | 205 +++++++++++=
+++++++<br>
&gt;=C2=A0 ...able-few-languages-not-compatible-wi.patch |=C2=A0 49 +++++<=
br>
&gt;=C2=A0 .../pidgin/pidgin-cross-python-265.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 42 ----<br>
&gt;=C2=A0 .../pidgin/pidgin/use_py3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 20 --<br>
&gt;=C2=A0 .../{<a href=3D"http://pidgin_2.13.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">pidgin_2.13.0.bb</a> =3D&gt; <a href=3D"http://pidgin_2.14.1=
.bb" rel=3D"noreferrer" target=3D"_blank">pidgin_2.14.1.bb</a>}=C2=A0 =C2=
=A0 |=C2=A0 14 +-<br>
&gt;=C2=A0 5 files changed, 259 insertions(+), 71 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/pidgin/pidgin/0001-c=
onfigure.ac-fix-build-with-autoconf-2.71.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-support/pidgin/pidgin/0002-c=
onfigure.ac-disable-few-languages-not-compatible-wi.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-support/pidgin/pidgin/pidgin=
-cross-python-265.patch<br>
&gt;=C2=A0 delete mode 100644 meta-oe/recipes-support/pidgin/pidgin/use_py=
3.patch<br>
&gt;=C2=A0 rename meta-oe/recipes-support/pidgin/{<a href=3D"http://pidgin=
_2.13.0.bb" rel=3D"noreferrer" target=3D"_blank">pidgin_2.13.0.bb</a> =3D&g=
t; <a href=3D"http://pidgin_2.14.1.bb" rel=3D"noreferrer" target=3D"_blank"=
>pidgin_2.14.1.bb</a>} (92%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac-=
fix-build-with-autoconf-2.71.patch b/meta-oe/recipes-support/pidgin/pidgin/=
0001-configure.ac-fix-build-with-autoconf-2.71.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1c43266a30<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac-fix-bui=
ld-with-autoconf-2.71.patch<br>
&gt; @@ -0,0 +1,205 @@<br>
&gt; +From 932a4c40ec78747d0ee073a8bdc5218de30affbe Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" tar=
get=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; +Date: Sun, 7 Feb 2021 13:25:29 +0100<br>
&gt; +Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" =
target=3D"_blank">configure.ac</a>: fix build with autoconf-2.71<br>
&gt; +<br>
&gt; +* fixes:<br>
&gt; +=C2=A0 | autoreconf: running: intltoolize --copy --force<br>
&gt; +=C2=A0 | ERROR: &#39;IT_PROG_INTLTOOL&#39; must appear in <a href=3D=
"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a>=
 for intltool to work.<br>
&gt; +=C2=A0 | autoreconf: error: intltoolize failed with exit status: 1<b=
r>
&gt; +<br>
&gt; +* replace AM_GLIB_GNU_GETTEXT with AM_GNU_GETTEXT as suggested in:<b=
r>
&gt; +=C2=A0 <a href=3D"https://wiki.gnome.org/Initiatives/GnomeGoals/Gett=
extMigration" rel=3D"noreferrer" target=3D"_blank">https://wiki.gnome.org/I=
nitiatives/GnomeGoals/GettextMigration</a><br>
&gt; +=C2=A0 <a href=3D"https://blogs.gnome.org/jjardon/2010/10/08/use-ups=
tream-gettext-instead-the-glib-one/" rel=3D"noreferrer" target=3D"_blank">h=
ttps://blogs.gnome.org/jjardon/2010/10/08/use-upstream-gettext-instead-the-=
glib-one/</a><br>
&gt; +=C2=A0 because the former is causing issues with autoconf-2.71:<br>
&gt; +<br>
&gt; +=C2=A0 -m4trace:<a href=3D"http://configure.ac:266" rel=3D"noreferre=
r" target=3D"_blank">configure.ac:266</a>: -1- _m4_warn([obsolete], [The ma=
cro `AC_TRY_LINK&#39; is obsolete.<br>
&gt; +=C2=A0 -You should run autoupdate.], [../autoconf-2.71/lib/autoconf/=
general.m4:2920: AC_TRY_LINK is expanded from...<br>
&gt; +=C2=A0 -../autoconf-2.71/lib/m4sugar/m4sh.m4:699: AS_IF is expanded =
from...<br>
&gt; +=C2=A0 -../autoconf-2.71/lib/autoconf/headers.m4:89: _AC_CHECK_HEADE=
R_COMPILE is expanded from...<br>
&gt; +=C2=A0 -../autoconf-2.71/lib/autoconf/headers.m4:56: AC_CHECK_HEADER=
 is expanded from...<br>
&gt; +=C2=A0 -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/gli=
b-gettext.m4:150: GLIB_WITH_NLS is expanded from...<br>
&gt; +=C2=A0 -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/gli=
b-gettext.m4:370: GLIB_GNU_GETTEXT is expanded from...<br>
&gt; +=C2=A0 -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/gli=
b-gettext.m4:470: AM_GLIB_GNU_GETTEXT is expanded from...<br>
&gt; +=C2=A0 -<a href=3D"http://configure.ac:266" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac:266</a>: the top level])<br>
&gt; +=C2=A0 -m4trace:<a href=3D"http://configure.ac:266" rel=3D"noreferre=
r" target=3D"_blank">configure.ac:266</a>: -1- m4_pattern_allow([^ENABLE_NL=
S$])<br>
&gt; +=C2=A0 -m4trace:<a href=3D"http://configure.ac:266" rel=3D"noreferre=
r" target=3D"_blank">configure.ac:266</a>: -1- _m4_warn([obsolete], [The ma=
cro `AC_OUTPUT_COMMANDS&#39; is obsolete.<br>
&gt; +=C2=A0 -You should run autoupdate.], [../autoconf-2.71/lib/autoconf/=
status.m4:1025: AC_OUTPUT_COMMANDS is expanded from...<br>
&gt; +=C2=A0 -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/gli=
b-gettext.m4:150: GLIB_WITH_NLS is expanded from...<br>
&gt; +=C2=A0 -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/gli=
b-gettext.m4:370: GLIB_GNU_GETTEXT is expanded from...<br>
&gt; +=C2=A0 -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/gli=
b-gettext.m4:470: AM_GLIB_GNU_GETTEXT is expanded from...<br>
&gt; +=C2=A0 -<a href=3D"http://configure.ac:266" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac:266</a>: the top level])<br>
&gt; +<br>
&gt; +=C2=A0 and then configure fails with:<br>
&gt; +<br>
&gt; +=C2=A0 <a href=3D"http://configure.ac:2621" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac:2621</a>: error: `po/stamp-it&#39; is already reg=
istered with AC_CONFIG_COMMANDS.<br>
&gt; +=C2=A0 autoconf-2.71/lib/autoconf/status.m4:1008: AC_CONFIG_COMMANDS=
 is expanded from...<br>
&gt; +=C2=A0 <a href=3D"http://configure.ac:2621" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac:2621</a>: the top level<br>
&gt; +<br>
&gt; +* add AM_GNU_GETTEXT_VERSION as well to resolve warning with autocon=
f-2.71<br>
&gt; +=C2=A0 <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a>: warning: AM_GNU_GETTEXT is used, but not AM_GNU_G=
ETTEXT_VERSION or AM_GNU_GETTEXT_REQUIRE_VERSION<br>
&gt; +<br>
&gt; +Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail=
.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + ABOUT-NLS=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; + Makefile.am=C2=A0 =C2=A0 |=C2=A0 6 +---<br>
&gt; + <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank=
">configure.ac</a>=C2=A0 =C2=A0|=C2=A0 6 ++--<br>
&gt; + po/Makevars=C2=A0 =C2=A0 | 82 +++++++++++++++++++++++++++++++++++++=
+++++++++++++<br>
&gt; + po/POTFILES.in |=C2=A0 1 -<br>
&gt; + 5 files changed, 87 insertions(+), 9 deletions(-)<br>
&gt; + create mode 100644 ABOUT-NLS<br>
&gt; + create mode 100644 po/Makevars<br>
&gt; +<br>
&gt; +diff --git a/ABOUT-NLS b/ABOUT-NLS<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000..0a9d56d<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/ABOUT-NLS<br>
&gt; +@@ -0,0 +1 @@<br>
&gt; ++&lt;<a href=3D"https://www.gnu.org/software/gettext/manual/html_nod=
e/Users.html" rel=3D"noreferrer" target=3D"_blank">https://www.gnu.org/soft=
ware/gettext/manual/html_node/Users.html</a>&gt;<br>
&gt; +diff --git a/Makefile.am b/Makefile.am<br>
&gt; +index f8e2bc9..a74145f 100644<br>
&gt; +--- a/Makefile.am<br>
&gt; ++++ b/Makefile.am<br>
&gt; +@@ -13,9 +13,6 @@ EXTRA_DIST =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fix-casts.sh =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"ht=
tp://gaim.pc.in" rel=3D"noreferrer" target=3D"_blank">gaim.pc.in</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"ht=
tp://gaim-uninstalled.pc.in" rel=3D"noreferrer" target=3D"_blank">gaim-unin=
stalled.pc.in</a> \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://=
intltool-extract.in" rel=3D"noreferrer" target=3D"_blank">intltool-extract.=
in</a> \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://=
intltool-merge.in" rel=3D"noreferrer" target=3D"_blank">intltool-merge.in</=
a> \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://=
intltool-update.in" rel=3D"noreferrer" target=3D"_blank">intltool-update.in=
</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0package_revis=
ion.h \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"ht=
tp://pidgin.apspec.in" rel=3D"noreferrer" target=3D"_blank">pidgin.apspec.i=
n</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"ht=
tp://pidgin.spec.in" rel=3D"noreferrer" target=3D"_blank">pidgin.spec.in</a=
> \<br>
&gt; +@@ -139,5 +136,4 @@ endif<br>
&gt; + distuninstallcheck_listfiles =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0find . -type f -print | grep -v perl | gr=
ep -v Purple.3pm | grep -v Pidgin.3pm<br>
&gt; +<br>
&gt; +-DISTCLEANFILES=3D intltool-extract intltool-merge intltool-update \=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 package_revision_raw.txt<br>
&gt; ++DISTCLEANFILES=3Dpackage_revision_raw.txt<br>
&gt; +diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targ=
et=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nor=
eferrer" target=3D"_blank">configure.ac</a><br>
&gt; +index 81d8592..e2280cd 100644<br>
&gt; +--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
&gt; ++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
&gt; +@@ -43,7 +43,7 @@ fi<br>
&gt; +<br>
&gt; + AC_CANONICAL_HOST<br>
&gt; + AC_CONFIG_HEADERS([config.h])<br>
&gt; +-AM_INIT_AUTOMAKE([1.9 -Wno-portability dist-bzip2])<br>
&gt; ++AM_INIT_AUTOMAKE([1.9 -Wno-portability dist-bzip2 foreign])<br>
&gt; + dnl TODO: Always use AM_SILENT_RULES when we depend on automake &gt=
;=3D 1.11<br>
&gt; + m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])<br>
&gt; +<br>
&gt; +@@ -257,12 +257,12 @@ dnl ##########################################=
#############################<br>
&gt; + AC_ARG_ENABLE(nls, AC_HELP_STRING([--disable-nls], [disable install=
ation of translation files]), enable_i18n=3D&quot;$enableval&quot;, enable_=
i18n=3Dyes)<br>
&gt; +<br>
&gt; + if test x$enable_i18n =3D xyes; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 AC_PROG_INTLTOOL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0GETTEXT_PACKAGE=3Dpidgin<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_SUBST(GETTEXT_PACKAGE)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ALL_LINGUAS=3D&quot;af am ar ar_SA as ast=
 az be@latin bg bn_IN bn br brx bs ca ca@valencia cs da de dz el en_AU en_C=
A en_GB eo es_AR es et eu fa fi fr ga gl gu he hi hr hu id it ja ka kk km k=
n ko ks ku_IQ ku lt lv mai mhr mk ml mn mr ms_MY my_MM nb ne nl nn oc or pa=
 pl ps pt_BR pt ro ru sd si sk sl sq sr@latin sr sv sw ta te th tr tt uk ur=
 uz vi xh zh_CN zh_HK zh_TW&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 AM_GLIB_GNU_GETTEXT<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 AM_GNU_GETTEXT([external])<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 AM_GNU_GETTEXT_VERSION([0.21])<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dnl If we don&#39;t have msgfmt, then po/=
 is going to fail -- ensure that<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dnl AM_GLIB_GNU_GETTEXT found it.<br>
&gt; +diff --git a/po/Makevars b/po/Makevars<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000..0c1178d<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/po/Makevars<br>
&gt; +@@ -0,0 +1,82 @@<br>
&gt; ++# Makefile variables for PO directory in any package using GNU gett=
ext.<br>
&gt; ++#<br>
&gt; ++# Copyright (C) 2003-2019 Free Software Foundation, Inc.<br>
&gt; ++# This file is free software; the Free Software Foundation gives<br=
>
&gt; ++# unlimited permission to use, copy, distribute, and modify it.<br>
&gt; ++<br>
&gt; ++# Usually the message domain is the same as the package name.<br>
&gt; ++DOMAIN =3D $(PACKAGE)<br>
&gt; ++<br>
&gt; ++# These two variables depend on the location of this directory.<br>
&gt; ++subdir =3D po<br>
&gt; ++top_builddir =3D ..<br>
&gt; ++<br>
&gt; ++# These options get passed to xgettext.<br>
&gt; ++XGETTEXT_OPTIONS =3D --keyword=3D_ --keyword=3DN_ --from-code=3DUTF=
-8<br>
&gt; ++<br>
&gt; ++# This is the copyright holder that gets inserted into the header o=
f the<br>
&gt; ++# $(DOMAIN).pot file.=C2=A0 Set this to the copyright holder of the=
 surrounding<br>
&gt; ++# package.=C2=A0 (Note that the msgstr strings, extracted from the =
package&#39;s<br>
&gt; ++# sources, belong to the copyright holder of the package.)=C2=A0 Tr=
anslators are<br>
&gt; ++# expected to transfer the copyright for their translations to this=
 person<br>
&gt; ++# or entity, or to disclaim their copyright.=C2=A0 The empty string=
 stands for<br>
&gt; ++# the public domain; in this case the translators are expected to d=
isclaim<br>
&gt; ++# their copyright.<br>
&gt; ++COPYRIGHT_HOLDER =3D Free Software Foundation, Inc.<br>
&gt; ++<br>
&gt; ++# This tells whether or not to prepend &quot;GNU &quot; prefix to t=
he package<br>
&gt; ++# name that gets inserted into the header of the $(DOMAIN).pot file=
.<br>
&gt; ++# Possible values are &quot;yes&quot;, &quot;no&quot;, or empty.=C2=
=
=A0 If it is empty, try to<br>
&gt; ++# detect it automatically by scanning the files in $(top_srcdir) fo=
r<br>
&gt; ++# &quot;GNU packagename&quot; string.<br>
&gt; ++PACKAGE_GNU =3D<br>
&gt; ++<br>
&gt; ++# This is the email address or URL to which the translators shall r=
eport<br>
&gt; ++# bugs in the untranslated strings:<br>
&gt; ++# - Strings which are not entire sentences, see the maintainer guid=
elines<br>
&gt; ++#=C2=A0 =C2=A0in the GNU gettext documentation, section &#39;Prepar=
ing Strings&#39;.<br>
&gt; ++# - Strings which use unclear terms or require additional context t=
o be<br>
&gt; ++#=C2=A0 =C2=A0understood.<br>
&gt; ++# - Strings which make invalid assumptions about notation of date, =
time or<br>
&gt; ++#=C2=A0 =C2=A0money.<br>
&gt; ++# - Pluralisation problems.<br>
&gt; ++# - Incorrect English spelling.<br>
&gt; ++# - Incorrect formatting.<br>
&gt; ++# It can be your email address, or a mailing list address where tra=
nslators<br>
&gt; ++# can write to without being subscribed, or the URL of a web page t=
hrough<br>
&gt; ++# which the translators can contact you.<br>
&gt; ++MSGID_BUGS_ADDRESS =3D<br>
&gt; ++<br>
&gt; ++# This is the list of locale categories, beyond LC_MESSAGES, for wh=
ich the<br>
&gt; ++# message catalogs shall be used.=C2=A0 It is usually empty.<br>
&gt; ++EXTRA_LOCALE_CATEGORIES =3D<br>
&gt; ++<br>
&gt; ++# This tells whether the $(DOMAIN).pot file contains messages with =
an &#39;msgctxt&#39;<br>
&gt; ++# context.=C2=A0 Possible values are &quot;yes&quot; and &quot;no&q=
uot;.=C2=A0 Set this to yes if the<br>
&gt; ++# package uses functions taking also a message context, like pgette=
xt(), or<br>
&gt; ++# if in $(XGETTEXT_OPTIONS) you define keywords with a context argu=
ment.<br>
&gt; ++USE_MSGCTXT =3D no<br>
&gt; ++<br>
&gt; ++# These options get passed to msgmerge.<br>
&gt; ++# Useful options are in particular:<br>
&gt; ++#=C2=A0 =C2=A0--previous=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
o keep previous msgids of translated messages,<br>
&gt; ++#=C2=A0 =C2=A0--quiet=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0to reduce the verbosity.<br>
&gt; ++MSGMERGE_OPTIONS =3D<br>
&gt; ++<br>
&gt; ++# These options get passed to msginit.<br>
&gt; ++# If you want to disable line wrapping when writing PO files, add<b=
r>
&gt; ++# --no-wrap to MSGMERGE_OPTIONS, XGETTEXT_OPTIONS, and<br>
&gt; ++# MSGINIT_OPTIONS.<br>
&gt; ++MSGINIT_OPTIONS =3D<br>
&gt; ++<br>
&gt; ++# This tells whether or not to regenerate a PO file when $(DOMAIN).=
pot<br>
&gt; ++# has changed.=C2=A0 Possible values are &quot;yes&quot; and &quot;=
no&quot;.=C2=A0 Set this to no if<br>
&gt; ++# the POT file is checked in the repository and the version control=
<br>
&gt; ++# program ignores timestamps.<br>
&gt; ++PO_DEPENDS_ON_POT =3D no<br>
&gt; ++<br>
&gt; ++# This tells whether or not to forcibly update $(DOMAIN).pot and<br=
>
&gt; ++# regenerate PO files on &quot;make dist&quot;.=C2=A0 Possible valu=
es are &quot;yes&quot; and<br>
&gt; ++# &quot;no&quot;.=C2=A0 Set this to no if the POT file and PO files=
 are maintained<br>
&gt; ++# externally.<br>
&gt; ++DIST_DEPENDS_ON_UPDATE_PO =3D no<br>
&gt; +diff --git a/po/POTFILES.in b/po/POTFILES.in<br>
&gt; +index a5691a1..b494bf3 100644<br>
&gt; +--- a/po/POTFILES.in<br>
&gt; ++++ b/po/POTFILES.in<br>
&gt; +@@ -1,4 +1,3 @@<br>
&gt; +-[encoding: UTF-8]<br>
&gt; + finch/finch.c<br>
&gt; + finch/gntaccount.c<br>
&gt; + finch/gntblist.c<br>
&gt; diff --git a/meta-oe/recipes-support/pidgin/pidgin/0002-configure.ac-=
disable-few-languages-not-compatible-wi.patch b/meta-oe/recipes-support/pid=
gin/pidgin/0002-configure.ac-disable-few-languages-not-compatible-wi.patch<=
br>
&gt; new file mode 100644<br>
&gt; index 0000000000..e8793b2bdd<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/pidgin/pidgin/0002-configure.ac-disable=
-few-languages-not-compatible-wi.patch<br>
&gt; @@ -0,0 +1,49 @@<br>
&gt; +From e27dd5cf8f737c6ec6c05795966099796f63873e Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" tar=
get=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; +Date: Sun, 7 Feb 2021 14:35:14 +0000<br>
&gt; +Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" =
target=3D"_blank">configure.ac</a>: disable few languages not compatible wi=
th<br>
&gt; + modern gettext<br>
&gt; +<br>
&gt; +* as pidgin-3 development is moving to meson and probably<br>
&gt; +=C2=A0 most of these changes won&#39;t be applicable there, lets jus=
t<br>
&gt; +=C2=A0 disable them until someone interested steps-up to maintain it=
<br>
&gt; +<br>
&gt; +* these 3 fail with:<br>
&gt; +cd ../../pidgin-2.14.1/po &amp;&amp; rm -f brx.gmo &amp;&amp; pidgin=
/2.14.1-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o brx.1po b=
rx.po pidgin.pot &amp;&amp; pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/=
msgfmt -c --statistics --verbose -o brx.gmo brx.1po &amp;&amp; rm -f brx.1p=
o<br>
&gt; +cd ../../pidgin-2.14.1/po &amp;&amp; rm -f zh_HK.gmo &amp;&amp; pidg=
in/2.14.1-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o zh_HK.1=
po zh_HK.po pidgin.pot &amp;&amp; pidgin/2.14.1-r0/recipe-sysroot-native/us=
r/bin/msgfmt -c --statistics --verbose -o zh_HK.gmo zh_HK.1po &amp;&amp; rm=
 -f zh_HK.1po<br>
&gt; +cd ../../pidgin-2.14.1/po &amp;&amp; rm -f zh_TW.gmo &amp;&amp; pidg=
in/2.14.1-r0/recipe-sysroot-native/usr/bin/msgmerge --for-msgfmt -o zh_TW.1=
po zh_TW.po pidgin.pot &amp;&amp; pidgin/2.14.1-r0/recipe-sysroot-native/us=
r/bin/msgfmt -c --statistics --verbose -o zh_TW.gmo zh_TW.1po &amp;&amp; rm=
 -f zh_TW.1po<br>
&gt; +zh_HK.1po:2790: &#39;msgstr&#39; is not a valid C format string, unl=
ike &#39;msgid&#39;. Reason: The string refers to arguments both through ab=
solute argument numbers and through unnumbered argument specifications.<br>
&gt; +pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt: found 1 fatal=
 error<br>
&gt; +zh_TW.1po:2790: &#39;msgstr&#39; is not a valid C format string, unl=
ike &#39;msgid&#39;. Reason: The string refers to arguments both through ab=
solute argument numbers and through unnumbered argument specifications.<br>
&gt; +pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt: found 1 fatal=
 error<br>
&gt; +zh_HK.1po: 3234 translated messages.<br>
&gt; +make[3]: *** [Makefile:415: ../../pidgin-2.14.1/po/zh_HK.gmo] Error =
1<br>
&gt; +make[3]: *** Waiting for unfinished jobs....<br>
&gt; +zh_TW.1po: 3234 translated messages.<br>
&gt; +make[3]: *** [Makefile:415: ../../pidgin-2.14.1/po/zh_TW.gmo] Error =
1<br>
&gt; +brx.1po:778: number of format specifications in &#39;msgid&#39; and =
&#39;msgstr&#39; does not match<br>
&gt; +brx.1po:3179: number of format specifications in &#39;msgid&#39; and=
 &#39;msgstr&#39; does not match<br>
&gt; +brx.1po:5175: format specifications in &#39;msgid_plural&#39; and &#=
39;msgstr[0]&#39; for argument 1 are not the same<br>
&gt; +brx.1po:5184: format specifications in &#39;msgid_plural&#39; and &#=
39;msgstr[0]&#39; for argument 1 are not the same<br>
&gt; +brx.1po:7754: format specifications in &#39;msgid_plural&#39; and &#=
39;msgstr[0]&#39; for argument 1 are not the same<br>
&gt; +pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt: found 8 fatal=
 errors<br>
&gt; +brx.1po: 3246 translated messages.<br>
&gt; +<br>
&gt; +Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail=
.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank=
">configure.ac</a> | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targ=
et=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nor=
eferrer" target=3D"_blank">configure.ac</a><br>
&gt; +index e2280cd..9332932 100644<br>
&gt; +--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
&gt; ++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
&gt; +@@ -260,7 +260,7 @@ if test x$enable_i18n =3D xyes; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0GETTEXT_PACKAGE=3Dpidgin<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_SUBST(GETTEXT_PACKAGE)<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ALL_LINGUAS=3D&quot;af am ar ar_SA as ast az b=
e@latin bg bn_IN bn br brx bs ca ca@valencia cs da de dz el en_AU en_CA en_=
GB eo es_AR es et eu fa fi fr ga gl gu he hi hr hu id it ja ka kk km kn ko =
ks ku_IQ ku lt lv mai mhr mk ml mn mr ms_MY my_MM nb ne nl nn oc or pa pl p=
s pt_BR pt ro ru sd si sk sl sq sr@latin sr sv sw ta te th tr tt uk ur uz v=
i xh zh_CN zh_HK zh_TW&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ALL_LINGUAS=3D&quot;af am ar ar_SA as ast az b=
e@latin bg bn_IN bn br bs ca ca@valencia cs da de dz el en_AU en_CA en_GB e=
o es_AR es et eu fa fi fr ga gl gu he hi hr hu id it ja ka kk km kn ko ks k=
u_IQ ku lt lv mai mhr mk ml mn mr ms_MY my_MM nb ne nl nn oc or pa pl ps pt=
_BR pt ro ru sd si sk sl sq sr@latin sr sv sw ta te th tr tt uk ur uz vi xh=
 zh_CN&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0AM_GNU_GETTEXT([external])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0AM_GNU_GETTEXT_VERSION([0.21])<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-pytho=
n-265.patch b/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265=
.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 312fc8593f..0000000000<br>
&gt; --- a/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.p=
atch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,42 +0,0 @@<br>
&gt; -From 855cc20bafa30597ae7a62f7672d42654b25cde0 Mon Sep 17 00:00:00 20=
01<br>
&gt; -From: Herrie &lt;<a href=3D"mailto:github.com@herrie.org" target=3D"=
_blank">github.com@herrie.org</a>&gt;<br>
&gt; -Date: Mon, 24 Jul 2017 21:30:16 +0200<br>
&gt; -Subject: [PATCH] Use pkg-config instead of ${PYTHON}-config to find =
python<br>
&gt; -<br>
&gt; ----<br>
&gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank=
">configure.ac</a> | 21 ++++++++-------------<br>
&gt; - 1 file changed, 8 insertions(+), 13 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targ=
et=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nor=
eferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index d20a18e..c741829 100644<br>
&gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
&gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
&gt; -@@ -1567,20 +1567,15 @@ AM_CONDITIONAL(ENABLE_DBUS, test &quot;x$ena=
ble_dbus&quot; =3D &quot;xyes&quot;)<br>
&gt; - dnl Check for Python headers (currently useful only for libgnt)<br>
&gt; - dnl (Thanks to XChat)<br>
&gt; - if test &quot;x$enable_consoleui&quot; =3D &quot;xyes&quot; -a ! -z=
 &quot;$PYTHON&quot; -a x&quot;$PYTHON&quot; !=3D x&quot;no&quot; ; then<br=
>
&gt; --=C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING(for Python compile flags)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 if test -f ${PYTHON}-config; then<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PY_CFLAGS=3D`${PYT=
HON}-config --includes`<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PY_LIBS=3D`${PYTHO=
N}-config --libs`<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_DEFINE(USE_PYTH=
ON, [1], [Define if python headers are available.])<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT(ok)<=
br>
&gt; --=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([Can=
not find ${PYTHON}-config])<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PY_CFLAGS=3D&quot;=
&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PY_LIBS=3D&quot;&q=
uot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_CHECKING(for Python compile flag=
s)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PKG_CHECK_MODULES(PY, python, [<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_SUBST(PY=
_CFLAGS)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_SUBST(PY=
_LIBS)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ], [<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESU=
LT(no)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_ERRO=
R([Can&#39;t find python])<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; - fi<br>
&gt; --AC_SUBST(PY_CFLAGS)<br>
&gt; --AC_SUBST(PY_LIBS)<br>
&gt; -<br>
&gt; - dnl ###############################################################=
########<br>
&gt; - dnl # Check for Mono support<br>
&gt; diff --git a/meta-oe/recipes-support/pidgin/pidgin/use_py3.patch b/me=
ta-oe/recipes-support/pidgin/pidgin/use_py3.patch<br>
&gt; deleted file mode 100644<br>
&gt; index c7b4163cb5..0000000000<br>
&gt; --- a/meta-oe/recipes-support/pidgin/pidgin/use_py3.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,20 +0,0 @@<br>
&gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
&gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
&gt; -@@ -1488,7 +1488,7 @@ AC_ARG_WITH([python],<br>
&gt; -<br>
&gt; - if test &quot;x$enable_dbus&quot; =3D &quot;xyes&quot; || test &quo=
t;x$enable_consoleui&quot; =3D &quot;xyes&quot; ; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if test -z &quot;$PYTHON&quot; -o &quot;x=
$PYTHON&quot; =3D &quot;xyes&quot;; then<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_PATH_PROG([PYTH=
ON], [python], [no])<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_PATH_PROG([PYTH=
ON], [python3], [no])<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if test x&quot;$PYTHON&quot; =3D x&quot;n=
o&quot; ; then<br>
&gt; -@@ -1568,7 +1568,7 @@ dnl Check for Python headers (currently<br>
&gt; - dnl (Thanks to XChat)<br>
&gt; - if test &quot;x$enable_consoleui&quot; =3D &quot;xyes&quot; -a ! -z=
 &quot;$PYTHON&quot; -a x&quot;$PYTHON&quot; !=3D x&quot;no&quot; ; then<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_MSG_CHECKING(for Python compile=
 flags)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 PKG_CHECK_MODULES(PY, python, [<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PKG_CHECK_MODULES(PY, python3, [<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_SUB=
ST(PY_CFLAGS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_SUB=
ST(PY_LIBS)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0], [<br>
&gt; diff --git a/meta-oe/recipes-support/pidgin/<a href=3D"http://pidgin_=
2.13.0.bb" rel=3D"noreferrer" target=3D"_blank">pidgin_2.13.0.bb</a> b/meta=
-oe/recipes-support/pidgin/<a href=3D"http://pidgin_2.14.1.bb" rel=3D"noref=
errer" target=3D"_blank">pidgin_2.14.1.bb</a><br>
&gt; similarity index 92%<br>
&gt; rename from meta-oe/recipes-support/pidgin/<a href=3D"http://pidgin_2=
.13.0.bb" rel=3D"noreferrer" target=3D"_blank">pidgin_2.13.0.bb</a><br>
&gt; rename to meta-oe/recipes-support/pidgin/<a href=3D"http://pidgin_2.1=
4.1.bb" rel=3D"noreferrer" target=3D"_blank">pidgin_2.14.1.bb</a><br>
&gt; index fdc79e81b2..9a90f36322 100644<br>
&gt; --- a/meta-oe/recipes-support/pidgin/<a href=3D"http://pidgin_2.13.0.=
bb" rel=3D"noreferrer" target=3D"_blank">pidgin_2.13.0.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/pidgin/<a href=3D"http://pidgin_2.14.1.=
bb" rel=3D"noreferrer" target=3D"_blank">pidgin_2.14.1.bb</a><br>
&gt; @@ -1,4 +1,5 @@<br>
&gt;=C2=A0 SUMMARY =3D &quot;multi-protocol instant messaging client&quot;=
<br>
&gt; +<br>
&gt;=C2=A0 SECTION =3D &quot;x11/network&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;GPLv2&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D751419260aa9544=
99f7abaabaa882bbe&quot;<br>
&gt; @@ -10,12 +11,11 @@ SRC_URI =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${SOURCEFORGE_MIRROR}/pidgin/pidgin-${PV}.tar.bz2=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://<a href=3D"http://sanitize-configure.ac" t=
arget=3D"_blank">sanitize-configure.ac</a>.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://purple-OE-branding-25.patch \<br>
&gt; -=C2=A0 =C2=A0 file://pidgin-cross-python-265.patch \<br>
&gt; -=C2=A0 =C2=A0 file://use_py3.patch \<br>
&gt; +=C2=A0 =C2=A0 file://0001-configure.ac-fix-build-with-autoconf-2.71.=
patch \<br>
&gt; +=C2=A0 =C2=A0 file://0002-configure.ac-disable-few-languages-not-com=
patible-wi.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;423403494fe1951e47cc75231f743bb0&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;2747150c6f711146bddd333c496870bfd55058b=
ab22ffb7e4eb784018ec46d8f&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;f132e18d551117d9e46acce29ba4f40892a8674=
6c366999166a3862b51060780&quot;<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG ??=3D &quot;gnutls consoleui avahi dbus idn nss \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &=
#39;x11&#39;, &#39;x11 gtk startup-notification&#39;, &#39;&#39;, d)} \<br>
&gt; @@ -41,6 +41,7 @@ PACKAGECONFIG[avahi] =3D &quot;--enable-avahi,--dis=
able-avahi,avahi&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[nss] =3D &quot;--enable-nss,--disable-nss,nss nsp=
r,libpurple-plugin-ssl-nss&quot;<br>
&gt;<br>
&gt;=C2=A0 EXTRA_OECONF =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 --with-python=3Dpython3 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --disable-perl \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --disable-tcl \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --disable-gevolution \<br>
&gt; @@ -51,11 +52,6 @@ EXTRA_OECONF =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --disable-screensaver \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -do_configure_prepend() {<br>
&gt; -=C2=A0 =C2=A0 touch ${S}/po/Makefile<br>
&gt; -=C2=A0 =C2=A0 sed -i &quot;s#PY_VERSION=3D`$PYTHON -c &#39;import sy=
s ; print sys.version[0:3]&#39;`#PY_VERSION=3D${PYTHON_BASEVERSION}#g&quot;=
 ${S}/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">=
configure.ac</a><br>
&gt; -}<br>
&gt; -<br>
&gt;=C2=A0 OE_LT_RPATH_ALLOW=3D&quot;:${libdir}/purple-2:&quot;<br>
&gt;=C2=A0 OE_LT_RPATH_ALLOW[export]=3D&quot;1&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.27.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>

--000000000000fd459d05bac8a295--
