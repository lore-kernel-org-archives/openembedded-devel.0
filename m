Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA3CC4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 15:48:04 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.40223.1701272880454710570
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 07:48:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cXosdq0b;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6cd0a8bc6dcso4106570a34.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 07:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701272879; x=1701877679; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6hoApkDkkFM53URtTJbQqhbjPPvB51+AJKDKxKDaZQ=;
        b=cXosdq0baWiHrl2EVdDJmTZLImysvos3RJdI0F8F9Wl8AQxgZEvllbB6uMzQing1lH
         ZSSwTVH6KSjVwaXnX7sQ65tIr2uBheRjjNCjMV5nF5B1SqYV9dhc4hQlvyAF2u45UgNb
         QyNiG7g1WRL07ITJeKTRBfj9UGbhYD1Og8BLWpAQAvhiBcb4nm2QKbABmL8nekoh2bz0
         YHYA4dWgCJ/+wkw/j7iTqW7WTcxlseL0Pd6fikxRKYQ0iIFS7l5y9DtmZNhZTEwPUHY2
         sw1k4ueBclMLyyGMQxvbLmuNzkETk0H/RdYYV/wWqPXsnbIq2jRwhqJ1KQBai6Bf47jx
         HmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701272879; x=1701877679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6hoApkDkkFM53URtTJbQqhbjPPvB51+AJKDKxKDaZQ=;
        b=w8P58zyC7cWo6IcyPDOyY13ZnA8CtuLbGRm4a8+AoUlxdBHdHuYe6jVFUUi/j/ub2j
         7vGk1DTxlNgDT4EvzlpDDMZz6lqLls8efPL+8/lnC2epxaV18R/yxgcH5lj6AzkSGGz+
         1EBOKkdUuZnFX5UzAe6H7BgK84q3pvy+9ablfj/+CAKl/dp4+Npo7oK0L8SgdAYe+QhK
         snMqL6WatQwS35AZdjJs3ZQ58g5FrIhsboNcZr9FUDwU+K0gEYueFSBJpWXWeh+Lvznp
         c3MPX+UyW2ujxbkrrW97hyYOtstXaFHCB/esCB08oD4sH5qx9kKNUmH1g6eytIaED+5l
         qSfA==
X-Gm-Message-State: AOJu0YyQl/JLFWKwTNxS+5zUlpwICtnQJ/gF5Tg86HGnjiNWvgnRq2DJ
	lTHmpkVZh7o6AtIJwNR3MZQrqI23cl0rKrqW3Yw=
X-Google-Smtp-Source: AGHT+IH8V6mQdDXIpvJW2ZioZAMopoNzrYOS2kADe6SzHg886t0/lFk1LCdvEzdmHBMuO/zLS6tacBi9zvPVvlQ+iBI=
X-Received: by 2002:a05:6870:9e05:b0:1e9:f1af:e33d with SMTP id
 ps5-20020a0568709e0500b001e9f1afe33dmr20607816oab.36.1701272879485; Wed, 29
 Nov 2023 07:47:59 -0800 (PST)
MIME-Version: 1.0
References: <20231129092525.37981-1-wentao.zhang@windriver.com>
In-Reply-To: <20231129092525.37981-1-wentao.zhang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Nov 2023 07:47:33 -0800
Message-ID: <CAMKF1sqhgsD_-X24bYC=dtKcORhYD4ogpwWz1ArHB=PORvodyg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libbytesize: update github branch to 'main'
To: wentao.zhang@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 15:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107139

which branch is it for ? Please prefix that in subject line

On Wed, Nov 29, 2023 at 1:25=E2=80=AFAM Wentao Zhang via
lists.openembedded.org
<wentao.zhang=3Dwindriver.com@lists.openembedded.org> wrote:
>
> the repo of libbytesize doesn't have a branch named master. Change
> the branch from master to main.
>
> Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
> Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
> ---
>  meta-oe/recipes-support/libbytesize/libbytesize_2.8.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.8.bb b/met=
a-oe/recipes-support/libbytesize/libbytesize_2.8.bb
> index 0afe8a6c0..58ae52cc6 100644
> --- a/meta-oe/recipes-support/libbytesize/libbytesize_2.8.bb
> +++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.8.bb
> @@ -10,7 +10,7 @@ S =3D "${WORKDIR}/git"
>  B =3D "${S}"
>
>  SRCREV =3D "12b8e6bff611eecb0343ee8a765151e7d9d3547b"
> -SRC_URI =3D "git://github.com/rhinstaller/libbytesize;branch=3Dmaster;pr=
otocol=3Dhttps"
> +SRC_URI =3D "git://github.com/rhinstaller/libbytesize;branch=3Dmain;prot=
ocol=3Dhttps"
>
>  inherit gettext autotools pkgconfig python3native
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107133): https://lists.openembedded.org/g/openembedde=
d-devel/message/107133
> Mute This Topic: https://lists.openembedded.org/mt/102868734/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

