Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1430EC25B08
	for <webhook@archiver.kernel.org>; Sat, 20 Aug 2022 15:17:08 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web09.7530.1661008622137683259
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Aug 2022 08:17:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ux6TgVMk;
 spf=pass (domain: gmail.com, ip: 209.85.128.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-3378303138bso150224747b3.9
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Aug 2022 08:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=rI0LFwVCBi+LAt5KTf+rSBvZL5hkVr2aVakJAnXcxko=;
        b=Ux6TgVMk/8o5DZR4lwOFGd7ABnKMZ9anVZOB8iWivvIKnmqpj4i1oDmoJLtsZSyHUE
         cakPMnXW7GSPNAcOM95rQhmms3BbRn+IX0OqzeEhecnNDLNYEnez+TExJuDXRDwF1Ovz
         acpp23l5RUAhrOnO4HdrWRcX6Dal57HQixnoPTWT6BjVwnmuuUY7t3gRblBX+AG+0PiG
         gnmSCM1esnrzVGjCNT4VZ1lkhQvAKrfgD+psCC910najBLtBYG4505t8xZVkVK96rhTW
         ntGHBQhLUlZhB+WDjwVFsjWsqqZAmBQT04kGcQvKqgcK/JEoVazRxh0bvPeYkFYS8kv5
         4Ofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=rI0LFwVCBi+LAt5KTf+rSBvZL5hkVr2aVakJAnXcxko=;
        b=u9AjNGAR0oLZQvTTwCi3dY5Ok5QoKvQuvLGMie6wG/7OQb9Zxnm4jxR2v5XB/vgRgT
         VNuFtdJbGOg4Ddc/CAqdgsghlCiIxMUzcP7nXd6k8xwsZU9BAFQWQHX+OcIKXHHMsy5C
         WYzBuA7KsPr3M+6aT8xUIg6Kq2OrVFm1HQYMaLg9+ODyhePPwIdp/b3XCKXOGkjyunFO
         FJBMUgueABD8eoOh6nJMhcHzUQm4Iq6Qt4ZDQcbQOJ5gowmdpyBDcnl+fBQ/A2+izJW9
         ZW40R4tYD/8K3kaGRgaeb5y+HDnKh89ovnJgMCz5wDMwZ05/Zn3XqOQcWnqtUuxccpMn
         Isjg==
X-Gm-Message-State: ACgBeo1DZwQ4FRW3a3jYMJI3dPYUIPc36s6S4U4JrRDnhk4jaqpz5J2y
	s5j5vAhoFUx5rKPhjRydNXl517F4nO+/Ub66KJU=
X-Google-Smtp-Source: 
 AA6agR4AY03S5mHLKUZEUN4IiIFZUi2iTgO39zsOumuQ5h6U4Tmj2mmeKsXHoK5od9WSqKwg4oL9VKZ3XT+iO8X2vIM=
X-Received: by 2002:a25:db42:0:b0:695:8d22:3a8e with SMTP id
 g63-20020a25db42000000b006958d223a8emr696342ybf.428.1661008621203; Sat, 20
 Aug 2022 08:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220819170627.17921-1-f_l_k@t-online.de>
 <3XGVGR.QSETXMW5EZ9P3@t-online.de>
 <CAMKF1srN34Sqh2-vfEuhiHX7=r01Z-SBGFe=BvJGZAXXG_OCBA@mail.gmail.com>
 <NJOVGR.P1NUBIBD0XBA@t-online.de>
In-Reply-To: <NJOVGR.P1NUBIBD0XBA@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Aug 2022 08:16:34 -0700
Message-ID: 
 <CAMKF1sqmeKm3ymqAkCNdjL75iaZ9CBSV_oXw_uWjyYqC9a1oHg@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCHv4] pipewire: update to v0.3.56
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Aug 2022 15:17:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98338

ffmpeg dependency need to express in LICENSE_FLAGS too see

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1927/step=
s/11/logs/errors

adding something like this is needed

LICENSE_FLAGS =3D "commercial"

