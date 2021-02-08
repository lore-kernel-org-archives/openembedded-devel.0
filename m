Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.28940.1612744862637808078
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 16:41:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J8hMdl7A;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id d85so12894888qkg.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 16:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3FRnZhCyt+P5FfVGVxYW1GL4L+b413qoPP5uKItxkZQ=;
        b=J8hMdl7AEo3dzqgtdrak2B+Tjlz7VcWnO/0EP/RYBZhEUgpvlRvA0KDNA4Xp92EH5w
         VUiYN2ylp4LV4VA7Rqt4C0EdKUhRO96w1ovdbBreVUgLg1tov2Kj6IOHzdxvEcI35kvG
         vkgjxAfdvKNDgl2Vuluzc8g7/u3ltP4BYIKhaF5D59xNbWC0788UmZN8xroW+KTdwIqS
         sTahKtM1ygzEKbl8afOdHVGTCb3G5Yvlk5t+8qcdHgl0zuYFpPKzTA9/Dcf1+cOLwp7T
         664seXYuKZv9Am3brqI8I+OWR257gHm0xWdiawPEwCHL9+/Bg8MPdrFAvSxjOu3jISkf
         zgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3FRnZhCyt+P5FfVGVxYW1GL4L+b413qoPP5uKItxkZQ=;
        b=Dls6DIWYWKPbytcwcJrg/jX6n7l4iOOXWhchf1eCT+3y+ZNI7QTO0OQDjs70qRz8tJ
         Udb2CCE9KwoDIP3OG4ZNKUk6Mvsq0NxJ9gZRDKWzq/DQFJmgPr8xU6shJwXh5lxmdQQf
         fMK3fxC5mVU6hHQGteVx0vP2eNuoH04VELN8lE83fo9yx/zbicocV7ykq5VwWGX3h9iz
         5qGtBqjVLGykym4AmDr/3Ef9kdDel242PXRZ0wtgSz7YzrwcN7SOiIF3R++a7Rq1C8l5
         0PkLR14n1z+KEYGLREqE18sMdN8xigi8DVaz969ExPbWplcRxEmSaulAniOmxbEgeuKt
         K0nw==
X-Gm-Message-State: AOAM531jXsC3ch+5L0jsMViIqHCu8xoMt9SYN6wDidWa1pOvLHpbrqjQ
	Y6fh5YxheXJ/UGRxKUbk1edeIrPTpM24eiEvQPs=
X-Google-Smtp-Source: ABdhPJynUv2PgiF88ZPhlM5GE1+8H6I7VRxsnMj3f1rC6mepKYmcKBitbpuC5dZ7MZvK5451l5kVqr241Td6mPoV16A=
X-Received: by 2002:a37:b346:: with SMTP id c67mr14955557qkf.212.1612744861224;
 Sun, 07 Feb 2021 16:41:01 -0800 (PST)
MIME-Version: 1.0
References: <20210207144605.3784078-1-Martin.Jansa@gmail.com> <20210207144605.3784078-2-Martin.Jansa@gmail.com>
In-Reply-To: <20210207144605.3784078-2-Martin.Jansa@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 7 Feb 2021 16:40:35 -0800
Message-ID: <CAMKF1sq+fjnOLG68nVu9fdM-PHLQLEPt6aN3-DM=EucMnCxJ-A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] pidgin: upgrade to 2.14.1 and fix autoconf-2.71 compatibility
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pidgin 2.14.x seems to have moved to use meson, I wonder if autotools
should be dropped perhaps ? might be worth an effort to move to meson,
I am seeing a build failure with 2.69 autotools

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/912


