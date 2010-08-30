Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1OqAPX-0001d5-Vg
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 21:52:58 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id o7UJqLrf002215
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 30 Aug 2010 14:52:21 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id o7UJqLCi021405;
	Mon, 30 Aug 2010 14:52:21 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o7UJqLBU015024;
	Mon, 30 Aug 2010 14:52:21 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Mon, 30 Aug 2010 14:52:21 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Chase Maupin <chasemaupin03@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 30 Aug 2010 14:52:19 -0500
Thread-Topic: [PATCH] matrix-tui: add dependency on ncurses and zlib
Thread-Index: ActIfEVM+JtaqdR0RjaCcMZALuzYngAAIvPg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310753E9F@dlee06.ent.ti.com>
References: <1283197156-22017-1-git-send-email-chase.maupin@ti.com>
In-Reply-To: <1283197156-22017-1-git-send-email-chase.maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.40
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] matrix-tui: add dependency on ncurses and zlib
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
X-List-Received-Date: Mon, 30 Aug 2010 19:52:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch.  I didn't realize Denys had already pushed one.

Sincerely,
Chase Maupin
Software Applications
Catalog DSP Products
e-mail: chase.maupin@ti.com
phone: (281) 274-3285

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/

> -----Original Message-----
> From: Chase Maupin [mailto:chasemaupin03@gmail.com]
> Sent: Monday, August 30, 2010 2:39 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Maupin, Chase
> Subject: [PATCH] matrix-tui: add dependency on ncurses and zlib
>=20
> * The matrix-tui application depends on the ncurses libraries
>   and header files during build time.
> * The matrix-tui application depends on the zlib libraries
>   and header files during build time.
> * Add ncurses and zlib to the DEPENDS list for matrix-tui
>=20
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> ---
>  recipes/ti/matrix-tui_svn.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/ti/matrix-tui_svn.bb b/recipes/ti/matrix-tui_svn.bb
> index 13ec5c5..1e4f7ea 100644
> --- a/recipes/ti/matrix-tui_svn.bb
> +++ b/recipes/ti/matrix-tui_svn.bb
> @@ -3,11 +3,11 @@ HOMEPAGE =3D
> "https://gforge.ti.com/gf/project/matrix_tui/"
>  LICENSE =3D "BSD"
>  SECTION =3D "multimedia"
>  PRIORITY =3D "optional"
> -DEPENDS =3D "libxml2"
> +DEPENDS =3D "libxml2 ncurses zlib"
>=20
>  SRCREV =3D "29"
>  PV =3D "1.0"
> -PR =3D "r2+svnr${SRCPV}"
> +PR =3D "r3+svnr${SRCPV}"
>=20
>  INSANE_SKIP_${PN} =3D "True"
>=20
> --
> 1.7.0.4



