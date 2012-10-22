Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1TQHsS-00015x-Q7
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Oct 2012 15:17:09 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9MD3h1a008347
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2012 08:03:43 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9MD3hbU004265
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2012 08:03:43 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Mon, 22 Oct 2012 08:03:42 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH v2] libjpeg-turbo: Add RPROVIDES to fix
	errors	when rdepending on jpeg
Thread-Index: AQHNsDvwWAFGqNetREKlcx103fY9PZfFSn6Q
Date: Mon, 22 Oct 2012 13:03:41 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159275020@DLEE12.ent.ti.com>
References: <1350899940-2274-1-git-send-email-s.stirtzel@googlemail.com>
In-Reply-To: <1350899940-2274-1-git-send-email-s.stirtzel@googlemail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH v2] libjpeg-turbo: Add RPROVIDES to fix errors	when rdepending on jpeg
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
X-List-Received-Date: Mon, 22 Oct 2012 13:17:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> Behalf Of Samuel Stirtzel
> Sent: Monday, October 22, 2012 4:59 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH v2] libjpeg-turbo: Add RPROVIDES to
> fix errors when rdepending on jpeg
>=20
> This fixes "ERROR: Multiple .bb files are due to be built which
> each provide jpeg"
>=20
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
>  meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb |    3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> index 2aefe1f..303bbae 100644
> --- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> +++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> @@ -15,6 +15,9 @@ S =3D "${WORKDIR}/trunk"
>=20
>  # Drop-in replacement for jpeg
>  PROVIDES =3D "jpeg"
> +RPROVIDES_${PN} +=3D "jpeg"
> +RREPLACES_${PN} +=3D "jpeg"
> +RCONFLICTS_${PN} +=3D "jpeg"

Does this need a PR bump?  Aside from that this has my ack.

>=20
>  inherit autotools pkgconfig
>=20
> --
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
> devel


