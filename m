Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0D342724C9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 15:22:05 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id n12so3903960wgh.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 07:22:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=B/XSV2A92hqXGHXQ1vuZNsvElTVZEoK5z3NVLUFUpH8=;
	b=B3SOYteVfFmidedh+yUKwLGYMtL09NqvMLRhloKg/GdbKg35Yl/LIWui9ecwLYzPGf
	Syyn3rSzYv3u3dS2xAvoYsPu+lTRbTuUaIUCkYCcHst4EfyAZqiOL4UmU93tDMFX8i+m
	XQlT/9lUJfgCKw3mex39HYpdV/8B/OtkW2uV0j97bMDKc/8MU1hHs4FkbWkh92i3U8/k
	8ezHPqfYFfZubIgiIa+fQyHfjgbPbjfig7pw0FbXniRqkAKYKZ8iszZ9dxrZK/F2hrMc
	+iyKTbwg5uSJ1xoCv5dxNv3JOR8sKawFEjR0hjoaWL+dlRMktPjiiloQR+kmbX93m4EF
	+s8g==
X-Gm-Message-State: ALoCoQlTjuEWoG1yEP7CqxAn1dmU9mZMYGl+vbQoNGvqu/D6xrYDE/zRhJFs7k9iJ512LZRpq+eJ
X-Received: by 10.180.198.209 with SMTP id je17mr7182890wic.17.1418224925841; 
	Wed, 10 Dec 2014 07:22:05 -0800 (PST)
Received: from ?IPv6:2001:610:612::ac72:f032:1fba:6455?
	([2001:610:612:0:ac72:f032:1fba:6455])
	by mx.google.com with ESMTPSA id
	l10sm18308315wif.20.2014.12.10.07.22.04 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 10 Dec 2014 07:22:04 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20141209103051.GH2470@jama>
Date: Wed, 10 Dec 2014 16:22:03 +0100
Message-Id: <D0BFCAA9-DC8D-4DC5-B1CB-A6DE614EB131@dominion.thruhere.net>
References: <1417610482-5790-1-git-send-email-koen@dominion.thruhere.net>
	<20141209103051.GH2470@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1993)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 10 Dec 2014 15:22:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 9 dec. 2014, om 11:30 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:
>=20
> On Wed, Dec 03, 2014 at 01:41:22PM +0100, Koen Kooi wrote:
>> Fetch dvbcan tables using bitbake and reenable the config option.
>>=20
>> The license file was renamed and now lists the CLA requirement as =
well.
>=20
> Fails to build for qemux86, check last world build logs.

I'll see if I can reproduce.

