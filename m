Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8EC6460746
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Dec 2016 08:15:00 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id he10so14993561wjc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2016 00:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=FjFLh906vWFBnE20HJVb751wkLJFyOLn7zNXjmtgzuY=;
	b=pYO7QKdpK8W4M9b42i/fsEsGRckXXkZLTBaDjgVSiQ2MJif/xsbcKwvieM47yDEeZy
	qh8y20Q6dJPqovnTN9oTsDFRxevwL6RaIAqSzsxj5N/Jn1ga57PBlTR3ZFTv3dyd/KxB
	66cMmjEwrVfwL0cDgDYpqPQMXqyYjOBIB9a9Bj6XmYQRKaF5wi2lbA8/psZUxpzAd53c
	EDtOmRiT9x8jwo2VSSTsWvrmKhoHJ74kcZGl+OGOpzG5uQ4XaG7CQcjVjAw3XakyocHu
	T+d1pyA+tsu5R54+TgRZ8wM4C8YIUtGpGVkQcE4fY+nu6Y2pZfSH3e2WboXfh9oxkUqk
	4Eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=FjFLh906vWFBnE20HJVb751wkLJFyOLn7zNXjmtgzuY=;
	b=emSUr13t/8rNP0dnHXpdIJdVpoLRP3F2t2w784IxcNm17AZ2FRMC88UenHByPA2OjI
	ncfIZyFTM0n81RDO+7N5i2PL9vZ18ZUd9i+jYaFR5U7ru2AeKIaktGVfK1zjlq52yxUK
	/fAGNbwyWCuhoMIFNfAgys3Zs8NLhx99ZHhBtul4VqOFCI+hSkkqPzump9D3964YT6ED
	SwsF2RLYb5ZSFf8cwlaKRK+Cy5LO0tbw7x7154NMZASRgd4KcbXHBrPPGwCmdOhslTtG
	8LDnWchgaFZI6cT8drdkJgWne5S+0gy19lp71tINLyUM97XwWFuzEng/fCpTBr39qEHf
	kBfw==
X-Gm-Message-State: AKaTC00W7vVDaGQ2W0ga9dVpO3w1QF45VQK5y52iE5kXSNuYeZzA5PsS4Zl/j0Nd5L6fng==
X-Received: by 10.194.98.208 with SMTP id ek16mr43376586wjb.94.1480666501770; 
	Fri, 02 Dec 2016 00:15:01 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i10sm4285837wjd.15.2016.12.02.00.15.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Dec 2016 00:15:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 2 Dec 2016 09:15:00 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161202081500.GA3721@jama>
References: <20161128225759.9756-1-raj.khem@gmail.com>
	<20161129195922.GD2700@jama>
	<CAMKF1sog=+RPyNRKK1hrDJDOJhGm3ycJD=H0iyFbdbfomfajtQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sog=+RPyNRKK1hrDJDOJhGm3ycJD=H0iyFbdbfomfajtQ@mail.gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [meta-oe][PATCH] libva: Import from meta-intel and update to 1.7.3
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
X-List-Received-Date: Fri, 02 Dec 2016 08:15:02 -0000
X-Groupsio-MsgNum: 64200
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline

--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2016 at 02:43:22PM -0800, Khem Raj wrote:
> On Tue, Nov 29, 2016 at 11:59 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Mon, Nov 28, 2016 at 02:57:59PM -0800, Khem Raj wrote:
> >> This recipe is used by intel and amd BSP layers
> >> additional copies are also there see
> >> https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3D=
libva
> >
> > I'm sorry to report more and more issues, but this is causing few more =
autodetected dependencies
>=20
> its good. We will keep fixing them :)

So here is another, possibly caused by libvncserver autodetecting libva:
http://errors.yoctoproject.org/Errors/Details/109361/

I'm fine with just disabling it, or someone using libvncserver might
want to fix it with:
https://github.com/LibVNC/libvncserver/issues/11

>=20
> >
> > mpv-0.15.0: mpv rdepends on libva-x11, but it isn't a build dependency,=
 missing libva in DEPENDS or PACKAGECONFIG? [build-deps]
