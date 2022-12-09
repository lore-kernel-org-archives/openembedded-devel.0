Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F17A1C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 18:17:37 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.61.1670609857142839172
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Dec 2022 10:17:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout06.t-online.de (Postfix) with SMTP id 0EDF817EF1
	for <openembedded-devel@lists.openembedded.org>; Fri,  9 Dec 2022 19:17:35 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.94]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p3hwC-1Y318b0; Fri, 9 Dec 2022 19:17:32 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] pipewire: update 0.3.61 -> 0.3.62
Date: Fri,  9 Dec 2022 19:17:23 +0100
Message-Id: <20221209181723.3151-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670609853-E77DC07E-AEAA09BB/0/0 CLEAN NORMAL
X-TOI-MSGID: d0786a8b-ca68-4d9b-b0fc-4dda1f09a289
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Dec 2022 18:17:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100007

PipeWire 0.3.62 (2022-12-09)
This is a bugfix release that is API and ABI compatible with previous
0.3.x releases.

Highlights

A regression in screensharing was fixed. It was caused by a race when
activating links and driver nodes.
Video transform metadata was added so that cameras and screen sharing
can report the video orientation and transformations.
Support for the PulseAudio module-gsettings was added to make paprefs
work.
Support for bluetooth offloading was added. This allows for the bluetooth
reception, decoding and playback to happen completely in hardware.
This also requires some support in WirePlumber.
Many bugfixes and improvements.

PipeWire

More work on stopping nodes in a more controlled way.
Fix a race in starting nodes and drivers. In some cases the driver
node would already be started while the link to the peer node was not
ready yet. This caused regressions in screen sharing. The driver is
now only started after all the followers and links completed.
Fix a case where a slow capture stream would not recycle buffers
anymore and stall. (#2874)
Fix a subtle bug in pw_loop_invoke that could cause callbacks to be
delayed and cause crashes in some cases.
Fix a case where IPC was done from the data-thread and could cause
crashes.

Tools

Silence some expected errors in the pw-top output.

modules

The filter-chain has seen some optimizations in the copy plugin and
the convolver.
The zeroconf plugin will now only unpublish services from the server
that was removed.
Fix a potential crash when stopping pw-loopback.
Some harmless errors were turned into info messages.
Fix some cases where pw_stream methods were called from the data-thread
that could cause segfaults. (#2633)

SPA

There is now a video transform metadata that indicates how a video
frame was transformed (rotated/flipped). libcamera and the GStreamer
elements now have support for this metadata.
The SPA volume plugin is now disabled from the default build.
Handle missing control info in libcamera.
Handle errors from loop better, don't call the callbacks on errors.
Somewhat improve performance in some audioconvert AVX2 code for format
conversion.
Fix PortConfig and EnumPortConfig params in audioconvert and
audioadapter to reflect what is actually going on instead of using
hardcoded values.
Pass ignore-dB property correctly in all cases.
Probing is now done in 48KHz again. (#2857)

Pulse-server

IPv4 addresses are now added first to the list and exposed first with
zeroconf discover.
module-gsettings was added to make paprefs work.
The pulse.idle.timeout option was disabled by default and only enabled
for selected apps (speech-dispatcher) because it caused some problems
for other apps. (#2880)

JACK

Only process valid ports. Could fix some crashes. (#2863)

Bluetooth

Support was added for offloading bluetooth handling. Some hardware can
receive, decode and play the bluetooth audio directly in hardware.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.61.bb =3D> pipewire_0.3.62.bb}       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.61.bb =3D=
> pipewire_0.3.62.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.61.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.62.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.61.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.62.bb
index 1d88fe92a..a358ea417 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.61.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.62.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "f038e3f23824f9319daaa9f9a31600fc6df49a39"
+SRCREV =3D "3a443b4e1c9730675c7de0453a6279ab9ee263fd"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
@@ -85,6 +85,7 @@ PACKAGECONFIG:class-target ??=3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}=
 \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez bluez-op=
us ${BLUETOOTH_AAC}', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-=
system-service systemd-user-service', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio gtk', 'gsettings=
', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa vulkan pulseaudio', d)} =
\
     ${PIPEWIRE_SESSION_MANAGER} \
     ${FFMPEG_AVAILABLE} gstreamer jack libusb pw-cat raop sndfile v4l2 u=
dev volume \
@@ -102,6 +103,7 @@ PACKAGECONFIG[bluez-aac] =3D "-Dbluez5-codec-aac=3Den=
abled,-Dbluez5-codec-aac=3Ddisabl
 PACKAGECONFIG[bluez-opus] =3D "-Dbluez5-codec-opus=3Denabled,-Dbluez5-co=
dec-opus=3Ddisabled,libopus"
 PACKAGECONFIG[docs] =3D "-Ddocs=3Denabled,-Ddocs=3Ddisabled,doxygen-nati=
ve graphviz-native"
 PACKAGECONFIG[ffmpeg] =3D "-Dffmpeg=3Denabled,-Dffmpeg=3Ddisabled,ffmpeg=
"
+PACKAGECONFIG[gsettings] =3D "-Dgsettings=3Denabled,-Dgsettings=3Ddisabl=
ed,glib-2.0"
 PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3Denabled,-Dgstreamer=3Ddisabl=
ed,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base,,gstreamer1.0-pipewire=
"
 PACKAGECONFIG[jack] =3D "-Djack=3Denabled,-Djack=3Ddisabled,jack,,,pipew=
ire-jack"
 PACKAGECONFIG[libcamera] =3D "-Dlibcamera=3Denabled,-Dlibcamera=3Ddisabl=
ed,libcamera libdrm"
--=20
2.34.1


