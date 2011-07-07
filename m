Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1QenJ0-0001H5-Ie
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 14:03:42 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id p67BxoF0027578
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 7 Jul 2011 06:59:50 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id p67BxouV026644
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 7 Jul 2011 06:59:50 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p67BxoDZ015261
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 7 Jul 2011 06:59:50 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Thu, 7 Jul 2011 06:59:49 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Jul 2011 06:59:47 -0500
Thread-Topic: [oe] [PATCH] ti-wifi-utils: fix unaligned data access
Thread-Index: Acw6Sf/26xWdB/+XToOAqQnsUimNhACU1UMw
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F08034B5C5050@dlee06.ent.ti.com>
References: <1309784224-8174-1-git-send-email-eyalr@ti.com>
In-Reply-To: <1309784224-8174-1-git-send-email-eyalr@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH] ti-wifi-utils: fix unaligned data access
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
X-List-Received-Date: Thu, 07 Jul 2011 12:03:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Eyal Reizer
> Sent: Monday, July 04, 2011 7:57 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [PATCH] ti-wifi-utils: fix unaligned data access
>=20
> update the recipe to use a new commit from upstream which fixes
> unaligned
> data access errors reported when using the calibrator tool on an am180x
> (armv5) platform
>=20
> Signed-off-by: Eyal Reizer <eyalr@ti.com>

Acked-by: Chase Maupin <chase.maupin@ti.com>

> ---
>  recipes/ti/ti-wifi-utils_git.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/ti/ti-wifi-utils_git.bb b/recipes/ti/ti-wifi-
> utils_git.bb
> index 9855775..87ca2c9 100644
> --- a/recipes/ti/ti-wifi-utils_git.bb
> +++ b/recipes/ti/ti-wifi-utils_git.bb
> @@ -3,11 +3,11 @@ LICENSE =3D "TI-BSD"
>=20
>  DEPENDS =3D "libnl"
>=20
> -PR =3D"r3"
> +PR =3D"r4"
>  PV =3D"0.0"
>  PR_append =3D "+gitr${SRCPV}"
>=20
> -SRCREV =3D "268dbf03091b632c2697eb8028e90fe40513a9d8"
> +SRCREV =3D "8737db9372e714e265d3f575573d14c3379ab9fc"
>  SRC_URI =3D "git://github.com/gxk/ti-utils.git;protocol=3Dgit"
>=20
>  S =3D "${WORKDIR}/git"
> --
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


