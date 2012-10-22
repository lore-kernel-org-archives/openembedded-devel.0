Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1TQO1W-0007HL-Nd
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Oct 2012 21:50:55 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9MJbS4A028691
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2012 14:37:28 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9MJbS4T003851
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2012 14:37:28 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Mon, 22 Oct 2012 14:37:28 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH v3] libjpeg-turbo: Add RPROVIDES to fix
	errors	when rdepending on jpeg
Thread-Index: AQHNsGfrQWcoMl9MbUSzaw7gm073AZfFuGHA
Date: Mon, 22 Oct 2012 19:37:26 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159276891@DLEE12.ent.ti.com>
References: <1350918808-23478-1-git-send-email-s.stirtzel@googlemail.com>
In-Reply-To: <1350918808-23478-1-git-send-email-s.stirtzel@googlemail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH v3] libjpeg-turbo: Add RPROVIDES to fix errors	when rdepending on jpeg
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
X-List-Received-Date: Mon, 22 Oct 2012 19:50:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> Behalf Of Samuel Stirtzel
> Sent: Monday, October 22, 2012 10:13 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH v3] libjpeg-turbo: Add RPROVIDES to
> fix errors when rdepending on jpeg
>=20
> This fixes "ERROR: Multiple .bb files are due to be built which
> each provide jpeg"
>=20
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>

Acked-by: Chase Maupin <chase.maupin@ti.com>

> ---
>  meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> index 2aefe1f..d87743b 100644
> --- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> +++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://cdjpeg.h;endline=3D12;md5=3D78fa8dbac547bb5b2a0e6457a6cfe
>=20
> file://djpeg.c;endline=3D13;md5=3De85613b52f2906c5dfc0e21ec902cb33 \
>  "
>  PV =3D "8d+1.2.1"
> -PR =3D "r1"
> +PR =3D "r2"
>  SRCREV =3D "837"
>  SRC_URI =3D "svn://libjpeg-
> turbo.svn.sourceforge.net/svnroot/libjpeg-
> turbo;protocol=3Dhttps;module=3Dtrunk"
>=20
> @@ -15,6 +15,9 @@ S =3D "${WORKDIR}/trunk"
>=20
>  # Drop-in replacement for jpeg
>  PROVIDES =3D "jpeg"
> +RPROVIDES_${PN} +=3D "jpeg"
> +RREPLACES_${PN} +=3D "jpeg"
> +RCONFLICTS_${PN} +=3D "jpeg"
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


