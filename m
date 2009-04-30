Received: from [209.85.132.242] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LzUW7-0003IC-U1
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Apr 2009 13:33:28 +0200
Received: by an-out-0708.google.com with SMTP id b6so1093789ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Apr 2009 04:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=pNleqLsfbQb+2OJ50r+EVEUsP91Gb+vBuXD00RdOz3U=;
	b=sW3Lo2A0pzz3e0Iz7tLsks5XBMiJhD/Ph/uf3DYpDUmB+zddRpIO7G5nQQm3LggGn/
	Etv9HGN5251c06W4w3f2H2ispjp/SAOrhPLrieEv6cRCRMg7sGN7VAcnuUTCPphFbrWK
	H0RZ5bJuq+kLe2eVOxDG14GsqFb+mLilauzOs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Pe/b+nAaBlKucpHb39Y7zTfEC5DtKNZnjL9K8qA8hdI790uzzr75bH1vQQU97zpOO1
	OlScAj0noIv+JKBSM1aQa6Ux7DVqUqGezhPMT+VkIYhMWdzzxpknHknTypBUkr+/c9tD
	GRG7RiOpt1qLhLQO4U87dZiS9YnueXvYFj8Zg=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.231.30.198 with SMTP id v6mr1206274ibc.22.1241090884864; Thu, 
	30 Apr 2009 04:28:04 -0700 (PDT)
In-Reply-To: <1241090521-6080-1-git-send-email-khimov@altell.ru>
References: <be7a9f3d0904300318m4916cf61vc0fd0d099f69f3fe@mail.gmail.com>
	<1241090521-6080-1-git-send-email-khimov@altell.ru>