On Fri, Aug 19, 2022 at 12:52 PM Markus Volk <f_l_k@t-online.de> wrote:
>
> i've added a backport patch that should hopefully fix this issue
>
> Am Fr, 19. Aug 2022 um 12:25:37 -0700 schrieb Khem Raj <raj.khem@gmail.co=
m>:
>
> Thanks for rework. I am seeing a build error on mips https://errors.yocto=
project.org/Errors/Details/668845/ On Fri, Aug 19, 2022 at 10:08 AM Markus =
Volk <f_l_k@t-online.de> wrote:
>
> v4 removes a duplicate line Am Fr, 19. Aug 2022 um 19:06:27 +0200 schrieb=
 Markus Volk <f_l_k@t-online.de>: Add the configuration to make pipewire wo=
rk as a drop-in replacement for pulseaudio-server. Add pipewire-media-sessi=
on as a standalone recipe, since pipewire would fetch the code as a subproj=
ect at do_configure. Signed-off-by: Markus Volk <f_l_k@t-online.de> --- ...=
/pipewire/pipewire-media-session_0.4.1.bb | 22 +++++++++ .../0001-spa-fix-c=
90-header-include.patch | 47 ------------------- ...{pipewire_0.3.50.bb =3D=
> pipewire_0.3.56.bb} | 41 +++++++++++----- 3 files changed, 52 insertions(=
+), 58 deletions(-) create mode 100644 meta-multimedia/recipes-multimedia/p=
ipewire/pipewire-media-session_0.4.1.bb delete mode 100644 meta-multimedia/=
recipes-multimedia/pipewire/pipewire/0001-spa-fix-c90-header-include.patch =
rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.50.bb =3D>=
 pipewire_0.3.56.bb} (87%) diff --git a/meta-multimedia/recipes-multimedia/=
