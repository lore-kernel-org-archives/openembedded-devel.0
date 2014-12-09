Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0C010601A0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Dec 2014 10:30:51 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id z12so403379wgg.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Dec 2014 02:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ACF5c0L9tSyexPgiVLoo1HtUYg6TVou00f9dS/9QhBE=;
	b=vfRdhW+yiLPT/BW4teDAA5FiPp969XfIgvkAUr4IbUDV7fN+2QAzM3nEXe0MM9Yy5S
	tWGL3cXdTlW3mc3golhP1zkWmxCCS5y4Y3LnFk+x5RFDR+gOK8DfhDTW/zIrfRi32LLA
	rnVycj9JPsTCgZd9CKnj5gfDibliZyW5ELBz4kAQ/Nf2Y0cKSLECEMyvJsEbCz0V4xeX
	ohEI849R2uaHlYRvHD0oFcDHIx8c2kJfDjaPLl4vSxcGEgSadYOFkj/UTCmLedJxPurE
	UZnWezQ9mSZOkFBjj/evzdBLm/BNBqwkoIAH6B9QcYuIu8vQzxeO/PRKpIRK7c7/K6T8
	ZIEA==
X-Received: by 10.180.218.133 with SMTP id pg5mr30847365wic.70.1418121051433; 
	Tue, 09 Dec 2014 02:30:51 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	eu8sm1620800wib.21.2014.12.09.02.30.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Dec 2014 02:30:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 9 Dec 2014 11:30:51 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141209103051.GH2470@jama>
References: <1417610482-5790-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1417610482-5790-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-multimedia][PATCH] tvheadend: update to 3.9
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
X-List-Received-Date: Tue, 09 Dec 2014 10:30:57 -0000
X-Groupsio-MsgNum: 53235
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YrlhzR9YrZtruaFS"
Content-Disposition: inline

--YrlhzR9YrZtruaFS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2014 at 01:41:22PM +0100, Koen Kooi wrote:
> Fetch dvbcan tables using bitbake and reenable the config option.
>=20
> The license file was renamed and now lists the CLA requirement as well.

