Received: from mail-gx0-f179.google.com ([209.85.161.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PQtA1-0000w2-4H
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Dec 2010 03:56:45 +0100
Received: by gxk21 with SMTP id 21so1908623gxk.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Dec 2010 18:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=HDj1SNHnyNktQgqOFOxgj3sskCEMbKfuz42dMG4dfxk=;
	b=TMztZvi3dR9yqYvcICTtOXx+Gc8os6ObM1w0uXow2EQ5zWNSNImlf/Al8n93XHi+aK
	/WtUeuaEi/GpeVKN6spNNZfKMkS8HOvdM93lRaOL/ZH8/nTyGpwq+T7p6G7tdwkTFPU+
	jj08heV+cz40jY19V+cvKe/PGUskdYbC+1NY8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ny2z62Q8RLsqIoeBIhzhNzICNLAYHTYg8WO63h4/G/tZmynOy9+j++BYX5J9k/7DfX
	TVlGB8HaLOpZeZBMeKIBvwI6OeM0ULdYyfVcOjyVdBMTrhgZY4H0z5zVM+oyYwjYeMKC
	INnh8cNan/PpK4ynZwz+0a6s2y9i6eBr8BeUc=
Received: by 10.90.98.11 with SMTP id v11mr481062agb.58.1291949701514; Thu, 09
	Dec 2010 18:55:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Thu, 9 Dec 2010 18:54:41 -0800 (PST)
In-Reply-To: <1291941859-29257-1-git-send-email-eric@eukrea.com>
References: <1291941859-29257-1-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Dec 2010 18:54:41 -0800
Message-ID: <AANLkTinOcF=bKiZGZz1p4YZHSpW8Hy3LLumvG6VbqWg6@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.179
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gcc: introduce version 4.5.2
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
X-List-Received-Date: Fri, 10 Dec 2010 02:56:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 9, 2010 at 4:44 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> - based on gcc-4.5.2-RC-20101208 (svn 167585)
> - without linaro patches (which seem to be the root of
> problems when compiling at least on armv4 and armv5) :
> =C2=A0 =C2=A0 =C2=A0 =C2=A0- samba 3.2.15 or 3.3.9 : http://tinderbox.ope=
nembedded.net/public/logs/task/8666826.txt
> =C2=A0 =C2=A0 =C2=A0 =C2=A0- samba 3.5.6 : http://pastebin.com/yuiYX2CM
>

as discussed on IRC may be we should try to find the faulty patch in
current gcc 4.5 linaro patches we have.


> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> ---
> =C2=A0recipes/gcc/gcc-4.5.2.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 65 +++++++
> =C2=A0recipes/gcc/gcc-4.5.2/100-uclibc-conf.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 37 ++++
> =C2=A0recipes/gcc/gcc-4.5.2/Makefile.in.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 30 ++++
> =C2=A0recipes/gcc/gcc-4.5.2/arm-bswapsi2.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 13 ++
> =C2=A0recipes/gcc/gcc-4.5.2/cache-amnesia.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 31 ++++
> =C2=A0.../gcc/gcc-4.5.2/fortran-cross-compile-hack.patch | =C2=A0 30 ++++
> =C2=A0.../gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 31 ++++
> =C2=A0.../gcc-4.5.2/gcc-armv4-pass-fix-v4bx-to-ld.patch =C2=A0| =C2=A0 29=
 ++++
> =C2=A0recipes/gcc/gcc-4.5.2/gcc-flags-for-build.patch =C2=A0 =C2=A0| =C2=
=A0178 ++++++++++++++++++++
> =C2=A0.../gcc-4.5.2/gcc-scalar-widening-pr45847.patch =C2=A0 =C2=A0| =C2=
=A0 63 +++++++
> =C2=A0.../gcc-uclibc-locale-ctype_touplow_t.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 67 ++++++++
> =C2=A0.../libstdc++-emit-__cxa_end_cleanup-in-text.patch | =C2=A0 40 ++++=
+
> =C2=A0recipes/gcc/gcc-4.5.2/mips64-nomultilib.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 52 ++++++
> =C2=A0recipes/gcc/gcc-4.5.2/zecke-no-host-includes.patch | =C2=A0 31 ++++
> =C2=A0recipes/gcc/gcc-4.5.2/zecke-xgcc-cpp.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 28 +++
> =C2=A0recipes/gcc/gcc-cross-initial_4.5.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0recipes/gcc/gcc-cross-intermediate_4.5.2.bb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A02 +
> =C2=A0recipes/gcc/gcc-cross-sdk_4.5.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A08 +
> =C2=A0recipes/gcc/gcc-cross_4.5.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 12 ++
> =C2=A0recipes/gcc/gcc_4.5.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 15 ++
> =C2=A020 files changed, 764 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/gcc/gcc-4.5.2.inc
> =C2=A0create mode 100644 recipes/gcc/gcc-4.5.2/100-uclibc-conf.patch
> =C2=A0create mode 100644 recipes/gcc/gcc-4.5.2/Makefile.in.patch
> =C2=A0create mode 100644 recipes/gcc/gcc-4.5.2/arm-bswapsi2.patch
> =C2=A0create mode 100644 recipes/gcc/gcc-4.5.2/cache-amnesia.patch
> =C2=A0create mode 100644 recipes/gcc/gcc-4.5.2/fortran-cross-compile-hack=
.patch
> =C2=A0create mode 100644 recipes/gcc/gcc-4.5.2/gcc-4.3.1-ARCH_FLAGS_FOR_T=
ARGET.patch
> =C2=A0create mode 100644 recipes/gcc/gcc-4.5.2/gcc-armv4-pass-fix-v4bx-to=
-ld.patch
> =C2=A0create mode 100644 recipes/gcc/gcc-4.5.2/gcc-flags-for-build.patch
> =C2=A0create mode 100644 recipes/gcc/gcc-4.5.2/gcc-scalar-widening-pr4584=
7.patch
> =C2=A0create mode 100644 recipes/gcc/gcc-4.5.2/gcc-uclibc-locale-ctype_to=
uplow_t.patch
> =C2=A0create mode 100644 recipes/gcc/gcc-4.5.2/libstdc++-emit-__cxa_end_c=
leanup-in-text.patch
> =C2=A0create mode 100644 recipes/gcc/gcc-4.5.2/mips64-nomultilib.patch
> =C2=A0create mode 100644 recipes/gcc/gcc-4.5.2/zecke-no-host-includes.pat=
ch
> =C2=A0create mode 100644 recipes/gcc/gcc-4.5.2/zecke-xgcc-cpp.patch
> =C2=A0create mode 100644 recipes/gcc/gcc-cross-initial_4.5.2.bb
> =C2=A0create mode 100644 recipes/gcc/gcc-cross-intermediate_4.5.2.bb
> =C2=A0create mode 100644 recipes/gcc/gcc-cross-sdk_4.5.2.bb
> =C2=A0create mode 100644 recipes/gcc/gcc-cross_4.5.2.bb
> =C2=A0create mode 100644 recipes/gcc/gcc_4.5.2.bb
>
> diff --git a/recipes/gcc/gcc-4.5.2.inc b/recipes/gcc/gcc-4.5.2.inc
> new file mode 100644
> index 0000000..6efa98b
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5.2.inc
> @@ -0,0 +1,65 @@
> +DEFAULT_PREFERENCE =3D "-999"
> +ARM_INSTRUCTION_SET =3D "arm"
> +
> +require gcc-common.inc
> +LICENSE =3D "GPLv3"
> +
> +DEPENDS =3D "mpfr gmp libmpc libelf"
> +NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native"
> +
> +
> +INC_PR =3D "r1"
> +
> +SRCREV =3D "167585"
> +PV =3D "4.5.2"
> +# BINV should be incremented after updating to a revision
> +# after a minor gcc release (e.g. 4.5.1 or 4.5.2) has been made
> +# the value will be minor-release+1 e.g. if minor release was
> +# 4.5.1 then the value below will be 2 which will mean 4.5.2
> +# which will be next minor release and so on.
> +
> +BINV =3D "${PV}.2"
> +BRANCH =3D "gcc-4_5-branch"
> +PR_append =3D "+svnr${SRCPV}"
> +
> +SRC_URI =3D "svn://gcc.gnu.org/svn/gcc/branches;module=3D${BRANCH} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGE=
T.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://100-uclibc-conf.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc-uclibc-locale-ctype_toupl=
ow_t.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cache-amnesia.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://gcc-flags-for-build.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libstdc++-emit-__cxa_end_clean=
up-in-text.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://arm-bswapsi2.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Makefile.in.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://gcc-armv4-pass-fix-v4bx-to-ld.=
patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://gcc-scalar-widening-pr45847.pa=
tch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> +
> +SRC_URI_append_mips64 =3D " file://mips64-nomultilib.patch "
> +SRC_URI_append_mips64el =3D " file://mips64-nomultilib.patch "
> +
> +# Language Overrides
> +FORTRAN =3D ""
> +JAVA =3D ""
> +rename_srcdir (){
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${WORKDIR}/${BRANCH} ${WORKDIR}/gcc-${PV}
> +}
> +
> +do_unpack_append() {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.build.exec_func('rename_srcdir', d)
> +}
> +
> +EXTRA_OECONF_BASE =3D " --enable-lto \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
-enable-libssp \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
-disable-bootstrap --disable-libgomp \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
-disable-libmudflap"
> +
> +EXTRA_OECONF_INITIAL =3D "--disable-libmudflap --disable-libgomp --disab=
le-libssp --enable-decimal-float=3Dno"
> +EXTRA_OECONF_INTERMEDIATE =3D "--disable-libmudflap --disable-libgomp --=
disable-libssp"
> +
> +EXTRA_OECONF_append_linux-uclibc =3D " --disable-decimal-float "
> +EXTRA_OECONF_append_linux-uclibceabi =3D " --disable-decimal-float "
> +EXTRA_OECONF_append_linux-uclibcspe =3D " --disable-decimal-float "
> +
> +EXTRA_OECONF_append_mips64 =3D " --with-arch-64=3Dmips64 --with-tune-64=
=3Dmips64"
> +EXTRA_OECONF_append_mips64el =3D " --with-arch-64=3Dmips64 --with-tune-6=
4=3Dmips64"
> diff --git a/recipes/gcc/gcc-4.5.2/100-uclibc-conf.patch b/recipes/gcc/gc=
c-4.5.2/100-uclibc-conf.patch
> new file mode 100644
> index 0000000..0b79960
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5.2/100-uclibc-conf.patch
> @@ -0,0 +1,37 @@
> +Index: gcc-4.3.1/contrib/regression/objs-gcc.sh
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.3.1.orig/contrib/regression/objs-gcc.sh =C2=A0 =C2=A0 =C2=A020=
07-12-24 15:18:57.000000000 -0800
> ++++ gcc-4.3.1/contrib/regression/objs-gcc.sh =C2=A0 2008-08-16 01:15:12.=
000000000 -0700
> +@@ -105,6 +105,10 @@
> + =C2=A0then
> + =C2=A0 make all-gdb all-dejagnu all-ld || exit 1
> + =C2=A0 make install-gdb install-dejagnu install-ld || exit 1
> ++elif [ $H_REAL_TARGET =3D $H_REAL_HOST -a $H_REAL_TARGET =3D i686-pc-li=
nux-uclibc ]
> ++ then
> ++ =C2=A0make all-gdb all-dejagnu all-ld || exit 1
> ++ =C2=A0make install-gdb install-dejagnu install-ld || exit 1
> + elif [ $H_REAL_TARGET =3D $H_REAL_HOST ] ; then
> + =C2=A0 make bootstrap || exit 1
> + =C2=A0 make install || exit 1
> +Index: gcc-4.3.1/libjava/classpath/ltconfig
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.3.1.orig/libjava/classpath/ltconfig =C2=A02007-06-03 16:18:43.=
000000000 -0700
> ++++ gcc-4.3.1/libjava/classpath/ltconfig =C2=A0 =C2=A0 =C2=A0 2008-08-16=
 01:15:12.000000000 -0700
> +@@ -603,7 +603,7 @@
> +
> + # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
> + case $host_os in
> +-linux-gnu*) ;;
> ++linux-gnu*|linux-uclibc*) ;;
> + linux*) host=3D`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
> + esac
> +
> +@@ -1251,7 +1251,7 @@
> + =C2=A0 ;;
> +
> + # This must be Linux ELF.
> +-linux-gnu*)
> ++linux*)
> + =C2=A0 version_type=3Dlinux
> + =C2=A0 need_lib_prefix=3Dno
> + =C2=A0 need_version=3Dno
> diff --git a/recipes/gcc/gcc-4.5.2/Makefile.in.patch b/recipes/gcc/gcc-4.=
5.2/Makefile.in.patch
> new file mode 100644
> index 0000000..45df47c
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5.2/Makefile.in.patch
> @@ -0,0 +1,30 @@
> +Index: gcc-4.5/gcc/Makefile.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.5.orig/gcc/Makefile.in
> ++++ gcc-4.5/gcc/Makefile.in
> +@@ -656,7 +656,7 @@ LIBGCC2_INCLUDES =3D
> + TARGET_LIBGCC2_CFLAGS =3D
> +
> + # Options to use when compiling crtbegin/end.
> +-CRTSTUFF_CFLAGS =3D -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g=
0 \
> ++CRTSTUFF_CFLAGS =3D -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES) $(MULTILIB_CFL=
AGS) -g0 \
> + =C2=A0 -finhibit-size-directive -fno-inline -fno-exceptions \
> + =C2=A0 -fno-zero-initialized-in-bss -fno-toplevel-reorder -fno-tree-vec=
torize \
> + =C2=A0 $(INHIBIT_LIBC_CFLAGS)
> +@@ -1038,10 +1038,14 @@ BUILD_ERRORS =3D build/errors.o
> + # -I$(@D) and -I$(srcdir)/$(@D) cause the subdirectory of the file
> + # currently being compiled, in both source trees, to be examined as wel=
l.
> + # libintl.h will be found in ../intl if we are using the included libin=
tl.
> +-INCLUDES =3D -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> ++#
> ++# TARGET_INCLUDES is added to avoid that GMPINC (which points to the ho=
st
> ++# include dir) is used for compiling libgcc.a
> ++TARGET_INCLUDES =3D -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-I$(srcdir)/../include @INCINTL@ \
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CPPINC) $(GMPINC) $(DECNUMINC) \
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CPPINC) $(DECNUMINC) \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PPLINC) $(CLOOGINC) $(LIBELFINC)
> ++INCLUDES =3D $(TARGET_INCLUDES) $(GMPINC)
> +
> + .c.o:
> + =C2=A0 =C2=A0 =C2=A0 $(COMPILER) -c $(ALL_COMPILERFLAGS) $(ALL_CPPFLAGS=
) $< $(OUTPUT_OPTION)
> diff --git a/recipes/gcc/gcc-4.5.2/arm-bswapsi2.patch b/recipes/gcc/gcc-4=
.5.2/arm-bswapsi2.patch
> new file mode 100644
> index 0000000..7ac61a6
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5.2/arm-bswapsi2.patch
> @@ -0,0 +1,13 @@
> +Index: gcc-4.5/gcc/config/arm/arm.md
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.5.orig/gcc/config/arm/arm.md 2010-06-17 09:13:07.000000000 -07=
00
> ++++ gcc-4.5/gcc/config/arm/arm.md =C2=A0 =C2=A0 =C2=A02010-06-22 08:08:4=
5.397212002 -0700
> +@@ -11267,7 +11267,7 @@
> + (define_expand "bswapsi2"
> + =C2=A0 [(set (match_operand:SI 0 "s_register_operand" "=3Dr")
> + =C2=A0 =C2=A0 =C2=A0 (bswap:SI (match_operand:SI 1 "s_register_operand"=
 "r")))]
> +-"TARGET_EITHER"
> ++"TARGET_EITHER && (arm_arch6 && !optimize_size)"
> + "
> + =C2=A0 if (!arm_arch6)
> + =C2=A0 =C2=A0 {
> diff --git a/recipes/gcc/gcc-4.5.2/cache-amnesia.patch b/recipes/gcc/gcc-=
4.5.2/cache-amnesia.patch
> new file mode 100644
> index 0000000..b889f9b
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5.2/cache-amnesia.patch
> @@ -0,0 +1,31 @@
> +---
> + gcc/configure =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> + gcc/configure.ac | =C2=A0 =C2=A02 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +Index: gcc-4.5+svnr155514/gcc/configure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.5+svnr155514.orig/gcc/configure =C2=A0 =C2=A0 =C2=A02009-12-29=
 22:00:40.000000000 -0800
> ++++ gcc-4.5+svnr155514/gcc/configure =C2=A0 2009-12-29 23:52:43.38159211=
3 -0800
> +@@ -10467,7 +10467,7 @@ else
> + =C2=A0 =C2=A0 =C2=A0 saved_CFLAGS=3D"${CFLAGS}"
> + =C2=A0 =C2=A0 =C2=A0 CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUIL=
D}" \
> + =C2=A0 =C2=A0 =C2=A0 LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> +- =C2=A0 =C2=A0 =C2=A0${realsrcdir}/configure \
> ++ =C2=A0 =C2=A0 =C2=A0CONFIG_SITE=3D ${realsrcdir}/configure --cache-fil=
e=3D./other.cache \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-languages=3D$=
{enable_languages-all} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --target=3D$target_ali=
as --host=3D$build_alias --build=3D$build_alias
> + =C2=A0 =C2=A0 =C2=A0 CFLAGS=3D"${saved_CFLAGS}"
> +Index: gcc-4.5+svnr155514/gcc/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.5+svnr155514.orig/gcc/configure.ac =C2=A0 2009-12-29 22:00:40.=
000000000 -0800
> ++++ gcc-4.5+svnr155514/gcc/configure.ac =C2=A0 =C2=A0 =C2=A0 =C2=A02009-=
12-29 23:51:54.589091778 -0800
> +@@ -1458,7 +1458,7 @@ else
> + =C2=A0 =C2=A0 =C2=A0 saved_CFLAGS=3D"${CFLAGS}"
> + =C2=A0 =C2=A0 =C2=A0 CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUIL=
D}" \
> + =C2=A0 =C2=A0 =C2=A0 LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> +- =C2=A0 =C2=A0 =C2=A0${realsrcdir}/configure \
> ++ =C2=A0 =C2=A0 =C2=A0CONFIG_SITE=3D ${realsrcdir}/configure --cache-fil=
e=3D./other.cache \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-languages=3D$=
{enable_languages-all} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --target=3D$target_ali=
as --host=3D$build_alias --build=3D$build_alias
> + =C2=A0 =C2=A0 =C2=A0 CFLAGS=3D"${saved_CFLAGS}"
> diff --git a/recipes/gcc/gcc-4.5.2/fortran-cross-compile-hack.patch b/rec=
ipes/gcc/gcc-4.5.2/fortran-cross-compile-hack.patch
> new file mode 100644
> index 0000000..348c770
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5.2/fortran-cross-compile-hack.patch
> @@ -0,0 +1,30 @@
> +* Fortran would have searched for arm-angstrom-gnueabi-gfortran but woul=
d have used
> + =C2=A0used gfortan. For gcc_4.2.2.bb we want to use the gfortran compil=
er from our cross
> + =C2=A0directory.
> +
> +Index: gcc-4.5+svnr155514/libgfortran/configure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.5+svnr155514.orig/libgfortran/configure =C2=A0 =C2=A0 =C2=A020=
09-12-29 22:02:01.000000000 -0800
> ++++ gcc-4.5+svnr155514/libgfortran/configure =C2=A0 2009-12-30 08:12:40.=
889091657 -0800
> +@@ -11655,7 +11655,7 @@ CC=3D"$lt_save_CC"
> +
> + # We need gfortran to compile parts of the library
> + #AC_PROG_FC(gfortran)
> +-FC=3D"$GFORTRAN"
> ++#FC=3D"$GFORTRAN"
> + ac_ext=3D${ac_fc_srcext-f}
> + ac_compile=3D'$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext >&5'
> + ac_link=3D'$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS $ac_fcflags_srce=
xt conftest.$ac_ext $LIBS >&5'
> +Index: gcc-4.5+svnr155514/libgfortran/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.5+svnr155514.orig/libgfortran/configure.ac =C2=A0 2009-12-29 2=
2:02:01.000000000 -0800
> ++++ gcc-4.5+svnr155514/libgfortran/configure.ac =C2=A0 =C2=A0 =C2=A0 =C2=
=A02009-12-30 08:12:13.453094218 -0800
> +@@ -187,7 +187,7 @@ AC_SUBST(enable_static)
> +
> + # We need gfortran to compile parts of the library
> + #AC_PROG_FC(gfortran)
> +-FC=3D"$GFORTRAN"
> ++#FC=3D"$GFORTRAN"
> + AC_PROG_FC(gfortran)
> +
> + # extra LD Flags which are required for targets
> diff --git a/recipes/gcc/gcc-4.5.2/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch =
b/recipes/gcc/gcc-4.5.2/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> new file mode 100644
> index 0000000..f33e6c1
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5.2/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> @@ -0,0 +1,31 @@
> +---
> + configure =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> + configure.ac | =C2=A0 =C2=A02 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +Index: gcc-4.3.1/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.3.1.orig/configure.ac =C2=A0 =C2=A0 =C2=A0 =C2=A02008-07-21 12=
:29:18.000000000 -0700
> ++++ gcc-4.3.1/configure.ac =C2=A0 =C2=A0 2008-07-21 12:29:35.000000000 -=
0700
> +@@ -2352,7 +2352,7 @@ fi
> + # for target_alias and gcc doesn't manage it consistently.
> + target_configargs=3D"--cache-file=3D./config.cache ${target_configargs}=
"
> +
> +-FLAGS_FOR_TARGET=3D
> ++FLAGS_FOR_TARGET=3D"$ARCH_FLAGS_FOR_TARGET"
> + case " $target_configdirs " in
> + =C2=A0*" newlib "*)
> + =C2=A0 case " $target_configargs " in
> +Index: gcc-4.3.1/configure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.3.1.orig/configure =C2=A0 2008-07-21 12:29:48.000000000 -0700
> ++++ gcc-4.3.1/configure =C2=A0 =C2=A0 =C2=A0 =C2=A02008-07-21 12:29:59.0=
00000000 -0700
> +@@ -5841,7 +5841,7 @@ fi
> + # for target_alias and gcc doesn't manage it consistently.
> + target_configargs=3D"--cache-file=3D./config.cache ${target_configargs}=
"
> +
> +-FLAGS_FOR_TARGET=3D
> ++FLAGS_FOR_TARGET=3D"$ARCH_FLAGS_FOR_TARGET"
> + case " $target_configdirs " in
> + =C2=A0*" newlib "*)
> + =C2=A0 case " $target_configargs " in
> diff --git a/recipes/gcc/gcc-4.5.2/gcc-armv4-pass-fix-v4bx-to-ld.patch b/=
recipes/gcc/gcc-4.5.2/gcc-armv4-pass-fix-v4bx-to-ld.patch
> new file mode 100644
> index 0000000..5d1a033
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5.2/gcc-armv4-pass-fix-v4bx-to-ld.patch
> @@ -0,0 +1,29 @@
> +The LINK_SPEC for linux gets overwritten by linux-eabi.h which
> +means the value of TARGET_FIX_V4BX_SPEC gets lost and as a result
> +the option is not passed to linker when chosing march=3Darmv4
> +This patch redefines this in linux-eabi.h and reinserts it
> +for eabi defaulting toolchains.
> +
> +We might want to send it upstream
> +
> +-Khem
> +Index: gcc-4.5/gcc/config/arm/linux-eabi.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.5.orig/gcc/config/arm/linux-eabi.h
> ++++ gcc-4.5/gcc/config/arm/linux-eabi.h
> +@@ -63,10 +63,14 @@
> + #undef =C2=A0GLIBC_DYNAMIC_LINKER
> + #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.3"
> +
> ++/* For armv4 we pass --fix-v4bx to linker to support EABI */
> ++#undef TARGET_FIX_V4BX_SPEC
> ++#define TARGET_FIX_V4BX_SPEC " %{mcpu=3Darm8|mcpu=3Darm810|mcpu=3Dstron=
garm*|march=3Darmv4:--fix-v4bx}"
> ++
> + /* At this point, bpabi.h will have clobbered LINK_SPEC. =C2=A0We want =
to
> + =C2=A0 =C2=A0use the GNU/Linux version, not the generic BPABI version. =
=C2=A0*/
> + #undef =C2=A0LINK_SPEC
> +-#define LINK_SPEC LINUX_TARGET_LINK_SPEC BE8_LINK_SPEC
> ++#define LINK_SPEC LINUX_TARGET_LINK_SPEC BE8_LINK_SPEC TARGET_FIX_V4BX_=
SPEC
> +
> + /* Use the default LIBGCC_SPEC, not the version in linux-elf.h, as we
> + =C2=A0 =C2=A0do not use -lfloat. =C2=A0*/
> diff --git a/recipes/gcc/gcc-4.5.2/gcc-flags-for-build.patch b/recipes/gc=
c/gcc-4.5.2/gcc-flags-for-build.patch
> new file mode 100644
> index 0000000..5189285
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5.2/gcc-flags-for-build.patch
> @@ -0,0 +1,178 @@
> +Index: gcc-4.5/Makefile.def
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.5.orig/Makefile.def
> ++++ gcc-4.5/Makefile.def
> +@@ -240,6 +240,7 @@ flags_to_pass =3D { flag=3D AWK ; };
> + flags_to_pass =3D { flag=3D BISON ; };
> + flags_to_pass =3D { flag=3D CC_FOR_BUILD ; };
> + flags_to_pass =3D { flag=3D CFLAGS_FOR_BUILD ; };
> ++flags_to_pass =3D { flag=3D CPPFLAGS_FOR_BUILD ; };
> + flags_to_pass =3D { flag=3D CXX_FOR_BUILD ; };
> + flags_to_pass =3D { flag=3D EXPECT ; };
> + flags_to_pass =3D { flag=3D FLEX ; };
> +Index: gcc-4.5/gcc/Makefile.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.5.orig/gcc/Makefile.in
> ++++ gcc-4.5/gcc/Makefile.in
> +@@ -766,7 +766,7 @@ BUILD_LINKERFLAGS =3D $(BUILD_CFLAGS)
> +
> + # Native linker and preprocessor flags. =C2=A0For x-fragment overrides.
> + BUILD_LDFLAGS=3D@BUILD_LDFLAGS@
> +-BUILD_CPPFLAGS=3D$(ALL_CPPFLAGS)
> ++BUILD_CPPFLAGS=3D$(INCLUDES) @BUILD_CPPFLAGS@ $(X_CPPFLAGS)
> +
> + # Actual name to use when installing a native compiler.
> + GCC_INSTALL_NAME :=3D $(shell echo gcc|sed '$(program_transform_name)')
> +Index: gcc-4.5/gcc/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.5.orig/gcc/configure.ac
> ++++ gcc-4.5/gcc/configure.ac
> +@@ -1798,16 +1798,18 @@ AC_SUBST(inhibit_libc)
> + # Also, we cannot run fixincludes.
> +
> + # These are the normal (build=3Dhost) settings:
> +-CC_FOR_BUILD=3D'$(CC)' =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_SUBST(CC_FO=
R_BUILD)
> +-BUILD_CFLAGS=3D'$(ALL_CFLAGS)' =C2=A0AC_SUBST(BUILD_CFLAGS)
> +-BUILD_LDFLAGS=3D'$(LDFLAGS)' =C2=A0 =C2=A0AC_SUBST(BUILD_LDFLAGS)
> +-STMP_FIXINC=3Dstmp-fixinc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 AC_SUBST(STMP_FIXINC)
> ++CC_FOR_BUILD=3D'$(CC)' =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0AC_SUBST(CC_FOR_BUILD)
> ++BUILD_CFLAGS=3D'$(ALL_CFLAGS)' =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_SUB=
ST(BUILD_CFLAGS)
> ++BUILD_LDFLAGS=3D'$(LDFLAGS)' =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0A=
C_SUBST(BUILD_LDFLAGS)
> ++BUILD_CPPFLAGS=3D'$(ALL_CPPFLAGS)' =C2=A0 =C2=A0 =C2=A0AC_SUBST(BUILD_C=
PPFLAGS)
> ++STMP_FIXINC=3Dstmp-fixinc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_SUBST(STMP_FIXINC)
> +
> + # And these apply if build !=3D host, or we are generating coverage dat=
a
> + if test x$build !=3D x$host || test "x$coverage_flags" !=3D x
> + then
> + =C2=A0 =C2=A0 BUILD_CFLAGS=3D'$(INTERNAL_CFLAGS) $(T_CFLAGS) $(CFLAGS_F=
OR_BUILD)'
> + =C2=A0 =C2=A0 BUILD_LDFLAGS=3D'$(LDFLAGS_FOR_BUILD)'
> ++ =C2=A0 =C2=A0BUILD_CPPFLAGS=3D'$(CPPFLAGS_FOR_BUILD)'
> + fi
> +
> + # Expand extra_headers to include complete path.
> +Index: gcc-4.5/Makefile.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.5.orig/Makefile.in
> ++++ gcc-4.5/Makefile.in
> +@@ -333,6 +333,7 @@ AR_FOR_BUILD =3D @AR_FOR_BUILD@
> + AS_FOR_BUILD =3D @AS_FOR_BUILD@
> + CC_FOR_BUILD =3D @CC_FOR_BUILD@
> + CFLAGS_FOR_BUILD =3D @CFLAGS_FOR_BUILD@
> ++CPPFLAGS_FOR_BUILD =3D @CPPFLAGS_FOR_BUILD@
> + CXXFLAGS_FOR_BUILD =3D @CXXFLAGS_FOR_BUILD@
> + CXX_FOR_BUILD =3D @CXX_FOR_BUILD@
> + DLLTOOL_FOR_BUILD =3D @DLLTOOL_FOR_BUILD@
> +@@ -662,6 +663,7 @@ BASE_FLAGS_TO_PASS =3D \
> + =C2=A0 =C2=A0 =C2=A0 "BISON=3D$(BISON)" \
> + =C2=A0 =C2=A0 =C2=A0 "CC_FOR_BUILD=3D$(CC_FOR_BUILD)" \
> + =C2=A0 =C2=A0 =C2=A0 "CFLAGS_FOR_BUILD=3D$(CFLAGS_FOR_BUILD)" \
> ++ =C2=A0 =C2=A0 =C2=A0"CPPFLAGS_FOR_BUILD=3D$(CPPFLAGS_FOR_BUILD)" \
> + =C2=A0 =C2=A0 =C2=A0 "CXX_FOR_BUILD=3D$(CXX_FOR_BUILD)" \
> + =C2=A0 =C2=A0 =C2=A0 "EXPECT=3D$(EXPECT)" \
> + =C2=A0 =C2=A0 =C2=A0 "FLEX=3D$(FLEX)" \
> +Index: gcc-4.5/gcc/configure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.5.orig/gcc/configure
> ++++ gcc-4.5/gcc/configure
> +@@ -707,6 +707,7 @@ SED
> + LIBTOOL
> + collect2
> + STMP_FIXINC
> ++BUILD_CPPFLAGS
> + BUILD_LDFLAGS
> + BUILD_CFLAGS
> + CC_FOR_BUILD
> +@@ -10982,6 +10983,7 @@ fi
> + CC_FOR_BUILD=3D'$(CC)'
> + BUILD_CFLAGS=3D'$(ALL_CFLAGS)'
> + BUILD_LDFLAGS=3D'$(LDFLAGS)'
> ++BUILD_CPPFLAGS=3D'$(ALL_CPPFLAGS)'
> + STMP_FIXINC=3Dstmp-fixinc
> +
> + # And these apply if build !=3D host, or we are generating coverage dat=
a
> +@@ -10989,6 +10991,7 @@ if test x$build !=3D x$host || test "x$cov
> + then
> + =C2=A0 =C2=A0 BUILD_CFLAGS=3D'$(INTERNAL_CFLAGS) $(T_CFLAGS) $(CFLAGS_F=
OR_BUILD)'
> + =C2=A0 =C2=A0 BUILD_LDFLAGS=3D'$(LDFLAGS_FOR_BUILD)'
> ++ =C2=A0 =C2=A0BUILD_CPPFLAGS=3D'$(CPPFLAGS_FOR_BUILD)'
> + fi
> +
> + # Expand extra_headers to include complete path.
> +@@ -17108,7 +17111,7 @@ else
> + =C2=A0 lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> + =C2=A0 lt_status=3D$lt_dlunknown
> + =C2=A0 cat > conftest.$ac_ext <<_LT_EOF
> +-#line 17111 "configure"
> ++#line 17114 "configure"
> + #include "confdefs.h"
> +
> + #if HAVE_DLFCN_H
> +@@ -17214,7 +17217,7 @@ else
> + =C2=A0 lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> + =C2=A0 lt_status=3D$lt_dlunknown
> + =C2=A0 cat > conftest.$ac_ext <<_LT_EOF
> +-#line 17217 "configure"
> ++#line 17220 "configure"
> + #include "confdefs.h"
> +
> + #if HAVE_DLFCN_H
> +Index: gcc-4.5/Makefile.tpl
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.5.orig/Makefile.tpl
> ++++ gcc-4.5/Makefile.tpl
> +@@ -336,6 +336,7 @@ AR_FOR_BUILD =3D @AR_FOR_BUILD@
> + AS_FOR_BUILD =3D @AS_FOR_BUILD@
> + CC_FOR_BUILD =3D @CC_FOR_BUILD@
> + CFLAGS_FOR_BUILD =3D @CFLAGS_FOR_BUILD@
> ++CPPFLAGS_FOR_BUILD =3D @CPPFLAGS_FOR_BUILD@
> + CXXFLAGS_FOR_BUILD =3D @CXXFLAGS_FOR_BUILD@
> + CXX_FOR_BUILD =3D @CXX_FOR_BUILD@
> + DLLTOOL_FOR_BUILD =3D @DLLTOOL_FOR_BUILD@
> +Index: gcc-4.5/configure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.5.orig/configure
> ++++ gcc-4.5/configure
> +@@ -651,6 +651,7 @@ GCJ_FOR_BUILD
> + DLLTOOL_FOR_BUILD
> + CXX_FOR_BUILD
> + CXXFLAGS_FOR_BUILD
> ++CPPFLAGS_FOR_BUILD
> + CFLAGS_FOR_BUILD
> + CC_FOR_BUILD
> + AS_FOR_BUILD
> +@@ -8036,6 +8037,7 @@ esac
> + # our build compiler if desired.
> + if test x"${build}" =3D x"${host}" ; then
> + =C2=A0 CFLAGS_FOR_BUILD=3D${CFLAGS_FOR_BUILD-${CFLAGS}}
> ++ =C2=A0CPPFLAGS_FOR_BUILD=3D${CPPFLAGS_FOR_BUILD-${CPPFLAGS}}
> + =C2=A0 CXXFLAGS_FOR_BUILD=3D${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
> + =C2=A0 LDFLAGS_FOR_BUILD=3D${LDFLAGS_FOR_BUILD-${LDFLAGS}}
> + fi
> +@@ -8101,6 +8103,7 @@ done
> +
> +
> +
> ++
> +
> +
> +
> +Index: gcc-4.5/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.5.orig/configure.ac
> ++++ gcc-4.5/configure.ac
> +@@ -3089,6 +3089,7 @@ esac
> + # our build compiler if desired.
> + if test x"${build}" =3D x"${host}" ; then
> + =C2=A0 CFLAGS_FOR_BUILD=3D${CFLAGS_FOR_BUILD-${CFLAGS}}
> ++ =C2=A0CPPFLAGS_FOR_BUILD=3D${CPPFLAGS_FOR_BUILD-${CPPFLAGS}}
> + =C2=A0 CXXFLAGS_FOR_BUILD=3D${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
> + =C2=A0 LDFLAGS_FOR_BUILD=3D${LDFLAGS_FOR_BUILD-${LDFLAGS}}
> + fi
> +@@ -3155,6 +3156,7 @@ AC_SUBST(AR_FOR_BUILD)
> + AC_SUBST(AS_FOR_BUILD)
> + AC_SUBST(CC_FOR_BUILD)
> + AC_SUBST(CFLAGS_FOR_BUILD)
> ++AC_SUBST(CPPFLAGS_FOR_BUILD)
> + AC_SUBST(CXXFLAGS_FOR_BUILD)
> + AC_SUBST(CXX_FOR_BUILD)
> + AC_SUBST(DLLTOOL_FOR_BUILD)
> diff --git a/recipes/gcc/gcc-4.5.2/gcc-scalar-widening-pr45847.patch b/re=
cipes/gcc/gcc-4.5.2/gcc-scalar-widening-pr45847.patch
> new file mode 100644
> index 0000000..cbe1230
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5.2/gcc-scalar-widening-pr45847.patch
> @@ -0,0 +1,63 @@
> +Hi,
> +
> +The attached patch fixes Bugzilla 45847
> +(http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D45847). When compiling
> +without -mvectorize-with-neon-quad and vectorizing scalar widening
> +operations that widen words to double words, there are no corresponding
> +vector types for DI scalar types. For this scenario, a call to
> +get_vect_type_for_scalar_type() returns NULL and an absent NULL-check
> +caused this segfault. The attached patch adds this NULL-check. Also,
> +this is consistent with all the other places where a NULL-check follows
> +a call to get_vect_type_for_scalar_type() in tree-vect-patterns.c.
> +
> +Regression tested with arm-linux-gnueabi. OK?
> +
> +--
> +Tejas Belagod
> +ARM.
> +
> +gcc/
> +
> +2010-10-05 =C2=A0Tejas Belagod =C2=A0<tejas.belagod@arm.com>
> +
> + =C2=A0 =C2=A0 =C2=A0 * tree-vect-patterns.c (vect_recog_widen_mult_patt=
ern): Add NULL
> + =C2=A0 =C2=A0 =C2=A0 check for vectype_out returned by get_vectype_for_=
scalar_type().
> +
> +testsuite/
> +
> +2010-10-05 =C2=A0Tejas Belagod =C2=A0<tejas.belagod@arm.com>
> +
> + =C2=A0 =C2=A0 =C2=A0 * gcc.dg/vect/pr45847.c: New test.
> +
> +Index: gcc-4.5/gcc/testsuite/gcc.dg/vect/pr45847.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- /dev/null
> ++++ gcc-4.5/gcc/testsuite/gcc.dg/vect/pr45847.c
> +@@ -0,0 +1,15 @@
> ++/* { dg-do compile } */
> ++
> ++
> ++long long foo (long long *__restrict a, =C2=A0int *__restrict b, int *_=
_restrict c )
> ++{
> ++ =C2=A0int i;
> ++ =C2=A0long long sum=3D0;
> ++ =C2=A0for (i=3D0;i<256;i++)
> ++ =C2=A0 sum +=3D (long long)b[i] * c[i];
> ++
> ++ =C2=A0return sum;
> ++}
> ++
> ++/* { dg-final { cleanup-tree-dump "vect" } } */
> ++
> +Index: gcc-4.5/gcc/tree-vect-patterns.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.5.orig/gcc/tree-vect-patterns.c
> ++++ gcc-4.5/gcc/tree-vect-patterns.c
> +@@ -411,6 +411,7 @@ vect_recog_widen_mult_pattern (gimple la
> + =C2=A0 /* Check target support =C2=A0*/
> + =C2=A0 vectype =3D get_vectype_for_scalar_type (half_type0);
> + =C2=A0 if (!vectype
> ++ =C2=A0 =C2=A0 =C2=A0|| !get_vectype_for_scalar_type (type)
> + =C2=A0 =C2=A0 =C2=A0 || !supportable_widening_operation (WIDEN_MULT_EXP=
R, last_stmt, vectype,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &dumm=
y, &dummy, &dummy_code,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &dumm=
y_code, &dummy_int, &dummy_vec))
> diff --git a/recipes/gcc/gcc-4.5.2/gcc-uclibc-locale-ctype_touplow_t.patc=
h b/recipes/gcc/gcc-4.5.2/gcc-uclibc-locale-ctype_touplow_t.patch
> new file mode 100644
> index 0000000..4f94fc9
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5.2/gcc-uclibc-locale-ctype_touplow_t.patch
> @@ -0,0 +1,67 @@
> +Index: gcc-4.5/libstdc++-v3/config/locale/generic/c_locale.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.5.orig/libstdc++-v3/config/locale/generic/c_locale.h 2010-06-3=
0 22:30:53.993316002 -0700
> ++++ gcc-4.5/libstdc++-v3/config/locale/generic/c_locale.h =C2=A0 =C2=A0 =
=C2=A02010-06-30 22:31:26.043316001 -0700
> +@@ -41,12 +41,17 @@
> +
> + #include <clocale>
> + #include <cstddef>
> ++#include <features.h>
> ++#include <ctype.h>
> +
> + #define _GLIBCXX_NUM_CATEGORIES 0
> +
> + _GLIBCXX_BEGIN_NAMESPACE(std)
> +-
> +- =C2=A0typedef int* =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__c_locale;
> ++#ifdef __UCLIBC__
> ++ =C2=A0 typedef __ctype_touplow_t* =C2=A0 __c_locale;
> ++#else
> ++ =C2=A0 typedef int* =C2=A0 =C2=A0 =C2=A0 =C2=A0 __c_locale;
> ++#endif
> +
> + =C2=A0 // Convert numeric value of type double and long double to strin=
g and
> + =C2=A0 // return length of string. =C2=A0If vsnprintf is available use =
it, otherwise
> +Index: gcc-4.5/libstdc++-v3/config/os/gnu-linux/ctype_base.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.5.orig/libstdc++-v3/config/os/gnu-linux/ctype_base.h 2010-06-3=
0 22:30:54.013316002 -0700
> ++++ gcc-4.5/libstdc++-v3/config/os/gnu-linux/ctype_base.h =C2=A0 =C2=A0 =
=C2=A02010-06-30 22:31:26.053316001 -0700
> +@@ -33,14 +33,21 @@
> + =C2=A0*/
> +
> + // Information as gleaned from /usr/include/ctype.h
> +-
> ++
> ++#include <features.h>
> ++#include <ctype.h>
> ++
> + _GLIBCXX_BEGIN_NAMESPACE(std)
> +
> + =C2=A0 /// @brief =C2=A0Base class for ctype.
> + =C2=A0 struct ctype_base
> + =C2=A0 {
> + =C2=A0 =C2=A0 // Non-standard typedefs.
> +- =C2=A0 =C2=A0typedef const int* =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0__to_type;
> ++#ifdef __UCLIBC__
> ++ =C2=A0 =C2=A0typedef const __ctype_touplow_t* =C2=A0 __to_type;
> ++#else
> ++ =C2=A0 =C2=A0typedef const int* =C2=A0 =C2=A0 =C2=A0 =C2=A0 __to_type;
> ++#endif
> +
> + =C2=A0 =C2=A0 // NB: Offsets into ctype<char>::_M_table force a particu=
lar size
> + =C2=A0 =C2=A0 // on the mask type. Because of this, we don't use an enu=
m.
> +Index: gcc-4.5/libstdc++-v3/config/locale/generic/c_locale.cc
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.5.orig/libstdc++-v3/config/locale/generic/c_locale.cc =C2=A0 =
=C2=A0 =C2=A0 =C2=A02010-06-28 12:12:42.000000000 -0700
> ++++ gcc-4.5/libstdc++-v3/config/locale/generic/c_locale.cc =C2=A0 =C2=A0=
 2010-06-30 22:31:26.063316001 -0700
> +@@ -256,5 +256,10 @@ _GLIBCXX_END_NAMESPACE
> + #ifdef _GLIBCXX_LONG_DOUBLE_COMPAT
> + #define _GLIBCXX_LDBL_COMPAT(dbl, ldbl) \
> + =C2=A0 extern "C" void ldbl (void) __attribute__ ((alias (#dbl)))
> ++#ifdef __UCLIBC__
> ++// This is because __c_locale is of type __ctype_touplow_t* which is sh=
ort on uclibc. for glibc its int*
> ++_GLIBCXX_LDBL_COMPAT(_ZSt14__convert_to_vIdEvPKcRT_RSt12_Ios_IostateRKP=
s, _ZSt14__convert_to_vIeEvPKcRT_RSt12_Ios_IostateRKPs);
> ++#else
> + _GLIBCXX_LDBL_COMPAT(_ZSt14__convert_to_vIdEvPKcRT_RSt12_Ios_IostateRKP=
i, _ZSt14__convert_to_vIeEvPKcRT_RSt12_Ios_IostateRKPi);
> ++#endif
> + #endif // _GLIBCXX_LONG_DOUBLE_COMPAT
> diff --git a/recipes/gcc/gcc-4.5.2/libstdc++-emit-__cxa_end_cleanup-in-te=
xt.patch b/recipes/gcc/gcc-4.5.2/libstdc++-emit-__cxa_end_cleanup-in-text.p=
atch
> new file mode 100644
> index 0000000..ada36a5
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5.2/libstdc++-emit-__cxa_end_cleanup-in-text.patc=
h
> @@ -0,0 +1,40 @@
> +2010-06-07 =C2=A0Khem Raj =C2=A0<raj.khem@gmail.com>
> +
> + =C2=A0 =C2=A0 =C2=A0 * libsupc++/eh_arm.cc (__cxa_end_cleanup): Use .pu=
shsection/.popsection
> + =C2=A0 =C2=A0 =C2=A0 to emit inline assembly into .text section.
> +
> +Index: gcc-4.5/libstdc++-v3/libsupc++/eh_arm.cc
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.5.orig/libstdc++-v3/libsupc++/eh_arm.cc =C2=A0 =C2=A0 =C2=A020=
10-06-04 23:20:18.000000000 -0700
> ++++ gcc-4.5/libstdc++-v3/libsupc++/eh_arm.cc =C2=A0 2010-06-08 11:27:34.=
247541722 -0700
> +@@ -157,22 +157,26 @@ __gnu_end_cleanup(void)
> + // Assembly wrapper to call __gnu_end_cleanup without clobbering r1-r3.
> + // Also push r4 to preserve stack alignment.
> + #ifdef __thumb__
> +-asm (".global __cxa_end_cleanup\n"
> ++asm (" =C2=A0.pushsection .text.__cxa_end_cleanup\n"
> ++" =C2=A0 =C2=A0 .global __cxa_end_cleanup\n"
> + " =C2=A0 =C2=A0 .type __cxa_end_cleanup, \"function\"\n"
> + " =C2=A0 =C2=A0 .thumb_func\n"
> + "__cxa_end_cleanup:\n"
> + " =C2=A0 =C2=A0 push\t{r1, r2, r3, r4}\n"
> + " =C2=A0 =C2=A0 bl\t__gnu_end_cleanup\n"
> + " =C2=A0 =C2=A0 pop\t{r1, r2, r3, r4}\n"
> +-" =C2=A0 =C2=A0 bl\t_Unwind_Resume @ Never returns\n");
> ++" =C2=A0 =C2=A0 bl\t_Unwind_Resume @ Never returns\n"
> ++" =C2=A0 =C2=A0 .popsection\n");
> + #else
> +-asm (".global __cxa_end_cleanup\n"
> ++asm (" =C2=A0.pushsection .text.__cxa_end_cleanup\n"
> ++" =C2=A0 =C2=A0 .global __cxa_end_cleanup\n"
> + " =C2=A0 =C2=A0 .type __cxa_end_cleanup, \"function\"\n"
> + "__cxa_end_cleanup:\n"
> + " =C2=A0 =C2=A0 stmfd\tsp!, {r1, r2, r3, r4}\n"
> + " =C2=A0 =C2=A0 bl\t__gnu_end_cleanup\n"
> + " =C2=A0 =C2=A0 ldmfd\tsp!, {r1, r2, r3, r4}\n"
> +-" =C2=A0 =C2=A0 bl\t_Unwind_Resume @ Never returns\n");
> ++" =C2=A0 =C2=A0 bl\t_Unwind_Resume @ Never returns\n"
> ++" =C2=A0 =C2=A0 .popsection\n");
> + #endif
> +
> + #endif
> diff --git a/recipes/gcc/gcc-4.5.2/mips64-nomultilib.patch b/recipes/gcc/=
gcc-4.5.2/mips64-nomultilib.patch
> new file mode 100644
> index 0000000..1ef69f8
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5.2/mips64-nomultilib.patch
> @@ -0,0 +1,52 @@
> +Index: gcc-4.5/gcc/config/mips/linux64.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.5.orig/gcc/config/mips/linux64.h =C2=A0 =C2=A0 2010-09-25 02:0=
5:05.484423095 -0700
> ++++ gcc-4.5/gcc/config/mips/linux64.h =C2=A02010-09-25 02:31:18.52493101=
4 -0700
> +@@ -26,7 +26,7 @@
> + =C2=A0 BASE_DRIVER_SELF_SPECS, \
> + =C2=A0 LINUX_DRIVER_SELF_SPECS \
> + =C2=A0 " %{!EB:%{!EL:%(endian_spec)}}" \
> +- =C2=A0" %{!mabi=3D*: -mabi=3Dn32}"
> ++ =C2=A0" %{!mabi=3D*: -mabi=3D64}"
> +
> + #undef LIB_SPEC
> + #define LIB_SPEC "\
> +@@ -35,9 +35,9 @@
> + %{!shared: \
> + =C2=A0 %{profile:-lc_p} %{!profile:-lc}}"
> +
> +-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld.so.1"
> +-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld.so.1"
> +-#define GLIBC_DYNAMIC_LINKERN32 "/lib32/ld.so.1"
> ++#define GLIBC_DYNAMIC_LINKER32 "/lib32/ld.so.1"
> ++#define GLIBC_DYNAMIC_LINKER64 "/lib/ld.so.1"
> ++#define GLIBC_DYNAMIC_LINKERN32 "/lib64/ld.so.1"
> + #define UCLIBC_DYNAMIC_LINKERN32 "/lib32/ld-uClibc.so.0"
> + #define LINUX_DYNAMIC_LINKERN32 \
> + =C2=A0 CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERN32, UCLIBC_DYNAMIC_L=
INKERN32)
> +Index: gcc-4.5/gcc/config.gcc
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.5.orig/gcc/config.gcc =C2=A0 =C2=A0 =C2=A0 =C2=A02010-07-22 16=
:37:17.000000000 -0700
> ++++ gcc-4.5/gcc/config.gcc =C2=A0 =C2=A0 2010-09-25 02:25:41.412414136 -=
0700
> +@@ -1707,7 +1707,7 @@
> + =C2=A0 =C2=A0 =C2=A0 *-*-irix6*)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tm_file=3D"${tm_file} =
mips/iris6.h"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmake_file=3D"${tmake_=
file} mips/t-iris6"
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tm_defines=3D"${tm_def=
ines} MIPS_ISA_DEFAULT=3D3 MIPS_ABI_DEFAULT=3DABI_N32"
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tm_defines=3D"${tm_def=
ines} MIPS_ISA_DEFAULT=3D3 MIPS_ABI_DEFAULT=3DABI_64"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case ${target} in
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *-*-irix6.[0-4]*)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 use_gcc_stdint=3Dprovide
> +Index: gcc-4.5/gcc/config/mips/t-linux64
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.5.orig/gcc/config/mips/t-linux64 =C2=A0 =C2=A0 2010-07-11 16:1=
4:42.000000000 -0700
> ++++ gcc-4.5/gcc/config/mips/t-linux64 =C2=A02010-09-25 02:29:52.75870825=
0 -0700
> +@@ -18,7 +18,7 @@
> +
> + MULTILIB_OPTIONS =3D mabi=3Dn32/mabi=3D32/mabi=3D64
> + MULTILIB_DIRNAMES =3D n32 32 64
> +-MULTILIB_OSDIRNAMES =3D ../lib32 ../lib ../lib64
> ++MULTILIB_OSDIRNAMES =3D ../lib64 ../lib32 ../lib
> +
> + EXTRA_MULTILIB_PARTS=3Dcrtbegin.o crtend.o crtbeginS.o crtendS.o crtbeg=
inT.o
> +
> diff --git a/recipes/gcc/gcc-4.5.2/zecke-no-host-includes.patch b/recipes=
/gcc/gcc-4.5.2/zecke-no-host-includes.patch
> new file mode 100644
> index 0000000..4ccf35f
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5.2/zecke-no-host-includes.patch
> @@ -0,0 +1,31 @@
> +Index: gcc-4.4+svnr145550/gcc/incpath.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.4+svnr145550.orig/gcc/incpath.c =C2=A0 =C2=A0 =C2=A02009-04-04=
 13:48:31.000000000 -0700
> ++++ gcc-4.4+svnr145550/gcc/incpath.c =C2=A0 2009-04-04 14:49:29.00000000=
0 -0700
> +@@ -417,6 +417,26 @@
> + =C2=A0 p->construct =3D 0;
> + =C2=A0 p->user_supplied_p =3D user_supplied_p;
> +
> ++#ifdef CROSS_COMPILE
> ++ =C2=A0 =C2=A0/* A common error when cross compiling is including
> ++ =C2=A0 =C2=A0host headers. This code below will try to fail fast
> ++ =C2=A0 =C2=A0for cross compiling. Currently we consider /usr/include,
> ++ =C2=A0 =C2=A0/opt/include and /sw/include as harmful. =C2=A0*/
> ++ =C2=A0 =C2=A0 =C2=A0{
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* printf("Adding Path=
: %s\n", p->name ); */
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if( strstr(p->name, "/=
usr/include" ) =3D=3D p->name ) {
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fprintf(stderr, _("CROSS COMPILE Badness: /usr/include in INCLUDEPATH=
: %s\n"), p->name);
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0abort();
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if( strstr(p->n=
ame, "/sw/include") =3D=3D p->name ) {
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fprintf(stderr, _("CROSS COMPILE Badness: /sw/include in INCLUDEPATH:=
 %s\n"), p->name);
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0abort();
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if( strstr(p->n=
ame, "/opt/include") =3D=3D p->name ) {
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fprintf(stderr, _("CROSS COMPILE Badness: /opt/include in INCLUDEPATH=
: %s\n"), p->name);
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0abort();
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> ++ =C2=A0 =C2=A0 =C2=A0}
> ++#endif
> ++
> + =C2=A0 add_cpp_dir_path (p, chain);
> + }
> +
> diff --git a/recipes/gcc/gcc-4.5.2/zecke-xgcc-cpp.patch b/recipes/gcc/gcc=
-4.5.2/zecke-xgcc-cpp.patch
> new file mode 100644
> index 0000000..a7722cb
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5.2/zecke-xgcc-cpp.patch
> @@ -0,0 +1,28 @@
> +upstream: n/a
> +comment: Use the preprocessor we have just compiled instead the one of
> +the system. There might be incompabilities between us and them.
> +
> +Index: gcc-4.3.1/Makefile.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.3.1.orig/Makefile.in 2008-08-19 01:09:56.000000000 -0700
> ++++ gcc-4.3.1/Makefile.in =C2=A0 =C2=A0 =C2=A02008-08-19 01:13:27.000000=
000 -0700
> +@@ -204,6 +204,7 @@
> + =C2=A0 =C2=A0 =C2=A0 AR=3D"$(AR_FOR_TARGET)"; export AR; \
> + =C2=A0 =C2=A0 =C2=A0 AS=3D"$(COMPILER_AS_FOR_TARGET)"; export AS; \
> + =C2=A0 =C2=A0 =C2=A0 CC=3D"$(CC_FOR_TARGET)"; export CC; \
> ++ =C2=A0 =C2=A0 =C2=A0CPP=3D"$(CC_FOR_TARGET) -E"; export CPP; \
> + =C2=A0 =C2=A0 =C2=A0 CFLAGS=3D"$(CFLAGS_FOR_TARGET) $(SYSROOT_CFLAGS_FO=
R_TARGET) $(DEBUG_PREFIX_CFLAGS_FOR_TARGET)"; export CFLAGS; \
> + =C2=A0 =C2=A0 =C2=A0 CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> + =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D"$(CPPFLAGS_FOR_TARGET)"; export CPPFLA=
GS; \
> +Index: gcc-4.3.1/Makefile.tpl
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.3.1.orig/Makefile.tpl =C2=A0 =C2=A0 =C2=A0 =C2=A02008-08-21 00=
:07:58.000000000 -0700
> ++++ gcc-4.3.1/Makefile.tpl =C2=A0 =C2=A0 2008-08-21 00:09:52.000000000 -=
0700
> +@@ -223,6 +223,7 @@
> + =C2=A0 =C2=A0 =C2=A0 AR=3D"$(AR_FOR_TARGET)"; export AR; \
> + =C2=A0 =C2=A0 =C2=A0 AS=3D"$(COMPILER_AS_FOR_TARGET)"; export AS; \
> + =C2=A0 =C2=A0 =C2=A0 CC=3D"$(CC_FOR_TARGET)"; export CC; \
> ++ =C2=A0 =C2=A0 =C2=A0CPP=3D"$(CC_FOR_TARGET) -E"; export CPP; \
> + =C2=A0 =C2=A0 =C2=A0 CFLAGS=3D"$(CFLAGS_FOR_TARGET) $(SYSROOT_CFLAGS_FO=
R_TARGET) $(DEBUG_PREFIX_CFLAGS_FOR_TARGET)"; export CFLAGS; \
> + =C2=A0 =C2=A0 =C2=A0 CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> + =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D"$(CPPFLAGS_FOR_TARGET)"; export CPPFLA=
GS; \
> diff --git a/recipes/gcc/gcc-cross-initial_4.5.2.bb b/recipes/gcc/gcc-cro=
ss-initial_4.5.2.bb
> new file mode 100644
> index 0000000..1639511
> --- /dev/null
> +++ b/recipes/gcc/gcc-cross-initial_4.5.2.bb
> @@ -0,0 +1,2 @@
> +require gcc-cross_${PV}.bb
> +require gcc-cross-initial.inc
> diff --git a/recipes/gcc/gcc-cross-intermediate_4.5.2.bb b/recipes/gcc/gc=
c-cross-intermediate_4.5.2.bb
> new file mode 100644
> index 0000000..eb59de9
> --- /dev/null
> +++ b/recipes/gcc/gcc-cross-intermediate_4.5.2.bb
> @@ -0,0 +1,2 @@
> +require gcc-cross_${PV}.bb
> +require gcc-cross-intermediate.inc
> diff --git a/recipes/gcc/gcc-cross-sdk_4.5.2.bb b/recipes/gcc/gcc-cross-s=
dk_4.5.2.bb
> new file mode 100644
> index 0000000..d1e13d4
> --- /dev/null
> +++ b/recipes/gcc/gcc-cross-sdk_4.5.2.bb
> @@ -0,0 +1,8 @@
> +inherit sdk
> +
> +require gcc-${PV}.inc
> +require gcc-cross-sdk.inc
> +PR =3D "${INC_PR}.1"
> +
> +EXTRA_OECONF +=3D " --disable-libunwind-exceptions --with-mpfr=3D${STAGI=
NG_DIR_NATIVE}${prefix_native} --with-system-zlib"
> +
> diff --git a/recipes/gcc/gcc-cross_4.5.2.bb b/recipes/gcc/gcc-cross_4.5.2=
.bb
> new file mode 100644
> index 0000000..87fe194
> --- /dev/null
> +++ b/recipes/gcc/gcc-cross_4.5.2.bb
> @@ -0,0 +1,12 @@
> +require gcc-${PV}.inc
> +require gcc-cross4.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +NATIVEDEPS +=3D "libmpc-native libelf-native"
> +SRC_URI_append_fail-fast =3D " file://zecke-no-host-includes.patch "
> +
> +EXTRA_OECONF +=3D " --disable-libunwind-exceptions --with-mpfr=3D${STAGI=
NG_DIR_NATIVE}${prefix_native} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -with-libelf=3D=
${STAGING_DIR_NATIVE}${prefix_native} --with-system-zlib"
> +
> +ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_DIR_TARGET}${target_includ=
edir}"
> diff --git a/recipes/gcc/gcc_4.5.2.bb b/recipes/gcc/gcc_4.5.2.bb
> new file mode 100644
> index 0000000..ad71ada
> --- /dev/null
> +++ b/recipes/gcc/gcc_4.5.2.bb
> @@ -0,0 +1,15 @@
> +PR =3D "${INC_PR}.1"
> +require gcc-${PV}.inc
> +require gcc-configure-target.inc
> +require gcc-package-target.inc
> +
> +# Gcc 4.3.3 installs crt* in a '4.3.1' dir....
> +FILES_${PN} +=3D "\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0${gcclibdir}/${TARGET_SYS}/*/*.o \
> + =C2=A0 =C2=A0 =C2=A0 ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lto1 \
> + =C2=A0 =C2=A0 =C2=A0 ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lto-wrappe=
r \
> +"
> +
> +SRC_URI_append =3D "file://fortran-cross-compile-hack.patch"
> +
> +ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_INCDIR}"
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


