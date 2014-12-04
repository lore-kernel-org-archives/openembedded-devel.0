Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 667B16DA74
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Dec 2014 06:27:03 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id em10so7244141wid.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Dec 2014 22:27:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=Hwlfpd2dI+YasRiKK8Q+vPhPQGCCjbWMPh9a9uZBTNk=;
	b=knwc26YsWdAW5A4GLZHo59hr1B+LH0LwtMuDG/ma4yRvfSTh0ewmJUgzpeUol7eo1/
	EGt08GFq1m5tdR/z8RiYFuFWeQm3myFlD7lfUUEmWe5GV0/2/wEbrTtMc0oUJgNV+QLM
	3blKLEoZgzAIdfriz/qzmisQto/9bumb6CHO3w+78iOh1DR9ShSNHRMIfBJS+SZsVH8h
	27eMAsZzzs3wHvPa6Hkhjs1Qn/GY/Y4nV83QpyrVDGA/hMyuFNk+gBCoKrjfTOcT6OyW
	GBrDUTXzzmdcvdiyW7EWLPsxewIYiBjQJP2iQ5q2XQBB6PbdFnB6KCG1t6mB+5m1RPfP
	0log==
X-Gm-Message-State: ALoCoQn6PspiBdPF/cKw7JpFqzLKX1eI0o4mEqibXw3Kje+m935FriOMyO+Vq8WzLDIQUV/M21Wh
X-Received: by 10.194.241.194 with SMTP id wk2mr12957750wjc.132.1417674423330; 
	Wed, 03 Dec 2014 22:27:03 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id t6sm27963730wjf.49.2014.12.03.22.27.01
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Dec 2014 22:27:02 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <547FBB91.5060005@windriver.com>
Date: Thu, 4 Dec 2014 07:27:00 +0100
Message-Id: <2A8EB0C7-A7BB-4EAD-97A9-3D935A2D2CC1@dominion.thruhere.net>
References: <1417610482-5790-1-git-send-email-koen@dominion.thruhere.net>
	<547FBB91.5060005@windriver.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
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
X-List-Received-Date: Thu, 04 Dec 2014 06:27:04 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


