Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0F80D6E744;
	Tue, 21 Jan 2014 22:41:55 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e53so4400019eek.39
	for <multiple recipients>; Tue, 21 Jan 2014 14:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=N92CLHKrOu8+X4+RbrIiVJdt/ooSWAhBz00JptDCycw=;
	b=HjWcbWEnfw+l8VsrYagz03onA7JcLd+OhdKT0PEzL8Zs2ikiQhR3tpuCKsik2HAHDO
	V96QKN7MdRg7/NjVG153xZrbHkQcrlFXUlOtT8igQlMLYPSzFeyexHYS6TUx6mKerQIU
	ggzGhFf1ZALSa0oxSykYwTjJKCGMzq6ldX9QS73DpiYB3gHDhE+gwd/7FMCh/UCjNnRs
	XyLTQA36+nPi0gyf9dcvtbQ3i02GOaNMXFP+mpr2ny36WMaxglV/OgIoH3cLO1r1poyn
	Mqh4Vq4nWQFzQUJUJdDTbn7GHihKQ/Revbeo+ZG67HnLDs3bjvI2lX+KSpgxZjnhbK2L
	Ukhw==
X-Received: by 10.15.56.132 with SMTP id y4mr21013881eew.61.1390344116573;
	Tue, 21 Jan 2014 14:41:56 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id h3sm19766231eem.15.2014.01.21.14.41.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 14:41:55 -0800 (PST)
Date: Tue, 21 Jan 2014 23:41:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140121224155.GJ4100@jama>
References: <20140119164038.2027F502E0@opal>
MIME-Version: 1.0
In-Reply-To: <20140119164038.2027F502E0@opal>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Paul Barker : default-providers: Change update-alternatives provider to opkg-utils
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
X-List-Received-Date: Tue, 21 Jan 2014 22:41:56 -0000
X-Groupsio-MsgNum: 47846
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="P6YfpwaDcfcOCJkJ"
Content-Disposition: inline

--P6YfpwaDcfcOCJkJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 19, 2014 at 04:40:38PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 2f18289493f9c2c67ba343fb8e16743bf5dfee24
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D2f18289493f9c2c67ba343fb8e16743bf5dfee24
>=20
> Author: Paul Barker <paul@paulbarker.me.uk>
> Date:   Thu Jan 16 17:59:25 2014 +0000
>=20
> default-providers: Change update-alternatives provider to opkg-utils
>=20
> This allows dependencies to be added to the opkg recipe without causing c=
ircular
> dependency loops. As opkg-utils has minimal dependencies it is the best r=
ecipe
> to provide update-alternatives.
>=20
> This partially solves Yocto Project issue 4836. More work is still needed=
 for a
> complete solution.
>=20
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/conf/distro/include/default-providers.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/d=
istro/include/default-providers.inc
> index e2b0892..419ffcd 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -10,15 +10,15 @@ PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa"
>  PREFERRED_PROVIDER_virtual/libgles1 ?=3D "mesa"
>  PREFERRED_PROVIDER_virtual/libgles2 ?=3D "mesa"
>  PREFERRED_PROVIDER_virtual/mesa ?=3D "mesa"
> -PREFERRED_PROVIDER_virtual/update-alternatives ?=3D "opkg"
> -PREFERRED_PROVIDER_virtual/update-alternatives-native ?=3D "opkg-native"
> +PREFERRED_PROVIDER_virtual/update-alternatives ?=3D "opkg-utils"
> +PREFERRED_PROVIDER_virtual/update-alternatives-native ?=3D "opkg-utils-n=
ative"
>  PREFERRED_PROVIDER_virtual/libx11 ?=3D "libx11"
>  PREFERRED_PROVIDER_xf86-video-intel ?=3D "xf86-video-intel"
> =20
>  #
>  # Default virtual runtime providers
>  #
> -VIRTUAL-RUNTIME_update-alternatives ?=3D "update-alternatives-cworth"
> +VIRTUAL-RUNTIME_update-alternatives ?=3D "update-alternatives-opkg"

Can we add RREPLACES/RCONFLICTS/RPROVIDES combo to opkg-utils recipe to
fix upgrade-path on target?

 * check_data_file_clashes: Package update-alternatives-opkg wants to
 * install file /usr/bin/update-alternatives
        But that file is already provided by package  * update-alternatives=
-cworth

I'll send patch.

>  VIRTUAL-RUNTIME_apm ?=3D "apm"
>  VIRTUAL-RUNTIME_alsa-state ?=3D "alsa-state"
> =20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--P6YfpwaDcfcOCJkJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLe97MACgkQN1Ujt2V2gBxSQwCfRlzFfx5wqEAGehektjXSTcrE
108AoKsh10gPNpy521UklHgDoVtvYNNs
=bKA6
-----END PGP SIGNATURE-----

--P6YfpwaDcfcOCJkJ--
