Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D55C32772
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 14:01:00 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web09.3362.1660917654516412899
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Aug 2022 07:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80,
 mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout01.t-online.de (Postfix) with SMTP id A1E987D87;
	Fri, 19 Aug 2022 16:00:52 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.43.141]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oP2YO-09Kpwu0; Fri, 19 Aug 2022 16:00:52 +0200
Date: Fri, 19 Aug 2022 16:00:46 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCH] pipewire: update to v0.3.56
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <A98VGR.V1HPRVRAWIAG1@t-online.de>
In-Reply-To: <170CBC417D80524A.4359@lists.openembedded.org>
References: <20220817194843.5200-1-f_l_k@t-online.de>
	<CAMKF1squzMiys8PALRz6JceDNx_UzxLGyOaMHfoKiOuQPt2=7g@mail.gmail.com>
	<CAMKF1soEApPWsbXX1bVZ=CdJbGNNiPe-hkJoRu6pQX8DgaputQ@mail.gmail.com>
	<170CBC417D80524A.4359@lists.openembedded.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-AV9+/Op7EfnpJ+HiOZt9"
X-TOI-EXPURGATEID: 150726::1660917652-014551EF-0ABD0DA8/0/0 CLEAN NORMAL
X-TOI-MSGID: 0779fd06-08d6-4560-82e1-70c328dc54db
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Aug 2022 14:01:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98330

--=-AV9+/Op7EfnpJ+HiOZt9
Content-Type: text/plain; charset=us-ascii; format=flowed

i sent a v3 patch for pipewire that would also cleanup the unneeded 
patch