> Op 4 dec. 2014, om 02:40 heeft Hongxu Jia <hongxu.jia@windriver.com> =
het volgende geschreven:
>=20
> On 12/03/2014 08:41 PM, Koen Kooi wrote:
>> Fetch dvbcan tables using bitbake and reenable the config option.
>>=20
>> The license file was renamed and now lists the CLA requirement as =
well.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>>  ...end-specific-LD-CFLAGS-into-a-helper-vari.patch | 115 =
++++++++++++++-------
>>  .../recipes-dvb/tvheadend/tvheadend_git.bb         |  18 ++--
>>  2 files changed, 92 insertions(+), 41 deletions(-)
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
>>  From: Koen Kooi <koen@dominion.thruhere.net>
>>  Date: Fri, 21 Dec 2012 10:15:42 +0100
>>  Subject: [PATCH] Move tvheadend specific LD/CFLAGS into a helper =
variable to
>> @@ -8,64 +8,109 @@ Signed-off-by: Koen Kooi =
<koen@dominion.thruhere.net>
>>    Upstream-Status: Inappropriate [OE specific]
>>  ---
>> - Makefile              |   20 ++++++++++----------
>> - support/configure.inc |    8 ++++----
>> - 2 files changed, 14 insertions(+), 14 deletions(-)
>> + Makefile              | 44 =
++++++++++++++++++++++----------------------
>> + support/configure.inc |  8 ++++----
>> + 2 files changed, 26 insertions(+), 26 deletions(-)
>>    diff --git a/Makefile b/Makefile
>> -index 8c6b293..daf5f14 100644
>> +index 9931635..5e4aebf 100644
>>  --- a/Makefile
>>  +++ b/Makefile
>> -@@ -27,12 +27,12 @@ PROG =3D ${BUILDDIR}/tvheadend
>> +@@ -27,45 +27,45 @@ PROG    :=3D $(BUILDDIR)/tvheadend
>>   # Common compiler flags
>>   #
>>   +-CFLAGS  +=3D -g -O2 -Wunused-result
>>  -CFLAGS  +=3D -Wall -Werror -Wwrite-strings =
-Wno-deprecated-declarations
>> --CFLAGS  +=3D -Wmissing-prototypes -fms-extensions
>> --CFLAGS  +=3D -g -funsigned-char -O2
>> +-CFLAGS  +=3D -Wmissing-prototypes
>> +-CFLAGS  +=3D -fms-extensions -funsigned-char -fno-strict-aliasing
>>  -CFLAGS  +=3D -D_FILE_OFFSET_BITS=3D64
>> --CFLAGS  +=3D -I${BUILDDIR} -I${CURDIR}/src -I${CURDIR}
>> --LDFLAGS +=3D -lrt -ldl -lpthread -lm
>> +-CFLAGS  +=3D -I${BUILDDIR} -I${ROOTDIR}/src -I${ROOTDIR}
>> ++TVH_CFLAGS  +=3D -g -O2 -Wunused-result
>>  +TVH_CFLAGS  +=3D -Wall -Werror -Wwrite-strings =
-Wno-deprecated-declarations
>> -+TVH_CFLAGS  +=3D -Wmissing-prototypes -fms-extensions
>> -+TVH_CFLAGS  +=3D -g -funsigned-char -O2
>> ++TVH_CFLAGS  +=3D -Wmissing-prototypes
>> ++TVH_CFLAGS  +=3D -fms-extensions -funsigned-char =
-fno-strict-aliasing
>>  +TVH_CFLAGS  +=3D -D_FILE_OFFSET_BITS=3D64
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
>>   - #
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
>> +
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
>> +
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
>>   endif
>>   - # File bundles
>> -@@ -217,12 +217,12 @@ all: ${PROG}
>> + # libaesdec
>> +@@ -402,12 +402,12 @@ reconfigure:
>>      # Binary
>> - ${PROG}: $(OBJS) $(ALLDEPS)
>> + ${PROG}: check_config $(OBJS) $(ALLDEPS)
>>  -	$(CC) -o $@ $(OBJS) $(CFLAGS) $(LDFLAGS)
>> -+	$(CC) -o $@ $(OBJS) $(TVH_CFLAGS) $(TVH_LDFLAGS) $(CFLAGS) =
$(LDFLAGS)
>> ++	$(CC) -o $@ $(OBJS) $(TVH_CFLAGS) $(TVH_LDFLAGS) $(TVH_CFLAGS) =
$(TVH_LDFLAGS) $(TVH_CFLAGS) $(TVH_LDFLAGS) $(TVH_CFLAGS) $(TVH_LDFLAGS) =
$(CFLAGS) $(LDFLAGS)
>>      # Object
>>   ${BUILDDIR}/%.o: %.c
>>   	@mkdir -p $(dir $@)
>> --	$(CC) -MD -MP $(CFLAGS) -c -o $@ $(CURDIR)/$<
>> -+	$(CC) -MD -MP $(TVH_CFLAGS) $(CFLAGS) -c -o $@ $(CURDIR)/$<
>> +-	$(CC) -MD -MP $(CFLAGS) -c -o $@ $<
>> ++	$(CC) -MD -MP $(TVH_CFLAGS) $(TVH_CFLAGS) $(TVH_CFLAGS) =
$(TVH_CFLAGS) $(CFLAGS) -c -o $@ $<
>>      # Add-on
>>   ${BUILDDIR}/%.so: ${SRCS_EXTRA}
>>  diff --git a/support/configure.inc b/support/configure.inc
>> -index 0130880..332511e 100644
>> +index f7cfcd3..e3a2dd7 100755
>>  --- a/support/configure.inc
>>  +++ b/support/configure.inc
>> -@@ -464,8 +464,8 @@ ifeq (\$(origin CC),default)
>> +@@ -455,8 +455,8 @@ ifeq (\$(origin CC),default)
>>   CC        =3D ${CC}
>>   endif
>>   PYTHON   ?=3D ${PYTHON}
>> @@ -76,10 +121,10 @@ index 0130880..332511e 100644
>>   prefix    =3D ${prefix}
>>   bindir    =3D ${bindir}
>>   mandir    =3D ${mandir}
>> -@@ -482,8 +482,8 @@ EOF
>> +@@ -478,8 +478,8 @@ EOF
>>     # Add package config
>>     for pkg in ${PACKAGES[*]}; do
>> -     cat >>${CONFIG_MK} <<EOF
>> +     cat >>"${CONFIG_MK}" <<EOF
>>  -LDFLAGS +=3D $(pkg-config --libs $pkg)
>>  -CFLAGS  +=3D $(pkg-config --cflags $pkg)
>>  +TVH_LDFLAGS +=3D $(pkg-config --libs $pkg)
>> @@ -88,5 +133,5 @@ index 0130880..332511e 100644
>>     done
>>     --
>> -1.7.7.6
>> +1.9.0
>>  diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb =
b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
>> index 65d43c6..8539927 100644
>> --- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
>> +++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
>> @@ -1,26 +1,32 @@
>>  SUMMARY =3D "Tvheadend TV streaming server"
>>  HOMEPAGE =3D =
"https://www.lonelycoder.com/redmine/projects/tvheadend"
>>  -DEPENDS =3D "avahi zlib openssl python-native"
>> +DEPENDS =3D "avahi zlib openssl python-native libav"
>>    LICENSE =3D "GPLv3+"
>> -LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D9eef91148a9b14ec7f9df333daebc746"
>> +LIC_FILES_CHKSUM =3D =
"file://LICENSE.md;md5=3D9cae5acac2e9ee2fc3aec01ac88ce5db"
>>  -SRC_URI =3D "git://github.com/tvheadend/tvheadend.git \
>> +SRC_URI =3D "git://github.com/tvheadend/tvheadend.git;name=3Dtvh \
>> +           =
git://linuxtv.org/dtv-scan-tables.git;name=3Ddvb;destsuffix=3Dgit/data/dvb=
-scan \
>>             =
file://0001-Move-tvheadend-specific-LD-CFLAGS-into-a-helper-vari.patch \
>>  "
>> -SRCREV =3D "a420c83a0e0d2c31c2c15d0fec6fedc3f5a36dfe"
>> -PV =3D "3.3"
>> +SRCREV_tvh =3D "a95ef0b237a01e6fe6a29c0cd76f98a3a216c1ce"
>> +SRCREV_dvb =3D "82115b4a1f1039d5a2f93f2b7ddc4b2d2713b7ae"
>> +SRCREV_FORMAT =3D "tvh"
>> +
>> +PV =3D "3.9+git${SRCPV}"
>>    S =3D "${WORKDIR}/git"
>>    do_configure() {
>> +    # The fetcher ensures the mux list is up to date
>> +    sed -i -e 's:exit 1:exit 0:g' ${S}/support/getmuxlist
>> +
>=20
> Why not add a patch to do the modification?

Less churn when updating the recipe.


>=20
> //Hongxu
>=20
>>      ./configure --prefix=3D${prefix} \
>>                  --libdir=3D${libdir} \
>>                  --bindir=3D${bindir} \
>>                  --datadir=3D${datadir} \
>>                  --arch=3D${TARGET_ARCH} \
>> -                --disable-dvbscan \
>>                  --disable-bundle
>>  }


