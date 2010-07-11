Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OY6LN-00080p-5n
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 01:53:58 +0200
Received: by iwn34 with SMTP id 34so4146649iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jul 2010 16:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=XYhxQFN41+u7DM1qgYdBQWULBNIw3CkoDAH5BFDL1HM=;
	b=GshqbwK85oMtm7JrQx3MvQbzdUX6ll0hozfp5UipamUrqRiMestToRnCbP5WdL4/lN
	pDxCwYJmGirVS6sTLGgRE18cKDBEpg278dDfq2CSApFR8kIUyYatpuPHzMTCBGN6GaO+
	S1LehFzHwaXCX7M41K9AInY3zeXGkaaSfQyyM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Pyz74t4WT4wPfhDK7fGXrxBlkZ+M2HvhiEoPhOx4GpAUBVyPw3KiIsjnoOcOfe5Wpl
	Mp7URplNEHFkYWk6pamGihz0ULC2/YvQ8feJJLX6wZ0pLuHLdH2s13ff6LJCg/1G6d8a
	N082cOzaF9t8apAu+SGDzLxZU++g39ArbVxs8=
Received: by 10.231.31.202 with SMTP id z10mr13935585ibc.85.1278892142198; 
	Sun, 11 Jul 2010 16:49:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.17.132 with HTTP; Sun, 11 Jul 2010 16:48:42 -0700 (PDT)
In-Reply-To: <1278833542-16021-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <AANLkTinu9HQ1P7ppw_mBT5lX2zUuZ31QIL-sPQDdkPqM@mail.gmail.com> 
	<1278833542-16021-1-git-send-email-fransmeulenbroeks@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Jul 2010 16:48:42 -0700
Message-ID: <AANLkTikZcDFs2duycC7tzPCVdu6-8vqjQKF_etRBGiAR@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gcc 4.1.x: patch Makefile.in for cross compile badness
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
X-List-Received-Date: Sun, 11 Jul 2010 23:53:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 11, 2010 at 12:32 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> When compiling gcc target code make passes -I(GMPINC)
> but this one points to the host dir (it is set to HOST_GMPINC
> which in oe points to tmp/sysroots/i686-linux/usr/include)
> This patch breaks the env var $(INCLUDES) in two
> and only uses the TARGET specific part for compiling libgcc
> and the crt stuff.
>
> This has been fully tested with gcc 4.1.2. For 4.1.0 and 4.1.0 it is
> verified that the patch applies properly
>
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>

Acked-by: Khem Raj <raj.khem@gmail.com>

Please bump PR too.