>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> ...end-specific-LD-CFLAGS-into-a-helper-vari.patch | 115 =
++++++++++++++-------
>> .../recipes-dvb/tvheadend/tvheadend_git.bb         |  18 ++--
>> 2 files changed, 92 insertions(+), 41 deletions(-)
>>=20
>> diff --git =
a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Move-tvheadend-spec=
ific-LD-CFLAGS-into-a-helper-vari.patch =
b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Move-tvheadend-spec=
ific-LD-CFLAGS-into-a-helper-vari.patch
>> index 9dfcce0..cac2b90 100644
>> --- =
a/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Move-tvheadend-spec=
ific-LD-CFLAGS-into-a-helper-vari.patch
>> +++ =
b/meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Move-tvheadend-spec=
ific-LD-CFLAGS-into-a-helper-vari.patch
>> @@ -1,4 +1,4 @@
>> -=46rom 2ee64b359464b48f751683faa5ded3ee8200fe90 Mon Sep 17 00:00:00 =
2001
>> +=46rom e56e244f901ae04e8c681c848d06c1b96b67ca58 Mon Sep 17 00:00:00 =
2001
>> From: Koen Kooi <koen@dominion.thruhere.net>
>> Date: Fri, 21 Dec 2012 10:15:42 +0100
>> Subject: [PATCH] Move tvheadend specific LD/CFLAGS into a helper =
variable to
>> @@ -8,64 +8,109 @@ Signed-off-by: Koen Kooi =
<koen@dominion.thruhere.net>
>>=20
>> Upstream-Status: Inappropriate [OE specific]
>> ---
>> - Makefile              |   20 ++++++++++----------
>> - support/configure.inc |    8 ++++----
>> - 2 files changed, 14 insertions(+), 14 deletions(-)
>> + Makefile              | 44 =
++++++++++++++++++++++----------------------
>> + support/configure.inc |  8 ++++----
>> + 2 files changed, 26 insertions(+), 26 deletions(-)
>>=20
>> diff --git a/Makefile b/Makefile
>> -index 8c6b293..daf5f14 100644
>> +index 9931635..5e4aebf 100644
>> --- a/Makefile
>> +++ b/Makefile
>> -@@ -27,12 +27,12 @@ PROG =3D ${BUILDDIR}/tvheadend
>> +@@ -27,45 +27,45 @@ PROG    :=3D $(BUILDDIR)/tvheadend
>>  # Common compiler flags
>>  #
>>=20
>> +-CFLAGS  +=3D -g -O2 -Wunused-result
>> -CFLAGS  +=3D -Wall -Werror -Wwrite-strings =
-Wno-deprecated-declarations
>> --CFLAGS  +=3D -Wmissing-prototypes -fms-extensions
>> --CFLAGS  +=3D -g -funsigned-char -O2=20
>> +-CFLAGS  +=3D -Wmissing-prototypes
>> +-CFLAGS  +=3D -fms-extensions -funsigned-char -fno-strict-aliasing
>> -CFLAGS  +=3D -D_FILE_OFFSET_BITS=3D64
>> --CFLAGS  +=3D -I${BUILDDIR} -I${CURDIR}/src -I${CURDIR}
>> --LDFLAGS +=3D -lrt -ldl -lpthread -lm
>> +-CFLAGS  +=3D -I${BUILDDIR} -I${ROOTDIR}/src -I${ROOTDIR}
>> ++TVH_CFLAGS  +=3D -g -O2 -Wunused-result
>> +TVH_CFLAGS  +=3D -Wall -Werror -Wwrite-strings =
-Wno-deprecated-declarations
>> -+TVH_CFLAGS  +=3D -Wmissing-prototypes -fms-extensions
>> -+TVH_CFLAGS  +=3D -g -funsigned-char -O2=20
>> ++TVH_CFLAGS  +=3D -Wmissing-prototypes
>> ++TVH_CFLAGS  +=3D -fms-extensions -funsigned-char =
-fno-strict-aliasing
>> +TVH_CFLAGS  +=3D -D_FILE_OFFSET_BITS=3D64
>> -+TVH_CFLAGS  +=3D -I${BUILDDIR} -I${CURDIR}/src -I${CURDIR}
>> -+TVH_LDFLAGS +=3D -lrt -ldl -lpthread -lm
>> ++TVH_CFLAGS  +=3D -I${BUILDDIR} -I${ROOTDIR}/src -I${ROOTDIR}
>> + ifeq ($(CONFIG_ANDROID),yes)
>> +-LDFLAGS +=3D -ldl -lm
>> ++TVH_LDFLAGS +=3D -ldl -lm
>> + else
>> +-LDFLAGS +=3D -ldl -lpthread -lm
>> ++TVH_LDFLAGS +=3D -ldl -lpthread -lm
>> + endif
>> + ifeq ($(CONFIG_LIBICONV),yes)
>> +-LDFLAGS +=3D -liconv
>> ++TVH_LDFLAGS +=3D -liconv
>> + endif
>> + ifeq ($(PLATFORM), darwin)
>> +-LDFLAGS +=3D -framework CoreServices
>> ++TVH_LDFLAGS +=3D -framework CoreServices
>> + else
>> + ifeq ($(CONFIG_ANDROID),no)
>> +-LDFLAGS +=3D -lrt
>> ++TVH_LDFLAGS +=3D -lrt
>> + endif
>> + endif
>>=20
>> - #
>> - # Other config
>> -@@ -179,8 +179,8 @@ SRCS-${CONFIG_CWC}  +=3D =
src/ffdecsa/ffdecsa_interface.c \
>> - 	src/ffdecsa/ffdecsa_int.c
>> - SRCS-${CONFIG_MMX}  +=3D src/ffdecsa/ffdecsa_mmx.c
>> - SRCS-${CONFIG_SSE2} +=3D src/ffdecsa/ffdecsa_sse2.c
>> --${BUILDDIR}/src/ffdecsa/ffdecsa_mmx.o  : CFLAGS +=3D -mmmx
>> --${BUILDDIR}/src/ffdecsa/ffdecsa_sse2.o : CFLAGS +=3D -msse2
>> -+${BUILDDIR}/src/ffdecsa/ffdecsa_mmx.o  : TVH_CFLAGS +=3D -mmmx
>> -+${BUILDDIR}/src/ffdecsa/ffdecsa_sse2.o : TVH_CFLAGS +=3D -msse2
>> + ifeq ($(COMPILER), clang)
>> +-CFLAGS  +=3D -Wno-microsoft -Qunused-arguments -Wno-unused-function
>> +-CFLAGS  +=3D -Wno-unused-value =
-Wno-tautological-constant-out-of-range-compare
>> +-CFLAGS  +=3D -Wno-parentheses-equality =
-Wno-incompatible-pointer-types
>> ++TVH_CFLAGS  +=3D -Wno-microsoft -Qunused-arguments =
-Wno-unused-function
>> ++TVH_CFLAGS  +=3D -Wno-unused-value =
-Wno-tautological-constant-out-of-range-compare
>> ++TVH_CFLAGS  +=3D -Wno-parentheses-equality =
-Wno-incompatible-pointer-types
>> + endif
>> +=20
>> + ifeq ($(CONFIG_LIBFFMPEG_STATIC),yes)
>> +-CFLAGS  +=3D -I${ROOTDIR}/libav_static/build/ffmpeg/include
>> +-LDFLAGS +=3D -L${ROOTDIR}/libav_static/build/ffmpeg/lib =
-Wl,-Bstatic \
>> ++TVH_CFLAGS  +=3D -I${ROOTDIR}/libav_static/build/ffmpeg/include
>> ++TVH_LDFLAGS +=3D -L${ROOTDIR}/libav_static/build/ffmpeg/lib =
-Wl,-Bstatic \
>> +            -lavresample -lswresample -lswscale \
>> +            -lavutil -lavformat -lavcodec -lavutil \
>> +            -lvorbisenc -lvorbis -logg -lx264 -lvpx \
>> +            -Wl,-Bdynamic
>> + endif
>> + ifeq ($(CONFIG_HDHOMERUN_STATIC),yes)
>> +-CFLAGS  +=3D -I${ROOTDIR}/libhdhomerun_static
>> +-LDFLAGS +=3D -L${ROOTDIR}/libhdhomerun_static/libhdhomerun \
>> ++TVH_CFLAGS  +=3D -I${ROOTDIR}/libhdhomerun_static
>> ++TVH_LDFLAGS +=3D -L${ROOTDIR}/libhdhomerun_static/libhdhomerun \
>> +            -Wl,-Bstatic -lhdhomerun -Wl,-Bdynamic
>> + endif
>> +=20
>> +@@ -340,8 +340,8 @@ SRCS-yes +=3D =
src/descrambler/ffdecsa/ffdecsa_interface.c \
>> + 	    src/descrambler/ffdecsa/ffdecsa_int.c
>> + SRCS-${CONFIG_MMX}  +=3D src/descrambler/ffdecsa/ffdecsa_mmx.c
>> + SRCS-${CONFIG_SSE2} +=3D src/descrambler/ffdecsa/ffdecsa_sse2.c
>> +-${BUILDDIR}/src/descrambler/ffdecsa/ffdecsa_mmx.o  : CFLAGS +=3D =
-mmmx
>> +-${BUILDDIR}/src/descrambler/ffdecsa/ffdecsa_sse2.o : CFLAGS +=3D =
-msse2
>> ++${BUILDDIR}/src/descrambler/ffdecsa/ffdecsa_mmx.o  : TVH_TVH_CFLAGS =
+=3D -mmmx
>> ++${BUILDDIR}/src/descrambler/ffdecsa/ffdecsa_sse2.o : TVH_TVH_CFLAGS =
+=3D -msse2
>>  endif
>>=20
>> - # File bundles
>> -@@ -217,12 +217,12 @@ all: ${PROG}
>> + # libaesdec
>> +@@ -402,12 +402,12 @@ reconfigure:
>>=20
>>  # Binary
>> - ${PROG}: $(OBJS) $(ALLDEPS)
>> + ${PROG}: check_config $(OBJS) $(ALLDEPS)
>> -	$(CC) -o $@ $(OBJS) $(CFLAGS) $(LDFLAGS)
>> -+	$(CC) -o $@ $(OBJS) $(TVH_CFLAGS) $(TVH_LDFLAGS) $(CFLAGS) =
$(LDFLAGS)
>> ++	$(CC) -o $@ $(OBJS) $(TVH_CFLAGS) $(TVH_LDFLAGS) $(TVH_CFLAGS) =
$(TVH_LDFLAGS) $(TVH_CFLAGS) $(TVH_LDFLAGS) $(TVH_CFLAGS) $(TVH_LDFLAGS) =
$(CFLAGS) $(LDFLAGS)
>>=20
>>  # Object
>>  ${BUILDDIR}/%.o: %.c
>>  	@mkdir -p $(dir $@)
>> --	$(CC) -MD -MP $(CFLAGS) -c -o $@ $(CURDIR)/$<
>> -+	$(CC) -MD -MP $(TVH_CFLAGS) $(CFLAGS) -c -o $@ $(CURDIR)/$<
>> +-	$(CC) -MD -MP $(CFLAGS) -c -o $@ $<
>> ++	$(CC) -MD -MP $(TVH_CFLAGS) $(TVH_CFLAGS) $(TVH_CFLAGS) =
$(TVH_CFLAGS) $(CFLAGS) -c -o $@ $<
>>=20
>>  # Add-on
>>  ${BUILDDIR}/%.so: ${SRCS_EXTRA}
>> diff --git a/support/configure.inc b/support/configure.inc
>> -index 0130880..332511e 100644
>> +index f7cfcd3..e3a2dd7 100755
>> --- a/support/configure.inc
>> +++ b/support/configure.inc
>> -@@ -464,8 +464,8 @@ ifeq (\$(origin CC),default)
>> +@@ -455,8 +455,8 @@ ifeq (\$(origin CC),default)
>>  CC        =3D ${CC}
>>  endif
>>  PYTHON   ?=3D ${PYTHON}
>> @@ -76,10 +121,10 @@ index 0130880..332511e 100644
>>  prefix    =3D ${prefix}
>>  bindir    =3D ${bindir}
>>  mandir    =3D ${mandir}
>> -@@ -482,8 +482,8 @@ EOF
>> +@@ -478,8 +478,8 @@ EOF
>>    # Add package config
>>    for pkg in ${PACKAGES[*]}; do
>> -     cat >>${CONFIG_MK} <<EOF
>> +     cat >>"${CONFIG_MK}" <<EOF
>> -LDFLAGS +=3D $(pkg-config --libs $pkg)
>> -CFLAGS  +=3D $(pkg-config --cflags $pkg)
>> +TVH_LDFLAGS +=3D $(pkg-config --libs $pkg)
>> @@ -88,5 +133,5 @@ index 0130880..332511e 100644
>>    done
>>=20
>> --=20
>> -1.7.7.6
>> +1.9.0
>>=20
>> diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb =
b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
>> index 65d43c6..8539927 100644
>> --- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
>> +++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
>> @@ -1,26 +1,32 @@
>> SUMMARY =3D "Tvheadend TV streaming server"
>> HOMEPAGE =3D "https://www.lonelycoder.com/redmine/projects/tvheadend"
>>=20
>> -DEPENDS =3D "avahi zlib openssl python-native"
>> +DEPENDS =3D "avahi zlib openssl python-native libav"
>>=20
>> LICENSE =3D "GPLv3+"
>> -LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D9eef91148a9b14ec7f9df333daebc746"
>> +LIC_FILES_CHKSUM =3D =
"file://LICENSE.md;md5=3D9cae5acac2e9ee2fc3aec01ac88ce5db"
>>=20
>> -SRC_URI =3D "git://github.com/tvheadend/tvheadend.git \
>> +SRC_URI =3D "git://github.com/tvheadend/tvheadend.git;name=3Dtvh \
>> +           =
git://linuxtv.org/dtv-scan-tables.git;name=3Ddvb;destsuffix=3Dgit/data/dvb=
-scan \
>>            =
file://0001-Move-tvheadend-specific-LD-CFLAGS-into-a-helper-vari.patch \
>> "
>> -SRCREV =3D "a420c83a0e0d2c31c2c15d0fec6fedc3f5a36dfe"
>> -PV =3D "3.3"
>> +SRCREV_tvh =3D "a95ef0b237a01e6fe6a29c0cd76f98a3a216c1ce"
>> +SRCREV_dvb =3D "82115b4a1f1039d5a2f93f2b7ddc4b2d2713b7ae"
>> +SRCREV_FORMAT =3D "tvh"
>> +
>> +PV =3D "3.9+git${SRCPV}"
>>=20
>> S =3D "${WORKDIR}/git"
>>=20
>> do_configure() {
>> +    # The fetcher ensures the mux list is up to date
>> +    sed -i -e 's:exit 1:exit 0:g' ${S}/support/getmuxlist
>> +
>>     ./configure --prefix=3D${prefix} \
>>                 --libdir=3D${libdir} \
>>                 --bindir=3D${bindir} \
>>                 --datadir=3D${datadir} \
>>                 --arch=3D${TARGET_ARCH} \
>> -                --disable-dvbscan \
>>                 --disable-bundle
>> }
>>=20
>> --=20
>> 1.9.0
>>=20
>> --=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


