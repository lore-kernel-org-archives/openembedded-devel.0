Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B4CC61D92
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 13:08:39 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.39360.1700572109198537054
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 05:08:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fXJXFh2V;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c88750e7d1so18716021fa.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 05:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700572107; x=1701176907; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DrLy+dVeECe97fLv+OU/gdxTlM5qiiJpkELnsFRq9s=;
        b=fXJXFh2Vr//Z2Ks+QsEAryvmcuWUuzISpTrGBY8NPJAXl6qBNupySe5rPJXSNBYiF5
         68Rl00AfngMHtwA0Y4Q/7GgsAR1ulP4MmF675P8Xy+oUrllULKR23FPDo6o/c+9A+YHn
         JoU/YFUlO66nOQ/GIlwBqzvB78wOpghDy9/ZmYZfrbYA7RCCOC4a08h4llDngk6QCjuA
         Qd3Ja3pDQq8NPwkzMwAAjBpBMfCpNKCm+OJrgoBIgWncp83WpAAH6wwSpygojfsImSzR
         ZxBN52laO7cY4BDM4aanxsRaP4VgUTwiLa+i+w76Ab3fodKitZgZcGVNuJ30vS9942A1
         /kUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700572107; x=1701176907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DrLy+dVeECe97fLv+OU/gdxTlM5qiiJpkELnsFRq9s=;
        b=Y05zmoieq3fvowmjauZDmQh9yioIyo+D93snLCALwiYJPEhYKIiQ3slOE6ASBNqhdG
         emb6nYAUYDc2RlfMHQjIw2ji/mCjBuQ5zy+/8jFvTVDELW1HrfYIKZbYkWELQxF9ElPi
         fk5zpPP/hoA3KxOzDF10Ptq/PhYa51iXRtWRnV+kiYSLViOlf2BDRUTFuH4tcUfRfDNF
         8K9xQsyzgi9o+/aGEA1j06ykIuB4lOfu47uE17aFLbY1GsZMryCroJ0sN35ZuzmVcolg
         hN/gSvK0BrhGPc03OcCoW8xwrN80GHerWOQN80mqUXxYdKbY9+qP1Y8u8ePOJi0ZaMfr
         Ct8w==
X-Gm-Message-State: AOJu0YwqWkf0PnsvN4YfCwhQpHjL7DXqQdv71W0DNOxnfX/CPdUdtgga
	U/l5d1U/LyVfE4m1gEIuug+kbdSaEIt3JAXPxM7QJLPh
X-Google-Smtp-Source: AGHT+IEBPO+itMIstteeoXKmz7XcWqYzDsmdPkdiQknmb53v0a1ggH2sgRpWDbK3Ws706SHCedkb3OgxeclKP2rS3F0=
X-Received: by 2002:a2e:954a:0:b0:2b9:aa4d:3728 with SMTP id
 t10-20020a2e954a000000b002b9aa4d3728mr6428129ljh.29.1700572106688; Tue, 21
 Nov 2023 05:08:26 -0800 (PST)
MIME-Version: 1.0
References: <20231121130233.1381225-1-zboszor@gmail.com> <20231121130233.1381225-2-zboszor@gmail.com>
In-Reply-To: <20231121130233.1381225-2-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 Nov 2023 14:08:15 +0100
Message-ID: <CANNYZj8rvwophdS_ErcihSMA13JF=MVhUzLsDZB+KcSRftOoUA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] webkitgtk4: Add recipe
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 13:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106978

oe-core already carries the gtk4 version of webkitgtk. webkitgtk3 in
meta-oe is a temporary recipe until all consumers migrate to gtk4.

Alex

On Tue, 21 Nov 2023 at 14:02, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  .../recipes-support/webkitgtk/webkitgtk4_2.42.2.bb    | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk4_2.42.2.b=
b
>
> diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk4_2.42.2.bb b/met=
a-oe/recipes-support/webkitgtk/webkitgtk4_2.42.2.bb
> new file mode 100644
> index 000000000..6efe8577e
> --- /dev/null
> +++ b/meta-oe/recipes-support/webkitgtk/webkitgtk4_2.42.2.bb
> @@ -0,0 +1,11 @@
> +require webkitgtk.inc
> +
> +DEPENDS +=3D "gtk4"
> +
> +EXTRA_OECMAKE +=3D "-DUSE_GTK4=3DON"
> +
> +do_install:append() {
> +       if [ -f ${D}${bindir}/WebKitWebDriver ]; then
> +               mv ${D}${bindir}/WebKitWebDriver ${D}${bindir}/WebKitWebD=
river4
> +       fi
> +}
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106977): https://lists.openembedded.org/g/openembedde=
d-devel/message/106977
> Mute This Topic: https://lists.openembedded.org/mt/102727581/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
lex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

