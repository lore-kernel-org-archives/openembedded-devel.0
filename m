Received: from smtprelay-h11.telenor.se ([62.127.194.4])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NrdOV-0006wv-Vc
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 21:29:47 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h11.telenor.se (Postfix) with ESMTP id 1619444060
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Mar 2010 21:26:39 +0100 (CET)
X-SENDER-IP: [83.227.59.242]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AtQVAOqGn0tT4zvyPGdsb2JhbAAHgwSYAwEBAQE3qVyQToEsgmBqBIYZ
X-IronPort-AV: E=Sophos;i="4.49,652,1262559600"; d="scan'208";a="51309115"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.224]) ([83.227.59.242])
	by ipb2.telenor.se with ESMTP; 16 Mar 2010 21:26:24 +0100
Message-ID: <4B9FE96F.1030604@atmel.com>
Date: Tue, 16 Mar 2010 21:26:23 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B9EADFC.2060302@atmel.com> <1268691568.16974.48.camel@mattotaupa>
	<4B9F2055.4000805@atmel.com>
In-Reply-To: <4B9F2055.4000805@atmel.com>
X-SA-Exim-Connect-IP: 62.127.194.4
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gnome-mplayer fails to build due to no libstdc++.so.6 instaging (available in cross)
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
X-List-Received-Date: Tue, 16 Mar 2010 20:29:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ulf Samuelsson skrev:
> Paul Menzel skrev:
>> Am Montag, den 15.03.2010, 23:00 +0100 schrieb Ulf Samuelsson:
>>
>> [=E2=80=A6]
>>
>>> If I move the "libstdc++.so[.6[.0.10]]"  files to the staging directo=
ry
>>> the build will complete, and gnome-mplayer runs on the target.
>>>
>>> I tried doing
>>> DEPENDS =3D "libstdc++"
>>> in "libmusicbrainz.inc"
>>> but get a "no buildable provider" error.
>>>
>>> I tried
>>> RDEPENDS =3D "libstdc++"
>>> and then libmusicbrainz completes, but again gnome-mplayer exists wit=
h
>>> the error above.
>>>
>>> How ensure that staging gets populated with libstdc++ if libmusicbrai=
nz
>>> is used?
>> You cannot use package names in `DEPENDS`. You have to use the name of
>> the recipe or the recipes has to have `PROVIDES` set. I ask the same o=
n
>> IRC today.
>>
>> So you have to find the name of the recipe creating `libstdc++`.
>>
>>
>> Thanks,
>>
>> Paul
>>
>=20
> If I grep for libstdc++ in recipes, then it looks like the provider
> is "meta/external-toolchain.bb"
>=20
> I don't want to add the complete cross-compiler.
>=20
> Will try adding "libstd++" to the image I am building.
> The line "images/fso-image-nox.bb:  libstdc++ \" below
> and some googling gives me hope!



Adding
IMAGE_INSTALL +=3D " libstdc++ "
to a very basic image gives me
libstdc++.so.6 and libstdc++.so.6.0.10 in /usr/lib

If I add
IMAGE_INSTALL +=3D " libstdc++ "
to my main image and the build gnome-mplayer
then gnome-mplayer fails during compile.

This little recipe will do what I want, but is there a better way?


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++

PR =3D "r1"
LIBSTDCPLUSPLUS_TARGET =3D ${STAGING_DIR_TARGET}/lib

do_install () {
	if ! [ -e ${LIBSTDCPLUSPLUS_TARGET}/libstdc++.so ] ; then
		cp ${CROSS_DIR}/${TARGET_SYS}/lib/libstdc++.so.6.*
${LIBSTDCPLUSPLUS_TARGET}
		cd ${LIBSTDCPLUSPLUS_TARGET}
		file=3D`ls libstdc++.so.6.*`
		ln	-s $file	libstdc++.so.6
		ln	-s $file	libstdc++.so=09
	fi
}

-------------------------------------------------------------------------=
---

