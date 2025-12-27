Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E268EE9271F
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 21:47:40 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14924.1766872051136558267
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Dec 2025 13:47:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout06.t-online.de (Postfix) with SMTP id 575BC55C
	for <openembedded-devel@lists.openembedded.org>; Sat, 27 Dec 2025 22:47:29 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.162.170]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vZc86-3KqcwT0; Sat, 27 Dec 2025 22:47:18 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mpv: update 0.40.0 -> 0.41.0
Date: Sat, 27 Dec 2025 22:47:11 +0100
Message-ID: <20251227214712.206501-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1766872038-6F7D10FB-C12C64BC/0/0 CLEAN NORMAL
X-TOI-MSGID: 082b9607-1b23-4484-94af-5fd4cc8ff1c8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Dec 2025 21:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122954

Release 0.41.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

We are excited to announce the release of mpv 0.41.0.

Key highlights:

* The libplacebo based `gpu-next` is now the default, over `gpu`
* Vulkan hardware decoding is preferred over other APIs
* New context_menu.lua script for right-click context menus
* AAudio backend for modern, HNI-free audio output on Android
* Improved default color management for gpu-next, and handling on Wayland
* Color representation protocol support for Wayland
* Tablet input support for Wayland
* Clipboard writing support for Wayland and a clipboard backend for X11
* Ambient light support on Linux (using sysfs ALS)
* Built-in helpers to register mpv as a media app on Windows

This release requires FFmpeg 6.1 or newer and libplacebo 6.338.2 or newer=
.

- clipboard-wayland: support clipboard writing
- wayland: add support for wp-color-representation-v1
- wayland: tablet input support
- vo_gpu_next: add support for blend-subtitles=3Dvideo
- meson: add mpv-register and mpv-unregister helpers on Windows
- context_menu.lua: add this script
- select.lua: add edit-config-file and edit-input-conf
- osc.lua: add indicator for buffering/loading
- osdep/linux-als: support 'ambient-light' property on Linux
- clipboard-x11: add x11 clipboard backend
- ao/aaudio: implement native AAudio backend for Android

- vd_lavc: prefer Vulkan hwdec when available
- vd_lavc: prefer non-copy hwdec before falling back to -copy variant
- vo: move vo_mediacodec_embed to not be the default on Android
- sub/osd_libass: don't rerender OSD if not changed
- vo: prefer vo_gpu_next over vo_gpu by default
- vo_gpu_next: respect ICC profile color space over any metadata
- vo_gpu_next: linearize sRGB as a pure 2.2 power function
- meson: warn if building with SDL2 due to known problems
- osxbundle: make bundle category configurable and default to video
- ao_pipewire: avoid setting any media.role by default

- sub: add control for libass caching options (glyph-limit, bitmap-max-si=
ze)
- vo: add options to control background tile appearance (transparency)
- command: add default and forced flags to the track add commands
- vo_gpu_next: add options to control subtitle peak for HDR output
- video/out/d3d11: add d3d11 composition mode support
- vd_lavc: add --hwdec-threads
- stream_bluray: add --bluray-angle
- vo_gpu_next: add options to control output colorspace metadata more pre=
cisely
- sub: make --sub-fix-timing configurable
- vo_gpu_next: add --hdr-reference-white
- audio/out: add --audio-set-media-role

- options: revert --prefetch-playlist default back to 'no'
- vo_gpu_next: change --target-colorspace-hint to 'auto' by default
- options: handle runtime --wid change
- options: reduce swapchain-depth to 2 by default
- screenshot: add osd and scaled flags to screenshot commands

- vo_kitty: add auto-multiplexer-passthrough option
- vd_lavc: enable FFv1 hwaccel by default
- clipboard-wayland: prevent reading from hung up fd
- demux_mkv: fix compilation after deprecated definitions removal
- filters: handle flipping video if displaymatrix indicates so
- player/scripting: fix race condition when destroying clients
- {osd,msg}: use PU codepoints for escape codes instead of invalid UTF-8
- vo_dmabuf_wayland: only load needed hardware decoding drivers
- video/image_writer: tag accurate bit depth
- demux_lavf: fix unconstrained cache size with wrapped AVFrame packets
- libarchive: fix reading name of certain UTF-8 files
- sub/sd_lavc: fix decoding with libaribb24
- ao_avfoundation: fix memory leak
- osc.lua: fix volume icon not updating while paused
- context_wayland: implement target_csp for wayland
- vo_gpu: fix target colorspace for redrawn frames
- vo_dmabuf_wayland: don't set HDR metadata on SDR transfers
- vo_gpu_next: don't do partial updates on hint luminance
- sub/ass_mp: add missing padding for ass packer
- stream_dvb: allow to enforce DVB-S/T for old zap format channels.conf
- demux_libarchive: fix reading archives with '%' in stream URL path
- vo_gpu_next: allow UINT upload if no other format is supported
- ytdl_hook.lua: fix incorrect default format used with yt-dlp
- vo_gpu_next: allow unsetting LUTs
- stream_bluray: use bd_get_main_title() to get main title
- vo_gpu_next: when tone-mapping, set better maxCLL value
- stream_libarchive: seek source stream to 0 before probing
- path-unix: support ~~desktop path expansion
- ytdl_hook.lua: don't crash if playlist entries don't have an usable URL
- mac/vulkan: fix frame not displayed when paused
- mac/common: render first frame on init if possible
- video/out/w32_common: support --wid=3D0
- demux_mkv: map and expose hearing/visual impaired flags
- player/misc: show percentage progress for --stream-dump
- command: fix null dereference for invalid command in input-commands
- cplugin: fix missing init of pfn_mpv_get_time_ns
- vo_dmabuf_wayland: actually reuse OSD buffers
- mp_image: add support for AVAlphaMode
- vo_gpu_next: add --border-background=3Dblur and --background-blur-radiu=
s
- demux/cue: fix crash when there are no tracks
- vf_format: add some basic HDR10 metadata
- vo/context_android: fix surface tearing on resize
- meson: remove redundant 'sdl2' option
- mac/common: fix window position on multi monitor setups
- vo_gpu_next: limit min_luma to 1000:1 contrast ratio in SDR mode
- ao_pipewire: fix some incorrect channel mappings
- wayland: correct geometry handling for rotated outputs
- demux: clear packet pool when upper memory limit is lowered
- mp_image: add ycgco-{re,ro} support
- wayland: convert luminance values to libplacebo space
- vo: trigger manual redraws at most at slightly over display fps
- osxbundle: add new macOS 26 compatible App icon
- wayland: support color-management-v1 version 2

