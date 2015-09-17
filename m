Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 649B376FDE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 06:54:32 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so10138194wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 23:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IP8NGEgXzadS+MGx3c42jUwR5T425sYXIjhvcfYXJeI=;
	b=DDWYPGFTpvWg4yG5ExmsIt9xHSsTOTiiRUZ4ZK8AtKBi0Elj7JP9HBYzuUjxnPFWvp
	e7wxojupOdsVNV9fdYrbL6Jj8QQAgCBtg7WRCyZ1YOGnDxyFLCQuIq8IRkEtgstJSHn/
	JGRCuVFQZgrgM+K4jH1aWPjbgeeFhgJC9QfnQ2tockA0lzXiMjAlx+d/NHL9o4Ely82D
	c6IIKdzkb7c81MeG68aJBNrcENlg37E7ZCm8+IQO53plhk/bIrksHzteKJ6g0+FUXBfV
	X/Em4D15ksjLxArk51q/wUVibwh3d7RotlHC6/6WyCV4Z1icYNGWaFer5i2bvNQf3KzG
	WQ0A==
X-Received: by 10.180.75.243 with SMTP id f19mr26718961wiw.52.1442472873059;
	Wed, 16 Sep 2015 23:54:33 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	az6sm8334537wib.12.2015.09.16.23.54.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 23:54:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 Sep 2015 08:54:42 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150917065442.GA2388@jama>
References: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
	<1442450491-14912-2-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1442450491-14912-2-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 01/19] gvfs: remove invalid PACKAGECONFIG[cdda]
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
X-List-Received-Date: Thu, 17 Sep 2015 06:54:33 -0000
X-Groupsio-MsgNum: 57426
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline

--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2015 at 02:41:13AM +0200, Andreas M=FCller wrote:
> Enabling cdda requires libcdio-paranoia not libcdio. libcdio-paranoia is =
not
> found in layer list so disable cdda.

It wouldn't be the first case where PACKAGECONFIG requires dependency
which cannot be satisfied, would you mind adding libcdio-paranoia to
PACKAGECONFIG for cdda and keeping it by default disabled?

Maybe with comment saying that for cdda you need to create/find
libcdio-paranoia recipe.

> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb b/meta-gnome/re=
cipes-gnome/gvfs/gvfs_1.10.1.bb
> index 7ed1bb5..2404fac 100644
> --- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
> +++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb
> @@ -1,13 +1,13 @@
>  require gvfs.inc
> =20
>  DEPENDS =3D "libsoup-2.4 gnome-keyring glib-2.0 avahi gconf intltool-nat=
ive"
> -# optional: obexftp libcdio libimobiledevice=20
> +# optional: obexftp libcdio-paranoia libimobiledevice
> =20
>  PR =3D "${INC_PR}.0"
> =20
>  # in case of gnome-disk-utility was alresdy built: avoid double files
>  # afc is enabled when it detects libimobiledevice
> -EXTRA_OECONF +=3D "--disable-gdu --disable-afc"
> +EXTRA_OECONF +=3D "--disable-gdu --disable-afc --disable-cdda"
> =20
>  PACKAGES =3D+ "gvfsd-ftp gvfsd-sftp gvfsd-trash"
> =20
> @@ -31,4 +31,3 @@ PACKAGECONFIG[samba] =3D "--enable-samba --with-samba-i=
ncludes=3D${STAGING_INCDIR} \
>  PACKAGECONFIG[fuse] =3D "--enable-fuse, --disable-fuse, fuse"
>  PACKAGECONFIG[archive] =3D "--enable-archive, --disable-archive, libarch=
ive"
>  PACKAGECONFIG[obexftp] =3D "--enable-obexftp, --disable-obexftp, bluez4 =
expat"
> -PACKAGECONFIG[cdda] =3D "--enable-cdda, --disable-cdda, libcdio"
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

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlX6Y7EACgkQN1Ujt2V2gBzabwCeKxLD0Z/X9tJHtJKpvRT7NgpX
WkkAn0ILOxs0lN5CWMVTtTpU4SBjuHbl
=Gtb3
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
