Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2351C369A2
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 05:58:28 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.18802.1744351101818740128
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 22:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VrLXcoRd;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-72c7336ed99so509178a34.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 22:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744351101; x=1744955901; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YT1cOi/ewHd8vKAH7c4p0tcr5SuPgTGfdhZThuhwQMI=;
        b=VrLXcoRdfY+SRHV1zkB7uWTazqRd3rXEJeudSfl+lZrNyqmt1ApzIrtzm6DnDa6YLU
         KkF+F7STTLL2c5Iz9ebmerAlbmP3VB5w9SJ6NaDDJUj+YGWS+2CJcYz/MgADRFQBLPJC
         2JUvPv1YORJpC35j3/gyAcyd/ylLOiE5ABCOD6UotLi+Ei9gPu96usSclLT6BJdAVqAO
         zqhwFO13YTo+Iy0uEcGxm/IcZtuOdTTLbSubWnOqkqCNAUioJzjuWyy/o1KynTXsIQjz
         Bq66Y/wPka/5CifQ0D3fz+ARSsSFwIQhfQXX0j3L8yZlq5s1akPE1Bg6B0aBMuAKVyPq
         vssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744351101; x=1744955901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YT1cOi/ewHd8vKAH7c4p0tcr5SuPgTGfdhZThuhwQMI=;
        b=aiAnmF+tEKtqO/tSEjIicoga8zjENDAWB8KGSvmeB7yJrmPxFob+7ZVvMyPiPtIagS
         CP+jFHRESfoW3wx5aGLysWpx2RfUgtTJwg1tBK37lPCKe9JURqqF+MK62jc3LE4FV4Eh
         L4pChVpilQgady2YCS80/JJiYhQ4ra2LNksMy1wXdlElJVQrS+Ix6HM0mnRsB2Qz1aUu
         Fdj8SJrTGmrwQPklU2kBXOjCqRTjKTQRp4LqBRd3sKUFhoWe3jNE2wjpLbp8fvs43Vf3
         agy01b93i4c1NdpmCW2ZWoSljPFEutb1jOKXSMKAUVSRcK/xVPT3OXDTrgrQM0LF2hOI
         RO2w==
X-Gm-Message-State: AOJu0YyBfBdutGAG4R5DMiPNegxR3JfBZSh1qmOk6pej1084DQqohWqG
	ukwDwA9UjS/H4SqqeMRsoTBVgkCxD/uq7Xv6xgthdJekEvvKIek3zuuUAcQj3pd1MCRLdFBRBSr
	KtNrc2H4U9U9E0uNyqDF8RACvzZM=
X-Gm-Gg: ASbGncv3Awdv2JQOKkqZqhPGIk7xxZmm//l+2lG5hjK8ANaluP9IEqxszgEw6ptMIYa
	gO9RsBrUIM0cReHoqUDGrMQK9Ap4XY7Bvk1GjfbgT37RpJIpEouSUYnWUpSSJ9+A+13A/CRArUk
	0qXjLFkPiFk1xvZnPZzUz4BQ==
X-Google-Smtp-Source: AGHT+IFHTmyzbUpGm7Y8YdkfBiQS2wGzSuun3UVP2ou2v576JE+26v8kg0HT9oarc9FUVlkBTcjym/LfcPa6sFp1aDQ=
X-Received: by 2002:a05:6830:6b0c:b0:72b:9bb3:67cf with SMTP id
 46e09a7af769-72e86305cf4mr1146613a34.9.1744351100903; Thu, 10 Apr 2025
 22:58:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250411052327.2144966-1-changqing.li@windriver.com>
In-Reply-To: <20250411052327.2144966-1-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Apr 2025 22:57:55 -0700
X-Gm-Features: ATxdqUE4wdpYRpawDSWOsX0_nwYhlfj2aYaJJntgW1xjACGUD_Afy9Qu8HupHOc
Message-ID: <CAMKF1sruOtHeOttcBPjBUi2_yd3C6b5Tp3wuJk1ktFf_1Sinjw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] lsscsi: update PV to the real version
To: changqing.li@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 05:58:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116795

On Thu, Apr 10, 2025 at 10:23=E2=80=AFPM Changqing Li via
lists.openembedded.org
<changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Update PV to the real version 0.30, this can make PV aligned with the
> runtime version
>

the new version "0.30" does not sort higher than the old version "030"
so if we have to do it we need
to set PE as well

> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-oe/recipes-bsp/lsscsi/{lsscsi_030.bb =3D> lsscsi_0.30.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-bsp/lsscsi/{lsscsi_030.bb =3D> lsscsi_0.30.bb} (9=
2%)
>
> diff --git a/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb b/meta-oe/recipes-b=
sp/lsscsi/lsscsi_0.30.bb
> similarity index 92%
> rename from meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb
> rename to meta-oe/recipes-bsp/lsscsi/lsscsi_0.30.bb
> index 63b94e9d6e..ba52bdaf12 100644
> --- a/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb
> +++ b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.30.bb
> @@ -10,4 +10,4 @@ SRC_URI[sha256sum] =3D "619a2187405f02c5f57682f3478bffc=
75326803cd08839e39d434250c5
>
>  inherit autotools
>
> -S =3D "${WORKDIR}/lsscsi-${PV}r154"
> +S =3D "${WORKDIR}/lsscsi-030r154"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116791): https://lists.openembedded.org/g/openembedde=
d-devel/message/116791
> Mute This Topic: https://lists.openembedded.org/mt/112205589/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

