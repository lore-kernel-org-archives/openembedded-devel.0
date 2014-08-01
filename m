Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 528BD60438
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 10:23:15 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so4021794wgh.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Aug 2014 03:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/vCs9RSADm89tkHphQEJWe6ihXkgdgsXVzX5yJKkKPI=;
	b=rHmyy/kzA3dwSSfTWzC+mEiGo4Rp2Nj81AX+EFD4CGbq4srztkFqIJms7qsrD+8Yt9
	/ZNGJnIU2LtniN46bw8khCO+VjDFR4sWozzwNmEI3SQyBJT2ftCYbHFmdPts8Da/RQ/z
	mQU5y32CtX18S6bcl33hbNLRuXTulJbVM9jAAlOk545WHOo3TrqpEMTC5gPagIMGTPwl
	jop1pQI+RJwSBq9vlFRfxngvr8AX7mk6lN1IR+rAbgHpuVFlpuQrwydZ3v9Cfunu0qni
	+6+elaexzE8JkvBwWC1+kDrUKRSS97st6S1J1UlczClw7NX6B0FsRMnhPJSdd/4LEC1W
	6M+w==
X-Received: by 10.194.91.228 with SMTP id ch4mr6451445wjb.59.1406888595408;
	Fri, 01 Aug 2014 03:23:15 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gq4sm7306541wib.8.2014.08.01.03.23.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Aug 2014 03:23:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 1 Aug 2014 12:23:39 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140801102339.GB16445@jama>
References: <1406887022-18508-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1406887022-18508-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-gnome][PATCH] libgnomekbd: fix S!=B
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
X-List-Received-Date: Fri, 01 Aug 2014 10:23:16 -0000
X-Groupsio-MsgNum: 51366
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XIT9+HGZgTFaGwcE"
Content-Disposition: inline

--XIT9+HGZgTFaGwcE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2014 at 11:57:02AM +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb b/me=
ta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
> index e9ca2a7..0381192 100644
> --- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
> +++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
> @@ -6,9 +6,7 @@ SECTION =3D "x11/gnome/libs"
> =20
>  DEPENDS =3D "gconf gtk+ glib-2.0 libxklavier"

Please test these 2 as well:

meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.b=
b:PNBLACKLIST[gnome-control-center] =3D "BROKEN: depends on broken libgnome=
kbd"
meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1=
=2Ebb:PNBLACKLIST[gnome-settings-daemon] =3D "BROKEN: depends on broken lib=
gnomekbd"

> =20
> -PNBLACKLIST[libgnomekbd] =3D "BROKEN: wasn't updated to work with B!=3DS"
> -
> -inherit gnome
> +inherit gnome autotools-brokensep
> =20
>  SRC_URI[archive.md5sum] =3D "de32a6e3e3464b566eecdc4332bf34bd"
>  SRC_URI[archive.sha256sum] =3D "ddd52c4cc7d83ad7ef964a1bcb4db87407e65b00=
ffc3e70c088ca4ee7383d256"
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XIT9+HGZgTFaGwcE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPbaqsACgkQN1Ujt2V2gBw6wQCgkpt2uYPAOwQvph01z22JWoZi
BQsAmwdOtkhwq5peGrIfKjiJ7I581xUI
=9N50
-----END PGP SIGNATURE-----

--XIT9+HGZgTFaGwcE--
