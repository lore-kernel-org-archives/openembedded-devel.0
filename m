Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1QMm2s-00080S-8A
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 May 2011 21:04:34 +0200
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p4IJ1cY4026011
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 18 May 2011 14:01:38 -0500
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p4IJ1c7h023448;
	Wed, 18 May 2011 14:01:38 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Wed, 18 May 2011 14:01:38 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-commits@openembedded.org"
	<openembedded-commits@openembedded.org>
Date: Wed, 18 May 2011 14:01:33 -0500
Thread-Topic: [oe-commits] Jeff Lance : matrix_gui: Pull in lmbench,
	multimedia,	EZSDK mods
Thread-Index: AcwVgLeIcj5ET3Q8QTi4vlyuno+JDAADTsyw
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F08034B055BB4@dlee06.ent.ti.com>
References: <E1QMkSo-0007sn-QR@melo.openembedded.org>
In-Reply-To: <E1QMkSo-0007sn-QR@melo.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [oe-commits] Jeff Lance : matrix_gui: Pull in lmbench, multimedia, EZSDK mods
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
X-List-Received-Date: Wed, 18 May 2011 19:04:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-commits-bounces@lists.openembedded.org
> [mailto:openembedded-commits-bounces@lists.openembedded.org] On Behalf
> Of git version control
> Sent: Wednesday, May 18, 2011 12:23 PM
> To: openembedded-commits@openembedded.org
> Subject: [oe-commits] Jeff Lance : matrix_gui: Pull in lmbench,
> multimedia, EZSDK mods
>=20
> Module: openembedded.git
> Branch: master
> Commit: b14cb947a346088d14b0d78d3546314c9d37cdbb
> URL:
> http://git.openembedded.org/?p=3Dopenembedded.git&a=3Dcommit;h=3Db14cb947=
a346
> 088d14b0d78d3546314c9d37cdbb
>=20
> Author: Jeff Lance <jefflance01@gmail.com>
> Date:   Thu May 19 23:35:09 2011 +0000
>=20
> matrix_gui: Pull in lmbench,multimedia,EZSDK mods
>=20
> * Update SRCREV to pull in:
> 	* Multimedia apps
>         * LMBench apps
>         * EZSDK updates
>         * remove Blitrix
>=20
> Signed-off-by: Jeff Lance  <j-lance1@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Acked-by: Chase Maupin <chase.maupin@ti.com>

>=20
> ---
>=20
>  recipes/ti/matrix-gui-common_1.4.bb |    4 ++--
>  recipes/ti/matrix-gui-e_1.3.bb      |    4 ++--
>  recipes/ti/matrix-gui_1.3.bb        |    4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/recipes/ti/matrix-gui-common_1.4.bb b/recipes/ti/matrix-
> gui-common_1.4.bb
> index d436044..6f7376d 100644
> --- a/recipes/ti/matrix-gui-common_1.4.bb
> +++ b/recipes/ti/matrix-gui-common_1.4.bb
> @@ -4,5 +4,5 @@ require matrix-gui-common.inc
>  # prebuilt version in the repository.
>  RRECOMMENDS_${PN} =3D "am-sysinfo"
>=20
> -SRCREV =3D "245"
> -PR =3D "${INC_PR}.9"
> +SRCREV =3D "249"
> +PR =3D "${INC_PR}.10"
> diff --git a/recipes/ti/matrix-gui-e_1.3.bb b/recipes/ti/matrix-gui-
> e_1.3.bb
> index fb7e4b3..8f2df1c 100644
> --- a/recipes/ti/matrix-gui-e_1.3.bb
> +++ b/recipes/ti/matrix-gui-e_1.3.bb
> @@ -1,5 +1,5 @@
>  require matrix-gui-e.inc
>=20
> -SRCREV =3D "245"
> -PR =3D "${INC_PR}.8"
> +SRCREV =3D "249"
> +PR =3D "${INC_PR}.9"
>=20
> diff --git a/recipes/ti/matrix-gui_1.3.bb b/recipes/ti/matrix-
> gui_1.3.bb
> index 2c38fc3..f7e56a3 100644
> --- a/recipes/ti/matrix-gui_1.3.bb
> +++ b/recipes/ti/matrix-gui_1.3.bb
> @@ -1,4 +1,4 @@
>  require matrix-gui.inc
>=20
> -SRCREV =3D "245"
> -PR =3D "${INC_PR}.4"
> +SRCREV =3D "249"
> +PR =3D "${INC_PR}.5"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
> commits


