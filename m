Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6E3C28B20
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 00:46:22 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.2644.1743209181575507581
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Mar 2025 17:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout05.t-online.de (Postfix) with SMTP id B0D897D
	for <openembedded-devel@lists.openembedded.org>; Sat, 29 Mar 2025 01:46:19 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.160.140]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tyKL3-3mLnDV0; Sat, 29 Mar 2025 01:46:17 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mpv: update 0.39 -> 0.40
Date: Sat, 29 Mar 2025 01:46:54 +0100
Message-ID: <20250329004654.368877-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1743209177-C97F9A5C-297A2063/10/3626336762 SUSPECT URL
X-TOI-MSGID: f34aef59-06aa-484e-b545-4b1dbd4ce3b9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Mar 2025 00:46:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116359

- license files have been updated without change
- add dependency on 'libdisplay-info'

Release 0.40.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

We are excited to announce the release of mpv 0.40.0.

Key highlights:

* Console: Enhanced autocompletion and visual styling
* OSC: New selection menu accessible by right-clicking common buttons
* HDR is now natively supported when using direct rendering (DRM),
  as well as dmabuf-wayland on Linux
* Native clipboard access for scripts via new `clipboard` property
* New command menu, with common actions easily accessible
* Enhanced select.lua with new selection options for watch history, editi=
ons, DVD/Blu-Ray titles
* New positioning.lua script script for cursor-centric zooming and drag t=
o pan
* Better stream support for Blu-ray, DVD and CDDA
* Track selection improvements and better metadata display
* Added osd-box / sub-box / box profiles to easily enable box styled OSD/=
OSC
* Windows support in umpv helper script

This release requires FFmpeg 6.1 or newer and libplacebo 6.338.2 or newer=
.

- vf_d3d11vpp: add NVIDIA RTX Video HDR support
- context_drm_gl: add support for HDR metadata
- positioning.lua: add new script for video alignment and zooming
- umpv: add Windows support
- command: add clipboard property with native backends for Windows, macOS=
, and Wayland
- select.lua: add watch history, edition, DVD/Blu-Ray titles and more sel=
ection options
- input.conf: add cursor-centric zoom and drag-to-pan bindings
- wayland: add support for wp-color-management-v1 protocol
- console.lua: add persistent command history
- stats.lua: add timecode display
- options: add --playlist-exts and --archive-exts
- wayland_common: support IME usage via text-input-v3
- command: add multiple track metadata and properties
- vo_gpu_next: add chroma location and HDR metadata to shader parameters
- player/screenshot: support more formats for screenshot-raw command
- demux_mkv: add `--demuxer-mkv-crop-compat` option
- misc/language: parse hi/sdh/cc tags from external subtitle tracks
- wayland: support xdg-activation
- player: add mpv:// protocol

- meson: build libmpv by default
- command: enhance track and playlist display information
- input.conf: improve numpad key bindings
- osc.lua: add custom buttons support and improved mouse bindings
- console.lua: inherit OSD styles and colors
- options: default to --prefetch-playlist=3Dyes
- osc.lua: add slimbottombar and slimtopbar layouts
- command: improve frame-step to go through multiple frames
- wayland: use wp-presentation v2 if available
- various: reorganize options into more logical groups
- vo_gpu_next: improve target colorspace handling
- options: disable `--input-ime` by default (enabled on demand)

- sd_ass: introduce sub-ass-prune-delay
- player: add an optional mute flag when framestepping
- command: add clipboard/text-primary property
- command: add current-clipboard-backend property
- command: add notify-property command
- options: add --script-opt alias for --script-opts-append
- options: add --osd-bar-marker-{size,style} options
- options: add --input-ime for improved text input
- options: add --video-recenter
- options: add --clipboard-backends
- options: add --wayland-internal-vsync
- options: add --sub-scale-signs

- options: rename --load-osd-console to --load-console
- player: improve track selection for multi-component languages
- options: improve frame-step command to handle multiple frames
- input.conf: make Alt+BS reset --video-align-{x,y}
- command: print track metadata when changing track
- command: print track-list with enhanced metadata

- options: deprecate `--gamma-auto` (use gamma-auto.lua script instead)
- options: deprecate undocumented --cdda-span-{a,b} options

- f_hwtransfer: ensure that we convert to full range rgb with scale_vaapi
- win32: fix window size restore after maximize state
- build: fix dynamic generation of mpv.desktop file protocols
- player/sub: avoid pointlessly redecoding subs
- x11: remove nvidia blacklist logic from --x11-present=3Dauto
- osc.lua: seek to the nearest chapter when right clicking the seekbar
- command: fix keybind command with sequence keys
- video/out/wayland_common: fix crash with multi-seat drag and drop
- demux: reclaim demux_packets to reduce memory allocator pressure
- demux_cue: only accept TRACK with AUDIO type
- player/loadfile: strip common filename part from external track title
- build: remove unused dvdread dependency
- wayland: fix vertical resizing and scaling issues
- console.lua: improve completion and visual appearance
- sub/osd: default to a semitransparent black back color
- player: improve playlist handling with prefetch
- drm: parse EDID using libdisplay-info (which is now a required dependen=
cy)
- win32: fix window size restore after maximize state
- hwdec_d3d11va: align image mapper dimensions to a multiple of 2
- wayland: fix DnD with focus follow mouse
- player: store external filenames as normalized
- player: properly handle secondary subtitles on the terminal
- demux_mkv: add support for chroma location
- vo_dmabuf_wayland: improve and fix format selection
- player: fix combination of --loop-playlist + --shuffle + --prefetch-pla=
ylist

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../mplayer/{mpv_0.39.0.bb =3D> mpv_0.40.0.bb}           | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-multimedia/mplayer/{mpv_0.39.0.bb =3D> mpv_0.40.0=
.bb} (93%)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.39.0.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mpv_0.40.0.bb
similarity index 93%
rename from meta-oe/recipes-multimedia/mplayer/mpv_0.39.0.bb
rename to meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
index c699e73efe..1fa6a6da65 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.39.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
@@ -9,17 +9,15 @@ DEPENDS =3D " \
     jpeg \
     libv4l \
     libass \
+    libdisplay-info \
     libplacebo \
 "
=20
 LICENSE =3D "GPL-2.0-or-later"
-LIC_FILES_CHKSUM =3D "file://LICENSE.GPL;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263"
+LIC_FILES_CHKSUM =3D "file://LICENSE.GPL;md5=3D570a9b3749dd0463a1778803b=
12a6dce"
=20
-SRCREV =3D "a0fba7be57f3822d967b04f0f6b6d6341e7516e7"
-SRC_URI =3D " \
-	git://github.com/mpv-player/mpv;name=3Dmpv;branch=3Drelease/0.39;protoc=
ol=3Dhttps \
-	file://a7efb3e62bbd0af86737f5ecb72d3a8e2a8c3b54.patch \
-"
+SRCREV =3D "e48ac7ce08462f5e33af6ef9deeac6fa87eef01e"
+SRC_URI =3D "git://github.com/mpv-player/mpv;name=3Dmpv;branch=3Drelease=
/${@oe.utils.trim_version('${PV}', 2)};protocol=3Dhttps"
 S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig mime-xdg
--=20
2.49.0


