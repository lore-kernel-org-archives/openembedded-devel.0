Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95871C25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 17:51:06 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.3665.1717091465431389333
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 10:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=juiPslJX;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-24c9f73ccaaso659539fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 10:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717091465; x=1717696265; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCByq+nRjSExbjq0FwqEVYO9A4LX1bXzM8dbUR58Ai8=;
        b=juiPslJXbzI12Ic5aZES8KSNfucJgmUSnbAPWGrp1IM8VrgcKhajiZnQwZD44z+H5x
         NXualTg8N5NyUVS3jyf1WyPfwnFvZgw74IchWNNZCNXpnq9x2tJthqP9AOeS3lyTjbYR
         CtJnpTty/4FOinxb4DX2v6JEk9scZJg+28uCoH1U92+mXgSnIkTmNy4bOEjM7EqAE2Eu
         6AyN2MnF9jrhEKRhJL+KgMck1q75G4tV6fuqgF+LrTqGTtgDZgDK6LZA39Rx7qxpGkHj
         /ddOxm0o7+3onWhL/1EcKgM93dduxGvGSPSy0mKIeX+KXiGqGBiulOvxGGqfB5FkdbQ7
         t+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717091465; x=1717696265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCByq+nRjSExbjq0FwqEVYO9A4LX1bXzM8dbUR58Ai8=;
        b=AgZ00J7R88Wy2VelIr8aRgzwJUFdfSgK6ZTfGKyAywACzgIbpl7/0l5SFb1ps3r0Yq
         R7/1dHybeu71biWswNMieLldTZqCJg1MyTTJndq7u41b5z/vH46xc8c7IZxlU1YEBaqR
         Q8kPgVHBMexZZb83Wev3OdWiPsxOcv6j1alPcpLbJqE+pfttwFOnpHNWbEEolJMVkYHW
         vSeELAKcp3vopB58gTkTLzSS5RikBKrSQG1OM0eeWKnGZ6/x+0ILL0FSOpJBOPKdqruy
         X1xddbqubf/7s+5nJuXSeD3wPI3qWeXPrq50AYeVlnaVIBt4A832m6k7gngSoQlXYD1B
         c/eQ==
X-Gm-Message-State: AOJu0YyHIVQbdpA4bIAhT4WUzALrMiZkYuKcjCJ/GXTw1RVm2PCtEBNt
	IcZGrTYnFLnNcdkkYwl4MmrlXS9IhLXe6rWK7P9jVr65LswAItmBCM/vakggWwQeKNlMIfZhePY
	ujfmho1vjh5iEzsfaB9cyS+cGubyOMTLC1soN4A==
X-Google-Smtp-Source: AGHT+IH1yq5dItRf2yCAkH7sXCRdVGNv/O3BEn5fFZkK0QOPgyXxemAvV1HigQIKQ0wvtbGUr+kE0KHadqyfXWp2u6M=
X-Received: by 2002:a05:6871:442:b0:24c:666b:407 with SMTP id
 586e51a60fabf-25060aff43emr3245274fac.4.1717091464610; Thu, 30 May 2024
 10:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240530153408.504969-1-chaitanya.vadrevu@ni.com>
In-Reply-To: <20240530153408.504969-1-chaitanya.vadrevu@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 May 2024 10:50:38 -0700
Message-ID: <CAMKF1srzBveYxW8=edqg1gzY=cULurycq8wRj1ceb2U2+-rRMA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] pv: Update from 1.6.20 to 1.7.0
To: chaitanya.vadrevu@ni.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 17:51:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110636

On Thu, May 30, 2024 at 8:34=E2=80=AFAM Chaitanya Vadrevu via
lists.openembedded.org
<chaitanya.vadrevu=3Dni.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
> ---
>  meta-oe/recipes-support/pv/{pv_1.6.20.bb =3D> pv_1.7.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/pv/{pv_1.6.20.bb =3D> pv_1.7.0.bb} (91%)
>

how did you test it ? Its good to mention that when sending patches,
it fails to even patch
https://errors.yoctoproject.org/Errors/Details/784500/

> diff --git a/meta-oe/recipes-support/pv/pv_1.6.20.bb b/meta-oe/recipes-su=
pport/pv/pv_1.7.0.bb
> similarity index 91%
> rename from meta-oe/recipes-support/pv/pv_1.6.20.bb
> rename to meta-oe/recipes-support/pv/pv_1.7.0.bb
> index 6a739af927..f6f0045c2a 100644
> --- a/meta-oe/recipes-support/pv/pv_1.6.20.bb
> +++ b/meta-oe/recipes-support/pv/pv_1.7.0.bb
> @@ -8,7 +8,7 @@ SRC_URI =3D "https://www.ivarch.com/programs/sources/${BP=
}.tar.bz2 \
>             file://0001-pv-display-handle-error-of-tcgetpgrp-in-pv_in_for=
egr.patch \
>             file://run-ptest \
>  "
> -SRC_URI[sha256sum] =3D "e831951eff0718fba9b1ef286128773b9d0e723e1fbfae88=
d5a3188814fdc603"
> +SRC_URI[sha256sum] =3D "1372b41053881a05e2df10cb054304decc0233261c0aa0e9=
6185842fa5a422ad"
>
>  UPSTREAM_CHECK_URI =3D "http://www.ivarch.com/programs/pv.shtml"
>  UPSTREAM_CHECK_REGEX =3D "pv-(?P<pver>\d+(\.\d+)+).tar.bz2"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110629): https://lists.openembedded.org/g/openembedde=
d-devel/message/110629
> Mute This Topic: https://lists.openembedded.org/mt/106390746/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

