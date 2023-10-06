Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64135E81E1E
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 17:10:33 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.18568.1696612226908046814
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Oct 2023 10:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout10.t-online.de (Postfix) with SMTP id 141DB29103
	for <openembedded-devel@lists.openembedded.org>; Fri,  6 Oct 2023 19:10:25 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.251]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qooLF-1zRJBp0; Fri, 6 Oct 2023 19:10:22 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: Upgrade 0.3.80 -> 0.3.81
Date: Fri,  6 Oct 2023 19:10:14 +0200
Message-ID: <20231006171014.118251-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1696612222-A3FFCED1-42BF1B11/0/0 CLEAN NORMAL
X-TOI-MSGID: 4f723c97-0ce1-433c-8c32-3007d6294f7c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Oct 2023 17:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105372

This is the first 1.0 release candidate that is API and ABI compatible
with previous 0.3.x releases.

  - jackdbus support is now enabled by default.
  - IRQ based scheduling in ALSA was improved and enabled by default for
    Pro-Audio profile. It will also link the pcms together to get lower
    latency. This now matches what JACK does and gives equal latency to
    PipeWire for Pro-Audio profiles.
  - Support both old and new versions of webrtc-audio-processing to make
    the transition easier.
  - Forced quantum changes by nodes or metadata will now also force a
    suspend and resume of the graph, like the rate changes to make sure a=
ll
    nodes adapt to the new quantum. This is important for Pro-Audio nodes
    that need to reconfigure the hardware to a new period in IRQ based
    scheduling.
  - Fix a regression in regex parsing.
  - Many bugfixes and improvements.

  - jackdbus is by default enabled now. The idea is that when jackdbus is
    installed, the real libjack.so is in the path and we can become a
    real JACK client.
  - Forces quantum changes by nodes or metadata will now also force a
    suspend and resume in the graph, like the rate changes to make sure a=
ll
    nodes adapt to the new quantum. This is important for Pro-Audio nodes
    that need to reconfigure the hardware to a new period.
  - The stream now has an EARLY_PROCESS option that can be used to implem=
ent
    custum buffer fill levels. (#3480)
  - Fix a regression in regex parsing. (#3528)
  - Fix a bug in position reporting in the driver node. (#3189) (#3544)
  - Destroying a link will now recalculate the graph correctly.
  - Fix the rate comparison for finding the best rate in the graph.
  - Use malloc_trim() when available to release memory. (#1840)

  - pw-cat now supports DFF DSD files.
  - pw-cli avoid some NULL derefs in some cases.

  - The RAOP sink has seen some cleanups and improvements. It will now as=
k
    for feedback every 2 seconds to keep some devices alive.
  - A bug in filter-chain was fixed where it would fail to apply the gain
    when mixing just one source.
  - The filter-chain can now pass the stream volume to a control in the
    filter-chain graph. (#3434)
  - Improve volume handling in RAOP sink.

  - Some cleanup in the pending_stream handling.
  - Fix a regression in the event emission code where it failed to emit
    a changed event when a node was linked. (#3522)
  - Lower the realtime priority of pulseaudio clients.
  - Set pulse.module.id on the echo-cancel streams. (#3541)

  - Support both old and new versions of webrtc-audio-processing to make
    the transition easier.
  - The ALSA driver now does the sync of all followers directly from the
    wakeup event. This results in more stable rate matching.
  - IRQ based scheduling in ALSA was improved and enabled by default for
    Pro-Audio profile. It will also link the pcms together to get lower
    latency. This now matches what JACK does and gives equal latency to
    PipeWire for Pro-Audio profiles.
  - GNU/Hurd support was added.
  - Some improvements to passthrough handling.

  - Improvements to the codec handling when PipeWire is used as Audio
    Gateway.
  - Adapt to new Bluez API for BAP devices.

  - When the jack library is set in the default library path, avoid using
    LD_LIBRARY_PATH because this can cause confusion.
  - Handle clearing the latency on a port.
  - jack_property now always manages to actually change the metadata beca=
use
    it waits for a roundtrip before exiting.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.80.bb =3D> pipewire_0.3.81.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.80.bb =3D=
> pipewire_0.3.81.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.80.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.81.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.80.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.81.bb
index a134820da..2a3699f93 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.80.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.81.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "35cca08d2bef14248ac25ff2a1efb0bf274d0a6f"
+SRCREV =3D "181fbfee6d3fcc3afd3c93613f126a8346dad586"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.42.0


