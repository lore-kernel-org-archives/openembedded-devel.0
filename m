Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF4E6C3600C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 22:00:47 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.5214.1743458442672820522
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 15:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I0kU1l6k;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6025007e9a0so695546eaf.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 15:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743458442; x=1744063242; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/YYxWp8TLFt6lIu3/znpVIfE/EbkzYG+GCFn7QKC8M=;
        b=I0kU1l6kq1T45MDP1ym3dAOw1N2yNhDfRMWSiGnxhVYJLlvHGIhD2A3l1Ki/DgnzuU
         st8PWZHR05o6Y764hNXzS1NczJUrssRFPk2avJmlE/OJ8dpVpFPiIf262M5RIj45xisN
         Hx+ycgFSqXh6H7b28PqMaPEzFx1pUWwE+avfsTQgZa4ozo3eztgw5Ke6NFZ5QlcX9EHB
         JVhjowjZwanUuZnds02MbJHGfz1zGmoTc5HessdkQRl2POBORlHA7mP67jZgrXPyt6sD
         8GPE599msF30GGAPVDYMzpK2OP/9YeorVgwLjeusqTk1Lr3W+XqVPLVtU95POwC/WY7j
         lQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743458442; x=1744063242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/YYxWp8TLFt6lIu3/znpVIfE/EbkzYG+GCFn7QKC8M=;
        b=IF2fVk+d0h8SQSJGVFX+x/bBzN1mnzSHPQfUf6O8d103OcYfejnknMlZBFLhMGhAtl
         rjnTvxEr+eUsW9N18EYxFGT7Cb12/ZSK0oLvStKxcuS4B9bYI07gYLLcM2qy+rY8V+By
         25Q2X5fUtP/qoMjmUVcQH742/pSdlW2C3yzo/S1luqaTN0f2j0Joje4VQDMsjsnbEgny
         t//W5HYhHck5p/p/t5EOZs4Kpy7WXn2RvBdtJa+27Ltz06NtW8+0bV4bXmzczPV98o5V
         7FXpNpyWQHimim0O/j4xT26rQTGjfcVuh1adKrBot429ZTPFNXrnl/KLGsfUINiDaNiC
         uo8Q==
X-Gm-Message-State: AOJu0YxiQNFX53r6UWJQM2kHxgvgOqV0jv9ghKrAQKQH6FBDsJgytD7A
	NDechmeWnN0dSJ1GXP1wWcDyY27zI5ftRI0EH49osZ6sIE8urq+s7QdxzgqE/IlzbGg5y7ECsCk
	e5W9zBIcSOhiqIkybx6sRu27zHWYAg/8ZTOI=
X-Gm-Gg: ASbGncsAd3G+zupmqVmYve9ze2A6v7CWhol2S8oeD/6giTMflYu3Yk7x3XXH/8EX/12
	99yGca2gKxoWHzmxrVZbef2jmUEMQU5v09qnhckhFDjSfaJplCEGPVLGrfdjtOQkQhTVnKEllR4
	mwquyzospIgHbhFjop+Yf+QdrkxA==
X-Google-Smtp-Source: AGHT+IFBn01xMBlIPU+FB8ujrNgEXr3q6BHAPbMuHc8x41U7p8psZDOSBacpVPODcyI2V2+Tk4o9Zy2gztnu3RuTW8w=
X-Received: by 2002:a05:6808:22a2:b0:3f9:9076:b659 with SMTP id
 5614622812f47-3ff0f59bbbfmr7683599b6e.28.1743458441844; Mon, 31 Mar 2025
 15:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com> <1743412308-21887-5-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1743412308-21887-5-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Mar 2025 15:00:16 -0700
X-Gm-Features: AQ5f1Jo7Pn32tF3rOcIz4rDNatuWeCfGtualOdJGGFCCKKB5-Au-L0j15GCZnTc
Message-ID: <CAMKF1sq2tgmyx5Tis24cmFH0ZgjW-iBN9OetLezmtn=J9-ucYA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 02/26] opencl-clhpp: upgrade 2024.05.08 -> 2024.10.24
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 22:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116460

This regresses clpeak recipe build see

https://errors.yoctoproject.org/Errors/Details/850187/

On Mon, Mar 31, 2025 at 2:12=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{opencl-clhpp_2024.05.08.bb =3D> opencl-clhpp_2024.10.24.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-core/opencl/{opencl-clhpp_2024.05.08.bb =3D> open=
cl-clhpp_2024.10.24.bb} (91%)
>
> diff --git a/meta-oe/recipes-core/opencl/opencl-clhpp_2024.05.08.bb b/met=
a-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
> similarity index 91%
> rename from meta-oe/recipes-core/opencl/opencl-clhpp_2024.05.08.bb
> rename to meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
> index 25e7fd633f..b815c22eec 100644
> --- a/meta-oe/recipes-core/opencl/opencl-clhpp_2024.05.08.bb
> +++ b/meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3b83ef9638=
7f14655fc854ddc3c6bd57"
>
>  DEPENDS =3D "opencl-headers"
>
> -SRCREV =3D "0bdbbfe5ecda42cff50c96cc5e33527f42fcbd45"
> +SRCREV =3D "c7b4aded1cab9560b226041dd962f63375a9a384"
>
>  SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=3Dh=
ttps;branch=3Dmain"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116398): https://lists.openembedded.org/g/openembedde=
d-devel/message/116398
> Mute This Topic: https://lists.openembedded.org/mt/112000731/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

