Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9B9C3DA6F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 07:54:54 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.6089.1692863686426161013
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 00:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ekcLDUs6;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1cc61f514baso2885648fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 00:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692863685; x=1693468485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66nm8SL/1Y5U+VjCzEz8UchOMn9NTuwijtfGBn0VYIM=;
        b=ekcLDUs6VwoZ9kq8ScS5k1f5Q8MGXtx4pqtFf3Q6GRYHqISwQAOUXuUk7B+I4RhTvD
         ODd2Gi8DYd31wUMQyJHKF+yFCjZy8JxE/0wkJeCbdts6k5NNgt5bgwMWtTCLauYouAJ1
         UqXhmYOsA4OrgFeBB8Vd0iGJaRu7WgzDdbZwt3yKmKPYfprRZn2iUWZP5sDqDu5s6+Az
         8usfI8k5D4eVWgCdtURI/1vtP1lvq5AV5nCUxBB4CyYnNdUEzves053GLyfmXYoSARM2
         f5KKjAB3h8dPJ28rAB1ElPuZdor3RPYz5VHbH3T6lhREetoe310d9KDxjuLm3+OzU6wH
         ffzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692863685; x=1693468485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66nm8SL/1Y5U+VjCzEz8UchOMn9NTuwijtfGBn0VYIM=;
        b=c1qNUstfhH5k45bLlTLGTtRayXzBHZrZ8YCtfkJC0hifYtGg3mP/AebDbS9zI00tNs
         Flg5UXLMfPUsFjrNN0tix4+zEKaC5FRVwGKxbLj6zLnDd/Zu9JReG+3PlJHxT8HwmSQ0
         HJBpFVSQrg9y9ZfDmd3VbWAA2a3D7GHecrdhH4V33gCvNWzMhLYBp2UPSwYiDcOzcbbK
         rkXJv4TTUAkhDxQc2wf3VeHWnrRSNAjOdbLl430ysk+M1OyoGoGhpwWmuWrCxAgB+vWc
         2NQngZZrKdioQkMtA9LDMNTNT5ELgVy3pgqjgMJKUTTJ8fXW5qM3iVBGZIEaoHDeapsi
         VzsA==
X-Gm-Message-State: AOJu0Yw8LHRzYRa0VWPo0j3RHktVGKgzxvE2SOpNKf5q1mksYrcaQPVR
	A9pPpzI6xdgIPH2fEfgeJsONnUWiAHxucxrND8+VlA74z3xMtw==
X-Google-Smtp-Source: AGHT+IGejmZPjLFdVeBKp+ZxEzxT3IcFdPWHzcUw5DhXgNrM6o+Zkoj8IWNiunoKJoZU2wDsMFeUMES5pZb3RLqFZg0=
X-Received: by 2002:a05:6870:968c:b0:1b0:2686:5b23 with SMTP id
 o12-20020a056870968c00b001b026865b23mr16418227oaq.51.1692863685465; Thu, 24
 Aug 2023 00:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230823085310.339821-1-tymoteusz.burak@3mdeb.com>
In-Reply-To: <20230823085310.339821-1-tymoteusz.burak@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Aug 2023 00:54:19 -0700
Message-ID: <CAMKF1spPM9dRnHdyxuXbDXQn_x=uQ6b0WUGKzTaRTpfDnCP0vQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v3] libfaketime: add recipe
To: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
Cc: openembedded-devel@lists.openembedded.org, piotr.krol@3mdeb.com, 
	tomasz.zyjewski@3mdeb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 07:54:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104557

fails to compile with clang

https://errors.yoctoproject.org/Errors/Details/732866/

-Wno-nonnull-compare seems to be not a portable option

On Wed, Aug 23, 2023 at 1:53=E2=80=AFAM Tymoteusz Burak
<tymoteusz.burak@3mdeb.com> wrote:
>
> This commit adds the libfaketime library recipe, which provides time
> manipulation capabilities for testing and debugging purposes. libfaketime=
 allows
> developers to modify the system time reported to applications, aiding in =
scenarios
> where accurate time emulation is required.
>
> I deleted the extra flags altogether as they seem to be only necessary
> for old versions of this project (0.9.6).
>
> CC: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
> ---
>  .../libfaketime/libfaketime_0.9.10.bb         | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.b=
b
>
> diff --git a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb b/met=
a-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
> new file mode 100644
> index 000000000000..7500e57658aa
> --- /dev/null
> +++ b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION =3D "A library for faking the system time in user-space prog=
rams"
> +SECTION =3D "libs"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +SRCREV =3D "d475b925943ad404c6c728ac868dc73949e7281c"
> +SRC_URI =3D "\
> +    git://git@github.com/wolfcw/libfaketime.git;branch=3Dmaster;protocol=
=3Dhttps \
> +    "
> +
> +S =3D "${WORKDIR}/git"
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

