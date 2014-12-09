Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4FF4E7254B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Dec 2014 17:52:28 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so1548058wgh.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Dec 2014 09:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aGNLIYEjALAiclcN5attGzFnuYtELF0w0kDiAklOXWA=;
	b=rpFXB86SHHPrKDbCEQYr6iGI+eNB6ClUGNCXX+LqHk7CQ9CAUS82AAqRCORPDtbhqy
	+z3eD38BeRJZniUBv+U8H3K7oi3i8rM2TjgCvNLotl+joWvRGymiZ3qVqQhQUsS/Loss
	zsFSO2nqWosnjbIk5FbTTabyMGp5hwMHucleWhjdUkDonvrolQSby36qX8hOsl9EsSDp
	xdAIvo/a8m+ghEfj5vPo+DNQe9079kqS7TX07ZqMVtnkmVxbHnA3BYv8a+RsBPZoUkZ+
	4B1th+jeGiRtiJlQyCih6HHnRvNHwMZzP75YVWlxOfvimkC0U8x+8+zoX1tfLWhyOyQn
	vtvQ==
X-Received: by 10.180.73.7 with SMTP id h7mr34334178wiv.83.1418147547841;
	Tue, 09 Dec 2014 09:52:27 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	p14sm3152953wie.1.2014.12.09.09.52.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Dec 2014 09:52:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 9 Dec 2014 18:52:28 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141209175228.GQ2470@jama>
References: <1417675022-7660-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<20141209104705.GL2470@jama>
MIME-Version: 1.0
In-Reply-To: <20141209104705.GL2470@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] nana: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Dec 2014 17:52:29 -0000
X-Groupsio-MsgNum: 53248
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BouVgDkIlpb7X6Bk"
Content-Disposition: inline

