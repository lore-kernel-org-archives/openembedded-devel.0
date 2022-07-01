Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585F0C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 13:38:48 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web08.38237.1656682719933443565
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 06:38:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qxW3wx1z;
 spf=pass (domain: gmail.com, ip: 209.85.160.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id q16so406585qtn.5
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 06:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ytTl4hHiwQTbVRhWy05zC3+Oj3ZCNTltqy9ZuOwbhUs=;
        b=qxW3wx1zQXM1hrqQiP166OhcJiCVcgahtvX7UqsFBvHR3BTcGm6IRBTVchDI3lhyrf
         dJIAnRxWmo181+70quO1q5Ge6Hp0slrvAqT+Fiej62vOnI4c9SXEqhbUSqKmK5QbSavF
         5jDgr5JYci4SV289Qm9DVnE7vBhLJWRSW5eJVmsEXKBJZmuDcnncfL0HbZmE+7YgG768
         bYu+iYfQbEXWZoTA7vn38U1StdQ9vcSKvD0Ku6ihTkezyixphl31kvp0UqP74r6g4Pfw
         h84kWxDw+oz1oAq3zwKu6enQPepWEX3Qq+PsaFHUpONiG2VrBj3sMg0q0C/VrExL2yQ9
         B/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ytTl4hHiwQTbVRhWy05zC3+Oj3ZCNTltqy9ZuOwbhUs=;
        b=y1gV+hjpumpzAtuO9AF2yadZsTx5sxE7V+7uJWcvSyFrtT5JqS7m0hy3wtMos69nOg
         W9bjReS3uFTdTevs6+7jkaMvr9mnrrNSmV2lo+E0xxUzJ+BA58cxI4Cmoo8n1oY9kH8P
         S9EVZzYKwViqkC1JjmWog6vlVRXlu/cd+A2Tf9KMg2w1h+n/HwM7Tc1lE0ttGKhEvX7/
         VGBkTbqI2ABOEk6cswOm8QiQCE2+82XRHLCf6g9AZkhnhl4NaSx+br0m7f/cGcIv/wwO
         W15C1GRgq2U8iT5Ft0WEIrmlQ7Fx9j53dhPObjd7MWN65qE1oKvpVP65b+CM8WxE5EIX
         mcCw==
X-Gm-Message-State: AJIora9d6THthy5Q6cpOKb08WPkLalt4oLgCnDrcxheE3eQ5lgv9XSC1
	WdVnHCXL3uGGUzl7BzVISg+bAwQcgYKn7lIUyjY=
X-Google-Smtp-Source: 
 AGRyM1s50VSTt8z6hPHKwjbmDTdgZMkeiVRJpkhPcFid8+N2jqacm8wBAsIhMyg1S4MuDWCiLKlyC13Vxq+4tUR2/pg=
X-Received: by 2002:ac8:5756:0:b0:306:721b:b19f with SMTP id
 22-20020ac85756000000b00306721bb19fmr12407847qtx.54.1656682718866; Fri, 01
 Jul 2022 06:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220622141246.573795-1-zboszor@pr.hu>
In-Reply-To: <20220622141246.573795-1-zboszor@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Jul 2022 09:38:12 -0400
Message-ID: 
 <CAMKF1srS_87dmd+0LqG4qvzs5WRrtn9WymgWT_9bqARxeAZE6A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3 1/4] geos: Upgrade to 3.9.3
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 13:38:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97669

this fails to build on arm/clang

https://errors.yoctoproject.org/Errors/Details/659199/

On Wed, Jun 22, 2022 at 10:13 AM Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote:
>
> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
>
> Remove an upstreamed patch.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta-oe/recipes-navigation/geos/geos_3.4.3.bb | 7 -------
>  meta-oe/recipes-navigation/geos/geos_3.9.3.bb | 3 +++
>  2 files changed, 3 insertions(+), 7 deletions(-)
>  delete mode 100644 meta-oe/recipes-navigation/geos/geos_3.4.3.bb
>  create mode 100644 meta-oe/recipes-navigation/geos/geos_3.9.3.bb
>
> diff --git a/meta-oe/recipes-navigation/geos/geos_3.4.3.bb b/meta-oe/reci=
pes-navigation/geos/geos_3.4.3.bb
> deleted file mode 100644
> index 538456cc2..000000000
> --- a/meta-oe/recipes-navigation/geos/geos_3.4.3.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require geos.inc
> -
> -SRC_URI +=3D "file://geos-config-Add-includedir-variable.patch \
> -"
> -
> -SRC_URI[md5sum] =3D "77f2c2cca1e9f49bc1bece9037ac7a7a"
> -SRC_URI[sha256sum] =3D "cfbf68079117c1c2b76411636444ff41d73c31093c4cab9d=
cc9a8c1bbe7e3897"
> diff --git a/meta-oe/recipes-navigation/geos/geos_3.9.3.bb b/meta-oe/reci=
pes-navigation/geos/geos_3.9.3.bb
> new file mode 100644
> index 000000000..fdb72204e
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/geos/geos_3.9.3.bb
> @@ -0,0 +1,3 @@
> +require geos.inc
> +
> +SRC_URI[sha256sum] =3D "f8b2314e311456f7a449144efb5e3188c2a28774752bc50f=
c882a3cd5c89ee35"
> --
> 2.36.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97560): https://lists.openembedded.org/g/openembedded=
-devel/message/97560
> Mute This Topic: https://lists.openembedded.org/mt/91922610/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

