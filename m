Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6591C369B6
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 20:13:36 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.2591.1743452013824145895
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 13:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HM3R6tab;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3feaedb531dso949772b6e.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 13:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743452013; x=1744056813; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vnd9QhoDY6Qp6ort9DN60z06DRpT3uCVXeaw1/6bjsA=;
        b=HM3R6tabyQsbPzItRAUMLyumTcul7b4XynNO2CJzKVk27p/vHHVyt4O0eG7qKr/gyf
         gqth8Dj0U0MAPZlaGST8mtkxVUc0nNtFuK7NVzZ/cAJwKghPNMby1TgthcM208F34i1b
         YrTq2j9xMW0TcSUqHCe9/eBUsc6DQrf/2BN5AaEuk9WrXCXCiEIz45eIM7+tnwVDE7lk
         KSfjyRjdN1tHJLFpY0O+cfYS/oMi1QVjEKb7a3D2qu/hBdbf/w3zVMs3maztdwuAz+JA
         uDTNpPZl2GINEJpIO7yq+dKEweVbEMNCj9v9x4iW/kmzs2jshlNeTGCVxBEWlXoMMEx/
         VxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743452013; x=1744056813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vnd9QhoDY6Qp6ort9DN60z06DRpT3uCVXeaw1/6bjsA=;
        b=B1LpnO4tGJYY1Z/GTJti7lXX3SFcBYny/bgxEqNDoCFHaI908wrGHmKzC1c5/Rr3lh
         OkbFDMhqgCd7ikS2qtTyF+kP7n+Q2YjW1R1LncUTSpP0CJZjjS3y92c7E1qR/F10I+HM
         B+BWZtrf1URsFNtSPUlHJNd2j0UuK1MzrIGXP9TDweQGiMlh1FPsJOQvkGSGeolHGmov
         K87UPUKJ0LD9pFX4Ix0IuMJqOAkNak97fImz5ZIcUPffDcgSLSi4btJbfzJLOEV1Z9gc
         WrNf1SyEgWqBRjn5c6pm3wFz6Q261VXZQzLpHAsIzL4nCSloii2VApZXlK4JKAgDfqsl
         v6rg==
X-Gm-Message-State: AOJu0Yy00IqXstEh74P8GAiKsM61Vq+Bm33LTgK9d+50brvmtTmkPlyn
	rrhUkrhg7UMBQM0jfV/rG78Oyx5nYOuLr3mDRhccVzoVcfIMmpBM4lpvpoTVpnpzuC94UOc5TXZ
	AI2FlKQN07bC9/ga2nnmf4e7A1fg=
X-Gm-Gg: ASbGnctQ6QlxejZe3MJAzVyI4on04kBou2ND7gTbBTJ4ZZnfv7nB00quuK74cbyoy4d
	2eeAmROW6EH1faOWCTSOM3B/scfJrKRlyw7+Hi40nOP++BCTEQ2QxDb+D0EktPLhsHDlR+28mB6
	SQIDGBkjrzberpIvaQRQtmZlw3
X-Google-Smtp-Source: AGHT+IGgohoO1dQa3ALpPjwW174QMzskiALorXGBfKS4JYottUoDuWiYzAlizO0WcvPw6FADloBt4EfQrJeawxB31t4=
X-Received: by 2002:a05:6808:1886:b0:3fa:35a0:c74c with SMTP id
 5614622812f47-3ff0f5c4d88mr4299130b6e.38.1743452012974; Mon, 31 Mar 2025
 13:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250329004654.368877-1-f_l_k@t-online.de>
In-Reply-To: <20250329004654.368877-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Mar 2025 13:13:07 -0700
X-Gm-Features: AQ5f1JoEtj6S3POWwQ-c3kGybKA7tqz8Wg063tJxdL752VB-INF2HWHfBgwGT3Y
Message-ID: <CAMKF1srnm0JQOP9ZVdB42b-nhbo5upfbEsot4Piz3ATzHyz1Og@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mpv: update 0.39 -> 0.40
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 20:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116436

seeing this - https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/b=
uilds/527/steps/11/logs/errors

