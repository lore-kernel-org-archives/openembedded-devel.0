Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9E19D605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 16:47:14 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id ey11so1434444pad.32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 09:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:mime-version:in-reply-to:content-type
	:content-transfer-encoding:message-id:cc:from:subject:date:to;
	bh=1pFP+1iwqx8kGNjoOSUeDFuwRLRUkrRLB2qIcV+swQA=;
	b=R8tCtDSjJbFOJ/BXFYGUk0wW4BVOW7FV2Oh/GszCWgErFVS0cjHoa/RyUr9X6sYc1x
	GbmAdVEv2k+u/gEofDLZSOLPlImauuVoQ2OK6F4fjQnolj90XjMGLT0f9ZPVzXEczaiL
	ohPwsMWtt3q/KY99KX72O0U+UINq0DBqtt/XTbagqxd5ZwgmixuZfLT9ZtLLrIlvgPD/
	qcgdCuP/zP+xGz0hcFZcBr693gXYpfgoXvc56E9WszfMIQLg1q1O3ij8Tnl7OeJo3Wc0
	mnMBIs0udHyRDc/1sgepW7eJv3lZnVYOekHosoB6mmMDFg4g92CPHZWLKbNTU6/x04F0
	pyrQ==
X-Received: by 10.66.251.233 with SMTP id zn9mr21064340pac.67.1399481235707;
	Wed, 07 May 2014 09:47:15 -0700 (PDT)
Received: from [192.168.55.197] ([72.29.171.20])
	by mx.google.com with ESMTPSA id gn3sm4095136pbc.32.2014.05.07.09.47.13
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 May 2014 09:47:13 -0700 (PDT)
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
References: <1399475791-30061-1-git-send-email-ticotimo@gmail.com>
Mime-Version: 1.0 (1.0)
In-Reply-To: <1399475791-30061-1-git-send-email-ticotimo@gmail.com>
Message-Id: <98B8D45A-B417-4FB8-A96D-3E8105B44840@gmail.com>
X-Mailer: iPad Mail (11D201)
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 7 May 2014 09:47:14 -0700
To: Tim Orling <ticotimo@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl][WIP] vlc: add dependencies, drop unrecognized options
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
X-List-Received-Date: Wed, 07 May 2014 16:47:19 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Submitted to wrong layer, cut and paste error. Should have been [meta-multim=
edia]
--Tim

> On May 7, 2014, at 8:16 AM, Tim Orling <ticotimo@gmail.com> wrote:
>=20
> From: Tim Orling <TicoTimo@gmail.com>
>=20
>  * add PKGCONFIG for libass, mkv
>  * drop PKGCONFIG for id3tag, mpeg2dec
>  * drop unrecognized options:
>      --enable-v4l,
>      --disable-opengl,-id3tag,-mpeg2dec
>  * add dependencies from JaMa builds / configure.ac
>=20
>  NOTE: requires fluidsynth >=3D 1.1.2 (will work on that next)
>=20
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
> meta-multimedia/recipes-multimedia/vlc/vlc.inc | 18 +++++++++++-------
> 1 file changed, 11 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multime=
dia/recipes-multimedia/vlc/vlc.inc
> index 1b2490b..58f5648 100644
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> @@ -5,9 +5,13 @@ SECTION =3D "multimedia"
> LICENSE =3D "GPL-2.0"
> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"
>=20
> -DEPENDS =3D "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl q=
t4-x11-free \
> -   dbus libxml2 gnutls tremor faad2 ffmpeg flac libxpm fluidsynth alsa-li=
b \
> -   libdvdcss libdvdread lua-native lua"
> +DEPENDS =3D "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl \=

> +   libsdl-image qt4-x11-free dbus dbus-glib libxml2 gnutls tremor \
> +   faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib libdvdcss \
> +   libdvdread lua-native lua libidn libnotify gtk+ gnome-vfs libdc1394 \
> +   libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
> +   libmtp opencv libopus orc libusb1 schroedinger taglib \
> +   tiff xcb-util-keysyms samba"
>=20
> SRC_URI =3D "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.=
tar.xz"
>=20
> @@ -26,11 +30,11 @@ EXTRA_OECONF =3D "\
>     --enable-sdl \=20
>     --enable-png \
>     --enable-live555 --enable-tremor \
> -    --enable-v4l2 --enable-v4l --disable-aa --disable-faad \
> +    --enable-v4l2 --disable-aa --disable-faad \
>     --enable-dbus \
>     --without-contrib \
>     --without-kde-solid \
> -    --disable-opengl --disable-glx \
> +    --disable-glx \
>     --enable-realrtsp \
>     ac_cv_path_MOC=3D${STAGING_BINDIR_NATIVE}/moc4 \
>     ac_cv_path_RCC=3D${STAGING_BINDIR_NATIVE}/rcc4 \
> @@ -38,11 +42,11 @@ EXTRA_OECONF =3D "\
> "
>=20
> PACKAGECONFIG[mad] =3D "--enable-mad,--disable-mad,libmad"
> -PACKAGECONFIG[id3tag] =3D "--enable-id3tag,--disable-id3tag,libid3tag"
> PACKAGECONFIG[a52] =3D "--enable-a52,--disable-a52,liba52"
> -PACKAGECONFIG[mpeg2dec] =3D "--enable-mpeg2dec,--disable-mpeg2dec,mpeg2de=
c"
> PACKAGECONFIG[jack] =3D "--enable-jack,--disable-jack,jack"
> PACKAGECONFIG[live555] =3D "--enable-live555,--disable-live555,live555"
> +PACKAGECONFIG[libass] =3D "--enable-libass,--disable-libass,libass"
> +PACKAGECONFIG[mkv] =3D "--enable-mkv,--disable-mkv,libmatroska libebml"
>=20
> do_configure() {
>     cp ${STAGING_DATADIR}/aclocal/libgcrypt.m4 ${S}/m4/=20
> --=20
> 1.8.3.2
>=20

