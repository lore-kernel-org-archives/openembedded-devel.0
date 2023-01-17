Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF92C63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:49:43 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.191526.1673941781887176110
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:49:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout02.t-online.de (Postfix) with SMTP id 2CBE9211E
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 08:49:39 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.226.203]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pHgiw-1GYDCL0; Tue, 17 Jan 2023 08:49:38 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] pipewire: update 0.3.63 -> 0.3.64
Date: Tue, 17 Jan 2023 08:49:31 +0100
Message-Id: <20230117074931.92069-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1673941778-B5399DF7-1FC779E5/0/0 CLEAN NORMAL
X-TOI-MSGID: 1207da35-0550-4b48-bf3b-ec0462a83f47
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100631

This is a bugfix release that is API and ABI compatible with previous
0.3.x releases.

  - Clear old buffer memory on ports to fix some SIGBUS errors.
  - It is now possible to assign custom port names to the ports from an
    adapter. This feature is helpful to those who use a multichannel
    interface with long-term connections. This way they can label each
    port with its designation, such as an instrument name or anything els=
e
    to be displayed in a patchbay or DAW.
  - Fix some issues with node suspend and quantum and rate calculations.
  - Fix some regressions in pulse-tunnel and RTP-source adaptive resampli=
ng
    that could cause synchronization problems.
  - UCM devices now also have a Pro Audio profile.
  - NODE_TARGET (with the object.id) is now deprecated, use TARGET_OBJECT
    (with the object.serial, which is not reused and can avoid races).

  - Clear all peer input port buffers when suspending. This fixes some
    SIGBUS errors when some plugins were using old memory. (#2914)
  - Fix a case where nodes that were not supposed to be suspended, were
    kept suspended on a rate change. (#2929)
  - Fix an error in the quantum and rate calculations that could cause
    nodes to run with wrong quantum and rates when multiple rates were
    allowed. (#2925)

  - pw-dump will now sort dictionaries to make it easier to compare
    different outputs.
  - Improve output of pw-reserve.
  - pw-loopback uses TARGET_OBJECT so you will need to use the serial
    id (or better the name) as the target instead of the object id.

  - The filter-chain modules has seen some cleanups, refactoring and
    optimizations in the various DSP functions.
  - The ROC module now supports setting a custom samplerate.
  - ROC 0.2.X is now required.
  - The pulse tunnel and RTP source were not updating the rate field
    correctly which could cause synchronization problems. (#2891)
  - The filter-chain now supports an arbitrary number of control
    properties. (#2933)
  - It is now possible to assign custom port names to the ports from an
    adapter with the PW_KEY_NODE_CHANNELNAMES.
  - Support was added for capture and playback props in echo-cancel.
    (#2939)

  - The ACP code now has an option to set the probe samplerate. (#1599)
  - UCM devices now also have a Pro Audio profile.
  - Filtering of Step ranges is now implemented.

  - The channel-map is now set correctly on the echo-cancel module.
  - source_master and sink_master are now correctly handled in module
    echo-cancel.
  - Fix a regression in DRAIN where resuming after a DRAIN would fail.
    This caused problems for espeak. (#2928)
  - TARGET_OBJECT is now used to make it possible to use the indexes
    as a target.
  - ladspa-source and remap-source can now also link to monitors.

  - The ALSA plugin now handles the target.object correctly when set to
    -1. (#2893)

  - The v4l2 replacement library now also follows symlinks.
  - Support for getting and setting controls was added.
  - Support for G_PARM was added.
  - The environment variable PIPEWIRE_V4L2_TARGET can be used to force
    an application onto a specific camera.

  - Fix compilation without ldac_abr.
  - Fix a missing brace in CIND reply. This could cause some devices to
    fail.
  - Fix configuration of the initial latency.

  - The device provider now supports setting an fd so that it can connect
    to PipeWire sessions from the portal.
  - DMABuf support was re-enabled in gstpipewiresrc.

Build with support for gsettings and libcamera

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.63.bb =3D> pipewire_0.3.64.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.63.bb =3D=
> pipewire_0.3.64.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.63.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.64.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.63.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.64.bb
index f7acb8db4..91945ca7d 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.63.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.64.bb
@@ -13,12 +13,12 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "5ff00f40b9d3ecfc38305edc27e9c2b01629802c"
+SRCREV =3D "bba452695eb673461c5cf626eec57728991eadf7"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
=20
-inherit meson pkgconfig systemd gettext useradd
+inherit gsettings meson pkgconfig systemd gettext useradd
=20
 USERADD_PACKAGES =3D "${PN}"
=20
@@ -88,7 +88,7 @@ PACKAGECONFIG:class-target ??=3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio gtk', 'gsettings=
', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa vulkan pulseaudio', d)} =
\
     ${PIPEWIRE_SESSION_MANAGER} \
-    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer jack libusb pw-cat raop =
sndfile v4l2 udev volume webrtc-echo-cancelling \
+    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer gsettings jack libusb pw=
-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling libcamera \
 "
=20
 # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
--=20
2.34.1


