Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B5DCF259D
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 06:44:02 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.48785.1728888238439975927
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Oct 2024 23:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ilXFpEvN;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb501492ccso3942411fa.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 23:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728888236; x=1729493036; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQo/A95cakjDaHqbNQksL6UmNdJTB0jZiVGMLC/ti64=;
        b=ilXFpEvNQIliOJROGsNokAWGfJyM/oBEGgS0SA7mQhtQAx4D/V/1n/YelDdBxMrMXP
         /C/3E5DEvvE2+zPw4e7T9xyyz6HEVovjGaIKHrvJ9rIOpn2Qorswx0gUa7nHrutK54mi
         Xp+B3pDlrHcDl3+m2C237S1fRxxQAdDRatSC/DX0rpPyXHAwjS7aJ1Qk7ahUIDmx42sK
         wsbJavvZNVdsguANWFp2TE4icjFEDuB/IwjVrMRDwW33HfGN0zBBgiTOihUOViXPnpEN
         Hp6q8AUoVh4pLmkx20E1RQ4FfifFl6QiroCgSItjhVCFJrZ3zItgbQ7gaeZ1oXBJesNX
         L2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728888236; x=1729493036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQo/A95cakjDaHqbNQksL6UmNdJTB0jZiVGMLC/ti64=;
        b=qUK96GhEmCTVtYqOx5L5ikoTD96GVJXXtaVM3Z4i096HeKA4+dGpp4EYpIQbyHI5Fl
         lrs+Bo4aO2Q2l5bO0JU5h7aLTYB3LN3ymzPZtAKBlYTuswfKJZTYZQ3HC052pJ4ihaCc
         po31JJ6/NA18fM/z/1xLRUduRp185FaasbFZWPQE5M9835bU0mpU3gsIPKquiWhkjMe2
         lSFmYNNCYISNsSpzn/FEPKmqnMS67B8Y0a5sMUqfq3unhontxzO6TTsQv2GaKbGChmPw
         EQmoT0PG26+UtGeWTv7AXG0GevlLeHP2oQvZq7IuPxaG958GaiY2htP+IDierMfr3ffP
         nHCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+8m8fEQ8NGiH08lvRsFYlw0ZO/7EzKAbPNhnWbZZn369FMUZ4TOAu9u5JTHQ9NE5bHaSrUAfxPQbYYheGDnv8eP8=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwPcunbHZFml8pu7eBBmNf4wls/MYrs+0Nx4kejWAw4FA4zweST
	xRtOH66DHBIBwlk4V0KxtXnMm0MQCcpT0x9Pd1t6PXXN76+1c2VRU+41I7izT+haFZtiRDfD2Ac
	DYiBu1JdgUTN+eZxvuPZBR4f+oqs=
X-Google-Smtp-Source: AGHT+IHLMouR8p9NLgzCCQjRfVSKj1EmCTk6Uwk1oCkKNbTTiQkf4a/MdTcGnXd7M2iY/ZuJ8AWR0wNTRP7X0USOVM4=
X-Received: by 2002:a2e:bc12:0:b0:2fa:fc3f:d603 with SMTP id
 38308e7fff4ca-2fb3b846197mr31718671fa.43.1728888236018; Sun, 13 Oct 2024
 23:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20241009065729.4114713-1-guocai.he.cn@windriver.com>
In-Reply-To: <20241009065729.4114713-1-guocai.he.cn@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 14 Oct 2024 08:43:42 +0200
Message-ID: <CA+chaQfP+wSdV4=dptAsUxvdC-rVR-qTPDGPquShMaGTETKbCA@mail.gmail.com>
Subject: Re: [oe] [meta][kirkstone][PATCH] xmlrpc-c: fix do_fetch error
To: guocai.he.cn@windriver.com
Cc: kai.kang@windriver.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 06:44:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112848

I can confirm that the github repo was force pushed:

From https://github.com/mirror/xmlrpc-c
 + 46ac9180...f5b52c01 master     -> master  (forced update)

but it should be double checked to see what changed between old and
new SRCREV (you should be able to find old SRCREV still on some OE
MIRROR).

On Wed, Oct 9, 2024 at 8:57=E2=80=AFAM guocai he via lists.openembedded.org
<guocai.he.cn=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Guocai He <guocai.he.cn@windriver.com>
>
> Fetcher failure:
> Unable to find revision 86405c7e1bd4f70287204a28d242a1054daab520
> in branch master
>
> Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
> ---
>  meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb b/meta=
-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> index 36205009a..991c4544b 100644
> --- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> @@ -12,7 +12,7 @@ SRC_URI =3D "git://github.com/mirror/xmlrpc-c.git;branc=
h=3Dmaster;protocol=3Dhttps \
>             "
>
>  #Release 1.54.02
> -SRCREV =3D "86405c7e1bd4f70287204a28d242a1054daab520"
> +SRCREV =3D "36b142d6179514989a44c1087f6c46182dafd21f"
>
>  S =3D "${WORKDIR}/git/stable"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112723): https://lists.openembedded.org/g/openembedde=
d-devel/message/112723
> Mute This Topic: https://lists.openembedded.org/mt/108904710/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

