Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 811397050C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 18:50:02 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w62so5778129wes.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 11:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2Ola50PwEs8jAyG5xu4gaZPFd4jbGVGiHCeFbA3LcK8=;
	b=YjQ9kO811rGYZaX68ZADmkOKzPL+tj+AFxQDmnZaSOKbQ6xyq6O44CYeOzgvs9Ih3B
	4j5E9rfUvPG35vbEkpZy54PYErsB3EkBL5mVqPKLMEabvD7EVcWsQ5bDBWvkjFdD84Da
	ECbpTQbEmcGGFLNfkbmSjTfo0w/itCrE00DEYC/MEv4NTtKZ7v8/p+Bf/CsIrVI3gcjE
	u2mvCwEgL1hQEJVP9ph5irJpylz3ZDg7dR35xtLcKw2KQi8sdJT751QMKM0J8XHjZlqP
	cY4+oOB8Wp7rblZhdOrrckExZjZp5/aCrJ/T5EZPZTLnG/xd9gMpH7Z9mpXaje24z3vN
	+ehA==
X-Received: by 10.194.237.135 with SMTP id vc7mr30619743wjc.86.1405450204125; 
	Tue, 15 Jul 2014 11:50:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o9sm46749727wib.22.2014.07.15.11.50.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 11:50:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 15 Jul 2014 20:50:13 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140715185013.GP2433@jama>
References: <20140621172445.18C94501C0@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20140621172445.18C94501C0@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [oe-commits] Richard Purdie : recipes: add missing gtk-doc class dependencies
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
X-List-Received-Date: Tue, 15 Jul 2014 18:50:08 -0000
X-Groupsio-MsgNum: 50975
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5KxTQ9fdN6Op3ksq"
Content-Disposition: inline

--5KxTQ9fdN6Op3ksq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2014 at 05:24:45PM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: master
> Commit: f6ecec16d799f83bfdf3d6d742d811cc63c1cf1e
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3Df6ecec16d799f83bfdf3d6d742d811cc63c1cf1e
>=20
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Sat Jun 21 11:04:29 2014 +0200
>=20
> recipes: add missing gtk-doc class dependencies
>=20
> * These recipes all use gtk-doc m4 macros but were missing
>   dependencies on the class.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> ---
>=20
>  meta-gnome/recipes-gnome/bonobo/libbonobo.inc              | 12 +-------=
----
>  meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb        |  2 +-
>  meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb |  8 +-------
>  meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb         |  2 +-
>  meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb  |  2 +-
>  meta-oe/recipes-support/farsight/libnice_0.0.13.bb         |  2 +-
>  meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb    |  2 +-
>  meta-oe/recipes-support/udisks/udisks_1.0.4.bb             |  2 +-
>  meta-xfce/recipes-xfce/garcon/garcon_0.2.1.bb              |  2 +-
>  meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.10.1.bb |  2 +-
>  10 files changed, 10 insertions(+), 26 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb b/meta-oe=
/recipes-support/farsight/libnice_0.0.13.bb
> index 48a80e5..2d7cff3 100644
> --- a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
> +++ b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
> @@ -16,7 +16,7 @@ DEPENDS =3D "glib-2.0 gstreamer"
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[gupnp] =3D "--enable-gupnp,--disable-gupnp,gupnp-igd"
> =20
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig gtk-doc
> =20
>  FILES_${PN} +=3D "${libdir}/gstreamer-0.10/*.so"
>  FILES_${PN}-dev +=3D "${libdir}/gstreamer-0.10/*.la"

This seems to break libnice build

I had to create m4 directory first:
http://lists.openembedded.org/pipermail/openembedded-devel/2014-July/096972=
=2Ehtml

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5KxTQ9fdN6Op3ksq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPFd+UACgkQN1Ujt2V2gBxHUACfTbUTKI9CejxisrA1bWlYtP0h
7r8AmwcXazVcmG3SBRTqkcnnwksCWMqh
=Re/x
-----END PGP SIGNATURE-----

--5KxTQ9fdN6Op3ksq--
