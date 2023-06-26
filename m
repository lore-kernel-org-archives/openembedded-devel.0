Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 331A4EB64D9
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 17:58:10 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.3139.1687802286569509263
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jun 2023 10:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout01.t-online.de (Postfix) with SMTP id C23723EC2C
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 19:58:04 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([79.219.228.26]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qDqTU-2648G10; Mon, 26 Jun 2023 19:58:04 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] pipewire: upgrade 0.3.71 -> 0.3.72
Date: Mon, 26 Jun 2023 19:57:58 +0200
Message-Id: <20230626175758.5626-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1687802284-9B685904-419A8DE2/0/0 CLEAN NORMAL
X-TOI-MSGID: b22c8d32-564b-4b9b-bb3e-cff5c564ea5b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 17:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103590

This is a bugfix release that is API and ABI compatible with previous
0.3.x releases.

  - Fix a critical bug that would refuse to update the samplerate or
    buffersize in JACK clients. (#3226)
  - A new module-netjack2-driver and module-netjack2-manager were added
    that are compatible with NETJACK2. This allows PipeWire to become
    a NETJACK2 manager or a driver between JACK2 or PipeWire servers.
  - Support was added for firewire devices with FFADO. This is untested
    for now and MIDI is not implemented yet.
  - The node scheduling was optimized some more. External drivers are now
    as efficient as in-server ones. This should improve performance of
    various drivers such as bluetooth and JACK based drivers.
  - Many, many bug fixes and a ton of improvements.

  - pw-filter can now be used to write sinks and sources.
  - The node activation for drivers was changed. The driver now does not
    need to go to the server to start the processing cycle. This makes
    out-of-server drivers as efficient as in-server drivers.
  - Don't try to use drivers with 0 priority as fallback drivers. This
    avoids making the screencast driver a driver for audio. (#3219)
  - Improve xrun count reporting in pw-top and the profiler. Now each
    node has their own xrun counter updated when it fails to complete
    processing during the cycle.
  - pw-filter now also has support for TRIGGER.
  - A potential fd leak was found when fds were send to a zombie client.
    (#1840)
  - Fix a bug where monitor or capture streams were logged twice in the
    profiler. (#3278)
  - Remove stream hooks safely. (#3251)
  - A bug in serialization of container properties was fixed. This could
    result in truncated property values. (#3290)
  - The PIPEWIRE_AUTOCONNECT environment variable now always overrides th=
e
    autoconnect settings of streams. (#3299)
  - Node, port and link destroy now avoids some useless work.
  - Port will now try to renegotiate a new format when idle. (#3266)

  - The module-sap now is more compatible with AES67.
  - A new FFADO driver module was added. This is completely untested beca=
use
    of lack of hardware. Please test and report issues.
  - A new NETJACK2 driver and a NETJACK2 manager module were added. These
    should be drop in replacements for the JACK2 parts.
  - The RAOP discover module now tries harder to only list devices once.
  - The zeroconf discover module now tries harder to only list devices on=
ce.
  - The RAOP sink module now handles latency better and is compatible wit=
h
    some more devices. (#3247, #3282)
  - The loopback and filter-chain modules now always dequeue the last inp=
ut
    buffer to avoid stuttering in some cases. (#3276)
  - The SPA node factory module can now also export nodes. This is used t=
o
    export the PTP clock from the AES67 config file.
  - A bug in module-jack-tunnel was fixed that would cause stuttering and
    corrupted output in some cases. (#3255)
  - The resampler is now disabled in module-loopback and filter-chain whe=
n
    the samplerate is set to follow the graph rate. (#2969)
  - The way the mixer peer is sent to clients was improved. It is now als=
o
    possible to let a remote node know about mixer port removes, which
    can avoid memory leaks and some code simplifications.

  - Monitor ports now report latency correctly.
  - The ALSA plugin now uses htimestamp to get a more accurate ringbuffer
    position to estimate the clock skew.
  - The channelmixer now has min/max-volume settings to limit or fix the
    volume.
  - The ALSA plugin can now control the playback and capture rate of USB
    gadgets. This can avoid resampling and instead use the USB feedback
    to control the rate.
  - The ALSA output to multiple devices has been improved, some lockups
    are avoided when the device ringbuffer is full.
  - The compress-offload sink has improved negotiation.

  - Only try to use GSettings when the schema exists.
  - @DEFAULT_SOURCE@, @DEFAULT_SINK@ and @DEFAULT_MONITOR@ are now correc=
tly
    handled as targets in playback and capture streams. (#3284)
  - 2 new quirks are added to disable volume updates on sinks/sources.
    (#1517)
  - The virtual-sink and virtual-source modules were added. These are rea=
lly
    example modules but actually also work and are useful on PulseAudio s=
o
    implement them as well.
  - Fix initial stream volumes. (#3306)

  - Only register A2DP or BAP when we have codecs.
  - Include codec into the media.name

  - Fix a critical bug that would refuse to update the samplerate or
    buffersize. (#3226)
  - Improve updates of samplerate/buffersize, delay the updates until the
    client is activated. (#3297)
  - Use the new mix-info updates to simplify the mixer setup and peer
    detection.

  - Fill default strides instead of 0 on pipewire video buffers. (#3236)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.71.bb =3D> pipewire_0.3.72.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.71.bb =3D=
> pipewire_0.3.72.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.71.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.72.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.71.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.72.bb
index 7f117e10b..1e5eef3ab 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.71.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.72.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "bd225b14bbda1a6e2dc7a52780eaf728920e0ff2"
+SRCREV =3D "4cc22d60d2280fb3c771e6a246e79c90819fd485"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.34.1


