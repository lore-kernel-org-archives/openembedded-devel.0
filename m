Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D20FFEE14D4
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 03:47:44 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.6041.1694058455530537863
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Sep 2023 20:47:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RYcKEhiw;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1cca0a1b3c7so368734fac.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 20:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694058455; x=1694663255; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wu7NA9ARj8ixtoawj8LAiK1x4ac52/XLtJ9/U+d7p8k=;
        b=RYcKEhiwh0qm0860qwqTTaItuEaOOLVct6XtawhtR4ZOueL173B7EM3pPZQnO04fPF
         8yd6fOapvrp4tqxMgzkF1BpsUFWTiNn/eE/pauTro7xZtB1+A/KlHOc2xNP6QLBeS9FY
         XhvNRt7pyriK0GdBjVQ9WtYIx/zO7y3ED+y+lHuUiGk1i7zkTqkkJd5rbfFBxEUnEvsD
         BJbY2Het0Iji2QxNpw94bHYsdxMWE6+uC4SygVf2K39X/S5HYgRbo/24pIvX/sXsjxRt
         y0YV0t7r9jdbHwVyfNopQQYMu5MNNGUBxm3hMqo2cNruTR3AUnPLnKlUYSmBfCzgm3NP
         auSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694058455; x=1694663255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wu7NA9ARj8ixtoawj8LAiK1x4ac52/XLtJ9/U+d7p8k=;
        b=hVCnYyV0weU0OH2wBRJQD3LlC+EV4WqNBFTpPPZJMO/Pajb/6QvZwg1QqAIT9PVuhd
         hY4eVqFXU2n5HmUA8b/oLdedAMRAiGIM4tge9kUG1vj1dL4IaojvhTZS48P4Npl6rwqS
         xechzKftBj8YJmTs25DvtzkW/4zQH5Sii6YCi2lgUQFdgylJINcjNR1Cet1LSxhx94xS
         k/4vGnwWPmr2XeVJgbM6cch6eONRZi0FOfziFzjzdfWrS3tOaTVMmAz9yDk/qV07i0xb
         BHQwqrOu1uAhC94ZrN2/gsS+PNOW6qKQPjg9j8Lo5+4oHpKBzTPmUjz3SSt3qLYCj+Yh
         H34A==
X-Gm-Message-State: AOJu0YwpPbP9LzpFyYazBOjFXMV/fACINlBzqkDeAM1VQh1F03nmCp8V
	PC1L1BlN9mG71JO61MFrNTwcAslmW5PodbjjmTtWEfWF1Yx0oQ==
X-Google-Smtp-Source: AGHT+IGs4b88gvZcCiqNInkEO8pYWLXbmE0e3HE+LwEnj87KeEa6Zjfs+8pHRboEuoNmFb9If0d7n9gUCIgMk1sEqm8=
X-Received: by 2002:a05:6870:78e:b0:1b0:649f:e68a with SMTP id
 en14-20020a056870078e00b001b0649fe68amr22141204oab.25.1694058454612; Wed, 06
 Sep 2023 20:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <1693965188-13918-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1693965188-13918-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Sep 2023 20:47:07 -0700
Message-ID: <CAMKF1spNnQ+GT-ju4OQ1b0yGsOROkHh9GE7tU=L_Akgw_U==7w@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] freerdp: upgrade 2.10.0 -> 2.11.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Sep 2023 03:47:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104787

This fails to compile with clang

https://errors.yoctoproject.org/Errors/Details/735497/

On Tue, Sep 5, 2023 at 6:53=E2=80=AFPM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Noteworthy changes:
> * Various input validation fixes
> * Added various CMake options #9317
> * LibreSSL build fixes #8709
>
> Fixed issues:
> * Backported #9233: Big endian support
> * Backported #9099: Mouse grabbing support
> * Backported #6851: wayland scrolling fix
> * Backported #8690: Update h264 to use new FFMPEG API
> * Backported #7306: early bail from update_read_window_state_order breaks=
 protocol
> * Backported #8903: rdpecam/server: Remove wrong assertion
> * Backported #8994: bounds checks for gdi/gfx rectangles
> * Backported #9023: enforce rdpdr client side state checks
> * Backported #6331: deactivate mouse grabbing by default
> * Cherry-pick out of #9172: channels/cliprdr: Fix writing incorrect PDU t=
ype for unlock PDUs
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../freerdp/{freerdp_2.10.0.bb =3D> freerdp_2.11.0.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/freerdp/{freerdp_2.10.0.bb =3D> freerdp_2=
.11.0.bb} (98%)
>
> diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb b/meta-oe/=
recipes-support/freerdp/freerdp_2.11.0.bb
> similarity index 98%
> rename from meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb
> rename to meta-oe/recipes-support/freerdp/freerdp_2.11.0.bb
> index 4cb452608e..de87dc3a02 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.0.bb
> @@ -13,7 +13,7 @@ inherit pkgconfig cmake gitpkgv
>  PE =3D "1"
>  PKGV =3D "${GITPKGVTAG}"
>
> -SRCREV =3D "7471ae383e7b7a613f275e19f7b54958a193c891"
> +SRCREV =3D "1384b3c33b9bd7599633cc54bf20cf20ec6be83c"
>  SRC_URI =3D "git://github.com/FreeRDP/FreeRDP.git;branch=3Dstable-2.0;pr=
otocol=3Dhttps \
>             file://winpr-makecert-Build-with-install-RPATH.patch \
>             "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104734): https://lists.openembedded.org/g/openembedde=
d-devel/message/104734
> Mute This Topic: https://lists.openembedded.org/mt/101185011/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

