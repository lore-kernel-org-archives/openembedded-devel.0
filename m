Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 50F7D731E7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 13:15:56 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g62so4143385wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 05:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=++ebYYvpoeakS9QdrofPiLgbirqcksJ8uNGs+mrdNDM=;
	b=xTkMc6dH7O2zaGO6ZAhrlHC7V/WAj2U1WINjL/lwX0lVxjSKEevNTLAEljtlB7gacJ
	7YLsBTPwvAuArGKZqRZOIXQYgmwWh11fjARgO6dmTX5/wiBKM/5gbcnMBhHVioBHWNYd
	tJvMjV6GUaAleObxG58lugz2vnl/W0T3pVpqVOAnPlPrZopoXASi5HJRnsQ1cCmoIUr3
	syg/rQAWrb7TNIG46vtVc9A1vfTLu8pCUUJSEqQQgyNipXDXbBiUyMkDhnolXmo1bAph
	HEcajogrxyk+LBIPqBX9LkHZBLFwnQNYiYM9nvCsz3dgAczsQRKhqFZUR2lUuGxUCS1C
	8FQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=++ebYYvpoeakS9QdrofPiLgbirqcksJ8uNGs+mrdNDM=;
	b=VPpO3gbMn6tFgyQVPpiRcgYSsATKLAezZKmrJKDMe1dipz6WQwWM97TJWALtNrib3K
	09+Gh50OkNI0dv8v0itv7Duz/Tm4QxUOJTLCEThGiwvzhcXf9LBRg0yPgNa2dBx6ine0
	zXRBhE0DMz2yQypr8sM5xVszIPAuGCh71U7blQnq+gPGAtYw9+2QsmsDeoDfSXZ+Vtqs
	MaDxtbZE5SYky+7s5UUeFUWZVXLb52QRlD1F4gO3bUqXB5QcWxUNDCFpRZwJRMpoQsWn
	hVFVQq9slwngAapw+WOieuFRKT5Qq7LHXvJGx64OsLTdJN1CUuVB8kXkE/qS8PE+Dgds
	MTSg==
X-Gm-Message-State: AG10YOQUBocKm7mziVoNSj3ihPWJKEMsUcW2ZvKytHxG1Yvwe6sfL2ATVx7A8Uk64XofKw==
X-Received: by 10.28.126.205 with SMTP id z196mr10576836wmc.44.1455110156512; 
	Wed, 10 Feb 2016 05:15:56 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ka4sm2915568wjc.47.2016.02.10.05.15.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Feb 2016 05:15:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 10 Feb 2016 14:19:46 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160210131946.GB2609@jama>
References: <1455108862-2507-1-git-send-email-funman@videolan.org>
	<1455108862-2507-2-git-send-email-funman@videolan.org>
MIME-Version: 1.0
In-Reply-To: <1455108862-2507-2-git-send-email-funman@videolan.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-multimedia][PATCH 2/2] vlc: make sdl optional (enabled by default)
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
X-List-Received-Date: Wed, 10 Feb 2016 13:15:56 -0000
X-Groupsio-MsgNum: 59928
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline

--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 10, 2016 at 01:54:22PM +0100, Rafa=EBl Carr=E9 wrote:
> ---

Did you forget to add sdl to default PACKAGECONFIG?

>  meta-multimedia/recipes-multimedia/vlc/vlc.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multim=
edia/recipes-multimedia/vlc/vlc.inc
> index 2887a68..c85a811 100644
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> @@ -6,7 +6,7 @@ LICENSE =3D "GPL-2.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> =20
>  DEPENDS =3D "libfribidi libtool libgcrypt libgcrypt-native \
> -   virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
> +   dbus dbus-glib libxml2 gnutls \
>     tremor faad2 ffmpeg flac fluidsynth alsa-lib \
>     lua-native lua libidn \
>     avahi jpeg xz libmodplug mpeg2dec \
> @@ -25,7 +25,6 @@ EXTRA_OECONF =3D "\
>      --disable-screen --disable-caca \
>      --enable-httpd --enable-vlm \
>      --enable-freetype \
> -    --enable-sdl \=20
>      --enable-png \
>      --enable-tremor \
>      --enable-v4l2 --disable-aa --disable-faad \
> @@ -41,6 +40,7 @@ EXTRA_OECONF =3D "\
> =20
>  PACKAGECONFIG ?=3D " live555 dc1394 dv1394 notify fontconfig freetype dv=
dread {@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
>  PACKAGECONFIG[mad] =3D "--enable-mad,--disable-mad,libmad"
> +PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,virtual/libsdl libsdl=
-image "
>  PACKAGECONFIG[a52] =3D "--enable-a52,--disable-a52,liba52"
>  PACKAGECONFIG[jack] =3D "--enable-jack,--disable-jack,jack"
>  PACKAGECONFIG[live555] =3D "--enable-live555,--disable-live555,live555"
> --=20
> 2.5.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAla7OPEACgkQN1Ujt2V2gBwZfwCcDCxM8tO1TBdcmSnTH6MpSHHq
3ZAAn2o9BvIKnXJX+Y38MVOcGqT/Ugv3
=hlUI
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--
