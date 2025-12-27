Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A747E92721
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 23:34:01 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16328.1766878435129406535
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Dec 2025 15:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout07.t-online.de (Postfix) with SMTP id 4FDF3E21E
	for <openembedded-devel@lists.openembedded.org>; Sun, 28 Dec 2025 00:33:53 +0100 (CET)
Received: from [192.168.178.36] ([84.154.162.170]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vZdn9-0JHthI0; Sun, 28 Dec 2025 00:33:47 +0100
Date: Sun, 28 Dec 2025 00:33:41 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] mpv: update 0.40.0 -> 0.41.0
To: openembedded-devel@lists.openembedded.org
Message-Id: <54CY7T.O164P7W2NUUU@t-online.de>
In-Reply-To: <188530C50E9AD86B.2047557@lists.openembedded.org>
References: <188530C50E9AD86B.2047557@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-nOm/atglbgGUAFhsE8Ay"
X-TOI-EXPURGATEID: 150726::1766878427-1B7D31F2-573B73D2/0/0 CLEAN NORMAL
X-TOI-MSGID: ad2a729b-e5fd-4b6b-aa70-fa7e55133362
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Dec 2025 23:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122955

--=-nOm/atglbgGUAFhsE8Ay
Content-Type: text/plain; charset=us-ascii; format=flowed

just noticed that this recipe has already been updated

