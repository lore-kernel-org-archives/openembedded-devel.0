Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8BBF8750F7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 17:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id DEF6C184D0;
	Fri, 18 May 2018 19:20:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id f5nODinZwspc; Fri, 18 May 2018 19:20:50 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 4393A18070;
	Fri, 18 May 2018 19:20:50 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DC911A069;
	Fri, 18 May 2018 19:20:50 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1DDA31A05F;
	Fri, 18 May 2018 19:20:50 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri, 18 May 2018 19:20:50 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 119A1177A;
	Fri, 18 May 2018 19:20:50 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 18 May 2018 19:20:49 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Fri, 18 May 2018 19:20:49 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Leitner <richard.leitner@skidata.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH v2] stm32flash: add recipe
Thread-Index: AQHT7nzqmEi0J0GjzkCxxTsCll6iOaQ1uV1Q
Date: Fri, 18 May 2018 17:20:49 +0000
Message-ID: <50ba6ce942eb43fd86ae092df8e891ad@XBOX02.axis.com>
References: <20180518075009.4612-1-richard.leitner@skidata.com>
In-Reply-To: <20180518075009.4612-1-richard.leitner@skidata.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [meta-oe][PATCH v2] stm32flash: add recipe
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
X-List-Received-Date: Fri, 18 May 2018 17:20:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

We have had our own recipe for stm32flash for a few years, so I=20
have a couple of comments to improve this recipe.

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Richard Leitner
> Sent: den 18 maj 2018 09:50
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH v2] stm32flash: add recipe
>=20
> Add recipe for version 0.5 of stm32flash, an open source flash program fo=
r
> STM32 using the ST serial bootloader.
>=20
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>  meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb | 16 ++++++++++++++=
++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
>=20
> diff --git a/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb b/meta-=
oe/recipes-support/stm32flash/stm32flash_0.5.bb
> new file mode 100644
> index 000000000..7f1a7823a
> --- /dev/null
> +++ b/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "Open source flash program for STM32 using the ST serial boo=
tloader"
> +HOMEPAGE =3D "https://sourceforge.net/projects/stm32flash/"
> +BUGTRACKER =3D "https://sourceforge.net/p/stm32flash/tickets/"
> +LICENSE =3D "GPLv2"

The license is GPLv2 or later, so change this to:

LICENSE =3D "GPL-2.0+"

> +LIC_FILES_CHKSUM =3D "file://gpl-2.0.txt;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263"
> +
> +inherit autotools-brokensep

Remove the inherit of autotools-brokensep. This is not an=20
autotools-based package.

> +
> +EXTRA_OEMAKE =3D "PREFIX=3D${prefix}"

Remove this as well (see below).

> +
> +S =3D "${WORKDIR}/${PN}"
> +
> +SRC_URI =3D "https://prdownloads.sourceforge.net/stm32flash/stm32flash-$=
{PV}.tar.gz"

Replace with:

SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"

> +
> +SRC_URI[md5sum] =3D "40f673502949f3bb655d2bcc539d7b6a"
> +SRC_URI[sha256sum] =3D "97aa9422ef02e82f7da9039329e21a437decf972cb3919ad=
817f70ac9a49e306"

Add:

do_install() {
	oe_runmake install DESTDIR=3D${D} PREFIX=3D${prefix}
}

//Peter


