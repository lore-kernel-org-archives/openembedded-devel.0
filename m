Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCD7C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 22:43:19 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.37308.1704494598929125537
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jan 2024 14:43:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jNMvH1f+;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2048e63dbd9so45720fac.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Jan 2024 14:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704494598; x=1705099398; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jf4lp5EawJzDDJIDENzEQMrDjcaMWOOiasEl9FjVe0=;
        b=jNMvH1f+TWD9Yt4/KgFhnzKajxrPECRm6LUXP6AhaNPZK68ud8lpbAokOWUVMOYtE1
         kZisAISj909ZvhJV27OT64s+jTL3lcGk7ukcKMlIdVtLO5Vh+CpUG0WETcPAoMVgUFRl
         Nch4+pwD1YAkI4vX74s9TqqvldI54xu/i7SnFFFIiW3+9uXYhdj/F0ajrAP6+gAAtvYj
         XTkxNPXSz96Nwj2o9wbi51PPMlnWdoeM6LkPfLnSYqCqOfLhNyt3GF9piLi3zUhwanNH
         BQxasochpQxNlzTAeQurbhnj6q7MpU4DLEAjOAYypaEQYEdQZED66EDtlMy4cMTMwGcy
         pT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704494598; x=1705099398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jf4lp5EawJzDDJIDENzEQMrDjcaMWOOiasEl9FjVe0=;
        b=QzI6mf9kXixx6nEa8tfvpcDmqaqRbaImU3ZE0QqMNj1XoouvG2RdAuoqjc4x+90iY6
         0wBVRqVHeaS12AxEiGaPNI7JW3XWQfPivsumkKxU1nNusIAgqtEtNkeq0POMcjgi4YUR
         /Gqk47j+98btSr3NxrmPtKVHm54vlYOA+tZKCN1+1Hu7mGA9p/Z4RzwnD+U922K/6h82
         vPBlziW5LEimKXFnjfqbYeTC1PTDC5Kk50rg+ZLW2d+aurBUC3Qt8gaUyl8L93TbHZD+
         jLwnoYWbtt5NOGKWZycnc+3t/CPqaDxcei2ZrRxTAAMtsBDHZrSfCJcFzL8jGFSyAuxG
         HAYg==
X-Gm-Message-State: AOJu0YyN/ijHL6VaA7OatCxStiP8jAAjq4LoMDN2NLN6MQGmY42RTstu
	CUjCqR5c/5tf1827QBIjExjH9pcUQJOyzEBG5Yo=
X-Google-Smtp-Source: AGHT+IGLefS8IIJPTw1gKglxhojHIIdv9/ibkou7AuhY7pNW9qUbfiRh1ICKixALwk3YB1qSAxwx3LE685WZD1rrxJc=
X-Received: by 2002:a05:6871:a0ca:b0:203:55e6:7678 with SMTP id
 vr10-20020a056871a0ca00b0020355e67678mr77828oab.40.1704494598071; Fri, 05 Jan
 2024 14:43:18 -0800 (PST)
MIME-Version: 1.0
References: <20240105183648.61874-1-f_l_k@t-online.de>
In-Reply-To: <20240105183648.61874-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Jan 2024 14:42:51 -0800
Message-ID: <CAMKF1srUMiM+r6eacPmb6aMeF1PS48Mifoc8hGLPKzpW1KCmng@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] libplacebo: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Jan 2024 22:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108056

On Fri, Jan 5, 2024 at 10:37=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> libplacebo is a required build dependency for mpv-0.37
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...001-frame_queue.h-add-frame_duration.patch | 32 +++++++++++++++++++
>  .../libplacebo/0001-gpu.h-add-stride_w.patch  | 30 +++++++++++++++++
>  .../mplayer/libplacebo_git.bb                 | 28 ++++++++++++++++
>  3 files changed, 90 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/mplayer/libplacebo/0001-fr=
ame_queue.h-add-frame_duration.patch
>  create mode 100644 meta-oe/recipes-multimedia/mplayer/libplacebo/0001-gp=
u.h-add-stride_w.patch
>  create mode 100644 meta-oe/recipes-multimedia/mplayer/libplacebo_git.bb
>
> diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-frame_que=
ue.h-add-frame_duration.patch b/meta-oe/recipes-multimedia/mplayer/libplace=
bo/0001-frame_queue.h-add-frame_duration.patch
> new file mode 100644
> index 000000000..5b4ded981
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-frame_queue.h-ad=
d-frame_duration.patch
> @@ -0,0 +1,32 @@
> +From 8437cd1fa7dc1797d3290c121ca17b39a0d2fd6a Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Tue, 5 Dec 2023 19:49:42 +0100
> +Subject: [PATCH] frame_queue.h: add frame_duration
> +
> +This fixes:
> +| [ 87/266] Compiling stream/cookies.c
> +| ../git/video/out/vo_gpu_next.c: In function 'draw_frame':
> +| ../git/video/out/vo_gpu_next.c:932:14: error: 'struct pl_queue_params'=
 has no member named 'frame_duration'
