Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2CAD5CCA4
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 09:54:54 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18910.1765878885364881219
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 01:54:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zrrO+sJY;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so48226185e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 01:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765878884; x=1766483684; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Y1YF48t9ZgrMngi94mr8pm1TeRyxSCU+RH/MH9MgK8=;
        b=zrrO+sJYdj+PXgDkRA3AHGVBtKp4BrRdXavkPDYBnjWZM1+om5Lij6tfPIl1YMBT+h
         nqjtFTBaJYwEjbPxHkz2NskytR5vO0jWEzk6mpVVx9GOZfjTYJAewcAna0BCF30OmAcL
         zCQ06czqkVWxlEKZw+L38O54LUXPcpw5bf6xQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765878884; x=1766483684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Y1YF48t9ZgrMngi94mr8pm1TeRyxSCU+RH/MH9MgK8=;
        b=uyuovfwpufqbnFaiuU/5HHnVLgk0ek3a3JfKw1UAuttpd1D8T/etjfQ+UhjRlLcFEm
         F2vo1cqzPjX39oQofIoCZfmDZB4ArRwRfDNtT/Pnku5eRNpsCLiLqNdgr2CiC4uKZwAg
         nhPjcURDNRp1Z0c1u5mWEBNwMQatL7r9uUcfyJYZ/lTUm7dMk36Wd6upmQbrJMT19b2G
         8t7f1CTTr167SdbNGI28RDNK6FE1xz1RCbhjKfgfWH/oFKcfTjCaOMc/7t2y2Mnct/DO
         4eCSftThvc22KXOBdW5k6NTrlft3XYs62KPcU5VKqUsXBF0kIXV3Ul+X+mW2DAyjlsuF
         j6SA==
X-Gm-Message-State: AOJu0Yz67mcdvcTj1XHdmtrh7zq/YUNhCMwZ+B3e+ZFCXiZDVnM2agRy
	Qj7tE0+OjSDUFw0358FvPbNWHZKNyhrFqea48BNguC9wu5IiApDk0Kes76AmsFSNtL6koKkXPbi
	w/o9ewhEci6k0nOWLus2qCDyqRSZKv4REdoi6ZKfKqg==
X-Gm-Gg: AY/fxX65G2WqnPCr5Ma+0K6UiwoDDccorvmtIJIoapxh1/XBF+sf6Mf6EttxYB9x/jR
	iphXlz5qnVf3jzlgzAIanYRFPwFje4hnMlQ5/rOVSa79oNCL+J/ZElZcQVW9fY/z/I2Ag6EsNh3
	hhD6O9+WNHQn18SMFvHTJfH1+3p+hmOPJ2e0tlxFHcV2lt0J1M4c2EuBlaV4Riczd+lVmCzH86R
	3o2iA+/xfvP2whHYT2xYv5CG3Fb8M/V0HKmblSwQt76ZoTEOUKTMr0o0EvR8B5074LGrt4+Zg==
X-Google-Smtp-Source: AGHT+IHaoa4OIGCGznHQ85bKy1rT+/GjCIkvpxa1/m5ueCg+3yFlSC1Mez/LQGFruBtkNBk94a1CT/C1bX6+RW6+Khg=
X-Received: by 2002:a05:6000:4026:b0:42f:8816:9504 with SMTP id
 ffacd0b85a97d-42fb490d2a0mr13707855f8f.60.1765878883590; Tue, 16 Dec 2025
 01:54:43 -0800 (PST)
MIME-Version: 1.0
References: <20251216094653.2704060-1-t.f.g.geelen@gmail.com>
In-Reply-To: <20251216094653.2704060-1-t.f.g.geelen@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 16 Dec 2025 10:54:16 +0100
X-Gm-Features: AQt7F2rg5k5A8lGBRAPqMErggIZYaW3odjRV-fFmClSMw0sfF3C8IkLC8WG0K1o
Message-ID: <CAMSfU+5rn65PL+SuogmX_MxnLfiZBT3syQfn=KdG3y5t+659ZA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-async-timeout: add
 BBCLASSEXTEND for native and nativesdk
To: t.f.g.geelen@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 09:54:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122692

Le mar. 16 d=C3=A9c. 2025 =C3=A0 10:47, Tom Geelen via lists.openembedded.o=
rg
<t.f.g.geelen=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
>
> Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
> ---
>  .../recipes-devtools/python/python3-async-timeout_4.0.3.bb      | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-async-timeout_4.=
0.3.bb b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
> index 3d35780b65..480d4cb02e 100644
> --- a/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
> @@ -16,3 +16,5 @@ inherit pypi python_setuptools_build_meta
>  RDEPENDS:${PN} =3D "\
>      python3-asyncio \
>  "
> +
> +BBCLASSEXTEND =3D "native nativesdk"

Thank you, that does fix my problem with "[meta-python][PATCH 2/5]
python3-aiohttp: add BBCLASSEXTEND: native and nativesdk to the
recipe"

Reviewed-by: Yoann Congal <yoann.congal@smile.fr>

> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122691): https://lists.openembedded.org/g/openembedde=
d-devel/message/122691
> Mute This Topic: https://lists.openembedded.org/mt/116807309/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [y=
oann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Yoann Congal
Smile ECS

