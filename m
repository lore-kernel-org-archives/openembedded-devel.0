Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4F4C6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 11:41:44 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.17158.1678707701584974955
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Mar 2023 04:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout09.t-online.de (Postfix) with SMTP id 5CF0D1D7E6
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Mar 2023 12:41:39 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.185]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pbgYd-2PoLzd0; Mon, 13 Mar 2023 12:41:39 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH 1/2] pipewire: update 0.3.66 -> 0.3.67
Date: Mon, 13 Mar 2023 12:41:29 +0100
Message-Id: <20230313114130.144008-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1678707699-432C3378-D9CC4B3F/0/0 CLEAN NORMAL
X-TOI-MSGID: 025b3a44-d82b-48c5-a122-959c9d2ae6bc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Mar 2023 11:41:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101511

This is a bugfix release that is API and ABI compatible with previous
0.3.x releases.

  - The loopback module and other couples streams will now not randomly
    fail in some cases. (#3028)
  - The RTP module now has support for sending and receiving MIDI as
    well.
  - The compress offload sink has seen many improvements. It now uses
    ioctls directly to bypass limitations of tinycompress (to be able
    to detect the available codecs, for example).
  - Pulse server compatibility was improved for some apps by improving
    the format parsing and FIX_ stream flag handling.
  - The min quantum in the pulse server was changed from 256/48000 to
    128/48000 to fix some issues with games that expect 5ms or less of
    latency.
  - The Bluetooth plugin has seen many improvements in packet scheduling
    to attempt to reduce stuttering on some devices.
  - The ALSA plugin now handles some impossible cases better. This fixes
    recording in QEMU again. (#2971)

  - SPDX tags were added to the code for copyright information.
  - The random number functions were made more usable.
  - The port property code was moved from the adapter to the port
    implementation itself to make it more useful and unified for the
    cases where no adapter is used (midi and video).
  - Fix a potential overflow in mixer areas.
  - Improve runnable state calculations of nodes. This is part of
    ongoing work to avoid running nodes that should not need to run.
  - The stream will now always call the process function when using
    trigger, even if there are no buffers. This avoids stalls of the
    processing graph in some cases. (#3028)
  - Links are now marked as passive by PipeWire itself so that
    the right thing happens in all cases.
  - Implement the in/out/true values for the node.passive property.
    Place a passive state on ports to make passive links on a port
    by port basis.

  - pw-cat has seen improvements in the encoded file playback case.

  - The rtp module has support for MIDI now.
  - DSCP is now configurable in the RTP module.
  - The loopback module doesn't randomly fail to work anymore. (#3028)

  - The null-audio sink can now be given a format and it will return this
    instead of the default float ones. This makes it possible to make a
    null-sink that has a given format.
  - The compress offload sink has seen many improvements. It now no longe=
r
    uses tinycompress to be able to detect the available codecs.
  - The ALSA plugin now handles some impossible cases better. (#2971)
  - Fix compilation on older compilers. (#3050)

  - The FIX_ flags are now implemented more correctly by fixating the
    stream to the format of the sink/source they ask to be connected to.
    There is now also an option to override the fixation based on rules.
  - Format parsing was improved and should now support all format strings
    supported by pulseaudio including upper and lower case variants
    and shortcuts.
  - Channelmap parsing was improved and should now reject invalid
    channelmaps as well as support the shortcuts supported by pulseaudio.
  - Escape codes in module arguments now work as it does in pulseaudio. (=
#3071)
  - The min quantum was changed from 256/48000 to 128/48000 to fix some
    issues with games that expect 5ms or less of latency.

  - jack.passive-links can now be used to have a JACK client make passive
    links and the node.passive property is no longer used for this becaus=
e
    it has a different function.
  - The qsynth rule was updated to the new node.passive features. It is n=
ow
    only passive on the output side.

  - BAP delay and transport latency are handled now.
  - A2DP and SCO can now use bigger buffers to improve quality when the
    reception is jittery.
  - The AT+BCC command is now implemented.
  - Packet encoding now happens ahead of time when possible to avoid dela=
ys
    before sending it.
  - Source should now always produce complete (padded) buffers to avoid s=
ync
    problems.
  - Don't set unnecessary socket options.

  - The pipewiresrc now has an autoconnect argument.
  - The metadata plane count is now handled correctly in more cases.
  - Stream errors are now handled correctly to stop the GStreamer element=
s.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.66.bb =3D> pipewire_0.3.67.bb}        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.66.bb =3D=
> pipewire_0.3.67.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.66.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.67.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.66.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.67.bb
index a7c77463e..0d4dd63f9 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.66.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.67.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "08b0ed65765a1033424a5c0d897a392a61f8a2a3"
+SRCREV =3D "26623ff8cb3c9ba774537379a1835c5efb0d5159"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
@@ -288,6 +288,7 @@ FILES:${PN}-tools =3D " \
     ${bindir}/pw-dot \
     ${bindir}/pw-dsdplay \
     ${bindir}/pw-dump \
+    ${bindir}/pw-encplay \
     ${bindir}/pw-link \
     ${bindir}/pw-loopback \
     ${bindir}/pw-metadata \
--=20
2.34.1


