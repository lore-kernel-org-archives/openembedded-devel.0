Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 81F7370016
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 19:59:20 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u144so26078718wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 11:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=PKEHGsi9WaQtWRGo/D2fLj5yqhj1TVKMcPI9jnqEccg=;
	b=ojy93rjJ47UBvnF+loJrDee/GZciAFeKJEILJMdT5PBivH9uvov0LfcfofefRqIWkW
	bdKGAlQY3yFLlb93F/VoaPYjtGQ1Yli3/pAm0RFXiYtZOhLgevJWmYkTE8n0eIgC3GO5
	4Zje8WKf2S/vtKCHOcx9KjY5lKxfc47XsCpyEhc0VCjDqY/ztKsoF8uIgK7aysPZRI7Q
	1O0gxayk5Qf0J+d6zw8dbUTqBMHb1Dvg3ZCswICp+dlFSBeW7bg8ojCMLOTNKCXGCxzD
	RzqEMbykX47D0EsM7s+g7SwuC6JXN2EKek6rw9IFOQsv2CEATuxd4baCXbNuyL258+Py
	9TtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=PKEHGsi9WaQtWRGo/D2fLj5yqhj1TVKMcPI9jnqEccg=;
	b=HIteggvUwPbdJNOtI2cqxttfmw/nudIfrdxPRVRpIAJqjdnXqNUpIJMnaEC4ZjLmno
	DchkH7syrNRQ6Y4qEpfmOQSabHFAKytL/0ImMFTawjtNZCUS/PMLRPp6jn2P7cJnJIzk
	JavhklfNx5PmCZTP30dzBdGiSkLWjtxZq3stev9SYc3c5J/HEimycNvQAysE1AOJxL51
	/cGEbTbtOGR9/9lGfYjQu4+NzCDXZ18A/wtraZcpCaVRs2qOk0GSNP8TWwTQqp9xS7nS
	vI6J1npjsQbeJF26nxOJ4A5Ljj/DZi6NbzPXCvx5FVNjfYc54xP+1zipyVFo6EhUPVnB
	ymDQ==
X-Gm-Message-State: AKaTC03gLqnXW6PKwkNi27sqDavYzk2YeRheFO/9klmW9y+4WtFOzFhdLw6qAKKhP3oq9g==
X-Received: by 10.28.181.197 with SMTP id e188mr24727580wmf.32.1480449560898; 
	Tue, 29 Nov 2016 11:59:20 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id d64sm4429237wmh.3.2016.11.29.11.59.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 29 Nov 2016 11:59:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 29 Nov 2016 20:59:22 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161129195922.GD2700@jama>
References: <20161128225759.9756-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161128225759.9756-1-raj.khem@gmail.com>
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
X-List-Received-Date: Tue, 29 Nov 2016 19:59:20 -0000
X-Groupsio-MsgNum: 64114
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pZs/OQEoSSbxGlYw"
Content-Disposition: inline

--pZs/OQEoSSbxGlYw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2016 at 02:57:59PM -0800, Khem Raj wrote:
> This recipe is used by intel and amd BSP layers
> additional copies are also there see
> https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dlib=
va

I'm sorry to report more and more issues, but this is causing few more auto=
detected dependencies

mpv-0.15.0: mpv rdepends on libva-x11, but it isn't a build dependency, mis=
sing libva in DEPENDS or PACKAGECONFIG? [build-deps]
mpv-0.15.0: mpv rdepends on libva, but it isn't a build dependency, missing=
 libva in DEPENDS or PACKAGECONFIG? [build-deps]

and there is another one caused by libvdpau I haven't noticed before:
ffmpeg-3.2: libavutil rdepends on libvdpau, but it isn't a build dependency=
, missing libvdpau in DEPENDS or PACKAGECONFIG? [build-deps]

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-graphics/libva/libva_1.7.3.bb | 48 +++++++++++++++++++++=
++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/libva/libva_1.7.3.bb
>=20
> diff --git a/meta-oe/recipes-graphics/libva/libva_1.7.3.bb b/meta-oe/reci=
pes-graphics/libva/libva_1.7.3.bb
> new file mode 100644
> index 0000000..9994158
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/libva/libva_1.7.3.bb
> @@ -0,0 +1,48 @@
> +SUMMARY =3D "Video Acceleration (VA) API for Linux"
> +DESCRIPTION =3D "Video Acceleration API (VA API) is a library (libVA) \
> +and API specification which enables and provides access to graphics \
> +hardware (GPU) acceleration for video processing on Linux and UNIX \
> +based operating systems. Accelerated processing includes video \
> +decoding, video encoding, subpicture blending and rendering. The \
> +specification was originally designed by Intel for its GMA (Graphics \
> +Media Accelerator) series of GPU hardware, the API is however not \
> +limited to GPUs or Intel specific hardware, as other hardware and \
> +manufacturers can also freely use this API for hardware accelerated \
> +video decoding."
> +
> +HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/vaapi"
> +BUGTRACKER =3D "https://bugs.freedesktop.org"
> +
> +SECTION =3D "x11"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2e48940f94acb0af582e5ef035378=
00f"
> +
> +SRC_URI =3D "http://www.freedesktop.org/software/vaapi/releases/libva/${=
BP}.tar.bz2"
> +SRC_URI[md5sum] =3D "dafb1d7d6449e850e9eb1a099895c683"
> +SRC_URI[sha256sum] =3D "22bc139498065a7950d966dbdb000cad04905cbd3dc8f354=
1f80d36c4670b9d9"
> +
> +DEPENDS =3D "libdrm virtual/mesa virtual/libgles1 virtual/libgles2 virtu=
al/egl"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF =3D "--disable-dummy-driver"
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.contains("DISTRO_FEATURES", "x11", "x11=
", "", d)} \
> +                   ${@bb.utils.contains("DISTRO_FEATURES", "wayland", "w=
ayland", "", d)}"
> +PACKAGECONFIG[x11] =3D "--enable-x11,--disable-x11,virtual/libx11 libxex=
t libxfixes"
> +PACKAGECONFIG[wayland] =3D "--enable-wayland,--disable-wayland,wayland"
> +
> +PACKAGES =3D+ "${PN}-x11 ${PN}-tpi ${PN}-glx ${PN}-egl ${PN}-wayland"
> +
> +RDEPENDS_${PN}-tpi =3D+ "${PN}"
> +RDEPENDS_${PN}-x11 =3D+ "${PN}"
> +RDEPENDS_${PN}-glx =3D+ "${PN}-x11"
> +RDEPENDS_${PN}-egl =3D+ "${PN}-x11"
> +
> +FILES_${PN}-dbg +=3D "${libdir}/dri/.debug"
> +
> +FILES_${PN}-x11 =3D+ "${libdir}/libva-x11*${SOLIBS}"
> +FILES_${PN}-tpi =3D+ "${libdir}/libva-tpi*${SOLIBS}"
> +FILES_${PN}-glx =3D+ "${libdir}/libva-glx*${SOLIBS}"
> +FILES_${PN}-egl =3D+ "${libdir}/libva-egl*${SOLIBS}"
> +FILES_${PN}-wayland =3D+ "${libdir}/libva-wayland*${SOLIBS}"
> --=20
> 2.10.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pZs/OQEoSSbxGlYw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWD3eGQAKCRA3VSO3ZXaA
HAHQAKCrk2KfUzl4GMZ9cPEhFtqKfQXCQwCbBPhtppDyu2ECSXcG5qGA/jXomOY=
=RoS2
-----END PGP SIGNATURE-----

--pZs/OQEoSSbxGlYw--
