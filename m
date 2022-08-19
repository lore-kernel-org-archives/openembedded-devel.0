Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B90EC32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 19:52:52 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.7557.1660938764900014188
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Aug 2022 12:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82,
 mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout05.t-online.de (Postfix) with SMTP id AF874A426;
	Fri, 19 Aug 2022 21:52:41 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.43.141]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oP82r-0lclAO0; Fri, 19 Aug 2022 21:52:41 +0200
Date: Fri, 19 Aug 2022 21:52:35 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCHv4] pipewire: update to v0.3.56
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <NJOVGR.P1NUBIBD0XBA@t-online.de>
In-Reply-To: 
	<CAMKF1srN34Sqh2-vfEuhiHX7=r01Z-SBGFe=BvJGZAXXG_OCBA@mail.gmail.com>
References: <20220819170627.17921-1-f_l_k@t-online.de>
	<3XGVGR.QSETXMW5EZ9P3@t-online.de>
	<CAMKF1srN34Sqh2-vfEuhiHX7=r01Z-SBGFe=BvJGZAXXG_OCBA@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-9R93Vm4o2bC5e6eTFVrF"
X-TOI-EXPURGATEID: 150726::1660938761-01452558-1CD6F998/0/0 CLEAN NORMAL
X-TOI-MSGID: 13a1dd45-776d-4c78-9b0c-7ea131b5139b
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Aug 2022 19:52:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98336

--=-9R93Vm4o2bC5e6eTFVrF
Content-Type: text/plain; charset=us-ascii; format=flowed

i've added a backport patch that should hopefully fix this issue