> +|   932 |             .frame_duration =3D frame->ideal_frame_duration,
> +|       |              ^~~~~~~~~~~~~~
> +
> +---
> + src/include/libplacebo/utils/frame_queue.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/include/libplacebo/utils/frame_queue.h b/src/include/li=
bplacebo/utils/frame_queue.h
> +index 2a9c90c3..8afa4355 100644
> +--- a/src/include/libplacebo/utils/frame_queue.h
> ++++ b/src/include/libplacebo/utils/frame_queue.h
> +@@ -170,6 +170,8 @@ struct pl_queue_params {
> +     // should instead be interpreted by the provided callback.
> +     uint64_t timeout;
> +
> ++    const float frame_duration;
> ++
> +     // This callback will be used to pull new frames from the decoder. =
It may
> +     // block if needed. The user is responsible for setting appropriate=
 time
> +     // limits and/or returning and interpreting QUEUE_MORE as sensible.
> +--
> +2.42.1
> +
> diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-gpu.h-add=
-stride_w.patch b/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-gpu.h-=
add-stride_w.patch
> new file mode 100644
> index 000000000..f08e122cf
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-gpu.h-add-stride=
_w.patch
> @@ -0,0 +1,30 @@
> +From fbf74064bbb7133efe9234ef83976f06b3690e88 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Tue, 5 Dec 2023 19:35:51 +0100
> +Subject: [PATCH] gpu.h: add stride_w
> +
> +this fixes:
> +| [113/257] Compiling common/codecs.c
> +| ../git/video/out/vo_gpu_next.c: In function 'update_overlays':
> +| ../git/video/out/vo_gpu_next.c:268:14: error: 'struct pl_tex_transfer_=
params' has no member named 'stride_w'
> +|   268 |             .stride_w   =3D item->packed->stride[0] / tex_fmt-=
>texel_size,
> +|       |              ^~~~~~~~
> +---
> + src/include/libplacebo/gpu.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/include/libplacebo/gpu.h b/src/include/libplacebo/gpu.h
> +index a63fdf7c..57b4f195 100644
> +--- a/src/include/libplacebo/gpu.h
> ++++ b/src/include/libplacebo/gpu.h
> +@@ -904,6 +904,7 @@ struct pl_tex_transfer_params {
> +
> +     // Note: The contents of the memory region / buffer must exactly ma=
tch the
> +     // texture format; i.e. there is no explicit conversion between for=
mats.
> ++    size_t stride_w;    //
> + };
> +
> + #define pl_tex_transfer_params(...) (&(struct pl_tex_transfer_params) {=
 __VA_ARGS__ })
> +--
> +2.42.1
> +
> diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_git.bb b/meta-=
oe/recipes-multimedia/mplayer/libplacebo_git.bb
> new file mode 100644
> index 000000000..dd0796782
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_git.bb
> @@ -0,0 +1,28 @@
> +SUMMARY =3D "The core rendering algorithms and ideas of mpv rewritten as=
 an independent library."
> +SECTION =3D "multimedia"
> +HOMEPAGE =3D "https://opensourcelibs.com/lib/libplacebo"
> +
> +LICENSE =3D "LGPL-2.1-only"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D435ed639f84d4585d93824e7da3d8=
5da"
> +
> +SRC_URI =3D " \
> +       git://code.videolan.org/videolan/libplacebo.git;protocol=3Dhttps;=
branch=3Dv6.338 \
> +       file://0001-gpu.h-add-stride_w.patch \
> +       file://0001-frame_queue.h-add-frame_duration.patch \
> +"
> +
> +S =3D "${WORKDIR}/git"
> +SRCREV =3D "2805a0d01c029084ab36bf5d0e3c8742012a0b27"
> +PV =3D "6.338.1"
> +
> +inherit meson pkgconfig
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'vulkan openg=
l', d)}"
> +
> +PACKAGECONFIG[vulkan] =3D  "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulka=
n-loader vulkan-headers shaderc spirv-shader-generator python3-mako-native =
python3-jinja2-native glad-native"
> +PACKAGECONFIG[opengl] =3D "-Dopengl=3Denabled,-Dopengl=3Ddisabled,glad,g=
lad"

glad recipe does not exist in either core or meta-openembedded layers.

stdio: ERROR: Nothing PROVIDES 'glad-native' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipe=
s-multimedia/mplayer/libplacebo_git.bb
DEPENDS on or otherwise requires it). Close matches:


> +PACKAGECONFIG[lcms] =3D "-Dlcms=3Denabled,-Dlcms=3Ddisabled,lcms"
> +PACKAGECONFIG[demos] =3D "-Ddemos=3Dtrue,-Ddemos=3Dfalse,ffmpeg libsdl2 =
libsdl2-image"
> +
> +EXTRA_OEMESON =3D "-Dvulkan-registry=3D${STAGING_DATADIR}/vulkan/registr=
y/vk.xml"
> +
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108050): https://lists.openembedded.org/g/openembedde=
d-devel/message/108050
> Mute This Topic: https://lists.openembedded.org/mt/103548464/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