>=20
>=20
>=20
>=20
> gcc/gcc-configure-canadian-sdk.inc:	(cd ${S}/libstdc++-v3 && autoreconf=
)
> gcc/gcc-configure-common.inc:                --enable-libstdcxx-pch \
> gcc/gcc-cross_csl-arm-2008q3.bb:	sed -i -e
> 's:gcc_no_link=3Dyes:gcc_no_link=3Dno:' ${S}/libstdc++-v3/configure
> gcc/gcc-cross_csl-arm-2008q1.bb:	sed -i -e
> 's:gcc_no_link=3Dyes:gcc_no_link=3Dno:' ${S}/libstdc++-v3/configure
> gcc/gcc-4.1.2.inc:       ln -sf ${S}/libstdc++-v3/config/os/uclibc/
> ${S}/libstdc++-v3/config/os/uclibc-linux
> gcc/gcc-configure-cross.inc:		sed -i
> "s|dependency_libs\s*=3D\s*.*|dependency_libs=3D'-L${CROSS_DIR}/${TARGE=
T_SYS}/$d
> ${LIBGCCS_VAR} -lc
>  -lm '|" ${CROSS_DIR}/${TARGET_SYS}/$d/libstdc++.la || true
> gcc/mingw-gcc-build.inc:	sed -i -e "s|installed=3Dyes|installed=3Dno|" =
-e
> "s|dependency_libs\s*=3D\s*.*|dependency_libs=3D'-L${STAGING_DIR_HOST
> }${layout_libdir} ${LIBGCCS_VAR} -lc -lm '|"
> ${STAGING_DIR_HOST}${layout_libdir}/libstdc++.la || true
> gcc/gcc-cross_csl-arm-2007q3.bb:	sed -i -e
> 's:gcc_no_link=3Dyes:gcc_no_link=3Dno:' ${S}/libstdc++-v3/configure
> gcc/gcc-package-sdk.inc:		${TARGET_PREFIX}strip
> ${D}${prefix}/${TARGET_SYS}/lib/libstdc++.so.*
> gcc/gcc-package-cross.inc:PACKAGES =3D "libgcc libssp libstdc++ libg2c
> libgfortran"
> gcc/gcc-package-cross.inc:FILES_libstdc++ =3D
> "${target_libdir}/libstdc++.so.*"
> gcc/gcc-package-cross.inc:	# Move libstdc++ and libg2c into libdir
> (resetting our prefix to /usr
> gcc/gcc-package-cross.inc:        if [ -f
> ${D}${prefix}/*/lib/nof/libstdc++.so ]; then
> gcc/gcc-package-cross.inc:           mv -f
> ${D}${prefix}/*/lib/nof/libstdc++.so* ${D}${target_libdir} || true
> gcc/gcc-package-cross.inc:           mv -f
> ${D}${prefix}/*/${target_base_libdir}/libstdc++.so* ${D}${target_libdir=
}
> || true
> gcc/gcc-package-cross.inc:               ${TARGET_PREFIX}strip
> ${D}${target_libdir}/libstdc++.so.* || true
> gcc/gcc-package-target.inc:  libstdc++-dev \
> gcc/gcc-package-target.inc:FILES_libstdc++ =3D "${libdir}/libstdc++.so.=
*"
> gcc/gcc-package-target.inc:FILES_libstdc++-dev =3D "\
> gcc/gcc-package-target.inc:  ${libdir}/libstdc++.so \
> gcc/gcc-package-target.inc:  ${libdir}/libstdc++.la \
> gcc/gcc-package-target.inc:  ${libdir}/libstdc++.a \
> images/fso-image-nox.bb:  libstdc++ \
> mamona/gcc-noemu_4.1.2.bb:       ln -sf
> ${S}/libstdc++-v3/config/os/uclibc/ ${S}/libstdc++-v3/config/os/uclibc-=
linux
> meta/slugos-native.bb:	libstdc++-dev \
> meta/external-toolchain-generic.bb:RPROVIDES =3D "glibc glibc-utils
> libsegfault glibc-thread-db libgcc-dev libgcc libstdc++-dev libstdc++ l=
dd"
> meta/external-toolchain-csl.bb:INSANE_SKIP_libstdc++ =3D True
> meta/external-toolchain-csl.bb:	libstdc++ \
> meta/external-toolchain-csl.bb:	libstdc++-dev \
> meta/external-toolchain-csl.bb:FILES_libstdc++ =3D "${libdir}/libstdc++=
.so.*"
> meta/external-toolchain-csl.bb:FILES_libstdc++-dev =3D "\
> meta/external-toolchain-csl.bb:	${libdir}/libstdc++.so \
> meta/external-toolchain-csl.bb:	${libdir}/libstdc++.la \
> meta/external-toolchain-csl.bb:	${libdir}/libstdc++.a \
> meta/external-toolchain-csl.bb:PKGV_libstdc++ =3D ${CSL_VER_GCC}
> meta/external-toolchain-csl.bb:PKGV_libstdc++-dev =3D ${CSL_VER_GCC}
> meta/external-toolchain.bb:RPROVIDES =3D "glibc-utils libsegfault
> glibc-thread-db libgcc-dev libgcc libstdc++-dev libstdc++"
> sharprom-toolchain/sharprom-toolchain-native_1.0.bb:RPROVIDES =3D
> "glibc-utils libsegfault glibc-thread-db libgcc-dev libstdc++-dev libst=
dc++"
> tasks/task-sdk-bare.bb:    libstdc++ \
> tasks/task-sdk-bare.bb:    libstdc++-dev \
> tasks/task-openmoko-native-sdk.bb:  libstdc++-dev \
> tasks/task-fso-toolchain-target.bb:    libstdc++ \
> tasks/mamona-sdk.inc:  libstdc++-dev \
> tasks/task-openmoko-toolchain-target.bb:    libstdc++ \
> tasks/task-mamona-base.bb:  libstdc++ \
>=20
>=20
>> ----------------------------------------------------------------------=
--
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20


--=20
Best Regards
Ulf Samuelsson



