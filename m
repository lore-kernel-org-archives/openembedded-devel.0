Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C627C00140
	for <webhook@archiver.kernel.org>; Sun, 21 Aug 2022 12:49:38 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.6276.1661086167606752592
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Aug 2022 05:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=cUNyGizH;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1661086168;
  x=1692622168;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=DujL5ipJmZoB/GZWiOkeIBy8Hbf6nXeGf/nkJIXKmIE=;
  b=cUNyGizHJCDEqHIxH63WG06V9zVxnBkrrlq40Vy4hGI6jZnPtmNHit3y
   VJihxnmRMIYSXSrE9QEibY71obk5n7Llm0ho1/Z7GF1g1GyDzKc3KidUA
   5rzTAaS1XQML4s+4dlM4ZhAIaierZjDSMsx/omXb6JUsPn0eMQpaeLygV
   4L2rwSF3EoOwXn3IkYk3my4gPz6RBAPmu8sWgtjJOkaKK7k+eMXE2VqhU
   t/YcYKgRIcnICQHr0+H4gBAMRVqTTjcqP/HhhcflsfBmOB+3+6FXsWI7u
   bjYM3YSxCXQJTxz9gt5brLodvDN4RIIXVHJNLfry1BkmNA887vkM0jh64
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Markus Volk <f_l_k@t-online.de>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-multimedia][PATCHv7] pipewire: update to v0.3.56
Thread-Topic: [oe] [meta-multimedia][PATCHv7] pipewire: update to v0.3.56
Thread-Index: AQHYtMi/yjgmzJ1YBkyhpXp9hjuVfa25SRFQ
Date: Sun, 21 Aug 2022 12:49:24 +0000
Message-ID: <52f6ee030dbf4e88a86e3702a5303d57@axis.com>
References: <20220820191150.5699-1-f_l_k@t-online.de>
In-Reply-To: <20220820191150.5699-1-f_l_k@t-online.de>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Aug 2022 12:49:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98345

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Markus Volk
> Sent: den 20 augusti 2022 21:12
> To: openembedded-devel@lists.openembedded.org
> Cc: Markus Volk <f_l_k@t-online.de>
> Subject: [oe] [meta-multimedia][PATCHv7] pipewire: update to v0.3.56
>=20
> Add the configuration to make pipewire work as a drop-in replacement for
> pulseaudio-server.
>=20
> Add pipewire-media-session as a standalone recipe, since pipewire would f=
etch the code as a
> subproject at do_configure.
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../pipewire/pipewire-media-session_0.4.1.bb  | 22 +++++++++
>  ...01-avb-fix-compilation-on-big-endian.patch | 27 +++++++++++
>  .../0001-spa-fix-c90-header-include.patch     | 47 -------------------
>  ...{pipewire_0.3.50.bb =3D> pipewire_0.3.56.bb} | 43 ++++++++++++-----
>  4 files changed, 81 insertions(+), 58 deletions(-)
>  create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire-=
media-session_0.4.1.bb
>  create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/=
0001-avb-fix-compilation-on-big-endian.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/=
0001-spa-fix-c90-header-include.patch
>  rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.50.bb =
=3D> pipewire_0.3.56.bb} (87%)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-s=
ession_0.4.1.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-medi=
a-session_0.4.1.bb
> new file mode 100644
> index 000000000..5dd1eb160
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-
> session_0.4.1.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "PipeWire Media Session is an example session manager for Pi=
peWire"
> +HOMEPAGE =3D "https://gitlab.freedesktop.org/pipewire/media-session"
> +LICENSE =3D "MIT"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D97be96ca4fab23e9657ffa590b931=
c1a"
> +
> +DEPENDS =3D " \
> +	pipewire \
> +	alsa-lib \
> +	dbus \
> +"
> +
> +RRECOMMENDS:${PN} +=3D "pipewire"

Runtime dependencies typically go at the end of the recipe.

