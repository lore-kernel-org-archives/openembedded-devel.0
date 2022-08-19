Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6822CC32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 19:26:12 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web09.7220.1660937164532360456
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Aug 2022 12:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hao8hFg+;
 spf=pass (domain: gmail.com, ip: 209.85.128.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-33365a01f29so147277357b3.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Aug 2022 12:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=WqbjgsAki4TXRo6vrv4ObnfzSl+4VeYvNsiLw/GgT54=;
        b=Hao8hFg+mXRnwjKKYiDDmCTByNcotptWwCscl5L3Axg4OwruhWuBfJmUlMB/0fbDl0
         a7nEEkwXRljU2f/CHZN9ke8qHvsoLT9geqkBu1Ss5+fe1c0wSMs4TtwU6q2KS3ZAHEGQ
         8frmsRP2MAs8kj1oVa5nzmOBSnhgpq1pnsGkimUXw5qNNXJnGPQCV7Hmpj2/HHnZqbVX
         tAodcKwX/K40gQR1MkrcbDs4LPB4Tv9bXl/olG/WwNUMDVeJbfNq1a/oo/sxz/2kUnf5
         DH1Hl1WgRq1j4a73979nqQLrn5npL8aqKEJavFT9WahS9afNf3BoilN8cGjeWCgnwIwd
         0nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=WqbjgsAki4TXRo6vrv4ObnfzSl+4VeYvNsiLw/GgT54=;
        b=goZe2a4ggrfSYoG6cBnmuoM0UpK7mU+zX8MKxcFRfeYpPiUkFRMlsyZNjvDDGXgZi/
         wC9cex9BNP1Fn53Daf9alQEhi7feOGHiBPZ6OgSEb2nDoZ2nYE7JpVUBq4bsXA4QHLFP
         agZoxb3iPa/NFoJl7P06w3kSubtwwlnerkpdF5aqHsYzrcnODYuDoWdd9nK1WEE+j2OQ
         ntaV/4C+Z/urzs1G47E+VM5FmR7jJk8t0QsHH09+BFqrrX0AGB4738qB0CiGPNaOKb7y
         3hOOUcUD3n+763+X0hc4fpXKhWndLjhzqIQVCUUgYaT4GB0B8whGAHcnbw5ZUrU/weX2
         bLrw==
X-Gm-Message-State: ACgBeo0CbORr/7pzSnt46LBO4AmKsoX1fDAtN54ABT/uPyEh+xn4HDNV
	5vKrYCxbM2cOXt3YkKEG6aiKJWNbjAU+9Q/inP+BIUTdwIUBhg==
X-Google-Smtp-Source: 
 AA6agR5b7sGrRTvRYA/9Qu/8wCAGwWaAc+DzNSCN1swUROHa50NK+fyyjgShodedNOELQWF+fJE6X9yaLiDwSKqTcO8=
X-Received: by 2002:a0d:dfce:0:b0:333:df91:2483 with SMTP id
 i197-20020a0ddfce000000b00333df912483mr9369718ywe.296.1660937163433; Fri, 19
 Aug 2022 12:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220819170627.17921-1-f_l_k@t-online.de>
 <3XGVGR.QSETXMW5EZ9P3@t-online.de>
In-Reply-To: <3XGVGR.QSETXMW5EZ9P3@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Aug 2022 12:25:37 -0700
Message-ID: 
 <CAMKF1srN34Sqh2-vfEuhiHX7=r01Z-SBGFe=BvJGZAXXG_OCBA@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCHv4] pipewire: update to v0.3.56
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Aug 2022 19:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98334

Thanks for rework. I am seeing a build error on mips

https://errors.yoctoproject.org/Errors/Details/668845/

On Fri, Aug 19, 2022 at 10:08 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> v4 removes a duplicate line
>
> Am Fr, 19. Aug 2022 um 19:06:27 +0200 schrieb Markus Volk <f_l_k@t-online=
.de>:
>
> Add the configuration to make pipewire work as a drop-in replacement for =
pulseaudio-server. Add pipewire-media-session as a standalone recipe, since=
 pipewire would fetch the code as a subproject at do_configure. Signed-off-=
