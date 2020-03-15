Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
	[209.85.222.179])
	by mail.openembedded.org (Postfix) with ESMTP id D126961C79
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2020 23:27:15 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id f28so23106586qkk.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2020 16:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ikmPX32zqf0weyHVepMr3p5iQMsA8LSQi9dgZLvG91E=;
	b=DPyI2koCIwu1nnC/vTiTLRdX1ErHjLY8bfv0bQ+g9KYeHZsRp9Rp5u2R9aT46GpiAo
	GTHQrGtk/4iNF0fbCjIz6/8g3awWzB4aiswbfkrcpkmrPPoH7i8xZ+7QIhWkuVu4HVFd
	McdPX3XAYlioEoeDnPXQ+ecNVsC2LLBQqLO9YS5kDRf8FlRa03slQYhgLIA61aITinyt
	MhY6jWA+QPFTb6HB2S37qVTEjf769BJza/GliO7/IcMGKHD31saYhEoXL22HUmtczc6O
	ISSj1Ic/FsYiYBgO9Apc1ai7rVLEA5oRuNA9F8reMZy7dPgWnWiNIZK8iV6ZxNNObWIn
	ZCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ikmPX32zqf0weyHVepMr3p5iQMsA8LSQi9dgZLvG91E=;
	b=HBaI4hqcl3ky2BLaDLzS1fUYt/IYC8Jr/ByE0j5jk8kHjPJ+jQPIAMFNzMh/+VB6Uh
	u+w3jcWEtfYu2agldMxQJbnRkCsbvoo/lLF5rIqSeWspgYpZlcuvsdOZarbJmmQARs6+
	du3Eh4tby5HzN+QNaa2kccCGcw4pQwcB/qFJ0O+QYbcIQY0uqyWkqcgp55JDQibRasp/
	VpNbrM27kb5qpMnd48+vD/PI+2IM6CALE/HsKJjHF5/rluzj/s7jYSScouj70Xh9rYXn
	aJ9hafvxVkF9p+mjc6rwJFzYcIEUBJyJct4LL7tIjDukEpdhb+ehb6BPqT6Mya4XRpEZ
	M35A==
X-Gm-Message-State: ANhLgQ12EuDP4txf01OW5xrdx0bKDpTGjOA2eSHyzz051J2ea0cfxhzv
	QE2PER5BFrvV4kKfpTQRjF1ZmOhLqj2ZtRtz8Tc=
X-Google-Smtp-Source: ADFU+vsOqCz33f+0YKFGeHN6RqjzDBnKL95ovzzRdTm7ZsYzd7W9Pgkrt4ZcYTBOJGHbdfqIrJfF9zLZuJ+LFEg794Y=
X-Received: by 2002:a05:620a:15d1:: with SMTP id
	o17mr15976378qkm.165.1584314836218; 
	Sun, 15 Mar 2020 16:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200314220440.5983-1-schnitzeltony@gmail.com>
In-Reply-To: <20200314220440.5983-1-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 Mar 2020 16:26:50 -0700
Message-ID: <CAMKF1sqsq6xMRCRAbNibJP1YeJ-aYyYNyQM_3Ef6KcvSwWLo5A@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/2] pipewire: upgrade 0.2.7 -> 0.3.1
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
X-List-Received-Date: Sun, 15 Mar 2020 23:27:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We need something like below patch to get it going on mips/x86

https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3D0ea5b0d3721d04111310ef6c331cbb3c2d68bd5c

