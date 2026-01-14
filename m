Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8326D39015
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 20:27:07 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20165.1768422426892060717
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 12:27:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VGorj0WX;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7c95936e43cso98029a34.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 12:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768422426; x=1769027226; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLzM88W/pqnMNtw+J6mV5iJUdWeyaPDkiGDhDXcLU60=;
        b=VGorj0WXBdW7cdUCfP0Te/a8c8Txs57GHJoPhschlGm4VEcxwm9IoH+5minzsSe6sV
         A9oBp4As0MsfW4QctYE8TZF9LEvKREOUNNZJ44Q5ifNLwW3iy9pRO/KSJUm9otZs1ORF
         zNzkVwtdH9UQUK5caYxZbtEIbeufll0+0bT8NFP14O9QMucI7G5xQUf7nf/G/jZuvDHv
         OwauDQ4trdEhhnjlvCBIAdJPcOsnr+qXIyk+660gHevscm/PX6Gly0wXrbRrIciD+Sc4
         bCSNLhvAvFewIqYo/LTCBCLMJd/2LaGHPeG7SXTfQ1PFKtn6NQbdVx5rtsLoLYanNqV+
         axbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768422426; x=1769027226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZLzM88W/pqnMNtw+J6mV5iJUdWeyaPDkiGDhDXcLU60=;
        b=D28VKZMdU4TLXvnDpdVJPRx+DsYgNzvsWBzydNURdpwD8zPATwlFsRoBchxKLDjofg
         fJUBTBwTSoHjqdHRJd4zL/YA1Ipvbgw4YqMoXLLQ0mkFbul/IPJVe5dKD0sYKLzAqwbs
         ZsP+AASnb4YiNLupYhONpDoUIxna+ivG7R+bEuNCV7XS9O1HPAODSrstiJFTnZKct3LD
         X9ATdY1ypa4lAmqb+ARdufW+UCMy56a9xM6IvOrnMDMwAecVmcIdhyYLy0ekg65tbSaR
         0CYBJw2UyBu167QISYCjUb8tSqbQMM1FTpRGIVbr2yFEXtE8XU+WapkKrUjO6+JtpEK2
         aRBQ==
X-Gm-Message-State: AOJu0YxzKGfym7Ch5Egz4/1Pz3xMoqlSmoAeP5Al2JtiFLmrqlhnjwJZ
	dA0X0QC0aYgLTXaN0slPaJKECbx7hTKZKzzm6La/9Z3NQjT9ScxLmTwW8Y/S4y7TiPyHUp5fupp
	YZ0wsKEdH1I5a2HH2rszGftM22I8xUiyt1g==
X-Gm-Gg: AY/fxX5IxPQFoSm2d0KCi9Gyl7EVonjC2Yx66A4DehaqZuFy+RK4RFgztXQ3/q+86O2
	ix6xIUb1qdM3b3kv1eIq0hDBaa1HP0CBmO52qqOIAx/9TKvVfrCIQb9D5tpdjjZGY0IMGi5ME0+
	+6TKpkNYGa7bMyiAgRtV5vx4S4ynsRLBGhO01lMMkooEG9vF/Y5RtmwimL7WDGk01TbZ9HDh75f
	moD1CVcolghGyMTc1L7e964r/TCENyHcHcKRPf1JmAfE91EwadnUn8BS4VxTCnNXZR0RqPWfbXq
	CVVlVbs=
X-Received: by 2002:a05:6808:8482:b0:45c:7306:505e with SMTP id
 5614622812f47-45c730658fbmr1658150b6e.63.1768422425958; Wed, 14 Jan 2026
 12:27:05 -0800 (PST)
MIME-Version: 1.0
References: <20260114172553.1241309-1-adam.duskett@amarulasolutions.com>
In-Reply-To: <20260114172553.1241309-1-adam.duskett@amarulasolutions.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 15 Jan 2026 09:26:54 +1300
X-Gm-Features: AZwV_QinoHNtBKYO08uZwMprJb2QdCXppUOaakhjro4lCiXrsVw8RP6fFd6OJzM
Message-ID: <CADySD0Eh9Zcp=OQDSwbVWDswDhmJs=OmfqozY9KLiF3fZV2bRw@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/2] [meta-oe] libtsm: add recipe for kmscon dependency
To: adam.duskett@amarulasolutions.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 20:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123485

On Thu, Jan 15, 2026 at 7:16=E2=80=AFAM Adam Duskett via
lists.openembedded.org
<adam.duskett=3Damarulasolutions.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  .../recipes-graphics/libtsm/libtsm_4.3.0.bb   | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/libtsm/libtsm_4.3.0.bb
>
> diff --git a/meta-oe/recipes-graphics/libtsm/libtsm_4.3.0.bb b/meta-oe/re=
cipes-graphics/libtsm/libtsm_4.3.0.bb
> new file mode 100644
> index 0000000000..a6c12b71d9
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/libtsm/libtsm_4.3.0.bb
> @@ -0,0 +1,35 @@
> +SUMMARY =3D "Terminal Emulator State Machine"
> +DESCRIPTION =3D "\
> +    TSM is a state machine for DEC VT100-VT520 compatible terminal emula=
tors. \
> +    It tries to support all common standards while keeping compatibility=
 to \
> +    existing emulators like xterm, gnome-terminal, konsole, etc. \
> +    TSM itself does not provide any rendering nor window management. It =
is a \
> +    simple plain state machine without any external dependencies. It can=
 be \
> +    used to implement terminal emulators, but also to implement other \
> +    applications that need to interpret terminal escape sequences. \
> +"
> +HOMEPAGE =3D "https://github.com/kmscon/libtsm"
> +BUGTRACKER =3D "https://github.com/kmscon/libtsm/issues"
> +CVE_PRODUCT =3D "libtsm"
> +SECTION =3D "libs"
> +
> +LICENSE =3D "MIT & LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM =3D "\
> +    file://COPYING;md5=3D69e8256cdc4e949f86fedf94b1b320b4 \
> +    file://LICENSE_htable;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
> +"
> +
> +DEPENDS =3D "xkeyboard-config"
> +
> +SRC_URI =3D "git://github.com/kmscon/libtsm;branch=3Dmain;protocol=3Dhtt=
ps"

please also include tag=3Dv{PV} in the SRC_URI

> +SRCREV =3D "9d2817b727f61c09e19994b2431af716652f330b"
> +
> +inherit meson pkgconfig
> +
> +EXTRA_OEMESON:append =3D " \
> +    -Dextra_debug=3Dfalse \
> +    -Dtests=3Dfalse \
> +    -Dgtktsm=3Dfalse \
> +"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123482): https://lists.openembedded.org/g/openembedde=
d-devel/message/123482
> Mute This Topic: https://lists.openembedded.org/mt/117265880/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