--BouVgDkIlpb7X6Bk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 09, 2014 at 11:47:05AM +0100, Martin Jansa wrote:
> On Thu, Dec 04, 2014 at 02:37:02PM +0800, Li xin wrote:
> > GNU Nana is a free library providing improved support for assertion
> > checking (as in assert.h) and logging (printf style debugging) in
> > GNU C and C++.
> >=20
> > Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> > ---
> >  .../nana/nana/change-mandir-to-DESTDIR.patch       |  40 ++++++
> >  .../modify-acinclude.m4-and-configure.in.patch     | 147 +++++++++++++=
++++++++
> >  meta-oe/recipes-extended/nana/nana_2.5.bb          |  29 ++++
> >  3 files changed, 216 insertions(+)
> >  create mode 100644 meta-oe/recipes-extended/nana/nana/change-mandir-to=
-DESTDIR.patch
> >  create mode 100644 meta-oe/recipes-extended/nana/nana/modify-acinclude=
=2Em4-and-configure.in.patch
> >  create mode 100644 meta-oe/recipes-extended/nana/nana_2.5.bb
> >=20
> > diff --git a/meta-oe/recipes-extended/nana/nana/change-mandir-to-DESTDI=
R.patch b/meta-oe/recipes-extended/nana/nana/change-mandir-to-DESTDIR.patch
> > new file mode 100644
> > index 0000000..653a7e4
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/nana/nana/change-mandir-to-DESTDIR.patch
> > @@ -0,0 +1,40 @@
> > +From 7b04c4873c0a4510bdaf9145bf01ca34b3549fdb Mon Sep 17 00:00:00 2001
> > +From: Li xin <lixin.fnst@cn.fujitsu.com>
> > +Date: Thu, 4 Dec 2014 03:50:19 +0900
> > +Subject: [PATCH 1/2] change mandir to DESTDIR
> > +
> > +Upstream-Status: pending
> > +
> > +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> > +---
> > + man/Makefile.am | 2 +-
> > + man/Makefile.in | 2 +-
> > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/man/Makefile.am b/man/Makefile.am
> > +index 80d24d8..944bc57 100644
> > +--- a/man/Makefile.am
> > ++++ b/man/Makefile.am
> > +@@ -16,5 +16,5 @@ install-data-local:
> > + 	@sect=3D1;				\
> > + 	inst=3D`echo "nana" | sed '$(transform)'`.1; \
> > + 	echo installing nana.1 as $(mandir)/man$$sect/$$inst; \
> > +-	$(INSTALL_DATA) $(srcdir)/nana.1 $(mandir)/man$$sect/$$inst
> > ++	$(INSTALL_DATA) $(srcdir)/nana.1 $(DESTDIR)$(mandir)/man$$sect/$$inst
> > +=20
> > +diff --git a/man/Makefile.in b/man/Makefile.in
> > +index 6008b20..64bb84c 100644
> > +--- a/man/Makefile.in
> > ++++ b/man/Makefile.in
> > +@@ -274,7 +274,7 @@ install-data-local:
> > + 	@sect=3D1;				\
> > + 	inst=3D`echo "nana" | sed '$(transform)'`.1; \
> > + 	echo installing nana.1 as $(mandir)/man$$sect/$$inst; \
> > +-	$(INSTALL_DATA) $(srcdir)/nana.1 $(mandir)/man$$sect/$$inst
> > ++	$(INSTALL_DATA) $(srcdir)/nana.1 $(DESTDIR)$(mandir)/man$$sect/$$inst
> > +=20
> > + # Tell versions [3.59,3.63) of GNU make to not export all variables.
> > + # Otherwise a system limit (for SysV at least) may be exceeded.
> > +--=20
> > +1.8.4.2
> > +
> > diff --git a/meta-oe/recipes-extended/nana/nana/modify-acinclude.m4-and=
-configure.in.patch b/meta-oe/recipes-extended/nana/nana/modify-acinclude.m=
4-and-configure.in.patch
> > new file mode 100644
> > index 0000000..b893622
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/nana/nana/modify-acinclude.m4-and-config=
ure.in.patch
> > @@ -0,0 +1,147 @@
> > +From c55540b83a3833ad3b1500810056f628e5a190a5 Mon Sep 17 00:00:00 2001
> > +From: Li xin <lixin.fnst@cn.fujitsu.com>
> > +Date: Thu, 4 Dec 2014 03:55:07 +0900
> > +Subject: [PATCH 2/2] modify acinclude.m4 and configure.in
> > +
> > +this patch is from Debian to fix build errors.
> > +"acinclude.m4:34: error: automatic de-ANSI-fication
> > +support has been removed"
> > +
> > +Upstream-Status: pending
> > +
> > +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> > +---
> > + acinclude.m4 | 89 ---------------------------------------------------=
---------
> > + configure.in | 12 ++++++++
> > + 2 files changed, 12 insertions(+), 89 deletions(-)
> > +
> > +diff --git a/acinclude.m4 b/acinclude.m4
> > +index e9e5500..c7c1ccb 100644
> > +--- a/acinclude.m4
> > ++++ b/acinclude.m4
> > +@@ -20,92 +20,3 @@ else
> > + fi
> > + AC_SUBST($1)
> > + ])
> > +-#####
> > +-# And the old macros from the automake distribution
> > +-#
> > +-#
> > +-# Copyright (C) 1992, 1994, 1995 Free Software Foundation, Inc.
> > +-# Fran=E7ois Pinard <pinard@iro.umontreal.ca>, 1992.
> > +-
> > +-## ------------------------------- ##
> > +-## Check for function prototypes.  ##
> > +-## ------------------------------- ##
> > +-
> > +-AC_DEFUN(fp_C_PROTOTYPES,
> > +-[AC_REQUIRE([AM_PROG_CC_STDC])
> > +-AC_MSG_CHECKING([for function prototypes])
> > +-if test "$ac_cv_prog_cc_stdc" !=3D no; then
> > +-  AC_MSG_RESULT(yes)
> > +-  AC_DEFINE(PROTOTYPES)
> > +-  U=3D ANSI2KNR=3D
> > +-else
> > +-  AC_MSG_RESULT(no)
> > +-  U=3D_ ANSI2KNR=3D./ansi2knr
> > +-fi
> > +-AC_SUBST(U)dnl
> > +-AC_SUBST(ANSI2KNR)dnl
> > +-])
> > +-
> > +-## ----------------------------------------- ##
> > +-## ANSIfy the C compiler whenever possible.  ##
> > +-## ----------------------------------------- ##
> > +-
> > +-# @defmac AC_PROG_CC_STDC
> > +-# @maindex PROG_CC_STDC
> > +-# @ovindex CC
> > +-# If the C compiler in not in ANSI C mode by default, try to add an o=
ption
> > +-# to output variable @code{CC} to make it so.  This macro tries vario=
us
> > +-# options that select ANSI C on some system or another.  It considers=
 the
