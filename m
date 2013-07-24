Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0B87C605F3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 07:40:41 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so44227eaj.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 00:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ik/Z6zVZ5PIgHEEzL9s6L55MYGZM5+h+YxGeo1NichQ=;
	b=AxmmeALgR9DFZgARu6STB13ERakJ+6yx1/6lV1qhG1jkuWjBH37aahIgVkTg8aDn6y
	o3d4KabI8mWi6BLwX7kCrtf3oRPkcXqyH/bDSHShnXgSjnbMi6JaHmgtaX2RSjCN5Itf
	GC0KT2HaGgquJ1rOxzaqultLrPQWCQj9Vaggkv5ZH2wzWsPh/Ne7GcVjyffXcl/XIiEY
	9V91ImIxuruVsQ2qGUhO2oHYpgNBmMdYwXDYsu2/e7OblCeect/3TgbsYqZvbLjPDL98
	NGVsXABh5fOnxpoqJ3ZuVsUPfSh2V0PqoOTlQhUKvWH9lflP4rMPlfOV7K4Om0ynqNSx
	ppYA==
X-Received: by 10.14.216.73 with SMTP id f49mr36076851eep.119.1374651641323;
	Wed, 24 Jul 2013 00:40:41 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p49sm64060716eeu.2.2013.07.24.00.40.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 00:40:40 -0700 (PDT)
Date: Wed, 24 Jul 2013 09:41:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130724074103.GB4136@jama>
References: <1374642834-2108-1-git-send-email-chgans@gna.org>
MIME-Version: 1.0
In-Reply-To: <1374642834-2108-1-git-send-email-chgans@gna.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-qt5][dylan][RFC PATCH] qt5.inc: Fix qtbase-tools runtime depencency on perl
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
X-List-Received-Date: Wed, 24 Jul 2013 07:40:42 -0000
X-Groupsio-MsgNum: 45457
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MfFXiAuoTsnnDAfZ"
Content-Disposition: inline

--MfFXiAuoTsnnDAfZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2013 at 05:13:54PM +1200, Christian Gagneraud wrote:
> I'm not sure if it is the right way to do that, but here I go:
>=20
> While building a custom rootfs using poky, meta-oe, meta-ti and meta-qt5 =
(all on Dylan branch), I got the following error:
> [...]
> | Computing transaction...error: Can't install qtbase-tools-5.0.2-r2.0@ar=
mv7a_vfp_neon: no package provides /usr/bin/perl
> [...]
>=20
> qtbase-tools seems to depends and perl (at runtime), but this wasn't spec=
ified in any bb file, this patch fixes it.

Looks good, I'll check if it's just sync(.pl) which has perl shebang and
apply this (in qtbase.inc, not qt5.inc).

Cheers,

> ---
>  recipes-qt/qt5/qt5.inc | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
> index 87bf5e8..955d5bd 100644
> --- a/recipes-qt/qt5/qt5.inc
> +++ b/recipes-qt/qt5/qt5.inc
> @@ -22,6 +22,8 @@ OE_QMAKE_PATH_TESTS =3D "${OE_QMAKE_PATH_QT_TESTS}"
> =20
>  PACKAGES =3D. "${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${=
PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs ${PN}-examples-dev $=
{PN}-examples-staticdev ${PN}-examples-dbg ${PN}-examples "
> =20
> +RDEPENDS_${PN}-tools +=3D "perl"
> +
>  # extra -dbg packages
>  FILES_${PN}-qmlplugins-dbg =3D " \
>      ${OE_QMAKE_PATH_QML}/*/.debug \
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MfFXiAuoTsnnDAfZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHvhQ8ACgkQN1Ujt2V2gByoLwCgr9AANWze1hM9ilBWD0SxMHNu
vqYAoKil9/HBE1+qAyOfsSGQL9OMFMRx
=C5pg
-----END PGP SIGNATURE-----

--MfFXiAuoTsnnDAfZ--
