Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858D9CA553E
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 13:06:59 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.11758.1694696814101794657
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Sep 2023 06:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout01.t-online.de (Postfix) with SMTP id 0469411E35
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 15:06:52 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.167.3]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qgm3X-2BfR1m0; Thu, 14 Sep 2023 15:06:51 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/2] pipewire: upgrade 0.3.79 -> 0.3.80
Date: Thu, 14 Sep 2023 15:06:31 +0200
Message-ID: <20230914130631.182859-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914130631.182859-1-f_l_k@t-online.de>
References: <20230914130631.182859-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1694696811-45FFA5E3-EBBFB822/0/0 CLEAN NORMAL
X-TOI-MSGID: 5eb3c10a-2cd2-48ea-b4ea-58dbc6778fc9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 13:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104868

This is a bugfix release that is API and ABI compatible with previous
0.3.x releases.

  - A new Tag param was added that allows arbitrary metadata to be transp=
orted
    out-of-band in the graph.
  - Vulkan DMA buf support was merged.
  - The echo-canceller was ported to webrtc-audio-processing-1.
  - Fix a regression in locating monitor sources by id in pulse-server.
  - Mixer io areas updates are now synchronized correctly with the data
    thread to avoid potential crashes.
  - Many more bugfixes and improvements.

  - Handle driver nodes that refuse to change the quantum or rate.
  - A new Tag param was added that allows arbitrary metadata to be transp=
orted
    out-of-band in the graph.

  - The pipe-tunnel source has been reworked to use a ringbuffer and rate
    adaption to keep the latency constant. It can now also function as a
    driver to reduce resampling. (#3478)

  - pw-cat will now place media properties in Tag params.
  - pw-mon can now filter props and params.

  - ALSA refuses to change quantum and rate when in IRQ mode.
  - ALSA will now be smarter in selecting the period size for batch devic=
es
    and will make it depend on the samplerate. (#3444)
  - Vulkan DMA buf support was merged.
  - ALSA latency will now be reported in the time domain of the graph.
  - Add udev based autodetection for compress-offload devices.
  - The echo-canceller was ported to webrtc-audio-processing-1.
  - The v4l2 inotify code was rewritten to avoid a use-after-free and by
    using a separate watch (but same fd) for each device. (#3439)
  - The tag and latency handling was improved in audioadpter.
  - Don't use -Ofast on alpha because it can crash on denormalized
    values. (#3489)
  - The mixers now synchronize spa_io_buffers updates with the data
    thread to avoid crashes.
  - Handle NULL param updates. (#3504)

  - Fix a regression in locating monitor sources by id. (#3476)
  - Add support for use_system_clock_for_timing in module-pipe-sink.
  - Add support for checking module arguments.
  - Avoid some useless change events.

  - Ports are now marked as physical, which makes the bluetooth devices s=
how
    up as hardware devices in Ardour and other JACK apps. (#3418)
  - Some fixes for LE audio support (#3479)

  - Also emit unregister notify even when supressed when creating the
    client.
  - The notify callbacks now match JACK2 behaviour more.
  - The mixer io areas are updated and handled safely now to avoid
    crashes. (#3506)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.79.bb =3D> pipewire_0.3.80.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.79.bb =3D=
> pipewire_0.3.80.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.79.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.80.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.79.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.80.bb
index 1304c0ac8..a134820da 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.79.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.80.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "b5c3f217926f9066a1afbee7eb20967dd6896c56"
+SRCREV =3D "35cca08d2bef14248ac25ff2a1efb0bf274d0a6f"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
@@ -35,7 +35,6 @@ SYSTEMD_PACKAGES =3D "${PN}"
 # a specially prepared kernel, and is currently unavailable
 # in Yocto.
 #
-# Vulkan support is currently (as of version 0.3.44) not functional.
 #
 # manpage generation requires xmltoman, which is not available.
 #
@@ -137,7 +136,7 @@ PACKAGECONFIG[udev] =3D "-Dudev=3Denabled,-Dudev=3Ddi=
sabled,udev"
 PACKAGECONFIG[v4l2] =3D "-Dv4l2=3Denabled,-Dv4l2=3Ddisabled,udev"
 PACKAGECONFIG[volume] =3D "-Dvolume=3Denabled,-Dvolume=3Ddisabled"
 PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulkan=
-headers vulkan-loader"
-PACKAGECONFIG[webrtc-echo-cancelling] =3D "-Decho-cancel-webrtc=3Denable=
d,-Decho-cancel-webrtc=3Ddisabled,webrtc-audio-processing"
+PACKAGECONFIG[webrtc-echo-cancelling] =3D "-Decho-cancel-webrtc=3Denable=
d,-Decho-cancel-webrtc=3Ddisabled,webrtc-audio-processing-1"
 PACKAGECONFIG[wireplumber] =3D ",,,wireplumber,,media-session"
=20
 PACKAGESPLITFUNCS:prepend =3D " split_dynamic_packages "
@@ -265,6 +264,7 @@ FILES:${PN} =3D " \
     ${systemd_user_unitdir} \
     ${bindir}/pipewire \
     ${bindir}/pipewire-avb \
+    ${bindir}/pipewire-vulkan \
 "
=20
 RRECOMMENDS:${PN}:class-target +=3D " \
--=20
2.41.0