Am Fr, 19. Aug 2022 um 13:42:19 +0200 schrieb Markus Volk 
<f_l_k@t-online.de>:
> Hi Khem,
> 
> I can't reproduce your compile error but i sent a v2 that will 
> hopefully fix it and also tried to avoid that licensing issues.
> 
> Meanwhile i also did some testing with wireplumber. Both 
> media-session and wireplumber are working well for me after i updated 
> the wireplumber recipe. I'll send a patch for wireplumber also. 
> Modules and systemd-user-service needed to be installed to get it 
> running.
> 
> Am Do, 18. Aug 2022 um 10:57:13 -0700 schrieb Khem Raj 
> <raj.khem@gmail.com>:
>> also a compiler error here
>> 
>> <https://errors.yoctoproject.org/Errors/Details/668536/>
>> 
>> On Thu, Aug 18, 2022 at 10:53 AM Khem Raj <raj.khem@gmail.com 
>> <mailto:raj.khem@gmail.com>> wrote:
>>> 
>>>  We have some issues with this w.r.t licenses
>>> 
>>>  ERROR: Nothing PROVIDES 'fdk-aac' (but
>>>  
>>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>>  DEPENDS on or otherwise requires it)
>>>  fdk-aac was skipped: because it has a restricted license 
>>> 'commercial'.
>>>  Which is not listed in LICENSE_FLAGS_ACCEPTED
>>>  ERROR: Nothing RPROVIDES 'pipewire-media-session-dev' (but
>>>  
>>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
>>>  RDEPENDS on or otherwise requires it)
>>>  No eligible RPROVIDERs exist for 'pipewire-media-session-dev'
>>>  NOTE: Runtime target 'pipewire-media-session-dev' is unbuildable, 
>>> removing...
>>>  Missing or unbuildable dependency chain was: 
>>> ['pipewire-media-session-dev']
>>>  ERROR: Nothing RPROVIDES 'pipewire-media-session' (but
>>>  
>>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb,
>>>  
>>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>>  RDEPENDS on or otherwise requires it)
>>>  No eligible RPROVIDERs exist for 'pipewire-media-session'
>>>  NOTE: Runtime target 'pipewire-media-session' is unbuildable, 
>>> removing...
>>>  Missing or unbuildable dependency chain was: 
>>> ['pipewire-media-session']
>>>  ERROR: Nothing RPROVIDES 'pipewire' (but
>>>  
>>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb,
>>>  
>>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.9.bb,
>>>  
>>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>>  RDEPENDS on or otherwise requires it)
>>>  No eligible RPROVIDERs exist for 'pipewire'
>>>  NOTE: Runtime target 'pipewire' is unbuildable, removing...
>>>  Missing or unbuildable dependency chain was: ['pipewire']
>>>  ERROR: Nothing RPROVIDES 'wireplumber-scripts' (but
>>>  
>>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.9.bb
>>>  RDEPENDS on or otherwise requires it)
>>>  No eligible RPROVIDERs exist for 'wireplumber-scripts'
>>>  NOTE: Runtime target 'wireplumber-scripts' is unbuildable, 
>>> removing...
>>>  Missing or unbuildable dependency chain was: 
>>> ['wireplumber-scripts']
>>>  ERROR: Nothing RPROVIDES 'wireplumber-dev' (but
>>>  
>>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.9.bb
>>>  RDEPENDS on or otherwise requires it)
>>>  No eligible RPROVIDERs exist for 'wireplumber-dev'
>>>  NOTE: Runtime target 'wireplumber-dev' is unbuildable, removing...
>>>  Missing or unbuildable dependency chain was: ['wireplumber-dev']
>>>  ERROR: Nothing RPROVIDES 'wireplumber-modules-meta' (but
>>>  
>>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.9.bb
>>>  RDEPENDS on or otherwise requires it)
>>>  No eligible RPROVIDERs exist for 'wireplumber-modules-meta'
>>>  NOTE: Runtime target 'wireplumber-modules-meta' is unbuildable, 
>>> removing...
>>>  Missing or unbuildable dependency chain was: 
>>> ['wireplumber-modules-meta']
>>>  ERROR: Nothing RPROVIDES 'wireplumber' (but
>>>  
>>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.9.bb
>>>  RDEPENDS on or otherwise requires it)
>>>  No eligible RPROVIDERs exist for 'wireplumber'
>>>  NOTE: Runtime target 'wireplumber' is unbuildable, removing...
>>>  Missing or unbuildable dependency chain was: ['wireplumber']
>>>  ERROR: Nothing RPROVIDES 'pipewire-modules-protocol-pulse' (but
>>>  
>>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>>  RDEPENDS on or otherwise requires it)
>>>  No eligible RPROVIDERs exist for 'pipewire-modules-protocol-pulse'
>>>  NOTE: Runtime target 'pipewire-modules-protocol-pulse' is 
>>> unbuildable,
>>>  removing...
>>>  Missing or unbuildable dependency chain was: 
>>> ['pipewire-modules-protocol-pulse']
>>>  ERROR: Nothing RPROVIDES 'pipewire-spa-plugins-meta' (but
>>>  
>>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>>  RDEPENDS on or otherwise requires it)
>>>  No eligible RPROVIDERs exist for 'pipewire-spa-plugins-meta'
>>>  NOTE: Runtime target 'pipewire-spa-plugins-meta' is unbuildable, 
>>> removing...
>>>  Missing or unbuildable dependency chain was: 
>>> ['pipewire-spa-plugins-meta']
>>>  ERROR: Nothing RPROVIDES 'pipewire-modules-protocol-native' (but
>>>  
>>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>>  RDEPENDS on or otherwise requires it)
>>>  No eligible RPROVIDERs exist for 'pipewire-modules-protocol-native'
>>>  NOTE: Runtime target 'pipewire-modules-protocol-native' is
>>>  unbuildable, removing...
>>>  Missing or unbuildable dependency chain was:
>>>  ['pipewire-modules-protocol-native']
>>>  ERROR: Nothing RPROVIDES 'pipewire-spa-plugins-support' (but
>>>  
>>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>>  RDEPENDS on or otherwise requires it)
>>>  No eligible RPROVIDERs exist for 'pipewire-spa-plugins-support'
>>>  NOTE: Runtime target 'pipewire-spa-plugins-support' is 
>>> unbuildable, removing...
>>>  Missing or unbuildable dependency chain was: 
>>> ['pipewire-spa-plugins-support']
>>>  ERROR: Nothing RPROVIDES 'pipewire-modules-meta' (but
>>>  
>>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>>  RDEPENDS on or otherwise requires it)
>>>  No eligible RPROVIDERs exist for 'pipewire-modules-meta'
>>>  NOTE: Runtime target 'pipewire-modules-meta' is unbuildable, 
>>> removing...
>>>  Missing or unbuildable dependency chain was: 
>>> ['pipewire-modules-meta']
>>>  ERROR: Nothing RPROVIDES 'pipewire-dev' (but
>>>  
>>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>>  RDEPENDS on or otherwise requires it)
>>>  No eligible RPROVIDERs exist for 'pipewire-dev'
>>>  NOTE: Runtime target 'pipewire-dev' is unbuildable, removing...
>>>  Missing or unbuildable dependency chain was: ['pipewire-dev']
>>>  ERROR: Nothing RPROVIDES 'pipewire-modules-client-node' (but
>>>  
>>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>>  RDEPENDS on or otherwise requires it)
>>>  No eligible RPROVIDERs exist for 'pipewire-modules-client-node'
>>>  NOTE: Runtime target 'pipewire-modules-client-node' is 
>>> unbuildable, removing...
>>>  Missing or unbuildable dependency chain was: 
>>> ['pipewire-modules-client-node']
>>> 
>>>  On Wed, Aug 17, 2022 at 12:48 PM Markus Volk <f_l_k@t-online.de 
>>> <mailto:f_l_k@t-online.de>> wrote:
>>>  >
>>>  > Add the configuration to make pipewire work as a drop-in 
>>> replacement for pulseaudio-server.
>>>  >
>>>  > Add pipewire-media-session as a standalone recipe, since 
>>> pipewire would fetch the code as a
>>>  > subproject at do_configure.
>>>  >
>>>  > Signed-off-by: Markus Volk <f_l_k@t-online.de 
>>> <mailto:f_l_k@t-online.de>>
>>>  > ---
>>>  >  .../pipewire/pipewire-media-session_0.4.1.bb  | 22 
>>> +++++++++++++++
>>>  >  ...{pipewire_0.3.50.bb => pipewire_0.3.56.bb} | 27 
>>> ++++++++++++-------
>>>  >  2 files changed, 40 insertions(+), 9 deletions(-)
>>>  >  create mode 100644 
>>> meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
>>>  >  rename 
>>> meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.50.bb => 
>>> pipewire_0.3.56.bb} (93%)
>>>  >
>>>  > diff --git 
>>> a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb 
>>> b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
>>>  > new file mode 100644
>>>  > index 000000000..bec911fc5
>>>  > --- /dev/null
>>>  > +++ 
>>> b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
>>>  > @@ -0,0 +1,22 @@
>>>  > +SUMMARY = "PipeWire Media Session is an example session manager 
>>> for PipeWire"
>>>  > +HOMEPAGE = 
>>> "<https://gitlab.freedesktop.org/pipewire/media-session>"
>>>  > +LICENSE = "MIT"
>>>  > +
>>>  > +LIC_FILES_CHKSUM = 
>>> "file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a" 
>>> <file://copying;md5=97be96ca4fab23e9657ffa590b931c1a/>
>>>  > +
>>>  > +DEPENDS = " \
>>>  > +       pipewire \
>>>  > +       alsa-lib \
>>>  > +       dbus \
>>>  > +"
>>>  > +
>>>  > +RDEPENDS:${PN} = "pipewire"
>>>  > +
>>>  > +SRC_URI = 
>>> "git://gitlab.freedesktop.org/pipewire/media-session.git;protocol=https;branch=master"
>>>  > +
>>>  > +S = "${WORKDIR}/git"
>>>  > +SRCREV = "e5d5cf2404786af8bcc40bdb8a2962bef4ec18b6"
>>>  > +
>>>  > +inherit meson pkgconfig
>>>  > +
>>>  > +FILES:${PN} += "${libdir} ${datadir}"
>>>  > diff --git 
>>> a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb 
>>> b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>>  > similarity index 93%
>>>  > rename from 
>>> meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
>>>  > rename to 
>>> meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>>  > index c176c6eeb..7a913d5f9 100644
>>>  > --- 
>>> a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
>>>  > +++ 
>>> b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>>  > @@ -13,10 +13,9 @@ LIC_FILES_CHKSUM = " \
>>>  >
>>>  >  DEPENDS = "dbus ncurses"
>>>  >
>>>  > -SRCREV = "64cf5e80e6240284e6b757907b900507fe56f1b5"
>>>  > +SRCREV = "f274e53d25ee8f483ac6fce9e516bb1830abe88b"
>>>  >  SRC_URI = " \
>>>  >         
>>> git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=master;protocol=https 
>>> \
>>>  > -       file://0001-spa-fix-c90-header-include.patch 
>>> <file://0001-spa-fix-c90-header-include.patch/> \
>>>  >  "
>>>  >
>>>  >  S = "${WORKDIR}/git"
>>>  > @@ -73,11 +72,12 @@ EXTRA_OEMESON += " \
>>>  >  "
>>>  >
>>>  >  PACKAGECONFIG:class-target ??= "\
>>>  > +    ${@bb.utils.contains 
>>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'gstreamer', 
>>> 'gstreamer', 'ffmpeg', d)} \
>>>  >      ${@bb.utils.contains 
>>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'zeroconf', 
>>> 'avahi', '', d)} \
>>>  > -    ${@bb.utils.contains 
>>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'bluetooth', 
>>> 'bluez', '', d)} \
>>>  > -    ${@bb.utils.contains 
>>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'systemd', 
>>> 'systemd systemd-system-service', '', d)} \
>>>  > -    ${@bb.utils.filter 
>>> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'alsa', d)} \
>>>  > -    gstreamer jack libusb pw-cat raop sndfile v4l2 \
>>>  > +    ${@bb.utils.contains 
>>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'bluetooth', 
>>> 'bluez bluez-aac', '', d)} \
>>>  > +    ${@bb.utils.contains 
>>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'systemd', 
>>> 'systemd systemd-system-service systemd-user-service', '', d)} \
>>>  > +    ${@bb.utils.filter 
>>> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'alsa dbus vulkan 
>>> pulseaudio', d)} \
>>>  > +    jack libusb pw-cat raop sndfile v4l2 udev volume \
>>>  >  "
>>>  >
>>>  >  # "jack" and "pipewire-jack" packageconfigs cannot be both 
>>> enabled,
>>>  > @@ -96,6 +96,7 @@ PACKAGECONFIG[jack] = 
>>> "-Djack=enabled,-Djack=disabled,jack,,,pipewire-jack"
>>>  >  PACKAGECONFIG[libcamera] = 
>>> "-Dlibcamera=enabled,-Dlibcamera=disabled,libcamera"
>>>  >  PACKAGECONFIG[libcanberra] = 
>>> "-Dlibcanberra=enabled,-Dlibcanberra=disabled,libcanberra"
>>>  >  PACKAGECONFIG[libusb] = 
>>> "-Dlibusb=enabled,-Dlibusb=disabled,libusb"
>>>  > +PACKAGECONFIG[pulseaudio] = 
>>> "-Dlibpulse=enabled,-Dlibpulse=disabled,pulseaudio"
>>>  >  PACKAGECONFIG[pipewire-alsa] = 
>>> "-Dpipewire-alsa=enabled,-Dpipewire-alsa=disabled,alsa-lib"
>>>  >  PACKAGECONFIG[pipewire-jack] = "-Dpipewire-jack=enabled 
>>> -Dlibjack-path=${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=disabled,jack,,,jack"
>>>  >  PACKAGECONFIG[pw-cat] = "-Dpw-cat=enabled,-Dpw-cat=disabled"
>>>  > @@ -109,7 +110,10 @@ PACKAGECONFIG[systemd-system-service] = 
>>> "-Dsystemd-system-service=enabled,-Dsyst
>>>  >  # currently lacks the feature of enabling user services.
>>>  >  PACKAGECONFIG[systemd-user-service] = 
>>> "-Dsystemd-user-service=enabled,-Dsystemd-user-service=disabled,systemd"
>>>  >  # pw-cat needs sndfile packageconfig to be enabled
>>>  > +PACKAGECONFIG[udev] = "-Dudev=enabled,-Dudev=disabled,udev"
>>>  >  PACKAGECONFIG[v4l2] = "-Dv4l2=enabled,-Dv4l2=disabled,udev"
>>>  > +PACKAGECONFIG[volume] = "-Dvolume=enabled,-Dvolume=disabled"
>>>  > +PACKAGECONFIG[vulkan] = 
>>> "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-headers vulkan-loader"
>>>  >  PACKAGECONFIG[webrtc-echo-cancelling] = 
>>> "-Decho-cancel-webrtc=enabled,-Decho-cancel-webrtc=disabled,webrtc-audio-processing"
>>>  >
>>>  >  PACKAGESPLITFUNCS:prepend = " split_dynamic_packages "
>>>  > @@ -227,10 +231,15 @@ PACKAGES_DYNAMIC = "^${PN}-spa-plugins.* 
>>> ^${PN}-modules.*"
>>>  >  SYSTEMD_SERVICE:${PN} = "${@bb.utils.contains 
>>> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 
>>> 'systemd-system-service', 'pipewire.service', '', d)}"
>>>  >  CONFFILES:${PN} += "${datadir}/pipewire/pipewire.conf"
>>>  >  FILES:${PN} = " \
>>>  > -    ${datadir}/pipewire/pipewire.conf \
>>>  > -    ${systemd_system_unitdir}/pipewire.* \
>>>  > -    ${systemd_user_unitdir}/pipewire.* \
>>>  > +    ${datadir}/pipewire \
>>>  > +    ${systemd_system_unitdir}/pipewire* \
>>>  > +    ${systemd_user_unitdir}/pipewire* \
>>>  >      ${bindir}/pipewire \
>>>  > +    ${bindir}/pipewire-avb \
>>>  > +"
>>>  > +
>>>  > +RRECOMMENDS:${PN} += " \
>>>  > +    ${PN}-media-session \
>>>  >  "
>>>  >
>>>  >  FILES:${PN}-dev += " \
>>>  > --
>>>  > 2.34.1
>>>  >
>>>  >
>>>  >
>>>  >