pipewire/pipewire-media-session_0.4.1.bb b/meta-multimedia/recipes-multimed=
ia/pipewire/pipewire-media-session_0.4.1.bb new file mode 100644 index 0000=
00000..5dd1eb160 --- /dev/null +++ b/meta-multimedia/recipes-multimedia/pip=
ewire/pipewire-media-session_0.4.1.bb @@ -0,0 +1,22 @@ +SUMMARY =3D "PipeWi=
re Media Session is an example session manager for PipeWire" +HOMEPAGE =3D =
"https://gitlab.freedesktop.org/pipewire/media-session" +LICENSE =3D "MIT" =
+ +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D97be96ca4fab23e9657ffa590b931=
c1a" + +DEPENDS =3D " \ + pipewire \ + alsa-lib \ + dbus \ +" + +RRECOMMEND=
S:${PN} +=3D "pipewire" + +SRC_URI =3D "git://gitlab.freedesktop.org/pipewi=
re/media-session.git;protocol=3Dhttps;branch=3Dmaster" + +S =3D "${WORKDIR}=
/git" +SRCREV =3D "e5d5cf2404786af8bcc40bdb8a2962bef4ec18b6" + +inherit mes=
on pkgconfig + +FILES:${PN} +=3D "${libdir} ${datadir}" diff --git a/meta-m=
ultimedia/recipes-multimedia/pipewire/pipewire/0001-spa-fix-c90-header-incl=
ude.patch b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-f=
ix-c90-header-include.patch deleted file mode 100644 index ad6448a10..00000=
0000 --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-fi=
x-c90-header-include.patch +++ /dev/null @@ -1,47 +0,0 @@ -From d3ea3142e1a=
4de206e616bc18f63a529e6b4986a Mon Sep 17 00:00:00 2001 -From: psykose <alic=
e@ayaya.dev> -Date: Wed, 13 Apr 2022 21:57:49 +0000 -Subject: [PATCH 001/15=
4] spa: fix c90 header include - -placing declarations after code is invali=
d under ISO c90 - -Fixes !1211 - -Patch-Status: Backport ---- - spa/include=
/spa/utils/string.h | 6 ++++-- - 1 file changed, 4 insertions(+), 2 deletio=
ns(-) - -diff --git a/spa/include/spa/utils/string.h b/spa/include/spa/util=
s/string.h -index e80434537..43d19616c 100644 ---- a/spa/include/spa/utils/=
string.h -+++ b/spa/include/spa/utils/string.h -@@ -276,10 +276,11 @@ stati=
c inline int spa_scnprintf(char *buffer, size_t size, const char *format, .=
 - static inline float spa_strtof(const char *str, char **endptr) - { - sta=
tic locale_t locale =3D NULL; -+ locale_t prev; - float v; - if (SPA_UNLIKE=
LY(locale =3D=3D NULL)) - locale =3D newlocale(LC_ALL_MASK, "C", NULL); -- =
locale_t prev =3D uselocale(locale); -+ prev =3D uselocale(locale); - v =3D=
 strtof(str, endptr); - uselocale(prev); - return v; -@@ -319,10 +320,11 @@=
 static inline bool spa_atof(const char *str, float *val) - static inline d=
ouble spa_strtod(const char *str, char **endptr) - { - static locale_t loca=
le =3D NULL; -+ locale_t prev; - double v; - if (SPA_UNLIKELY(locale =3D=3D=
 NULL)) - locale =3D newlocale(LC_ALL_MASK, "C", NULL); -- locale_t prev =
=3D uselocale(locale); -+ prev =3D uselocale(locale); - v =3D strtod(str, e=
ndptr); - uselocale(prev); - return v; --- -2.25.1 - diff --git a/meta-mult=
imedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb b/meta-multimedia/rec=
ipes-multimedia/pipewire/pipewire_0.3.56.bb similarity index 87% rename fro=
m meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb rename to =
meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb index c176c6=
eeb..b5ceeb12c 100644 --- a/meta-multimedia/recipes-multimedia/pipewire/pip=
ewire_0.3.50.bb +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_=
0.3.56.bb @@ -13,10 +13,9 @@ LIC_FILES_CHKSUM =3D " \ DEPENDS =3D "dbus ncu=
rses" -SRCREV =3D "64cf5e80e6240284e6b757907b900507fe56f1b5" +SRCREV =3D "f=
274e53d25ee8f483ac6fce9e516bb1830abe88b" SRC_URI =3D " \ git://gitlab.freed=
esktop.org/pipewire/pipewire.git;branch=3Dmaster;protocol=3Dhttps \ - file:=
//0001-spa-fix-c90-header-include.patch \ " S =3D "${WORKDIR}/git" @@ -62,7=
 +61,6 @@ EXTRA_OEMESON +=3D " \ -Dudevrulesdir=3D${nonarch_base_libdir}/ud=
ev/rules.d/ \ -Dsystemd-system-unit-dir=3D${systemd_system_unitdir} \ -Dsys=
temd-user-unit-dir=3D${systemd_user_unitdir} \ - -Dvulkan=3Ddisabled \ -Dma=
n=3Ddisabled \ -Dsession-managers=3D'[]' \ -Dlv2=3Ddisabled \ @@ -72,12 +70=
,26 @@ EXTRA_OEMESON +=3D " \ -Dlegacy-rtkit=3Dfalse \ " -PACKAGECONFIG:cla=
ss-target ??=3D "\ +# spa alsa plugin code uses typedef redefinition, which=
 is officially a C11 feature. +# Pipewire builds with 'c_std=3Dgnu99' by de=
fault. Recent versions of gcc don't issue this warning in gnu99 +# mode but=
 it looks like clang still does +CFLAGS:append =3D " -Wno-typedef-redefinit=
ion" + +# According to wireplumber documentation only one session manager s=
hould be installed at a time +# Possible options are media-session, which h=
as fewer dependencies but is very simple, +# or wireplumber, which is more =
powerful. +PIPEWIRE_SESSION_MANAGER ??=3D "media-session" + +BLUETOOTH_AAC =
=3D "${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'bluez-aa=
c', '', d)}" + +PACKAGECONFIG:class-target ??=3D " \ + ${@bb.utils.contains=
('DISTRO_FEATURES', 'gstreamer', 'gstreamer', 'ffmpeg', d)} \ ${@bb.utils.c=
ontains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \ - ${@bb.utils.con=
tains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \ - ${@bb.utils.cont=
ains('DISTRO_FEATURES', 'systemd', 'systemd systemd-system-service', '', d)=
} \ - ${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)} \ - gstreamer jack =
libusb pw-cat raop sndfile v4l2 \ + ${@bb.utils.contains('DISTRO_FEATURES',=
 'bluetooth', 'bluez ${BLUETOOTH_AAC}', '', d)} \ + ${@bb.utils.contains('D=
ISTRO_FEATURES', 'systemd', 'systemd systemd-system-service systemd-user-se=
rvice', '', d)} \ + ${@bb.utils.filter('DISTRO_FEATURES', 'alsa dbus vulkan=
 pulseaudio', d)} \ + ${PIPEWIRE_SESSION_MANAGER} \ + jack libusb pw-cat ra=
op sndfile v4l2 udev volume \ " # "jack" and "pipewire-jack" packageconfigs=
 cannot be both enabled, @@ -96,6 +108,8 @@ PACKAGECONFIG[jack] =3D "-Djack=
=3Denabled,-Djack=3Ddisabled,jack,,,pipewire-jack" PACKAGECONFIG[libcamera]=
 =3D "-Dlibcamera=3Denabled,-Dlibcamera=3Ddisabled,libcamera" PACKAGECONFIG=
[libcanberra] =3D "-Dlibcanberra=3Denabled,-Dlibcanberra=3Ddisabled,libcanb=
erra" PACKAGECONFIG[libusb] =3D "-Dlibusb=3Denabled,-Dlibusb=3Ddisabled,lib=
usb" +PACKAGECONFIG[media-session] =3D ",,,pipewire-media-session" +PACKAGE=
CONFIG[pulseaudio] =3D "-Dlibpulse=3Denabled,-Dlibpulse=3Ddisabled,pulseaud=
io" PACKAGECONFIG[pipewire-alsa] =3D "-Dpipewire-alsa=3Denabled,-Dpipewire-=
alsa=3Ddisabled,alsa-lib" PACKAGECONFIG[pipewire-jack] =3D "-Dpipewire-jack=
=3Denabled -Dlibjack-path=3D${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-j=
ack=3Ddisabled,jack,,,jack" PACKAGECONFIG[pw-cat] =3D "-Dpw-cat=3Denabled,-=
Dpw-cat=3Ddisabled" @@ -109,8 +123,12 @@ PACKAGECONFIG[systemd-system-servi=
ce] =3D "-Dsystemd-system-service=3Denabled,-Dsyst # currently lacks the fe=
ature of enabling user services. PACKAGECONFIG[systemd-user-service] =3D "-=
Dsystemd-user-service=3Denabled,-Dsystemd-user-service=3Ddisabled,systemd" =
# pw-cat needs sndfile packageconfig to be enabled +PACKAGECONFIG[udev] =3D=
 "-Dudev=3Denabled,-Dudev=3Ddisabled,udev" PACKAGECONFIG[v4l2] =3D "-Dv4l2=
=3Denabled,-Dv4l2=3Ddisabled,udev" +PACKAGECONFIG[volume] =3D "-Dvolume=3De=
nabled,-Dvolume=3Ddisabled" +PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,=
-Dvulkan=3Ddisabled,vulkan-headers vulkan-loader" PACKAGECONFIG[webrtc-echo=
-cancelling] =3D "-Decho-cancel-webrtc=3Denabled,-Decho-cancel-webrtc=3Ddis=
abled,webrtc-audio-processing" +PACKAGECONFIG[wireplumber] =3D ",,,wireplum=
ber" PACKAGESPLITFUNCS:prepend =3D " split_dynamic_packages " PACKAGESPLITF=
UNCS:append =3D " set_dynamic_metapkg_rdepends " @@ -227,10 +245,11 @@ PACK=
AGES_DYNAMIC =3D "^${PN}-spa-plugins.* ^${PN}-modules.*" SYSTEMD_SERVICE:${=
PN} =3D "${@bb.utils.contains('PACKAGECONFIG', 'systemd-system-service', 'p=
ipewire.service', '', d)}" CONFFILES:${PN} +=3D "${datadir}/pipewire/pipewi=
re.conf" FILES:${PN} =3D " \ - ${datadir}/pipewire/pipewire.conf \ - ${syst=
emd_system_unitdir}/pipewire.* \ - ${systemd_user_unitdir}/pipewire.* \ + $=
{datadir}/pipewire \ + ${systemd_system_unitdir}/pipewire* \ + ${systemd_us=
er_unitdir}/pipewire* \ ${bindir}/pipewire \ + ${bindir}/pipewire-avb \ " F=
ILES:${PN}-dev +=3D " \ -- 2.34.1
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all mess=
ages sent to this group. View/Reply Online (#98334): https://lists.openembe=
dded.org/g/openembedded-devel/message/98334 Mute This Topic: https://lists.=
openembedded.org/mt/93129204/3618223 Group Owner: openembedded-devel+owner@=
lists.openembedded.org Unsubscribe: https://lists.openembedded.org/g/openem=
bedded-devel/unsub [f_l_k@t-online.de] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-

