Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD1EC197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 17:34:53 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.2338.1700501684422578194
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Nov 2023 09:34:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QneAABnI;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1e9c9d181d6so2858958fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 09:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700501683; x=1701106483; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNJ9BrI5Rux11jLqV8xCo/jBqfrbz0jjiL5/LB9SVlI=;
        b=QneAABnIN9j7e9IPuPGenkcYyq5ttqfzCrpapf4xDLlU4KOqSzSjqqDrSUNqzKOUyb
         WjMkeHNwY0FLAX6UmNcytI+uA1vqCI1UzhB6wCB4G6LcRM6cjXw/w9wLrHDofLAkzKEL
         A/NWT+F1s8TiNNn8Msbb8xrK1xtuIkaa2BccvWG0vtnXpK8zBykqasVi0BhEbIeBjxfI
         gOY8ceRiX7I1/agX6Kf33eLWGQab3O7OTbtBvJlwCyWI/AYjrU5n/wvimcpVZwHuK0Wm
         YWPjmKhkz6iXqkFGHbyf7+E0drOyHp1KIIkM43JWFumBG8925mgk8iI+ebeMgOQJGC3G
         oCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700501683; x=1701106483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNJ9BrI5Rux11jLqV8xCo/jBqfrbz0jjiL5/LB9SVlI=;
        b=F3jvCzfEDNM071H6WbTUF/YG9KQf6UJm5U6DWlBGqN+DeQUv322Rdo5aoX08JOD5w3
         baeD1Y8Hw0UnpipJW7MMScNWz4JOsan+WRf4zSY/oF13fKdYWlEs4WH5hIC1bGvcm1fN
         Ixafrj8SokglRm7JFGF6dpsByDoN8dHLDOltMH5EB1PYPhXURgVpuJmmmdW2FK1HUFT4
         /m0+BKGVjGlAnM5xFBsFgO6QgkmieAXylCNQvOAEFOIyZ6sF0ER4SguuSNDed7tAKNzi
         ZDdU/Y0BhcUYM8wdCVlRDnKEtXLrw08FRx6augrr72seEvgWIZNaEXVcZE0Hrba6m//o
         F1kQ==
X-Gm-Message-State: AOJu0YyNskJPNWIENN0K9hRdRasjRKP3Xej+c/YTLXk7H1P+ImZ3n8tF
	7+AoRWFqzhyTo+CZVQ0dYt+6uWAbOfYKGUDB0OYXfnChWJw=
X-Google-Smtp-Source: AGHT+IFM3vF/MuOfHAAoJsGOBZaTAyTuzM6fk0d8by7VYnTVetootfXhW42ai0JNrpRlQut/3g6NuQsm4B2pErxDAIY=
X-Received: by 2002:a05:6870:e2d0:b0:1f4:d9a6:d4ee with SMTP id
 w16-20020a056870e2d000b001f4d9a6d4eemr9774449oad.12.1700501683562; Mon, 20
 Nov 2023 09:34:43 -0800 (PST)
MIME-Version: 1.0
References: <20231120165324.2214368-1-f_l_k@t-online.de>
In-Reply-To: <20231120165324.2214368-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Nov 2023 09:34:17 -0800
Message-ID: <CAMKF1soGL1JYzzjNKAf+6sM=ZHuDwY7rJpoAQT7J2HxiaB=Pxw@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] musicpd: unbreak build with ffmpeg 6.1
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 17:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106964

its upgraded to 0.23.14 on master, so please rebase on latest master
and send again.

On Mon, Nov 20, 2023 at 8:53=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...tch-src_decoder_plugins_FfmpegIo.cxx.patch | 26 +++++++++++++++++++
>  .../recipes-multimedia/musicpd/mpd_0.23.12.bb |  1 +
>  2 files changed, 27 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/0001-p=
atch-src_decoder_plugins_FfmpegIo.cxx.patch
>
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-patch-sr=
c_decoder_plugins_FfmpegIo.cxx.patch b/meta-multimedia/recipes-multimedia/m=
usicpd/mpd/0001-patch-src_decoder_plugins_FfmpegIo.cxx.patch
> new file mode 100644
> index 000000000..b2dea331e
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-patch-src_decod=
er_plugins_FfmpegIo.cxx.patch
> @@ -0,0 +1,26 @@
> +From e62fd0eefe8b475e70d87a673a7216aac3bb622f Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Mon, 20 Nov 2023 17:49:59 +0100
> +Subject: [PATCH] patch src_decoder_plugins_FfmpegIo.cxx
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +Upstream-Status: Pending [https://github.com/MusicPlayerDaemon/MPD/issue=
s/1898]
> +---
> + src/decoder/plugins/FfmpegIo.cxx | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/decoder/plugins/FfmpegIo.cxx b/src/decoder/plugins/Ffmp=
egIo.cxx
> +index 572f1a86a..3e2347fec 100644
> +--- a/src/decoder/plugins/FfmpegIo.cxx
> ++++ b/src/decoder/plugins/FfmpegIo.cxx
> +@@ -25,6 +25,7 @@
> + #include "input/InputStream.hxx"
> +
> + extern "C" {
> ++#include <libavutil/error.h>
> + #include <libavutil/mem.h>
> + }
> +
> +--
> +2.42.0
> +
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb b/=
meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
> index 0c309ded0..4e9cb9090 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
> @@ -23,6 +23,7 @@ SRC_URI =3D "git://github.com/MusicPlayerDaemon/MPD;bra=
nch=3Dmaster;protocol=3Dhttps \
>             file://minor-fixup-for-libfmt10.patch \
>             file://fix-build-error-when-fmt-updated.patch \
>             file://0001-SndfileDecoderPlugin-Fix-type-mismatch-for-std-sp=
an.patch \
> +           file://0001-patch-src_decoder_plugins_FfmpegIo.cxx.patch \
>             "
>  SRCREV =3D "b1422fbda40a1831d397fb161e7a555443c2a072"
>  S =3D "${WORKDIR}/git"
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106963): https://lists.openembedded.org/g/openembedde=
d-devel/message/106963
> Mute This Topic: https://lists.openembedded.org/mt/102710978/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

