Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id D149B773F0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 03:05:20 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1cI5JJ-0007fF-BN from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2016 19:05:21 -0800
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 16 Dec 2016 19:05:20 -0800
Received: by burninator (Postfix, from userid 1000)	id DD6605802CD; Fri, 16
	Dec 2016 22:05:19 -0500 (EST)
Date: Fri, 16 Dec 2016 22:05:19 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20161217030519.GA16746@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
	<1481940923-12914-4-git-send-email-joe_macdonald@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1481940923-12914-4-git-send-email-joe_macdonald@mentor.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH 03/11] samba: remove unused variable DISABLE_STATIC
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
X-List-Received-Date: Sat, 17 Dec 2016 03:05:22 -0000
X-Groupsio-MsgNum: 64373
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline

--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Oh, I just realized this one sneaked back in despite my having thrown it
out at least twice now.  I've already rejected it in patchwork, but if
anyone is picking this up off the mailing list, DISABLE_STATIC is very
much still needed AFAICT.

-J.

[[oe] [meta-networking][PATCH 03/11] samba: remove unused variable DISABLE_=
STATIC] On 16.12.16 (Fri 21:15) Joe MacDonald wrote:

> From: Andreas Oberritter <obi@opendreambox.org>
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>  meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/=
meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> index aabc043..c9e0953 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> @@ -93,7 +93,6 @@ EXTRA_OECONF +=3D "--enable-fhs \
>                   --with-libiconv=3D${STAGING_DIR_HOST}${prefix} \
>                   --with-pam --with-pammodulesdir=3D${base_libdir}/securi=
ty \
>                  "
> -DISABLE_STATIC =3D ""
> =20
>  LDFLAGS +=3D "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES'=
, 'ld-is-gold', ' -fuse-ld=3Dbfd ', '', d)}"
> =20
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJYVKtvAAoJEEn8ffcsOfaWG0YIAK0ltz6XCoLXGmbAoZJwx+Nc
g8hrfRubPXzqYI4HPTIvcF1VllT0V/ioNhXm/GyVdsstknLVWmTusKyPUfc4Ayuk
NnGMrrzgDwyMV7vjXXpLszS2kzI925F5ogyMMCh6dLsb5s4SmOcy/hjYvs/I0Put
rKJd9GNpeZKtA7J6bdN7755q2xxN/aHcs4gfYTk/DqcXDZGGEef8fGyfbxkAJv8Q
7nIMF+SOr/yavfnkKdGT2a8ESVzlREgtiRFpVjjNbKy3dtXsIKnJq6DRBEoPnwWG
3ArAXN51sP/WYEMj8gliNuU8ooomqeKoDDj5WAeUuPGwnaXWBvPePpOZq1/TVGA=
=r09X
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
