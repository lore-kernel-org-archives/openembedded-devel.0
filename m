Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F54C678DC
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 21:53:38 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.6264.1692309210279748157
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 14:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Vat3D57f;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-56d263da4f2so257100eaf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 14:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692309209; x=1692914009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RUfL/unsKsXsT9UCHjB3fBmncCgCuq1R+PI9IvVg0M=;
        b=Vat3D57f9RE2w5RECtO3wpM59y8M+qrwq7RzasKv19EmLM3iKthIg85egqkuQVXbiq
         NIW3RvVQOYN+XUJhXeBea5D5cEF3b0qH311gntnRerDtMf3DsZoy2KqHuFDVQUs9PJiq
         5dUSKzl1P6rVNoWlAJXuIvR2TLdQ7OqJovTCRQiYzbAzmMrD7y2ccWcYYHHJ2D0R1QTP
         yrNUwjWaXftPWNIzTUjrDG3HjNIwyRDJtbTkHKGM/ETuxKSTjgTEGNLtovPfrG4zibrP
         hfN/10pvaHotLjTfGNdBMFcmOiPsHKYHqd0AmowJX8ebVxgc5pVkcqx4EhrO8gSBgOf+
         4ivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692309209; x=1692914009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RUfL/unsKsXsT9UCHjB3fBmncCgCuq1R+PI9IvVg0M=;
        b=K63tg18470PXsAqfclmI/g9IqcA0EGGPnKXaz0PbFOuYZdC7S8B+SEN51jD0k7vd56
         AWVHX1YJtomt/KQGA8Bani7krszAivuaWUhwjIZxMiAbUD4Ug8YMF6Ej5a2I0ScmKIer
         /w0V3INA86dBVr3qVQqslxTtjfw8+WHaZV4qb6wOEVm4wv8fgl0D6H1YgioXTh3eGkFD
         253gu/dtal45pr4lq92teosV/j6wFTo8fb45B4h4v+kwawHj/edReHootzTO5xA3ft0y
         /CrAobRnjHtTgCOB8et+Ciz7/eZNul3Jzgaq3Gs12YSooWoZWavDNO3EDoS2lbXwWdHe
         FS6g==
X-Gm-Message-State: AOJu0YykhelBgwjmWFUonQUxwx7brgakt7Y/KwLVu4JjQnTTgd6KH2Qk
	7Ke4iga3aTnHqtSbfBwoNGJJx/mkRJaRtv9DPo8HRiLJfnQ=
X-Google-Smtp-Source: AGHT+IG6QJCfJtKgG0BmC769yRjaNSBNyyZXjhyMnAZvNNSBlHa29g4hHvnLP0rt/elpOfjyek3tihVjGuYiXQbcNe4=
X-Received: by 2002:aca:2108:0:b0:3a5:98b4:c137 with SMTP id
 8-20020aca2108000000b003a598b4c137mr834956oiz.51.1692309209292; Thu, 17 Aug
 2023 14:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230817084423.20928-1-tymoteusz.burak@3mdeb.com>
In-Reply-To: <20230817084423.20928-1-tymoteusz.burak@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Aug 2023 14:53:03 -0700
Message-ID: <CAMKF1sqMsA84nu3s6oKDNOtePcwYSA_xkBXdkDUzfVTdE6nduw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libfaketime: add recipe
To: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
Cc: openembedded-devel@lists.openembedded.org, piotr.krol@3mdeb.com, 
	tomasz.zyjewski@3mdeb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 21:53:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104475

On Thu, Aug 17, 2023 at 1:45=E2=80=AFAM Tymoteusz Burak
<tymoteusz.burak@3mdeb.com> wrote:
>
> This commit adds the libfaketime library recipe, which provides time
> manipulation capabilities for testing and debugging purposes. libfaketime=
 allows
> developers to modify the system time reported to applications, aiding in =
scenarios
> where accurate time emulation is required.
>
> GitHub Repository: https://github.com/wolfcw/libfaketime
>
> Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
> ---
>  .../recipes-test/libfaketime/libfaketime.bb   | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 meta-oe/recipes-test/libfaketime/libfaketime.bb
>
> diff --git a/meta-oe/recipes-test/libfaketime/libfaketime.bb b/meta-oe/re=
cipes-test/libfaketime/libfaketime.bb
> new file mode 100644
> index 000000000000..fadf9c432292
> --- /dev/null
> +++ b/meta-oe/recipes-test/libfaketime/libfaketime.bb
> @@ -0,0 +1,34 @@
> +DESCRIPTION =3D "A library for faking the system time in user-space prog=
rams"
> +SECTION =3D "libs"
> +LICENSE =3D "GPLv2"

Use SPDX string for LICENSE filed.

> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +PV =3D "v0.9.10"

Name the recipe libfaketime_0.9.10.bb and remove it here.

> +
> +SRC_URI =3D "\
> +    git://git@github.com/wolfcw/libfaketime.git;branch=3Dmaster;tag=3D${=
PV};protocol=3Dssh \
> +    "

Please use https protocol.

> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE +=3D "\
> +    EXTRA_FLAGS=3D'-Wno-error=3Dnonnull-compare' \
> +    "
> +
> +do_configure[noexec] =3D "1"
> +do_compile () {
> +    oe_runmake
> +}
> +do_install () {
> +    install -d ${D}${libdir}/faketime
> +    oe_libinstall -C src libfaketime ${D}${libdir}/faketime
> +    install -d ${D}${bindir}
> +    install -m 0755 src/faketime ${D}${bindir}
> +}
> +
> +PACKAGES =3D+ "lib${PN}"
> +
> +FILES:${PN} =3D "${bindir}/faketime"
> +FILES:lib${PN} =3D "${libdir}/faketime/*"
> +
> +INSANE_SKIP:${PN} +=3D "dev-so"
> +INSANE_SKIP:lib${PN} +=3D "dev-so"
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104450): https://lists.openembedded.org/g/openembedde=
d-devel/message/104450
> Mute This Topic: https://lists.openembedded.org/mt/100796818/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

