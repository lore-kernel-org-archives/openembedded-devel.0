Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7FEC41513
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 12:46:26 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.24482.1719751584969023832
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 05:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout06.t-online.de (Postfix) with SMTP id DDA752690A
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Jun 2024 14:46:22 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.39.138]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sNtwi-0hjsK90; Sun, 30 Jun 2024 14:46:20 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/2] pipewire: update 1.0.7 -> 1.2.0
Date: Sun, 30 Jun 2024 14:47:20 +0200
Message-ID: <20240630124721.64234-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1719751580-45395322-46A5DF0C/0/0 CLEAN NORMAL
X-TOI-MSGID: bc115fef-567f-4353-b234-6329b8de7b11
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Jun 2024 12:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111164

PipeWire 1.2.0 (2024-06-27)

This is the 1.2 release that is API and ABI compatible with previous
1.1.x and 1.0.x releases.

This release contains some of the bigger changes that happened since
the 1.0 release last year, including:

  * Support for asynchronous processing has been implemented. Nodes can c=
hoose
    (or be forced) to be scheduled asynchronously. The graph will not wai=
t for
    the output of the node to continue processing but it will use the out=
put
    of the previous cycle (or silence) instead. This adds one cycle of la=
tency
    but it can avoid having some nodes blocking the processing graph. Non=
 realtime
    streams and filters now also use this asynchronous processing instead=
 of
    their own slightly broken version.
  * The concept of node.sync-group was added. This groups nodes with over=
lapping
    sync-group together when one of them sets the node.sync =3D true. Thi=
s is now
    used to make sure all nodes are scheduled together when JACK transpor=
t is
    started so that they all see the same transport time.
  * Config parsing errors are reported earlier and much better with line =
and
    column numbers where the parsing started to fail.
  * Add support for mandatory metadata when negotiating buffer parameters=
. This
    can be used to only negotiate extra buffer planes when certain metada=
ta is
    negotiated. One use case is the explicit sync support that requires 2
    extra fds for the timelines.
  * Explicit sync metadata and support was added.
  * Support was added for making and using multiple data-loops in the ser=
ver
    and clients. Support for CPU affinity and priorities was added to the
    data-loops as well.
  * The log topic debug levels can now be changed at runtime with metadat=
a.
    The log levels in the pulse server can be dynamically changed with a
    /core message.
  * The UCM conflicting devices patches were merged.
  * Add snapcast-discover module to stream to snapcast servers.
  * Rework how peers are linked and the counters are updated. Resume the
    peers when a node is unlinked and not yet processed. This should caus=
e
    less occasional dropouts in the graph when reconnecting things.
  * Many GStreamer element updates.
  * Many more fixes and improvements.

Enjoy the summer vacation!

Highlights (since the previous 1.1.83 release)
  - Small fixes here and there.

PipeWire
  - Compilation fixes after enabling -Werror=3Dfloat-conversion

Modules
  - The module-rtp-sap now propagates the cleanup.sec property to the
    rtp-source and the rtp-source now sets a property with the receiving
    status.
  - Fix for ROC 0.3, explicitly specify sender encoding. (#4070)
  - Some fixes to the RAOP sink module, including a format fix for 32 bit
    machines.

Tools
  - Fix pw-cli monitoring code.

SPA
  - Revert peer_enum_params again because it was not used and flawed.
  - Fix multichannel processing in webrtc AEC.

GStreamer
  - Logging improvements.
  - Fix a race in the bufferpool activation.

Bluetooth
  - Improvements to BAP broadcast code parsing.

Older versions:

PipeWire 1.1.83 (2024-06-17)

This is the third and hopefully the last 1.2 release candidate that is
API and ABI compatible with previous 1.0.x releases.

Some last minute changes went in to clean up the node activation and
scheduling that justify another pre-release.

Highlights
  - Rework how peers are linked and the counters are updated. Resume the
    peers when a node is unlinked and not yet processed. This should caus=
e
    less occasional dropouts in the graph when reconnecting things.
  - Improve xruns in module-ffado.
  - Many GStreamer element updates.
  - More fixes and improvements.

PipeWire
  - Rework how peers are linked and the counters are updated. Resume the
    peers when a node is unlinked and not yet processed. This should caus=
e
    less dropouts in the graph when reconnecting. (#4026)
  - Improve debug of xruns.
  - Evaluate node.rules and device.rules before loading the plugin so tha=
t
    extra properties can be passed to the plugin init function.

Modules
  - Improve timing reporting in module-ffado some more.
  - Prealloc less memory in the profiler by default.
  - Improve xrun handling in module-ffado.

Tools
  - Fix a crash in pw-link when a link fails.
  - Fix pw-dump update for metadata. (#4053)

SPA
  - Improve handling of controls. (#4028)
  - Fix the string size in v4l2 to hold the device and vendor id.
  - Support meta_videotransform on buffers in v4l2. This can be used to
    signal that the buffer was rotated for example.
  - Add HDMI/AC3 profile to ALSA when supported.
  - Make it possible to disable the webrtc dependency

GStreamer
  - Improve caps handling in the elements.
  - Set buffer duration when we can.
  - Post an element error when all the elements buffers are removed.
    (#1980)
  - Improve DMA_DRM caps selection.
  - Some refactoring work.
  - Improve state handling in the elements.

JACK
  - Improve how links are activated.
  - Fix some races when freeing memory.

Bluetooth
  - Support multiple BIS in the broadcast source.

PipeWire 1.1.82 (2024-05-24)

This is the second 1.2 release candidate that is API and ABI
compatible with previous 1.0.x releases.

Not so many things needed to be fixed so this might already be the
last prerelease if everything goes well...

Highlights
  - Fix problem when moving nodes that could cause nodes to be scheduled
    wrongly and cause errors. (#4017)
  - Add snapcast-discover module to stream to snapcast servers.
  - Work around wrong kernel provided MTU for USB controllers.
  - Fix some spelling mistakes all over the codebase.
  - More small fixes and improvements.

PipeWire
  - Remove the private cleanup.h header and use the public SPA version.
  - Fix problem when moving nodes that could cause nodes to be scheduled
    wrongly and cause errors. (#4017)

Modules
  - Handle IPv6 in module-protocol-simple and support port allocation.
  - Add snapcast-discover module to stream to snapcast servers.

Bluetooth
  - Work around wrong kernel provided MTU for USB controllers.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_1.0.7.bb =3D> pipewire_1.2.0.bb}        | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.0.7.bb =3D=
> pipewire_1.2.0.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.7.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.0.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.7.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.0.bb
index 0c68cc4d2..c6c8da4cb 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.7.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.2.0.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "59fe89d41a67f6daad086f8f3fe522935be77a3f"
-SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
1.0;protocol=3Dhttps"
+SRCREV =3D "7b4c0dd5ecb40e4d2c153699a85c51e1460361e1"
+SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
1.2;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -292,6 +292,7 @@ FILES:${PN}-tools =3D " \
     ${bindir}/pw-cat \
     ${bindir}/pw-cli \
     ${bindir}/pw-config \
+    ${bindir}/pw-container \
     ${bindir}/pw-dot \
     ${bindir}/pw-dsdplay \
     ${bindir}/pw-dump \
--=20
2.45.1


