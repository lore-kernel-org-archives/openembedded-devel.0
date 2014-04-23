Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 908A965D93
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 14:45:14 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so853660eek.37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 07:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oZnv1ToqPINhzu7D3XjjMMto8kg+vFlfALad99VrREk=;
	b=P2Mw5XOonspR+cIgeiHeWgPxHOqRb0JVKarxDpJ+nXGwnVr/tTFu6uANtYhORrhF9/
	1a/LmDKxN8ifdhu87INvLYy7jXWX//1fpq7c10wVOKUxhMOG+7bsTTMTsjvqq/16Mdal
	pR0y3zy4wy/H3CQGk3/Thescsk4KWrfGqseZk1IUfWjRVzNeYLvkTrH6QcLZF8ZjkG/l
	BUUTiiSpWHrTmYnYsvQ/bZT3Fy+vpNkGeOlUpwL+SOrR9LiyVRY263xiGeEMCbSymNo/
	Q9keTgZrPC53LhiLw4JeoHXKtsLDvNigLKD76b/SKZx6xogDnCnzPlTO6fXu0tmesVh8
	Mjng==
X-Received: by 10.14.203.5 with SMTP id e5mr9982072eeo.105.1398264314833;
	Wed, 23 Apr 2014 07:45:14 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o4sm6871739eef.20.2014.04.23.07.45.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Apr 2014 07:45:13 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Apr 2014 16:45:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140423144521.GI2486@jama>
References: <1398251928-6841-1-git-send-email-changhyeok.bae@lge.com>
MIME-Version: 1.0
In-Reply-To: <1398251928-6841-1-git-send-email-changhyeok.bae@lge.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 1/3] fim: Add mirror site
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Apr 2014 14:45:17 -0000
X-Groupsio-MsgNum: 49452
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dFa58RoqyP9py9tY"
Content-Disposition: inline

--dFa58RoqyP9py9tY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2014 at 08:18:46PM +0900, Changhyeok Bae wrote:
> * The SRC_URI is not accessible.
>   So need to add mirror site referred by the original site.
> * The problem is that
>   http://download.savannah.nongnu.org/releases redirects to closest mirror
>   and few mirrors (e.g. .jp) weren't working correctly while
>   http://download-mirror.savannah.gnu.org/releases/ seems to be reliable.
>=20

at this point I think we should add variable for
http://savannah.nongnu.org and add this MIRROR setting globally:
meta/recipes-devtools/dmidecode/dmidecode_2.12.bb:SRC_URI =3D "http://savan=
nah.nongnu.org/download/dmidecode/${BP}.tar.bz2"
meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb:SRC_URI =3D "http://savannah.=
nongnu.org/download/${BPN}/${BPN}-${PV}.tar.gz \
meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb:SRC_URI =
=3D "http://savannah.nongnu.org/download/fluid/${P}.tar.gz"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:SRC_URI =3D "http://download.sa=
vannah.nongnu.org/releases/fbi-improved/${BPN}-${PV}.tar.gz \
meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb:SRC_URI =3D "http://d=
ownload.savannah.nongnu.org/releases/hddtemp/hddtemp-0.3-beta15.tar.bz2 \
meta-oe/recipes-support/libunwind/libunwind.inc:SRC_URI =3D "http://downloa=
d.savannah.nongnu.org/releases/${BPN}/${BPN}-${PV}.tar.gz"

we have also couple of recipes referencing gnu.org version:
meta-networking/recipes-protocols/quagga/quagga.inc:SRC_URI =3D "http://dow=
nload.savannah.gnu.org/releases/quagga${QUAGGASUBDIR}/quagga-${PV}.tar.gz;n=
ame=3Dquagga-${PV} \
meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb:SRC_URI =3D "http://download.sa=
vannah.gnu.org/releases/${PN}/${P}.tar.gz \
meta-oe/recipes-support/lzip/lzip_1.14.bb:SRC_URI =3D "http://download.sava=
nnah.gnu.org/releases/lzip/lzip-${PV}.tar.gz"
meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb:SRC_URI =3D "http://download=
=2Esavannah.gnu.org/releases-noredirect/sysvinit/sysvinit-${PV}.tar.bz2 \
meta/recipes-devtools/quilt/quilt-0.61.inc:SRC_URI =3D "http://download.sav=
annah.gnu.org/releases/quilt/quilt-${PV}.tar.gz \
meta/recipes-extended/ed/ed_0.5.bb:SRC_URI =3D "http://download.savannah.gn=
u.org/releases-noredirect/ed/ed-${PV}.tar.bz2"
meta/recipes-extended/texi2html/texi2html_5.0.bb:SRC_URI     =3D "http://do=
wnload.savannah.gnu.org/releases/texi2html/${BPN}-${PV}.tar.bz2 \
meta/recipes-support/attr/acl.inc:SRC_URI =3D "http://download.savannah.gnu=
=2Eorg/releases/acl/${BP}.src.tar.gz \
meta/recipes-support/attr/attr.inc:SRC_URI =3D "http://download.savannah.gn=
u.org/releases/attr/${BP}.src.tar.gz \

> Signed-off-by: Changhyeok Bae <changhyeok.bae@lge.com>
> ---
>  meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb b/meta-oe/recipe=
s-graphics/fim/fim_0.4-rc1.bb
> index 6e5000b..c6537ac 100644
> --- a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
> +++ b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
> @@ -16,6 +16,8 @@ SRC_URI =3D "http://download.savannah.nongnu.org/releas=
es/fbi-improved/${BPN}-${PV
>  SRC_URI[md5sum] =3D "d7362dde5541c2b6439c35c6e2bd5046"
>  SRC_URI[sha256sum] =3D "3f6bf2de2952b9adcbeb3db12c2a979e999a81dd1e314a03=
bc58e24f1ea9f686"
> =20
> +MIRRORS +=3D "http://download.savannah.nongnu.org/releases/ http://downl=
oad-mirror.savannah.gnu.org/releases/ \n"
> +
>  PARALLEL_MAKE =3D ""
> =20
>  inherit autotools
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dFa58RoqyP9py9tY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNX0gEACgkQN1Ujt2V2gBzshQCeIRl+zwLzFnUSXpesPAGBxF+g
ZQ4An2DkAbpPGa6r/5lBBiNm6d2Y6fyt
=jGEK
-----END PGP SIGNATURE-----

--dFa58RoqyP9py9tY--
