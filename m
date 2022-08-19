Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50569C32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 11:42:40 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.2109.1660909351015584964
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Aug 2022 04:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81,
 mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout03.t-online.de (Postfix) with SMTP id B129B342F;
	Fri, 19 Aug 2022 13:42:27 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.43.141]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oP0OO-1XgkAy0; Fri, 19 Aug 2022 13:42:24 +0200
Date: Fri, 19 Aug 2022 13:42:19 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCH] pipewire: update to v0.3.56
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <JU1VGR.1O56H3R4VYLV2@t-online.de>
In-Reply-To: 
	<CAMKF1soEApPWsbXX1bVZ=CdJbGNNiPe-hkJoRu6pQX8DgaputQ@mail.gmail.com>
References: <20220817194843.5200-1-f_l_k@t-online.de>
	<CAMKF1squzMiys8PALRz6JceDNx_UzxLGyOaMHfoKiOuQPt2=7g@mail.gmail.com>
	<CAMKF1soEApPWsbXX1bVZ=CdJbGNNiPe-hkJoRu6pQX8DgaputQ@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-9HTVP709CF/WBFHTxmA/"
X-TOI-EXPURGATEID: 150726::1660909344-0144CFA9-1C6E7131/0/0 CLEAN NORMAL
X-TOI-MSGID: ea3c41b1-437a-4766-af89-8914e1aea153
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Aug 2022 11:42:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98327

--=-9HTVP709CF/WBFHTxmA/
Content-Type: text/plain; charset=us-ascii; format=flowed

Hi Khem,

I can't reproduce your compile error but i sent a v2 that will 
hopefully fix it and also tried to avoid that licensing issues.

Meanwhile i also did some testing with wireplumber. Both media-session 
and wireplumber are working well for me after i updated the wireplumber 
recipe. I'll send a patch for wireplumber also. Modules and 
systemd-user-service needed to be installed to get it running.