Date: Thu, 30 Apr 2009 08:28:04 -0300
X-Google-Sender-Auth: a9cbc9a2e7aa69cd
Message-ID: <be7a9f3d0904300428h3654cb58u820e6e82a4737dd1@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/4] coreutils: add version 7.2
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
X-List-Received-Date: Thu, 30 Apr 2009 11:33:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Apr 30, 2009 at 8:22 AM, Roman I Khimov <khimov@altell.ru> wrote:
> ---
> =A0conf/checksums.ini =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 | =A0 =A04 +
> =A0.../coreutils/coreutils-7.2/automake-version.patch | =A0 13 +++
> =A0.../coreutils-7.2-fix-sort-segfault.patch =A0 =A0 =A0 =A0 =A0| =A0103 =
++++++++++++++++++++
> =A0recipes/coreutils/coreutils-7.2/man.patch =A0 =A0 =A0 =A0 =A0| =A0 47 =
+++++++++
> =A0recipes/coreutils/coreutils-7.2/onceonly.m4 =A0 =A0 =A0 =A0| =A0 63 ++=
++++++++++
> =A0recipes/coreutils/coreutils-native_7.2.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
5 +
> =A0recipes/coreutils/coreutils_7.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 89 +++++++++++++++++
> =A07 files changed, 324 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/coreutils/coreutils-7.2/automake-version.pa=
tch
> =A0create mode 100644 recipes/coreutils/coreutils-7.2/coreutils-7.2-fix-s=
ort-segfault.patch
> =A0create mode 100644 recipes/coreutils/coreutils-7.2/man.patch
> =A0create mode 100644 recipes/coreutils/coreutils-7.2/onceonly.m4
> =A0create mode 100644 recipes/coreutils/coreutils-native_7.2.bb
> =A0create mode 100644 recipes/coreutils/coreutils_7.2.bb
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index ffc84c6..9a2c473 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -3990,6 +3990,10 @@ sha256=3Defa27532ec6dc12a21f703ad4a0f612e613e9cc25=
75147685db81cc701952ac9
> =A0md5=3Dcbb2b3d1718ee1237b808e00b5c11b1e
> =A0sha256=3D813cb19fa19a885f342664109c7c5810f0081b624ff317bba8d1b6ccd83c2=
a05
>
> +[ftp://ftp.gnu.org/gnu/coreutils/coreutils-7.2.tar.gz]
> +md5=3D427c2914d3eab956f317c9ec6a45e62a
> +sha256=3Ddd77bfec92e5a3ad48abd8a5bda3f8d40149c4e24744e4173abc3cc6a731fdb=
2
> +
> =A0[http://www.rpsys.net/openzaurus/patches/archive/corgi_rearrange_lcd-r=
0.patch]
> =A0md5=3Dc1bec44c92f5da5abad97137c73b1365
> =A0sha256=3Dd4dc8f0583e616e74ea41b103d5f6a29b6d079ce37eaf9f362825514c7082=
490
> diff --git a/recipes/coreutils/coreutils-7.2/automake-version.patch b/rec=
ipes/coreutils/coreutils-7.2/automake-version.patch
> new file mode 100644
> index 0000000..497ef15
> --- /dev/null
> +++ b/recipes/coreutils/coreutils-7.2/automake-version.patch
> @@ -0,0 +1,13 @@
> +Index: coreutils-7.1/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- coreutils-7.1.orig/configure.ac
> ++++ coreutils-7.1/configure.ac
> +@@ -32,7 +32,7 @@
> + AC_CONFIG_AUX_DIR([build-aux])
> + AC_CONFIG_HEADERS([lib/config.h:lib/config.hin])
> +
> +-AM_INIT_AUTOMAKE([1.10a dist-xz])
> ++AM_INIT_AUTOMAKE([1.10.2])
> +
> + AC_PROG_CC_STDC
> + AM_PROG_CC_C_O
> diff --git a/recipes/coreutils/coreutils-7.2/coreutils-7.2-fix-sort-segfa=
ult.patch b/recipes/coreutils/coreutils-7.2/coreutils-7.2-fix-sort-segfault=
.patch
> new file mode 100644
> index 0000000..e9d7b4e
> --- /dev/null
> +++ b/recipes/coreutils/coreutils-7.2/coreutils-7.2-fix-sort-segfault.pat=
ch
> @@ -0,0 +1,103 @@
> +OE modifications to the original patch:
> + * Removed NEWS and THANKS hunks to apply on vanilla 7.2 coreutils
> +
> +>From 570beb56f58bb087a614af885bec7e9cf6b19423 Mon Sep 17 00:00:00 2001
> +From: Jim Meyering <meyering@redhat.com>
> +Date: Wed, 22 Apr 2009 08:45:27 +0200
> +Subject: [PATCH] sort -m: don't segfault when output file is also an inp=
ut =3D
> +file
> +
> +* src/sort.c (avoid_trashing_input): Fix an off-by-one error and
> +guard the use of memmove.
> +* NEWS (Bug fixes): Mention it.
> +* tests/misc/sort: Add tests to exercise the offending code.
> +* THANKS: Update.
> +Reported by Otavio Salvador in http://bugs.debian.org/525048.
> +---
> + NEWS =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A06 +++++-
> + THANKS =A0 =A0 =A0 =A0 =A0| =A0 =A01 +
> + src/sort.c =A0 =A0 =A0| =A0 10 ++++++----
> + tests/misc/sort | =A0 17 ++++++++++++++++-
> + 4 files changed, 28 insertions(+), 6 deletions(-)
> +
> +diff --git a/THANKS b/THANKS
> +index fe523fe..876a6b6 100644
> +--- a/THANKS
> ++++ b/THANKS
> +@@ -435,6 +435,7 @@ Ole Laursen =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 olau@hardworking.dk
> + Oliver Kiddle =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 okiddle@yahoo=
.co.uk
> + =D8rn E. Hansen =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oehansen@da=
imi.aau.dk
> + Oskar Liljeblad =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 osk@hem.passage=
n.se
> ++Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 otavio@ossystem=
s.com.br
> + P=E1draig Brady =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 P@draigBrad=
y.com
> + Patrick Mauritz =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oxygene@student=
enbude.ath.cx
> + Paul D. Smith =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 psmith@gnu.or=
g
> +diff --git a/src/sort.c b/src/sort.c
> +index 2e6ce87..f48d727 100644
> +--- a/src/sort.c
> ++++ b/src/sort.c
> +@@ -1,5 +1,5 @@
> + /* sort - sort lines of text (with all kinds of options).
> +- =A0 Copyright (C) 1988, 1991-2008 Free Software Foundation, Inc.
> ++ =A0 Copyright (C) 1988, 1991-2009 Free Software Foundation, Inc.
> +
> + =A0 =A0This program is free software: you can redistribute it and/or mo=
dify
> + =A0 =A0it under the terms of the GNU General Public License as publishe=
d by
> +@@ -2602,18 +2602,20 @@ avoid_trashing_input (struct sortfile *files, si=
ze_t ntemps,
> + =A0 =A0 =A0 =A0 pid_t pid;
> + =A0 =A0 =A0 =A0 char *temp =3D create_temp (&tftp, &pid);
> + =A0 =A0 =A0 =A0 size_t num_merged =3D 0;
> +- =A0 =A0 =A0 =A0while (i + num_merged < nfiles)
> ++ =A0 =A0 =A0 =A0do
> + =A0 =A0 =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 num_merged +=3D mergefiles (&files[i], 0, nfile=
s - i, tftp, temp);
> + =A0 =A0 =A0 =A0 =A0 =A0 files[i].name =3D temp;
> + =A0 =A0 =A0 =A0 =A0 =A0 files[i].pid =3D pid;
> +
> +- =A0 =A0 =A0 =A0 =A0 =A0memmove(&files[i], &files[i + num_merged],
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0num_merged * sizeof *files);
> ++ =A0 =A0 =A0 =A0 =A0 =A0if (i + num_merged < nfiles)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0memmove(&files[i + 1], &files[i + num_merge=
d],
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 num_merged * sizeof *files);
> + =A0 =A0 =A0 =A0 =A0 =A0 ntemps +=3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 nfiles -=3D num_merged - 1;;
> + =A0 =A0 =A0 =A0 =A0 =A0 i +=3D num_merged;
> + =A0 =A0 =A0 =A0 =A0 }
> ++ =A0 =A0 =A0 =A0while (i < nfiles);
> + =A0 =A0 =A0 }
> + =A0 =A0 }
> +
> +diff --git a/tests/misc/sort b/tests/misc/sort
> +index 4f377df..a27f47a 100755
> +--- a/tests/misc/sort
> ++++ b/tests/misc/sort
> +@@ -1,6 +1,6 @@
> + #!/usr/bin/perl
> +
> +-# Copyright (C) 2008 Free Software Foundation, Inc.
> ++# Copyright (C) 2008, 2009 Free Software Foundation, Inc.
> +
> + # This program is free software: you can redistribute it and/or modify
> + # it under the terms of the GNU General Public License as published by
> +@@ -339,6 +339,21 @@ my @Tests =3D
> + ["sort-numeric", '--sort=3Dnumeric', {IN=3D>".01\n0\n"}, {OUT=3D>"0\n.0=
1\n"}],
> + ["sort-gennum", '--sort=3Dgeneral-numeric',
> + =A0 {IN=3D>"1e2\n2e1\n"}, {OUT=3D>"2e1\n1e2\n"}],
> ++
> ++# -m with output file also used as an input file
> ++# In coreutils-7.2, this caused a segfault.
> ++# This test looks a little strange. =A0Here's why:
> ++# since we're using "-o f", standard output will be empty, hence OUT=3D=
>''
> ++# We still want to ensure that the output file, "f" has expected conten=
ts,
> ++# hence the added CMP=3D> directive.
> ++["output-is-input", '-m -o f', {IN=3D> {f=3D> "a\n"}}, {OUT=3D>''},
> ++ {CMP=3D> ["a\n", {'f'=3D> undef}]} ],
> ++["output-is-input-2", '-m -o f', {OUT=3D>''},
> ++ {IN=3D> {f=3D> "a\n"}}, {IN=3D> {g=3D> "b\n"}}, {IN=3D> {h=3D> "c\n"}}=
,
> ++ {CMP=3D> ["a\nb\nc\n", {'f'=3D> undef}]} ],
> ++["output-is-input-3", '-m -o f', {OUT=3D>''},
> ++ {IN=3D> {g=3D> "a\n"}}, {IN=3D> {h=3D> "b\n"}}, {IN=3D> {f=3D> "c\n"}}=
,
> ++ {CMP=3D> ["a\nb\nc\n", {'f'=3D> undef}]} ],
> + );
> +
> + # Add _POSIX2_VERSION=3D199209 to the environment of each test
> diff --git a/recipes/coreutils/coreutils-7.2/man.patch b/recipes/coreutil=
s/coreutils-7.2/man.patch
> new file mode 100644
> index 0000000..3de7c01
> --- /dev/null
> +++ b/recipes/coreutils/coreutils-7.2/man.patch
> @@ -0,0 +1,47 @@
> +
> +#
> +# Patch managed by http://www.holgerschurig.de/patcher.html
> +#
> +
> +Index: coreutils-7.1/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- coreutils-7.1.orig/configure.ac
> ++++ coreutils-7.1/configure.ac
> +@@ -373,6 +373,20 @@
> + # For a test of uniq: it uses the $LOCALE_FR envvar.
> + gt_LOCALE_FR
> +
> ++AC_MSG_CHECKING([whether to build man pages])
> ++AC_ARG_WITH(manpages,
> ++ =A0 =A0 =A0AS_HELP_STRING([--with-manpages],
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0[Enable building of manpages (default=3Dyes=
)]),
> ++ =A0 =A0 =A0[cu_cv_build_manpages=3D$enableval],
> ++ =A0 =A0 =A0[cu_cv_build_manpages=3Dyes])
> ++# help2man doesn't work when crosscompiling, as it needs to run the
> ++# binary that was built.
> ++if test x"$cross_compiling" =3D x"yes"; then
> ++ =A0cu_cv_build_manpages=3Dno
> ++fi
> ++AC_MSG_RESULT($cu_cv_build_manpages)
> ++AM_CONDITIONAL(ENABLE_MANPAGES, test x"$cu_cv_build_manpages" =3D x"yes=
")
> ++
> + AC_CONFIG_FILES(
> + =A0 Makefile
> + =A0 doc/Makefile
> +Index: coreutils-7.1/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- coreutils-7.1.orig/Makefile.am
> ++++ coreutils-7.1/Makefile.am
> +@@ -15,7 +15,12 @@
> + # You should have received a copy of the GNU General Public License
> + # along with this program. =A0If not, see <http://www.gnu.org/licenses/=
>.
> +
> ++if ENABLE_MANPAGES
> + SUBDIRS =3D lib src doc man po tests gnulib-tests
> ++else
> ++SUBDIRS =3D lib src doc po tests gnulib-tests
> ++endif
> ++
> + EXTRA_DIST =3D cfg.mk maint.mk \
> + =A0 .prev-version THANKS-to-translators THANKStt.in \
> + =A0 .version \
> diff --git a/recipes/coreutils/coreutils-7.2/onceonly.m4 b/recipes/coreut=
ils/coreutils-7.2/onceonly.m4
> new file mode 100644
> index 0000000..f6fec37
> --- /dev/null
> +++ b/recipes/coreutils/coreutils-7.2/onceonly.m4
> @@ -0,0 +1,63 @@
> +# onceonly.m4 serial 3
> +dnl Copyright (C) 2002, 2003 Free Software Foundation, Inc.
> +dnl This file is free software, distributed under the terms of the GNU
> +dnl General Public License. =A0As a special exception to the GNU General
> +dnl Public License, this file may be distributed as part of a program
> +dnl that contains a configuration script generated by Autoconf, under
> +dnl the same distribution terms as the rest of that program.
> +
> +dnl This file defines some "once only" variants of standard autoconf mac=
ros.
> +dnl =A0 AC_CHECK_HEADERS_ONCE =A0 =A0 =A0 =A0 like =A0AC_CHECK_HEADERS
> +dnl =A0 AC_CHECK_FUNCS_ONCE =A0 =A0 =A0 =A0 =A0 like =A0AC_CHECK_FUNCS
> +dnl =A0 AC_CHECK_DECLS_ONCE =A0 =A0 =A0 =A0 =A0 like =A0AC_CHECK_DECLS
> +dnl =A0 AC_REQUIRE([AC_HEADER_STDC]) =A0like =A0AC_HEADER_STDC
> +dnl The advantage is that the check for each of the headers/functions/de=
cls
> +dnl will be put only once into the 'configure' file. It keeps the size o=
f
> +dnl the 'configure' file down, and avoids redundant output when 'configu=
re'
> +dnl is run.
> +dnl The drawback is that the checks cannot be conditionalized. If you wr=
ite
> +dnl =A0 if some_condition; then gl_CHECK_HEADERS(stdlib.h); fi
> +dnl inside an AC_DEFUNed function, the gl_CHECK_HEADERS macro call expan=
ds to
> +dnl empty, and the check will be inserted before the body of the AC_DEFU=
Ned
> +dnl function.
> +
> +dnl Autoconf version 2.57 or newer is recommended.
> +AC_PREREQ(2.54)
> +
> +# AC_CHECK_HEADERS_ONCE(HEADER1 HEADER2 ...) is a once-only variant of
> +# AC_CHECK_HEADERS(HEADER1 HEADER2 ...).
> +AC_DEFUN([AC_CHECK_HEADERS_ONCE], [
> + =A0:
> + =A0AC_FOREACH([gl_HEADER_NAME], [$1], [
> + =A0 =A0AC_DEFUN([gl_CHECK_HEADER_]m4_quote(translit(defn([gl_HEADER_NAM=
E]),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 [-./], [___])), [
> + =A0 =A0 =A0AC_CHECK_HEADERS(gl_HEADER_NAME)
> + =A0 =A0])
> + =A0 =A0AC_REQUIRE([gl_CHECK_HEADER_]m4_quote(translit(gl_HEADER_NAME,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 [-./], [___])))
> + =A0])
> +])
> +
> +# AC_CHECK_FUNCS_ONCE(FUNC1 FUNC2 ...) is a once-only variant of
> +# AC_CHECK_FUNCS(FUNC1 FUNC2 ...).
> +AC_DEFUN([AC_CHECK_FUNCS_ONCE], [
> + =A0:
> + =A0AC_FOREACH([gl_FUNC_NAME], [$1], [
> + =A0 =A0AC_DEFUN([gl_CHECK_FUNC_]defn([gl_FUNC_NAME]), [
> + =A0 =A0 =A0AC_CHECK_FUNCS(defn([gl_FUNC_NAME]))
> + =A0 =A0])
> + =A0 =A0AC_REQUIRE([gl_CHECK_FUNC_]defn([gl_FUNC_NAME]))
> + =A0])
> +])
> +
> +# AC_CHECK_DECLS_ONCE(DECL1 DECL2 ...) is a once-only variant of
> +# AC_CHECK_DECLS(DECL1, DECL2, ...).
> +AC_DEFUN([AC_CHECK_DECLS_ONCE], [
> + =A0:
> + =A0AC_FOREACH([gl_DECL_NAME], [$1], [
> + =A0 =A0AC_DEFUN([gl_CHECK_DECL_]defn([gl_DECL_NAME]), [
> + =A0 =A0 =A0AC_CHECK_DECLS(defn([gl_DECL_NAME]))
> + =A0 =A0])
> + =A0 =A0AC_REQUIRE([gl_CHECK_DECL_]defn([gl_DECL_NAME]))
> + =A0])
> +])
> diff --git a/recipes/coreutils/coreutils-native_7.2.bb b/recipes/coreutil=
s/coreutils-native_7.2.bb
> new file mode 100644
> index 0000000..057dfa6
> --- /dev/null
> +++ b/recipes/coreutils/coreutils-native_7.2.bb
> @@ -0,0 +1,5 @@
> +FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/coreutils-=
${PV}"
> +S =3D "${WORKDIR}/coreutils-${PV}"
> +
> +require coreutils_${PV}.bb
> +inherit native
> diff --git a/recipes/coreutils/coreutils_7.2.bb b/recipes/coreutils/coreu=
tils_7.2.bb
> new file mode 100644
> index 0000000..f80921a
> --- /dev/null
> +++ b/recipes/coreutils/coreutils_7.2.bb
> @@ -0,0 +1,89 @@
> +require coreutils.inc
> +
> +SRC_URI =3D "\
> + =A0ftp://ftp.gnu.org/gnu/coreutils/coreutils-${PV}.tar.gz \
> + =A0file://automake-version.patch;patch=3D1 \
> + =A0file://man.patch;patch=3D1 \
> + =A0file://coreutils-7.2-fix-sort-segfault.patch;patch=3D1 \
> + =A0file://onceonly.m4 \
> +"
> +
> +# [ gets a special treatment and is not included in this
> +bindir_progs =3D "basename cksum comm csplit cut df dir dircolors dirnam=
e du \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 env expand expr factor fmt fold groups head=
 hostid id install \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 join link logname md5sum mkfifo nice nl noh=
up od paste pathchk \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pinky pr printenv printf ptx readlink seq s=
ha1sum shred sort \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 split stat sum tac tail tee test tr tsort t=
ty unexpand uniq \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unlink users vdir wc who whoami yes \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
> +
> +# hostname gets a special treatment and is not included in this
> +base_bindir_progs =3D "cat chgrp chmod chown cp date dd echo false kill =
\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ln ls mkdir mknod mv pwd rm rmdi=
r sleep stty sync touch \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0true uname \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"
> +
> +sbindir_progs=3D "chroot"
> +
> +do_configure_prepend() {
> + =A0 =A0 =A0 install -m 0644 ${WORKDIR}/onceonly.m4 ${S}/m4
> +}
> +
> +do_install () {
> + =A0 =A0 =A0 autotools_do_install
> +
> + =A0 =A0 =A0 # Renaming the utilities that should go in /usr/bin
> + =A0 =A0 =A0 for i in ${bindir_progs}; do mv ${D}${bindir}/$i ${D}${bind=
ir}/$i.${PN}; done
> +
> + =A0 =A0 =A0 # Renaming and moving the utilities that should go in /bin =
(FHS)
> + =A0 =A0 =A0 install -d ${D}${base_bindir}
> + =A0 =A0 =A0 for i in ${base_bindir_progs}; do mv ${D}${bindir}/$i ${D}$=
{base_bindir}/$i.${PN}; done
> +
> + =A0 =A0 =A0 # Renaming and moving the utilities that should go in /usr/=
sbin (FHS)
> + =A0 =A0 =A0 install -d ${D}${sbindir}
> + =A0 =A0 =A0 for i in ${sbindir_progs}; do mv ${D}${bindir}/$i ${D}${sbi=
ndir}/$i.${PN}; done
> +
> + =A0 =A0 =A0 # [ requires special handling because [.coreutils will caus=
e the sed stuff
> + =A0 =A0 =A0 # in update-alternatives to fail, therefore use lbracket - =
the name used
> + =A0 =A0 =A0 # for the actual source file.
> + =A0 =A0 =A0 mv ${D}${bindir}/[ ${D}${bindir}/lbracket.${PN}
> + =A0 =A0 =A0 # hostname and uptime separated. busybox's versions are pre=
ferred
> + =A0 =A0 =A0 if [ -e ${D}${bindir}/hostname ]; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mv ${D}${bindir}/hostname ${D}${base_bindir=
}/hostname.${PN}
> + =A0 =A0 =A0 fi
> + =A0 =A0 =A0 if [ -e ${D}${bindir}/uptime ]; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mv ${D}${bindir}/uptime ${D}${bindir}/uptim=
e.${PN}
> + =A0 =A0 =A0 fi
> +}
> +
> +pkg_postinst_${PN} () {
> + =A0 =A0 =A0 # The utilities in /usr/bin
> + =A0 =A0 =A0 for i in ${bindir_progs}; do update-alternatives --install =
${bindir}/$i $i $i.${PN} 100; done
> +
> + =A0 =A0 =A0 # The utilities in /bin
> + =A0 =A0 =A0 for i in ${base_bindir_progs}; do update-alternatives --ins=
tall ${base_bindir}/$i $i $i.${PN} 100; done
> +
> + =A0 =A0 =A0 # The utilities in /usr/sbin
> + =A0 =A0 =A0 for i in ${sbindir_progs}; do update-alternatives --install=
 ${sbindir}/$i $i $i.${PN} 100; done
> +
> + =A0 =A0 =A0 # Special cases. uptime and hostname is broken, prefer busy=
box's version. [ needs to be treated separately.
> + =A0 =A0 =A0 update-alternatives --install ${bindir}/uptime uptime uptim=
e.${PN} 10
> + =A0 =A0 =A0 update-alternatives --install ${base_bindir}/hostname hostn=
ame hostname.${PN} 10
> + =A0 =A0 =A0 update-alternatives --install '${bindir}/[' '[' 'lbracket.$=
{PN}' 100
> +}
> +
> +pkg_prerm_${PN} () {
> + =A0 =A0 =A0 # The utilities in /usr/bin
> + =A0 =A0 =A0 for i in ${bindir_progs}; do update-alternatives --remove $=
i $i.${PN}; done
> +
> + =A0 =A0 =A0 # The utilities in /bin
> + =A0 =A0 =A0 for i in ${base_bindir_progs}; do update-alternatives --rem=
ove $i $i.${PN}; done
> +
> + =A0 =A0 =A0 # The utilities in /usr/sbin
> + =A0 =A0 =A0 for i in ${sbindir_progs}; do update-alternatives --remove =
$i $i.${PN}; done
> +
> + =A0 =A0 =A0 # The special cases
> + =A0 =A0 =A0 update-alternatives --remove hostname hostname.${PN}
> + =A0 =A0 =A0 update-alternatives --remove uptime uptime.${PN}
> + =A0 =A0 =A0 update-alternatives --remove '[' 'lbracket.${PN}'
> +}
> --
> 1.6.2.4
>
>
> --
> This message has been scanned for viruses and
> dangerous content by MailScanner, and is
> believed to be clean.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>



--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