On Sun, Feb 7, 2021 at 6:46 AM Martin Jansa <Martin.Jansa@gmail.com> wrote=
:
>
> * also log.do_configure is showing this since switch to python3:
>   DEBUG: Executing shell function do_configure
>   File "<string>", line 1
>     import sys ; print sys.version[0:3]
>                        ^
>   SyntaxError: invalid syntax
>
>   and this whole line doesn't make much sense and PY_VERSION shouldn't b=
e used in configure.ac since:
>
>   commit 9087a59b1c3f9708642a2327b0cf6ecceac0a66f
>   Author: Martin Jansa <Martin.Jansa@gmail.com>
>   Date:   Thu May 5 16:58:59 2016 +0200
>
>     pidgin: use pkg-config instead of hardcoded paths or python-config
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...gure.ac-fix-build-with-autoconf-2.71.patch | 205 ++++++++++++++++++
>  ...able-few-languages-not-compatible-wi.patch |  49 +++++
>  .../pidgin/pidgin-cross-python-265.patch      |  42 ----
>  .../pidgin/pidgin/use_py3.patch               |  20 --
>  .../{pidgin_2.13.0.bb =3D> pidgin_2.14.1.bb}    |  14 +-
>  5 files changed, 259 insertions(+), 71 deletions(-)
>  create mode 100644 meta-oe/recipes-support/pidgin/pidgin/0001-configure=
.ac-fix-build-with-autoconf-2.71.patch
>  create mode 100644 meta-oe/recipes-support/pidgin/pidgin/0002-configure=
.ac-disable-few-languages-not-compatible-wi.patch
>  delete mode 100644 meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-p=
ython-265.patch
>  delete mode 100644 meta-oe/recipes-support/pidgin/pidgin/use_py3.patch
>  rename meta-oe/recipes-support/pidgin/{pidgin_2.13.0.bb =3D> pidgin_2.1=
4.1.bb} (92%)
>
> diff --git a/meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac-fix=
-build-with-autoconf-2.71.patch b/meta-oe/recipes-support/pidgin/pidgin/000=
1-configure.ac-fix-build-with-autoconf-2.71.patch
> new file mode 100644
> index 0000000000..1c43266a30
> --- /dev/null
> +++ b/meta-oe/recipes-support/pidgin/pidgin/0001-configure.ac-fix-build-=
with-autoconf-2.71.patch
> @@ -0,0 +1,205 @@
> +From 932a4c40ec78747d0ee073a8bdc5218de30affbe Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Sun, 7 Feb 2021 13:25:29 +0100
> +Subject: [PATCH] configure.ac: fix build with autoconf-2.71
> +
> +* fixes:
> +  | autoreconf: running: intltoolize --copy --force
> +  | ERROR: 'IT_PROG_INTLTOOL' must appear in configure.ac for intltool =
to work.
> +  | autoreconf: error: intltoolize failed with exit status: 1
> +
> +* replace AM_GLIB_GNU_GETTEXT with AM_GNU_GETTEXT as suggested in:
> +  https://wiki.gnome.org/Initiatives/GnomeGoals/GettextMigration
> +  https://blogs.gnome.org/jjardon/2010/10/08/use-upstream-gettext-inste=
ad-the-glib-one/
> +  because the former is causing issues with autoconf-2.71:
> +
> +  -m4trace:configure.ac:266: -1- _m4_warn([obsolete], [The macro `AC_TR=
Y_LINK' is obsolete.
> +  -You should run autoupdate.], [../autoconf-2.71/lib/autoconf/general.=
m4:2920: AC_TRY_LINK is expanded from...
> +  -../autoconf-2.71/lib/m4sugar/m4sh.m4:699: AS_IF is expanded from...
> +  -../autoconf-2.71/lib/autoconf/headers.m4:89: _AC_CHECK_HEADER_COMPIL=
E is expanded from...
> +  -../autoconf-2.71/lib/autoconf/headers.m4:56: AC_CHECK_HEADER is expa=
nded from...
> +  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettex=
t.m4:150: GLIB_WITH_NLS is expanded from...
> +  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettex=
t.m4:370: GLIB_GNU_GETTEXT is expanded from...
> +  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettex=
t.m4:470: AM_GLIB_GNU_GETTEXT is expanded from...
> +  -configure.ac:266: the top level])
> +  -m4trace:configure.ac:266: -1- m4_pattern_allow([^ENABLE_NLS$])
> +  -m4trace:configure.ac:266: -1- _m4_warn([obsolete], [The macro `AC_OU=
TPUT_COMMANDS' is obsolete.
> +  -You should run autoupdate.], [../autoconf-2.71/lib/autoconf/status.m=
4:1025: AC_OUTPUT_COMMANDS is expanded from...
> +  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettex=
t.m4:150: GLIB_WITH_NLS is expanded from...
> +  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettex=
t.m4:370: GLIB_GNU_GETTEXT is expanded from...
> +  -pidgin/2.14.1-r0/recipe-sysroot-native/usr/share/aclocal/glib-gettex=
t.m4:470: AM_GLIB_GNU_GETTEXT is expanded from...
> +  -configure.ac:266: the top level])
> +
> +  and then configure fails with:
> +
> +  configure.ac:2621: error: `po/stamp-it' is already registered with AC=
_CONFIG_COMMANDS.
> +  autoconf-2.71/lib/autoconf/status.m4:1008: AC_CONFIG_COMMANDS is expa=
nded from...
> +  configure.ac:2621: the top level
> +
> +* add AM_GNU_GETTEXT_VERSION as well to resolve warning with autoconf-2=
.71
> +  configure.ac: warning: AM_GNU_GETTEXT is used, but not AM_GNU_GETTEXT=
_VERSION or AM_GNU_GETTEXT_REQUIRE_VERSION
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + ABOUT-NLS      |  1 +
> + Makefile.am    |  6 +---
> + configure.ac   |  6 ++--
> + po/Makevars    | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++
> + po/POTFILES.in |  1 -
> + 5 files changed, 87 insertions(+), 9 deletions(-)
> + create mode 100644 ABOUT-NLS
> + create mode 100644 po/Makevars
> +
> +diff --git a/ABOUT-NLS b/ABOUT-NLS
> +new file mode 100644
> +index 0000000..0a9d56d
> +--- /dev/null
> ++++ b/ABOUT-NLS
> +@@ -0,0 +1 @@
> ++<https://www.gnu.org/software/gettext/manual/html_node/Users.html>
> +diff --git a/Makefile.am b/Makefile.am
> +index f8e2bc9..a74145f 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -13,9 +13,6 @@ EXTRA_DIST =3D \
> +               fix-casts.sh \
> +               gaim.pc.in \
> +               gaim-uninstalled.pc.in \
> +-              intltool-extract.in \
> +-              intltool-merge.in \
> +-              intltool-update.in \
> +               package_revision.h \
> +               pidgin.apspec.in \
> +               pidgin.spec.in \
> +@@ -139,5 +136,4 @@ endif
> + distuninstallcheck_listfiles =3D \
> +       find . -type f -print | grep -v perl | grep -v Purple.3pm | grep=
 -v Pidgin.3pm
> +
> +-DISTCLEANFILES=3D intltool-extract intltool-merge intltool-update \
> +-                      package_revision_raw.txt
> ++DISTCLEANFILES=3Dpackage_revision_raw.txt
> +diff --git a/configure.ac b/configure.ac
> +index 81d8592..e2280cd 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -43,7 +43,7 @@ fi
> +
> + AC_CANONICAL_HOST
> + AC_CONFIG_HEADERS([config.h])
> +-AM_INIT_AUTOMAKE([1.9 -Wno-portability dist-bzip2])
> ++AM_INIT_AUTOMAKE([1.9 -Wno-portability dist-bzip2 foreign])
> + dnl TODO: Always use AM_SILENT_RULES when we depend on automake >=3D 1=
.11
> + m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
> +
> +@@ -257,12 +257,12 @@ dnl #############################################=
##########################
> + AC_ARG_ENABLE(nls, AC_HELP_STRING([--disable-nls], [disable installati=
on of translation files]), enable_i18n=3D"$enableval", enable_i18n=3Dyes)
> +
> + if test x$enable_i18n =3D xyes; then
> +-      AC_PROG_INTLTOOL
> +       GETTEXT_PACKAGE=3Dpidgin
> +       AC_SUBST(GETTEXT_PACKAGE)
> +
> +       ALL_LINGUAS=3D"af am ar ar_SA as ast az be@latin bg bn_IN bn br =
brx bs ca ca@valencia cs da de dz el en_AU en_CA en_GB eo es_AR es et eu fa=
 fi fr ga gl gu he hi hr hu id it ja ka kk km kn ko ks ku_IQ ku lt lv mai m=
hr mk ml mn mr ms_MY my_MM nb ne nl nn oc or pa pl ps pt_BR pt ro ru sd si =
sk sl sq sr@latin sr sv sw ta te th tr tt uk ur uz vi xh zh_CN zh_HK zh_TW"
> +-      AM_GLIB_GNU_GETTEXT
> ++      AM_GNU_GETTEXT([external])
> ++      AM_GNU_GETTEXT_VERSION([0.21])
> +
> +       dnl If we don't have msgfmt, then po/ is going to fail -- ensure=
 that
> +       dnl AM_GLIB_GNU_GETTEXT found it.
> +diff --git a/po/Makevars b/po/Makevars
> +new file mode 100644
> +index 0000000..0c1178d
> +--- /dev/null
> ++++ b/po/Makevars
> +@@ -0,0 +1,82 @@
> ++# Makefile variables for PO directory in any package using GNU gettext=
.
> ++#
> ++# Copyright (C) 2003-2019 Free Software Foundation, Inc.
> ++# This file is free software; the Free Software Foundation gives
> ++# unlimited permission to use, copy, distribute, and modify it.
> ++
> ++# Usually the message domain is the same as the package name.
> ++DOMAIN =3D $(PACKAGE)
> ++
> ++# These two variables depend on the location of this directory.
> ++subdir =3D po
> ++top_builddir =3D ..
> ++
> ++# These options get passed to xgettext.
> ++XGETTEXT_OPTIONS =3D --keyword=3D_ --keyword=3DN_ --from-code=3DUTF-8
> ++
> ++# This is the copyright holder that gets inserted into the header of t=
he
> ++# $(DOMAIN).pot file.  Set this to the copyright holder of the surroun=
ding
> ++# package.  (Note that the msgstr strings, extracted from the package'=
s
> ++# sources, belong to the copyright holder of the package.)  Translator=
s are
> ++# expected to transfer the copyright for their translations to this pe=
rson
> ++# or entity, or to disclaim their copyright.  The empty string stands =
for
> ++# the public domain; in this case the translators are expected to disc=
laim
> ++# their copyright.
> ++COPYRIGHT_HOLDER =3D Free Software Foundation, Inc.
> ++
> ++# This tells whether or not to prepend "GNU " prefix to the package
> ++# name that gets inserted into the header of the $(DOMAIN).pot file.
> ++# Possible values are "yes", "no", or empty.  If it is empty, try to
> ++# detect it automatically by scanning the files in $(top_srcdir) for
> ++# "GNU packagename" string.
> ++PACKAGE_GNU =3D
> ++
> ++# This is the email address or URL to which the translators shall repo=
rt
> ++# bugs in the untranslated strings:
> ++# - Strings which are not entire sentences, see the maintainer guideli=
nes
> ++#   in the GNU gettext documentation, section 'Preparing Strings'.
> ++# - Strings which use unclear terms or require additional context to b=
e
> ++#   understood.
> ++# - Strings which make invalid assumptions about notation of date, tim=
e or
> ++#   money.
> ++# - Pluralisation problems.
> ++# - Incorrect English spelling.
> ++# - Incorrect formatting.
> ++# It can be your email address, or a mailing list address where transl=
ators
> ++# can write to without being subscribed, or the URL of a web page thro=
ugh
> ++# which the translators can contact you.
> ++MSGID_BUGS_ADDRESS =3D
> ++
> ++# This is the list of locale categories, beyond LC_MESSAGES, for which=
 the
> ++# message catalogs shall be used.  It is usually empty.
> ++EXTRA_LOCALE_CATEGORIES =3D
> ++
> ++# This tells whether the $(DOMAIN).pot file contains messages with an =
'msgctxt'
> ++# context.  Possible values are "yes" and "no".  Set this to yes if th=
e
> ++# package uses functions taking also a message context, like pgettext(=
), or
> ++# if in $(XGETTEXT_OPTIONS) you define keywords with a context argumen=
t.
> ++USE_MSGCTXT =3D no
> ++
> ++# These options get passed to msgmerge.
> ++# Useful options are in particular:
> ++#   --previous            to keep previous msgids of translated messag=
es,
> ++#   --quiet               to reduce the verbosity.
> ++MSGMERGE_OPTIONS =3D
> ++
> ++# These options get passed to msginit.
> ++# If you want to disable line wrapping when writing PO files, add
> ++# --no-wrap to MSGMERGE_OPTIONS, XGETTEXT_OPTIONS, and
> ++# MSGINIT_OPTIONS.
> ++MSGINIT_OPTIONS =3D
> ++
> ++# This tells whether or not to regenerate a PO file when $(DOMAIN).pot
> ++# has changed.  Possible values are "yes" and "no".  Set this to no if
> ++# the POT file is checked in the repository and the version control
> ++# program ignores timestamps.
> ++PO_DEPENDS_ON_POT =3D no
> ++
> ++# This tells whether or not to forcibly update $(DOMAIN).pot and
> ++# regenerate PO files on "make dist".  Possible values are "yes" and
> ++# "no".  Set this to no if the POT file and PO files are maintained
> ++# externally.
> ++DIST_DEPENDS_ON_UPDATE_PO =3D no
> +diff --git a/po/POTFILES.in b/po/POTFILES.in
> +index a5691a1..b494bf3 100644
> +--- a/po/POTFILES.in
> ++++ b/po/POTFILES.in
> +@@ -1,4 +1,3 @@
> +-[encoding: UTF-8]
> + finch/finch.c
> + finch/gntaccount.c
> + finch/gntblist.c
> diff --git a/meta-oe/recipes-support/pidgin/pidgin/0002-configure.ac-dis=
able-few-languages-not-compatible-wi.patch b/meta-oe/recipes-support/pidgin=
/pidgin/0002-configure.ac-disable-few-languages-not-compatible-wi.patch
> new file mode 100644
> index 0000000000..e8793b2bdd
> --- /dev/null
> +++ b/meta-oe/recipes-support/pidgin/pidgin/0002-configure.ac-disable-fe=
w-languages-not-compatible-wi.patch
> @@ -0,0 +1,49 @@
> +From e27dd5cf8f737c6ec6c05795966099796f63873e Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Sun, 7 Feb 2021 14:35:14 +0000
> +Subject: [PATCH] configure.ac: disable few languages not compatible wit=
h
> + modern gettext
> +
> +* as pidgin-3 development is moving to meson and probably
> +  most of these changes won't be applicable there, lets just
> +  disable them until someone interested steps-up to maintain it
> +
> +* these 3 fail with:
> +cd ../../pidgin-2.14.1/po && rm -f brx.gmo && pidgin/2.14.1-r0/recipe-s=
ysroot-native/usr/bin/msgmerge --for-msgfmt -o brx.1po brx.po pidgin.pot &&=
 pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistics --ve=
rbose -o brx.gmo brx.1po && rm -f brx.1po
> +cd ../../pidgin-2.14.1/po && rm -f zh_HK.gmo && pidgin/2.14.1-r0/recipe=
-sysroot-native/usr/bin/msgmerge --for-msgfmt -o zh_HK.1po zh_HK.po pidgin.=
pot && pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistic=
s --verbose -o zh_HK.gmo zh_HK.1po && rm -f zh_HK.1po
> +cd ../../pidgin-2.14.1/po && rm -f zh_TW.gmo && pidgin/2.14.1-r0/recipe=
-sysroot-native/usr/bin/msgmerge --for-msgfmt -o zh_TW.1po zh_TW.po pidgin.=
pot && pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt -c --statistic=
s --verbose -o zh_TW.gmo zh_TW.1po && rm -f zh_TW.1po
> +zh_HK.1po:2790: 'msgstr' is not a valid C format string, unlike 'msgid'=
. Reason: The string refers to arguments both through absolute argument num=
bers and through unnumbered argument specifications.
> +pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt: found 1 fatal er=
ror
> +zh_TW.1po:2790: 'msgstr' is not a valid C format string, unlike 'msgid'=
. Reason: The string refers to arguments both through absolute argument num=
bers and through unnumbered argument specifications.
> +pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt: found 1 fatal er=
ror
> +zh_HK.1po: 3234 translated messages.
> +make[3]: *** [Makefile:415: ../../pidgin-2.14.1/po/zh_HK.gmo] Error 1
> +make[3]: *** Waiting for unfinished jobs....
> +zh_TW.1po: 3234 translated messages.
> +make[3]: *** [Makefile:415: ../../pidgin-2.14.1/po/zh_TW.gmo] Error 1
> +brx.1po:778: number of format specifications in 'msgid' and 'msgstr' do=
es not match
> +brx.1po:3179: number of format specifications in 'msgid' and 'msgstr' d=
oes not match
> +brx.1po:5175: format specifications in 'msgid_plural' and 'msgstr[0]' f=
or argument 1 are not the same
> +brx.1po:5184: format specifications in 'msgid_plural' and 'msgstr[0]' f=
or argument 1 are not the same
> +brx.1po:7754: format specifications in 'msgid_plural' and 'msgstr[0]' f=
or argument 1 are not the same
> +pidgin/2.14.1-r0/recipe-sysroot-native/usr/bin/msgfmt: found 8 fatal er=
rors
> +brx.1po: 3246 translated messages.
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index e2280cd..9332932 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -260,7 +260,7 @@ if test x$enable_i18n =3D xyes; then
> +       GETTEXT_PACKAGE=3Dpidgin
> +       AC_SUBST(GETTEXT_PACKAGE)
> +
> +-      ALL_LINGUAS=3D"af am ar ar_SA as ast az be@latin bg bn_IN bn br =
brx bs ca ca@valencia cs da de dz el en_AU en_CA en_GB eo es_AR es et eu fa=
 fi fr ga gl gu he hi hr hu id it ja ka kk km kn ko ks ku_IQ ku lt lv mai m=
hr mk ml mn mr ms_MY my_MM nb ne nl nn oc or pa pl ps pt_BR pt ro ru sd si =
sk sl sq sr@latin sr sv sw ta te th tr tt uk ur uz vi xh zh_CN zh_HK zh_TW"
> ++      ALL_LINGUAS=3D"af am ar ar_SA as ast az be@latin bg bn_IN bn br =
bs ca ca@valencia cs da de dz el en_AU en_CA en_GB eo es_AR es et eu fa fi =
fr ga gl gu he hi hr hu id it ja ka kk km kn ko ks ku_IQ ku lt lv mai mhr m=
k ml mn mr ms_MY my_MM nb ne nl nn oc or pa pl ps pt_BR pt ro ru sd si sk s=
l sq sr@latin sr sv sw ta te th tr tt uk ur uz vi xh zh_CN"
> +       AM_GNU_GETTEXT([external])
> +       AM_GNU_GETTEXT_VERSION([0.21])
> +
> diff --git a/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-2=
65.patch b/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.pa=
tch
> deleted file mode 100644
> index 312fc8593f..0000000000
> --- a/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patc=
h
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 855cc20bafa30597ae7a62f7672d42654b25cde0 Mon Sep 17 00:00:00 2001
> -From: Herrie <github.com@herrie.org>
> -Date: Mon, 24 Jul 2017 21:30:16 +0200
> -Subject: [PATCH] Use pkg-config instead of ${PYTHON}-config to find pyt=
hon
> -
> ----
> - configure.ac | 21 ++++++++-------------
> - 1 file changed, 8 insertions(+), 13 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index d20a18e..c741829 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1567,20 +1567,15 @@ AM_CONDITIONAL(ENABLE_DBUS, test "x$enable_dbus=
" =3D "xyes")
> - dnl Check for Python headers (currently useful only for libgnt)
> - dnl (Thanks to XChat)
> - if test "x$enable_consoleui" =3D "xyes" -a ! -z "$PYTHON" -a x"$PYTHON=
" !=3D x"no" ; then
> --      AC_MSG_CHECKING(for Python compile flags)
> --      if test -f ${PYTHON}-config; then
> --              PY_CFLAGS=3D`${PYTHON}-config --includes`
> --              PY_LIBS=3D`${PYTHON}-config --libs`
> --              AC_DEFINE(USE_PYTHON, [1], [Define if python headers are=
 available.])
> --              AC_MSG_RESULT(ok)
> --      else
> --              AC_MSG_RESULT([Cannot find ${PYTHON}-config])
> --              PY_CFLAGS=3D""
> --              PY_LIBS=3D""
> --      fi
> -+        AC_MSG_CHECKING(for Python compile flags)
> -+        PKG_CHECK_MODULES(PY, python, [
> -+                AC_SUBST(PY_CFLAGS)
> -+                AC_SUBST(PY_LIBS)
> -+        ], [
> -+                AC_MSG_RESULT(no)
> -+                AC_MSG_ERROR([Can't find python])
> -+        ])
> - fi
> --AC_SUBST(PY_CFLAGS)
> --AC_SUBST(PY_LIBS)
> -
> - dnl ##################################################################=
#####
> - dnl # Check for Mono support
> diff --git a/meta-oe/recipes-support/pidgin/pidgin/use_py3.patch b/meta-=
oe/recipes-support/pidgin/pidgin/use_py3.patch
> deleted file mode 100644
> index c7b4163cb5..0000000000
> --- a/meta-oe/recipes-support/pidgin/pidgin/use_py3.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1488,7 +1488,7 @@ AC_ARG_WITH([python],
> -
> - if test "x$enable_dbus" =3D "xyes" || test "x$enable_consoleui" =3D "x=
yes" ; then
> -       if test -z "$PYTHON" -o "x$PYTHON" =3D "xyes"; then
> --              AC_PATH_PROG([PYTHON], [python], [no])
> -+              AC_PATH_PROG([PYTHON], [python3], [no])
> -       fi
> -
> -       if test x"$PYTHON" =3D x"no" ; then
> -@@ -1568,7 +1568,7 @@ dnl Check for Python headers (currently
> - dnl (Thanks to XChat)
> - if test "x$enable_consoleui" =3D "xyes" -a ! -z "$PYTHON" -a x"$PYTHON=
" !=3D x"no" ; then
> -         AC_MSG_CHECKING(for Python compile flags)
> --        PKG_CHECK_MODULES(PY, python, [
> -+        PKG_CHECK_MODULES(PY, python3, [
> -                 AC_SUBST(PY_CFLAGS)
> -                 AC_SUBST(PY_LIBS)
> -         ], [
> diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb b/meta-oe/r=
ecipes-support/pidgin/pidgin_2.14.1.bb
> similarity index 92%
> rename from meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb
> rename to meta-oe/recipes-support/pidgin/pidgin_2.14.1.bb
> index fdc79e81b2..9a90f36322 100644
> --- a/meta-oe/recipes-support/pidgin/pidgin_2.13.0.bb
> +++ b/meta-oe/recipes-support/pidgin/pidgin_2.14.1.bb
> @@ -1,4 +1,5 @@
>  SUMMARY =3D "multi-protocol instant messaging client"
> +
>  SECTION =3D "x11/network"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa88=
2bbe"
> @@ -10,12 +11,11 @@ SRC_URI =3D "\
>      ${SOURCEFORGE_MIRROR}/pidgin/pidgin-${PV}.tar.bz2 \
>      file://sanitize-configure.ac.patch \
>      file://purple-OE-branding-25.patch \
> -    file://pidgin-cross-python-265.patch \
> -    file://use_py3.patch \
> +    file://0001-configure.ac-fix-build-with-autoconf-2.71.patch \
> +    file://0002-configure.ac-disable-few-languages-not-compatible-wi.pa=
tch \
>  "
>
> -SRC_URI[md5sum] =3D "423403494fe1951e47cc75231f743bb0"
> -SRC_URI[sha256sum] =3D "2747150c6f711146bddd333c496870bfd55058bab22ffb7=
e4eb784018ec46d8f"
> +SRC_URI[sha256sum] =3D "f132e18d551117d9e46acce29ba4f40892a86746c366999=
166a3862b51060780"
>
>  PACKAGECONFIG ??=3D "gnutls consoleui avahi dbus idn nss \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtk startup-not=
ification', '', d)} \
> @@ -41,6 +41,7 @@ PACKAGECONFIG[avahi] =3D "--enable-avahi,--disable-ava=
hi,avahi"
>  PACKAGECONFIG[nss] =3D "--enable-nss,--disable-nss,nss nspr,libpurple-p=
lugin-ssl-nss"
>
>  EXTRA_OECONF =3D " \
> +    --with-python=3Dpython3 \
>      --disable-perl \
>      --disable-tcl \
>      --disable-gevolution \
> @@ -51,11 +52,6 @@ EXTRA_OECONF =3D " \
>      --disable-screensaver \
>  "
>
> -do_configure_prepend() {
> -    touch ${S}/po/Makefile
> -    sed -i "s#PY_VERSION=3D`$PYTHON -c 'import sys ; print sys.version[=
0:3]'`#PY_VERSION=3D${PYTHON_BASEVERSION}#g" ${S}/configure.ac
> -}
> -
>  OE_LT_RPATH_ALLOW=3D":${libdir}/purple-2:"
>  OE_LT_RPATH_ALLOW[export]=3D"1"
>
> --
> 2.27.0
>
>
>=20
>
