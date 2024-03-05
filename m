Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BBAC54E41
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 21:42:37 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.1038.1709674950106243059
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 05 Mar 2024 13:42:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V2f2Dg7Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-412f0655d81so4868245e9.2
        for <Openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 13:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709674948; x=1710279748; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WO4JOuZE8o/sHPNkji3RHOLu0qaZnVGYq4FMMvaxYrw=;
        b=V2f2Dg7QSePqLwn1eSs9U/SiAmqNfY9ywPfytNuYuKcnwcbOx++8pWH3ebOIj99sqC
         q5SJZQUDwMSOe6BdqFTG7rE6+92gmXYfeZZsuvqnfep6oGuIK/IlUdspL4oFOz/CYz3Z
         qyIQSIOwnYRZ/Xa1sVm+a8xNFMGLwet5XYhH3Or/C8AMoXxOKgrQmKlAxwmHSBHuUfKr
         hSuWXy/8jjN1K5WuqS6vPvcmU+CuY1KU4xuYlzGWrw4+JbkNjgkFB/vOEmC8uqFcs3dZ
         5VwyCKKnFB2riAuf3O4PzqHHQUEV8gx+M/NPzuTtcBgyH2TcX895PTRkElztKJaAlcvq
         VAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709674948; x=1710279748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WO4JOuZE8o/sHPNkji3RHOLu0qaZnVGYq4FMMvaxYrw=;
        b=ieUdxpzowXdgTAyYIE3MFE/h0fYqM0bbQwMrob9m1J3p6mDMVNiFvkcp93ZGisalx9
         MNiuW0FKXWo/EmCXShLglj3K6brQMH9A/90dy4MzBP+8Ac5n31l1Lh14Zy6jhicvY14J
         cDCPHUedkxjEcemGQ7R2WzmaBO+CmigwxHjoODrklNojQlC/q0uXmziB2dc5hO+wI6S3
         AWDdj5SrshaCxKNat5jUFcquGhwURaR/MlFmm793kthJuOm9hAZL+xEXyrIob/OMPAjJ
         4kBznYgrbrTDGDLiNqDZidAkzDJrsx1WuFxlAV5XHn2SmyNzFVVfUMaVNYpcmWhZyP5h
         TX8w==
X-Forwarded-Encrypted: i=1; AJvYcCV/iBq7fYoRKZEpfEwKQg+Vy79TLWJnH+nd4xq99hXOt3KYZduItPETQk5yPmCPPp6kowal9vmTCzEpCfp87UVxRrlUL2FIy/CMlT4g8jeN8Fi+py6qx4/iYw==
X-Gm-Message-State: AOJu0YwzYiodRtwhWU13L1YBO1S0wYoAyslE/IXeE+f//Fpg8+tZjx6A
	2xp/cR04zstwKPbJJ9JLLIlOtvDxIqvrQG6qxS6gRJNu7CIKu4o6Iu6STb4WHKV1TlxcvNQGmDi
	yh4E5XA7i5ofGmTHI/axwMlmAZ7s=
X-Google-Smtp-Source: AGHT+IGb9GYTevukuILuZL0MxyPpiY+PYV5ztkq9BUgV6Hn/OSKjsxCpABJgcYThOqPmQ8TbzpP26vHCy/LMm1Fu1t4=
X-Received: by 2002:adf:a38b:0:b0:33d:b2dd:7fbf with SMTP id
 l11-20020adfa38b000000b0033db2dd7fbfmr8611283wrb.21.1709674948142; Tue, 05
 Mar 2024 13:42:28 -0800 (PST)
MIME-Version: 1.0
References: <20240305212609.2054938-1-rs@ti.com>
In-Reply-To: <20240305212609.2054938-1-rs@ti.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 5 Mar 2024 22:42:13 +0100
Message-ID: <CA+chaQdaNgrihtzBvoWvdkNTYq8QMhf4B9mcfX5UPyhFiuahiw@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 0/2] glmark2: fix an issue with eglconfig scoring
To: rs@ti.com
Cc: raj.khem@gmail.com, Openembedded-devel@lists.openembedded.org, 
	detheridge@ti.com, reatmon@ti.com, denys@konsulko.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 21:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109135

Invalid format of Upstream-Status and please squash those 2 commits as
they don't make sense separately.

On Tue, Mar 5, 2024 at 10:26=E2=80=AFPM Randolph Sapp via
lists.openembedded.org <rs=3Dti.com@lists.openembedded.org> wrote:
>
> From: Randolph Sapp <rs@ti.com>
>
> Backport a patch from the upstream glmark2 package to fix 2 primary issue=
s:
>
> 1. Configs with stencil components were ranked unnecessarily low.
> 2. If the target config was below 0 an optimal config may not be properly
> selected.
>
> Randolph Sapp (2):
>   glmark2: add upstream patch to not care about stencil config
>   glmark2: add the stencil config patch to the package
>
>  ...y-default-don-t-care-about-the-stenc.patch | 103 ++++++++++++++++++
>  .../recipes-benchmark/glmark2/glmark2_git.bb  |   1 +
>  2 files changed, 104 insertions(+)
>  create mode 100644 meta-oe/recipes-benchmark/glmark2/files/0003-GLVisual=
Config-By-default-don-t-care-about-the-stenc.patch
>
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109133): https://lists.openembedded.org/g/openembedde=
d-devel/message/109133
> Mute This Topic: https://lists.openembedded.org/mt/104754322/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