On Fri, Mar 28, 2025 at 5:46=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> - license files have been updated without change
> - add dependency on 'libdisplay-info'
>
> Release 0.40.0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> We are excited to announce the release of mpv 0.40.0.
>
> Key highlights:
>
> * Console: Enhanced autocompletion and visual styling
> * OSC: New selection menu accessible by right-clicking common buttons
> * HDR is now natively supported when using direct rendering (DRM),
>   as well as dmabuf-wayland on Linux
> * Native clipboard access for scripts via new `clipboard` property
> * New command menu, with common actions easily accessible
> * Enhanced select.lua with new selection options for watch history, editi=
ons, DVD/Blu-Ray titles
> * New positioning.lua script script for cursor-centric zooming and drag t=
o pan
> * Better stream support for Blu-ray, DVD and CDDA
> * Track selection improvements and better metadata display
> * Added osd-box / sub-box / box profiles to easily enable box styled OSD/=
OSC
> * Windows support in umpv helper script
>
> This release requires FFmpeg 6.1 or newer and libplacebo 6.338.2 or newer=
.
>
> - vf_d3d11vpp: add NVIDIA RTX Video HDR support
> - context_drm_gl: add support for HDR metadata
> - positioning.lua: add new script for video alignment and zooming
> - umpv: add Windows support
> - command: add clipboard property with native backends for Windows, macOS=
, and Wayland
> - select.lua: add watch history, edition, DVD/Blu-Ray titles and more sel=
ection options
> - input.conf: add cursor-centric zoom and drag-to-pan bindings
> - wayland: add support for wp-color-management-v1 protocol
> - console.lua: add persistent command history
> - stats.lua: add timecode display
> - options: add --playlist-exts and --archive-exts
> - wayland_common: support IME usage via text-input-v3
> - command: add multiple track metadata and properties
> - vo_gpu_next: add chroma location and HDR metadata to shader parameters
> - player/screenshot: support more formats for screenshot-raw command
> - demux_mkv: add `--demuxer-mkv-crop-compat` option
> - misc/language: parse hi/sdh/cc tags from external subtitle tracks
> - wayland: support xdg-activation
> - player: add mpv:// protocol
>
> - meson: build libmpv by default
> - command: enhance track and playlist display information
> - input.conf: improve numpad key bindings
> - osc.lua: add custom buttons support and improved mouse bindings
> - console.lua: inherit OSD styles and colors
> - options: default to --prefetch-playlist=3Dyes
> - osc.lua: add slimbottombar and slimtopbar layouts
> - command: improve frame-step to go through multiple frames
> - wayland: use wp-presentation v2 if available
> - various: reorganize options into more logical groups
> - vo_gpu_next: improve target colorspace handling
> - options: disable `--input-ime` by default (enabled on demand)
>
> - sd_ass: introduce sub-ass-prune-delay
> - player: add an optional mute flag when framestepping
> - command: add clipboard/text-primary property
> - command: add current-clipboard-backend property
> - command: add notify-property command
> - options: add --script-opt alias for --script-opts-append
> - options: add --osd-bar-marker-{size,style} options
> - options: add --input-ime for improved text input
> - options: add --video-recenter
> - options: add --clipboard-backends
> - options: add --wayland-internal-vsync
> - options: add --sub-scale-signs
>
> - options: rename --load-osd-console to --load-console
> - player: improve track selection for multi-component languages
> - options: improve frame-step command to handle multiple frames
> - input.conf: make Alt+BS reset --video-align-{x,y}
> - command: print track metadata when changing track
> - command: print track-list with enhanced metadata
>
> - options: deprecate `--gamma-auto` (use gamma-auto.lua script instead)
> - options: deprecate undocumented --cdda-span-{a,b} options
>
> - f_hwtransfer: ensure that we convert to full range rgb with scale_vaapi
> - win32: fix window size restore after maximize state
> - build: fix dynamic generation of mpv.desktop file protocols
> - player/sub: avoid pointlessly redecoding subs
> - x11: remove nvidia blacklist logic from --x11-present=3Dauto
> - osc.lua: seek to the nearest chapter when right clicking the seekbar
> - command: fix keybind command with sequence keys
> - video/out/wayland_common: fix crash with multi-seat drag and drop
> - demux: reclaim demux_packets to reduce memory allocator pressure
> - demux_cue: only accept TRACK with AUDIO type
> - player/loadfile: strip common filename part from external track title
> - build: remove unused dvdread dependency
> - wayland: fix vertical resizing and scaling issues
> - console.lua: improve completion and visual appearance
> - sub/osd: default to a semitransparent black back color
> - player: improve playlist handling with prefetch
> - drm: parse EDID using libdisplay-info (which is now a required dependen=
cy)
> - win32: fix window size restore after maximize state
> - hwdec_d3d11va: align image mapper dimensions to a multiple of 2
> - wayland: fix DnD with focus follow mouse
> - player: store external filenames as normalized
> - player: properly handle secondary subtitles on the terminal
> - demux_mkv: add support for chroma location
> - vo_dmabuf_wayland: improve and fix format selection
> - player: fix combination of --loop-playlist + --shuffle + --prefetch-pla=
ylist
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../mplayer/{mpv_0.39.0.bb =3D> mpv_0.40.0.bb}           | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>  rename meta-oe/recipes-multimedia/mplayer/{mpv_0.39.0.bb =3D> mpv_0.40.0=
.bb} (93%)
>
> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.39.0.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mpv_0.40.0.bb
> similarity index 93%
> rename from meta-oe/recipes-multimedia/mplayer/mpv_0.39.0.bb
> rename to meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
> index c699e73efe..1fa6a6da65 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mpv_0.39.0.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
> @@ -9,17 +9,15 @@ DEPENDS =3D " \
>      jpeg \
>      libv4l \
>      libass \
> +    libdisplay-info \
>      libplacebo \
>  "
>
>  LICENSE =3D "GPL-2.0-or-later"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.GPL;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.GPL;md5=3D570a9b3749dd0463a1778803b=
12a6dce"
>
> -SRCREV =3D "a0fba7be57f3822d967b04f0f6b6d6341e7516e7"
> -SRC_URI =3D " \
> -       git://github.com/mpv-player/mpv;name=3Dmpv;branch=3Drelease/0.39;=
protocol=3Dhttps \
> -       file://a7efb3e62bbd0af86737f5ecb72d3a8e2a8c3b54.patch \
> -"
> +SRCREV =3D "e48ac7ce08462f5e33af6ef9deeac6fa87eef01e"
> +SRC_URI =3D "git://github.com/mpv-player/mpv;name=3Dmpv;branch=3Drelease=
/${@oe.utils.trim_version('${PV}', 2)};protocol=3Dhttps"
>  S =3D "${WORKDIR}/git"
>
>  inherit meson pkgconfig mime-xdg
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116359): https://lists.openembedded.org/g/openembedde=
d-devel/message/116359
> Mute This Topic: https://lists.openembedded.org/mt/111965538/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