> +
> +SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/media-session.git;pro=
tocol=3Dhttps;branch=3Dmaster"
> +
> +S =3D "${WORKDIR}/git"
> +SRCREV =3D "e5d5cf2404786af8bcc40bdb8a2962bef4ec18b6"
> +
> +inherit meson pkgconfig
> +
> +FILES:${PN} +=3D "${libdir} ${datadir}"

These are very broad. It helps to be a bit more specific.

[cut]

> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
> similarity index 87%
> rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.b=
b
> rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
> index c176c6eeb..421c18fa0 100644
> --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
> @@ -6,6 +6,7 @@ AUTHOR      =3D "Wim Taymans <wtaymans@redhat.com>"
>  SECTION     =3D "multimedia"
>=20
>  LICENSE =3D "MIT & LGPL-2.1-or-later & GPL-2.0-only"
> +LICENSE_FLAGS =3D "commercial"

AFAIU, this only applies if ffmpeg is used, so rather than doing this,=20
you should check if "commercial" is in LICENSE_FLAGS_ACCEPTED before=20
automatically adding ffmpeg to PACKAGECONFIGS, similar to what you do=20
with BLUETOOTH_AAC below.

>  LIC_FILES_CHKSUM =3D " \
>      file://LICENSE;md5=3D2158739e172e58dc9ab1bdd2d6ec9c72 \
>      file://COPYING;md5=3D97be96ca4fab23e9657ffa590b931c1a \
> @@ -13,10 +14,10 @@ LIC_FILES_CHKSUM =3D " \
>=20
>  DEPENDS =3D "dbus ncurses"
>=20
> -SRCREV =3D "64cf5e80e6240284e6b757907b900507fe56f1b5"
> +SRCREV =3D "f274e53d25ee8f483ac6fce9e516bb1830abe88b"
>  SRC_URI =3D " \
>=20
> 	git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3Dmaster;proto=
col=3Dhttps \
> -	file://0001-spa-fix-c90-header-include.patch \
> +	file://0001-avb-fix-compilation-on-big-endian.patch \
>  "
>=20
>  S =3D "${WORKDIR}/git"
> @@ -62,7 +63,6 @@ EXTRA_OEMESON +=3D " \
>      -Dudevrulesdir=3D${nonarch_base_libdir}/udev/rules.d/ \
>      -Dsystemd-system-unit-dir=3D${systemd_system_unitdir} \
>      -Dsystemd-user-unit-dir=3D${systemd_user_unitdir} \
> -    -Dvulkan=3Ddisabled \
>      -Dman=3Ddisabled \
>      -Dsession-managers=3D'[]' \
>      -Dlv2=3Ddisabled \
> @@ -72,12 +72,26 @@ EXTRA_OEMESON +=3D " \
>      -Dlegacy-rtkit=3Dfalse \
>  "
>=20
> -PACKAGECONFIG:class-target ??=3D "\
> +# spa alsa plugin code uses typedef redefinition, which is officially a =
C11 feature.
> +# Pipewire builds with 'c_std=3Dgnu99' by default. Recent versions of gc=
c don't issue this warning in gnu99
> +# mode but it looks like clang still does
> +CFLAGS:append =3D " -Wno-typedef-redefinition"
> +
> +# According to wireplumber documentation only one session manager should=
 be installed at a time
> +# Possible options are media-session, which has fewer dependencies but i=
s very simple,
> +# or wireplumber, which is more powerful.
> +PIPEWIRE_SESSION_MANAGER ??=3D "media-session"
> +
> +BLUETOOTH_AAC =3D "${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'comme=
rcial', 'bluez-aac', '', d)}"
> +
> +PACKAGECONFIG:class-target ??=3D " \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'gstreamer', 'gstreamer', 'f=
fmpeg', d)} \

AFAIK, there are no current examples of "gstreamer" being used a=20
distro feature. What is it supposed to mean? When is it supposed to=20
be used? Why is it needed?

