Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 2889C71A50
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 May 2017 11:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id D26952E213;
	Wed,  3 May 2017 13:26:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id ZcsZacugQl7a; Wed,  3 May 2017 13:26:01 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 639E02E20C;
	Wed,  3 May 2017 13:26:01 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 284741A063;
	Wed,  3 May 2017 13:26:01 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D5B71A062;
	Wed,  3 May 2017 13:26:01 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed,  3 May 2017 13:26:01 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id 111B526D1;
	Wed,  3 May 2017 13:26:01 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 3 May 2017 13:26:00 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 3 May 2017 13:26:00 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Wed, 3 May 2017 13:26:00 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ismo Puustinen <ismo.puustinen@intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] libdevmapper: enable native support.
Thread-Index: AQHSw/xzkD0v6kQnFUylT9Vu6vGWoaHidf2g
Date: Wed, 3 May 2017 11:26:00 +0000
Message-ID: <4763ed6bb356444fafd6a0c60df2f7c7@XBOX02.axis.com>
References: <20170503105945.28388-1-ismo.puustinen@intel.com>
In-Reply-To: <20170503105945.28388-1-ismo.puustinen@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] libdevmapper: enable native support.
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
X-List-Received-Date: Wed, 03 May 2017 11:26:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Ismo Puustinen
> Sent: den 3 maj 2017 13:00
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [PATCH] libdevmapper: enable native support.
>=20
> Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
> ---
>  meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
> b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
> index 462e8fb..37c0a97 100644
> --- a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
> +++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.166.bb
> @@ -28,4 +28,6 @@ do_install_append() {
>      rm -rf ${D}${datadir}
>  }
>=20
> -RRECOMMENDS_${PN} +=3D "lvm2-udevrules"
> +RRECOMMENDS_${PN}_class-target +=3D "lvm2-udevrules"

That should be either:

RRECOMMENDS_${PN}_append_class-target =3D " lvm2-udevrules"

or:

RRECOMMENDS_${PN}_class-target =3D "lvm2-udevrules"

Using FOO_class-target +=3D "..." gives the impression that it adds to=20
FOO, but it does not, it adds to FOO_class-target which then completely=20
replaces FOO for target builds. E.g., with the following two definitions:

FOO =3D "foo"
FOO_class-target +=3D "bar"

then ${FOO} will be "bar" for target builds and "foo" for all other=20
builds. It will never be "foo bar".

> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.9.3

//Peter