> > +-# compiler to be in ANSI C mode if it defines @code{__STDC__} to 1 and
> > +-# handles function prototypes correctly.
> > +-#
> > +-# If you use this macro, you should check after calling it whether th=
e C
> > +-# compiler has been set to accept ANSI C; if not, the shell variable
> > +-# @code{ac_cv_prog_cc_stdc} is set to @samp{no}.  If you wrote your s=
ource
> > +-# code in ANSI C, you can make an un-ANSIfied copy of it by using the
> > +-# program @code{ansi2knr}, which comes with Ghostscript.
> > +-# @end defmac
> > +-
> > +-AC_DEFUN(fp_PROG_CC_STDC,
> > +-[AC_MSG_CHECKING(for ${CC-cc} option to accept ANSI C)
> > +-AC_CACHE_VAL(ac_cv_prog_cc_stdc,
> > +-[ac_cv_prog_cc_stdc=3Dno
> > +-ac_save_CFLAGS=3D"$CFLAGS"
> > +-# Don't try gcc -ansi; that turns off useful extensions and
> > +-# breaks some systems' header files.
> > +-# AIX			-qlanglvl=3Dansi
> > +-# Ultrix and OSF/1	-std1
> > +-# HP-UX			-Aa -D_HPUX_SOURCE
> > +-# SVR4			-Xc
> > +-for ac_arg in "" -qlanglvl=3Dansi -std1 "-Aa -D_HPUX_SOURCE" -Xc
> > +-do
> > +-  CFLAGS=3D"$ac_save_CFLAGS $ac_arg"
> > +-  AC_TRY_COMPILE(
> > +-[#if !defined(__STDC__) || __STDC__ !=3D 1
> > +-choke me
> > +-#endif
> > +-], [int test (int i, double x);
> > +-struct s1 {int (*f) (int a);};
> > +-struct s2 {int (*f) (double a);};],
> > +-[ac_cv_prog_cc_stdc=3D"$ac_arg"; break])
> > +-done
> > +-CFLAGS=3D"$ac_save_CFLAGS"
> > +-])
> > +-AC_MSG_RESULT($ac_cv_prog_cc_stdc)
> > +-case "x$ac_cv_prog_cc_stdc" in
> > +-  x|xno) ;;
> > +-  *) CC=3D"$CC $ac_cv_prog_cc_stdc" ;;
> > +-esac
> > +-])
> > +-
> > +-## --------------------------------------------------------- ##
> > +-## Use AC_PROG_INSTALL, supplementing it with INSTALL_SCRIPT ##
> > +-## substitution.                                             ##
> > +-## --------------------------------------------------------- ##
> > +-
> > +-AC_DEFUN(fp_PROG_INSTALL,
> > +-[AC_PROG_INSTALL
> > +-test -z "$INSTALL_SCRIPT" && INSTALL_SCRIPT=3D'${INSTALL} -m 755'
> > +-AC_SUBST(INSTALL_SCRIPT)dnl
> > +-])
> > +-
> > +diff --git a/configure.in b/configure.in
> > +index 6b25ed5..a6a7f5b 100644
> > +--- a/configure.in
> > ++++ b/configure.in
> > +@@ -103,6 +103,12 @@ nana_DEFINE(DI_MAKE_VALID_BREAKPOINT,(exprn),
> > +   sparc-*-*|i?86-*-*)
> > +     DI_MAKE_VALID_BREAKPOINT=3D'asm("nop")'
> > +     ;;
> > ++  arm*-*-*|frv-*-*|mips*-*-*)
> > ++    DI_MAKE_VALID_BREAKPOINT=3D'asm("nop")'
> > ++    ;;
> > ++  sh*-*-*)
> > ++    DI_MAKE_VALID_BREAKPOINT=3D'asm("nop\n\tnop\n\t")'
> > ++    ;;
> > +   esac
> > + ])
> > +=20
> > +@@ -113,6 +119,12 @@ nana_DEFINE(DL_MAKE_VALID_BREAKPOINT,(),
> > +   sparc-*-*|i?86-*-*)
> > +     DL_MAKE_VALID_BREAKPOINT=3D'asm("nop")'
> > +     ;;
> > ++  arm*-*-*|frv-*-*|mips*-*-*)
> > ++    DL_MAKE_VALID_BREAKPOINT=3D'asm("nop")'
> > ++    ;;
> > ++  sh*-*-*)
> > ++    DL_MAKE_VALID_BREAKPOINT=3D'asm("nop\n\tnop\n\t")'
> > ++    ;;
> > +   esac
> > + ])
> > +=20
> > +--=20
> > +1.8.4.2
> > +
> > diff --git a/meta-oe/recipes-extended/nana/nana_2.5.bb b/meta-oe/recipe=
s-extended/nana/nana_2.5.bb
> > new file mode 100644
> > index 0000000..1715820
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/nana/nana_2.5.bb
> > @@ -0,0 +1,29 @@
> > +SUMMARY =3D "Support for assertion checking and logging in GNU C/C++"
> > +DESCRIPTION =3D "GNU Nana is a free library providing improved support=
 for assertion\
