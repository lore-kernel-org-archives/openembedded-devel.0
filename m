Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1892675A31
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 20:17:48 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so17451745wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2015 12:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vhXdIN4JSxHbKNanaWvttYQUyVAW0o/7xjXsE1F9BF4=;
	b=d21LSWBwaDHktqMToTpg9NVl5wc6mbSThS7jhxCvMS1vux14Rn+WX7VlET6hIV+aaX
	QS2c6ab1A+OtQLB/Qletm7AWrVTmNPkz62p1dMayMSaO6kynrKYrnLMckCU33t650DCw
	QRRbDcJihNMoXQMAwFd4XXHxFHILI5zI/Aae/DyxXJdM+zfpTcueFYwYybezpzRfxI5I
	kyNaNqgesz8Hfo4RttC98ShpzAIkXS+WJHnUiwZwpNzWi3b0bFfrA0YSAuBCWCZe7sxg
	8DWsEZ7h9JGb0HYI/8Ae/Uk4LBcKgxQpPuqlYF3gJDaTHXr72NxdNQAv/WubhGMIS+G8
	Aw5g==
X-Received: by 10.194.7.69 with SMTP id h5mr10654561wja.117.1446754668678;
	Thu, 05 Nov 2015 12:17:48 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	n17sm10076883wmg.17.2015.11.05.12.17.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Nov 2015 12:17:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Nov 2015 21:17:59 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151105201759.GG2556@jama>
References: <1446652999-24545-1-git-send-email-funman@videolan.org>
	<1446652999-24545-2-git-send-email-funman@videolan.org>
MIME-Version: 1.0
In-Reply-To: <1446652999-24545-2-git-send-email-funman@videolan.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-multimedia][PATCH 2/3] VLC: make libnotify a configurable dependency
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
X-List-Received-Date: Thu, 05 Nov 2015 20:17:53 -0000
X-Groupsio-MsgNum: 58363
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Wtrm9ATX0sn6fFKv"
Content-Disposition: inline

--Wtrm9ATX0sn6fFKv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2015 at 05:03:18PM +0100, Rafa=EBl Carr=E9 wrote:
> ---
>  meta-multimedia/recipes-multimedia/vlc/vlc.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multim=
edia/recipes-multimedia/vlc/vlc.inc
> index b989849..ad5c81d 100644
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
>  DEPENDS =3D "libfribidi libtool libgcrypt libgcrypt-native \
>     virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
>     tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
> -   libdvdcss libdvdread lua-native lua libidn libnotify gtk+ gnome-vfs \
> +   libdvdcss libdvdread lua-native lua libidn gnome-vfs \
>     libdc1394 libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
>     libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
>     tiff xcb-util-keysyms samba"
> @@ -58,6 +58,7 @@ PACKAGECONFIG[gstreamer] =3D "--enable-gst-decode,--dis=
able-gst-decode,gstreamer1.
>  PACKAGECONFIG[vpx] =3D "--enable-vpx,--disable-vpx, libvpx"
>  PACKAGECONFIG[qt4] =3D "--enable-qt,--disable-qt, qt4-x11-free"
>  PACKAGECONFIG[freerdp] =3D "--enable-freerdp,--disable-freerdp, freerdp"
> +PACKAGECONFIG[notify] =3D "--enable-notify,--disable-notify, libnotify g=
tk+"

Removing gtk+ from DEPENDS causes even more undeterministic
dependencies:

vlc-2.2.1: vlc: configure was passed unrecognised options:
--disable-gnome-vfs [unknown-configure-option]
vlc-2.2.1: vlc rdepends on fontconfig, but it isn't a build dependency?
[build-deps]
vlc-2.2.1: vlc rdepends on pixman, but it isn't a build dependency?
[build-deps]
vlc-2.2.1: vlc rdepends on freetype, but it isn't a build dependency?
[build-deps]
vlc-2.2.1: vlc rdepends on libupnp, but it isn't a build dependency?
[build-deps]
vlc-2.2.1: vlc rdepends on pango, but it isn't a build dependency?
[build-deps]
vlc-2.2.1: vlc rdepends on libvorbis, but it isn't a build dependency?
[build-deps]
vlc-2.2.1: vlc rdepends on cairo, but it isn't a build dependency?
[build-deps]
vlc-2.2.1: vlc rdepends on libavc1394, but it isn't a build dependency?
[build-deps]
vlc-2.2.1: vlc rdepends on harfbuzz, but it isn't a build dependency?
[build-deps]
vlc-2.2.1: vlc rdepends on libssh2, but it isn't a build dependency?
[build-deps]
vlc-2.2.1: vlc rdepends on gdk-pixbuf, but it isn't a build dependency?
[build-deps]
vlc-2.2.1: vlc rdepends on gnome-vfs, but it isn't a build dependency?
[build-deps]
vlc-2.2.1: vlc rdepends on libcroco, but it isn't a build dependency?
[build-deps]
vlc-2.2.1: vlc rdepends on libdvdnav, but it isn't a build dependency?
[build-deps]
vlc-2.2.1: vlc rdepends on librsvg, but it isn't a build dependency?
[build-deps]

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

--Wtrm9ATX0sn6fFKv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlY7uXYACgkQN1Ujt2V2gBxg+wCZAXuiUMsr33Vqr4fD9d4WJLcf
zRMAoKuZA53HAwQe5Q0ZguynWblKYnZq
=oOEQ
-----END PGP SIGNATURE-----

--Wtrm9ATX0sn6fFKv--