This listing is not complete. Check DOCS/client-api-changes.rst for a his=
tory
of changes to the client API, and DOCS/interface-changes.rst for a histor=
y
of changes to other user-visible interfaces.

A complete changelog can be seen by running `git log v0.40.0..v0.41.0`
in the git repository or by visiting
<https://github.com/mpv-player/mpv/compare/v0.40.0...v0.41.0>.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-mpv-fix-build-with-ffmpeg-8.0.patch  | 41 -------------------
 .../mplayer/{mpv_0.40.0.bb =3D> mpv_0.41.0.bb}  |  3 +-
 2 files changed, 1 insertion(+), 43 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/0001-mpv-fix-b=
uild-with-ffmpeg-8.0.patch
 rename meta-oe/recipes-multimedia/mplayer/{mpv_0.40.0.bb =3D> mpv_0.41.0=
.bb} (97%)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/0001-mpv-fix-build-wi=
th-ffmpeg-8.0.patch b/meta-oe/recipes-multimedia/mplayer/mpv/0001-mpv-fix=
-build-with-ffmpeg-8.0.patch
deleted file mode 100644
index ea705a4c73..0000000000
--- a/meta-oe/recipes-multimedia/mplayer/mpv/0001-mpv-fix-build-with-ffmp=
eg-8.0.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From dd80e5841894f854e2d994601016151531521d9a Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Tue, 16 Sep 2025 09:37:48 +0200
-Subject: [PATCH] mpv: fix build with ffmpeg 8.0
-
-quick fix, only compile tested
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-
-Upstream-Status: Pending
----
- demux/demux_mkv.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/demux/demux_mkv.c b/demux/demux_mkv.c
-index 135edcc23d..cc7ce3e98f 100644
---- a/demux/demux_mkv.c
-+++ b/demux/demux_mkv.c
-@@ -2200,16 +2200,16 @@ static int demux_mkv_open_sub(demuxer_t *demuxer=
, mkv_track_t *track)
-             // [0x30..0x37] are component tags utilized for
-             // non-mobile captioning service ("profile A").
-             if (component_tag >=3D 0x30 && component_tag <=3D 0x37)
--                lav->profile =3D FF_PROFILE_ARIB_PROFILE_A;
-+                lav->profile =3D AV_PROFILE_ARIB_PROFILE_A;
-             break;
-         case 0x0012:
-             // component tag 0x87 signifies a mobile/partial reception
-             // (1seg) captioning service ("profile C").
-             if (component_tag =3D=3D 0x87)
--                lav->profile =3D FF_PROFILE_ARIB_PROFILE_C;
-+                lav->profile =3D AV_PROFILE_ARIB_PROFILE_C;
-             break;
-         }
--        if (lav->profile =3D=3D FF_PROFILE_UNKNOWN)
-+        if (lav->profile =3D=3D AV_PROFILE_UNKNOWN)
-             MP_WARN(demuxer, "ARIB caption profile %02x / %04x not supp=
orted.\n",
-                     component_tag, data_component_id);
-     }
---=20
-2.50.1
-
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mpv_0.41.0.bb
similarity index 97%
rename from meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
rename to meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
index 117395b371..dede59f099 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
@@ -16,9 +16,8 @@ DEPENDS =3D " \
 LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE.GPL;md5=3D570a9b3749dd0463a1778803b=
12a6dce"
=20
-SRCREV =3D "e48ac7ce08462f5e33af6ef9deeac6fa87eef01e"
+SRCREV =3D "41f6a645068483470267271e1d09966ca3b9f413"
 SRC_URI =3D "git://github.com/mpv-player/mpv;name=3Dmpv;branch=3Drelease=
/${@oe.utils.trim_version('${PV}', 2)};protocol=3Dhttps"
-SRC_URI +=3D "file://0001-mpv-fix-build-with-ffmpeg-8.0.patch"
=20
 inherit meson pkgconfig mime-xdg
=20
--=20
2.52.0