Am Fr, 19. Aug 2022 um 12:25:37 -0700 schrieb Khem Raj 
<raj.khem@gmail.com>:
> Thanks for rework. I am seeing a build error on mips
> 
> <https://errors.yoctoproject.org/Errors/Details/668845/>
> 
> On Fri, Aug 19, 2022 at 10:08 AM Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>> wrote:
>> 
>>  v4 removes a duplicate line
>> 
>>  Am Fr, 19. Aug 2022 um 19:06:27 +0200 schrieb Markus Volk 
>> <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>:
>> 
>>  Add the configuration to make pipewire work as a drop-in 
>> replacement for pulseaudio-server. Add pipewire-media-session as a 
>> standalone recipe, since pipewire would fetch the code as a 
>> subproject at do_configure. Signed-off-by: Markus Volk 
>> <f_l_k@t-online.de <mailto:f_l_k@t-online.de>> --- 
>> .../pipewire/pipewire-media-session_0.4.1.bb | 22 +++++++++ 
>> .../0001-spa-fix-c90-header-include.patch | 47 ------------------- 
>> ...{pipewire_0.3.50.bb => pipewire_0.3.56.bb} | 41 +++++++++++----- 
>> 3 files changed, 52 insertions(+), 58 deletions(-) create mode 
>> 100644 
>> meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb 
>> delete mode 100644 
>> meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-fix-c90-header-include.patch 
>> rename 
>> meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.50.bb => 
>> pipewire_0.3.56.bb} (87%) diff --git 
>> a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb 
>> b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb 
>> new file mode 100644 index 000000000..5dd1eb160 --- /dev/null +++ 
>> b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb 
>> @@ -0,0 +1,22 @@ +SUMMARY = "PipeWire Media Session is an example 
>> session manager for PipeWire" +HOMEPAGE = 
>> "https://gitlab.freedesktop.org/pipewire/media-session" +LICENSE = 
>> "MIT" + +LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a" + +DEPENDS = " 
>> \ + pipewire \ + alsa-lib \ + dbus \ +" + +RRECOMMENDS:${PN} += 
>> "pipewire" + +SRC_URI = 
>> "git://gitlab.freedesktop.org/pipewire/media-session.git;protocol=https;branch=master" 
>> + +S = "${WORKDIR}/git" +SRCREV = 
>> "e5d5cf2404786af8bcc40bdb8a2962bef4ec18b6" + +inherit meson 
>> pkgconfig + +FILES:${PN} += "${libdir} ${datadir}" diff --git 
>> a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-fix-c90-header-include.patch 
>> b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-fix-c90-header-include.patch 
>> deleted file mode 100644 index ad6448a10..000000000 --- 
>> a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-fix-c90-header-include.patch 
>> +++ /dev/null @@ -1,47 +0,0 @@ -From 
>> d3ea3142e1a4de206e616bc18f63a529e6b4986a Mon Sep 17 00:00:00 2001 
>> -From: psykose <alice@ayaya.dev> -Date: Wed, 13 Apr 2022 21:57:49 
>> +0000 -Subject: [PATCH 001/154] spa: fix c90 header include - 
>> -placing declarations after code is invalid under ISO c90 - -Fixes 
>> !1211 - -Patch-Status: Backport ---- - 
>> spa/include/spa/utils/string.h | 6 ++++-- - 1 file changed, 4 
>> insertions(+), 2 deletions(-) - -diff --git 
>> a/spa/include/spa/utils/string.h b/spa/include/spa/utils/string.h 
>> -index e80434537..43d19616c 100644 ---- 
>> a/spa/include/spa/utils/string.h -+++ 
>> b/spa/include/spa/utils/string.h -@@ -276,10 +276,11 @@ static 
>> inline int spa_scnprintf(char *buffer, size_t size, const char 
>> *format, . - static inline float spa_strtof(const char *str, char 
>> **endptr) - { - static locale_t locale = NULL; -+ locale_t prev; - 
>> float v; - if (SPA_UNLIKELY(locale == NULL)) - locale = 
>> newlocale(LC_ALL_MASK, "C", NULL); -- locale_t prev = 
>> uselocale(locale); -+ prev = uselocale(locale); - v = strtof(str, 
>> endptr); - uselocale(prev); - return v; -@@ -319,10 +320,11 @@ 
>> static inline bool spa_atof(const char *str, float *val) - static 
>> inline double spa_strtod(const char *str, char **endptr) - { - 
>> static locale_t locale = NULL; -+ locale_t prev; - double v; - if 
>> (SPA_UNLIKELY(locale == NULL)) - locale = newlocale(LC_ALL_MASK, 
>> "C", NULL); -- locale_t prev = uselocale(locale); -+ prev = 
>> uselocale(locale); - v = strtod(str, endptr); - uselocale(prev); - 
>> return v; --- -2.25.1 - diff --git 
>> a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb 
>> b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb 
>> similarity index 87% rename from 
>> meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb 
>> rename to 
>> meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb index 
>> c176c6eeb..b5ceeb12c 100644 --- 
>> a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb +++ 
>> b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb @@ 
>> -13,10 +13,9 @@ LIC_FILES_CHKSUM = " \ DEPENDS = "dbus ncurses" 
>> -SRCREV = "64cf5e80e6240284e6b757907b900507fe56f1b5" +SRCREV = 
>> "f274e53d25ee8f483ac6fce9e516bb1830abe88b" SRC_URI = " \ 
>> git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=master;protocol=https 
>> \ - file://0001-spa-fix-c90-header-include.patch \ " S = 
>> "${WORKDIR}/git" @@ -62,7 +61,6 @@ EXTRA_OEMESON += " \ 
>> -Dudevrulesdir=${nonarch_base_libdir}/udev/rules.d/ \ 
>> -Dsystemd-system-unit-dir=${systemd_system_unitdir} \ 
>> -Dsystemd-user-unit-dir=${systemd_user_unitdir} \ - 
>> -Dvulkan=disabled \ -Dman=disabled \ -Dsession-managers='[]' \ 
>> -Dlv2=disabled \ @@ -72,12 +70,26 @@ EXTRA_OEMESON += " \ 
>> -Dlegacy-rtkit=false \ " -PACKAGECONFIG:class-target ??= "\ +# spa 
>> alsa plugin code uses typedef redefinition, which is officially a 
>> C11 feature. +# Pipewire builds with 'c_std=gnu99' by default. 
>> Recent versions of gcc don't issue this warning in gnu99 +# mode but 
>> it looks like clang still does +CFLAGS:append = " 
>> -Wno-typedef-redefinition" + +# According to wireplumber 
>> documentation only one session manager should be installed at a time 
>> +# Possible options are media-session, which has fewer dependencies 
>> but is very simple, +# or wireplumber, which is more powerful. 
>> +PIPEWIRE_SESSION_MANAGER ??= "media-session" + +BLUETOOTH_AAC = 
>> "${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 
>> 'bluez-aac', '', d)}" + +PACKAGECONFIG:class-target ??= " \ + 
>> ${@bb.utils.contains('DISTRO_FEATURES', 'gstreamer', 'gstreamer', 
>> 'ffmpeg', d)} \ ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 
>> 'avahi', '', d)} \ - ${@bb.utils.contains('DISTRO_FEATURES', 
>> 'bluetooth', 'bluez', '', d)} \ - 
>> ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd 
>> systemd-system-service', '', d)} \ - 
>> ${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)} \ - gstreamer jack 
>> libusb pw-cat raop sndfile v4l2 \ + 
>> ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez 
>> ${BLUETOOTH_AAC}', '', d)} \ + 
>> ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd 
>> systemd-system-service systemd-user-service', '', d)} \ + 
>> ${@bb.utils.filter('DISTRO_FEATURES', 'alsa dbus vulkan pulseaudio', 
>> d)} \ + ${PIPEWIRE_SESSION_MANAGER} \ + jack libusb pw-cat raop 
>> sndfile v4l2 udev volume \ " # "jack" and "pipewire-jack" 
>> packageconfigs cannot be both enabled, @@ -96,6 +108,8 @@ 
>> PACKAGECONFIG[jack] = 
>> "-Djack=enabled,-Djack=disabled,jack,,,pipewire-jack" 
>> PACKAGECONFIG[libcamera] = 
>> "-Dlibcamera=enabled,-Dlibcamera=disabled,libcamera" 
>> PACKAGECONFIG[libcanberra] = 
>> "-Dlibcanberra=enabled,-Dlibcanberra=disabled,libcanberra" 
>> PACKAGECONFIG[libusb] = "-Dlibusb=enabled,-Dlibusb=disabled,libusb" 
>> +PACKAGECONFIG[media-session] = ",,,pipewire-media-session" 
>> +PACKAGECONFIG[pulseaudio] = 
>> "-Dlibpulse=enabled,-Dlibpulse=disabled,pulseaudio" 
>> PACKAGECONFIG[pipewire-alsa] = 
>> "-Dpipewire-alsa=enabled,-Dpipewire-alsa=disabled,alsa-lib" 
>> PACKAGECONFIG[pipewire-jack] = "-Dpipewire-jack=enabled 
>> -Dlibjack-path=${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=disabled,jack,,,jack" 
>> PACKAGECONFIG[pw-cat] = "-Dpw-cat=enabled,-Dpw-cat=disabled" @@ 
>> -109,8 +123,12 @@ PACKAGECONFIG[systemd-system-service] = 
>> "-Dsystemd-system-service=enabled,-Dsyst # currently lacks the 
>> feature of enabling user services. 
>> PACKAGECONFIG[systemd-user-service] = 
>> "-Dsystemd-user-service=enabled,-Dsystemd-user-service=disabled,systemd" 
>> # pw-cat needs sndfile packageconfig to be enabled 
>> +PACKAGECONFIG[udev] = "-Dudev=enabled,-Dudev=disabled,udev" 
>> PACKAGECONFIG[v4l2] = "-Dv4l2=enabled,-Dv4l2=disabled,udev" 
>> +PACKAGECONFIG[volume] = "-Dvolume=enabled,-Dvolume=disabled" 
>> +PACKAGECONFIG[vulkan] = 
>> "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-headers vulkan-loader" 
>> PACKAGECONFIG[webrtc-echo-cancelling] = 
>> "-Decho-cancel-webrtc=enabled,-Decho-cancel-webrtc=disabled,webrtc-audio-processing" 
>> +PACKAGECONFIG[wireplumber] = ",,,wireplumber" 
>> PACKAGESPLITFUNCS:prepend = " split_dynamic_packages " 
>> PACKAGESPLITFUNCS:append = " set_dynamic_metapkg_rdepends " @@ 
>> -227,10 +245,11 @@ PACKAGES_DYNAMIC = "^${PN}-spa-plugins.* 
>> ^${PN}-modules.*" SYSTEMD_SERVICE:${PN} = 
>> "${@bb.utils.contains('PACKAGECONFIG', 'systemd-system-service', 
>> 'pipewire.service', '', d)}" CONFFILES:${PN} += 
>> "${datadir}/pipewire/pipewire.conf" FILES:${PN} = " \ - 
>> ${datadir}/pipewire/pipewire.conf \ - 
>> ${systemd_system_unitdir}/pipewire.* \ - 
>> ${systemd_user_unitdir}/pipewire.* \ + ${datadir}/pipewire \ + 
>> ${systemd_system_unitdir}/pipewire* \ + 
>> ${systemd_user_unitdir}/pipewire* \ ${bindir}/pipewire \ + 
>> ${bindir}/pipewire-avb \ " FILES:${PN}-dev += " \
>>  --
>>  2.34.1
>> 
>> 
>> 
>> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98334): 
> <https://lists.openembedded.org/g/openembedded-devel/message/98334>
> Mute This Topic: <https://lists.openembedded.org/mt/93129204/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-9R93Vm4o2bC5e6eTFVrF
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>i've added a backport patch that s=
hould hopefully fix this issue</div></div><div id=3D"geary-quote" dir=3D"au=
to"><br>Am Fr, 19. Aug 2022 um 12:25:37 -0700 schrieb Khem Raj &lt;raj.khem=
@gmail.com&gt;:<br><blockquote type=3D"cite"><div class=3D"plaintext" style=
=3D"white-space: break-spaces;">Thanks for rework. I am seeing a build erro=
r on mips