Fails to build for qemux86, check last world build logs.

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  ...end-specific-LD-CFLAGS-into-a-helper-vari.patch | 115 ++++++++++++++-=
------
>  .../recipes-dvb/tvheadend/tvheadend_git.bb         |  18 ++--
>  2 files changed, 92 insertions(+), 41 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Move-tv=
headend-specific-LD-CFLAGS-into-a-helper-vari.patch b/meta-multimedia/recip=
es-dvb/tvheadend/tvheadend/0001-Move-tvheadend-specific-LD-CFLAGS-into-a-he=
lper-vari.patch
> index 9dfcce0..cac2b90 100644
> --- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Move-tvheadend=
-specific-LD-CFLAGS-into-a-helper-vari.patch
> +++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Move-tvheadend=
-specific-LD-CFLAGS-into-a-helper-vari.patch
> @@ -1,4 +1,4 @@
> -From 2ee64b359464b48f751683faa5ded3ee8200fe90 Mon Sep 17 00:00:00 2001
> +From e56e244f901ae04e8c681c848d06c1b96b67ca58 Mon Sep 17 00:00:00 2001
>  From: Koen Kooi <koen@dominion.thruhere.net>
>  Date: Fri, 21 Dec 2012 10:15:42 +0100
>  Subject: [PATCH] Move tvheadend specific LD/CFLAGS into a helper variabl=
e to
> @@ -8,64 +8,109 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> =20
>  Upstream-Status: Inappropriate [OE specific]
>  ---
> - Makefile              |   20 ++++++++++----------
> - support/configure.inc |    8 ++++----
> - 2 files changed, 14 insertions(+), 14 deletions(-)
> + Makefile              | 44 ++++++++++++++++++++++----------------------
> + support/configure.inc |  8 ++++----
> + 2 files changed, 26 insertions(+), 26 deletions(-)
> =20
>  diff --git a/Makefile b/Makefile
> -index 8c6b293..daf5f14 100644
> +index 9931635..5e4aebf 100644
>  --- a/Makefile
>  +++ b/Makefile
> -@@ -27,12 +27,12 @@ PROG =3D ${BUILDDIR}/tvheadend
> +@@ -27,45 +27,45 @@ PROG    :=3D $(BUILDDIR)/tvheadend
>   # Common compiler flags
>   #
>  =20
> +-CFLAGS  +=3D -g -O2 -Wunused-result
>  -CFLAGS  +=3D -Wall -Werror -Wwrite-strings -Wno-deprecated-declarations
> --CFLAGS  +=3D -Wmissing-prototypes -fms-extensions
> --CFLAGS  +=3D -g -funsigned-char -O2=20
> +-CFLAGS  +=3D -Wmissing-prototypes
> +-CFLAGS  +=3D -fms-extensions -funsigned-char -fno-strict-aliasing
>  -CFLAGS  +=3D -D_FILE_OFFSET_BITS=3D64
> --CFLAGS  +=3D -I${BUILDDIR} -I${CURDIR}/src -I${CURDIR}
> --LDFLAGS +=3D -lrt -ldl -lpthread -lm
> +-CFLAGS  +=3D -I${BUILDDIR} -I${ROOTDIR}/src -I${ROOTDIR}
> ++TVH_CFLAGS  +=3D -g -O2 -Wunused-result
>  +TVH_CFLAGS  +=3D -Wall -Werror -Wwrite-strings -Wno-deprecated-declarat=
ions
> -+TVH_CFLAGS  +=3D -Wmissing-prototypes -fms-extensions
> -+TVH_CFLAGS  +=3D -g -funsigned-char -O2=20
> ++TVH_CFLAGS  +=3D -Wmissing-prototypes
> ++TVH_CFLAGS  +=3D -fms-extensions -funsigned-char -fno-strict-aliasing
>  +TVH_CFLAGS  +=3D -D_FILE_OFFSET_BITS=3D64
> -+TVH_CFLAGS  +=3D -I${BUILDDIR} -I${CURDIR}/src -I${CURDIR}
> -+TVH_LDFLAGS +=3D -lrt -ldl -lpthread -lm
> ++TVH_CFLAGS  +=3D -I${BUILDDIR} -I${ROOTDIR}/src -I${ROOTDIR}
> + ifeq ($(CONFIG_ANDROID),yes)
> +-LDFLAGS +=3D -ldl -lm
> ++TVH_LDFLAGS +=3D -ldl -lm
> + else
> +-LDFLAGS +=3D -ldl -lpthread -lm
> ++TVH_LDFLAGS +=3D -ldl -lpthread -lm
> + endif
> + ifeq ($(CONFIG_LIBICONV),yes)
> +-LDFLAGS +=3D -liconv
> ++TVH_LDFLAGS +=3D -liconv
> + endif
> + ifeq ($(PLATFORM), darwin)
> +-LDFLAGS +=3D -framework CoreServices
> ++TVH_LDFLAGS +=3D -framework CoreServices
> + else
> + ifeq ($(CONFIG_ANDROID),no)
> +-LDFLAGS +=3D -lrt
> ++TVH_LDFLAGS +=3D -lrt
> + endif
> + endif
>  =20
> - #
> - # Other config
> -@@ -179,8 +179,8 @@ SRCS-${CONFIG_CWC}  +=3D src/ffdecsa/ffdecsa_interfa=
ce.c \
> - 	src/ffdecsa/ffdecsa_int.c
> - SRCS-${CONFIG_MMX}  +=3D src/ffdecsa/ffdecsa_mmx.c
> - SRCS-${CONFIG_SSE2} +=3D src/ffdecsa/ffdecsa_sse2.c
> --${BUILDDIR}/src/ffdecsa/ffdecsa_mmx.o  : CFLAGS +=3D -mmmx
> --${BUILDDIR}/src/ffdecsa/ffdecsa_sse2.o : CFLAGS +=3D -msse2
> -+${BUILDDIR}/src/ffdecsa/ffdecsa_mmx.o  : TVH_CFLAGS +=3D -mmmx
> -+${BUILDDIR}/src/ffdecsa/ffdecsa_sse2.o : TVH_CFLAGS +=3D -msse2
> + ifeq ($(COMPILER), clang)
> +-CFLAGS  +=3D -Wno-microsoft -Qunused-arguments -Wno-unused-function
> +-CFLAGS  +=3D -Wno-unused-value -Wno-tautological-constant-out-of-range-=
compare
> +-CFLAGS  +=3D -Wno-parentheses-equality -Wno-incompatible-pointer-types
> ++TVH_CFLAGS  +=3D -Wno-microsoft -Qunused-arguments -Wno-unused-function
> ++TVH_CFLAGS  +=3D -Wno-unused-value -Wno-tautological-constant-out-of-ra=
nge-compare
> ++TVH_CFLAGS  +=3D -Wno-parentheses-equality -Wno-incompatible-pointer-ty=
pes
> + endif
> +=20
> + ifeq ($(CONFIG_LIBFFMPEG_STATIC),yes)
> +-CFLAGS  +=3D -I${ROOTDIR}/libav_static/build/ffmpeg/include
> +-LDFLAGS +=3D -L${ROOTDIR}/libav_static/build/ffmpeg/lib -Wl,-Bstatic \
> ++TVH_CFLAGS  +=3D -I${ROOTDIR}/libav_static/build/ffmpeg/include
> ++TVH_LDFLAGS +=3D -L${ROOTDIR}/libav_static/build/ffmpeg/lib -Wl,-Bstati=
c \
> +            -lavresample -lswresample -lswscale \
> +            -lavutil -lavformat -lavcodec -lavutil \
> +            -lvorbisenc -lvorbis -logg -lx264 -lvpx \
> +            -Wl,-Bdynamic
> + endif
> + ifeq ($(CONFIG_HDHOMERUN_STATIC),yes)
> +-CFLAGS  +=3D -I${ROOTDIR}/libhdhomerun_static
> +-LDFLAGS +=3D -L${ROOTDIR}/libhdhomerun_static/libhdhomerun \
> ++TVH_CFLAGS  +=3D -I${ROOTDIR}/libhdhomerun_static
> ++TVH_LDFLAGS +=3D -L${ROOTDIR}/libhdhomerun_static/libhdhomerun \
> +            -Wl,-Bstatic -lhdhomerun -Wl,-Bdynamic
> + endif
> +=20
> +@@ -340,8 +340,8 @@ SRCS-yes +=3D src/descrambler/ffdecsa/ffdecsa_interf=
ace.c \
> + 	    src/descrambler/ffdecsa/ffdecsa_int.c
> + SRCS-${CONFIG_MMX}  +=3D src/descrambler/ffdecsa/ffdecsa_mmx.c
> + SRCS-${CONFIG_SSE2} +=3D src/descrambler/ffdecsa/ffdecsa_sse2.c
> +-${BUILDDIR}/src/descrambler/ffdecsa/ffdecsa_mmx.o  : CFLAGS +=3D -mmmx
> +-${BUILDDIR}/src/descrambler/ffdecsa/ffdecsa_sse2.o : CFLAGS +=3D -msse2
> ++${BUILDDIR}/src/descrambler/ffdecsa/ffdecsa_mmx.o  : TVH_TVH_CFLAGS +=
=3D -mmmx
> ++${BUILDDIR}/src/descrambler/ffdecsa/ffdecsa_sse2.o : TVH_TVH_CFLAGS +=
=3D -msse2
>   endif
>  =20
> - # File bundles
> -@@ -217,12 +217,12 @@ all: ${PROG}
> + # libaesdec
> +@@ -402,12 +402,12 @@ reconfigure:
>  =20
>   # Binary
> - ${PROG}: $(OBJS) $(ALLDEPS)
> + ${PROG}: check_config $(OBJS) $(ALLDEPS)
>  -	$(CC) -o $@ $(OBJS) $(CFLAGS) $(LDFLAGS)
> -+	$(CC) -o $@ $(OBJS) $(TVH_CFLAGS) $(TVH_LDFLAGS) $(CFLAGS) $(LDFLAGS)
> ++	$(CC) -o $@ $(OBJS) $(TVH_CFLAGS) $(TVH_LDFLAGS) $(TVH_CFLAGS) $(TVH_L=
DFLAGS) $(TVH_CFLAGS) $(TVH_LDFLAGS) $(TVH_CFLAGS) $(TVH_LDFLAGS) $(CFLAGS)=
 $(LDFLAGS)
