Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id DD8A16FF78
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 09:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C80501843F;
	Wed, 22 Mar 2017 10:01:45 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id uh6QHcnLknF3; Wed, 22 Mar 2017 10:01:41 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id C474B1813C;
	Wed, 22 Mar 2017 10:01:41 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B2ECC1A088;
	Wed, 22 Mar 2017 10:01:41 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A7BA91A080;
	Wed, 22 Mar 2017 10:01:41 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed, 22 Mar 2017 10:01:41 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 9BDE91A33;
	Wed, 22 Mar 2017 10:01:41 +0100 (CET)
Received: from xbox12.axis.com (10.0.5.26) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 22 Mar 2017 10:01:41 +0100
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 22 Mar 2017 10:01:41 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Wed, 22 Mar 2017 10:01:41 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Patrick Ohly <patrick.ohly@intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH v2 2/2] lvm2: fix lvm2-native RRECOMMENDS problem
Thread-Index: AQHSoYzIOyzb57IceESv7IEpYqXIQKGgkopQ
Date: Wed, 22 Mar 2017 09:01:41 +0000
Message-ID: <18636f3462df48a295ead7fe4338760a@XBOX02.axis.com>
References: <8a2dc0af5e5c51e71d154de8180e0b74388a9fa9.1490022750.git-series.patrick.ohly@intel.com>
	<b3ced5c0c8686f3cb40080e07c5d885c31523d48.1490022750.git-series.patrick.ohly@intel.com>
In-Reply-To: <b3ced5c0c8686f3cb40080e07c5d885c31523d48.1490022750.git-series.patrick.ohly@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [meta-oe][PATCH v2 2/2] lvm2: fix lvm2-native RRECOMMENDS problem
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
X-List-Received-Date: Wed, 22 Mar 2017 09:01:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Patrick Ohly [mailto:patrick.ohly@intel.com]
> Sent: den 20 mars 2017 16:14
> To: openembedded-devel@lists.openembedded.org
> Cc: Peter Kjellerstedt; Patrick Ohly
> Subject: [meta-oe][PATCH v2 2/2] lvm2: fix lvm2-native RRECOMMENDS
> problem
>=20
> lvm2-native doesn't have packages, so the RRECOMMENDS must be limited
> to the target case. This fixes:
>=20
> ERROR: Nothing RPROVIDES 'lvm2-native-scripts-native' (but virtual:native=
:.../meta-openembedded/meta-oe/recipes-support/lvm2/lvm2_2.02.166.bb RDEPEN=
DS on or otherwise requires it)
>=20
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-supp=
ort/lvm2/lvm2.inc
> index cfa74d4..d0be296 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -103,6 +103,6 @@ FILES_libdevmapper-dev =3D " \
>  RDEPENDS_${PN}-scripts =3D "${PN} (=3D ${EXTENDPKGV}) bash"
>  RDEPENDS_${PN} =3D " bash"
>  RDEPENDS_libdevmapper-dev =3D "libdevmapper (=3D ${EXTENDPKGV})"
> -RRECOMMENDS_${PN} =3D "${PN}-scripts (=3D ${EXTENDPKGV})"
> +RRECOMMENDS_${PN}_class-target =3D "${PN}-scripts (=3D ${EXTENDPKGV})"
>=20
>  CONFFILES_${PN} +=3D "${sysconfdir}/lvm/lvm.conf"
> --
> git-series 0.9.1

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

//Peter


