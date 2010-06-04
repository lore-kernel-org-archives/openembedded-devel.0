Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OKRX8-0003B0-3E
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 09:41:46 +0200
Received: by mail-fx0-f47.google.com with SMTP id 9so590619fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 00:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Nye6Fx1Xi+1m1AMAUAYsAlNrTPeR9euPQRbl565a5sI=;
	b=xsEjPXdL6u1ATJSWykcmkD0jCCfmVK4BKCH3gOL2GbiAv4Irk8R+yd9TSS1+7Iz7ov
	dQzzGaTRHiDk9olTcOKkVJoeTbIWWRAceOrpUz3y3pqJBhLhi9t9MmGZ5m4w/pXK1PcR
	mJNLZ/PWz50/0jRrVNWfouVNIHi9fSP1CDnhk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=GjUtRQ00znUxiTUXAAxdvsf4Ts4hpmxVoZGacO8L2KnqqWJQgXnDtckPU1UTV41UeU
	LO4S0J84CnmU93BoZvLyz/XYOALL7T9f88rMnz8HPV8YafgC6PX6vgCpI/BK40VcyR1l
	wbr6RoanplUYSWf0uRQB7kX57nxeZQDjePB1g=
MIME-Version: 1.0
Received: by 10.223.29.28 with SMTP id o28mr64866fac.20.1275637043247; Fri, 04 
	Jun 2010 00:37:23 -0700 (PDT)
Received: by 10.223.106.138 with HTTP; Fri, 4 Jun 2010 00:37:23 -0700 (PDT)
In-Reply-To: <1275510896-30845-4-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
	<1275510896-30845-4-git-send-email-raj.khem@gmail.com>
Date: Fri, 4 Jun 2010 09:37:23 +0200
Message-ID: <AANLkTimuc2dtfmbduEhLKLAxcjg_tR2Yah1jZxYBZp7y@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 03/16] gettext-0.18: Add recipe for 0.18
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
X-List-Received-Date: Fri, 04 Jun 2010 07:41:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 2, 2010 at 10:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
> * gl_cv_func_unsetenv_works is not computed correctly in cross
> =A0environment so cache it.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
> =A0recipes/gettext/gettext-0.18/autotools.patch =A0 =A0 =A0 | =A0 28 ++++=
++++++
> =A0.../gettext-autoconf-lib-link-no-L.patch =A0 =A0 =A0 =A0 =A0 | =A0 28 =
++++++++++
> =A0.../gettext-error_print_progname.patch =A0 =A0 =A0 =A0 =A0 =A0 | =A0 1=
3 +++++
> =A0.../gnulib-uclibc-sched_param-def.patch =A0 =A0 =A0 =A0 =A0 =A0| =A0 1=
9 +++++++
> =A0recipes/gettext/gettext_0.18.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 57 ++++++++++++++++++++
> =A0site/common-glibc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0| =A0 =A03 +
> =A06 files changed, 148 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/gettext/gettext-0.18/autotools.patch
> =A0create mode 100644 recipes/gettext/gettext-0.18/gettext-autoconf-lib-l=
ink-no-L.patch
> =A0create mode 100644 recipes/gettext/gettext-0.18/gettext-error_print_pr=
ogname.patch
> =A0create mode 100644 recipes/gettext/gettext-0.18/gnulib-uclibc-sched_pa=
ram-def.patch
> =A0create mode 100644 recipes/gettext/gettext_0.18.bb
>
> diff --git a/recipes/gettext/gettext-0.18/autotools.patch b/recipes/gette=
xt/gettext-0.18/autotools.patch
> new file mode 100644
> index 0000000..8302b34
> --- /dev/null
> +++ b/recipes/gettext/gettext-0.18/autotools.patch
> @@ -0,0 +1,28 @@
> +Index: gettext-0.18/gettext-runtime/man/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gettext-0.18.orig/gettext-runtime/man/Makefile.am =A02009-06-28 12:4=
4:04.000000000 -0700
> ++++ gettext-0.18/gettext-runtime/man/Makefile.am =A0 =A0 =A0 2010-05-18 =
16:58:51.130518057 -0700
> +@@ -159,8 +159,7 @@ bind_textdomain_codeset.3.html: bind_tex
> + =A0 =A0 =A0 $(MAN2HTML) $(srcdir)/bind_textdomain_codeset.3.in | sed -e=
 '/CreationDate:/d' > t-$@
