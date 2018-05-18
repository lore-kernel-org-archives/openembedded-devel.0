Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A521D7501E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 20:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 8D2FE184E7;
	Fri, 18 May 2018 22:43:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 1YvI3PQvmUxt; Fri, 18 May 2018 22:43:38 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 9F4BE184CD;
	Fri, 18 May 2018 22:43:38 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D0901E080;
	Fri, 18 May 2018 22:43:38 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 710B91E07E;
	Fri, 18 May 2018 22:43:38 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri, 18 May 2018 22:43:38 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 6453917A8;
	Fri, 18 May 2018 22:43:38 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 18 May 2018 22:43:38 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 18 May 2018 22:43:38 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Fri, 18 May 2018 22:43:38 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] stm32flash: Fix packaging errors
Thread-Index: AQHT7uO3BitDHsYf/0yNs4By40l5e6Q18skQ
Date: Fri, 18 May 2018 20:43:38 +0000
Message-ID: <de72c540487e4c0298a8fcad894a00d4@XBOX02.axis.com>
References: <20180518200554.30205-1-raj.khem@gmail.com>
	<20180518200554.30205-2-raj.khem@gmail.com>
In-Reply-To: <20180518200554.30205-2-raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [meta-oe][PATCH] stm32flash: Fix packaging errors
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
X-List-Received-Date: Fri, 18 May 2018 20:43:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: den 18 maj 2018 22:06
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH] stm32flash: Fix packaging errors
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb b/meta-=
oe/recipes-support/stm32flash/stm32flash_0.5.bb
> index d401981ff9..59bd1b60e1 100644
> --- a/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
> +++ b/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
> @@ -1,16 +1,16 @@
>  SUMMARY =3D "Open source flash program for STM32 using the ST serial boo=
tloader"
>  HOMEPAGE =3D "https://sourceforge.net/projects/stm32flash/"
>  BUGTRACKER =3D "https://sourceforge.net/p/stm32flash/tickets/"
> -LICENSE =3D "GPLv2"
> +LICENSE =3D "GPL-2.0+"
>  LIC_FILES_CHKSUM =3D "file://gpl-2.0.txt;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263"
>=20
> -inherit autotools-brokensep
> -
>  S =3D "${WORKDIR}/${PN}"

I missed it in my comments, but Anuj had already pointed it out,=20
That ${PN} above should be changed to ${BPN}.

> -SRC_URI =3D "https://prdownloads.sourceforge.net/stm32flash/stm32flash-$=
{PV}.tar.gz"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
> +
> +do_install() {
> +	oe_runmake install DESTDIR=3D${D} PREFIX=3D${prefix}
> +}
>=20
>  SRC_URI[md5sum] =3D "40f673502949f3bb655d2bcc539d7b6a"
>  SRC_URI[sha256sum] =3D "97aa9422ef02e82f7da9039329e21a437decf972cb3919ad=
817f70ac9a49e306"
> -
> -FILES_${PN} =3D "/usr/local/bin/stm32flash"
> --
> 2.17.0

//Peter