> ---
>
> see also =A0the thread
> [RFC] gcc patch to avoid host include when compiling gcc-cross
> on the oe ML
>
> I'll apply if I get two acks. After that I'll try to find time to
> port it to newer versions too (but if someone else would like to
> give that a stab, be my guest).
> ---
> =A0recipes/gcc/gcc-4.1.0.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A04 ++-
> =A0recipes/gcc/gcc-4.1.0/Makefile.in.patch | =A0 47 +++++++++++++++++++++=
++++++++++
> =A0recipes/gcc/gcc-4.1.1.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A01 +
> =A0recipes/gcc/gcc-4.1.1/Makefile.in.patch | =A0 47 +++++++++++++++++++++=
++++++++++
> =A0recipes/gcc/gcc-4.1.2.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A01 +
> =A0recipes/gcc/gcc-4.1.2/Makefile.in.patch | =A0 47 +++++++++++++++++++++=
++++++++++
> =A06 files changed, 146 insertions(+), 1 deletions(-)
> =A0create mode 100644 recipes/gcc/gcc-4.1.0/Makefile.in.patch
> =A0create mode 100644 recipes/gcc/gcc-4.1.1/Makefile.in.patch
> =A0create mode 100644 recipes/gcc/gcc-4.1.2/Makefile.in.patch
>
> diff --git a/recipes/gcc/gcc-4.1.0.inc b/recipes/gcc/gcc-4.1.0.inc
> index bfaf699..34d3502 100644
> --- a/recipes/gcc/gcc-4.1.0.inc
> +++ b/recipes/gcc/gcc-4.1.0.inc
> @@ -11,7 +11,9 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.=
bz2;name=3Darchive \
> =A0 =A0 =A0 =A0file://arm-nolibfloat.patch \
> =A0 =A0 =A0 =A0file://arm-softfloat.patch \
> =A0 =A0 =A0 =A0file://zecke-xgcc-cpp.patch \
> - =A0 =A0file://pr34130.patch"
> + =A0 =A0 =A0 file://pr34130.patch \
> + =A0 =A0 =A0 file://Makefile.in.patch \
> + =A0 =A0 =A0 =A0"
>
> =A0SRC_URI_append_fail-fast =3D " file://zecke-no-host-includes.patch "
>
> diff --git a/recipes/gcc/gcc-4.1.0/Makefile.in.patch b/recipes/gcc/gcc-4.=
1.0/Makefile.in.patch
> new file mode 100644
> index 0000000..140116a
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.1.0/Makefile.in.patch
> @@ -0,0 +1,47 @@
> +Index: gcc-4.1.2/gcc/Makefile.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.1.2.orig/gcc/Makefile.in
> ++++ gcc-4.1.2/gcc/Makefile.in
> +@@ -405,7 +405,7 @@ LIMITS_H_TEST =3D [ -f $(SYSTEM_HEADER_DIR
> + TARGET_SYSTEM_ROOT =3D @TARGET_SYSTEM_ROOT@
> +
> + xmake_file=3D@xmake_file@
> +-tmake_file=3D@tmake_file@
> ++tmake_file=3D@tmake_file@ /home/frans/oe/tmp_angstrom/work/nios2-linux/=
gcc-cross-4.1.2-r22.1/temp/t-oe
> + out_file=3D$(srcdir)/config/@out_file@
> + out_object_file=3D@out_object_file@
> + md_file=3D$(srcdir)/config/@md_file@
> +@@ -548,7 +548,7 @@ LIBGCC2_INCLUDES =3D
> + TARGET_LIBGCC2_CFLAGS =3D
> +
> + # Options to use when compiling crtbegin/end.
> +-CRTSTUFF_CFLAGS =3D -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g=
0 \
> ++CRTSTUFF_CFLAGS =3D -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES) $(MULTILIB_CFL=
AGS) -g0 \
> + =A0 -finhibit-size-directive -fno-inline-functions -fno-exceptions \
> + =A0 -fno-zero-initialized-in-bss -fno-unit-at-a-time \
> + =A0 $(INHIBIT_LIBC_CFLAGS)
> +@@ -845,9 +845,13 @@ BUILD_VARRAY =3D build/varray.o
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
> + =A0 =A0 =A0 =A0 =A0-I$(srcdir)/../include @INCINTL@ \
> +- =A0 =A0 =A0 =A0 $(CPPINC) $(GMPINC)
> ++ =A0 =A0 =A0 =A0 $(CPPINC)
> ++INCLUDES =3D $(TARGET_INCLUDES) $(GMPINC)
> +
> + .c.o:
> + =A0 =A0 =A0 $(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
> +@@ -1379,7 +1383,7 @@ libgcc.a: $(LIBGCC_DEPS)
> + =A0 =A0 =A0 $(MAKE) \
> + =A0 =A0 =A0 =A0 CFLAGS=3D"$(CFLAGS) $(WARN_CFLAGS)" \
> + =A0 =A0 =A0 =A0 CONFIG_H=3D"$(TCONFIG_H)" TM_H=3D"$(TM_H)" \
> +- =A0 =A0 =A0 =A0INCLUDES=3D"$(INCLUDES)" \
> ++ =A0 =A0 =A0 =A0INCLUDES=3D"$(TARGET_INCLUDES)" \
> + =A0 =A0 =A0 =A0 MAKEOVERRIDES=3D \
> + =A0 =A0 =A0 =A0 -f libgcc.mk all
> +
> diff --git a/recipes/gcc/gcc-4.1.1.inc b/recipes/gcc/gcc-4.1.1.inc
> index 3b813b0..19f2423 100644
> --- a/recipes/gcc/gcc-4.1.1.inc
> +++ b/recipes/gcc/gcc-4.1.1.inc
> @@ -32,6 +32,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.=
bz2;name=3Darchive \
> =A0 =A0 =A0 =A0 file://gcc-4.1.1-e300cx.patch \
> =A0 =A0 =A0 =A0 file://pr34130.patch \
> =A0 =A0 =A0 =A0file://sed-fixinc-backslash.patch \
> + =A0 =A0 =A0 file://Makefile.in.patch \
> =A0 =A0 =A0 =A0"
>
> =A0SRC_URI_append_sh3 =A0=3D " file://sh3-installfix-fixheaders.patch "
> diff --git a/recipes/gcc/gcc-4.1.1/Makefile.in.patch b/recipes/gcc/gcc-4.=
1.1/Makefile.in.patch
> new file mode 100644
> index 0000000..140116a
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.1.1/Makefile.in.patch
> @@ -0,0 +1,47 @@
> +Index: gcc-4.1.2/gcc/Makefile.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.1.2.orig/gcc/Makefile.in
> ++++ gcc-4.1.2/gcc/Makefile.in
> +@@ -405,7 +405,7 @@ LIMITS_H_TEST =3D [ -f $(SYSTEM_HEADER_DIR
> + TARGET_SYSTEM_ROOT =3D @TARGET_SYSTEM_ROOT@
> +
> + xmake_file=3D@xmake_file@
> +-tmake_file=3D@tmake_file@
> ++tmake_file=3D@tmake_file@ /home/frans/oe/tmp_angstrom/work/nios2-linux/=
gcc-cross-4.1.2-r22.1/temp/t-oe
> + out_file=3D$(srcdir)/config/@out_file@
> + out_object_file=3D@out_object_file@
> + md_file=3D$(srcdir)/config/@md_file@
> +@@ -548,7 +548,7 @@ LIBGCC2_INCLUDES =3D
> + TARGET_LIBGCC2_CFLAGS =3D
> +
> + # Options to use when compiling crtbegin/end.
> +-CRTSTUFF_CFLAGS =3D -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g=
0 \
> ++CRTSTUFF_CFLAGS =3D -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES) $(MULTILIB_CFL=
AGS) -g0 \
> + =A0 -finhibit-size-directive -fno-inline-functions -fno-exceptions \
> + =A0 -fno-zero-initialized-in-bss -fno-unit-at-a-time \
> + =A0 $(INHIBIT_LIBC_CFLAGS)
> +@@ -845,9 +845,13 @@ BUILD_VARRAY =3D build/varray.o
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
> + =A0 =A0 =A0 =A0 =A0-I$(srcdir)/../include @INCINTL@ \
> +- =A0 =A0 =A0 =A0 $(CPPINC) $(GMPINC)
> ++ =A0 =A0 =A0 =A0 $(CPPINC)
> ++INCLUDES =3D $(TARGET_INCLUDES) $(GMPINC)
> +
> + .c.o:
> + =A0 =A0 =A0 $(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
> +@@ -1379,7 +1383,7 @@ libgcc.a: $(LIBGCC_DEPS)
> + =A0 =A0 =A0 $(MAKE) \
> + =A0 =A0 =A0 =A0 CFLAGS=3D"$(CFLAGS) $(WARN_CFLAGS)" \
> + =A0 =A0 =A0 =A0 CONFIG_H=3D"$(TCONFIG_H)" TM_H=3D"$(TM_H)" \
> +- =A0 =A0 =A0 =A0INCLUDES=3D"$(INCLUDES)" \
> ++ =A0 =A0 =A0 =A0INCLUDES=3D"$(TARGET_INCLUDES)" \
> + =A0 =A0 =A0 =A0 MAKEOVERRIDES=3D \
> + =A0 =A0 =A0 =A0 -f libgcc.mk all
> +
> diff --git a/recipes/gcc/gcc-4.1.2.inc b/recipes/gcc/gcc-4.1.2.inc
> index 3b6cf30..8771e18 100644
> --- a/recipes/gcc/gcc-4.1.2.inc
> +++ b/recipes/gcc/gcc-4.1.2.inc
> @@ -29,6 +29,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.=
bz2;name=3Darchive \
> =A0 =A0 =A0 =A0file://gfortran.patch \
> =A0 =A0 =A0 =A0 file://gcc-4.0.2-e300c2c3.patch \
> =A0 =A0 =A0 =A0 file://pr34130.patch \
> + =A0 =A0 =A0 file://Makefile.in.patch \
> =A0 =A0 =A0 =A0"
>
> =A0SRC_URI_append_sh3 =A0=3D " file://sh3-installfix-fixheaders.patch "
> diff --git a/recipes/gcc/gcc-4.1.2/Makefile.in.patch b/recipes/gcc/gcc-4.=
1.2/Makefile.in.patch
> new file mode 100644
> index 0000000..140116a
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.1.2/Makefile.in.patch
> @@ -0,0 +1,47 @@
> +Index: gcc-4.1.2/gcc/Makefile.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-4.1.2.orig/gcc/Makefile.in
> ++++ gcc-4.1.2/gcc/Makefile.in
> +@@ -405,7 +405,7 @@ LIMITS_H_TEST =3D [ -f $(SYSTEM_HEADER_DIR
> + TARGET_SYSTEM_ROOT =3D @TARGET_SYSTEM_ROOT@
> +
> + xmake_file=3D@xmake_file@
> +-tmake_file=3D@tmake_file@
> ++tmake_file=3D@tmake_file@ /home/frans/oe/tmp_angstrom/work/nios2-linux/=
gcc-cross-4.1.2-r22.1/temp/t-oe
> + out_file=3D$(srcdir)/config/@out_file@
> + out_object_file=3D@out_object_file@
> + md_file=3D$(srcdir)/config/@md_file@
> +@@ -548,7 +548,7 @@ LIBGCC2_INCLUDES =3D
> + TARGET_LIBGCC2_CFLAGS =3D
> +
> + # Options to use when compiling crtbegin/end.
> +-CRTSTUFF_CFLAGS =3D -O2 $(GCC_CFLAGS) $(INCLUDES) $(MULTILIB_CFLAGS) -g=
0 \
> ++CRTSTUFF_CFLAGS =3D -O2 $(GCC_CFLAGS) $(TARGET_INCLUDES) $(MULTILIB_CFL=
AGS) -g0 \
> + =A0 -finhibit-size-directive -fno-inline-functions -fno-exceptions \
> + =A0 -fno-zero-initialized-in-bss -fno-unit-at-a-time \
> + =A0 $(INHIBIT_LIBC_CFLAGS)
> +@@ -845,9 +845,13 @@ BUILD_VARRAY =3D build/varray.o
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
> + =A0 =A0 =A0 =A0 =A0-I$(srcdir)/../include @INCINTL@ \
> +- =A0 =A0 =A0 =A0 $(CPPINC) $(GMPINC)
> ++ =A0 =A0 =A0 =A0 $(CPPINC)
> ++INCLUDES =3D $(TARGET_INCLUDES) $(GMPINC)
> +
> + .c.o:
> + =A0 =A0 =A0 $(CC) -c $(ALL_CFLAGS) $(ALL_CPPFLAGS) $< $(OUTPUT_OPTION)
> +@@ -1379,7 +1383,7 @@ libgcc.a: $(LIBGCC_DEPS)
> + =A0 =A0 =A0 $(MAKE) \
> + =A0 =A0 =A0 =A0 CFLAGS=3D"$(CFLAGS) $(WARN_CFLAGS)" \
> + =A0 =A0 =A0 =A0 CONFIG_H=3D"$(TCONFIG_H)" TM_H=3D"$(TM_H)" \
> +- =A0 =A0 =A0 =A0INCLUDES=3D"$(INCLUDES)" \
> ++ =A0 =A0 =A0 =A0INCLUDES=3D"$(TARGET_INCLUDES)" \
> + =A0 =A0 =A0 =A0 MAKEOVERRIDES=3D \
> + =A0 =A0 =A0 =A0 -f libgcc.mk all
> +
> --
> 1.6.4.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