> + =A0 =A0 =A0 mv t-$@ $@
> +
> +-install-html-local:
> +- =A0 =A0 =A0$(mkdir_p) $(DESTDIR)$(htmldir)
> ++install-html: installdirs-html
> + =A0 =A0 =A0 for file in $(man_HTML); do \
> + =A0 =A0 =A0 =A0 if test -f $$file; then dir=3D.; else dir=3D$(srcdir); =
fi; \
> + =A0 =A0 =A0 =A0 $(INSTALL_DATA) $$dir/$$file $(DESTDIR)$(htmldir)/$$fil=
e; \
> +Index: gettext-0.18/gettext-tools/man/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gettext-0.18.orig/gettext-tools/man/Makefile.am =A0 =A02009-06-28 12=
:44:04.000000000 -0700
> ++++ gettext-0.18/gettext-tools/man/Makefile.am 2010-05-18 16:58:51.13051=
8057 -0700
> +@@ -186,8 +186,7 @@ autopoint.1.html: autopoint.1
> + =A0 =A0 =A0 $(MAN2HTML) `if test -f autopoint.1; then echo .; else echo=
 $(srcdir); fi`/autopoint.1 | sed -e '/CreationDate:/d' > t-$@
> + =A0 =A0 =A0 mv t-$@ $@
> +
> +-install-html-local:
> +- =A0 =A0 =A0$(mkdir_p) $(DESTDIR)$(htmldir)
> ++install-html: installdirs-html
> + =A0 =A0 =A0 for file in $(man_HTML); do \
> + =A0 =A0 =A0 =A0 if test -f $$file; then dir=3D.; else dir=3D$(srcdir); =
fi; \
> + =A0 =A0 =A0 =A0 $(INSTALL_DATA) $$dir/$$file $(DESTDIR)$(htmldir)/$$fil=
e; \
> diff --git a/recipes/gettext/gettext-0.18/gettext-autoconf-lib-link-no-L.=
patch b/recipes/gettext/gettext-0.18/gettext-autoconf-lib-link-no-L.patch
> new file mode 100644
> index 0000000..d2063b0
> --- /dev/null
> +++ b/recipes/gettext/gettext-0.18/gettext-autoconf-lib-link-no-L.patch
> @@ -0,0 +1,28 @@
> +Index: gettext-0.18/gettext-runtime/gnulib-m4/lib-link.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gettext-0.18.orig/gettext-runtime/gnulib-m4/lib-link.m4 =A0 =A02010-=
05-18 17:12:12.593014616 -0700
> ++++ gettext-0.18/gettext-runtime/gnulib-m4/lib-link.m4 2010-05-18 17:12:=
58.631176939 -0700
> +@@ -312,6 +312,9 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi
> + =A0 =A0 =A0 =A0 =A0 =A0 fi
> + =A0 =A0 =A0 =A0 =A0 fi
> ++ =A0 =A0 =A0 =A0 =A0dnl Just let the compiler find the library, the com=
piler and user are smarter then this script
> ++ =A0 =A0 =A0 =A0 =A0dnl when cross compiling and working with a relocat=
ed install.
> ++ =A0 =A0 =A0 =A0 =A0found_dir=3D""
> + =A0 =A0 =A0 =A0 =A0 if test "X$found_dir" =3D "X"; then
> + =A0 =A0 =A0 =A0 =A0 =A0 for x in $LDFLAGS $LTLIB[]NAME; do
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 AC_LIB_WITH_FINAL_PREFIX([eval x=3D\"$x\"])
> +Index: gettext-0.18/gettext-tools/gnulib-m4/lib-link.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gettext-0.18.orig/gettext-tools/gnulib-m4/lib-link.m4 =A0 =A0 =A0201=
0-05-18 17:12:12.633052946 -0700
> ++++ gettext-0.18/gettext-tools/gnulib-m4/lib-link.m4 =A0 2010-05-18 17:1=
3:35.020559106 -0700
> +@@ -312,6 +312,9 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi
> + =A0 =A0 =A0 =A0 =A0 =A0 fi
> + =A0 =A0 =A0 =A0 =A0 fi
> ++ =A0 =A0 =A0 =A0 =A0dnl Just let the compiler find the library, the com=
piler and user are smarter then this script
> ++ =A0 =A0 =A0 =A0 =A0dnl when cross compiling and working with a relocat=
ed install.
> ++ =A0 =A0 =A0 =A0 =A0found_dir=3D""
> + =A0 =A0 =A0 =A0 =A0 if test "X$found_dir" =3D "X"; then
> + =A0 =A0 =A0 =A0 =A0 =A0 for x in $LDFLAGS $LTLIB[]NAME; do
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 AC_LIB_WITH_FINAL_PREFIX([eval x=3D\"$x\"])
> diff --git a/recipes/gettext/gettext-0.18/gettext-error_print_progname.pa=
tch b/recipes/gettext/gettext-0.18/gettext-error_print_progname.patch
> new file mode 100644
> index 0000000..0f67cd0
> --- /dev/null
> +++ b/recipes/gettext/gettext-0.18/gettext-error_print_progname.patch
> @@ -0,0 +1,13 @@
> +Index: gettext-0.17/gettext-tools/libgettextpo/error.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gettext-0.17.orig/gettext-tools/libgettextpo/error.h =A0 =A0 =A0 200=
8-07-27 21:16:25.561115527 +0200
> ++++ gettext-0.17/gettext-tools/libgettextpo/error.h =A0 =A02008-07-27 21=
:16:52.454440505 +0200
> +@@ -49,7 +49,7 @@
> + /* If NULL, error will flush stdout, then print on stderr the program
> + =A0 =A0name, a colon and a space. =A0Otherwise, error will call this
> + =A0 =A0function without parameters instead. =A0*/
> +-extern DLL_VARIABLE void (*error_print_progname) (void);
> ++void (*error_print_progname) (void);
> +
> + /* This variable is incremented each time `error' is called. =A0*/
> + extern DLL_VARIABLE unsigned int error_message_count;
> diff --git a/recipes/gettext/gettext-0.18/gnulib-uclibc-sched_param-def.p=
atch b/recipes/gettext/gettext-0.18/gnulib-uclibc-sched_param-def.patch
> new file mode 100644
> index 0000000..074723a
> --- /dev/null
> +++ b/recipes/gettext/gettext-0.18/gnulib-uclibc-sched_param-def.patch
> @@ -0,0 +1,19 @@
> +uclibc defines __GLIBC__ but it does not expose struct shed_param as muc=
h as glibc
> +and is not needed too per standard. gnulib attempts to use it but we hav=
e to account
> +for it because in this case uclibc does not behave like glibc.
> +
> +-Khem
> +
> +Index: gettext-0.18/gettext-tools/gnulib-lib/spawn.in.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gettext-0.18.orig/gettext-tools/gnulib-lib/spawn.in.h =A0 =A0 =A0201=
0-06-01 17:20:09.036427575 -0700
> ++++ gettext-0.18/gettext-tools/gnulib-lib/spawn.in.h =A0 2010-06-01 17:2=
0:38.856613943 -0700
> +@@ -31,7 +31,7 @@
> +
> + /* Get definitions of 'struct sched_param' and 'sigset_t'.
> + =A0 =A0But avoid namespace pollution on glibc systems. =A0*/
> +-#ifndef __GLIBC__
> ++#if !defined __GLIBC__ || defined __UCLIBC__
> + # include <sched.h>
> + # include <signal.h>
> + #endif
> diff --git a/recipes/gettext/gettext_0.18.bb b/recipes/gettext/gettext_0.=
18.bb
> new file mode 100644
> index 0000000..5e22b5a
> --- /dev/null
> +++ b/recipes/gettext/gettext_0.18.bb
> @@ -0,0 +1,57 @@
> +DESCRIPTION =3D "The GNU internationalization library."
> +HOMEPAGE =3D "http://www.gnu.org/software/gettext/gettext.html"
> +SECTION =3D "libs"
> +LICENSE =3D "GPLv3"
> +PR =3D "r0"
> +DEPENDS =3D "gettext-native virtual/libiconv ncurses expat"
> +DEPENDS_virtclass-native =3D "libxml2-native"
> +PROVIDES =3D "virtual/libintl"
> +PROVIDES_virtclass-native =3D ""
> +RCONFLICTS_gettext-libintl =3D "proxy-libintl"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +SRC_URI =3D "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
> + =A0 =A0 =A0 =A0 =A0 file://autotools.patch \
> + =A0 =A0 =A0 =A0 =A0 file://gettext-autoconf-lib-link-no-L.patch \
> + =A0 =A0 =A0 =A0 =A0file://gnulib-uclibc-sched_param-def.patch \
> + =A0 =A0 =A0 =A0 "
> +
> +SRC_URI_append_libc-uclibc =3D " file://gettext-error_print_progname.pat=
ch"
> +
> +PARALLEL_MAKE =3D ""
> +
> +inherit autotools
> +
> +EXTRA_OECONF +=3D "--without-lispdir \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-csharp \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-libasprintf \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-java \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-native-java \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-openmp \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--with-included-glib \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--without-emacs \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
> +acpaths =3D '-I ${S}/gnulib-local/m4/ \
> + =A0 =A0 =A0 =A0 =A0-I ${S}/gettext-runtime/m4 \
> + =A0 =A0 =A0 =A0 =A0-I ${S}/gettext-tools/m4'
> +
> +
> +# these lack the .x behind the .so, but shouldn't be in the -dev package
> +# Otherwise you get the following results:
> +# 7.4M =A0 =A0glibc/images/ep93xx/Angstrom-console-image-glibc-ipk-2008.=
1-test-20080104-ep93xx.rootfs.tar.gz
> +# 25M =A0 =A0 uclibc/images/ep93xx/Angstrom-console-image-uclibc-ipk-200=
8.1-test-20080104-ep93xx.rootfs.tar.gz
> +# because gettext depends on gettext-dev, which pulls in more -dev packa=
ges:
> +# 15228 =A0 KiB /ep93xx/libstdc++-dev_4.2.2-r2_ep93xx.ipk
> +# 1300 =A0 =A0KiB /ep93xx/uclibc-dev_0.9.29-r8_ep93xx.ipk
> +# 140 =A0 =A0 KiB /armv4t/gettext-dev_0.14.1-r6_armv4t.ipk
> +# 4 =A0 =A0 =A0 KiB /ep93xx/libgcc-s-dev_4.2.2-r2_ep93xx.ipk
> +
> +PACKAGES =3D+ "gettext-libintl libgettextlib libgettextsrc"
> +
> +FILES_gettext-libintl =3D "${libdir}/libintl*.so.*"
> +FILES_libgettextlib =3D "${libdir}/libgettextlib-*.so*"
> +FILES_libgettextsrc =3D "${libdir}/libgettextsrc-*.so*"
> +
> +SRC_URI[md5sum] =3D "d52a3e061032a1ed13856d42fc86f0fd"
> +SRC_URI[sha256sum] =3D "02342c1de18c03c601f8b91cbd896b70486a4b945bd816f3=
4541e0d7b5a96fe5"
> diff --git a/site/common-glibc b/site/common-glibc
> index b298e46..6dc2363 100644
> --- a/site/common-glibc
> +++ b/site/common-glibc
> @@ -22,6 +22,9 @@ ac_cv_func_vsnprintf_c99=3D${ac_cv_func_vsnprintf_c99=
=3Dyes}
> =A0glib_cv_compliant_posix_memalign=3D${glib_cv_compliant_posix_memalign=
=3D1}
> =A0glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
>
> +# gettext
> +gl_cv_func_unsetenv_works=3D${gl_cv_func_unsetenv_works=3Dyes}
> +
> =A0#dbus-glib
> =A0ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
>
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