> > mpv-0.15.0: mpv rdepends on libva, but it isn't a build dependency, mis=
sing libva in DEPENDS or PACKAGECONFIG? [build-deps]
> >
> > and there is another one caused by libvdpau I haven't noticed before:
> > ffmpeg-3.2: libavutil rdepends on libvdpau, but it isn't a build depend=
ency, missing libvdpau in DEPENDS or PACKAGECONFIG? [build-deps]
> >
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  meta-oe/recipes-graphics/libva/libva_1.7.3.bb | 48 ++++++++++++++++++=
+++++++++
> >>  1 file changed, 48 insertions(+)
> >>  create mode 100644 meta-oe/recipes-graphics/libva/libva_1.7.3.bb
> >>
> >> diff --git a/meta-oe/recipes-graphics/libva/libva_1.7.3.bb b/meta-oe/r=
ecipes-graphics/libva/libva_1.7.3.bb
> >> new file mode 100644
> >> index 0000000..9994158
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-graphics/libva/libva_1.7.3.bb
> >> @@ -0,0 +1,48 @@
> >> +SUMMARY =3D "Video Acceleration (VA) API for Linux"
> >> +DESCRIPTION =3D "Video Acceleration API (VA API) is a library (libVA)=
 \
> >> +and API specification which enables and provides access to graphics \
> >> +hardware (GPU) acceleration for video processing on Linux and UNIX \
> >> +based operating systems. Accelerated processing includes video \
> >> +decoding, video encoding, subpicture blending and rendering. The \
> >> +specification was originally designed by Intel for its GMA (Graphics \
> >> +Media Accelerator) series of GPU hardware, the API is however not \
> >> +limited to GPUs or Intel specific hardware, as other hardware and \
> >> +manufacturers can also freely use this API for hardware accelerated \
> >> +video decoding."
> >> +
> >> +HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/vaapi"
> >> +BUGTRACKER =3D "https://bugs.freedesktop.org"
> >> +
> >> +SECTION =3D "x11"
> >> +LICENSE =3D "MIT"
> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2e48940f94acb0af582e5ef035=
37800f"
> >> +
> >> +SRC_URI =3D "http://www.freedesktop.org/software/vaapi/releases/libva=
/${BP}.tar.bz2"
> >> +SRC_URI[md5sum] =3D "dafb1d7d6449e850e9eb1a099895c683"
> >> +SRC_URI[sha256sum] =3D "22bc139498065a7950d966dbdb000cad04905cbd3dc8f=
3541f80d36c4670b9d9"
> >> +
> >> +DEPENDS =3D "libdrm virtual/mesa virtual/libgles1 virtual/libgles2 vi=
rtual/egl"
> >> +
> >> +inherit autotools pkgconfig
> >> +
> >> +EXTRA_OECONF =3D "--disable-dummy-driver"
> >> +
> >> +PACKAGECONFIG ??=3D "${@bb.utils.contains("DISTRO_FEATURES", "x11", "=
x11", "", d)} \
> >> +                   ${@bb.utils.contains("DISTRO_FEATURES", "wayland",=
 "wayland", "", d)}"
> >> +PACKAGECONFIG[x11] =3D "--enable-x11,--disable-x11,virtual/libx11 lib=
xext libxfixes"
> >> +PACKAGECONFIG[wayland] =3D "--enable-wayland,--disable-wayland,waylan=
d"
> >> +
> >> +PACKAGES =3D+ "${PN}-x11 ${PN}-tpi ${PN}-glx ${PN}-egl ${PN}-wayland"
> >> +
> >> +RDEPENDS_${PN}-tpi =3D+ "${PN}"
> >> +RDEPENDS_${PN}-x11 =3D+ "${PN}"
> >> +RDEPENDS_${PN}-glx =3D+ "${PN}-x11"
> >> +RDEPENDS_${PN}-egl =3D+ "${PN}-x11"
> >> +
> >> +FILES_${PN}-dbg +=3D "${libdir}/dri/.debug"
> >> +
> >> +FILES_${PN}-x11 =3D+ "${libdir}/libva-x11*${SOLIBS}"
> >> +FILES_${PN}-tpi =3D+ "${libdir}/libva-tpi*${SOLIBS}"
> >> +FILES_${PN}-glx =3D+ "${libdir}/libva-glx*${SOLIBS}"
> >> +FILES_${PN}-egl =3D+ "${libdir}/libva-egl*${SOLIBS}"
> >> +FILES_${PN}-wayland =3D+ "${libdir}/libva-wayland*${SOLIBS}"
> >> --
> >> 2.10.2
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWEEthAAKCRA3VSO3ZXaA
HDHJAKCrwXtENdkJ+VLYh6bhClciRdTmBACeLxE9t+nj/eeOw/ejk6qhMtijwV0=
=7lOK
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
