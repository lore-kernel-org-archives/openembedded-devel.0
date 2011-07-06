Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalr@ti.com>) id 1QeOxU-00072X-9m
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 12:03:53 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p669sKIh007265
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 6 Jul 2011 04:54:20 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id p669sK2v002493;
	Wed, 6 Jul 2011 04:54:20 -0500 (CDT)
Received: from DNCE73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p669s4QM024210;
	Wed, 6 Jul 2011 04:54:20 -0500 (CDT)
Received: from dnce02.ent.ti.com ([137.167.131.106]) by DNCE73.ent.ti.com
	([137.167.130.158]) with mapi; Wed, 6 Jul 2011 11:54:17 +0200
From: "Reizer, Eyal" <eyalr@ti.com>
To: Eyal Reizer <eyalreizer@googlemail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Jul 2011 11:54:16 +0200
Thread-Topic: Ping:RE: [PATCH] ti-wifi-utils: fix unaligned data access
Thread-Index: Acw6SepiAGaVrmNLQM6N13+NOYsQwwBeKdig
Message-ID: <EC51CDB0807A51469E0C9CB8CF72D65F0332A752B7@dnce02.ent.ti.com>
References: <1309784224-8174-1-git-send-email-eyalr@ti.com>
In-Reply-To: <1309784224-8174-1-git-send-email-eyalr@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Ping:RE: [PATCH] ti-wifi-utils: fix unaligned data access
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
X-List-Received-Date: Wed, 06 Jul 2011 10:03:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pinging on this patch.

Best Regards,
Eyal Reizer

> -----Original Message-----
> From: Eyal Reizer [mailto:eyalreizer@googlemail.com]
> Sent: Monday, July 04, 2011 3:57 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Reizer, Eyal
> Subject: [PATCH] ti-wifi-utils: fix unaligned data access
>=20
> update the recipe to use a new commit from upstream which fixes
> unaligned
> data access errors reported when using the calibrator tool on an am180x
> (armv5) platform
>=20
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
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



