Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1TPdIe-0006g4-E5
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Oct 2012 19:57:28 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9KHaku4032045
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Oct 2012 12:36:46 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9KHakWw003364
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Oct 2012 12:36:46 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Sat, 20 Oct 2012 12:36:46 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] libjpeg-turbo: Add RPROVIDES to fix
	errors	when rdepending on jpeg
Thread-Index: AQHNgeebqrx3uDaXmkKoYYNWJsuYqZfCzr7g
Date: Sat, 20 Oct 2012 17:36:44 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159272FF7@DLEE12.ent.ti.com>
References: <1345805787-6819-1-git-send-email-s.stirtzel@googlemail.com>
	<1345805787-6819-2-git-send-email-s.stirtzel@googlemail.com>
In-Reply-To: <1345805787-6819-2-git-send-email-s.stirtzel@googlemail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] libjpeg-turbo: Add RPROVIDES to fix errors	when rdepending on jpeg
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
X-List-Received-Date: Sat, 20 Oct 2012 17:57:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I did not see any responses to this patch.  I am also seeing this issue and=
 was wondering if there was a reason this patch was not accepted?

If it can be merged can it also be pulled into the denzil branch as well?

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> Behalf Of Samuel Stirtzel
> Sent: Friday, August 24, 2012 5:56 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH] libjpeg-turbo: Add RPROVIDES to
> fix errors when rdepending on jpeg
>=20
> This fixes "ERROR: Multiple .bb files are due to be built which
> each provide jpeg"
>=20
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
>  meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> index dd81606..ec25874 100644
> --- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> +++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> @@ -15,6 +15,7 @@ S =3D "${WORKDIR}/trunk"
>=20
>  # Drop-in replacement for jpeg
>  PROVIDES =3D "jpeg"
> +RPROVIDES_${PN} =3D "jpeg"
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