> > +checking (as in assert.h) and logging (printf style debugging) in \
> > +GNU C and C++."
> > +SECTION =3D "Development/Languages/C and C++"
> > +
> > +SRC_URI =3D "http://download.savannah.gnu.org/releases/${PN}/${BP}.tar=
=2Egz \
> > +    file://change-mandir-to-DESTDIR.patch \
> > +    file://modify-acinclude.m4-and-configure.in.patch"
> > +SRC_URI[md5sum] =3D "66c88aa0ad095b2e67673773135475f1"
> > +SRC_URI[sha256sum] =3D "fd1819ffea94b209513959447e4802afe2719600e7d161=
cd78b265a42812affa"
> > +
> > +LICENSE =3D "BSD-2-Clause"
> > +
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D16aa57f3b7fdda870cee597275b=
d5d11"
> > +
> > +inherit autotools-brokensep pkgconfig
> > +
> > +EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
> > +
> > +FILES_${PN} +=3D "/usr/share"
>=20
> This is datadir, what's installed there that normal rules aren't enough?

also fails to patch:

ERROR: Command Error: exit status: 1  Output:
Applying patch modify-acinclude.m4-and-configure.in.patch
patching file acinclude.m4
Hunk #1 FAILED at 20.
1 out of 1 hunk FAILED -- rejects in file acinclude.m4
patching file configure.in
Patch modify-acinclude.m4-and-configure.in.patch does not apply (enforce wi=
th -f)
ERROR: Function failed: patch_do_patch
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/armv5te-oe-linux-gnueabi/nana/2.5-r0/temp/log.do_patch.4212
NOTE: recipe nana-2.5-r0: task do_patch: Failed
ERROR: Task 14186 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-o=
e/recipes-extended/nana/nana_2.5.bb, do_patch) failed with exit code '1'

>=20
> > +
> > +do_configure_prepend_virtclass-nativesdk() {
> > +    sed -i -e 's:@CPP@:\$\{CXX\} \$\{CXXFLAGS\} \-E:g' ${S}/src/nana.in
> > +    sed -i -e 's:@CC@:\$\{CC\} \$\{CFLAGS\} \-E:g' ${S}/src/nana-clg.in
> > +    sed -i -e 's:@CXX@::g' ${S}/src/nana-c++lg.in
> > +    sed -i -e 's:@GDB@:\$\{GDB\}:g' ${S}/src/nana-run.in
> > +}
> > +BBCLASSEXTEND =3D "native nativesdk"
> > --=20
> > 1.8.4.2
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BouVgDkIlpb7X6Bk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSHNtwACgkQN1Ujt2V2gBzpRACgkR1V+pRxK5LrTEM0itefrlM0
AqcAn1AbbVuaHwf1NSQ6LEfIDXUuCgB5
=nHdN
-----END PGP SIGNATURE-----

--BouVgDkIlpb7X6Bk--
