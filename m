Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF21C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:29:44 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web08.12651.1641929383995068917
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MQJLL2Js;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id a8so409462qvx.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=imPVkVyCcXUWcIWDGClwWhNTPMeZPFC/XlVfSIrDzb0=;
        b=MQJLL2Js8KH+1/JFmmyFoe0tC6w6MmBErI3qyU/Xc/Z5PoBEtezMJexmbj8sDqnxZG
         /BC2oz0nsqsMjasYbzIVxDdeE/vA4tgI0xIgwC7bGSODSIzguMnMM8BN52GIPinX3TUl
         5r6MfoHWrv0yGPNO+uc5yqqyU9nCxxMtyKeEBHYbz3ZTsqAAgtFTsU2HaOe8nQeuNSzy
         YXxM8+813OXp8/Afm8oCTA+cdJ47W+DTmuqtDy0BAX+BZaWJVJnWLH16hrVwnbkj9JY1
         cYxcr8J4hriG/Hg4Kjegst1/8K3mZuQiWOBwbKBnmLCDz/CQnsPPxwJblpP+BFdHk736
         DuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=imPVkVyCcXUWcIWDGClwWhNTPMeZPFC/XlVfSIrDzb0=;
        b=I7rprHdDas8ei6mxggmgDiDLqtMEsmKlHiNgl/3KpJMqjkzJ/TZfl3B23GbNYfxOS0
         KtHFrimhQWpdlIGqvXBlyWabbhNE/hmQF4/3gRwI8lU2qmweuGCgghEAn8GGYd+pCBUm
         GdGWnGc11IxLt4gQqgf5A+lXNFcLWU4sgZfjxzqfaqkjQhBoxz7Ian19BbiEgPYzQrPD
         g+aDQlwNoYqujg1N+94HYxrgwvcMrlOlM4+ykMSusUBmDDjjIyayHj090lBgjFoM+euO
         83chw0cfwcsWtPaiah1IBnJVGuvzxzKRoMe5cVwLVUFuj9RK9vktvJJKLbPakvMERU44
         4p8A==
X-Gm-Message-State: AOAM532Vop9cEvwRVLlSqNiCtlHcwMycuWjiLM8mfVdo5kALsAcWEydO
	wGQ+/VvC2BgoyF1itw7kp3CTOqkRTBHxIKDIb0A=
X-Google-Smtp-Source: 
 ABdhPJyIR6+JEY+RrA354VhJ597ZdC5X44LwG0zD0Is+NH89DwXEQBDrvvrGsg6HND6EA9hLh2YVDKLoh42BHY+WNwU=
X-Received: by 2002:a05:6214:1cca:: with SMTP id
 g10mr5297008qvd.36.1641929382984;
 Tue, 11 Jan 2022 11:29:42 -0800 (PST)
MIME-Version: 1.0
References: <20220111121548.108735-1-schnitzeltony@gmail.com>
 <20220111121548.108735-13-schnitzeltony@gmail.com>
In-Reply-To: <20220111121548.108735-13-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jan 2022 11:29:17 -0800
Message-ID: 
 <CAMKF1spZ5MALAcn_y-syuA+h9X7F_D+9HP8e-xKA1btb9iEEdA@mail.gmail.com>
Subject: Re: [oe] [PATCH 13/14] thunar: upgrade 4.16.8 -> 4.16.9
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jan 2022 19:29:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94754

I am seeing this with master-next of oe-core

https://errors.yoctoproject.org/Errors/Details/622306/

On Tue, Jan 11, 2022 at 4:16 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../recipes-xfce/thunar/{thunar_4.16.8.bb =3D> thunar_4.16.9.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-xfce/recipes-xfce/thunar/{thunar_4.16.8.bb =3D> thunar_4.16.=
9.bb} (89%)
>
> diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.16.8.bb b/meta-xfce/r=
ecipes-xfce/thunar/thunar_4.16.9.bb
> similarity index 89%
> rename from meta-xfce/recipes-xfce/thunar/thunar_4.16.8.bb
> rename to meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb
> index 41963b996..169480ae8 100644
> --- a/meta-xfce/recipes-xfce/thunar/thunar_4.16.8.bb
> +++ b/meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb
> @@ -8,7 +8,7 @@ inherit xfce gobject-introspection features_check mime-xd=
g
>
>  REQUIRED_DISTRO_FEATURES =3D "x11"
>
> -SRC_URI[sha256sum] =3D "038ca228d220cd0ba1b7b76465d8a51f2433ad1f74648d1d=
291daa0a24cb3195"
> +SRC_URI[sha256sum] =3D "520bf318eef8bc792db38ae4af343b648f87d4b8d66f5b5d=
6f092e15264ee5af"
>
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[pcre] =3D "--enable-pcre,--disable-pcre,libpcre"
> --
> 2.31.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94742): https://lists.openembedded.org/g/openembedded=
-devel/message/94742
> Mute This Topic: https://lists.openembedded.org/mt/88347029/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

