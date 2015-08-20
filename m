Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0A14E75E7D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 15:02:42 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so38704422wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9Hbd/FLWVOVcpoH3ykmH8UdbQ1W/MfMp/WQ5ZhWI31k=;
	b=og5Etqm9xrK9kRSWHS8a1brkdRN//vdxif69T74QMelGpl+bvIf5qoIVFailOStVuj
	9KzzvfgIkfUKayYWqu2Ifh4LYB7CzkmH8R9L5RkKwzCbumG9lTn6WRcUfQKSix9Dw693
	MdqRdXhuPVr9yvIEJB9FMbzoDgHvFonkOIUUsOxYOA6X/yf2YBFUZekC1bCKSVDJWu46
	ap0lOPIrlbRe3Lmd28bCWVGDBjuLnf657c3X8dr7iHgTL+zLTVORqb8LVLfYHH1EJ+fz
	zb+hywRzWjCF57+0QfqUuQOSJyqGRmOKHs+sqh9Kl2kqy/tfBMqgIz6nSHfLYEHEsOHz
	wUiw==
X-Received: by 10.194.87.102 with SMTP id w6mr6563237wjz.111.1440082962797;
	Thu, 20 Aug 2015 08:02:42 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	cw8sm5906745wjb.49.2015.08.20.08.02.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Aug 2015 08:02:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 20 Aug 2015 17:03:09 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150820150309.GG2446@jama>
References: <1438352729-28129-1-git-send-email-TicoTimo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1438352729-28129-1-git-send-email-TicoTimo@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [=meta-oe][meta-perl][PATCH] libmodule-runtime-perl: update to 0.015
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
X-List-Received-Date: Thu, 20 Aug 2015 15:02:46 -0000
X-Groupsio-MsgNum: 56835
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RMedoP2+Pr6Rq0N2"
Content-Disposition: inline

--RMedoP2+Pr6Rq0N2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2015 at 07:25:29AM -0700, Tim Orling wrote:
> * Convert from Module::Build to ExtUtils::MakeMaker
> * Temporarily use github repository until upstream merges change
>=20
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>  ...ntime-perl_0.014.bb =3D> libmodule-runtime-perl_0.015.bb} | 14 ++++++=
+-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>  rename meta-perl/recipes-perl/libmodule/{libmodule-runtime-perl_0.014.bb=
 =3D> libmodule-runtime-perl_0.015.bb} (76%)
>=20
> diff --git a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.01=
4.bb b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.015.bb
> similarity index 76%
> rename from meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.014=
=2Ebb
> rename to meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.015.bb
> index d68ae2a..b92842c 100644
> --- a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.014.bb
> +++ b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.015.bb
> @@ -17,19 +17,19 @@ SECTION =3D "libs"
>  HOMEPAGE =3D "http://search.cpan.org/~zefram/Module-Runtime/"
> =20
>  LICENSE =3D "Artistic-1.0 | GPL-1.0+"
> -LIC_FILES_CHKSUM =3D "file://README;beginline=3D43;endline=3D44;md5=3D62=
e24a93342fede7221d66335c716f34"
> +LIC_FILES_CHKSUM =3D "file://README;beginline=3D45;endline=3D46;md5=3D62=
e24a93342fede7221d66335c716f34"
> =20
> -SRC_URI =3D "${CPAN_MIRROR}/authors/id/Z/ZE/ZEFRAM/Module-Runtime-${PV}.=
tar.gz"
> -SRC_URI[md5sum] =3D "a6597bc25536a30476f0d75b64d35734"
> -SRC_URI[sha256sum] =3D "4c44fe0ea255a9fd00741ee545063f6692d2a28e7ef2fbaa=
d1b24a92803362a4"
> +SRCNAME =3D "module-runtime"
> +SRC_URI =3D "https://github.com/moto-timo/${SRCNAME}/archive/${PV}.tar.g=
z"

Don't use github archives, they are regenerated from time to time with=20
different checksums and they have stupid filenames (prone to collision=20
with other recipes).


> +SRC_URI[md5sum] =3D "ad6ca179c978aa02ac8aa29244ef9beb"
> +SRC_URI[sha256sum] =3D "59effa82b3f6986d28de6154a8f2428157691004d951f936=
a81e851f4dbcb045"
> =20
> -S =3D "${WORKDIR}/Module-Runtime-${PV}"
> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> =20
> -inherit cpan_build
> +inherit cpan
> =20
>  RDEPENDS_${PN} =3D " perl-module-test-more \
>                     perl-module-strict \
> -                   perl-module-build \
>  "
> =20
>  BBCLASSEXTEND =3D "native"
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RMedoP2+Pr6Rq0N2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXV7CwACgkQN1Ujt2V2gBxivwCfb/cwwYzxUzA9POyXMUBdK0De
kvsAn3vfLNxqEghvmC4D+Q1hm6RLJdPL
=aa4w
-----END PGP SIGNATURE-----

--RMedoP2+Pr6Rq0N2--
