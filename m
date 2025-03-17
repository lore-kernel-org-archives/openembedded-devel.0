Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9430C35FF9
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 15:39:40 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.55815.1742225973950184604
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Mar 2025 08:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZuQR9zo3;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5499659e669so4997289e87.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 08:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742225972; x=1742830772; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f59mUDKtUwWZFZzzBPBQbayCac9CHdgE5wq9o7E2FQs=;
        b=ZuQR9zo3eNZ89dieyizZGiW2xfJHU4M9LbYpeHn0auprBFZ1zgep4MTf3o2WhM12o9
         fMV50czVCnIP/rYslLGhGu9ODQ8ibZUn8qR0ljCoUETf3qlw6iw1yAmo/D5ScBvL7K0k
         1GLFOnjZuNi7dJ2bYRpNPE46pX/4pcCYsFOYdJ5ADJiFp+MmaeJqx1W+0WJR1nA6eV+9
         KefLpW52sjqO4KltndbKQwn43lr07W7CUAggJn3h71djqB+r2eTsCuSwNe9sk/qeLP0/
         I43lCeYxuik6g4z3NpTZ0iTdiaAiPYH/vmse/cU5zlENz5MN6we44UfDa7PeAJyQzMzj
         uJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742225972; x=1742830772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f59mUDKtUwWZFZzzBPBQbayCac9CHdgE5wq9o7E2FQs=;
        b=R6N7OJ8iXHDbPrnX4UZO2wbVkeSq6DF40aSdkW09XNMrmK13T4MQ9dXJocrnA2cUtl
         /S3QAMWF+QH7HAC4V/oa2M/EcmYX6yjav5gQC4i8735/sEOLtO8Jyb+cYYcM6odaG9qJ
         OL65jcUOTPXNoX613xu843KNdcqdjiX8GD91HCUU7abxhyHIBbx/Fkq+OBy3EUjdrVWg
         YBU/VR9/FQLonxIbZS4NPT/tXMfq96OGToQY32XRd9jcd4ydJbWiUK9XCa/8wz+pY/OI
         +FTutlqSigSvShX4bpUHPJjw76vpeulxdrWgPy8xMTqrTtPATSObvTrg3vj2xRgE+xM4
         AtRw==
X-Gm-Message-State: AOJu0YwrezkdlB3n8R+QnP3QW6EzaWUkenhW90W4d0eS3xGQ3VCFZN6k
	DTEx8v90RLy3Sl4c4AdeCnirjDb5qAoxrbHcal+/kRpo2RAnUJZb6FgZAWH/WayS/GhpXNDOe58
	3oOMLU//Xub4IwRR7xU5iZet0JKA=
X-Gm-Gg: ASbGncsFbaqq5CXN+K/cNAyzUoY5toUkDLx4pMbyxiVIX/Gadz71ik8gX+KQus+5m5Q
	BII4W6VcRuDlbjQ1Ox2MiULZgOVUf4Zj0u/RRilPC0mrN3lcZs4ogHLUp1v/5xWt+MDMkAilUpc
	J9htwUj9/NpOlQENx5tv7HBQfYvlox3m09VwCiDOA=
X-Google-Smtp-Source: AGHT+IF2I/svuqDTvdEwAFRul4pHg0bg7T9ou67gXz+WMZOgzJQhTccIRoiBwRCezbySeFKX19FY2ijegSDRuD8yGbY=
X-Received: by 2002:a05:6512:31cc:b0:549:7145:5d2f with SMTP id
 2adb3069b0e04-549c3989959mr7558356e87.33.1742225971812; Mon, 17 Mar 2025
 08:39:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250317141414.1442963-1-f_l_k@t-online.de>
In-Reply-To: <20250317141414.1442963-1-f_l_k@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 17 Mar 2025 16:39:20 +0100
X-Gm-Features: AQ5f1JooMvHg6r9GIKP3bjPwcmrUcv-s91pP6VHul8RT9b7csfSsqXxqT7lbhkA
Message-ID: <CA+chaQexn1txmPZe4Qk56G_8HcjDUTk1dcHndRyCujZna1ObUg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libsdl2-compat: add x11 and opengl to REQUIRED_DISTRO_FEATURES
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 15:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116034

Acked-by: Martin Jansa <martin.jansa@gmail.com>

On Mon, Mar 17, 2025 at 3:13=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb b=
/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb
> index 5052c85b3d..de47f174b1 100644
> --- a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb
> +++ b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb
> @@ -16,6 +16,8 @@ S =3D "${WORKDIR}/sdl2-compat-${PV}"
>
>  DEPENDS +=3D "libsdl3"
>
> -inherit cmake pkgconfig upstream-version-is-even
> +inherit cmake pkgconfig upstream-version-is-even features_check
> +
> +REQUIRED_DISTRO_FEATURES =3D "opengl x11"
>
>  FILES:${PN} +=3D "${datadir}/licenses"
> --
> 2.48.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116028): https://lists.openembedded.org/g/openembedde=
d-devel/message/116028
> Mute This Topic: https://lists.openembedded.org/mt/111750078/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

