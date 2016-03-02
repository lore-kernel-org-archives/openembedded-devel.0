Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1504F731DB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Mar 2016 19:22:18 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l68so363204wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2016 11:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=cbCO02+CreA5OfGFPHB01XrnY6mwrfEC68uCwJyUAIQ=;
	b=Yr1NZHSHH2ov29Lv8lYi5SjfGP2FTNO5BTQ0zSq8huMy7RTMPPk8HFnJCVX8WsInys
	Y3yqVtKPohcDFIAdJ8zurnGgPp+XwfifN0a0YGWtPbbobFUFqjpSN/SYlJW/wpqV0HXZ
	gnztFrU1stt7X1Ely41GiuMSGjrl+QHfr+etIU035O5Qcrtz/afhXK4P4i0Oi6gzqdjC
	MiJYUJfzWcbIim3qoenDNqQgrrTWy/1FwHYuR0KAfjX/n81+iSwK67qnW2U2tqw8L5ng
	/Ga1fsR510efnNawfXPBslhxtANKEmobYdxmMCCc4vTo9t0tnKXT4jhf6ZOB9a9OgBW5
	fQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=cbCO02+CreA5OfGFPHB01XrnY6mwrfEC68uCwJyUAIQ=;
	b=BDzxKmmZ2wEdmctRbUDPoaWeftEMbMX/Cs1nJ09OwqTv5VvDzdQMj4BGBLd781qPVJ
	knjDOv4DNqWSzlGgN8V+SN4nKaXAuCmNIYJ0D8+v+Isw5FcxvQyfYAWP/dVrfenb/y9V
	Xk0Z1KtaSsywUJRaMDlfsk6FFAZpTYM/msGkC/TLhbPoM4WkiaKQeWO12ki6jeisBP/d
	X3TRbIyYX4/RsG7K4WlfQd57rhEwQUUsshNADZxFENVdD8VsvhWZ2AGIlryvMOg80sA+
	D0ZXhAZgnDlZAsRqjwxCdO0CRj/grxhsWm9jPRzfhMkjUwRZ1sSusl5nzcrwwa9OdS6o
	22GQ==
X-Gm-Message-State: AD7BkJJ9Z25X/9SHipoEXcIXWdIrkuumcHBXn6GnHFIkw+KJjMUoxojwk2zTg+R6nYhV3A==
X-Received: by 10.194.22.35 with SMTP id a3mr28112560wjf.165.1456946539023;
	Wed, 02 Mar 2016 11:22:19 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	et11sm37217392wjc.30.2016.03.02.11.22.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Mar 2016 11:22:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Mar 2016 20:24:16 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160302192416.GF10529@jama>
References: <1455108862-2507-1-git-send-email-funman@videolan.org>
MIME-Version: 1.0
In-Reply-To: <1455108862-2507-1-git-send-email-funman@videolan.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-multimedia][PATCH 1/2] vlc: make x11 DISTRO_FEATURE optional (enabled by default)
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
X-List-Received-Date: Wed, 02 Mar 2016 19:22:22 -0000
X-Groupsio-MsgNum: 60301
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5Mfx4RzfBqgnTE/w"
Content-Disposition: inline

--5Mfx4RzfBqgnTE/w
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 10, 2016 at 01:54:21PM +0100, Rafa=EBl Carr=E9 wrote:
> ---
>  meta-multimedia/recipes-multimedia/vlc/vlc.inc | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multim=
edia/recipes-multimedia/vlc/vlc.inc
> index 46dbd5d..2887a68 100644
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> @@ -7,17 +7,15 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263"
> =20
>  DEPENDS =3D "libfribidi libtool libgcrypt libgcrypt-native \
>     virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
> -   tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
> +   tremor faad2 ffmpeg flac fluidsynth alsa-lib \
>     lua-native lua libidn \
>     avahi jpeg xz libmodplug mpeg2dec \
>     libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
> -   tiff xcb-util-keysyms"
> +   tiff"
> =20
>  SRC_URI =3D "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP=
}.tar.xz"
> =20
>  inherit autotools gettext pkgconfig distro_features_check
> -# depends on libxinerama libxpm xcb-util-keysyms
> -REQUIRED_DISTRO_FEATURES =3D "x11"
> =20
>  ARM_INSTRUCTION_SET =3D "arm"
> =20
> @@ -41,7 +39,7 @@ EXTRA_OECONF =3D "\
>      ac_cv_path_UIC=3D${STAGING_BINDIR_NATIVE}/uic4 \
>  "
> =20
> -PACKAGECONFIG ?=3D " live555 dc1394 dv1394 notify fontconfig freetype dv=
dread"
> +PACKAGECONFIG ?=3D " live555 dc1394 dv1394 notify fontconfig freetype dv=
dread {@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"

Missing $ before {@ causes few QA errors:

vlc-2.2.1: vlc: invalid PACKAGECONFIG: {@bb.utils.contains('DISTRO_FEATURES=
', [invalid-packageconfig]
vlc-2.2.1: vlc: invalid PACKAGECONFIG: 'x11', [invalid-packageconfig]
vlc-2.2.1: vlc: invalid PACKAGECONFIG: 'x11 [invalid-packageconfig]
vlc-2.2.1: vlc: invalid PACKAGECONFIG: sdl', [invalid-packageconfig]
vlc-2.2.1: vlc: invalid PACKAGECONFIG: '', [invalid-packageconfig]
vlc-2.2.1: vlc: invalid PACKAGECONFIG: d)} [invalid-packageconfig]

Interesting that nobody noticed.

>  PACKAGECONFIG[mad] =3D "--enable-mad,--disable-mad,libmad"
>  PACKAGECONFIG[a52] =3D "--enable-a52,--disable-a52,liba52"
>  PACKAGECONFIG[jack] =3D "--enable-jack,--disable-jack,jack"
> @@ -73,6 +71,7 @@ PACKAGECONFIG[fontconfig] =3D "--enable-fontconfig,--di=
sable-fontconfig, fontconfi
>  PACKAGECONFIG[freetype] =3D "--enable-freetype,--disable-freetype, freet=
ype"
>  PACKAGECONFIG[dvdread] =3D "--enable-dvdread,--disable-dvdread, libdvdre=
ad libdvdcss"
>  PACKAGECONFIG[vnc] =3D "--enable-vnc,--disable-vnc, libvncserver"
> +PACKAGECONFIG[x11] =3D "--with-x --enable-xcb,--without-x --disable-xcb,=
  xcb-util-keysyms libxpm libxinerama"
> =20
>  do_configure_prepend() {
>      cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
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

--5Mfx4RzfBqgnTE/w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbXPd8ACgkQN1Ujt2V2gBxPNQCeKd9Fs96FKJ8ZTqy/cW1nKNQi
vkIAnRx2RLY3mVgt2xRjbqbNky73ioZf
=VNqd
-----END PGP SIGNATURE-----

--5Mfx4RzfBqgnTE/w--
