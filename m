Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC1CC78EFF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 21:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 53E2F18511;
	Wed, 17 Oct 2018 23:20:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id AWrwyRfz4jZV; Wed, 17 Oct 2018 23:20:06 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 0B50618507;
	Wed, 17 Oct 2018 23:20:06 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D696A1A084;
	Wed, 17 Oct 2018 23:20:05 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB5D31A082;
	Wed, 17 Oct 2018 23:20:05 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed, 17 Oct 2018 23:20:05 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id BF44D1CD;
	Wed, 17 Oct 2018 23:20:05 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 17 Oct 2018 23:20:05 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1365.000;
	Wed, 17 Oct 2018 23:20:05 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "yann.dirson@blade-group.com" <yann.dirson@blade-group.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH v3] packagegroup-tools-bluetooth: work as advertized
	on	distro without bluez* support
Thread-Index: AQHUZlwHC12oDmLB3UiTRsnwTnbkr6Uj7dow
Date: Wed, 17 Oct 2018 21:20:05 +0000
Message-ID: <58e27c81a75d4ffdb436ec577bbb7f9b@XBOX02.axis.com>
References: <20181017205647.25447-1-yann@blade-group.com>
In-Reply-To: <20181017205647.25447-1-yann@blade-group.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Yann Dirson <yann@blade-group.com>
Subject: Re: [PATCH v3] packagegroup-tools-bluetooth: work as advertized on	distro without bluez* support
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
X-List-Received-Date: Wed, 17 Oct 2018 21:20:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-dev=
el-bounces@lists.openembedded.org> On Behalf Of yann.dirson@blade-group.com
> Sent: den 17 oktober 2018 22:57
> To: openembedded-devel@lists.openembedded.org
> Cc: Yann Dirson <yann@blade-group.com>
> Subject: [oe] [PATCH v3] packagegroup-tools-bluetooth: work as advertized=
 on distro without bluez* support
>=20
> From: Yann Dirson <yann@blade-group.com>
>=20
> Otherwise the build fails with:
>=20
>   NOTE: Runtime target '${RDEPENDS_}' is unbuildable, removing...
>   Missing or unbuildable dependency chain was: ['${RDEPENDS_}']
>=20
> This restores some truth in the "Otherwise install nothing" comment in
> the recipe.
>=20
> Signed-off-by: Yann Dirson <yann@blade-group.com>
> ---
>  .../packagegroups/packagegroup-tools-bluetooth.bb            | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tool=
s-bluetooth.bb b/meta-oe/recipes-connectivity/packagegroups/packagegroup-to=
ols-bluetooth.bb
> index 0ede5e57b..207c7c1ae 100644
> --- a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluet=
ooth.bb
> +++ b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluet=
ooth.bb
> @@ -34,4 +34,7 @@ RDEPENDS_bluez5 =3D " \
>=20
>  # Install bluez4 tools or bluez5 tools depending on what is specified in=
 the distro.
>  # Otherwise install nothing.
> -RDEPENDS_${PN} =3D "${RDEPENDS_${BLUEZ}}"
> +RDEPENDS_${PN} =3D " \
> +    ${@'${RDEPENDS_bluez5}' if d.getVar('BLUEZ', True) =3D=3D 'bluez5' e=
lse ''} \
> +    ${@'${RDEPENDS_bluez4}' if d.getVar('BLUEZ', True) =3D=3D 'bluez4' e=
lse ''} \
> +"

You can simplify this (and support any value of ${BLUEZ} just in=20
case someone decides to add bluez6):

RDEPENDS_${PN} =3D "${@'${RDEPENDS_${BLUEZ}}' if d.getVar('BLUEZ') else ''}=
"

Also, the second argument to d.getVar() has defaulted to True for=20
a long time, so no point in specifying it.

> --
> 2.19.1

//Peter