<a href=3D"https://errors.yoctoproject.org/Errors/Details/668845/">https://=
errors.yoctoproject.org/Errors/Details/668845/</a>

On Fri, Aug 19, 2022 at 10:08 AM Markus Volk &lt;<a href=3D"mailto:f_l_k@t-=
online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 v4 removes a duplicate line

 Am Fr, 19. Aug 2022 um 19:06:27 +0200 schrieb Markus Volk &lt;<a href=3D"m=
ailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;:

 Add the configuration to make pipewire work as a drop-in replacement for p=
ulseaudio-server. Add pipewire-media-session as a standalone recipe, since =
pipewire would fetch the code as a subproject at do_configure. Signed-off-b=
y: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</=
a>&gt; --- .../pipewire/pipewire-media-session_0.4.1.bb | 22 +++++++++ .../=
0001-spa-fix-c90-header-include.patch | 47 ------------------- ...{pipewire=
_0.3.50.bb =3D&gt; pipewire_0.3.56.bb} | 41 +++++++++++----- 3 files change=
d, 52 insertions(+), 58 deletions(-) create mode 100644 meta-multimedia/rec=
ipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb delete mode 100644=
 meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-fix-c90-head=
er-include.patch rename meta-multimedia/recipes-multimedia/pipewire/{pipewi=
re_0.3.50.bb =3D&gt; pipewire_0.3.56.bb} (87%) diff --git a/meta-multimedia=
/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb b/meta-multime=
dia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb new file mo=
de 100644 index 000000000..5dd1eb160 --- /dev/null +++ b/meta-multimedia/re=
cipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb @@ -0,0 +1,22 @@ =
+SUMMARY =3D "PipeWire Media Session is an example session manager for Pipe=
Wire" +HOMEPAGE =3D "https://gitlab.freedesktop.org/pipewire/media-session"=
 +LICENSE =3D "MIT" + +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D97be96ca4=
