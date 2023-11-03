Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573F5C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 16:29:57 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.58389.1699028987667860809
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 09:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I0AjV9tC;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1efa01323b4so1263873fac.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 09:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699028987; x=1699633787; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvwZC0FyOuUfjiNEqd99neVF9ZGRmg0DuClRvQhB8h8=;
        b=I0AjV9tC0at9+shB7LdH/WVCTKTeFatZXFZYgkHNPWF330Xs6n2/k2RP9Y79HdsFeZ
         f5q9NbPVmoZAsf84AvWNxYkveNfW3uShkg10F28w2+tu3e5ghpPxSfmFvK2yleLVn1sc
         vDt4qj4IgMPxbhwIzjPx4fudIsxQVzjgLVkPWMLkcjfFgOe7DJaz4TVciCjZCAlNGGj4
         mdCR+Rp2DiKRTgHMBbl63yuqs4gRWKLCcFZZab1xvGfg9JWcg34lKN8XEoKCPgd4x/Fp
         J08kr91Fs7iQYYBZMvT9iMwx9vGJlPuIXXE8w8Uxb3/oIsKkyNUAP7ItJCbGEKqNU8oM
         c4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699028987; x=1699633787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvwZC0FyOuUfjiNEqd99neVF9ZGRmg0DuClRvQhB8h8=;
        b=jcEDGtrvzQ6Crh60W4v71kidOrBv9mtodoBUhc7hbtjzaLsH4nwsDor92ri32DtZ7S
         vXrQv2UssmcRa51m/AkykGeltRp7IRoIxGkMsDGlkQBsp2ZimGPOYkFmqi7/wqw74ovu
         1bHbIp6RiZd2jPUCdIBEdElOURDMrN2Se9rBtMn8MRsUBwIVM71uSM1Yg2ItS7TMawm/
         QmYabXymbI4Q1ySSAxb0BbAHEQuBFYVKQEPMduMjARV9eZpl5ERt1/h588uqi/4KQP9N
         5w3qg59dm2bMlJfwyfa/9607wFOrDhfuqmXv7oaEnZi/vbV1GqfKgMY7JOE6mUSPEJYC
         qMaQ==
X-Gm-Message-State: AOJu0YwlLaPdyV0MJITigYT3irpnvYsw5uq7bdNWN4LAWG4UqdG0ZOnL
	rTaO5c48qp1sghCoPWQ3aGIlkr/hXm6qiB2EvEE=
X-Google-Smtp-Source: AGHT+IGz5Onat9VFWJzwXebddTrnRV1f6CZCgY06syb+25NwNzNWJt7RfV+y3NOOe64B3QoZdb3rGZvusy89mX5Q2zw=
X-Received: by 2002:a05:6870:8e16:b0:1eb:e8b:73cb with SMTP id
 lw22-20020a0568708e1600b001eb0e8b73cbmr26653631oab.58.1699028986886; Fri, 03
 Nov 2023 09:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231103052919.3649613-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20231103052919.3649613-1-jamin_lin@aspeedtech.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Nov 2023 09:29:21 -0700
Message-ID: <CAMKF1so05LhZv11-jM398QvnJk0VkSA0oKe6Y7Qdvq5vravQwg@mail.gmail.com>
Subject: Re: [oe] [PATCH v1 1/1] Brotli: fix build failed if the path includes "-static"
To: jamin_lin@aspeedtech.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 16:29:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105870

On Fri, Nov 3, 2023 at 4:37=E2=80=AFAM Jamin Lin via lists.openembedded.org
<jamin_lin=3Daspeedtech.com@lists.openembedded.org> wrote:
>
> It would like to remove "-static" in the name of statice library
> at the do_install task. For example: replace libbrotlicommon-static.a
> with ibbrotlicommon-static.a However, if the patch of
> this statice library includes "-static", it would build failed.
> (ex: set my build directory "build-static")
> Change to remove "-static" in the base name of static library
> to fix this build failed.
>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  meta-oe/recipes-extended/brotli/brotli_1.0.9.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb b/meta-oe/re=
cipes-extended/brotli/brotli_1.0.9.bb
> index 4e2813dde..6492b1943 100644
> --- a/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
> +++ b/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
> @@ -16,7 +16,8 @@ inherit cmake lib_package
>
>  do_install:append () {
>         for lib in $(ls ${D}${libdir}/*-static.a); do
> -               mv -v "${lib}" "$(echo ${lib} | sed s/-static//)"
> +               basename=3D$(basename ${lib})
> +               mv -v "${lib}" "${D}${libdir}$(echo ${basename} | sed s/-=
static//)"

This results in path without a sepator.

ERROR: brotli-1.0.9-r0 do_package: QA Issue: brotli: Files/directories
were installed but not shipped in any package:
  /usr/liblibbrotlienc.a
  /usr/liblibbrotlicommon.a
  /usr/liblibbrotlidec.a

>         done
>  }
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105854): https://lists.openembedded.org/g/openembedde=
d-devel/message/105854
> Mute This Topic: https://lists.openembedded.org/mt/102360862/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