On Sat, Dec 27 2025 at 22:47:11 +01:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> Release 0.41.0
> ==============
> 
> We are excited to announce the release of mpv 0.41.0.
> 
> Key highlights:
> 
> * The libplacebo based `gpu-next` is now the default, over `gpu`
> * Vulkan hardware decoding is preferred over other APIs
> * New context_menu.lua script for right-click context menus
> * AAudio backend for modern, HNI-free audio output on Android
> * Improved default color management for gpu-next, and handling on 
> Wayland
> * Color representation protocol support for Wayland
> * Tablet input support for Wayland
> * Clipboard writing support for Wayland and a clipboard backend for 
> X11
> * Ambient light support on Linux (using sysfs ALS)
> * Built-in helpers to register mpv as a media app on Windows
> 
> This release requires FFmpeg 6.1 or newer and libplacebo 6.338.2 or 
> newer.
> 
> - clipboard-wayland: support clipboard writing
> - wayland: add support for wp-color-representation-v1
> - wayland: tablet input support
> - vo_gpu_next: add support for blend-subtitles=video
> - meson: add mpv-register and mpv-unregister helpers on Windows
> - context_menu.lua: add this script
> - select.lua: add edit-config-file and edit-input-conf
> - osc.lua: add indicator for buffering/loading
> - osdep/linux-als: support 'ambient-light' property on Linux
> - clipboard-x11: add x11 clipboard backend
> - ao/aaudio: implement native AAudio backend for Android
> 
> - vd_lavc: prefer Vulkan hwdec when available
> - vd_lavc: prefer non-copy hwdec before falling back to -copy variant
> - vo: move vo_mediacodec_embed to not be the default on Android
> - sub/osd_libass: don't rerender OSD if not changed
> - vo: prefer vo_gpu_next over vo_gpu by default
> - vo_gpu_next: respect ICC profile color space over any metadata
> - vo_gpu_next: linearize sRGB as a pure 2.2 power function
> - meson: warn if building with SDL2 due to known problems
> - osxbundle: make bundle category configurable and default to video
> - ao_pipewire: avoid setting any media.role by default
> 
> - sub: add control for libass caching options (glyph-limit, 
> bitmap-max-size)
> - vo: add options to control background tile appearance (transparency)
> - command: add default and forced flags to the track add commands
> - vo_gpu_next: add options to control subtitle peak for HDR output
> - video/out/d3d11: add d3d11 composition mode support
> - vd_lavc: add --hwdec-threads
> - stream_bluray: add --bluray-angle
> - vo_gpu_next: add options to control output colorspace metadata more 
> precisely
> - sub: make --sub-fix-timing configurable
> - vo_gpu_next: add --hdr-reference-white
> - audio/out: add --audio-set-media-role
> 
> - options: revert --prefetch-playlist default back to 'no'
> - vo_gpu_next: change --target-colorspace-hint to 'auto' by default
> - options: handle runtime --wid change
> - options: reduce swapchain-depth to 2 by default
> - screenshot: add osd and scaled flags to screenshot commands
> 
> - vo_kitty: add auto-multiplexer-passthrough option
> - vd_lavc: enable FFv1 hwaccel by default
> - clipboard-wayland: prevent reading from hung up fd
> - demux_mkv: fix compilation after deprecated definitions removal
> - filters: handle flipping video if displaymatrix indicates so
> - player/scripting: fix race condition when destroying clients
> - {osd,msg}: use PU codepoints for escape codes instead of invalid 
> UTF-8
> - vo_dmabuf_wayland: only load needed hardware decoding drivers
> - video/image_writer: tag accurate bit depth
> - demux_lavf: fix unconstrained cache size with wrapped AVFrame 
> packets
> - libarchive: fix reading name of certain UTF-8 files
> - sub/sd_lavc: fix decoding with libaribb24
> - ao_avfoundation: fix memory leak
> - osc.lua: fix volume icon not updating while paused
> - context_wayland: implement target_csp for wayland
> - vo_gpu: fix target colorspace for redrawn frames
> - vo_dmabuf_wayland: don't set HDR metadata on SDR transfers
> - vo_gpu_next: don't do partial updates on hint luminance
> - sub/ass_mp: add missing padding for ass packer
> - stream_dvb: allow to enforce DVB-S/T for old zap format 
> channels.conf
> - demux_libarchive: fix reading archives with '%' in stream URL path
> - vo_gpu_next: allow UINT upload if no other format is supported
> - ytdl_hook.lua: fix incorrect default format used with yt-dlp
> - vo_gpu_next: allow unsetting LUTs
> - stream_bluray: use bd_get_main_title() to get main title
> - vo_gpu_next: when tone-mapping, set better maxCLL value
> - stream_libarchive: seek source stream to 0 before probing
> - path-unix: support ~~desktop path expansion
> - ytdl_hook.lua: don't crash if playlist entries don't have an usable 
> URL
> - mac/vulkan: fix frame not displayed when paused
> - mac/common: render first frame on init if possible
> - video/out/w32_common: support --wid=0
> - demux_mkv: map and expose hearing/visual impaired flags
> - player/misc: show percentage progress for --stream-dump
> - command: fix null dereference for invalid command in input-commands
> - cplugin: fix missing init of pfn_mpv_get_time_ns
> - vo_dmabuf_wayland: actually reuse OSD buffers
> - mp_image: add support for AVAlphaMode
> - vo_gpu_next: add --border-background=blur and 
> --background-blur-radius
> - demux/cue: fix crash when there are no tracks
> - vf_format: add some basic HDR10 metadata
> - vo/context_android: fix surface tearing on resize
> - meson: remove redundant 'sdl2' option
> - mac/common: fix window position on multi monitor setups
> - vo_gpu_next: limit min_luma to 1000:1 contrast ratio in SDR mode
> - ao_pipewire: fix some incorrect channel mappings
> - wayland: correct geometry handling for rotated outputs
> - demux: clear packet pool when upper memory limit is lowered
> - mp_image: add ycgco-{re,ro} support
> - wayland: convert luminance values to libplacebo space
> - vo: trigger manual redraws at most at slightly over display fps
> - osxbundle: add new macOS 26 compatible App icon
> - wayland: support color-management-v1 version 2
> 
> This listing is not complete. Check DOCS/client-api-changes.rst for a 
> history
> of changes to the client API, and DOCS/interface-changes.rst for a 
> history
> of changes to other user-visible interfaces.
> 
> A complete changelog can be seen by running `git log v0.40.0..v0.41.0`
> in the git repository or by visiting
> <<https://github.com/mpv-player/mpv/compare/v0.40.0...v0.41.0>>.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../0001-mpv-fix-build-with-ffmpeg-8.0.patch  | 41 
> -------------------
>  .../mplayer/{mpv_0.40.0.bb => mpv_0.41.0.bb}  |  3 +-
>  2 files changed, 1 insertion(+), 43 deletions(-)
>  delete mode 100644 
> meta-oe/recipes-multimedia/mplayer/mpv/0001-mpv-fix-build-with-ffmpeg-8.0.patch
>  rename meta-oe/recipes-multimedia/mplayer/{mpv_0.40.0.bb => 
> mpv_0.41.0.bb} (97%)
> 
> diff --git 
> a/meta-oe/recipes-multimedia/mplayer/mpv/0001-mpv-fix-build-with-ffmpeg-8.0.patch 
> b/meta-oe/recipes-multimedia/mplayer/mpv/0001-mpv-fix-build-with-ffmpeg-8.0.patch
> deleted file mode 100644
> index ea705a4c73..0000000000
> --- 
> a/meta-oe/recipes-multimedia/mplayer/mpv/0001-mpv-fix-build-with-ffmpeg-8.0.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From dd80e5841894f854e2d994601016151531521d9a Mon Sep 17 00:00:00 
> 2001
> -From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> -Date: Tue, 16 Sep 2025 09:37:48 +0200
> -Subject: [PATCH] mpv: fix build with ffmpeg 8.0
> -
> -quick fix, only compile tested
> -
> -Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> -
> -Upstream-Status: Pending
> ----
> - demux/demux_mkv.c | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/demux/demux_mkv.c b/demux/demux_mkv.c
> -index 135edcc23d..cc7ce3e98f 100644
> ---- a/demux/demux_mkv.c
> -+++ b/demux/demux_mkv.c
> -@@ -2200,16 +2200,16 @@ static int demux_mkv_open_sub(demuxer_t 
> *demuxer, mkv_track_t *track)
> -             // [0x30..0x37] are component tags utilized for
> -             // non-mobile captioning service ("profile A").
> -             if (component_tag >= 0x30 && component_tag <= 0x37)
> --                lav->profile = FF_PROFILE_ARIB_PROFILE_A;
> -+                lav->profile = AV_PROFILE_ARIB_PROFILE_A;
> -             break;
> -         case 0x0012:
> -             // component tag 0x87 signifies a mobile/partial 
> reception
> -             // (1seg) captioning service ("profile C").
> -             if (component_tag == 0x87)
> --                lav->profile = FF_PROFILE_ARIB_PROFILE_C;
> -+                lav->profile = AV_PROFILE_ARIB_PROFILE_C;
> -             break;
> -         }
> --        if (lav->profile == FF_PROFILE_UNKNOWN)
> -+        if (lav->profile == AV_PROFILE_UNKNOWN)
> -             MP_WARN(demuxer, "ARIB caption profile %02x / %04x not 
> supported.\n",
> -                     component_tag, data_component_id);
> -     }
> ---
> -2.50.1
> -
> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb 
> b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
> similarity index 97%
> rename from meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
> rename to meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
> index 117395b371..dede59f099 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
> @@ -16,9 +16,8 @@ DEPENDS = " \
>  LICENSE = "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM = 
> "file://LICENSE.GPL;md5=570a9b3749dd0463a1778803b12a6dce" 
> <file://license.gpl;md5=570a9b3749dd0463a1778803b12a6dce/>
> 
> -SRCREV = "e48ac7ce08462f5e33af6ef9deeac6fa87eef01e"
> +SRCREV = "41f6a645068483470267271e1d09966ca3b9f413"
>  SRC_URI = 
> "git://github.com/mpv-player/mpv;name=mpv;branch=release/${@oe.utils.trim 
> <mailto:${@oe.utils.trim>_version('${PV}', 2)};protocol=https"
> -SRC_URI += "file://0001-mpv-fix-build-with-ffmpeg-8.0.patch" 
> <file://0001-mpv-fix-build-with-ffmpeg-8.0.patch/>
> 
>  inherit meson pkgconfig mime-xdg
> 
> --
> 2.52.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122954): 
> <https://lists.openembedded.org/g/openembedded-devel/message/122954>
> Mute This Topic: <https://lists.openembedded.org/mt/116965470/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-nOm/atglbgGUAFhsE8Ay
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>just noticed that this recipe has already been updated</div></div><div id="geary-quote" dir="auto"><br>On Sat, Dec 27 2025 at 22:47:11 +01:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Release 0.41.0
==============

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