fab23e9657ffa590b931c1a" + +DEPENDS =3D " \ + pipewire \ + alsa-lib \ + dbu=
s \ +" + +RRECOMMENDS:${PN} +=3D "pipewire" + +SRC_URI =3D "git://gitlab.fr=
eedesktop.org/pipewire/media-session.git;protocol=3Dhttps;branch=3Dmaster" =
+ +S =3D "${WORKDIR}/git" +SRCREV =3D "e5d5cf2404786af8bcc40bdb8a2962bef4ec=
18b6" + +inherit meson pkgconfig + +FILES:${PN} +=3D "${libdir} ${datadir}"=
 diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa=
-fix-c90-header-include.patch b/meta-multimedia/recipes-multimedia/pipewire=
/pipewire/0001-spa-fix-c90-header-include.patch deleted file mode 100644 in=
dex ad6448a10..000000000 --- a/meta-multimedia/recipes-multimedia/pipewire/=
pipewire/0001-spa-fix-c90-header-include.patch +++ /dev/null @@ -1,47 +0,0 =
@@ -From d3ea3142e1a4de206e616bc18f63a529e6b4986a Mon Sep 17 00:00:00 2001 =
-From: psykose &lt;alice@ayaya.dev&gt; -Date: Wed, 13 Apr 2022 21:57:49 +00=
00 -Subject: [PATCH 001/154] spa: fix c90 header include - -placing declara=
tions after code is invalid under ISO c90 - -Fixes !1211 - -Patch-Status: B=
ackport ---- - spa/include/spa/utils/string.h | 6 ++++-- - 1 file changed, =
4 insertions(+), 2 deletions(-) - -diff --git a/spa/include/spa/utils/strin=
g.h b/spa/include/spa/utils/string.h -index e80434537..43d19616c 100644 ---=
- a/spa/include/spa/utils/string.h -+++ b/spa/include/spa/utils/string.h -@=
@ -276,10 +276,11 @@ static inline int spa_scnprintf(char *buffer, size_t s=
ize, const char *format, . - static inline float spa_strtof(const char *str=
, char **endptr) - { - static locale_t locale =3D NULL; -+ locale_t prev; -=
 float v; - if (SPA_UNLIKELY(locale =3D=3D NULL)) - locale =3D newlocale(LC=
_ALL_MASK, "C", NULL); -- locale_t prev =3D uselocale(locale); -+ prev =3D =
uselocale(locale); - v =3D strtof(str, endptr); - uselocale(prev); - return=
 v; -@@ -319,10 +320,11 @@ static inline bool spa_atof(const char *str, flo=
at *val) - static inline double spa_strtod(const char *str, char **endptr) =
- { - static locale_t locale =3D NULL; -+ locale_t prev; - double v; - if (=
SPA_UNLIKELY(locale =3D=3D NULL)) - locale =3D newlocale(LC_ALL_MASK, "C", =
NULL); -- locale_t prev =3D uselocale(locale); -+ prev =3D uselocale(locale=
); - v =3D strtod(str, endptr); - uselocale(prev); - return v; --- -2.25.1 =
- diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb similar=
ity index 87% rename from meta-multimedia/recipes-multimedia/pipewire/pipew=
ire_0.3.50.bb rename to meta-multimedia/recipes-multimedia/pipewire/pipewir=
e_0.3.56.bb index c176c6eeb..b5ceeb12c 100644 --- a/meta-multimedia/recipes=
-multimedia/pipewire/pipewire_0.3.50.bb +++ b/meta-multimedia/recipes-multi=
media/pipewire/pipewire_0.3.56.bb @@ -13,10 +13,9 @@ LIC_FILES_CHKSUM =3D "=
 \ DEPENDS =3D "dbus ncurses" -SRCREV =3D "64cf5e80e6240284e6b757907b900507=
fe56f1b5" +SRCREV =3D "f274e53d25ee8f483ac6fce9e516bb1830abe88b" SRC_URI =
=3D " \ git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3Dmaster;=
protocol=3Dhttps \ - file://0001-spa-fix-c90-header-include.patch \ " S =3D=
 "${WORKDIR}/git" @@ -62,7 +61,6 @@ EXTRA_OEMESON +=3D " \ -Dudevrulesdir=
=3D${nonarch_base_libdir}/udev/rules.d/ \ -Dsystemd-system-unit-dir=3D${sys=
temd_system_unitdir} \ -Dsystemd-user-unit-dir=3D${systemd_user_unitdir} \ =
- -Dvulkan=3Ddisabled \ -Dman=3Ddisabled \ -Dsession-managers=3D'[]' \ -Dlv=
2=3Ddisabled \ @@ -72,12 +70,26 @@ EXTRA_OEMESON +=3D " \ -Dlegacy-rtkit=3D=
false \ " -PACKAGECONFIG:class-target ??=3D "\ +# spa alsa plugin code uses=
 typedef redefinition, which is officially a C11 feature. +# Pipewire build=
s with 'c_std=3Dgnu99' by default. Recent versions of gcc don't issue this =
warning in gnu99 +# mode but it looks like clang still does +CFLAGS:append =
=3D " -Wno-typedef-redefinition" + +# According to wireplumber documentatio=
n only one session manager should be installed at a time +# Possible option=
s are media-session, which has fewer dependencies but is very simple, +# or=
 wireplumber, which is more powerful. +PIPEWIRE_SESSION_MANAGER ??=3D "medi=
a-session" + +BLUETOOTH_AAC =3D "${@bb.utils.contains('LICENSE_FLAGS_ACCEPT=
ED', 'commercial', 'bluez-aac', '', d)}" + +PACKAGECONFIG:class-target ??=
=3D " \ + ${@bb.utils.contains('DISTRO_FEATURES', 'gstreamer', 'gstreamer',=
 'ffmpeg', d)} \ ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi=
', '', d)} \ - ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez'=
, '', d)} \ - ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd s=
ystemd-system-service', '', d)} \ - ${@bb.utils.filter('DISTRO_FEATURES', '=
alsa', d)} \ - gstreamer jack libusb pw-cat raop sndfile v4l2 \ + ${@bb.uti=
ls.contains('DISTRO_FEATURES', 'bluetooth', 'bluez ${BLUETOOTH_AAC}', '', d=
)} \ + ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-=
system-service systemd-user-service', '', d)} \ + ${@bb.utils.filter('DISTR=
O_FEATURES', 'alsa dbus vulkan pulseaudio', d)} \ + ${PIPEWIRE_SESSION_MANA=
GER} \ + jack libusb pw-cat raop sndfile v4l2 udev volume \ " # "jack" and =
"pipewire-jack" packageconfigs cannot be both enabled, @@ -96,6 +108,8 @@ P=
ACKAGECONFIG[jack] =3D "-Djack=3Denabled,-Djack=3Ddisabled,jack,,,pipewire-=
jack" PACKAGECONFIG[libcamera] =3D "-Dlibcamera=3Denabled,-Dlibcamera=3Ddis=
abled,libcamera" PACKAGECONFIG[libcanberra] =3D "-Dlibcanberra=3Denabled,-D=
libcanberra=3Ddisabled,libcanberra" PACKAGECONFIG[libusb] =3D "-Dlibusb=3De=
nabled,-Dlibusb=3Ddisabled,libusb" +PACKAGECONFIG[media-session] =3D ",,,pi=
pewire-media-session" +PACKAGECONFIG[pulseaudio] =3D "-Dlibpulse=3Denabled,=
-Dlibpulse=3Ddisabled,pulseaudio" PACKAGECONFIG[pipewire-alsa] =3D "-Dpipew=
ire-alsa=3Denabled,-Dpipewire-alsa=3Ddisabled,alsa-lib" PACKAGECONFIG[pipew=
ire-jack] =3D "-Dpipewire-jack=3Denabled -Dlibjack-path=3D${libdir}/${PW_MO=
DULE_SUBDIR}/jack,-Dpipewire-jack=3Ddisabled,jack,,,jack" PACKAGECONFIG[pw-=
cat] =3D "-Dpw-cat=3Denabled,-Dpw-cat=3Ddisabled" @@ -109,8 +123,12 @@ PACK=
AGECONFIG[systemd-system-service] =3D "-Dsystemd-system-service=3Denabled,-=
Dsyst # currently lacks the feature of enabling user services. PACKAGECONFI=
G[systemd-user-service] =3D "-Dsystemd-user-service=3Denabled,-Dsystemd-use=
r-service=3Ddisabled,systemd" # pw-cat needs sndfile packageconfig to be en=
abled +PACKAGECONFIG[udev] =3D "-Dudev=3Denabled,-Dudev=3Ddisabled,udev" PA=
CKAGECONFIG[v4l2] =3D "-Dv4l2=3Denabled,-Dv4l2=3Ddisabled,udev" +PACKAGECON=
FIG[volume] =3D "-Dvolume=3Denabled,-Dvolume=3Ddisabled" +PACKAGECONFIG[vul=
kan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulkan-headers vulkan-load=
er" PACKAGECONFIG[webrtc-echo-cancelling] =3D "-Decho-cancel-webrtc=3Denabl=
ed,-Decho-cancel-webrtc=3Ddisabled,webrtc-audio-processing" +PACKAGECONFIG[=
wireplumber] =3D ",,,wireplumber" PACKAGESPLITFUNCS:prepend =3D " split_dyn=
amic_packages " PACKAGESPLITFUNCS:append =3D " set_dynamic_metapkg_rdepends=
 " @@ -227,10 +245,11 @@ PACKAGES_DYNAMIC =3D "^${PN}-spa-plugins.* ^${PN}-=
modules.*" SYSTEMD_SERVICE:${PN} =3D "${@bb.utils.contains('PACKAGECONFIG',=
 'systemd-system-service', 'pipewire.service', '', d)}" CONFFILES:${PN} +=
=3D "${datadir}/pipewire/pipewire.conf" FILES:${PN} =3D " \ - ${datadir}/pi=
pewire/pipewire.conf \ - ${systemd_system_unitdir}/pipewire.* \ - ${systemd=
_user_unitdir}/pipewire.* \ + ${datadir}/pipewire \ + ${systemd_system_unit=
dir}/pipewire* \ + ${systemd_user_unitdir}/pipewire* \ ${bindir}/pipewire \=
 + ${bindir}/pipewire-avb \ " FILES:${PN}-dev +=3D " \
 --
 2.34.1


=20

</blockquote></div><div class=3D"plaintext" style=3D"white-space: break-spa=
ces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#98334): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/98334">https://lists.openembedded.org/g/openembedde=
d-devel/message/98334</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93129204/3618=
223">https://lists.openembedded.org/mt/93129204/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-9R93Vm4o2bC5e6eTFVrF--


