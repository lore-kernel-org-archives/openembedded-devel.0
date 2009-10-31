Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1N48nY-0004DP-1U
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Oct 2009 08:54:59 +0100
Received: from gandalf.denix.org ([71.251.63.147]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KSD00CHWCLL0EZX@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	31 Oct 2009 02:53:46 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8096414AF60; Sat,
	31 Oct 2009 03:53:45 -0400 (EDT)
Date: Sat, 31 Oct 2009 03:53:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091031075345.GG16188@denix.org>
References: <1256726758-22996-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1256726758-22996-2-git-send-email-marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <1256726758-22996-2-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.7
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH 1/6] coreutils: add version 7.2
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
X-List-Received-Date: Sat, 31 Oct 2009 07:54:59 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 28, 2009 at 11:45:53AM +0100, Marcin Juszkiewicz wrote:
> From: Roman I Khimov <khimov@altell.ru>
> 
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  .../coreutils/coreutils-7.2/automake-version.patch |   13 +++
>  .../coreutils-7.2-fix-sort-segfault.patch          |  103 ++++++++++++++++++++
>  recipes/coreutils/coreutils-7.2/man.patch          |   47 +++++++++
>  recipes/coreutils/coreutils-7.2/onceonly.m4        |   63 ++++++++++++
>  recipes/coreutils/coreutils-native_7.2.bb          |    5 +
>  recipes/coreutils/coreutils_7.2.bb                 |   89 +++++++++++++++++
>  6 files changed, 320 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/coreutils/coreutils-7.2/automake-version.patch
>  create mode 100644 recipes/coreutils/coreutils-7.2/coreutils-7.2-fix-sort-segfault.patch
>  create mode 100644 recipes/coreutils/coreutils-7.2/man.patch
>  create mode 100644 recipes/coreutils/coreutils-7.2/onceonly.m4
>  create mode 100644 recipes/coreutils/coreutils-native_7.2.bb
>  create mode 100644 recipes/coreutils/coreutils_7.2.bb
> 
> diff --git a/recipes/coreutils/coreutils-7.2/automake-version.patch b/recipes/coreutils/coreutils-7.2/automake-version.patch
> new file mode 100644
> index 0000000..497ef15
> --- /dev/null
> +++ b/recipes/coreutils/coreutils-7.2/automake-version.patch
> @@ -0,0 +1,13 @@
> +Index: coreutils-7.1/configure.ac
> +===================================================================
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
> diff --git a/recipes/coreutils/coreutils-7.2/coreutils-7.2-fix-sort-segfault.patch b/recipes/coreutils/coreutils-7.2/coreutils-7.2-fix-sort-segfault.patch
> new file mode 100644
> index 0000000..b4ee5b8
> --- /dev/null
> +++ b/recipes/coreutils/coreutils-7.2/coreutils-7.2-fix-sort-segfault.patch
> @@ -0,0 +1,103 @@
> +OE modifications to the original patch:
> + * Removed NEWS hunk to apply on vanilla 7.2 coreutils
> +
> +>From 570beb56f58bb087a614af885bec7e9cf6b19423 Mon Sep 17 00:00:00 2001
> +From: Jim Meyering <meyering@redhat.com>
> +Date: Wed, 22 Apr 2009 08:45:27 +0200
> +Subject: [PATCH] sort -m: don't segfault when output file is also an input =
> +file
> +
> +* src/sort.c (avoid_trashing_input): Fix an off-by-one error and
> +guard the use of memmove.
> +* NEWS (Bug fixes): Mention it.
> +* tests/misc/sort: Add tests to exercise the offending code.
> +* THANKS: Update.
> +Reported by Otavio Salvador in http://bugs.debian.org/525048.
> +---
> + NEWS            |    6 +++++-
> + THANKS          |    1 +
> + src/sort.c      |   10 ++++++----
> + tests/misc/sort |   17 ++++++++++++++++-
> + 4 files changed, 28 insertions(+), 6 deletions(-)
> +
> +diff --git a/THANKS b/THANKS
> +index fe523fe..876a6b6 100644
> +--- a/THANKS
> ++++ b/THANKS
> +@@ -435,6 +435,7 @@ Ole Laursen                         olau@hardworking.dk
> + Oliver Kiddle                       okiddle@yahoo.co.uk
> + ??rn E. Hansen                       oehansen@daimi.aau.dk
> + Oskar Liljeblad                     osk@hem.passagen.se
> ++Otavio Salvador                     otavio@ossystems.com.br
> + P??draig Brady                       P@draigBrady.com
> + Patrick Mauritz                     oxygene@studentenbude.ath.cx
> + Paul D. Smith                       psmith@gnu.org
> +diff --git a/src/sort.c b/src/sort.c
> +index 2e6ce87..f48d727 100644
> +--- a/src/sort.c
> ++++ b/src/sort.c
> +@@ -1,5 +1,5 @@
> + /* sort - sort lines of text (with all kinds of options).
> +-   Copyright (C) 1988, 1991-2008 Free Software Foundation, Inc.
> ++   Copyright (C) 1988, 1991-2009 Free Software Foundation, Inc.
> +
> +    This program is free software: you can redistribute it and/or modify
> +    it under the terms of the GNU General Public License as published by
> +@@ -2602,18 +2602,20 @@ avoid_trashing_input (struct sortfile *files, size_t ntemps,
> +	  pid_t pid;
> +	  char *temp = create_temp (&tftp, &pid);
> +	  size_t num_merged = 0;
> +-	  while (i + num_merged < nfiles)
> ++	  do
> +	    {
> +	      num_merged += mergefiles (&files[i], 0, nfiles - i, tftp, temp);
> +	      files[i].name = temp;
> +	      files[i].pid = pid;
> +
> +-	      memmove(&files[i], &files[i + num_merged],
> +-		      num_merged * sizeof *files);
> ++	      if (i + num_merged < nfiles)
> ++	        memmove(&files[i + 1], &files[i + num_merged],
> ++		       num_merged * sizeof *files);
> +	      ntemps += 1;
> +	      nfiles -= num_merged - 1;;
> +	      i += num_merged;
> +	    }
> ++	  while (i < nfiles);
> +	}
> +     }
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
> +@@ -339,6 +339,21 @@ my @Tests =
> + ["sort-numeric", '--sort=numeric', {IN=>".01\n0\n"}, {OUT=>"0\n.01\n"}],
> + ["sort-gennum", '--sort=general-numeric',
> +   {IN=>"1e2\n2e1\n"}, {OUT=>"2e1\n1e2\n"}],
> ++
> ++# -m with output file also used as an input file
> ++# In coreutils-7.2, this caused a segfault.
> ++# This test looks a little strange.  Here's why:
> ++# since we're using "-o f", standard output will be empty, hence OUT=>''
> ++# We still want to ensure that the output file, "f" has expected contents,
> ++# hence the added CMP=> directive.
> ++["output-is-input", '-m -o f', {IN=> {f=> "a\n"}}, {OUT=>''},
> ++ {CMP=> ["a\n", {'f'=> undef}]} ],
> ++["output-is-input-2", '-m -o f', {OUT=>''},
> ++ {IN=> {f=> "a\n"}}, {IN=> {g=> "b\n"}}, {IN=> {h=> "c\n"}},
> ++ {CMP=> ["a\nb\nc\n", {'f'=> undef}]} ],
> ++["output-is-input-3", '-m -o f', {OUT=>''},
> ++ {IN=> {g=> "a\n"}}, {IN=> {h=> "b\n"}}, {IN=> {f=> "c\n"}},
> ++ {CMP=> ["a\nb\nc\n", {'f'=> undef}]} ],
> + );
> +
> + # Add _POSIX2_VERSION=199209 to the environment of each test
> diff --git a/recipes/coreutils/coreutils-7.2/man.patch b/recipes/coreutils/coreutils-7.2/man.patch
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
> +===================================================================
> +--- coreutils-7.1.orig/configure.ac
> ++++ coreutils-7.1/configure.ac
> +@@ -373,6 +373,20 @@
> + # For a test of uniq: it uses the $LOCALE_FR envvar.
> + gt_LOCALE_FR
> + 
> ++AC_MSG_CHECKING([whether to build man pages])
> ++AC_ARG_WITH(manpages, 
> ++	AS_HELP_STRING([--with-manpages],
> ++		[Enable building of manpages (default=yes)]),
> ++	[cu_cv_build_manpages=$enableval],
> ++	[cu_cv_build_manpages=yes])
> ++# help2man doesn't work when crosscompiling, as it needs to run the
> ++# binary that was built.
> ++if test x"$cross_compiling" = x"yes"; then
> ++  cu_cv_build_manpages=no
> ++fi
> ++AC_MSG_RESULT($cu_cv_build_manpages)
> ++AM_CONDITIONAL(ENABLE_MANPAGES, test x"$cu_cv_build_manpages" = x"yes")
> ++
> + AC_CONFIG_FILES(
> +   Makefile
> +   doc/Makefile
> +Index: coreutils-7.1/Makefile.am
> +===================================================================
> +--- coreutils-7.1.orig/Makefile.am
> ++++ coreutils-7.1/Makefile.am
> +@@ -15,7 +15,12 @@
> + # You should have received a copy of the GNU General Public License
> + # along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + 
> ++if ENABLE_MANPAGES
> + SUBDIRS = lib src doc man po tests gnulib-tests
> ++else
> ++SUBDIRS = lib src doc po tests gnulib-tests
> ++endif
> ++
> + EXTRA_DIST = cfg.mk maint.mk \
> +   .prev-version THANKS-to-translators THANKStt.in \
> +   .version \
> diff --git a/recipes/coreutils/coreutils-7.2/onceonly.m4 b/recipes/coreutils/coreutils-7.2/onceonly.m4
> new file mode 100644
> index 0000000..f6fec37
> --- /dev/null
> +++ b/recipes/coreutils/coreutils-7.2/onceonly.m4
> @@ -0,0 +1,63 @@
> +# onceonly.m4 serial 3
> +dnl Copyright (C) 2002, 2003 Free Software Foundation, Inc.
> +dnl This file is free software, distributed under the terms of the GNU
> +dnl General Public License.  As a special exception to the GNU General
> +dnl Public License, this file may be distributed as part of a program
> +dnl that contains a configuration script generated by Autoconf, under
> +dnl the same distribution terms as the rest of that program.
> +
> +dnl This file defines some "once only" variants of standard autoconf macros.
> +dnl   AC_CHECK_HEADERS_ONCE         like  AC_CHECK_HEADERS
> +dnl   AC_CHECK_FUNCS_ONCE           like  AC_CHECK_FUNCS
> +dnl   AC_CHECK_DECLS_ONCE           like  AC_CHECK_DECLS
> +dnl   AC_REQUIRE([AC_HEADER_STDC])  like  AC_HEADER_STDC
> +dnl The advantage is that the check for each of the headers/functions/decls
> +dnl will be put only once into the 'configure' file. It keeps the size of
> +dnl the 'configure' file down, and avoids redundant output when 'configure'
> +dnl is run.
> +dnl The drawback is that the checks cannot be conditionalized. If you write
> +dnl   if some_condition; then gl_CHECK_HEADERS(stdlib.h); fi
> +dnl inside an AC_DEFUNed function, the gl_CHECK_HEADERS macro call expands to
> +dnl empty, and the check will be inserted before the body of the AC_DEFUNed
> +dnl function.
> +
> +dnl Autoconf version 2.57 or newer is recommended.
> +AC_PREREQ(2.54)
> +
> +# AC_CHECK_HEADERS_ONCE(HEADER1 HEADER2 ...) is a once-only variant of
> +# AC_CHECK_HEADERS(HEADER1 HEADER2 ...).
> +AC_DEFUN([AC_CHECK_HEADERS_ONCE], [
> +  :
> +  AC_FOREACH([gl_HEADER_NAME], [$1], [
> +    AC_DEFUN([gl_CHECK_HEADER_]m4_quote(translit(defn([gl_HEADER_NAME]),
> +                                                 [-./], [___])), [
> +      AC_CHECK_HEADERS(gl_HEADER_NAME)
> +    ])
> +    AC_REQUIRE([gl_CHECK_HEADER_]m4_quote(translit(gl_HEADER_NAME,
> +                                                   [-./], [___])))
> +  ])
> +])
> +
> +# AC_CHECK_FUNCS_ONCE(FUNC1 FUNC2 ...) is a once-only variant of
> +# AC_CHECK_FUNCS(FUNC1 FUNC2 ...).
> +AC_DEFUN([AC_CHECK_FUNCS_ONCE], [
> +  :
> +  AC_FOREACH([gl_FUNC_NAME], [$1], [
> +    AC_DEFUN([gl_CHECK_FUNC_]defn([gl_FUNC_NAME]), [
> +      AC_CHECK_FUNCS(defn([gl_FUNC_NAME]))
> +    ])
> +    AC_REQUIRE([gl_CHECK_FUNC_]defn([gl_FUNC_NAME]))
> +  ])
> +])
> +
> +# AC_CHECK_DECLS_ONCE(DECL1 DECL2 ...) is a once-only variant of
> +# AC_CHECK_DECLS(DECL1, DECL2, ...).
> +AC_DEFUN([AC_CHECK_DECLS_ONCE], [
> +  :
> +  AC_FOREACH([gl_DECL_NAME], [$1], [
> +    AC_DEFUN([gl_CHECK_DECL_]defn([gl_DECL_NAME]), [
> +      AC_CHECK_DECLS(defn([gl_DECL_NAME]))
> +    ])
> +    AC_REQUIRE([gl_CHECK_DECL_]defn([gl_DECL_NAME]))
> +  ])
> +])
> diff --git a/recipes/coreutils/coreutils-native_7.2.bb b/recipes/coreutils/coreutils-native_7.2.bb
> new file mode 100644
> index 0000000..057dfa6
> --- /dev/null
> +++ b/recipes/coreutils/coreutils-native_7.2.bb
> @@ -0,0 +1,5 @@
> +FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/coreutils-${PV}"
> +S = "${WORKDIR}/coreutils-${PV}"
> +
> +require coreutils_${PV}.bb
> +inherit native
> diff --git a/recipes/coreutils/coreutils_7.2.bb b/recipes/coreutils/coreutils_7.2.bb
> new file mode 100644
> index 0000000..f80921a
> --- /dev/null
> +++ b/recipes/coreutils/coreutils_7.2.bb
> @@ -0,0 +1,89 @@
> +require coreutils.inc
> +
> +SRC_URI = "\
> +  ftp://ftp.gnu.org/gnu/coreutils/coreutils-${PV}.tar.gz \
> +  file://automake-version.patch;patch=1 \
> +  file://man.patch;patch=1 \
> +  file://coreutils-7.2-fix-sort-segfault.patch;patch=1 \
> +  file://onceonly.m4 \
> +"
> +
> +# [ gets a special treatment and is not included in this
> +bindir_progs = "basename cksum comm csplit cut df dir dircolors dirname du \
> +		env expand expr factor fmt fold groups head hostid id install \
> +		join link logname md5sum mkfifo nice nl nohup od paste pathchk \
> +		pinky pr printenv printf ptx readlink seq sha1sum shred sort \
> +		split stat sum tac tail tee test tr tsort tty unexpand uniq \
> +		unlink users vdir wc who whoami yes \
> +		"
> +
> +# hostname gets a special treatment and is not included in this
> +base_bindir_progs = "cat chgrp chmod chown cp date dd echo false kill \
> +		     ln ls mkdir mknod mv pwd rm rmdir sleep stty sync touch \
> +		     true uname \
> +		     "
> +
> +sbindir_progs= "chroot"
> +
> +do_configure_prepend() {
> +	install -m 0644 ${WORKDIR}/onceonly.m4 ${S}/m4
> +}
> +
> +do_install () {
> +	autotools_do_install
> +
> +	# Renaming the utilities that should go in /usr/bin
> +	for i in ${bindir_progs}; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${PN}; done
> +
> +	# Renaming and moving the utilities that should go in /bin (FHS)
> +	install -d ${D}${base_bindir}
> +	for i in ${base_bindir_progs}; do mv ${D}${bindir}/$i ${D}${base_bindir}/$i.${PN}; done
> +
> +	# Renaming and moving the utilities that should go in /usr/sbin (FHS)
> +	install -d ${D}${sbindir}
> +	for i in ${sbindir_progs}; do mv ${D}${bindir}/$i ${D}${sbindir}/$i.${PN}; done
> +
> +	# [ requires special handling because [.coreutils will cause the sed stuff
> +	# in update-alternatives to fail, therefore use lbracket - the name used
> +	# for the actual source file.
> +	mv ${D}${bindir}/[ ${D}${bindir}/lbracket.${PN}
> +	# hostname and uptime separated. busybox's versions are preferred
> +	if [ -e ${D}${bindir}/hostname ]; then
> +		mv ${D}${bindir}/hostname ${D}${base_bindir}/hostname.${PN}
> +	fi
> +	if [ -e ${D}${bindir}/uptime ]; then
> +		mv ${D}${bindir}/uptime ${D}${bindir}/uptime.${PN}
> +	fi
> +}
> +
> +pkg_postinst_${PN} () {
> +	# The utilities in /usr/bin
> +	for i in ${bindir_progs}; do update-alternatives --install ${bindir}/$i $i $i.${PN} 100; done
> +
> +	# The utilities in /bin
> +	for i in ${base_bindir_progs}; do update-alternatives --install ${base_bindir}/$i $i $i.${PN} 100; done
> +
> +	# The utilities in /usr/sbin
> +	for i in ${sbindir_progs}; do update-alternatives --install ${sbindir}/$i $i $i.${PN} 100; done
> +
> +	# Special cases. uptime and hostname is broken, prefer busybox's version. [ needs to be treated separately.
> +	update-alternatives --install ${bindir}/uptime uptime uptime.${PN} 10
> +	update-alternatives --install ${base_bindir}/hostname hostname hostname.${PN} 10
> +	update-alternatives --install '${bindir}/[' '[' 'lbracket.${PN}' 100
> +}
> +
> +pkg_prerm_${PN} () {
> +	# The utilities in /usr/bin
> +	for i in ${bindir_progs}; do update-alternatives --remove $i $i.${PN}; done
> +
> +	# The utilities in /bin
> +	for i in ${base_bindir_progs}; do update-alternatives --remove $i $i.${PN}; done
> +
> +	# The utilities in /usr/sbin
> +	for i in ${sbindir_progs}; do update-alternatives --remove $i $i.${PN}; done
> +
> +	# The special cases
> +	update-alternatives --remove hostname hostname.${PN}
> +	update-alternatives --remove uptime uptime.${PN}
> +	update-alternatives --remove '[' 'lbracket.${PN}'
> +}
> -- 
> 1.6.5
> 
> 
> 
> 

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



