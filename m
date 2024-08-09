Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A905C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 04:34:23 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.77287.1723178061879216124
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 21:34:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cc5lOm4n;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5d5aecbe0a9so997576eaf.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 21:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723178061; x=1723782861; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVyrWKIi52Vk8cRMzP6SIbD7avkVgA+eJGsUeM5l37U=;
        b=Cc5lOm4niXD+RdK1YdHcdDCO/SpdwyRV/K2gkrEMAeDERHkIA/yzkdCosn4GlRTt0V
         LydYON9GhfBJ8mdBjVFpZwSdnz55wQIjBRV6vWNVcbWtJRCMCIHz6yQcKgOeE5UXIrcS
         ZTuzDlTrn8jlJwZ+5yf38fnKVdTdXcg2VHD5etsaY9XB+VwBszQenhjq4ztKQeep24MN
         Wc3+9melrWDPrFEHDDIMXdLaVCGJ3mGHz5yILMM7WUzXM/8p9eU4ssHnXlzEVLXanmWr
         nKsiSydzgsVPNfSysOHIfJe+QvEvgpLGOSuSCOHJAYJaoDGi8geHCy0eebeJsIGJo50i
         qIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723178061; x=1723782861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lVyrWKIi52Vk8cRMzP6SIbD7avkVgA+eJGsUeM5l37U=;
        b=Un6Ddho80XarifLvmhi+9hgLi8gVi7Cf5MqIxSxTlD3l6+QgSlVFvyCsyMeZNf3hZ2
         yaAtVQOI6+vdkLCYS2BOwVGo1OSblH6oHqCyr3qXc05IVKc5e14G4W6nhJ2Lj3HQCCVo
         z2YELtKp8k9Kf/TnQxF4jO5xN4bMZ+/+58WB54deEj7Kbse15i87CLm6qfM/dL1RlX5a
         szFcOtdZyghQdHK160vLEMM3Vn8oEFnmpLhEKP8oQzbUV33Y3YeNlrr387E2GIf8E1PU
         +sUNx4+acD0D3FXwEWYnK95osDKxoTKVZg7GZOi+NdeOEZXYWwDFYiL9QbuUaF/g/d3N
         kkMQ==
X-Gm-Message-State: AOJu0YxEawfcDcpOadK8CtVAo708gVnUhwUOxLbPXzp/YNTSSL8GB9iA
	2tJ++4Y4Gu2tNfpvOYqPbrj6F0ouu1fnCok9HRD9BrGVvVp9Ij5w7k1ZgOa3JF024GAcXPYKCjG
	S71lzySphOlcUy8p1W5lwPs6daps=
X-Google-Smtp-Source: AGHT+IGwxY7F38EVQZBQkHAHbGb2d6fvyp2HQl1XsWielUWSFT2misvOCSKv47ucqnIIAJplHVrR576rEzom/4/vyo0=
X-Received: by 2002:a05:6820:162c:b0:5d6:79a:c4d6 with SMTP id
 006d021491bc7-5d867dab5a9mr540432eaf.3.1723178061002; Thu, 08 Aug 2024
 21:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1723134758.git.tim.orling@konsulko.com> <60a5d0f7cb4dd09c3ec77e3d1867728b9a8c763a.1723134758.git.tim.orling@konsulko.com>
In-Reply-To: <60a5d0f7cb4dd09c3ec77e3d1867728b9a8c763a.1723134758.git.tim.orling@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Aug 2024 21:33:54 -0700
Message-ID: <CAMKF1sq9952AiQ62Q-apeTQGKiwg3Hpx4eGpQrdDt--NcGirmA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-pydantic-core: backport patch
To: tim.orling@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 04:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111684

On Thu, Aug 8, 2024 at 9:38=E2=80=AFAM Tim Orling via lists.openembedded.or=
g
<tim.orling=3Dkonsulko.com@lists.openembedded.org> wrote:
>
> From: Tim Orling <tim.orling@konsulko.com>
>
> We've seen TMPDIR [build-paths] contamination in the
> built pydantic_core/_pydantic_core.cpython-*-*-linux-gnu.so
>
> See discussion upstream in:
> https://github.com/pydantic/pydantic-core/issues/1365
>
> Backport fix from:
> https://github.com/pydantic/pydantic-core/commit/e07c41b3bad75948201a2201=
387225694c2fb501
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  .../recipes-devtools/python/python3-pydantic-core_2.21.0.bb      | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.=
21.0.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.21.0.=
bb
> index b4ca66a54d..b24e141f60 100644
> --- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.21.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.21.0.bb
> @@ -11,6 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dab599c188b4a=
314d2856b3a55030c75c"
>  require ${BPN}-crates.inc
>
>  SRC_URI +=3D "file://run-ptest"
> +SRC_URI +=3D "file://0001-dont-embed-RUSTFLAGS-in-final-binary-1396.patc=
h"

Where is the patch file ?

>
>  SRC_URI[sha256sum] =3D "79c747f9916e5b6cb588dfd994d9ac15a93e43eb07467d9e=
6f24d892c176bbf5"
>
> --
> 2.46.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111674): https://lists.openembedded.org/g/openembedde=
d-devel/message/111674
> Mute This Topic: https://lists.openembedded.org/mt/107793251/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

