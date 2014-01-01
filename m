Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5DA6B6B6F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jan 2014 21:12:22 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id e49so5890524eek.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jan 2014 13:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LcrzctTyk42rbVRFjxJeHDNLa9EAhB9mj9+SmUXkbgQ=;
	b=U6UIXsMDBUywbEcQ0ok4yEQOrLmWu6aCLezRAKMxVRA7hAtYO08uFYa8x3H87eFrDt
	ukm3ZAtxyGKQM9T6jKyRqD5Bm0+FBR9iOgTo2KWUuLQkkJ37bJln2NSO2OTXzj6ADo5T
	jFARg0Exz6BzmeN9OV1sfwOJEJXL7CiM+qSEgenG58XiO6j1SYfL8z7i0p0WesF4FLHd
	q8fc6XdFTIZovRLNYcY4uGWA/voxMDb2LvpvSvKLXnUjJB0opxeplTX0gPDImfsnkK+1
	xPAIMIazsc4Ehlroc0CkwF1P1Xb+FF0/cra/TepGnDDGyQ9wnJvUuBiishcrqkVZUuc7
	3Ehg==
X-Received: by 10.14.208.199 with SMTP id q47mr12645435eeo.77.1388610742740;
	Wed, 01 Jan 2014 13:12:22 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	h48sm130256718eev.3.2014.01.01.13.12.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jan 2014 13:12:22 -0800 (PST)
Date: Wed, 1 Jan 2014 22:12:24 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140101211224.GA3717@jama>
References: <1388577530-4557-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1388577530-4557-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] udisks: Don't enable acl PACKAGECONFIG by default
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
X-List-Received-Date: Wed, 01 Jan 2014 21:12:23 -0000
X-Groupsio-MsgNum: 47560
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline

--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 01, 2014 at 12:58:50PM +0100, Martin Jansa wrote:
> * libacl isn't available in oe-core/meta-oe
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/udisks/udisks_2.1.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/udisks/udisks_2.1.1.bb b/meta-oe/rec=
ipes-support/udisks/udisks_2.1.1.bb
> index d4c6eff..a0bf148 100644
> --- a/meta-oe/recipes-support/udisks/udisks_2.1.1.bb
> +++ b/meta-oe/recipes-support/udisks/udisks_2.1.1.bb
> @@ -14,7 +14,7 @@ SRC_URI[sha256sum] =3D "013b09ff38aa256b89c01525771f456=
5cb088724d5c8c79b32e9f811e8

newer udisks also breaks=20
| configure: error: Package requirements (udisks  >=3D 1.0.0 udisks < 1.1.0=
) were not met:

NOTE: recipe gnome-disk-utility-2.32.0-r4: task do_configure: Failed
ERROR: Task 366
(/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-gnome/r=
ecipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb,
do_configure) failed with exit code '1'

so newer udisks needs to wait for gnome-disk-utility update.

> =20
>  inherit autotools systemd
> =20
> -PACKAGECONFIG ??=3D "atasmart polkit acl ${@base_contains('DISTRO_FEATUR=
ES', 'systemd', 'systemd-login', '', d)}"
> +PACKAGECONFIG ??=3D "atasmart polkit ${@base_contains('DISTRO_FEATURES',=
 'systemd', 'systemd-login', '', d)}"
>  PACKAGECONFIG[atasmart] =3D "--enable-libatasmart,--disable-libatasmart,=
libatasmart"
>  PACKAGECONFIG[polkit] =3D "--enable-polkit,--disable-polkit,polkit"
>  PACKAGECONFIG[acl] =3D "--enable-acl,--disable-acl,libacl"
> --=20
> 1.8.4.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLEhLgACgkQN1Ujt2V2gBwJvgCeLXPUUw1lbg4f0g75ykdUkkGa
gKMAoILeCpZCMLvil32wr3eDeascbkKJ
=QozG
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