--=-AV9+/Op7EfnpJ+HiOZt9
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>i sent a v3 patch for pipewire tha=
t would also cleanup the unneeded patch</div></div><div id=3D"geary-quote" =
dir=3D"auto"><br>Am Fr, 19. Aug 2022 um 13:42:19 +0200 schrieb Markus Volk =
&lt;f_l_k@t-online.de&gt;:<br><blockquote type=3D"cite"><div id=3D"geary-bo=
dy" dir=3D"auto"><div>Hi Khem,</div><div><br></div><div><div>I can't reprod=
uce your compile error but i sent a v2 that will hopefully fix it and also =
tried to avoid that licensing issues.</div><div><br></div><div>Meanwhile i =
also did some testing with wireplumber. Both media-session and wireplumber =
are working well for me after i updated the wireplumber recipe. I'll send a=
 patch for wireplumber also. Modules and systemd-user-service needed to be =
installed to get it running.</div></div></div><div id=3D"geary-quote" dir=
=3D"auto"><br>Am Do, 18. Aug 2022 um 10:57:13 -0700 schrieb Khem Raj &lt;ra=
j.khem@gmail.com&gt;:<br><blockquote type=3D"cite"><div class=3D"plaintext"=
 style=3D"white-space: break-spaces;">also a compiler error here

