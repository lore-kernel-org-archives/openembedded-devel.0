Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C91C54E5D
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 16:09:30 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.78.1710605362698768750
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Mar 2024 09:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EUdYYOVD;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2222b96e4d2so1843703fac.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 09:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710605362; x=1711210162; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTRjmKcbpd696JGzfAMXCH5PEWwzrP4YU3q7YufiUOI=;
        b=EUdYYOVDCJzQ8pKwvPkEVOdHa41lKd0st7d9xP5PENSWurd2jorXolcfgZADG+yWpW
         Sfmqoa79V3LOBa+Lqq2gXCEudgvmKYa411kUQD/5nDAE2Q8N/dk2funDzCTPI2TOCLkK
         kLyMy/C7xGeiosf8DxyfgA9E8/k17hC+I+mAnLC0S47pb8kjPWHIKjIemmtchK0FkHEk
         M9CwsNmJcPtt7rwttC1pU3ILUu4gkYMvpOJL3sQtWVV7wTI/NJqDKP8peyT0rMZw1Liy
         bSGqReulMlc8R871TU3uVaWwoXU/q/Cy4RjJnPq1qGyXQvwan3NiTg+rD8j+fK9UgaND
         LWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710605362; x=1711210162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTRjmKcbpd696JGzfAMXCH5PEWwzrP4YU3q7YufiUOI=;
        b=Ks81dt99e7WM09heXEChbf30IKNkvY8K8WZMTwVSO+/hC/ZLbYQCT9NPb7q2T01pwk
         xOLgSEOE50CVxPkekTpDUquEWZMhldwsKW3UwUmUFLPOJLKCjbKakjnHw2/vE6yZiMpL
         tnucoelYlIVWTbqWuOLZZUBqVmVcDXUZ2/Y296z7Y4ndBI1FkiKvdKretBsudXJWET54
         g/7T8gA0P9Bi8lzUpJNpmiFt7Nj6ySTtm/TCo0D4qT9x+8b9CNbONSXUpqVs4KiLr52o
         aTYMu2EBPJGHvm6OImthThbBkLnI3SHNpoYdTcAm0SX3ThAJfkyinrAejJqUD20D6Fi3
         gN5Q==
X-Gm-Message-State: AOJu0YxvO6/t8Ea28gg2BRW8huv9mIxDtJxDBG0hi2T0/mgRutnXw6xK
	m3LUfab3ow7WasouBjrhHIeJEht0WTY30wN0HMmW+VBJh6soWJ0xdv2slGJriU8ByVstx1uoZj0
	ULp//WJbPdR8LaiWpO4+A3QNsp48=
X-Google-Smtp-Source: AGHT+IHp+Z8exzvAJ4O1FVM7fq3l7tz6fdkdf9xqg+Jx3btTwhws3KYiaLcJSlFThiNHmRcxKywGhPbMKWY6WJE9A40=
X-Received: by 2002:a05:6871:7b04:b0:220:dc43:f9d5 with SMTP id
 pf4-20020a0568717b0400b00220dc43f9d5mr9513491oac.47.1710605361879; Sat, 16
 Mar 2024 09:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240316100056.409758-1-chris.chapuis@gmail.com> <20240316100056.409758-6-chris.chapuis@gmail.com>
In-Reply-To: <20240316100056.409758-6-chris.chapuis@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 16 Mar 2024 09:08:54 -0700
Message-ID: <CAMKF1sr8SzZsb9ZVuvEEDCDSqitWrQjDN+-iHjRcOO9i-_njuA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v4 6/7] lvgl: fix libdrm include
To: Christophe Chapuis <chris.chapuis@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Marek Vasut <marex@denx.de>, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 16:09:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109363

does this fix

https://errors.yoctoproject.org/Errors/Details/758522/

On Sat, Mar 16, 2024 at 3:01=E2=80=AFAM Christophe Chapuis
<chris.chapuis@gmail.com> wrote:
>
> When DRM is activated for LVGL, it adds a dependency on drm.h.
> As for lvgl-demo-fb, add an include path to fix this usecase.
>
> Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
> ---
>  meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb b/meta-oe/recipe=
s-graphics/lvgl/lvgl_9.0.0.bb
> index 8bd718efd..6a9a7411b 100644
> --- a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
> +++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
> @@ -21,6 +21,8 @@ inherit cmake
>  EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR=3D${baselib} -DBUILD_SHARED_LIBS=3D=
ON"
>  S =3D "${WORKDIR}/git"
>
> +TARGET_CFLAGS +=3D "-I${STAGING_INCDIR}/libdrm"
> +
>  ALLOW_EMPTY:${PN} =3D "1"
>
>  PACKAGECONFIG ??=3D "drm"
> --
> 2.44.0
>

