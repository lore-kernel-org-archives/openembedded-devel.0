Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1PaCjx-0007vb-Fa
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Jan 2011 20:40:17 +0100
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id p04JdrdC016255
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Jan 2011 13:39:53 -0600
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id p04JdrJj020668
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Jan 2011 13:39:53 -0600 (CST)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p04JdrwA001966
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Jan 2011 13:39:53 -0600 (CST)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Tue, 4 Jan 2011 13:39:53 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 4 Jan 2011 13:39:50 -0600
Thread-Topic: [oe] [PATCH 1/1] am-benchmarks: add platform support and
	correct	makefile
Thread-Index: AcusQiq5WJUAXCOlReyprFtWKvOrewABMB+w
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080329E939EA@dlee06.ent.ti.com>
References: <1294167392-20610-1-git-send-email-j-lance1@ti.com>
In-Reply-To: <1294167392-20610-1-git-send-email-j-lance1@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "Lance, Jeff" <j-lance1@ti.com>
Subject: Re: [PATCH 1/1] am-benchmarks: add platform support and correct	makefile
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
X-List-Received-Date: Tue, 04 Jan 2011 19:40:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Jeff Lance
> Sent: Tuesday, January 04, 2011 12:57 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Lance, Jeff
> Subject: [oe] [PATCH 1/1] am-benchmarks: add platform support and correct
> makefile
>=20
>   * Modify recipe name to include package version
>   * add support for additional platforms am181x-evm and am180x-evm
>   * Update the SRCREV
>     * Fix pathname to Rules.make in each Makefile
>=20
> Signed-off-by: Jeff Lance <j-lance1@ti.com>
> ---
>  .../{am-benchmarks_svn.bb =3D> am-benchmarks_1.2.bb} |    8 +++++---
>  1 files changed, 5 insertions(+), 3 deletions(-)
>  copy recipes/ti/{am-benchmarks_svn.bb =3D> am-benchmarks_1.2.bb} (87%)
>=20
> diff --git a/recipes/ti/am-benchmarks_svn.bb b/recipes/ti/am-
> benchmarks_1.2.bb
> similarity index 87%
> copy from recipes/ti/am-benchmarks_svn.bb
> copy to recipes/ti/am-benchmarks_1.2.bb
> index 63c122f..dbe2db7 100644
> --- a/recipes/ti/am-benchmarks_svn.bb
> +++ b/recipes/ti/am-benchmarks_1.2.bb
> @@ -8,9 +8,9 @@ LICENSE =3D "BSD"
>  SECTION =3D "system"
>  PRIORITY =3D "optional"
>=20
> -SRCREV =3D "56"
> -PV =3D "1.1"
> -PR =3D "r1+svnr${SRCPV}"
> +SRCREV =3D "58"
> +PV =3D "1.2"

No need to set PV to 1.2 since you have changed the recipe name to am-bench=
marks_1.2.bb.  PV will automatically get set to 1.2 because of the recipe n=
ame.

> +PR =3D "r2+svnr${SRCPV}"
>=20
>  COMPATIBLE_MACHINE =3D "(dm365|omapl138|omap3|ti816x)"
>=20
> @@ -18,6 +18,8 @@ ARCHITECTURE_dm365 =3D "arm9"
>  ARCHITECTURE_omapl138 =3D "arm9"
>  ARCHITECTURE_omap3 =3D "cortex-a8"
>  ARCHITECTURE_ti816x =3D "cortex-a8"
> +ARCHITECTURE_am180x-evm =3D "arm9"
> +ARCHITECTURE_am181x-evm =3D "arm9"

You do not need to set architecture for am180x-evm and am181x-evm since the=
 ARCHITECTURE_omapl138 override applies to these already and sets the archi=
tecture to "arm9"

>=20
>  INSANE_SKIP_${PN} =3D "True"
>=20
> --
> 1.6.3.3
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


