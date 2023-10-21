Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89FBC001E0
	for <webhook@archiver.kernel.org>; Sat, 21 Oct 2023 05:36:34 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.73311.1697866588159841969
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Oct 2023 22:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout02.t-online.de (Postfix) with SMTP id EA5121738E
	for <openembedded-devel@lists.openembedded.org>; Sat, 21 Oct 2023 07:36:25 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.172.4]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qu4ev-1Eyrsv0; Sat, 21 Oct 2023 07:36:25 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] pipewire: Update 0.3.81 -> 0.3.83
Date: Sat, 21 Oct 2023 07:36:43 +0200
Message-ID: <20231021053643.36948-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1697866585-72FFAD60-3B23593B/0/0 CLEAN NORMAL
X-TOI-MSGID: cf532969-5fc4-4477-9ab8-4d66e26f7e05
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Oct 2023 05:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105625

PipeWire 0.3.83 (2023-10-19)

This is the third 1.0 release candidate that is API and ABI compatible
with previous 0.3.x releases.

Highlights
  - A quantum change regression was fixed.
  - Use a 2 socket server now for the manager and the applications
    with (when wireplumber is updated) different permissions.
  - Reduce memory usage a little in audioconvert and use fewer buffers.
  - Some JACK deadlocks were fixed.
  - More bugfixes and improvements.

PipeWire
  - Fix quantum change regression. (#3574)
  - Use a 2 socket server by default. One for the session-manager and one
    for applications.
  - Fix a potential use-after-free in node and device cleanup. (#3588)

modules
  - Some hardcoded buffer size limits were removed.
  - Fix ASYNC flag on combined-streams.
  - Add support for on-demand combined-streams using metadata.

SPA
  - alsa-udev will now ignore PCMs with the ACP_IGNORE udev environment
    variable. (#3570)
  - The audioadapter now uses at least 2 buffers when the follower is
    async.
  - The number of buffers used by plugins was tweaked a little. Most
    plugins now only ask 1 buffer.
  - Memory usage in audioconvert was reduced.
  - Fix some unaligned reads and writes and undefined left shifts reporte=
d
    by ASAN. (#3572)
  - Rework vulkan dependency checking.
  - Don't try to link ALSA devices when prepare fails. This fixes some
    crashes.
  - Fix a stall when the allowed codecs are changed in ALSA.
  - Improve ALSA rate control for sources to avoid xruns. (#3584)
  - Try to fix IEC958 TrueHD and DTS playback. (#2284)

Bluetooth
  - Improve fallback SCO mtu when the kernel doesn't tell us.

JACK
  - The fixed buffer size limit was removed.
  - Add an option to make input buffers writable (default true).
  - A potential deadlock was fixed when applications lock the process
    function. (#3585)
  - Use a separate thread to dispatch notifications to avoid deadlocks.
    (#3585)
  - Potentially fix silent export in ardour in some cases. (#3514)

Older versions:

PipeWire 0.3.82 (2023-10-13)

This is the second 1.0 release candidate that is API and ABI compatible
with previous 0.3.x releases.

Highlights
  - Fix a regression in some devices when the Pro-Audio profile was selec=
ted.
    Only enable the IRQ based scheduling and device linking in specific
    safe cases. (#3556)
  - Improve rate switching. In some cases the graph rate would not switch
    correctly. (#2929)
  - Fix regression in alsa wakeups that would cause silence in VMs.
  - Fix a leak in the SBC codecs for SCO.
  - More improvements to the RAOP module.
  - Other small improvements and fixes.

PipeWire
  - Improve client property checks.
  - Allow non-power-of-2 quantums when forced.
  - Improve rate switching. In some cases the graph rate would not switch
    correctly. (#2929)
  - The PIPEWIRE_QUANTUM env variable now forces the size and rate in the
    graph for the duration of the application. The softer PIPEWIRE_LATENC=
Y
    and PIPEWIRE_RATE can still be used to merely suggest a maximum laten=
cy
    and a rate.

modules
  - Remove the RTSP FLUSH request in RAOP because it does not seem necess=
ary.
  - The RAOP module now uses the common RTP stream functions.
  - Add sockets option to protocol-native to make pipewire listen on mult=
iple
    sockets.

SPA
  - Clean up some of the log functions.
  - Add an option in ALSA to disable linking devices together.
  - Only link pcms together when 1 capture and 1 playback pcm. For more c=
omplex
    devices we can't be sure which ones can be linked. (#3556)
  - disable tsched only when using linked devices.
  - Add some extra checks in ALSA to avoid segfaults. (#3554)
  - Add Tag support to alsa-sink and alsa-source.
  - Use dynamic pod builder when we can.
  - Set priority.driver on midi-bridge to allow it as a fallback driver. =
(#3562)
  - Fix regression in alsa wakeups. (#3565)
  - The PTP clock can now be found from the interface in node-driver.

pulse-server
  - Some small cleanups and internal improvements.
  - Add some memory debugging messages.
  - Add Tag messages to streams.

Bluetooth
  - Fix a leak in the SBC codecs for SCO.

JACK
  - Patch up midi events in the destination buffer instead of writing to =
the
    source buffer. (#3580)
  - Group all jack clients together to avoid transport issues. (#3562)

ALSA-plugins
  - Add also.deny option to block alsa clients from opening the PCM.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.81.bb =3D> pipewire_0.3.83.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.81.bb =3D=
> pipewire_0.3.83.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.81.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.83.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.81.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.83.bb
index 2a3699f93..2414f1397 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.81.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.83.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "181fbfee6d3fcc3afd3c93613f126a8346dad586"
+SRCREV =3D "6fd7f39dbec9c3a65aa2de0123c6bfbda7c53a85"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
--=20
2.42.0


