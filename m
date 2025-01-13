Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DE2E7719F
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 07:00:04 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.11792.1736751599972982351
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jan 2025 23:00:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YmjH232n;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so3693712e87.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jan 2025 22:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736751598; x=1737356398; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TAxhvROVuk/kmHxibtIhHZ86R+hG3pHU7+ajCISAXI=;
        b=YmjH232nCH6uizffS5ET2eL45xCecvD//i+SNCEvhNhZ77y/6hX0OuyZzpLgXKltK7
         dIVxr+I6wnC4oP8B36Ekpg9FMp5F85qEJRqUSPaJB2RMicSwb0y8n55nSjG0MQ1YLA6z
         jWA8lM1cxm/0UpktZVsSQIZ2FxGBz1beOEwxfOgCEFf01ZXzduS3045ti5mHG/w0nX8w
         QUcuJW3pX9a1XVSm81lYA3txQRM+SFNMW2hY4r4Kd9cKPA43EF063nuy4/Chy5pr3e7y
         IUf2zKZJqVSoelvcv5s0J88POHu+hk6V57CpBpta1BDktLUROXNQ4H3XJxmaoDJ8XCaj
         h29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736751598; x=1737356398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0TAxhvROVuk/kmHxibtIhHZ86R+hG3pHU7+ajCISAXI=;
        b=eimZ6mHlze3bYfHN85Y48YJoD5xRyres4UvNltOEbqSeZZ1DHpOHSMw+rxz/hd/BfY
         3SZ5K74mXvvPMgxXna0xhKWb9Xj/68gJKX7To61NvzZclv9pnajPSaeH+TdZvLu5Qi8y
         cu5SWScaLp1n011m5cGhnnMzAvwT41yo2oWDS1HqzhPDTRf3nLnOZgmI3yIqbbHwtWoO
         uzBRnDSIistza9/s2QUvipJPiOEIHPKbh/S85FJFdgAAr440HCMyglalyZW7LbQmH75K
         7UIClvuz8loRLO60LYVMZEmuAk2fcbFiuSFbUp2helWVU71EF04GZIxMocfgocj18hcK
         UvLQ==
X-Gm-Message-State: AOJu0Yzw2zjA7EWXSiHAqFTLgd4SiPisTqyQDSGKb/xYunlCJrN6JREU
	BQqZgeI10pUrrACTnUyHR12WUlnjSS43Z1/9jv8CQsoMhNgDuhGbZ73G6Bdzs8CHSS3U8qie4Rk
	QeH+TQJoXCHjI2Kw9En3bRT5G+yY=
X-Gm-Gg: ASbGncucj4owCyduy4ZjU/GXYbYC0y4966euWmnDv1h4dU0E4GtwXKxL5dyFeIhbsbk
	s+vxzTeMyDRMKRdfbX6Lpmb2Ug7PAL5EpneHlLG02
X-Google-Smtp-Source: AGHT+IE4T4oQCpRe9QMMH6YPoZmI5AG0O9IT8ElBr+UG37pM6o+Jm2vhtM73DtU+NxyTr+f0P1T4HjpT+u4G4ypM0tU=
X-Received: by 2002:a05:6512:158e:b0:540:1e17:10d2 with SMTP id
 2adb3069b0e04-542845bc7a3mr6654120e87.49.1736751597543; Sun, 12 Jan 2025
 22:59:57 -0800 (PST)
MIME-Version: 1.0
References: <20250113044603.3467963-1-raj.khem@gmail.com> <20250113044603.3467963-3-raj.khem@gmail.com>
In-Reply-To: <20250113044603.3467963-3-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Jan 2025 07:59:45 +0100
X-Gm-Features: AbW1kvaBO2QbiLnyZtDYCi9OlCmJl5fmfHszD0xq6H9oVjAaYIpDGJmAyNj3tvE
Message-ID: <CA+chaQdYBu-RsV1ekg6m-Bs6xX69g6_sRm3vU+VbAYk2Vf3Y2g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 3/5] cpp-netlib: Skip recipe, not buildable
 with boost >= 1.87
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 07:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114827

Hi Khem,

can we use ?=3D for SKIP_RECIPE? I was asked to do that before, because
it makes it easier to un-skip it locally (hopefully when someone is
preparing the fix for you to merge). e.g.
https://git.openembedded.org/meta-openembedded/commit/?id=3D96a92761c0a1bb2=
317fa4ea422c32e4473405103
https://git.openembedded.org/meta-openembedded/commit/?id=3Dd7f5367b53f6fd4=
10e1ebb270f52c2d9f4b3435a

All current SKIP_RECIPE except vlc are using ?=3D.

Thanks

On Mon, Jan 13, 2025 at 5:46=E2=80=AFAM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb b/meta-=
oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
> index bda5177fc4..3cf166bd4a 100644
> --- a/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
> +++ b/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
> @@ -28,3 +28,5 @@ do_install:append() {
>      sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/cppnetlib/cpp=
netlibConfig.cmake
>      sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/cppnetlib/cpp=
netlibTargets-noconfig.cmake
>  }
> +
> +SKIP_RECIPE[cpp-netlib] =3D "Does not work with boost >=3D 1.87"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114823): https://lists.openembedded.org/g/openembedde=
d-devel/message/114823
> Mute This Topic: https://lists.openembedded.org/mt/110582198/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

