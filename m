Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71883D31764
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 16:20:03 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.24012.1730823601732683047
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 08:20:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lhuQT7f4;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5edf76cd843so1546816eaf.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 08:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730823601; x=1731428401; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZDHcUguRxnV9kbupKYI9km/l05v2xdLYGtpJxI27HA=;
        b=lhuQT7f4FwQQHaVMD/aGTialEAbp2xHSOQ1JJDZ25gUR9L+8OOR4ZmRuhBtt104QUk
         dYJ1um8kMuBiCv18yOL+Tfisud4M5LdiChlfd05KLmsA29TEoMDoV/KKyB8Gw+SrsVv6
         j4n4HQq/rdKIA3L98Z4FFxV6Ny+p27oVD3AN4O2qin3FBznTe9qUHr3opmYz0LJzpH49
         rrXUCozbZBUnjwqqzzVlfSb6vZbm2/XUpNgXJmEelVDkYa5TvpPxx+B79MGPQElrwjmq
         sv0XYB25FKMkjtaaCGHbymTi4Z1FOaNwHMQRFiOkuqOxCfHmywv9mcIok0e6bSo/O89D
         xqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730823601; x=1731428401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZDHcUguRxnV9kbupKYI9km/l05v2xdLYGtpJxI27HA=;
        b=FwIM/G08LyQ2cPhQnzB1xTvzx6d9kJ0yPmXXYIM1hQaGi9wKdEPzuhMWjXrxoH+KTs
         UEaqVwKUTP8y8UqPFJZhIMPzlhsJ4wzEbfyJVIWyZGRSNo5axogwJkv1E0baHRiSVNzJ
         KxqNYUWvBHej6LP8jdaMAoQmiQ551r6qi4ivXTHbDpOe4xnwho0xuN6WruMLB37UV2IJ
         bZiQlky50UAdZtssOKSxDRv2dGsOdFG4M3MJ/DaZTG37045rWO4PPjmiBqHj3FJupKHV
         oxBgu+yP19BA5KjGL3XoEocWBxOj4d3JSg0gnb5MU+w+TDLV3j5kGMs6m3XhD8FrSkzG
         WYhw==
X-Gm-Message-State: AOJu0Yxo5ZhEf8uvYvyd5QumjNHzP2+Q7SXvSvZDMd/Fd3x89WYwO532
	ZFW6rKQy9GzRcjHfIBWKR7sVPnXDfeLLSUDcJ3gv8dfb2mgO14JNVuI2ixMHkwTTWC1q94iCAWk
	BPMfqX0EzyJfFg2z721vm95Vak14=
X-Google-Smtp-Source: AGHT+IGdD2zy3hsaXlpPW6/C3vinVS8oEfO+MFcxyq4DEctExsHDT+60VJWUDiRME1R8Ysl/EzNJU4OmHQomowCn6yQ=
X-Received: by 2002:a05:6820:1c95:b0:5eb:6c26:1ca0 with SMTP id
 006d021491bc7-5ede633c074mr9798056eaf.1.1730823600749; Tue, 05 Nov 2024
 08:20:00 -0800 (PST)
MIME-Version: 1.0
References: <20241105071627.2768743-1-thomas.perrot@bootlin.com>
In-Reply-To: <20241105071627.2768743-1-thomas.perrot@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Nov 2024 08:19:32 -0800
Message-ID: <CAMKF1srLh=vyw89hvpJhQg_XxBHXb0byiTtJuZFtch-R_Qg0eQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] taisei: add a recipe for version 1.4.2
To: thomas.perrot@bootlin.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 16:20:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113509

On Mon, Nov 4, 2024 at 11:16=E2=80=AFPM Thomas Perrot via
lists.openembedded.org
<thomas.perrot=3Dbootlin.com@lists.openembedded.org> wrote:
>
> From: Thomas Perrot <thomas.perrot@bootlin.com>
>
> Taisei Project is an open source danmaku.
>
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>  .../packagegroups/packagegroup-meta-oe.bb     |  1 +
>  .../recipes-graphics/taisei/taisei_1.4.2.bb   | 52 +++++++++++++++++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/taisei/taisei_1.4.2.bb
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 178256c83f63..4635fe3d44d0 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -521,6 +521,7 @@ RDEPENDS:packagegroup-meta-oe-graphics =3D "\
>      ${@bb.utils.contains("DISTRO_FEATURES", "x11", "st", "", d)} \
>      stalonetray \
>      surf \
> +    taisei \
>      terminus-font-consolefonts \
>      terminus-font-pcf \
>      tesseract \
> diff --git a/meta-oe/recipes-graphics/taisei/taisei_1.4.2.bb b/meta-oe/re=
cipes-graphics/taisei/taisei_1.4.2.bb
> new file mode 100644
> index 000000000000..2d2ab32bace7
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/taisei/taisei_1.4.2.bb
> @@ -0,0 +1,52 @@
> +SUMMARY =3D "Taisei Project is an open source danmaku"
> +DESCRIPTION =3D "Taisei Project is an open source fan-game set in the wo=
rld of \
> +               T=C5=8Dh=C5=8D Project. It is a top-down vertical-scrolli=
ng curtain fire \
> +               shooting game (STG), also known as a 'bullet hell' or 'da=
nmaku'. \
> +               STGs are fast-paced games focused around pattern recognit=
ion and \
> +               mastery through practice."
> +HOMEPAGE =3D "https://taisei-project.org"
> +BUGTRACKER =3D "https://github.com/taisei-project/taisei/issues"
> +LICENSE =3D "CC-BY-4.0 & CC0-1.0 & MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1a11ffd7e1bdd1d3156cecec60a28=
46f"
> +
> +DEPENDS =3D "\
> +    cglm \
> +    freetype \
> +    libsdl2 \
> +    libwebp \
> +    opusfile \
> +    zstd \
> +"
> +
> +RDEPENDS_${PN} =3D "\
> +    cglm (>=3D 0.7.8) \
> +    freetype \
> +    libsdl2 (>=3D 2.0.16) \
> +    libpng (>=3D 1.5.0) \
> +    libwebp (>=3D 0.5) \
> +    libzstd (>=3D 1.4.0) \
> +    opengl (>=3D 3.3) \
> +    opusfile \
> +    zlib \
> +"
> +
> +SRC_URI =3D "gitsm://github.com/taisei-project/taisei.git;branch=3Dv1.4.=
x;protocol=3Dhttps"
> +SRCREV =3D "c098579d4fa0f004ccc204c5bc46eac3717cba28"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit features_check meson mime mime-xdg pkgconfig python3native
> +
> +REQUIRED_DISTRO_FEATURES =3D "opengl"
> +
> +PACKAGECONFIG ??=3D ""
> +
> +PACKAGECONFIG[a_null] =3D "-Da_null=3Dtrue,-Da_null=3Dfalse"
> +PACKAGECONFIG[developer] =3D "-Ddeveloper=3Dtrue,-Ddeveloper=3Dfalse"
> +PACKAGECONFIG[docs] =3D "-Ddocs=3Dtrue,-Ddocs=3Dfalse,python3-docutils-n=
ative"
> +
> +
> +
> +FILES:${PN} +=3D "${prefix}/share"

there is a dedicated variable ${datadir} you can use here

> +
> +INSANE_SKIP:${PN} =3D "already-stripped"

can we patch the makefiles to not strip the binaries and leave it to OE tas=
ks ?
This can improve debugging experience.

> --
> 2.47.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113413): https://lists.openembedded.org/g/openembedde=
d-devel/message/113413
> Mute This Topic: https://lists.openembedded.org/mt/109402043/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