>  =20
>   # Object
>   ${BUILDDIR}/%.o: %.c
>   	@mkdir -p $(dir $@)
> --	$(CC) -MD -MP $(CFLAGS) -c -o $@ $(CURDIR)/$<
> -+	$(CC) -MD -MP $(TVH_CFLAGS) $(CFLAGS) -c -o $@ $(CURDIR)/$<
> +-	$(CC) -MD -MP $(CFLAGS) -c -o $@ $<
> ++	$(CC) -MD -MP $(TVH_CFLAGS) $(TVH_CFLAGS) $(TVH_CFLAGS) $(TVH_CFLAGS) =
$(CFLAGS) -c -o $@ $<
>  =20
>   # Add-on
>   ${BUILDDIR}/%.so: ${SRCS_EXTRA}
>  diff --git a/support/configure.inc b/support/configure.inc
> -index 0130880..332511e 100644
> +index f7cfcd3..e3a2dd7 100755
>  --- a/support/configure.inc
>  +++ b/support/configure.inc
> -@@ -464,8 +464,8 @@ ifeq (\$(origin CC),default)
> +@@ -455,8 +455,8 @@ ifeq (\$(origin CC),default)
>   CC        =3D ${CC}
>   endif
>   PYTHON   ?=3D ${PYTHON}
> @@ -76,10 +121,10 @@ index 0130880..332511e 100644
>   prefix    =3D ${prefix}
>   bindir    =3D ${bindir}
>   mandir    =3D ${mandir}
> -@@ -482,8 +482,8 @@ EOF
> +@@ -478,8 +478,8 @@ EOF
>     # Add package config
>     for pkg in ${PACKAGES[*]}; do
> -     cat >>${CONFIG_MK} <<EOF
> +     cat >>"${CONFIG_MK}" <<EOF
>  -LDFLAGS +=3D $(pkg-config --libs $pkg)
>  -CFLAGS  +=3D $(pkg-config --cflags $pkg)
>  +TVH_LDFLAGS +=3D $(pkg-config --libs $pkg)
> @@ -88,5 +133,5 @@ index 0130880..332511e 100644
>     done
>  =20
>  --=20
> -1.7.7.6
> +1.9.0
> =20
> diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/met=
a-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> index 65d43c6..8539927 100644
> --- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> +++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> @@ -1,26 +1,32 @@
>  SUMMARY =3D "Tvheadend TV streaming server"
>  HOMEPAGE =3D "https://www.lonelycoder.com/redmine/projects/tvheadend"
> =20
> -DEPENDS =3D "avahi zlib openssl python-native"
> +DEPENDS =3D "avahi zlib openssl python-native libav"
> =20
>  LICENSE =3D "GPLv3+"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9eef91148a9b14ec7f9df333daebc=
746"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D9cae5acac2e9ee2fc3aec01ac8=
8ce5db"
> =20
> -SRC_URI =3D "git://github.com/tvheadend/tvheadend.git \
> +SRC_URI =3D "git://github.com/tvheadend/tvheadend.git;name=3Dtvh \
> +           git://linuxtv.org/dtv-scan-tables.git;name=3Ddvb;destsuffix=
=3Dgit/data/dvb-scan \
>             file://0001-Move-tvheadend-specific-LD-CFLAGS-into-a-helper-v=
ari.patch \
>  "
> -SRCREV =3D "a420c83a0e0d2c31c2c15d0fec6fedc3f5a36dfe"
> -PV =3D "3.3"
> +SRCREV_tvh =3D "a95ef0b237a01e6fe6a29c0cd76f98a3a216c1ce"
> +SRCREV_dvb =3D "82115b4a1f1039d5a2f93f2b7ddc4b2d2713b7ae"
> +SRCREV_FORMAT =3D "tvh"
> +
> +PV =3D "3.9+git${SRCPV}"
> =20
>  S =3D "${WORKDIR}/git"
> =20
>  do_configure() {
> +    # The fetcher ensures the mux list is up to date
> +    sed -i -e 's:exit 1:exit 0:g' ${S}/support/getmuxlist
> +
>      ./configure --prefix=3D${prefix} \
>                  --libdir=3D${libdir} \
>                  --bindir=3D${bindir} \
>                  --datadir=3D${datadir} \
>                  --arch=3D${TARGET_ARCH} \
> -                --disable-dvbscan \
>                  --disable-bundle
>  }
> =20
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YrlhzR9YrZtruaFS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSGz1sACgkQN1Ujt2V2gByiawCglODIzJOwCp15xlzuZgspLQvO
o/QAnRGkAYPzqeZqXtpu316LA/vamo4L
=bZYl
-----END PGP SIGNATURE-----

--YrlhzR9YrZtruaFS--
