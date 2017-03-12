Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2325C775FD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Mar 2017 18:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 97D8418306;
	Sun, 12 Mar 2017 19:55:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id ia6D36+4aefE; Sun, 12 Mar 2017 19:55:16 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 8BCA9180F8;
	Sun, 12 Mar 2017 19:55:16 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 795241E066;
	Sun, 12 Mar 2017 19:55:16 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E2791E064;
	Sun, 12 Mar 2017 19:55:16 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Sun, 12 Mar 2017 19:55:16 +0100 (CET)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 6059E5E2;
	Sun, 12 Mar 2017 19:55:16 +0100 (CET)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Sun, 12 Mar 2017 19:55:16 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Sun, 12 Mar 2017 19:55:16 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] lvm2: fix bash depends QA issue
Thread-Index: AQHSmqpE5i9lh9dd/k2bV9C/kPKmpKGRh/9g
Date: Sun, 12 Mar 2017 18:55:16 +0000
Message-ID: <f3f3449281604f82bade46ab4f0b0802@XBOX02.axis.com>
References: <1489265910-8255-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1489265910-8255-1-git-send-email-akuster808@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [meta-oe][PATCH] lvm2: fix bash depends QA issue
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
X-List-Received-Date: Sun, 12 Mar 2017 18:55:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Armin Kuster
> Sent: den 11 mars 2017 21:59
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH] lvm2: fix bash depends QA issue
>=20
> WARNING: lvm2-2.02.166-r0 do_package_qa: QA Issue: /etc/init.d/lvm2-
> monitor contained in package lvm2 requires /bin/bash, but no providers
> found in RDEPENDS_lvm2? [file-rdeps]
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-support/lvm2/lvm2.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-
> support/lvm2/lvm2.inc
> index b25d775..3e79552 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -98,6 +98,7 @@ FILES_libdevmapper-dev =3D " \
>  "
>=20
>  RDEPENDS_${PN}-scripts =3D "${PN} (=3D ${EXTENDPKGV}) bash"
> +RDEPENDS_${PN} =3D " bash"

That defeats the whole purpose of moving the bash scripts to ${PN}-scripts.
The reason I have not seen this is because that script is only installed if=
=20
the dmeventd PACKAGECONFIG is enabled (which we do not have). So at least=20
make this conditional on that PACKAGECONFIG. Even better would be to patch=
=20
scripts/lvm2_monitoring_init_red_hat.in (that lvm2-monitor is installed=20
from) to not be a bash script. The only bashism that I can find in the=20
script is the use of $"..." when printing the usage instruction (line 131).=
=20
However, since no other messages in that script are localized, I do not see=
=20
a point in localizing that one, and the $"..." can be changed to "..."

>  RDEPENDS_libdevmapper-dev =3D "libdevmapper (=3D ${EXTENDPKGV})"
>  RRECOMMENDS_${PN} =3D "${PN}-scripts (=3D ${EXTENDPKGV})"
>=20
> --
> 2.7.4

//Peter


