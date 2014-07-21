Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 83C9665CC9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 22:10:34 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id k48so7153338wev.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 15:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mBiSTNO4mbKCx1RIVZnt3F1b1BGGcTFLDVgYVqI11+U=;
	b=YgZyYZ0qXnsHoyYLIX72YG62t6QCnk7w1V1os0JBVq8UIDknad/Cw1p6HxX4IF9tsl
	wcURCL5exSQwJZwGax+JIhIm4xUfeYLtzXkR0mrq84AbfVCHjJ/2BEqlrDicfl7qDX92
	IEV3Oswz4wO1oJniqqBc/insNFAetBd+s/cymYWeOMaT0Yd88oCAoRJQlIy16OVBu1TJ
	dK1JICEP15EzkMXIewe1EH+EWYhEgA1P2Yy9iRIKs0Bw0WAMIRTrS1K3pNNpiMmcZSk3
	2nPVU56ZaV/IuU8ZaBdHK7IHfF+Gz0VltyJtgoRzx0UhpExhlj0SlI3e2rmaN99PnQ9g
	xu4Q==
X-Received: by 10.180.198.173 with SMTP id jd13mr8670852wic.9.1405980635596;
	Mon, 21 Jul 2014 15:10:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o2sm46416505wij.24.2014.07.21.15.10.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Jul 2014 15:10:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 22 Jul 2014 00:10:49 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140721221049.GL22875@jama>
References: <1405829260-13293-1-git-send-email-TicoTimo@gmail.com>
	<1405829260-13293-2-git-send-email-TicoTimo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1405829260-13293-2-git-send-email-TicoTimo@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-multimedia][PATCH 1/4] vlc.inc: cleanup configure, inherit pkgconfig
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
X-List-Received-Date: Mon, 21 Jul 2014 22:10:37 -0000
X-Groupsio-MsgNum: 51159
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kOdvwer/5gjFgNo6"
Content-Disposition: inline

--kOdvwer/5gjFgNo6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 19, 2014 at 09:07:37PM -0700, Tim Orling wrote:
> * Upstream is now much more pkg-config friendly
> * Clean up configure baggage, no longer needed
>=20
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>  meta-multimedia/recipes-multimedia/vlc/vlc.inc | 33 ++++++++++++--------=
------
>  1 file changed, 15 insertions(+), 18 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multim=
edia/recipes-multimedia/vlc/vlc.inc
> index 58f5648..c188771 100644
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> @@ -5,17 +5,17 @@ SECTION =3D "multimedia"
>  LICENSE =3D "GPL-2.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> =20

Can you please try it with standalone libpostproc (and libav-9*), now
when libpostproc build was fixed it has floating dependency on it:
vlc rdepends on libpostproc but its not a build dependency? [build-deps]

thanks

> -DEPENDS =3D "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl=
 \
> -   libsdl-image qt4-x11-free dbus dbus-glib libxml2 gnutls tremor \
> -   faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib libdvdcss \
> -   libdvdread lua-native lua libidn libnotify gtk+ gnome-vfs libdc1394 \
> -   libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
> +DEPENDS =3D "libfribidi libtool libgcrypt libgcrypt-native gst-plugins-b=
ad \
> +   virtual/libsdl libsdl-image qt4-x11-free dbus dbus-glib libxml2 gnutl=
s \
> +   tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
> +   libdvdcss libdvdread lua-native lua libidn libnotify gtk+ gnome-vfs \
> +   libdc1394 libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
>     libmtp opencv libopus orc libusb1 schroedinger taglib \
>     tiff xcb-util-keysyms samba"
> =20
>  SRC_URI =3D "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP=
}.tar.xz"
> =20
> -inherit autotools gettext
> +inherit autotools gettext pkgconfig
> =20
>  ARM_INSTRUCTION_SET =3D "arm"
> =20
> @@ -29,18 +29,20 @@ EXTRA_OECONF =3D "\
>      --enable-freetype \
>      --enable-sdl \=20
>      --enable-png \
> -    --enable-live555 --enable-tremor \
> +    --enable-tremor \
>      --enable-v4l2 --disable-aa --disable-faad \
>      --enable-dbus \
>      --without-contrib \
>      --without-kde-solid \
>      --disable-glx \
>      --enable-realrtsp \
> +    --disable-libtar \
>      ac_cv_path_MOC=3D${STAGING_BINDIR_NATIVE}/moc4 \
>      ac_cv_path_RCC=3D${STAGING_BINDIR_NATIVE}/rcc4 \
>      ac_cv_path_UIC=3D${STAGING_BINDIR_NATIVE}/uic4 \
>  "
> =20
> +PACKAGECONFIG ?=3D " live555"
>  PACKAGECONFIG[mad] =3D "--enable-mad,--disable-mad,libmad"
>  PACKAGECONFIG[a52] =3D "--enable-a52,--disable-a52,liba52"
>  PACKAGECONFIG[jack] =3D "--enable-jack,--disable-jack,jack"
> @@ -48,18 +50,13 @@ PACKAGECONFIG[live555] =3D "--enable-live555,--disabl=
e-live555,live555"
>  PACKAGECONFIG[libass] =3D "--enable-libass,--disable-libass,libass"
>  PACKAGECONFIG[mkv] =3D "--enable-mkv,--disable-mkv,libmatroska libebml"
> =20
> -do_configure() {
> -    cp ${STAGING_DATADIR}/aclocal/libgcrypt.m4 ${S}/m4/=20
> -    ./bootstrap   =20
> -    gnu-configize --force
> -    libtoolize --force
> -    #autoreconf --force -i
> +do_configure_prepend() {
>      cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
> -    oe_runconf
> -    rm config.log
> -    #sed -i -e s:-L/usr/lib:-L${STAGING_LIBDIR}/:g ${S}/vlc-config
> -    sed -i -e s:'$(MOC) $(DEFS) $(CPPFLAGS)':'$(MOC) $(DEFS)'\ -I${S}/in=
clude\ -DSYS_LINUX:g ${S}/modules/gui/qt4/Makefile
> -    sed -i -e s:'${top_builddir_slash}libtool':${TARGET_SYS}-libtool:g $=
{S}/doltlibtool
> +}
> +
> +do_configure_append() {
> +    sed -i -e s:'$(MOC) $(DEFS) $(CPPFLAGS)':'$(MOC) $(DEFS)'\ -I${B}/in=
clude\ -DSYS_LINUX:g ${B}/modules/gui/qt4/Makefile
> +    sed -i -e s:'${top_builddir_slash}libtool':${TARGET_SYS}-libtool:g $=
{B}/doltlibtool
>  }
> =20
>  # This recipe packages vlc as a library as well, so qt4 dependencies
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kOdvwer/5gjFgNo6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPNj+kACgkQN1Ujt2V2gBxb6gCglXI3R6unSOdZAcmi5zCFX+BM
liIAnildxvFQBIl+UmGQtM2yU6YkrLwm
=ZbXM
-----END PGP SIGNATURE-----

--kOdvwer/5gjFgNo6--