On Sat, Mar 14, 2020 at 3:05 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> * as long as we have not upgradeed mutter to 3.36 we have to keep pipewir=
e
>   0.2.7 as pipewire-0.2 - mutter 3.34 asks for pipewire 0.2
> * license was changed to MIT
> * additional PACKAGECONFIGs added. The defaults were chosen by DISTRO_FEA=
TURES
>   or if not available by pipewire's defaults
> * vulkan was disabled for now
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../pipewire/pipewire-0.2_git.bb              | 65 +++++++++++++++++++
>  .../pipewire/pipewire_git.bb                  | 32 +++++----
>  2 files changed, 86 insertions(+), 11 deletions(-)
>  create mode 100644 meta-oe/recipes-multimedia/pipewire/pipewire-0.2_git.=
bb
>
> diff --git a/meta-oe/recipes-multimedia/pipewire/pipewire-0.2_git.bb b/me=
ta-oe/recipes-multimedia/pipewire/pipewire-0.2_git.bb
> new file mode 100644
> index 000000000..bcb3015f8
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/pipewire/pipewire-0.2_git.bb
> @@ -0,0 +1,65 @@
> +SUMMARY =3D "Multimedia processing server for Linux"
> +AUTHOR =3D "Wim Taymans <wtaymans@redhat.com>"
> +HOMEPAGE =3D "https://pipewire.org"
> +SECTION =3D "multimedia"
> +LICENSE =3D "LGPL-2.1"
> +LIC_FILES_CHKSUM =3D " \
> +    file://LICENSE;md5=3Dd8153c6e65986f862a0550ca74a3ed73 \
> +    file://LGPL;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
> +"
> +DEPENDS =3D "alsa-lib dbus udev"
> +SRCREV =3D "14c11c0fe4d366bad4cfecdee97b6652ff9ed63d"
> +PV =3D "0.2.7"
> +
> +SRC_URI =3D "git://github.com/PipeWire/pipewire"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit meson pkgconfig systemd manpages
> +
> +PACKAGECONFIG ??=3D "\
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> +    gstreamer \
> +"
> +
> +PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd"
> +PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3Denabled,-Dgstreamer=3Ddisabl=
ed,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
> +PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,libxml-parser-pe=
rl-native"
> +
> +PACKAGES =3D+ "\
> +    ${PN}-spa-plugins \
> +    ${PN}-alsa \
> +    ${PN}-config \
> +    gstreamer1.0-${PN} \
> +    lib${PN} \
> +    lib${PN}-modules \
> +"
> +
> +RDEPENDS_lib${PN} +=3D "lib${PN}-modules ${PN}-spa-plugins"
> +
> +FILES_${PN} =3D "\
> +    ${sysconfdir}/pipewire/pipewire.conf \
> +    ${bindir}/pipewire* \
> +    ${systemd_user_unitdir}/* \
> +"
> +FILES_lib${PN} =3D "\
> +    ${libdir}/libpipewire-*.so.* \
> +"
> +FILES_lib${PN}-modules =3D "\
> +    ${libdir}/pipewire-*/* \
> +"
> +FILES_${PN}-spa-plugins =3D "\
> +    ${bindir}/spa-* \
> +    ${libdir}/spa/* \
> +"
> +FILES_${PN}-alsa =3D "\
> +    ${libdir}/alsa-lib/* \
> +    ${datadir}/alsa/alsa.conf.d/50-pipewire.conf \
> +"
> +FILES_gstreamer1.0-${PN} =3D "\
> +    ${libdir}/gstreamer-1.0/* \
> +"
> +
> +CONFFILES_${PN} =3D "\
> +    ${sysconfdir}/pipewire/pipewire.conf \
> +"
> diff --git a/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb b/meta-o=
e/recipes-multimedia/pipewire/pipewire_git.bb
> index bcb3015f8..95da2df09 100644
> --- a/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
> +++ b/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
> @@ -2,14 +2,14 @@ SUMMARY =3D "Multimedia processing server for Linux"
>  AUTHOR =3D "Wim Taymans <wtaymans@redhat.com>"
>  HOMEPAGE =3D "https://pipewire.org"
>  SECTION =3D "multimedia"
> -LICENSE =3D "LGPL-2.1"
> +LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D " \
> -    file://LICENSE;md5=3Dd8153c6e65986f862a0550ca74a3ed73 \
> -    file://LGPL;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
> +    file://LICENSE;md5=3De2c0b7d86d04e716a3c4c9ab34260e69 \
> +    file://COPYING;md5=3D97be96ca4fab23e9657ffa590b931c1a \
>  "
>  DEPENDS =3D "alsa-lib dbus udev"
> -SRCREV =3D "14c11c0fe4d366bad4cfecdee97b6652ff9ed63d"
> -PV =3D "0.2.7"
> +SRCREV =3D "74a1632f0720886d5b3b6c23ee8fcd6c03ca7aac"
> +PV =3D "0.3.1"
>
>  SRC_URI =3D "git://github.com/PipeWire/pipewire"
>
> @@ -18,13 +18,20 @@ S =3D "${WORKDIR}/git"
>  inherit meson pkgconfig systemd manpages
>
>  PACKAGECONFIG ??=3D "\
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> -    gstreamer \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)=
} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio systemd vulkan', d=
)} \
> +    jack gstreamer \
>  "
>
> -PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd"
> -PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3Denabled,-Dgstreamer=3Ddisabl=
ed,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
> +# disable vulkan fo now
> +EXTRA_OEMESON =3D "-Dvulkan=3Dfalse"
> +
> +PACKAGECONFIG[bluez] =3D "-Dbluez5=3Dtrue,-Dbluez5=3Dfalse,bluez5 sbc"
> +PACKAGECONFIG[jack] =3D "-Djack=3Dtrue,-Djack=3Dfalse,jack"
> +PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3Dtrue,-Dgstreamer=3Dfalse,gli=
b-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
>  PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,libxml-parser-pe=
rl-native"
> +PACKAGECONFIG[pulseaudio] =3D "-Dpipewire-pulseaudio=3Dtrue,-Dpipewire-p=
ulseaudio=3Dfalse,pulseaudio"
> +PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd"
>
>  PACKAGES =3D+ "\
>      ${PN}-spa-plugins \
> @@ -33,28 +40,31 @@ PACKAGES =3D+ "\
>      gstreamer1.0-${PN} \
>      lib${PN} \
>      lib${PN}-modules \
> +    lib${PN}-jack \
>  "
>
>  RDEPENDS_lib${PN} +=3D "lib${PN}-modules ${PN}-spa-plugins"
>
>  FILES_${PN} =3D "\
>      ${sysconfdir}/pipewire/pipewire.conf \
> +    ${bindir}/pw-* \
>      ${bindir}/pipewire* \
>      ${systemd_user_unitdir}/* \
>  "
>  FILES_lib${PN} =3D "\
>      ${libdir}/libpipewire-*.so.* \
> +    ${libdir}/libjack-*.so.* \
> +    ${libdir}/libpulse-*.so.* \
>  "
>  FILES_lib${PN}-modules =3D "\
>      ${libdir}/pipewire-*/* \
>  "
>  FILES_${PN}-spa-plugins =3D "\
>      ${bindir}/spa-* \
> -    ${libdir}/spa/* \
> +    ${libdir}/spa-*/* \
>  "
>  FILES_${PN}-alsa =3D "\
>      ${libdir}/alsa-lib/* \
> -    ${datadir}/alsa/alsa.conf.d/50-pipewire.conf \
>  "
>  FILES_gstreamer1.0-${PN} =3D "\
>      ${libdir}/gstreamer-1.0/* \
> --
> 2.21.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

