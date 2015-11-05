Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id CE5F475EE7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 20:56:57 +0000 (UTC)
Received: by wimw2 with SMTP id w2so18179500wim.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2015 12:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4hM40TwO1mozpdVdB1UUFhsdrOKPfA/aS2kY6ROP84g=;
	b=FAd5AszmONGhLQH4LN+baeg8EABME2ifYUAGGT6GMpFogOtpEOtp9YqULjn6oi1dub
	fNPAqizcpMJnflaRzzN2CcCBbij9cV2dYUp8G+yRaPoyV6gLfkvvlyCcc/szPwZNO+ZQ
	SD4lLC7dqEwEq8um6dOnH2MUnpn1Mu6PXfmgvfeWt84rEax0Pg5yosED4hpF626Uukdo
	jgcuuTIJrLMECdmaX/4Mxbnght+czwIDdq2ttF9bjovaUD5wQnb2bUdpSrsbHynL9oU/
	sNQenNdW/sqOsMg0T0hgDCUteuENfsFN3VmMAfnCZorAnP62lYmZzZI0kbB43n4krZ9g
	+YJw==
X-Received: by 10.194.82.170 with SMTP id j10mr10801790wjy.55.1446757017042;
	Thu, 05 Nov 2015 12:56:57 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l81sm10245919wmb.2.2015.11.05.12.56.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Nov 2015 12:56:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Nov 2015 21:57:07 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151105205707.GH2556@jama>
References: <1446652999-24545-1-git-send-email-funman@videolan.org>
	<1446652999-24545-2-git-send-email-funman@videolan.org>
	<20151105201759.GG2556@jama> <563BBF43.5010309@videolan.org>
MIME-Version: 1.0
In-Reply-To: <563BBF43.5010309@videolan.org>
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
X-List-Received-Date: Thu, 05 Nov 2015 20:56:58 -0000
X-Groupsio-MsgNum: 58365
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4LFBTxd4L5NLO6ly"
Content-Disposition: inline

--4LFBTxd4L5NLO6ly
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2015 at 09:42:43PM +0100, Rafa=EBl Carr=E9 wrote:
> On 05/11/2015 21:17, Martin Jansa wrote:
> > On Wed, Nov 04, 2015 at 05:03:18PM +0100, Rafa=EBl Carr=E9 wrote:
> >> ---
> >>  meta-multimedia/recipes-multimedia/vlc/vlc.inc | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-mul=
timedia/recipes-multimedia/vlc/vlc.inc
> >> index b989849..ad5c81d 100644
> >> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> >> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> >> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f=
5fce4486a80fdaf4a4263"
> >>  DEPENDS =3D "libfribidi libtool libgcrypt libgcrypt-native \
> >>     virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
> >>     tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
> >> -   libdvdcss libdvdread lua-native lua libidn libnotify gtk+ gnome-vf=
s \
> >> +   libdvdcss libdvdread lua-native lua libidn gnome-vfs \
> >>     libdc1394 libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
> >>     libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
> >>     tiff xcb-util-keysyms samba"
> >> @@ -58,6 +58,7 @@ PACKAGECONFIG[gstreamer] =3D "--enable-gst-decode,--=
disable-gst-decode,gstreamer1.
> >>  PACKAGECONFIG[vpx] =3D "--enable-vpx,--disable-vpx, libvpx"
> >>  PACKAGECONFIG[qt4] =3D "--enable-qt,--disable-qt, qt4-x11-free"
> >>  PACKAGECONFIG[freerdp] =3D "--enable-freerdp,--disable-freerdp, freer=
dp"
> >> +PACKAGECONFIG[notify] =3D "--enable-notify,--disable-notify, libnotif=
y gtk+"
> >=20
> > Removing gtk+ from DEPENDS causes even more undeterministic
> > dependencies:
>=20
> I would guess those real dependencies were hidden by gtk+ which depends on
> every single one of them.
>=20
> Except maybe vorbis which was hidden by gstreamer plugins?
>=20
> I agree that although depending on gtk+ is not fully nice neither
> correct, it makes
> things deterministic.
>=20
>=20
> So I guess I should rather add all the PACKAGECONFIG for these modules
> first and then move
> those dependencies to their respective PACKAGECONFIG ?

yes

>=20
> How is your jenkins instance built: world first, then VLC ?

No, only in test-dependencies builds, this was just incremental world
build, so the list doesn't have to be complete.

> Should I check for additional automatic dependencies inside VLC or
> assume that
> the list below is exhaustive?

It will cover most (maybe all) of them, because there weren't many
changes in last increment, so it's a bit more likely that other recipes
were already reused from sstate before vlc (one of recipes with
modification) was built.

To test it properly I would need to run test-dependencies job, but that
takes too long I cannot spare now when jethro release is close.

Regards,

> > vlc-2.2.1: vlc: configure was passed unrecognised options:
> > --disable-gnome-vfs [unknown-configure-option]
> > vlc-2.2.1: vlc rdepends on fontconfig, but it isn't a build dependency?
> > [build-deps]
> > vlc-2.2.1: vlc rdepends on pixman, but it isn't a build dependency?
> > [build-deps]
> > vlc-2.2.1: vlc rdepends on freetype, but it isn't a build dependency?
> > [build-deps]
> > vlc-2.2.1: vlc rdepends on libupnp, but it isn't a build dependency?
> > [build-deps]
> > vlc-2.2.1: vlc rdepends on pango, but it isn't a build dependency?
> > [build-deps]
> > vlc-2.2.1: vlc rdepends on libvorbis, but it isn't a build dependency?
> > [build-deps]
> > vlc-2.2.1: vlc rdepends on cairo, but it isn't a build dependency?
> > [build-deps]
> > vlc-2.2.1: vlc rdepends on libavc1394, but it isn't a build dependency?
> > [build-deps]
> > vlc-2.2.1: vlc rdepends on harfbuzz, but it isn't a build dependency?
> > [build-deps]
> > vlc-2.2.1: vlc rdepends on libssh2, but it isn't a build dependency?
> > [build-deps]
> > vlc-2.2.1: vlc rdepends on gdk-pixbuf, but it isn't a build dependency?
> > [build-deps]
> > vlc-2.2.1: vlc rdepends on gnome-vfs, but it isn't a build dependency?
> > [build-deps]
> > vlc-2.2.1: vlc rdepends on libcroco, but it isn't a build dependency?
> > [build-deps]
> > vlc-2.2.1: vlc rdepends on libdvdnav, but it isn't a build dependency?
> > [build-deps]
> > vlc-2.2.1: vlc rdepends on librsvg, but it isn't a build dependency?
> > [build-deps]
> >=20
> >> =20
> >>  do_configure_prepend() {
> >>      cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4LFBTxd4L5NLO6ly
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlY7wqIACgkQN1Ujt2V2gBzfjQCfbkB8WVNEJixQCXCZWAq9Uzcb
VrEAn2csUb0LqqcCddLh7U1XRgG4ctNz
=OrFA
-----END PGP SIGNATURE-----

--4LFBTxd4L5NLO6ly--