This release requires FFmpeg 6.1 or newer and libplacebo 6.338.2 or newer.

- clipboard-wayland: support clipboard writing
- wayland: add support for wp-color-representation-v1
- wayland: tablet input support
- vo_gpu_next: add support for blend-subtitles=video
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

- sub: add control for libass caching options (glyph-limit, bitmap-max-size)
- vo: add options to control background tile appearance (transparency)
- command: add default and forced flags to the track add commands
- vo_gpu_next: add options to control subtitle peak for HDR output
- video/out/d3d11: add d3d11 composition mode support
- vd_lavc: add --hwdec-threads
- stream_bluray: add --bluray-angle
- vo_gpu_next: add options to control output colorspace metadata more precisely
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
- video/out/w32_common: support --wid=0
- demux_mkv: map and expose hearing/visual impaired flags
- player/misc: show percentage progress for --stream-dump
- command: fix null dereference for invalid command in input-commands
- cplugin: fix missing init of pfn_mpv_get_time_ns
- vo_dmabuf_wayland: actually reuse OSD buffers
- mp_image: add support for AVAlphaMode
- vo_gpu_next: add --border-background=blur and --background-blur-radius
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

This listing is not complete. Check DOCS/client-api-changes.rst for a history
of changes to the client API, and DOCS/interface-changes.rst for a history
of changes to other user-visible interfaces.