<a href=3D"https://errors.yoctoproject.org/Errors/Details/668536/">https://=
errors.yoctoproject.org/Errors/Details/668536/</a>

On Thu, Aug 18, 2022 at 10:53 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com">raj.khem@gmail.com</a>&gt; wrote:
<blockquote>
 We have some issues with this w.r.t licenses

 ERROR: Nothing PROVIDES 'fdk-aac' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multim=
edia/pipewire/pipewire_0.3.56.bb
 DEPENDS on or otherwise requires it)
 fdk-aac was skipped: because it has a restricted license 'commercial'.
 Which is not listed in LICENSE_FLAGS_ACCEPTED
 ERROR: Nothing RPROVIDES 'pipewire-media-session-dev' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multim=
edia/pipewire/pipewire-media-session_0.4.1.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'pipewire-media-session-dev'
 NOTE: Runtime target 'pipewire-media-session-dev' is unbuildable, removing=
...
 Missing or unbuildable dependency chain was: ['pipewire-media-session-dev'=
]
 ERROR: Nothing RPROVIDES 'pipewire-media-session' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multim=
edia/pipewire/pipewire-media-session_0.4.1.bb,
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multim=
edia/pipewire/pipewire_0.3.56.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'pipewire-media-session'
 NOTE: Runtime target 'pipewire-media-session' is unbuildable, removing...
 Missing or unbuildable dependency chain was: ['pipewire-media-session']
 ERROR: Nothing RPROVIDES 'pipewire' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multim=
