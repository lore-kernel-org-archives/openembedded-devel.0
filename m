Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by mail.openembedded.org (Postfix) with ESMTP id 571DA600B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 May 2016 20:50:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u44Kog1l031141;
	Wed, 4 May 2016 15:50:42 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u44Kogfw031997;
	Wed, 4 May 2016 15:50:42 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Wed, 4 May 2016 15:50:42 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Otavio Salvador
	<otavio@ossystems.com.br>
Thread-Topic: [oe] [meta-oe master krogoth PATCH v2] opencv: Fix metapkg
	dependencies for opencv-java and opencv-locales
Thread-Index: AQHRpkXTragRpIo+nkyvRcdVuACIJp+pQBrw
Date: Wed, 4 May 2016 20:50:42 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581426C031@DFLE09.ent.ti.com>
References: <1462309956-19552-1-git-send-email-otavio@ossystems.com.br>
	<VI1PR0401MB2031B157C831BDD836874B27E47B0@VI1PR0401MB2031.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR0401MB2031B157C831BDD836874B27E47B0@VI1PR0401MB2031.eurprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [meta-oe master krogoth PATCH v2] opencv: Fix metapkg dependencies for opencv-java and opencv-locales
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
X-List-Received-Date: Wed, 04 May 2016 20:50:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I missed this patch, and recently sent a similar one with the subject " ope=
ncv: Fix broken deps for opencv meta package".

It would be great if this could be backported to krogoth.


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> Behalf Of Lauren Post
> Sent: Wednesday, May 04, 2016 3:11 PM
> To: Otavio Salvador; Meta-OpenEmbedded Mailing listing
> Subject: Re: [oe] [meta-oe master krogoth PATCH v2] opencv: Fix metapkg
> dependencies for opencv-java and opencv-locales
>=20
> This fixed our build break issues when including opencv and dev-pkgs in o=
ur
> development image.
>=20
> Can this be backported to krogoth branch?
>=20
> Acked-by: Lauren Post <lauren.post@nxp.com>
>=20
> -----Original Message-----
> From: Otavio Salvador [mailto:otavio@ossystems.com.br]
> Sent: Tuesday, May 03, 2016 4:13 PM
> To: Meta-OpenEmbedded Mailing listing <openembedded-
> devel@lists.openembedded.org>
> Cc: Lauren Post <lauren.post@nxp.com>; Otavio Salvador
> <otavio@ossystems.com.br>
> Subject: [meta-oe master krogoth PATCH v2] opencv: Fix metapkg
> dependencies for opencv-java and opencv-locales
>=20
> The opencv-java is not always generated so we ought to include it, only i=
f it
> is available. The opencv-locales is not available and ought to be skipped=
.
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>=20
> Changes in v2:
> - Fix handling of package when java support is disabled
> - Avoids rdepends on -locale packages
> - Improve commit log
>=20
>  meta-oe/recipes-support/opencv/opencv_3.1.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-
> oe/recipes-support/opencv/opencv_3.1.bb
> index c1f9802..789512f 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
> @@ -79,7 +79,8 @@ export
> ANT_DIR=3D"${STAGING_DIR_NATIVE}/usr/share/ant/"
>=20
>  TARGET_CC_ARCH +=3D "-I${S}/include "
>=20
> -PACKAGES +=3D "${PN}-java-dbg ${PN}-java ${PN}-samples-dbg ${PN}-
> samples ${PN}-apps python-opencv"
> +PACKAGES +=3D "${PN}-samples-dbg ${PN}-samples ${PN}-apps python-
> opencv \
> +             ${@bb.utils.contains('PACKAGECONFIG', 'oracle-java', '${PN}=
-java-
> dbg ${PN}-java', '', d)}"
>=20
>  python populate_packages_prepend () {
>      cv_libdir =3D d.expand('${libdir}')
> @@ -104,7 +105,7 @@ python populate_packages_prepend () {
>      blacklist =3D [ metapkg ]
>      metapkg_rdepends =3D [ ]
>      for pkg in packages[1:]:
> -        if not pkg in blacklist and not pkg in metapkg_rdepends and not
> pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-
> doc') :
> +        if not pkg in blacklist and not pkg in metapkg_rdepends and not
> pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-
> doc') and not pkg.endswith('-locale'):
>              metapkg_rdepends.append(pkg)
>      bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
>=20
> --
> 2.8.2
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

