Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E73CCC77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 15:53:19 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.23673.1682697196302579985
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Apr 2023 08:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout06.t-online.de (Postfix) with SMTP id 41CF0E03F
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Apr 2023 17:53:14 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.154.162.236]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1psQPG-0mYVRB0; Fri, 28 Apr 2023 17:53:10 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] pipewire: update 0.3.68 -> 0.3.70
Date: Fri, 28 Apr 2023 17:52:56 +0200
Message-Id: <20230428155256.1614201-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1682697190-BD176C11-7190C596/0/0 CLEAN NORMAL
X-TOI-MSGID: 94f2f637-51a4-401e-8715-7573bc4fdbf2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Apr 2023 15:53:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102224

This is a quick bugfix release that is API and ABI compatible with previo=
us
0.3.x releases.

  - Fix a regression in the scheduler that could keep some nodes IDLE.
  - Fix a regression in the biquad filters in filter-chain.
  - Fix a regression and potential crash in the ALSA mixer probing.
  - Fix a regression in pipewiresrc with timestamps that could cause chee=
se
    to record video with wrong timestamps.
  - Beamforming support was enabled in the echo-canceler.
  - pulse-tunnel and raop-sink will now proxy local volume changes to the
    remote end.
  - More bugfixes and improvements.

  - Fix a bug in the graph scheduler where some nodes might stay IDLE in
    some cases (like when connecting the source of the echo-canceler to t=
he
    sink).
  - pw-metadata can now be created from the factory with initial values f=
or
    the metadata. (#3076)
  - Conditions were added to the pipewire config file to make it possible=
 to
    configure the access module and the exec sections.
  - Support was added in pw-stream to intercept and override properties f=
or
    the adapter. This can be used to implement custom volume control, for
    example.

  - pw-metadata can now list all available metadata objects with the -l
    option.
  - A new pw-config tool was added to debug configuration file loading an=
d
    parsing.

  - The webrtc echo canceler now supports beamforming. You can provide th=
e
    coordinates of the microphones and let webrtc perform beamforming on
    the captured samples to improve quality and remove noise.
  - Fix a regression in the filter-chain with biquad filters. (#3161) and
    improve error reporting.
  - The pulse-tunnel will now proxy the volume changes to the remote end.
  - The RAOP sink will now send volume parameters to control the volume
    remotely. (#2061)

  - One ALSA commit was not correctly reverted and might cause crashes.
  - The ALSA sink and source now calculate the ALSA ringbuffer memory
    location more correctly wich might improve compatibility with some
    hardware.
  - v4l2 now sets the values of the controls in the Props param.

  - The echo-canceler aec_args are now parsed like they would be under
    pulseaudio.

  - More work on synchronizing BAP devices.

  - The GStreamer source can now renegotiate the format when it changes.
  - The GStreamer source now uses the BaseSrc clocking code to implement
    the clock and timing code.

This is a quick bugfix release that is API and ABI compatible with previo=
us
0.3.x releases.

  - Reverted the UCM changes, they seem to cause regressions causing audi=
o
    to be muted in some cases.
  - Fix a regression in the scheduler where a driver node might not be ma=
rked
    runnable in some cases, like when echo-cancel is used. (#3145)
  - Handle links from the driver to itself. This makes the midi bridge wo=
rk
    again. (#3153)
  - ALSA rate matching for sources was fixed. It would previously wait to=
o
    long for rate matching and then cause drift. This should reduce
    crackling and stuttering whan capturing in low latency.
  - Fix the GStreamer clock to make cheese video recording work again. (#=
3149)
  - More fixes and improvements.

  - Fix a regression in the scheduler where a driver node might not be ma=
rked
    runnable in some cases, like when echo-cancel is used. (#3145)
  - Handle links from the driver to itself. This makes the midi bridge wo=
rk
    again. (#3153)
  - Some man pages were improved.
  - Fix a potential crash when thread-loop is destroyed before the loop.
    (#3150)

  - A new raw biquad filter was added to filter-chain. You can manually s=
et the
    6 parameters and you can use this to create custom filters per sample=
 rate.
    (#3139)
  - The echo-canceler now supports different channels for the capture and=
 playback
    streams.

  - A SB Audigy specific profile set was added to make better use of the
    controls. (#2934)
  - More ALSA IRQ based scheduling improvements.
  - ALSA rate matching for sources was fixed. It would previously wait to=
o
    long for rate matching and then cause drift. This should reduce
    crackling and stuttering whan capturing in low latency.
  - The echo-cancel plugin API has a new method to make it possible to ha=
ve
    different channels for capture, source and playback.
  - Reverted the UCM changes, they seem to cause regressions causing audi=
o
    to be muted in some cases.

  - Many more BAP fixes and improvements. Devices are now created as a se=
t
    and can be combined into one device by the session manager.

  - Fix the GStreamer clock to make cheese video recording work again. (#=
3149)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.68.bb =3D> pipewire_0.3.70.bb}        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.68.bb =3D=
> pipewire_0.3.70.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.68.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.70.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.68.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.70.bb
index 9e0142d94..56595e768 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.68.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.70.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "950c4487e96c7941f58311a066f4ba8289ca984a"
+SRCREV =3D "9f7d60c1e84cc0481afc3f6ccf76e127567943a8"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
@@ -284,6 +284,7 @@ RDEPENDS:libpipewire +=3D " \
 FILES:${PN}-tools =3D " \
     ${bindir}/pw-cat \
     ${bindir}/pw-cli \
+    ${bindir}/pw-config \
     ${bindir}/pw-dot \
     ${bindir}/pw-dsdplay \
     ${bindir}/pw-dump \
--=20
2.34.1