edia/pipewire/pipewire-media-session_0.4.1.bb,
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multim=
edia/wireplumber/wireplumber_0.4.9.bb,
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multim=
edia/pipewire/pipewire_0.3.56.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'pipewire'
 NOTE: Runtime target 'pipewire' is unbuildable, removing...
 Missing or unbuildable dependency chain was: ['pipewire']
 ERROR: Nothing RPROVIDES 'wireplumber-scripts' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multim=
edia/wireplumber/wireplumber_0.4.9.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'wireplumber-scripts'
 NOTE: Runtime target 'wireplumber-scripts' is unbuildable, removing...
 Missing or unbuildable dependency chain was: ['wireplumber-scripts']
 ERROR: Nothing RPROVIDES 'wireplumber-dev' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multim=
edia/wireplumber/wireplumber_0.4.9.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'wireplumber-dev'
 NOTE: Runtime target 'wireplumber-dev' is unbuildable, removing...
 Missing or unbuildable dependency chain was: ['wireplumber-dev']
 ERROR: Nothing RPROVIDES 'wireplumber-modules-meta' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multim=
edia/wireplumber/wireplumber_0.4.9.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'wireplumber-modules-meta'
 NOTE: Runtime target 'wireplumber-modules-meta' is unbuildable, removing..=