by: Markus Volk <f_l_k@t-online.de> --- .../pipewire/pipewire-media-session=
_0.4.1.bb | 22 +++++++++ .../0001-spa-fix-c90-header-include.patch | 47 ---=
---------------- ...{pipewire_0.3.50.bb =3D> pipewire_0.3.56.bb} | 41 +++++=
++++++----- 3 files changed, 52 insertions(+), 58 deletions(-) create mode =
100644 meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0=
.4.1.bb delete mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipe=
wire/0001-spa-fix-c90-header-include.patch rename meta-multimedia/recipes-m=
ultimedia/pipewire/{pipewire_0.3.50.bb =3D> pipewire_0.3.56.bb} (87%) diff =
--git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_=
0.4.1.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-sessi=
on_0.4.1.bb new file mode 100644 index 000000000..5dd1eb160 --- /dev/null +=
++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4=
.1.bb @@ -0,0 +1,22 @@ +SUMMARY =3D "PipeWire Media Session is an example s=
ession manager for PipeWire" +HOMEPAGE =3D "https://gitlab.freedesktop.org/=
pipewire/media-session" +LICENSE =3D "MIT" + +LIC_FILES_CHKSUM =3D "file://=
COPYING;md5=3D97be96ca4fab23e9657ffa590b931c1a" + +DEPENDS =3D " \ + pipewi=
re \ + alsa-lib \ + dbus \ +" + +RRECOMMENDS:${PN} +=3D "pipewire" + +SRC_U=
RI =3D "git://gitlab.freedesktop.org/pipewire/media-session.git;protocol=3D=
https;branch=3Dmaster" + +S =3D "${WORKDIR}/git" +SRCREV =3D "e5d5cf2404786=
af8bcc40bdb8a2962bef4ec18b6" + +inherit meson pkgconfig + +FILES:${PN} +=3D=
 "${libdir} ${datadir}" diff --git a/meta-multimedia/recipes-multimedia/pip=
ewire/pipewire/0001-spa-fix-c90-header-include.patch b/meta-multimedia/reci=
pes-multimedia/pipewire/pipewire/0001-spa-fix-c90-header-include.patch dele=
ted file mode 100644 index ad6448a10..000000000 --- a/meta-multimedia/recip=
es-multimedia/pipewire/pipewire/0001-spa-fix-c90-header-include.patch +++ /=
dev/null @@ -1,47 +0,0 @@ -From d3ea3142e1a4de206e616bc18f63a529e6b4986a Mo=
n Sep 17 00:00:00 2001 -From: psykose <alice@ayaya.dev> -Date: Wed, 13 Apr =
2022 21:57:49 +0000 -Subject: [PATCH 001/154] spa: fix c90 header include -=
 -placing declarations after code is invalid under ISO c90 - -Fixes !1211 -=
 -Patch-Status: Backport ---- - spa/include/spa/utils/string.h | 6 ++++-- -=
 1 file changed, 4 insertions(+), 2 deletions(-) - -diff --git a/spa/includ=
