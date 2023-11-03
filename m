Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6134C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:07:13 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.36377.1698995228079460665
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout01.t-online.de (Postfix) with SMTP id B2D2D3EDC3
	for <openembedded-devel@lists.openembedded.org>; Fri,  3 Nov 2023 08:07:05 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.33.140]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qyoGn-1rH49R0; Fri, 3 Nov 2023 08:07:05 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: Update 0.3.83 -> 0.3.84
Date: Fri,  3 Nov 2023 08:07:28 +0100
Message-ID: <20231103070728.169261-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1698995225-3CFF6EA2-B3141367/0/0 CLEAN NORMAL
X-TOI-MSGID: 41544905-6cc4-4db1-b062-a1fd2a15e3cb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 07:07:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105850

PipeWire 0.3.84 (2023-11-02)

This is the fourth 1.0 release candidate that is API and ABI compatible
with previous 0.3.x releases.

 Highlights
  - Fix a regression with openal because the queued buffers in the stream
    were not reported correctly.
  - Fix a bug in port busy counters that could cause random silent links.
  - Fix a regression in echo-cancel because it was not reporting its
    streams as ASYNC.
  - Fix a JACK regression where not all ports were enumerated in all case=
s.
  - Many more fixes and improvements.

 PipeWire
  - pw_stream now reports the queued buffers more accurately. This fixes
    a regression when using openal. (#3592)
  - The port busy counters were not updated correctly in some cases. This
    could lead to negotiation errors and silent links. (#3547)
  - Ignore latency maximum when forcing rate/quantum. (#3613)
  - Nodes can now be added to multiple groups and link-groups. (#3612)

 Modules
  - The filter-chain now also handles notify port dependencies
    correctly. (#3596)
  - Filter-chain has support for new linear, clamp, recip, exp, log, mult=
,
    sine builtin plugins.
  - The echo-cancel module now correctly reports its playback and capture
    streams as ASYNC to avoid running out of buffers. (#3593)
  - It is now possible to specify an array of remote names to connect to
    with the native protocol.
  - module-rtp-sap and module-rtp-sink now try to bind to the specified
    interface.

 SPA
  - The alsa plugin now removes the runtime properties such as period-num=
,
    period-size and max-latency when suspended. (#3613)

 Bluetooth
  - BAP Locations/Context is now set on endpoints as required by new blue=
z.
  - Improve selection of BAP leader.

 JACK
  - Add a jack_set_sample_rate() extension function.
  - Make sure we get the info of all nodes/ports before completing the
    jack_client_open() operation so that we can enumerate the ports
    correctly in all cases. (#3618)

 GStreamer
  - Fix types of metadata in pipewiresink.
  - Also copy metadata in buffers in all cases.
  - Fix size allocation in bufferpool for compressed formats.
  - Don't stop streaming thread when unlinked. (#3620)

 ALSA
  - The ALSA plugin now handles NULL values from mmap_areas. (#3600)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.83.bb =3D> pipewire_0.3.84.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.83.bb =3D=
> pipewire_0.3.84.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.83.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.83.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.bb
index 2414f1397..34c4a68ee 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.83.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "6fd7f39dbec9c3a65aa2de0123c6bfbda7c53a85"
+SRCREV =3D "cf46c4f5af6fc026881dbd4e837e71d8e507beef"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.42.0


