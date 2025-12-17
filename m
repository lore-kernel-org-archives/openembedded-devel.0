Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8962D66B8E
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 18:54:58 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22186.1765997689801553036
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Dec 2025 10:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QFi9212S;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4537407477aso3720568b6e.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 10:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765997689; x=1766602489; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGlH1Qk+tK8zEyWDyo9PJ9C6egqdoPje0Nux2pj5t6Y=;
        b=QFi9212S0/H5lPPOtOmLnYq7nwmD//ynmjOm/ts+6RVha26faqhyd1eyb+1tg+TVpF
         00PiZ5qfLlhZ94seF00peA7gySYkgzsEv/rHQaejzT8AfI70kOzYa0l0byx9PWpcGNxL
         kgwS809lb2X0klE0p7agHb7ctG5XwSq1qFhVV1oI6yaAGT2WbteOgYV9CO6wzH9G8BSW
         NlFgEOgpS2LxBNT7OCqbNBSrXa12WlfRfBzBfzXziV8RiAyiIsKZMwn3yKuqffpShBt9
         NPgVa+UFXurvRD6xrHyqWiO2+EibyP0Mc3gVe0vfpG/S4Poqh/INa82w+IWyhSK6MlCY
         Cp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765997689; x=1766602489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TGlH1Qk+tK8zEyWDyo9PJ9C6egqdoPje0Nux2pj5t6Y=;
        b=DY+Y/zp66Ag2xPpbak3KzAN8HunOH1om+0PipcO0jBgcb/CfnRho9xgyLNvkGZhTo+
         lMsLaFAUvJzZY0m9jI3L/X+pwvq6PNb1+VMfXOoE61+hA146FYe2Ciyhv9FAjuZXdSZr
         3W6BtsZRe1qQ8jgrssgrv8enHnK4QPS8aQihYGbnKYMUe5+b0edLo5B29Pr9EhwN9Uuq
         X0Hytx1ZX6WcoOeEiMLlx4AYxIcWHWz5hY2AT1qua+L1vURSz+qhr2EsE6cJZOYRkI7J
         mHjQvyxYLvRaI9hNF2tsF5Bt7CWRr9kRjhOaV1YjjGd2rzkvuUfzZceWdUuTMUz5k+cB
         NxHA==
X-Gm-Message-State: AOJu0YwmXQnkLAxiKXvICQmFjBufHazj/XfnjFoFB18EKKq6t57Tv7PJ
	6bu8j9FibzwjmE3hHD5PWQRPcGCRI7q2aS0qJra+5YQ9zajPH/MSiLI/IJeGIwFUTjg4A4bRPO6
	w4zAKo4sYML2jByvF8qgbCBsyfPSaKFF0QaH9
X-Gm-Gg: AY/fxX6n+9roa065Yzc/B0l9gVuwmBKcdjA+jYb+3lBcMSYJfEPy3ceiy0Hm2KELZgy
	8t08axIa/HqdHFpewj2mzVhYKCvr4SZ1pdGVBsJYyCBgBVZgRm4ZnXJ5k2Lftyuu41Evu222ni6
	wD24+iEA/tkkYrBlwomwDsGRXaakRaZDHmWbRKsRZSk0amUcdFzjx3ccjx9rl96NLHZvsZfxE0P
	mrKlkXS2M54NMBDwfD5ZILWcp6gbvKJh+xEZN7cGF6uqOkTGwYkR6ZvrXVXrUjVGPaLr3Y8hw==
X-Google-Smtp-Source: AGHT+IGACXq9BgOk1Xv/KtrIMNoLdRgMFz7ya9UiLJ9Bt6dF3HfwWg8vNVKbPZYZxM3k2KUz2oSGZx9ou5abosqrT78=
X-Received: by 2002:a05:6808:220f:b0:44f:e61d:18ae with SMTP id
 5614622812f47-455ac59f7f6mr9134428b6e.0.1765997688977; Wed, 17 Dec 2025
 10:54:48 -0800 (PST)
MIME-Version: 1.0
References: <20251217093235.3469955-1-m.schwan@phytec.de>
In-Reply-To: <20251217093235.3469955-1-m.schwan@phytec.de>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 18 Dec 2025 00:24:38 +0530
X-Gm-Features: AQt7F2qoabLKU5plS2CaZfTZWmiwwRA7vvdjC9AB_x3vH_DX7srhdjAskFvAdBo
Message-ID: <CADySD0Hk82EA+vMqGz31jibMbTbcnKr92Uhf_N2x5WH4tqvZ6Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] thingsboard-gateway: upgrade 3.7.4 -> 3.8.0
To: m.schwan@phytec.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 18:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122731

On Wed, Dec 17, 2025 at 3:02=E2=80=AFPM Martin Schwan via
lists.openembedded.org <m.schwan=3Dphytec.de@lists.openembedded.org>
wrote:
>
> With thingsboard-gateway 3.8.0, the source URI must be set to the
> project Git repository, as source releases are no longer provided via
> PyPi for this project.
>
> Signed-off-by: Martin Schwan <m.schwan@phytec.de>
> ---
>  ...sboard-gateway_3.7.4.bb =3D> thingsboard-gateway_3.8.0.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboa=
rd-gateway/{thingsboard-gateway_3.7.4.bb =3D> thingsboard-gateway_3.8.0.bb}=
 (95%)
>
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thin=
gsboard-gateway/thingsboard-gateway_3.7.4.bb b/meta-oe/dynamic-layers/meta-=
python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.0.b=
b
> similarity index 95%
> rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/thing=
sboard-gateway/thingsboard-gateway_3.7.4.bb
> rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsb=
oard-gateway/thingsboard-gateway_3.8.0.bb
> index 7a82414937..5ca57aba44 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard=
-gateway/thingsboard-gateway_3.7.4.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard=
-gateway/thingsboard-gateway_3.8.0.bb
> @@ -7,12 +7,12 @@ HOMEPAGE =3D "https://thingsboard.io/"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89ae=
a4e17d99a7cacdbeed46a0096b10"
>
> -SRC_URI[sha256sum] =3D "5811a3c5a2334e41776f249df20c1d6a0def62a6e11e77bf=
2abeaa02f2725260"
> +SRCREV =3D "4215a302c649f8fe3739814e365b0d6af722b66b"
> +PYPI_SRC_URI =3D "git://github.com/thingsboard/${BPN};protocol=3Dhttps;b=
ranch=3Dmaster"

will be good to include ";tag=3D${PV}" in the PYPI_SRC_URI

> +PYPI_PACKAGE =3D "thingsboard-gateway"
>
>  inherit pypi setuptools3
>
> -PYPI_PACKAGE =3D "thingsboard-gateway"
> -
>  RDEPENDS:${PN} +=3D " python3-jsonpath-rw \
>                      python3-regex \
>                      python3-paho-mqtt \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122723): https://lists.openembedded.org/g/openembedde=
d-devel/message/122723
> Mute This Topic: https://lists.openembedded.org/mt/116824086/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