.
 Missing or unbuildable dependency chain was: ['wireplumber-modules-meta']
 ERROR: Nothing RPROVIDES 'wireplumber' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multim=
edia/wireplumber/wireplumber_0.4.9.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'wireplumber'
 NOTE: Runtime target 'wireplumber' is unbuildable, removing...
 Missing or unbuildable dependency chain was: ['wireplumber']
 ERROR: Nothing RPROVIDES 'pipewire-modules-protocol-pulse' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multim=
edia/pipewire/pipewire_0.3.56.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'pipewire-modules-protocol-pulse'
 NOTE: Runtime target 'pipewire-modules-protocol-pulse' is unbuildable,
 removing...
 Missing or unbuildable dependency chain was: ['pipewire-modules-protocol-p=
ulse']
 ERROR: Nothing RPROVIDES 'pipewire-spa-plugins-meta' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multim=
edia/pipewire/pipewire_0.3.56.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'pipewire-spa-plugins-meta'
 NOTE: Runtime target 'pipewire-spa-plugins-meta' is unbuildable, removing.=
..
 Missing or unbuildable dependency chain was: ['pipewire-spa-plugins-meta']
 ERROR: Nothing RPROVIDES 'pipewire-modules-protocol-native' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multim=
edia/pipewire/pipewire_0.3.56.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'pipewire-modules-protocol-native'
 NOTE: Runtime target 'pipewire-modules-protocol-native' is
 unbuildable, removing...
 Missing or unbuildable dependency chain was:
 ['pipewire-modules-protocol-native']
 ERROR: Nothing RPROVIDES 'pipewire-spa-plugins-support' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multim=
edia/pipewire/pipewire_0.3.56.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'pipewire-spa-plugins-support'
 NOTE: Runtime target 'pipewire-spa-plugins-support' is unbuildable, removi=
ng...
 Missing or unbuildable dependency chain was: ['pipewire-spa-plugins-suppor=
t']
 ERROR: Nothing RPROVIDES 'pipewire-modules-meta' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multim=
edia/pipewire/pipewire_0.3.56.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'pipewire-modules-meta'
 NOTE: Runtime target 'pipewire-modules-meta' is unbuildable, removing...
 Missing or unbuildable dependency chain was: ['pipewire-modules-meta']
 ERROR: Nothing RPROVIDES 'pipewire-dev' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multim=
edia/pipewire/pipewire_0.3.56.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'pipewire-dev'
 NOTE: Runtime target 'pipewire-dev' is unbuildable, removing...
 Missing or unbuildable dependency chain was: ['pipewire-dev']
 ERROR: Nothing RPROVIDES 'pipewire-modules-client-node' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multim=
edia/pipewire/pipewire_0.3.56.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'pipewire-modules-client-node'
 NOTE: Runtime target 'pipewire-modules-client-node' is unbuildable, removi=
ng...
 Missing or unbuildable dependency chain was: ['pipewire-modules-client-nod=
e']

 On Wed, Aug 17, 2022 at 12:48 PM Markus Volk &lt;<a href=3D"mailto:f_l_k@t=
-online.de">f_l_k@t-online.de</a>&gt; wrote:
 &gt;
 &gt; Add the configuration to make pipewire work as a drop-in replacement =
for pulseaudio-server.
 &gt;
 &gt; Add pipewire-media-session as a standalone recipe, since pipewire wou=
ld fetch the code as a
 &gt; subproject at do_configure.
 &gt;
 &gt; Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f=
_l_k@t-online.de</a>&gt;
 &gt; ---
 &gt;  .../pipewire/pipewire-media-session_0.4.1.bb  | 22 +++++++++++++++
 &gt;  ...{pipewire_0.3.50.bb =3D&gt; pipewire_0.3.56.bb} | 27 ++++++++++++=
-------
 &gt;  2 files changed, 40 insertions(+), 9 deletions(-)
 &gt;  create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipew=
ire-media-session_0.4.1.bb
 &gt;  rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.50.=
bb =3D&gt; pipewire_0.3.56.bb} (93%)
 &gt;
 &gt; diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-med=
ia-session_0.4.1.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-=
media-session_0.4.1.bb
 &gt; new file mode 100644
 &gt; index 000000000..bec911fc5
 &gt; --- /dev/null
 &gt; +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-sess=
ion_0.4.1.bb
 &gt; @@ -0,0 +1,22 @@
 &gt; +SUMMARY =3D "PipeWire Media Session is an example session manager fo=
r PipeWire"
 &gt; +HOMEPAGE =3D "<a href=3D"https://gitlab.freedesktop.org/pipewire/med=
ia-session">https://gitlab.freedesktop.org/pipewire/media-session</a>"
 &gt; +LICENSE =3D "MIT"
 &gt; +
 &gt; +LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3D97be96ca4fab23=
e9657ffa590b931c1a" "=3D"">file://COPYING;md5=3D97be96ca4fab23e9657ffa590b9=
31c1a"</a>
 &gt; +
 &gt; +DEPENDS =3D " \
 &gt; +       pipewire \
 &gt; +       alsa-lib \
 &gt; +       dbus \
 &gt; +"
 &gt; +
 &gt; +RDEPENDS:${PN} =3D "pipewire"
 &gt; +
 &gt; +SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/media-session.git=
;protocol=3Dhttps;branch=3Dmaster"
 &gt; +
 &gt; +S =3D "${WORKDIR}/git"
 &gt; +SRCREV =3D "e5d5cf2404786af8bcc40bdb8a2962bef4ec18b6"
 &gt; +
 &gt; +inherit meson pkgconfig
 &gt; +
 &gt; +FILES:${PN} +=3D "${libdir} ${datadir}"
 &gt; diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3=
.50.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
 &gt; similarity index 93%
 &gt; rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.=
50.bb
 &gt; rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56=
.bb
 &gt; index c176c6eeb..7a913d5f9 100644
 &gt; --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
 &gt; +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
 &gt; @@ -13,10 +13,9 @@ LIC_FILES_CHKSUM =3D " \
 &gt;
 &gt;  DEPENDS =3D "dbus ncurses"
 &gt;
 &gt; -SRCREV =3D "64cf5e80e6240284e6b757907b900507fe56f1b5"
 &gt; +SRCREV =3D "f274e53d25ee8f483ac6fce9e516bb1830abe88b"
 &gt;  SRC_URI =3D " \
 &gt;         git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3Dm=
aster;protocol=3Dhttps \
 &gt; -       <a href=3D"file://0001-spa-fix-c90-header-include.patch">file=
://0001-spa-fix-c90-header-include.patch</a> \
 &gt;  "
 &gt;
 &gt;  S =3D "${WORKDIR}/git"
 &gt; @@ -73,11 +72,12 @@ EXTRA_OEMESON +=3D " \
 &gt;  "
 &gt;
 &gt;  PACKAGECONFIG:class-target ??=3D "\
 &gt; +    <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.contains</a>=
('DISTRO_FEATURES', 'gstreamer', 'gstreamer', 'ffmpeg', d)} \
 &gt;      <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.contains</a>=
('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
 &gt; -    <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.contains</a>=
('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
 &gt; -    <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.contains</a>=
('DISTRO_FEATURES', 'systemd', 'systemd systemd-system-service', '', d)} \
 &gt; -    <a href=3D"mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DI=
STRO_FEATURES', 'alsa', d)} \
 &gt; -    gstreamer jack libusb pw-cat raop sndfile v4l2 \
 &gt; +    <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.contains</a>=
('DISTRO_FEATURES', 'bluetooth', 'bluez bluez-aac', '', d)} \
 &gt; +    <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.contains</a>=
('DISTRO_FEATURES', 'systemd', 'systemd systemd-system-service systemd-user=
-service', '', d)} \
 &gt; +    <a href=3D"mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DI=
STRO_FEATURES', 'alsa dbus vulkan pulseaudio', d)} \
 &gt; +    jack libusb pw-cat raop sndfile v4l2 udev volume \
 &gt;  "
 &gt;
 &gt;  # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
 &gt; @@ -96,6 +96,7 @@ PACKAGECONFIG[jack] =3D "-Djack=3Denabled,-Djack=3D=
disabled,jack,,,pipewire-jack"
 &gt;  PACKAGECONFIG[libcamera] =3D "-Dlibcamera=3Denabled,-Dlibcamera=3Ddi=
sabled,libcamera"
 &gt;  PACKAGECONFIG[libcanberra] =3D "-Dlibcanberra=3Denabled,-Dlibcanberr=
a=3Ddisabled,libcanberra"
 &gt;  PACKAGECONFIG[libusb] =3D "-Dlibusb=3Denabled,-Dlibusb=3Ddisabled,li=
busb"
 &gt; +PACKAGECONFIG[pulseaudio] =3D "-Dlibpulse=3Denabled,-Dlibpulse=3Ddis=
abled,pulseaudio"
 &gt;  PACKAGECONFIG[pipewire-alsa] =3D "-Dpipewire-alsa=3Denabled,-Dpipewi=
re-alsa=3Ddisabled,alsa-lib"
 &gt;  PACKAGECONFIG[pipewire-jack] =3D "-Dpipewire-jack=3Denabled -Dlibjac=
k-path=3D${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=3Ddisabled,jack=
,,,jack"
 &gt;  PACKAGECONFIG[pw-cat] =3D "-Dpw-cat=3Denabled,-Dpw-cat=3Ddisabled"
 &gt; @@ -109,7 +110,10 @@ PACKAGECONFIG[systemd-system-service] =3D "-Dsys=
temd-system-service=3Denabled,-Dsyst
 &gt;  # currently lacks the feature of enabling user services.
 &gt;  PACKAGECONFIG[systemd-user-service] =3D "-Dsystemd-user-service=3Den=
abled,-Dsystemd-user-service=3Ddisabled,systemd"
 &gt;  # pw-cat needs sndfile packageconfig to be enabled
 &gt; +PACKAGECONFIG[udev] =3D "-Dudev=3Denabled,-Dudev=3Ddisabled,udev"
 &gt;  PACKAGECONFIG[v4l2] =3D "-Dv4l2=3Denabled,-Dv4l2=3Ddisabled,udev"
 &gt; +PACKAGECONFIG[volume] =3D "-Dvolume=3Denabled,-Dvolume=3Ddisabled"
 &gt; +PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vu=
lkan-headers vulkan-loader"
 &gt;  PACKAGECONFIG[webrtc-echo-cancelling] =3D "-Decho-cancel-webrtc=3Den=
abled,-Decho-cancel-webrtc=3Ddisabled,webrtc-audio-processing"
 &gt;
 &gt;  PACKAGESPLITFUNCS:prepend =3D " split_dynamic_packages "
 &gt; @@ -227,10 +231,15 @@ PACKAGES_DYNAMIC =3D "^${PN}-spa-plugins.* ^${P=
N}-modules.*"
 &gt;  SYSTEMD_SERVICE:${PN} =3D "<a href=3D"mailto:${@bb.utils.contains">$=
{@bb.utils.contains</a>('PACKAGECONFIG', 'systemd-system-service', 'pipewir=
e.service', '', d)}"
 &gt;  CONFFILES:${PN} +=3D "${datadir}/pipewire/pipewire.conf"
 &gt;  FILES:${PN} =3D " \
 &gt; -    ${datadir}/pipewire/pipewire.conf \
 &gt; -    ${systemd_system_unitdir}/pipewire.* \
 &gt; -    ${systemd_user_unitdir}/pipewire.* \
 &gt; +    ${datadir}/pipewire \
 &gt; +    ${systemd_system_unitdir}/pipewire* \
 &gt; +    ${systemd_user_unitdir}/pipewire* \
 &gt;      ${bindir}/pipewire \
 &gt; +    ${bindir}/pipewire-avb \
 &gt; +"
 &gt; +
 &gt; +RRECOMMENDS:${PN} +=3D " \
 &gt; +    ${PN}-media-session \
 &gt;  "
 &gt;
 &gt;  FILES:${PN}-dev +=3D " \
 &gt; --
 &gt; 2.34.1
 &gt;
 &gt;
 &gt;=20
 &gt;
</blockquote></div></blockquote></div>
</blockquote></div>
--=-AV9+/Op7EfnpJ+HiOZt9--


