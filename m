Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F500C2BD09
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 03:13:22 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.2093.1720062793134397483
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 20:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nMSr1wEq;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-25caf76158cso155300fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 20:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720062792; x=1720667592; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NoAKo2eBXtn4vJNTNv+32CGSKYDiVFeHMlumNvI8qo=;
        b=nMSr1wEqdzV7prqEghdJ3Pt8hWzVw93csABa4hM0UFersA87FKHD0UwEpL1tDF54AV
         +/nu23sxMjPpfW3rEi2eMzEoxYJ+iYNjd7T/uvINg7LZLtEa6H16kIL/z1XmltZkRh09
         7iGs4jRCezVejqjf+gsvpQX/cBIGDkMDnq0wveKUDKjRiABm7WVjDZQsx1ioOdpk2mF4
         6PSoELe/+mZtABeagQdhHSe8RtMwTEmz5cnYK0wHKdY0ecOKSx/IAiUd3VdPJcRjgXsh
         D8eiHBj+THEDZpTD58VlYFkkl+SNsxsLOHPxTgDzmEnT7vTQdT8BRZKzF/DpVALSXMWM
         SBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720062792; x=1720667592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NoAKo2eBXtn4vJNTNv+32CGSKYDiVFeHMlumNvI8qo=;
        b=vdBZS/mARrTRU6lnyF4SumTeI5m+wc4xAoVUGN4MQgIAIpmqNvqmY0/CwdoEZ6492O
         I8GOeSRzw0Lv+kuiPFgPKcUroEuuN/laUJCWYldxVFpBKCgl8BwWyuhcZJqj5upPLad5
         8NkXE/LaBuyEJT5csKKsHsUw7AkXIyJlRb18CCljj+6VgHc9k/bonWUEG/A9AJqNEv72
         LNxHQpqM3wDrEx849EjmAA2ufLUHGH8POqeDL3/c26lpLVNCKKp3TwtLqQ6He832wNuQ
         Tr6UWS3lqHJyD2xPEa3sapmW3E5GOutdsS76WG+DyKB3z41wNLBxG94iUbjvcL+hPRN/
         Ov0g==
X-Gm-Message-State: AOJu0Yxdp2XAKbipSpA3Nyyt/9mv23ucobgNMQk0VNoI8WAOGsdMkLbF
	SAEfChxaIn59utJL5W/27HDUBXeDQp6HSI+tztZrcTqRw1WaMnZKqtemtxkxUQxCRsXm4MaYRiJ
	4GMF98sLgrrbC+5IWFDseK31Y+ELEzA==
X-Google-Smtp-Source: AGHT+IGRcuLsxA4RiWfz8tjv+4wg1J8GC+YGS8yWHx3/EfY+7Zxb13rKskQxsUQ+siPrxGeXzb9fsWbwEDa83yFfBRo=
X-Received: by 2002:a05:6870:1c8:b0:259:8420:8e3b with SMTP id
 586e51a60fabf-25e2ba212femr319861fac.21.1720062792148; Wed, 03 Jul 2024
 20:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240703181139.92635-1-ninette@thehoodiefirm.com> <20240703181139.92635-2-ninette@thehoodiefirm.com>
In-Reply-To: <20240703181139.92635-2-ninette@thehoodiefirm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Jul 2024 20:12:45 -0700
Message-ID: <CAMKF1sqg2o8ZRVQyUa6k7sbAN+Cbp5yniEgadPg4WaOnMhKqEQ@mail.gmail.com>
Subject: Re: [oe] [master][PATCH 1/1] yelp: CVE status update for CVE-2008-3533
To: ninette@thehoodiefirm.com
Cc: openembedded-devel@lists.openembedded.org, engineering@neighbourhood.ie
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jul 2024 03:13:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111248

On Wed, Jul 3, 2024 at 11:11=E2=80=AFAM Ninette Adhikari via
lists.openembedded.org
<ninette=3Dthehoodiefirm.com@lists.openembedded.org> wrote:
>
> The current version (42.2) is not affected. Fixed in 2.24
>
> Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
> ---
>  meta-gnome/recipes-gnome/yelp/yelp_42.2.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb b/meta-gnome/reci=
pes-gnome/yelp/yelp_42.2.bb
> index 1b3ded021..69c421662 100644
> --- a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
> +++ b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
> @@ -39,3 +39,5 @@ FILES:${PN} +=3D " \
>  "
>
>  RDEPENDS:${PN} +=3D "yelp-xsl"
> +
> +CVE_STATUS[CVE-2008-3533] =3D "cpe-incorrect: The current version (42.2)=
 is not affected. Fixed in 2.24.

unterminated string here. How did you test this patch ?
Please indicate that, this helps maintainers in deciding to pick a
patch or not, Since a failed build costs time


> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111242): https://lists.openembedded.org/g/openembedde=
d-devel/message/111242
> Mute This Topic: https://lists.openembedded.org/mt/107024507/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

