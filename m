Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D026BC64EC4
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 02:43:31 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.5891.1678157008845996602
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Mar 2023 18:43:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o3f1L+ee;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id q15so8628776oiw.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Mar 2023 18:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678157008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+E95ffi44VogpgIxzJjAL6KFfC1vD4wsPYnkRg6ok/s=;
        b=o3f1L+eeEgPTATxuBrsV1fIBG4ZN3KV8wm/Rd5YO2nrPQQa+1VkZo+0wdtFKCDQM2K
         P8nqgevI1vmMRiY463FvBl0JDf0LNNRocP3WZCixm04jtYuovQFlZXcA8bnwFexjdoJN
         X8WNH1ulgmiIfuh3XtOqdZfl4mIXi2v6lNZFRrZUxJfPepOhMPzFdK4mEFsgl64giUil
         Mad+eUfU+6Q8p3EsQOiS2N6eKqKitmGgwBBuBLq4rO8088oaRXiaxRm9Z2g7oQ1xFOQE
         dphG+XspxI8PmNe3f6y/c618qBEbr89Kk657/PjvDMnDzv6RaBSPBNm4mAQnMF4hdcb7
         07ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678157008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+E95ffi44VogpgIxzJjAL6KFfC1vD4wsPYnkRg6ok/s=;
        b=o6DrBBd2haE33FGKpp68F7iF0oYzGV6KJv8Lf7JFLkvxpO3yTtgRIoLbNq36frJLgA
         f3z6SZs0JWM0HxjYZxzlkT79O2n+matwGrstR4RZdzPJjNxvWPgmT7+DOGjFDzIpzJef
         fbw1dYtFU9ChY/TRffrjpv6/ZHtwY+ylSdFwTt2gzLzRYDmCo1PISrrBP3YuMY6qEkIW
         cX40XvGGP+vpZiSt6biu581Cuy3D1jhqUp3ujVKpH4gKE3Va7i39Ngwk8NVAAgh4sv0P
         7E11iBipQ2njfrWVfW/mfe5vX0Qmxs/Spp5rOd3x3fEQnC0Y09u3XrkB//eBZ6VIX3Lk
         GvCQ==
X-Gm-Message-State: AO0yUKVLFaKuy7EFSWF1101DhwRY72sk17ON/i0rWHDFM8lwP/dRLOPg
	h+8Jf7MOa2RJq4xHywU4zxcXA4Pza6uvk8Xi+rA=
X-Google-Smtp-Source: AK7set9Mpv34FA0ouL4bB/NRlYSctC4BNk46fVsW61GhT+MzYqJ1ITy2qWSJL2eCue9gbpmXbOM+Dy95SKM1gpPRNnA=
X-Received: by 2002:a05:6808:aa1:b0:384:2022:f9b1 with SMTP id
 r1-20020a0568080aa100b003842022f9b1mr4155419oij.2.1678157007999; Mon, 06 Mar
 2023 18:43:27 -0800 (PST)
MIME-Version: 1.0
References: <20230307020508.3897850-1-f_l_k@t-online.de>
In-Reply-To: <20230307020508.3897850-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Mar 2023 18:43:02 -0800
Message-ID: <CAMKF1sognPcfw0+iNwjSmc2DBJHordHgZu0i8MZnnYzauqyfyg@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 1/2] dav1d: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Mar 2023 02:43:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101403

On Mon, Mar 6, 2023 at 6:05=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wrot=
e:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../recipes-multimedia/dav1d/dav1d_1.1.0.bb   | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/dav1d/dav1d_1.1.0.=
bb
>
> diff --git a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.1.0.bb b/me=
ta-multimedia/recipes-multimedia/dav1d/dav1d_1.1.0.bb
> new file mode 100644
> index 000000000..eadc660c7
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.1.0.bb
> @@ -0,0 +1,19 @@
> +SUMMARY =3D "dav1d AV1 decoder"
> +DESCRIPTION =3D "Targeted to be small, portable and fast."
> +HOMEPAGE =3D "https://code.videolan.org/videolan/dav1d"
> +SECTION =3D "multimedia"
> +LICENSE =3D "BSD-2-Clause"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8055cfe7548dfdaa3a6dc45d8793=
669"
> +
> +SRC_URI =3D "git://code.videolan.org/videolan/dav1d.git;protocol=3Dhttps=
;branch=3Dmaster"
> +PV =3D "1.1.0"

this is redundant

> +SRCREV =3D "9593e625b75d498d1edea544da21ea764b98d507"
> +
> +S =3D "${WORKDIR}/git"
> +
> +DEPENDS:x86 =3D "nasm-native"
> +DEPENDS:x86-64 =3D "nasm-native"
> +
use :append

> +inherit meson
> +
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101402): https://lists.openembedded.org/g/openembedde=
d-devel/message/101402
> Mute This Topic: https://lists.openembedded.org/mt/97441321/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