e/spa/utils/string.h b/spa/include/spa/utils/string.h -index e80434537..43d=
19616c 100644 ---- a/spa/include/spa/utils/string.h -+++ b/spa/include/spa/=
utils/string.h -@@ -276,10 +276,11 @@ static inline int spa_scnprintf(char =
*buffer, size_t size, const char *format, . - static inline float spa_strto=
f(const char *str, char **endptr) - { - static locale_t locale =3D NULL; -+=
 locale_t prev; - float v; - if (SPA_UNLIKELY(locale =3D=3D NULL)) - locale=
 =3D newlocale(LC_ALL_MASK, "C", NULL); -- locale_t prev =3D uselocale(loca=
le); -+ prev =3D uselocale(locale); - v =3D strtof(str, endptr); - uselocal=
e(prev); - return v; -@@ -319,10 +320,11 @@ static inline bool spa_atof(con=
st char *str, float *val) - static inline double spa_strtod(const char *str=
, char **endptr) - { - static locale_t locale =3D NULL; -+ locale_t prev; -=
 double v; - if (SPA_UNLIKELY(locale =3D=3D NULL)) - locale =3D newlocale(L=
C_ALL_MASK, "C", NULL); -- locale_t prev =3D uselocale(locale); -+ prev =3D=
 uselocale(locale); - v =3D strtod(str, endptr); - uselocale(prev); - retur=
n v; --- -2.25.1 - diff --git a/meta-multimedia/recipes-multimedia/pipewire=
/pipewire_0.3.50.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_=
0.3.56.bb similarity index 87% rename from meta-multimedia/recipes-multimed=
ia/pipewire/pipewire_0.3.50.bb rename to meta-multimedia/recipes-multimedia=
/pipewire/pipewire_0.3.56.bb index c176c6eeb..b5ceeb12c 100644 --- a/meta-m=
ultimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb +++ b/meta-multime=
dia/recipes-multimedia/pipewire/pipewire_0.3.56.bb @@ -13,10 +13,9 @@ LIC_F=
ILES_CHKSUM =3D " \ DEPENDS =3D "dbus ncurses" -SRCREV =3D "64cf5e80e624028=
4e6b757907b900507fe56f1b5" +SRCREV =3D "f274e53d25ee8f483ac6fce9e516bb1830a=
be88b" SRC_URI =3D " \ git://gitlab.freedesktop.org/pipewire/pipewire.git;b=
ranch=3Dmaster;protocol=3Dhttps \ - file://0001-spa-fix-c90-header-include.=
patch \ " S =3D "${WORKDIR}/git" @@ -62,7 +61,6 @@ EXTRA_OEMESON +=3D " \ -=
Dudevrulesdir=3D${nonarch_base_libdir}/udev/rules.d/ \ -Dsystemd-system-uni=
t-dir=3D${systemd_system_unitdir} \ -Dsystemd-user-unit-dir=3D${systemd_use=
r_unitdir} \ - -Dvulkan=3Ddisabled \ -Dman=3Ddisabled \ -Dsession-managers=
=3D'[]' \ -Dlv2=3Ddisabled \ @@ -72,12 +70,26 @@ EXTRA_OEMESON +=3D " \ -Dl=
egacy-rtkit=3Dfalse \ " -PACKAGECONFIG:class-target ??=3D "\ +# spa alsa pl=
ugin code uses typedef redefinition, which is officially a C11 feature. +# =
Pipewire builds with 'c_std=3Dgnu99' by default. Recent versions of gcc don=
't issue this warning in gnu99 +# mode but it looks like clang still does +=
CFLAGS:append =3D " -Wno-typedef-redefinition" + +# According to wireplumbe=
r documentation only one session manager should be installed at a time +# P=
ossible options are media-session, which has fewer dependencies but is very=
 simple, +# or wireplumber, which is more powerful. +PIPEWIRE_SESSION_MANAG=
ER ??=3D "media-session" + +BLUETOOTH_AAC =3D "${@bb.utils.contains('LICENS=
E_FLAGS_ACCEPTED', 'commercial', 'bluez-aac', '', d)}" + +PACKAGECONFIG:cla=
ss-target ??=3D " \ + ${@bb.utils.contains('DISTRO_FEATURES', 'gstreamer', =
'gstreamer', 'ffmpeg', d)} \ ${@bb.utils.contains('DISTRO_FEATURES', 'zeroc=
onf', 'avahi', '', d)} \ - ${@bb.utils.contains('DISTRO_FEATURES', 'bluetoo=
th', 'bluez', '', d)} \ - ${@bb.utils.contains('DISTRO_FEATURES', 'systemd'=
, 'systemd systemd-system-service', '', d)} \ - ${@bb.utils.filter('DISTRO_=
FEATURES', 'alsa', d)} \ - gstreamer jack libusb pw-cat raop sndfile v4l2 \=
 + ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez ${BLUETOOTH_=
AAC}', '', d)} \ + ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'syst=
emd systemd-system-service systemd-user-service', '', d)} \ + ${@bb.utils.f=
ilter('DISTRO_FEATURES', 'alsa dbus vulkan pulseaudio', d)} \ + ${PIPEWIRE_=
SESSION_MANAGER} \ + jack libusb pw-cat raop sndfile v4l2 udev volume \ " #=
 "jack" and "pipewire-jack" packageconfigs cannot be both enabled, @@ -96,6=
 +108,8 @@ PACKAGECONFIG[jack] =3D "-Djack=3Denabled,-Djack=3Ddisabled,jack=
,,,pipewire-jack" PACKAGECONFIG[libcamera] =3D "-Dlibcamera=3Denabled,-Dlib=
camera=3Ddisabled,libcamera" PACKAGECONFIG[libcanberra] =3D "-Dlibcanberra=
=3Denabled,-Dlibcanberra=3Ddisabled,libcanberra" PACKAGECONFIG[libusb] =3D =
"-Dlibusb=3Denabled,-Dlibusb=3Ddisabled,libusb" +PACKAGECONFIG[media-sessio=
n] =3D ",,,pipewire-media-session" +PACKAGECONFIG[pulseaudio] =3D "-Dlibpul=
se=3Denabled,-Dlibpulse=3Ddisabled,pulseaudio" PACKAGECONFIG[pipewire-alsa]=
 =3D "-Dpipewire-alsa=3Denabled,-Dpipewire-alsa=3Ddisabled,alsa-lib" PACKAG=
ECONFIG[pipewire-jack] =3D "-Dpipewire-jack=3Denabled -Dlibjack-path=3D${li=
bdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=3Ddisabled,jack,,,jack" PACK=
AGECONFIG[pw-cat] =3D "-Dpw-cat=3Denabled,-Dpw-cat=3Ddisabled" @@ -109,8 +1=
23,12 @@ PACKAGECONFIG[systemd-system-service] =3D "-Dsystemd-system-servic=
e=3Denabled,-Dsyst # currently lacks the feature of enabling user services.=
 PACKAGECONFIG[systemd-user-service] =3D "-Dsystemd-user-service=3Denabled,=
-Dsystemd-user-service=3Ddisabled,systemd" # pw-cat needs sndfile packageco=
nfig to be enabled +PACKAGECONFIG[udev] =3D "-Dudev=3Denabled,-Dudev=3Ddisa=
bled,udev" PACKAGECONFIG[v4l2] =3D "-Dv4l2=3Denabled,-Dv4l2=3Ddisabled,udev=
" +PACKAGECONFIG[volume] =3D "-Dvolume=3Denabled,-Dvolume=3Ddisabled" +PACK=
AGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulkan-header=
s vulkan-loader" PACKAGECONFIG[webrtc-echo-cancelling] =3D "-Decho-cancel-w=
ebrtc=3Denabled,-Decho-cancel-webrtc=3Ddisabled,webrtc-audio-processing" +P=
ACKAGECONFIG[wireplumber] =3D ",,,wireplumber" PACKAGESPLITFUNCS:prepend =
=3D " split_dynamic_packages " PACKAGESPLITFUNCS:append =3D " set_dynamic_m=
etapkg_rdepends " @@ -227,10 +245,11 @@ PACKAGES_DYNAMIC =3D "^${PN}-spa-pl=
ugins.* ^${PN}-modules.*" SYSTEMD_SERVICE:${PN} =3D "${@bb.utils.contains('=
PACKAGECONFIG', 'systemd-system-service', 'pipewire.service', '', d)}" CONF=
FILES:${PN} +=3D "${datadir}/pipewire/pipewire.conf" FILES:${PN} =3D " \ - =
${datadir}/pipewire/pipewire.conf \ - ${systemd_system_unitdir}/pipewire.* =
\ - ${systemd_user_unitdir}/pipewire.* \ + ${datadir}/pipewire \ + ${system=
d_system_unitdir}/pipewire* \ + ${systemd_user_unitdir}/pipewire* \ ${bindi=
r}/pipewire \ + ${bindir}/pipewire-avb \ " FILES:${PN}-dev +=3D " \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98333): https://lists.openembedded.org/g/openembedded=
-devel/message/98333
> Mute This Topic: https://lists.openembedded.org/mt/93129204/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

