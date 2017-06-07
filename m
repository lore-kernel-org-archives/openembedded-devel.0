Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6D0FA6FF73
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jun 2017 21:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 0F900184D0;
	Wed,  7 Jun 2017 23:48:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Dl7dI7AlE2dn; Wed,  7 Jun 2017 23:48:48 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id E6F74183B0;
	Wed,  7 Jun 2017 23:48:48 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C49501A0DF;
	Wed,  7 Jun 2017 23:48:48 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B99E21A0DE;
	Wed,  7 Jun 2017 23:48:48 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed,  7 Jun 2017 23:48:48 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id ADF7C2B11;
	Wed,  7 Jun 2017 23:48:48 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 7 Jun 2017 23:48:48 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Wed, 7 Jun 2017 23:48:48 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Adam C. Foltzer" <acfoltzer@galois.com>
Thread-Topic: [oe] [meta-oe][PATCH 3/3] meson: add LDFLAGS to bbclass C/C++
	link	arguments
Thread-Index: AQHS3iCXEHdSLNekCkaK9frCcWaiLaIZ8qeg
Date: Wed, 7 Jun 2017 21:48:48 +0000
Message-ID: <a96952a133614ffc9779d8a7ce912f8e@XBOX02.axis.com>
References: <20170605172321.12557-1-acfoltzer@galois.com>
	<20170605172321.12557-3-acfoltzer@galois.com>
In-Reply-To: <20170605172321.12557-3-acfoltzer@galois.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/3] meson: add LDFLAGS to bbclass C/C++ link	arguments
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Jun 2017 21:48:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Adam C. Foltzer
> Sent: den 5 juni 2017 19:23
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH 3/3] meson: add LDFLAGS to bbclass C/C++
> link arguments
>=20
> This adds compiler flags for C++ projects, and fixes the linker
> arguments for both C and C++ to avoid the GNU_HASH qa failure
>=20
> Signed-off-by: Adam C. Foltzer <acfoltzer@galois.com>
> ---
>  meta-oe/classes/meson.bbclass | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/classes/meson.bbclass b/meta-
> oe/classes/meson.bbclass
> index d2ae626..11c8d34 100644
> --- a/meta-oe/classes/meson.bbclass
> +++ b/meta-oe/classes/meson.bbclass
> @@ -32,7 +32,8 @@ MESONOPTS =3D " --prefix ${prefix} \
>                --localstatedir ${localstatedir} \
>                --sharedstatedir ${sharedstatedir}"
>=20
> -MESON_C_ARGS =3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
> +MESON_C_ARGS =3D "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS}"
> +MESON_LINK_ARGS =3D "${TOOLCHAIN_OPTIONS} ${LDFLAGS}"

According to a colleague of mine, the ${TARGET_CC_ARCH} options need=20
to be passed to the linker as well or binaries end up with the wrong=20
ld.so for armhf.

Also, why do you need to add ${LDFLAGS} here?

>  MESON_HOST_ENDIAN =3D "${@bb.utils.contains('SITEINFO_ENDIANNESS', 'be',
> 'big', 'little', d)}"
>  MESON_TARGET_ENDIAN =3D "${@bb.utils.contains('TUNE_FEATURES',
> 'bigendian', 'big', 'little', d)}"
> @@ -61,9 +62,9 @@ pkgconfig =3D 'pkg-config'
>=20
>  [properties]
>  c_args =3D [${@meson_array('MESON_C_ARGS', d)}]
> -cpp_args =3D [${@meson_array('TOOLCHAIN_OPTIONS', d)}]
> -c_link_args =3D [${@meson_array('TOOLCHAIN_OPTIONS', d)}]
> -cpp_link_args =3D [${@meson_array('TOOLCHAIN_OPTIONS', d)}]
> +c_link_args =3D [${@meson_array('MESON_LINK_ARGS', d)}]
> +cpp_args =3D [${@meson_array('MESON_C_ARGS', d)}]
> +cpp_link_args =3D [${@meson_array('MESON_LINK_ARGS', d)}]
>=20
>  [host_machine]
>  system =3D '${BUILD_OS}'
> --
> 2.9.4

//Peter