A complete changelog can be seen by running `git log v0.40.0..v0.41.0`
in the git repository or by visiting
&lt;<a href="https://github.com/mpv-player/mpv/compare/v0.40.0...v0.41.0">https://github.com/mpv-player/mpv/compare/v0.40.0...v0.41.0</a>&gt;.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../0001-mpv-fix-build-with-ffmpeg-8.0.patch  | 41 -------------------
 .../mplayer/{mpv_0.40.0.bb =&gt; mpv_0.41.0.bb}  |  3 +-
 2 files changed, 1 insertion(+), 43 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/0001-mpv-fix-build-with-ffmpeg-8.0.patch
 rename meta-oe/recipes-multimedia/mplayer/{mpv_0.40.0.bb =&gt; mpv_0.41.0.bb} (97%)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/0001-mpv-fix-build-with-ffmpeg-8.0.patch b/meta-oe/recipes-multimedia/mplayer/mpv/0001-mpv-fix-build-with-ffmpeg-8.0.patch
deleted file mode 100644
index ea705a4c73..0000000000
--- a/meta-oe/recipes-multimedia/mplayer/mpv/0001-mpv-fix-build-with-ffmpeg-8.0.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From dd80e5841894f854e2d994601016151531521d9a Mon Sep 17 00:00:00 2001
-From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
-Date: Tue, 16 Sep 2025 09:37:48 +0200
-Subject: [PATCH] mpv: fix build with ffmpeg 8.0
-
-quick fix, only compile tested
-
-Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
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
-@@ -2200,16 +2200,16 @@ static int demux_mkv_open_sub(demuxer_t *demuxer, mkv_track_t *track)
-             // [0x30..0x37] are component tags utilized for
-             // non-mobile captioning service ("profile A").
-             if (component_tag &gt;= 0x30 &amp;&amp; component_tag &lt;= 0x37)
--                lav-&gt;profile = FF_PROFILE_ARIB_PROFILE_A;
-+                lav-&gt;profile = AV_PROFILE_ARIB_PROFILE_A;
-             break;
-         case 0x0012:
-             // component tag 0x87 signifies a mobile/partial reception
-             // (1seg) captioning service ("profile C").
-             if (component_tag == 0x87)
--                lav-&gt;profile = FF_PROFILE_ARIB_PROFILE_C;
-+                lav-&gt;profile = AV_PROFILE_ARIB_PROFILE_C;
-             break;
-         }
--        if (lav-&gt;profile == FF_PROFILE_UNKNOWN)
-+        if (lav-&gt;profile == AV_PROFILE_UNKNOWN)
-             MP_WARN(demuxer, "ARIB caption profile %02x / %04x not supported.\n",
-                     component_tag, data_component_id);
-     }
--- 
-2.50.1
-
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
similarity index 97%
rename from meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
rename to meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
index 117395b371..dede59f099 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
@@ -16,9 +16,8 @@ DEPENDS = " \
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "<a href="file://LICENSE.GPL;md5=570a9b3749dd0463a1778803b12a6dce" "="">file://LICENSE.GPL;md5=570a9b3749dd0463a1778803b12a6dce"</a>
 
-SRCREV = "e48ac7ce08462f5e33af6ef9deeac6fa87eef01e"
+SRCREV = "41f6a645068483470267271e1d09966ca3b9f413"
 SRC_URI = "git://github.com/mpv-player/mpv;name=mpv;branch=release/<a href="mailto:${@oe.utils.trim">${@oe.utils.trim</a>_version('${PV}', 2)};protocol=https"
-SRC_URI += "<a href="file://0001-mpv-fix-build-with-ffmpeg-8.0.patch" "="">file://0001-mpv-fix-build-with-ffmpeg-8.0.patch"</a>
 
 inherit meson pkgconfig mime-xdg
 
<div>-- 
</div>2.52.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#122954): <a href="https://lists.openembedded.org/g/openembedded-devel/message/122954">https://lists.openembedded.org/g/openembedded-devel/message/122954</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/116965470/3618223">https://lists.openembedded.org/mt/116965470/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-nOm/atglbgGUAFhsE8Ay--