>      ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}=
 \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)=
} \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-=
system-service', '', d)} \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)} \
> -    gstreamer jack libusb pw-cat raop sndfile v4l2 \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez ${BLUETO=
OTH_AAC}', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-=
system-service systemd-user-service', '', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa vulkan pulseaudio', d)} =
\
> +    ${PIPEWIRE_SESSION_MANAGER} \
> +    jack libusb pw-cat raop sndfile v4l2 udev volume \
>  "
>=20
>  # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
> @@ -96,6 +110,8 @@ PACKAGECONFIG[jack] =3D "-Djack=3Denabled,-Djack=3Ddis=
abled,jack,,,pipewire-jack"
>  PACKAGECONFIG[libcamera] =3D "-Dlibcamera=3Denabled,-Dlibcamera=3Ddisabl=
ed,libcamera"
>  PACKAGECONFIG[libcanberra] =3D "-Dlibcanberra=3Denabled,-Dlibcanberra=3D=
disabled,libcanberra"
>  PACKAGECONFIG[libusb] =3D "-Dlibusb=3Denabled,-Dlibusb=3Ddisabled,libusb=
"
> +PACKAGECONFIG[media-session] =3D ",,,pipewire-media-session"
> +PACKAGECONFIG[pulseaudio] =3D "-Dlibpulse=3Denabled,-Dlibpulse=3Ddisable=
d,pulseaudio"
>  PACKAGECONFIG[pipewire-alsa] =3D "-Dpipewire-alsa=3Denabled,-Dpipewire-a=
lsa=3Ddisabled,alsa-lib"
>  PACKAGECONFIG[pipewire-jack] =3D "-Dpipewire-jack=3Denabled -Dlibjack-pa=
th=3D${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=3Ddisabled,jack,,,j=
ack"
>  PACKAGECONFIG[pw-cat] =3D "-Dpw-cat=3Denabled,-Dpw-cat=3Ddisabled"
> @@ -109,8 +125,12 @@ PACKAGECONFIG[systemd-system-service] =3D "-Dsystemd=
-system-service=3Denabled,-Dsyst
>  # currently lacks the feature of enabling user services.
>  PACKAGECONFIG[systemd-user-service] =3D "-Dsystemd-user-service=3Denable=
d,-Dsystemd-user-service=3Ddisabled,systemd"
>  # pw-cat needs sndfile packageconfig to be enabled
> +PACKAGECONFIG[udev] =3D "-Dudev=3Denabled,-Dudev=3Ddisabled,udev"
>  PACKAGECONFIG[v4l2] =3D "-Dv4l2=3Denabled,-Dv4l2=3Ddisabled,udev"
> +PACKAGECONFIG[volume] =3D "-Dvolume=3Denabled,-Dvolume=3Ddisabled"
> +PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulkan=
-headers vulkan-loader"
>  PACKAGECONFIG[webrtc-echo-cancelling] =3D "-Decho-cancel-webrtc=3Denable=
d,-Decho-cancel-webrtc=3Ddisabled,webrtc-audio-processing"
> +PACKAGECONFIG[wireplumber] =3D ",,,wireplumber"
>=20
>  PACKAGESPLITFUNCS:prepend =3D " split_dynamic_packages "
>  PACKAGESPLITFUNCS:append =3D " set_dynamic_metapkg_rdepends "
> @@ -227,10 +247,11 @@ PACKAGES_DYNAMIC =3D "^${PN}-spa-plugins.* ^${PN}-m=
odules.*"
>  SYSTEMD_SERVICE:${PN} =3D "${@bb.utils.contains('PACKAGECONFIG', 'system=
d-system-service', 'pipewire.service', '', d)}"
>  CONFFILES:${PN} +=3D "${datadir}/pipewire/pipewire.conf"
>  FILES:${PN} =3D " \
> -    ${datadir}/pipewire/pipewire.conf \
> -    ${systemd_system_unitdir}/pipewire.* \
> -    ${systemd_user_unitdir}/pipewire.* \
> +    ${datadir}/pipewire \
> +    ${systemd_system_unitdir}/pipewire* \
> +    ${systemd_user_unitdir}/pipewire* \
>      ${bindir}/pipewire \
> +    ${bindir}/pipewire-avb \
>  "
>=20
>  FILES:${PN}-dev +=3D " \
> --
> 2.34.1

//Peter


