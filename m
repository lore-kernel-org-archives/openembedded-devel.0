Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA2BC4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 14:33:59 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.48263.1669386831608621511
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Nov 2022 06:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout12.t-online.de (Postfix) with SMTP id 96CF0BCA2
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 15:33:48 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.139]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oyZm0-2zn0jJ0; Fri, 25 Nov 2022 15:33:48 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] pipewire: upgrade 0.3.60 -> 0.3.61
Date: Fri, 25 Nov 2022 15:33:40 +0100
Message-Id: <20221125143340.63905-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669386828-2DFFA535-50319CC5/0/0 CLEAN NORMAL
X-TOI-MSGID: 3a5f597e-21f0-4960-95f2-2a2426fa0ac5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 14:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99732

PipeWire 0.3.61 (2022-11-24)
This is a bugfix release that is API and ABI compatible with previous
0.3.x releases.

Highlights

Fix a bug in audioadapter that could cause crashes when switching
bluetooth profiles.
Fix sound in QEMU, deadbeef and openal again.
libcamera plugin fixes, dynamic add and remove should now work with
the next wireplumber version.
Fix a regression in pw-midiplay where the first buffer would not
play and some events would be missing.
The network module now doesn't export other network sources
anymore.
pulse-server now detects clients that keep underrunning for a long time
and will pause them to save power.
Many more bugfixes and improvements.

PipeWire

Optimize away some useless graph recalculations.
Increase alternative sample rates from 16 to 32.
FreeBSD and musl build fixes.
Silence some module loading errors when the error can be ignored.
Fix initial buffer requested size for pw-stream when operating in
async mode. This also indirectly fixes the first buffer in
pw-midiplay. (#2843)

Modules

Set the network property on pulse-tunnel streams so that they are
not exported anymore. (#2384)
Filter-chain has optimized mix functions now.

SPA

Handle some errors in libcamera better.
Fix libcamera remove events. Fix the id allocation for devices.
Fix a bug in audioadapter where it would not renegotiate after
a port reconfiguration, leading to crashes, especially when
automatically switching profiles in bluetooth. (#2764)
Do ALSA probing in 44100Hz again. Some devices seem to fail
otherwise for some unknown reason. (#2718)
Force playback start when the ALSA buffer is full. This fixes sound
in QEMU. (#2830)
Support Digital 5.1 AC3 for Asus Xonar SE.
Improve format renegotiation in audioadapter. This makes the ALSA
plugin work again for deadbeef. (#2832)
Fix latency reporting on adapter DSP ports.

pulse-server

Fix a bug where openal based applications would hang. (#2821)
Improve zeroconf publish. Only publish on the address of the first
running server. This avoids duplicate entries for IPv4 and IPv6.
Add support for republish entries when new servers are started.
Add a pulse.idle.timeout option (default to 5 seconds) to pause
streams that have been underrunning for this amount of time. Badly
behaving clients will then not keep the graph and device busy so
that devices can be suspended to save battery. This should give
better default behaviour with speech-dispatcher. (#2839)

JACK

Add an option to configure the filter character.
Fix connect_callbacks. It was only called once for output ports.
(#2841)
Add option to set node.passive on jack clients. Make some quirks
for qsynth to make it suspend and fade out better.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.60.bb =3D> pipewire_0.3.61.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.60.bb =3D=
> pipewire_0.3.61.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.60.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.61.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.60.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.61.bb
index b925cddf6..1d88fe92a 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.60.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.61.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "38382d002d0905d60a964fc84dcaf4f8b507a473"
+SRCREV =3D "f038e3f23824f9319daaa9f9a31600fc6df49a39"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.34.1


