Return-Path: <vincent.prince.fr@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8784CCFA13
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 09:49:15 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.38708.1727344153823991994
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Sep 2024 02:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=grWX0eAP;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: vincent.prince.fr@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e116d2f5f7fso1504419276.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 02:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727344153; x=1727948953; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUYMlUQsD3WaVKwqo0B1HlkJWrytqT4GzY/cZoQ4dLo=;
        b=grWX0eAP04OmaO89YSBYUOlH9nt/c1O3Kq4A+ciq2IY1fSCAQM/wi8e8UIiHRlFRE6
         tffgzqtaAEbrXts7lBO4LlXULsXaNZpEW+fURp5G12ARVepa1Ydmlm6CgXImOu2qIgo5
         AtX+TCU6d1WRtxtYbiOsNt5RHSCsGzW/m9ydLIy/1UnnIJnHgSXqmY903RlB+90FNB4Y
         78jCI+1fKjgNXGpKqvKB0NbvpAQdQ+BGOI042qPvGdSziCtKSpFwEuOqDRFvG4XQlJRD
         G1su+UR/mw0OKLpGS+ruXvMzmiUUFEpYiv3jtimtoV8kAgGvGxR71c+qefrEFtYPFIB8
         eOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727344153; x=1727948953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUYMlUQsD3WaVKwqo0B1HlkJWrytqT4GzY/cZoQ4dLo=;
        b=VC2YcebXVpTZfEvor0+Ce4aXbKzso4rDzg7hOdloEZtyv4UDnVcthv50Dt1P+y/GMT
         kHPvjjiJJjv6+7q29ZXQ5SZQIRYfPCHfWoGln0i11kcAWxd1ALgSqaX1bqmn+Y5F9tSv
         CvpyMzTO7+GKLkxySutGKxGDi+Badk663trzKbZjd90dZ1nvJMEdN632/vtePknfbtew
         7o3oshfKF5Y0LcbH1XWmn7b0VtkGPdZUVtPfJTZPxLgrbUzBdHdFHAZxew5H39cDXYgO
         rj4Azavz+L6dtdyss27k2EKwx6H5930vUSJztHz3Y7CUruEq+8xPLiZEQ/HkC9g4JSBI
         3CQg==
X-Gm-Message-State: AOJu0YyaoXPEzZlZINmLdcQDstKo0zdmzNPya+MK9OJ03DYZCGD6ApwH
	sPU82pjpOqGrrpaCzEctLBn6jQBhqZBkE0IBZQ7VpLxPm9LKM4as5+dm05IxKFG0gotFMvYiMMH
	F+PAUBX5oAge008f+3Ip8wg184Rs=
X-Google-Smtp-Source: AGHT+IFhnhLgef9VTYzdYUwKC4yKf92Sx3dMHs7NaO+tcaMf6Kqn+zVKEsralPyuOdJdr964usOmK+zlrurMkc6NxVw=
X-Received: by 2002:a05:6902:118d:b0:e22:4f5a:6882 with SMTP id
 3f1490d57ef6-e25ca9976ebmr1633756276.25.1727344153015; Thu, 26 Sep 2024
 02:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240925144556.1451584-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20240925144556.1451584-1-dmitry.baryshkov@linaro.org>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Thu, 26 Sep 2024 11:49:02 +0200
Message-ID: <CAB2nKc_d33JRj7kLQju6SdB9OnnE37E82baQoj2nVPirsqnFOQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] libdevmapper: Inherit nopackages
To: dbaryshkov@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Peter Kjellerstedt <pkj@axis.com>, Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 09:49:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112515

Hello all,

Any update on this backport patch? :)

Best regards,
Vincent

Le mer. 25 sept. 2024 =C3=A0 16:46, Dmitry Baryshkov via
lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org> a
=C3=A9crit :
>
> From: Peter Kjellerstedt <pkj@axis.com>
>
> This fixes errors from buildhistory changes where packages-split would
> be empty.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 90f96e053ad3eefa7693d9748efdfbfa72d7dcfd)
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>
> The oe-core got commit c9e2a8fa2f03 ("buildhistory: Simplify intercept
> call sites and drop SSTATEPOSTINSTFUNC usage") backported to the
> scarthgap branch. Backport the fix for libdevmapper too.
>
> ---
>  meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb b/meta-=
oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
> index be558ce1d218..3b4439c3ae06 100644
> --- a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
> +++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
> @@ -5,6 +5,8 @@ require lvm2.inc
>
>  DEPENDS +=3D "autoconf-archive-native"
>
> +inherit nopackages
> +
>  TARGET_CC_ARCH +=3D "${LDFLAGS}"
>
>  do_install() {
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112496): https://lists.openembedded.org/g/openembedde=
d-devel/message/112496
> Mute This Topic: https://lists.openembedded.org/mt/108648856/3616779
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [v=
incent.prince.fr@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

