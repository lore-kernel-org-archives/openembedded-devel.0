Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D006EC77B6C
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 23:48:50 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.1168.1680911323445338401
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Apr 2023 16:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XCk+kiRU;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id r14so26335800oiw.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 16:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680911323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kstv2GQq5Qgwgr/vgwVZ6Jv0Q2QYyGsj2oHJK1cwT+I=;
        b=XCk+kiRUPdMsX2MeRPCkBgGthsfQUPjwi40PylwztDkfKc9MnSUJ6VrBPA+qHXZbhz
         FE0Ygm0RV+ibHjInrqRkL61GSeAxBoTl49Szsj7HGy97Rc3TCneAt61Zyis5Crl3grYe
         1YQdPAaiV+JGR/BQ8jW15Z9vP6k2szOumOeqhmmxkjj7WEwvNytM/Nh04XqqWPO0HLYG
         rQJRDNQOxPIHSPwHHInGVf7q8zGaAhwsfd1wo9oSn16FOZ91Ohjp9+O2fofBYFIWrLfg
         baKOfdjRLjfyhL+bUTVFVy59/zBHp40oUm6f7MEay90WPc8an2kfvn0MAT/NBNQDdFf9
         aO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680911323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kstv2GQq5Qgwgr/vgwVZ6Jv0Q2QYyGsj2oHJK1cwT+I=;
        b=efJy75zFEnZQufaFnAGZXLkqLRlAO0FpbZa2/RtRsp2DMlkNQPcD640CERiLtgOmf0
         QS9rus5uRwi3CLwRdxd4M/XCyx6WXq6LulkWQKH6OZWtopKuF7OgfP2B40VLWAEi6cdX
         R8dHpAYz3CY6kMPca0aKfZC5iIY5IQSM2ozGfTRyXDux6FGq0YRfxyWFoGVRz6ywZBUE
         LPvL3ZSjgvM7I3yBqihonhK3IBP8pTkQMkuMYofVP2v3xEMI3LeXTK8/7P7rvrbHBGZk
         mIuoRdeZ6xghLH3JuksaMlsG2TxolKaJFJywuRjvGr6lCrqNkpxeZXNIByBZ9Ann+D4Q
         78Tw==
X-Gm-Message-State: AAQBX9do+65Gt07n742Vv++quo9FfThcse777FA7gwgkd/lLCtFBc4vb
	CxRYS9bbovbeginVGn1Go11HPH9RqymzDqfRnrA=
X-Google-Smtp-Source: AKy350ZkdpI+QO2zQZQ7IBTdSQkNula+7G1hndnxkgHUJOWEi2Mn4qUK4u7bJe6AqEciM0uCKj7DacRVkZKJ/LF6Z4A=
X-Received: by 2002:a05:6808:8c4:b0:387:82c4:6425 with SMTP id
 k4-20020a05680808c400b0038782c46425mr132290oij.4.1680911322648; Fri, 07 Apr
 2023 16:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230407220737.889502-1-Martin.Jansa@gmail.com>
In-Reply-To: <20230407220737.889502-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Apr 2023 16:48:16 -0700
Message-ID: <CAMKF1sofLgFddNZay7MmbPvQELsB8KeQTAXMgR4V0EgcAnZxdA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] pahole: respect libdir
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 23:48:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101992

On Fri, Apr 7, 2023 at 3:07=E2=80=AFPM Martin Jansa <Martin.Jansa@gmail.com=
> wrote:
>
> * use the same expression as cmake.bbclass is using:
>   CMAKE_INSTALL_LIBDIR:PATH=3D${@os.path.relpath(d.getVar('libdir'), d.ge=
tVar('prefix') + '/')}
>   but ${baselib} should work here as well
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-devtools/pahole/pahole_1.24.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.24.bb b/meta-oe/rec=
ipes-devtools/pahole/pahole_1.24.bb
> index b7f1f8bb28..2bb73c3eb7 100644
> --- a/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
> +++ b/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
> @@ -20,7 +20,7 @@ inherit cmake pkgconfig
>
>  PACKAGECONFIG[python3] =3D ",,python3-core,python3-core"
>
> -EXTRA_OECMAKE =3D "-D__LIB=3Dlib -DCMAKE_BUILD_TYPE=3DRelease -DLIBBPF_E=
MBEDDED=3DOFF"
> +EXTRA_OECMAKE =3D "-D__LIB=3D${@os.path.relpath(d.getVar('libdir'), d.ge=
tVar('prefix') + '/')} -DCMAKE_BUILD_TYPE=3DRelease -DLIBBPF_EMBEDDED=3DOFF=
"

Can we use ${baselib} instead ?

>
>  FILES:${PN} =3D  "${bindir}/pahole \
>                 ${libdir}/libdwarves.so* \
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101990): https://lists.openembedded.org/g/openembedde=
d-devel/message/101990
> Mute This Topic: https://lists.openembedded.org/mt/98134284/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

