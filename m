Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1464FC4167B
	for <webhook@archiver.kernel.org>; Sun, 26 Nov 2023 20:23:13 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.65284.1701030191804774508
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Nov 2023 12:23:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout07.t-online.de (Postfix) with SMTP id 0FCFD5058C
	for <openembedded-devel@lists.openembedded.org>; Sun, 26 Nov 2023 21:23:09 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.162.199]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r7Lem-461L7Z0; Sun, 26 Nov 2023 21:23:08 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: upgrade 0.3.85 > 1.0.0
Date: Sun, 26 Nov 2023 21:23:33 +0100
Message-ID: <20231126202333.890649-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1701030188-66FFA968-8F291895/0/0 CLEAN NORMAL
X-TOI-MSGID: 2b0cf833-f703-46f7-a316-c91936529ce3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Nov 2023 20:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107054

The PipeWire project is immensely proud to announce the 1.0 release
of PipeWire.

It is API and ABI compatible with previous 0.3.x releases.

 "PipeWire represents the next evolution of audio handling for Linux, tak=
ing
 the best of both pro-audio (JACK) and desktop audio servers (PulseAudio)=
 and
 linking them into a single, seamless, powerful new system."
    - Paul Davis, JACK and Ardour author

 "What exciting times! PipeWire 1.0 is the culmination of 15 years of
 Linux audio expertise, blending lessons from PulseAudio into a high-perf=
ormance,
 flexible, and user-friendly foundation for audio and multimedia on Linux=
.
 I'm looking forward to the next decade of progress in the free software
 consumer and professional audio space!."
    - Arun Raghavan, PulseAudio developer/maintainer.

 "I'm thrilled to witness the first stable release of PipeWire after five=
 years
 of collaboration with its remarkable community, pushing the boundaries o=
f
 multimedia integration in the Linux ecosystem one step further.=E2=80=9D
    - George Kiagiadakis, WirePlumber author

 "From the beginning of the libcamera project, we have always seen
 PipeWire as the solution to handle desktop and mobile integration and
 give a seemless multimedia integration to users while providing security
 features and resource sharing between applications."
    - Kieran Bingham, libcamera author

Happy Holidays!

Highlights
  - Fix a memfd/dmabuf leak when uploading buffers while shutting down.
  - Handle concurrent jack_port_get_buffer() calls because ardour seems t=
o
    be doing this.
  - Improve time reporting (less jitter) in ALSA when using IRQ.
  - Many doc improvements.

PipeWire
  - Respect PIPEWIRE_DLCLOSE everywhere, remove pw_in_valgrind().
  - Remove a warning when a client tries to change ignored properties.

Modules
  - Fix a memfd/dmabuf leak when uploading buffers while shutting down.
  - Fix a potential segfault when copying mix structures. (#3658)
  - Avoid races in setrlimit in module-rt.
  - Fix a memory leak in filter-chain.
  - Set rtp.ptime on senders, not receivers.
  - The ROC modules were ported to ROC 0.3

SPA
  - Improve time reporting (less jitter) in ALSA when using IRQ. (#3657)
  - Add latency param query in libcamera.
  - Fix some compiler warnings.
  - The EVL plugin was updated.

Bluetooth
  - LC3 codec and compatibility improvements.

Pulse server
  - Fix emission of events when a sink/source state changes. (#3660)

JACK
  - Improve transport and time handling. Use unique ids to make consisten=
t
    snapshots of the current time and transport.
  - Avoid enumerating port params that we are not going to use.
  - Optimize buffer reuse.
  - Handle concurrent jack_port_get_buffer() calls because ardour seems t=
o
    be doing this. (#3632)

Docs
  - Many doc improvements.
  - Add man pages for pw-dump, pw-loopback, modules, pipewire-pulse.
  - Manpages are now made with Doxygen.
  - Add docs for pulse-modules

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.85.bb =3D> pipewire_1.0.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.85.bb =3D=
> pipewire_1.0.0.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.85.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.85.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb
index 883d02d51..b4da781f0 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.85.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "7db1e7f643a454056327999b2d8e35d8097b5593"
+SRCREV =3D "4debdcd40b055b3eaa83a8f4443aa990ea566bfe"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.42.1


