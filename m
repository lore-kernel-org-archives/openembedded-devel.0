Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3A7C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 19:17:33 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.56371.1744053443540624377
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 12:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nh0ziapu;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-601ebdf02daso2430217eaf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 12:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744053443; x=1744658243; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uc94StUr84tO2F12YMk02vSOlsfTnNdzZ5BpfP2CNiE=;
        b=Nh0ziapuOl1f3/fSVtq4UMB4i8qBwWchYsZldOlblouVmR3cDrh3C8olp0dnca/Mzp
         qlqQrXsjky9N+MFYE68roc114LionQ/rJijzTHboj+8DjzUzyGzd7KOjFt5G5EE/k9sP
         u8H4ZQX7006DG2PcZlYv3MVTh1Upi04faMDw1a8JSTeX4N5jUNbRJKpQ7ovYTdhsrf6r
         1T//O0Cim9wxKRCQIs5CcZi75tQ1igP9ox6wk7M5uE5EnqvYaPVWyZxB/55WZmB8r8Z2
         7vtQiDnz0mRQzMRGDvHRKbp+NbjysVRA1y4/sKUF6R0uzy4hqROT2IEyx8MTVnbIU8bB
         QZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744053443; x=1744658243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uc94StUr84tO2F12YMk02vSOlsfTnNdzZ5BpfP2CNiE=;
        b=f2Hl6zjWuw+L+FGS8CniB+e9vJPfcjcUFoNbx5/9a6JZvvuEVcqngZf1liwaaDBx/l
         Py9b0l4E2OIyrahCGqwo48baiqz1cP0Y6G1RpjwTV/lIyREbe7gYmsdVvKqdZOsVsXVk
         lTjIhRn84YSF22tREfz/we8vCXyUv+vuSAIfGY3DUbFeZNX1+XO4V6ezY/tjI33Hyaud
         hF/8qQX23RvH3qcuvQL/q64b88c89gclX39iuEtkW9dOT8D09R7pRfIobwa/yt5kWxMu
         rMYSxVlBZWff6LYQ16s1ZapVeVcz1R73Jd31B74rSZZlCtb7B6vMSIg09NegA4UH6+29
         jZhg==
X-Gm-Message-State: AOJu0YxmkWMGLE2KvAw87EtFUHUxlxuU/06pYlcPK+1GRee0owGivMVa
	Y4NGWKmSckpe4YrcN4poHVH+uC/wlW7QcWk0mjoli3owyvmuuAOU+7Jf8/l7BlUOYMR51DQXH8C
	rsZv0WAAneSq4xD0baSKcSdEg2Z0=
X-Gm-Gg: ASbGnctIW+Ff2BJES2f6gFv7gxrUsb35R0IYXktyknaWLsSsY3hitXOTN4RljbDiBH9
	JdXcYfNrRheTMjFUEy0xvmgEi62vF5o/tCzwJ8bM+sfb+h4mjKmsfvIaRNytviDr9i/R9frGN8/
	uRkOHmIwXBZYkNLhkR+igZvSirjMvJ9+Zqnbj5Md9WD6d4E6Z8TVcc7ck=
X-Google-Smtp-Source: AGHT+IGjwg/hSQoxLybKQRmGbQJhYqVSxxhNzH0SuKOhsDqpLQOeb6NtT3S1YXt019pRdnbJ3223MQmN8ShTmIi7KLY=
X-Received: by 2002:a4a:c117:0:b0:603:f521:ff26 with SMTP id
 006d021491bc7-6044ecb1827mr429462eaf.1.1744053442746; Mon, 07 Apr 2025
 12:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250407095355.3461559-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250407095355.3461559-1-dmitry.baryshkov@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Apr 2025 12:16:56 -0700
X-Gm-Features: ATxdqUEmgn9Fzd6-qkrHn9EPjuFGjds7wzj0qhPQEpiZE8QYGfwQQ7GyGoL2Rr0
Message-ID: <CAMKF1srrJK5OnKo1t02JdGBs1rzQ=MLZAW_WA7gpCA7G5Cza3g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/5] opencl-headers: upgrade to 2024.10.24
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 19:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116677

this breaks clpeak recipe -
https://errors.yoctoproject.org/Errors/Details/851680/

On Mon, Apr 7, 2025 at 2:54=E2=80=AFAM Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> Upgrade OpenCL-Headers to the latest release.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  ...pencl-headers_2024.05.08.bb =3D> opencl-headers_2024.10.24.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-core/opencl/{opencl-headers_2024.05.08.bb =3D> op=
encl-headers_2024.10.24.bb} (89%)
>
> diff --git a/meta-oe/recipes-core/opencl/opencl-headers_2024.05.08.bb b/m=
eta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb
> similarity index 89%
> rename from meta-oe/recipes-core/opencl/opencl-headers_2024.05.08.bb
> rename to meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb
> index 8663b818e3cb..b47d3f9711a1 100644
> --- a/meta-oe/recipes-core/opencl/opencl-headers_2024.05.08.bb
> +++ b/meta-oe/recipes-core/opencl/opencl-headers_2024.10.24.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57"
>  SECTION =3D "base"
>
>  S =3D "${WORKDIR}/git"
> -SRCREV =3D "8275634cf9ec31b6484c2e6be756237cb583999d"
> +SRCREV =3D "4ea6df132107e3b4b9407f903204b5522fdffcd6"
>  SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=3Dm=
ain;protocol=3Dhttps"
>
>  inherit cmake
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116657): https://lists.openembedded.org/g/openembedde=
d-devel/message/116657
> Mute This Topic: https://lists.openembedded.org/mt/112129617/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

