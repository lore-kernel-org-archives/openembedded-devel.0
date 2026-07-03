Return-Path: <tafil@tafhub.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A1FC43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 08:22:38 +0000 (UTC)
Received: from mail.tafhub.de (mail.tafhub.de [5.189.191.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88626.1783066952249806289
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2026 01:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tafhub.de header.s=dkim header.b=Zm1wFRXy;
 spf=pass (domain: tafhub.de, ip: 5.189.191.204, mailfrom: tafil@tafhub.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id CF02C18810E0;
	Fri,  3 Jul 2026 10:22:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tafhub.de; s=dkim;
	t=1783066948; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1b+fLsIJTaRfGfDyi3dcs2x2KVuHggGB5u5rp1nuRDQ=;
	b=Zm1wFRXy160NbS3RA+ryRonU93Ql0+gUHtISVLnIvrJjSzXuq1HHpA0hpyZb58YdQG2Hxi
	WZDZxAACk4h94ZaxgYRTSVOcPdzr2iYKRQjlAE4ivrAXd3PQ7y6ZvAu03u7VmRnM0xc03U
	+bMD8CnxlXzgMCAEySdnEGmAjNC4yMej7kkRFWYhVkVyMVmwuC8kJVYlzYs1G4JvFrL4Qf
	tdeEOG4BHXaYNhN09qZDSztP8+TkfKu4yyIVebNMDOhSOxtUbuUvp2Kq8v2y8fbZJksgP7
	QgbhGU4GNWIPQF4mrm62F8igUmtUOB5u+HvcWMmtejZVgWrE2v3tQ/A4ZbY5Bw==
From: "Tafil Avdyli" <tafil@tafhub.de>
In-Reply-To: <20260701090942.419-1-wangmy@fujitsu.com>
Content-Type: text/plain; charset="utf-8"
References: <20260701090942.419-1-wangmy@fujitsu.com>
Date: Fri, 03 Jul 2026 10:22:27 +0200
Cc: openembedded-devel@lists.openembedded.org
To: wangmy@fujitsu.com
MIME-Version: 1.0
Message-ID: <2e5c2121-033f-df0f-6b52-fd03553fd2fd@tafhub.de>
Subject: =?utf-8?q?Re=3A?= [oe] [meta-oe] [PATCH v2] =?utf-8?q?fastfetch=3A?= 
 upgrade =?utf-8?q?2=2E64=2E2?= -> =?utf-8?q?2=2E65=2E2?=
User-Agent: SOGoMail 5.12.8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jul 2026 08:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128006

Hi again,

On Wednesday, July 01, 2026 11:09 CEST, "wangmy via lists.openembedded.=
org" <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> * Drop drm-amdgpu PACKAGECONFIG (removed upstream, replaced by raw io=
ctl)
> * Replace vaapi with va-drm and va-x11 (upstream split, commits:
>   55eb3c59, eff0108b)
> * Adjust PACKAGECONFIG defaults to reflect the changes
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{fastfetch=5F2.64.2.bb =3D> fastfetch=5F2.65.2.bb}       | 10 ++=
+++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>  rename meta-oe/recipes-support/fastfetch/{fastfetch=5F2.64.2.bb =3D>=
 fastfetch=5F2.65.2.bb} (91%)
>=20
> diff --git a/meta-oe/recipes-support/fastfetch/fastfetch=5F2.64.2.bb =
b/meta-oe/recipes-support/fastfetch/fastfetch=5F2.65.2.bb
> similarity index 91%
> rename from meta-oe/recipes-support/fastfetch/fastfetch=5F2.64.2.bb
> rename to meta-oe/recipes-support/fastfetch/fastfetch=5F2.65.2.bb
> index 8a953508eb..33a0d2fbf0 100644
> --- a/meta-oe/recipes-support/fastfetch/fastfetch=5F2.64.2.bb
> +++ b/meta-oe/recipes-support/fastfetch/fastfetch=5F2.65.2.bb
> @@ -11,7 +11,7 @@ LIC=5FFILES=5FCHKSUM =3D "file://LICENSE;md5=3D2090=
e7d93df7ad5a3d41f6fb4226ac76"
>  DEPENDS =3D "yyjson"
> =20
>  SRC=5FURI =3D "git://github.com/fastfetch-cli/fastfetch.git;protocol=
=3Dhttps;branch=3Dmaster;tag=3D${PV}"
> -SRCREV =3D "636471c3669201b37fca587e2882eaf3c7062aeb"
> +SRCREV =3D "0e90f3a7d4ac5a7857a968a6f52ea1205be5f404"
> =20
>  inherit cmake pkgconfig
> =20
> @@ -24,18 +24,18 @@ EXTRA=5FOECMAKE +=3D "\
>  PACKAGECONFIG ??=3D "\
>      ${@bb.utils.contains('DISTRO=5FFEATURES', 'opengl', 'egl', '', d=
)} \
>      ${@bb.utils.contains('DISTRO=5FFEATURES', 'opengl x11', 'glx', '=
', d)} \
> -    ${@bb.utils.contains('DISTRO=5FFEATURES', 'x11', 'xcb xrandr', '=
', d)} \
> +    ${@bb.utils.contains('DISTRO=5FFEATURES', 'x11', 'xcb xrandr va-=
x11', '', d)} \
>      ${@bb.utils.filter('DISTRO=5FFEATURES', 'opencl pulseaudio vulka=
n wayland', d)} \
>      dbus \
>      drm \
>      sqlite3 \
> +    va-drm \
>  "

Im unsure if libva / vaapi should be enabled by default. I haven't seen=
 a=20
recipe with vaapi packageconfig enabled by default. I'd rather keep it =
disabled.

> =20
>  PACKAGECONFIG[chafa] =3D "-DENABLE=5FCHAFA=3DON,-DENABLE=5FCHAFA=3DO=
FF,chafa"
>  PACKAGECONFIG[dbus] =3D "-DENABLE=5FDBUS=3DON,-DENABLE=5FDBUS=3DOFF,=
dbus"
>  PACKAGECONFIG[dconf] =3D "-DENABLE=5FDCon***=3D""
>  PACKAGECONFIG[ddcutil] =3D "-DENABLE=5FDDCUTIL=3DON,-DENABLE=5FDDCUT=
IL=3DOFF,ddcutil"
> -PACKAGECONFIG[drm-amdgpu] =3D "-DENABLE=5FDRM=5FAMDGPU=3DON,-DENABLE=
=5FDRM=5FAMDGPU=3DOFF,"
>  PACKAGECONFIG[drm] =3D "-DENABLE=5FDRM=3DON,-DENABLE=5FDRM=3DOFF,lib=
drm"
>  PACKAGECONFIG[egl] =3D "-DENABLE=5FEGL=3DON,-DENABLE=5FEGL=3DOFF,vir=
tual/egl"
>  PACKAGECONFIG[elf] =3D "-DENABLE=5FELF=3DON,-DENABLE=5FELF=3DOFF,elf=
utils"
> @@ -49,7 +49,8 @@ PACKAGECONFIG[opencl] =3D "-DENABLE=5FOPENCL=3DON,-=
DENABLE=5FOPENCL=3DOFF,opencl-headers v
>  PACKAGECONFIG[pulseaudio] =3D "-DENABLE=5FPULSE=3DON,-DENABLE=5FPULS=
E=3DOFF,pulseaudio"
>  PACKAGECONFIG[rpm] =3D "-DENABLE=5FRPM=3DON,-DENABLE=5FRPM=3DOFF,rpm=
"
>  PACKAGECONFIG[sqlite3] =3D "-DENABLE=5FSQLITE3=3DON,-DENABLE=5FSQLIT=
E3=3DOFF,sqlite3"
> -PACKAGECONFIG[vaapi] =3D "-DENABLE=5FVA=3DON,-DENABLE=5FVA=3DOFF,lib=
va"
> +PACKAGECONFIG[va-drm] =3D "-DENABLE=5FVADRM=3DON,-DENABLE=5FVADRM=3D=
OFF,libva"
> +PACKAGECONFIG[va-x11] =3D "-DENABLE=5FVAX11=3DON,-DENABLE=5FVAX11=3D=
OFF,libva"
>  PACKAGECONFIG[vdpau] =3D "-DENABLE=5FVDPAU=3DON,-DENABLE=5FVDPAU=3DO=
FF,libvdpau"
>  PACKAGECONFIG[vulkan] =3D "-DENABLE=5FVULKAN=3DON,-DENABLE=5FVULKAN=3D=
OFF,vulkan-loader"
>  PACKAGECONFIG[wayland] =3D "-DENABLE=5FWAYLAND=3DON,-DENABLE=5FWAYLA=
ND=3DOFF,wayland"
> @@ -57,7 +58,6 @@ PACKAGECONFIG[xcb] =3D "-DENABLE=5FXCB=5FRANDR=3DON=
,-DENABLE=5FXCB=5FRANDR=3DOFF,libxcb"
>  PACKAGECONFIG[xrandr] =3D "-DENABLE=5FXRANDR=3DON,-DENABLE=5FXRANDR=3D=
OFF,libxrandr"
>  PACKAGECONFIG[zfs] =3D "-DENABLE=5FLIBZFS=3DON,-DENABLE=5FLIBZFS=3DO=
FF,zfs"
>  PACKAGECONFIG[zlib] =3D "-DENABLE=5FZLIB=3DON,-DENABLE=5FZLIB=3DOFF,=
zlib"
> -

Was this an intended whitespace change?


Best regards
Tafil