Am Do, 18. Aug 2022 um 10:57:13 -0700 schrieb Khem Raj 
<raj.khem@gmail.com>:
> also a compiler error here
> 
> <https://errors.yoctoproject.org/Errors/Details/668536/>
> 
> On Thu, Aug 18, 2022 at 10:53 AM Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
>> 
>>  We have some issues with this w.r.t licenses
>> 
>>  ERROR: Nothing PROVIDES 'fdk-aac' (but
>>  
>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>  DEPENDS on or otherwise requires it)
>>  fdk-aac was skipped: because it has a restricted license 
>> 'commercial'.
>>  Which is not listed in LICENSE_FLAGS_ACCEPTED
>>  ERROR: Nothing RPROVIDES 'pipewire-media-session-dev' (but
>>  
>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
>>  RDEPENDS on or otherwise requires it)
>>  No eligible RPROVIDERs exist for 'pipewire-media-session-dev'
>>  NOTE: Runtime target 'pipewire-media-session-dev' is unbuildable, 
>> removing...
>>  Missing or unbuildable dependency chain was: 
>> ['pipewire-media-session-dev']
>>  ERROR: Nothing RPROVIDES 'pipewire-media-session' (but
>>  
>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb,
>>  
>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>  RDEPENDS on or otherwise requires it)
>>  No eligible RPROVIDERs exist for 'pipewire-media-session'
>>  NOTE: Runtime target 'pipewire-media-session' is unbuildable, 
>> removing...
>>  Missing or unbuildable dependency chain was: 
>> ['pipewire-media-session']
>>  ERROR: Nothing RPROVIDES 'pipewire' (but
>>  
>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb,
>>  
>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.9.bb,
>>  
>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>  RDEPENDS on or otherwise requires it)
>>  No eligible RPROVIDERs exist for 'pipewire'
>>  NOTE: Runtime target 'pipewire' is unbuildable, removing...
>>  Missing or unbuildable dependency chain was: ['pipewire']
>>  ERROR: Nothing RPROVIDES 'wireplumber-scripts' (but
>>  
>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.9.bb
>>  RDEPENDS on or otherwise requires it)
>>  No eligible RPROVIDERs exist for 'wireplumber-scripts'
>>  NOTE: Runtime target 'wireplumber-scripts' is unbuildable, 
>> removing...
>>  Missing or unbuildable dependency chain was: ['wireplumber-scripts']
>>  ERROR: Nothing RPROVIDES 'wireplumber-dev' (but
>>  
>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.9.bb
>>  RDEPENDS on or otherwise requires it)
>>  No eligible RPROVIDERs exist for 'wireplumber-dev'
>>  NOTE: Runtime target 'wireplumber-dev' is unbuildable, removing...
>>  Missing or unbuildable dependency chain was: ['wireplumber-dev']
>>  ERROR: Nothing RPROVIDES 'wireplumber-modules-meta' (but
>>  
>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.9.bb
>>  RDEPENDS on or otherwise requires it)
>>  No eligible RPROVIDERs exist for 'wireplumber-modules-meta'
>>  NOTE: Runtime target 'wireplumber-modules-meta' is unbuildable, 
>> removing...
>>  Missing or unbuildable dependency chain was: 
>> ['wireplumber-modules-meta']
>>  ERROR: Nothing RPROVIDES 'wireplumber' (but
>>  
>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.9.bb
>>  RDEPENDS on or otherwise requires it)
>>  No eligible RPROVIDERs exist for 'wireplumber'
>>  NOTE: Runtime target 'wireplumber' is unbuildable, removing...
>>  Missing or unbuildable dependency chain was: ['wireplumber']
>>  ERROR: Nothing RPROVIDES 'pipewire-modules-protocol-pulse' (but
>>  
>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>  RDEPENDS on or otherwise requires it)
>>  No eligible RPROVIDERs exist for 'pipewire-modules-protocol-pulse'
>>  NOTE: Runtime target 'pipewire-modules-protocol-pulse' is 
>> unbuildable,
>>  removing...
>>  Missing or unbuildable dependency chain was: 
>> ['pipewire-modules-protocol-pulse']
>>  ERROR: Nothing RPROVIDES 'pipewire-spa-plugins-meta' (but
>>  
>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>  RDEPENDS on or otherwise requires it)
>>  No eligible RPROVIDERs exist for 'pipewire-spa-plugins-meta'
>>  NOTE: Runtime target 'pipewire-spa-plugins-meta' is unbuildable, 
>> removing...
>>  Missing or unbuildable dependency chain was: 
>> ['pipewire-spa-plugins-meta']
>>  ERROR: Nothing RPROVIDES 'pipewire-modules-protocol-native' (but
>>  
>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>  RDEPENDS on or otherwise requires it)
>>  No eligible RPROVIDERs exist for 'pipewire-modules-protocol-native'
>>  NOTE: Runtime target 'pipewire-modules-protocol-native' is
>>  unbuildable, removing...
>>  Missing or unbuildable dependency chain was:
>>  ['pipewire-modules-protocol-native']
>>  ERROR: Nothing RPROVIDES 'pipewire-spa-plugins-support' (but
>>  
>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>  RDEPENDS on or otherwise requires it)
>>  No eligible RPROVIDERs exist for 'pipewire-spa-plugins-support'
>>  NOTE: Runtime target 'pipewire-spa-plugins-support' is unbuildable, 
>> removing...
>>  Missing or unbuildable dependency chain was: 
>> ['pipewire-spa-plugins-support']
>>  ERROR: Nothing RPROVIDES 'pipewire-modules-meta' (but
>>  
>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>  RDEPENDS on or otherwise requires it)
>>  No eligible RPROVIDERs exist for 'pipewire-modules-meta'
>>  NOTE: Runtime target 'pipewire-modules-meta' is unbuildable, 
>> removing...
>>  Missing or unbuildable dependency chain was: 
>> ['pipewire-modules-meta']
>>  ERROR: Nothing RPROVIDES 'pipewire-dev' (but
>>  
>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>  RDEPENDS on or otherwise requires it)
>>  No eligible RPROVIDERs exist for 'pipewire-dev'
>>  NOTE: Runtime target 'pipewire-dev' is unbuildable, removing...
>>  Missing or unbuildable dependency chain was: ['pipewire-dev']
>>  ERROR: Nothing RPROVIDES 'pipewire-modules-client-node' (but
>>  
>> /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>  RDEPENDS on or otherwise requires it)
>>  No eligible RPROVIDERs exist for 'pipewire-modules-client-node'
>>  NOTE: Runtime target 'pipewire-modules-client-node' is unbuildable, 
>> removing...
>>  Missing or unbuildable dependency chain was: 
>> ['pipewire-modules-client-node']
>> 
>>  On Wed, Aug 17, 2022 at 12:48 PM Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>> wrote:
>>  >
>>  > Add the configuration to make pipewire work as a drop-in 
>> replacement for pulseaudio-server.
>>  >
>>  > Add pipewire-media-session as a standalone recipe, since pipewire 
>> would fetch the code as a
>>  > subproject at do_configure.
>>  >
>>  > Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  > ---
>>  >  .../pipewire/pipewire-media-session_0.4.1.bb  | 22 
>> +++++++++++++++
>>  >  ...{pipewire_0.3.50.bb => pipewire_0.3.56.bb} | 27 
>> ++++++++++++-------
>>  >  2 files changed, 40 insertions(+), 9 deletions(-)
>>  >  create mode 100644 
>> meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
>>  >  rename 
>> meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.50.bb => 
>> pipewire_0.3.56.bb} (93%)
>>  >
>>  > diff --git 
>> a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb 
>> b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
>>  > new file mode 100644
>>  > index 000000000..bec911fc5
>>  > --- /dev/null
>>  > +++ 
>> b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
>>  > @@ -0,0 +1,22 @@
>>  > +SUMMARY = "PipeWire Media Session is an example session manager 
>> for PipeWire"
>>  > +HOMEPAGE = 
>> "<https://gitlab.freedesktop.org/pipewire/media-session>"
>>  > +LICENSE = "MIT"
>>  > +
>>  > +LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a" 
>> <file://copying;md5=97be96ca4fab23e9657ffa590b931c1a/>
>>  > +
>>  > +DEPENDS = " \
>>  > +       pipewire \
>>  > +       alsa-lib \
>>  > +       dbus \
>>  > +"
>>  > +
>>  > +RDEPENDS:${PN} = "pipewire"
>>  > +
>>  > +SRC_URI = 
>> "git://gitlab.freedesktop.org/pipewire/media-session.git;protocol=https;branch=master"
>>  > +
>>  > +S = "${WORKDIR}/git"
>>  > +SRCREV = "e5d5cf2404786af8bcc40bdb8a2962bef4ec18b6"
>>  > +
>>  > +inherit meson pkgconfig
>>  > +
>>  > +FILES:${PN} += "${libdir} ${datadir}"
>>  > diff --git 
>> a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb 
>> b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>  > similarity index 93%
>>  > rename from 
>> meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
>>  > rename to 
>> meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>  > index c176c6eeb..7a913d5f9 100644
>>  > --- 
>> a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
>>  > +++ 
>> b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
>>  > @@ -13,10 +13,9 @@ LIC_FILES_CHKSUM = " \
>>  >
>>  >  DEPENDS = "dbus ncurses"
>>  >
>>  > -SRCREV = "64cf5e80e6240284e6b757907b900507fe56f1b5"
>>  > +SRCREV = "f274e53d25ee8f483ac6fce9e516bb1830abe88b"
>>  >  SRC_URI = " \
>>  >         
>> git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=master;protocol=https 
>> \
>>  > -       file://0001-spa-fix-c90-header-include.patch 
>> <file://0001-spa-fix-c90-header-include.patch/> \
>>  >  "
>>  >
>>  >  S = "${WORKDIR}/git"
>>  > @@ -73,11 +72,12 @@ EXTRA_OEMESON += " \
>>  >  "
>>  >
>>  >  PACKAGECONFIG:class-target ??= "\
>>  > +    ${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'gstreamer', 
>> 'gstreamer', 'ffmpeg', d)} \
>>  >      ${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'zeroconf', 
>> 'avahi', '', d)} \
>>  > -    ${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'bluetooth', 
>> 'bluez', '', d)} \
>>  > -    ${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'systemd', 'systemd 
>> systemd-system-service', '', d)} \
>>  > -    ${@bb.utils.filter 
>> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'alsa', d)} \
>>  > -    gstreamer jack libusb pw-cat raop sndfile v4l2 \
>>  > +    ${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'bluetooth', 'bluez 
>> bluez-aac', '', d)} \
>>  > +    ${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'systemd', 'systemd 
>> systemd-system-service systemd-user-service', '', d)} \
>>  > +    ${@bb.utils.filter 
>> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'alsa dbus vulkan 
>> pulseaudio', d)} \
>>  > +    jack libusb pw-cat raop sndfile v4l2 udev volume \
>>  >  "
>>  >
>>  >  # "jack" and "pipewire-jack" packageconfigs cannot be both 
>> enabled,
>>  > @@ -96,6 +96,7 @@ PACKAGECONFIG[jack] = 
>> "-Djack=enabled,-Djack=disabled,jack,,,pipewire-jack"
>>  >  PACKAGECONFIG[libcamera] = 
>> "-Dlibcamera=enabled,-Dlibcamera=disabled,libcamera"
>>  >  PACKAGECONFIG[libcanberra] = 
>> "-Dlibcanberra=enabled,-Dlibcanberra=disabled,libcanberra"
>>  >  PACKAGECONFIG[libusb] = 
>> "-Dlibusb=enabled,-Dlibusb=disabled,libusb"
>>  > +PACKAGECONFIG[pulseaudio] = 
>> "-Dlibpulse=enabled,-Dlibpulse=disabled,pulseaudio"
>>  >  PACKAGECONFIG[pipewire-alsa] = 
>> "-Dpipewire-alsa=enabled,-Dpipewire-alsa=disabled,alsa-lib"
>>  >  PACKAGECONFIG[pipewire-jack] = "-Dpipewire-jack=enabled 
>> -Dlibjack-path=${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=disabled,jack,,,jack"
>>  >  PACKAGECONFIG[pw-cat] = "-Dpw-cat=enabled,-Dpw-cat=disabled"
>>  > @@ -109,7 +110,10 @@ PACKAGECONFIG[systemd-system-service] = 
>> "-Dsystemd-system-service=enabled,-Dsyst
>>  >  # currently lacks the feature of enabling user services.
>>  >  PACKAGECONFIG[systemd-user-service] = 
>> "-Dsystemd-user-service=enabled,-Dsystemd-user-service=disabled,systemd"
>>  >  # pw-cat needs sndfile packageconfig to be enabled
>>  > +PACKAGECONFIG[udev] = "-Dudev=enabled,-Dudev=disabled,udev"
>>  >  PACKAGECONFIG[v4l2] = "-Dv4l2=enabled,-Dv4l2=disabled,udev"
>>  > +PACKAGECONFIG[volume] = "-Dvolume=enabled,-Dvolume=disabled"
>>  > +PACKAGECONFIG[vulkan] = 
>> "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-headers vulkan-loader"
>>  >  PACKAGECONFIG[webrtc-echo-cancelling] = 
>> "-Decho-cancel-webrtc=enabled,-Decho-cancel-webrtc=disabled,webrtc-audio-processing"
>>  >
>>  >  PACKAGESPLITFUNCS:prepend = " split_dynamic_packages "
>>  > @@ -227,10 +231,15 @@ PACKAGES_DYNAMIC = "^${PN}-spa-plugins.* 
>> ^${PN}-modules.*"
>>  >  SYSTEMD_SERVICE:${PN} = "${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 
>> 'systemd-system-service', 'pipewire.service', '', d)}"
>>  >  CONFFILES:${PN} += "${datadir}/pipewire/pipewire.conf"
>>  >  FILES:${PN} = " \
>>  > -    ${datadir}/pipewire/pipewire.conf \
>>  > -    ${systemd_system_unitdir}/pipewire.* \
>>  > -    ${systemd_user_unitdir}/pipewire.* \
>>  > +    ${datadir}/pipewire \
>>  > +    ${systemd_system_unitdir}/pipewire* \
>>  > +    ${systemd_user_unitdir}/pipewire* \
>>  >      ${bindir}/pipewire \
>>  > +    ${bindir}/pipewire-avb \
>>  > +"
>>  > +
>>  > +RRECOMMENDS:${PN} += " \
>>  > +    ${PN}-media-session \
>>  >  "
>>  >
>>  >  FILES:${PN}-dev += " \
>>  > --
>>  > 2.34.1
>>  >
>>  >
>>  > -=-=-=-=-=-=-=-=-=-=-=-
>>  > Links: You receive all messages sent to this group.
>>  > View/Reply Online (#98312): 
>> <https://lists.openembedded.org/g/openembedded-devel/message/98312>
>>  > Mute This Topic: 
>> <https://lists.openembedded.org/mt/93090043/1997914>
>>  > Group Owner: openembedded-devel+owner@lists.openembedded.org 
>> <mailto:openembedded-devel+owner@lists.openembedded.org>
>>  > Unsubscribe: 
>> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
>> [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
>>  > -=-=-=-=-=-=-=-=-=-=-=-
>>  >


--=-9HTVP709CF/WBFHTxmA/
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Hi Khem,</div><div><br></div><div><div>I can't reproduce your compile error but i sent a v2 that will hopefully fix it and also tried to avoid that licensing issues.</div><div><br></div><div>Meanwhile i also did some testing with wireplumber. Both media-session and wireplumber are working well for me after i updated the wireplumber recipe. I'll send a patch for wireplumber also. Modules and systemd-user-service needed to be installed to get it running.</div></div></div><div id="geary-quote" dir="auto"><br>Am Do, 18. Aug 2022 um 10:57:13 -0700 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">also a compiler error here

<a href="https://errors.yoctoproject.org/Errors/Details/668536/">https://errors.yoctoproject.org/Errors/Details/668536/</a>

On Thu, Aug 18, 2022 at 10:53 AM Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:
<blockquote>
 We have some issues with this w.r.t licenses

 ERROR: Nothing PROVIDES 'fdk-aac' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
 DEPENDS on or otherwise requires it)
 fdk-aac was skipped: because it has a restricted license 'commercial'.
 Which is not listed in LICENSE_FLAGS_ACCEPTED
 ERROR: Nothing RPROVIDES 'pipewire-media-session-dev' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'pipewire-media-session-dev'
 NOTE: Runtime target 'pipewire-media-session-dev' is unbuildable, removing...
 Missing or unbuildable dependency chain was: ['pipewire-media-session-dev']
 ERROR: Nothing RPROVIDES 'pipewire-media-session' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb,
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'pipewire-media-session'
 NOTE: Runtime target 'pipewire-media-session' is unbuildable, removing...
 Missing or unbuildable dependency chain was: ['pipewire-media-session']
 ERROR: Nothing RPROVIDES 'pipewire' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb,
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.9.bb,
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'pipewire'
 NOTE: Runtime target 'pipewire' is unbuildable, removing...
 Missing or unbuildable dependency chain was: ['pipewire']
 ERROR: Nothing RPROVIDES 'wireplumber-scripts' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.9.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'wireplumber-scripts'
 NOTE: Runtime target 'wireplumber-scripts' is unbuildable, removing...
 Missing or unbuildable dependency chain was: ['wireplumber-scripts']
 ERROR: Nothing RPROVIDES 'wireplumber-dev' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.9.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'wireplumber-dev'
 NOTE: Runtime target 'wireplumber-dev' is unbuildable, removing...
 Missing or unbuildable dependency chain was: ['wireplumber-dev']
 ERROR: Nothing RPROVIDES 'wireplumber-modules-meta' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.9.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'wireplumber-modules-meta'
 NOTE: Runtime target 'wireplumber-modules-meta' is unbuildable, removing...
 Missing or unbuildable dependency chain was: ['wireplumber-modules-meta']
 ERROR: Nothing RPROVIDES 'wireplumber' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.9.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'wireplumber'
 NOTE: Runtime target 'wireplumber' is unbuildable, removing...
 Missing or unbuildable dependency chain was: ['wireplumber']
 ERROR: Nothing RPROVIDES 'pipewire-modules-protocol-pulse' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'pipewire-modules-protocol-pulse'
 NOTE: Runtime target 'pipewire-modules-protocol-pulse' is unbuildable,
 removing...
 Missing or unbuildable dependency chain was: ['pipewire-modules-protocol-pulse']
 ERROR: Nothing RPROVIDES 'pipewire-spa-plugins-meta' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'pipewire-spa-plugins-meta'
 NOTE: Runtime target 'pipewire-spa-plugins-meta' is unbuildable, removing...
 Missing or unbuildable dependency chain was: ['pipewire-spa-plugins-meta']
 ERROR: Nothing RPROVIDES 'pipewire-modules-protocol-native' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'pipewire-modules-protocol-native'
 NOTE: Runtime target 'pipewire-modules-protocol-native' is
 unbuildable, removing...
 Missing or unbuildable dependency chain was:
 ['pipewire-modules-protocol-native']
 ERROR: Nothing RPROVIDES 'pipewire-spa-plugins-support' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'pipewire-spa-plugins-support'
 NOTE: Runtime target 'pipewire-spa-plugins-support' is unbuildable, removing...
 Missing or unbuildable dependency chain was: ['pipewire-spa-plugins-support']
 ERROR: Nothing RPROVIDES 'pipewire-modules-meta' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'pipewire-modules-meta'
 NOTE: Runtime target 'pipewire-modules-meta' is unbuildable, removing...
 Missing or unbuildable dependency chain was: ['pipewire-modules-meta']
 ERROR: Nothing RPROVIDES 'pipewire-dev' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'pipewire-dev'
 NOTE: Runtime target 'pipewire-dev' is unbuildable, removing...
 Missing or unbuildable dependency chain was: ['pipewire-dev']
 ERROR: Nothing RPROVIDES 'pipewire-modules-client-node' (but
 /mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
 RDEPENDS on or otherwise requires it)
 No eligible RPROVIDERs exist for 'pipewire-modules-client-node'
 NOTE: Runtime target 'pipewire-modules-client-node' is unbuildable, removing...
 Missing or unbuildable dependency chain was: ['pipewire-modules-client-node']

 On Wed, Aug 17, 2022 at 12:48 PM Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
 &gt;
 &gt; Add the configuration to make pipewire work as a drop-in replacement for pulseaudio-server.
 &gt;
 &gt; Add pipewire-media-session as a standalone recipe, since pipewire would fetch the code as a
 &gt; subproject at do_configure.
 &gt;
 &gt; Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 &gt; ---
 &gt;  .../pipewire/pipewire-media-session_0.4.1.bb  | 22 +++++++++++++++
 &gt;  ...{pipewire_0.3.50.bb =&gt; pipewire_0.3.56.bb} | 27 ++++++++++++-------
 &gt;  2 files changed, 40 insertions(+), 9 deletions(-)
 &gt;  create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
 &gt;  rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.50.bb =&gt; pipewire_0.3.56.bb} (93%)
 &gt;
 &gt; diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
 &gt; new file mode 100644
 &gt; index 000000000..bec911fc5
 &gt; --- /dev/null
 &gt; +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
 &gt; @@ -0,0 +1,22 @@
 &gt; +SUMMARY = "PipeWire Media Session is an example session manager for PipeWire"
 &gt; +HOMEPAGE = "<a href="https://gitlab.freedesktop.org/pipewire/media-session">https://gitlab.freedesktop.org/pipewire/media-session</a>"
 &gt; +LICENSE = "MIT"
 &gt; +
 &gt; +LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a" "="">file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a"</a>
 &gt; +
 &gt; +DEPENDS = " \
 &gt; +       pipewire \
 &gt; +       alsa-lib \
 &gt; +       dbus \
 &gt; +"
 &gt; +
 &gt; +RDEPENDS:${PN} = "pipewire"
 &gt; +
 &gt; +SRC_URI = "git://gitlab.freedesktop.org/pipewire/media-session.git;protocol=https;branch=master"
 &gt; +
 &gt; +S = "${WORKDIR}/git"
 &gt; +SRCREV = "e5d5cf2404786af8bcc40bdb8a2962bef4ec18b6"
 &gt; +
 &gt; +inherit meson pkgconfig
 &gt; +
 &gt; +FILES:${PN} += "${libdir} ${datadir}"
 &gt; diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
 &gt; similarity index 93%
 &gt; rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
 &gt; rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
 &gt; index c176c6eeb..7a913d5f9 100644
 &gt; --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
 &gt; +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
 &gt; @@ -13,10 +13,9 @@ LIC_FILES_CHKSUM = " \
 &gt;
 &gt;  DEPENDS = "dbus ncurses"
 &gt;
 &gt; -SRCREV = "64cf5e80e6240284e6b757907b900507fe56f1b5"
 &gt; +SRCREV = "f274e53d25ee8f483ac6fce9e516bb1830abe88b"
 &gt;  SRC_URI = " \
 &gt;         git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=master;protocol=https \
 &gt; -       <a href="file://0001-spa-fix-c90-header-include.patch">file://0001-spa-fix-c90-header-include.patch</a> \
 &gt;  "
 &gt;
 &gt;  S = "${WORKDIR}/git"
 &gt; @@ -73,11 +72,12 @@ EXTRA_OEMESON += " \
 &gt;  "
 &gt;
 &gt;  PACKAGECONFIG:class-target ??= "\
 &gt; +    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'gstreamer', 'gstreamer', 'ffmpeg', d)} \
 &gt;      <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
 &gt; -    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
 &gt; -    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'systemd', 'systemd systemd-system-service', '', d)} \
 &gt; -    <a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'alsa', d)} \
 &gt; -    gstreamer jack libusb pw-cat raop sndfile v4l2 \
 &gt; +    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'bluetooth', 'bluez bluez-aac', '', d)} \
 &gt; +    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'systemd', 'systemd systemd-system-service systemd-user-service', '', d)} \
 &gt; +    <a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'alsa dbus vulkan pulseaudio', d)} \
 &gt; +    jack libusb pw-cat raop sndfile v4l2 udev volume \
 &gt;  "
 &gt;
 &gt;  # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
 &gt; @@ -96,6 +96,7 @@ PACKAGECONFIG[jack] = "-Djack=enabled,-Djack=disabled,jack,,,pipewire-jack"
 &gt;  PACKAGECONFIG[libcamera] = "-Dlibcamera=enabled,-Dlibcamera=disabled,libcamera"
 &gt;  PACKAGECONFIG[libcanberra] = "-Dlibcanberra=enabled,-Dlibcanberra=disabled,libcanberra"
 &gt;  PACKAGECONFIG[libusb] = "-Dlibusb=enabled,-Dlibusb=disabled,libusb"
 &gt; +PACKAGECONFIG[pulseaudio] = "-Dlibpulse=enabled,-Dlibpulse=disabled,pulseaudio"
 &gt;  PACKAGECONFIG[pipewire-alsa] = "-Dpipewire-alsa=enabled,-Dpipewire-alsa=disabled,alsa-lib"
 &gt;  PACKAGECONFIG[pipewire-jack] = "-Dpipewire-jack=enabled -Dlibjack-path=${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=disabled,jack,,,jack"
 &gt;  PACKAGECONFIG[pw-cat] = "-Dpw-cat=enabled,-Dpw-cat=disabled"
 &gt; @@ -109,7 +110,10 @@ PACKAGECONFIG[systemd-system-service] = "-Dsystemd-system-service=enabled,-Dsyst
 &gt;  # currently lacks the feature of enabling user services.
 &gt;  PACKAGECONFIG[systemd-user-service] = "-Dsystemd-user-service=enabled,-Dsystemd-user-service=disabled,systemd"
 &gt;  # pw-cat needs sndfile packageconfig to be enabled
 &gt; +PACKAGECONFIG[udev] = "-Dudev=enabled,-Dudev=disabled,udev"
 &gt;  PACKAGECONFIG[v4l2] = "-Dv4l2=enabled,-Dv4l2=disabled,udev"
 &gt; +PACKAGECONFIG[volume] = "-Dvolume=enabled,-Dvolume=disabled"
 &gt; +PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-headers vulkan-loader"
 &gt;  PACKAGECONFIG[webrtc-echo-cancelling] = "-Decho-cancel-webrtc=enabled,-Decho-cancel-webrtc=disabled,webrtc-audio-processing"
 &gt;
 &gt;  PACKAGESPLITFUNCS:prepend = " split_dynamic_packages "
 &gt; @@ -227,10 +231,15 @@ PACKAGES_DYNAMIC = "^${PN}-spa-plugins.* ^${PN}-modules.*"
 &gt;  SYSTEMD_SERVICE:${PN} = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'systemd-system-service', 'pipewire.service', '', d)}"
 &gt;  CONFFILES:${PN} += "${datadir}/pipewire/pipewire.conf"
 &gt;  FILES:${PN} = " \
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
 &gt; +RRECOMMENDS:${PN} += " \
 &gt; +    ${PN}-media-session \
 &gt;  "
 &gt;
 &gt;  FILES:${PN}-dev += " \
 &gt; --
 &gt; 2.34.1
 &gt;
 &gt;
 &gt; -=-=-=-=-=-=-=-=-=-=-=-
 &gt; Links: You receive all messages sent to this group.
 &gt; View/Reply Online (#98312): <a href="https://lists.openembedded.org/g/openembedded-devel/message/98312">https://lists.openembedded.org/g/openembedded-devel/message/98312</a>
 &gt; Mute This Topic: <a href="https://lists.openembedded.org/mt/93090043/1997914">https://lists.openembedded.org/mt/93090043/1997914</a>
 &gt; Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
 &gt; Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
 &gt; -=-=-=-=-=-=-=-=-=-=-=-
 &gt;
</blockquote></div></blockquote></div>
--=-9HTVP709CF/WBFHTxmA/--


