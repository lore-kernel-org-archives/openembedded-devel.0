Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A30EC54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 17:45:57 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.1260.1708710356341780937
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Feb 2024 09:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HbECMfUc;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-21e6be74db4so316998fac.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 09:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708710355; x=1709315155; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGFTWfQw5E4XuRkl79Eh0gX5cuNOn3zqTuN1qWBp1Rg=;
        b=HbECMfUcf9jLRDDN8L/1EV8UcgteRW2tU+r3kPsn91GxRqBr5GEdSr1L6hv8iZ3nDt
         a8Y13eCN3ZFRJpYyp0gSxx6g1+VLBR4oUl3n6kG0EOZ5vbR8K2aB02y78IX43ndRA2iT
         eTfndJVsOjzoTRb7XvyCW7u7oN0/rBpNYw45MuRPdfJR0JjA7pvTw1D2v51EbtxZcf6u
         eV/bzyMrPDQliJexqJsX8dtWT0frqlP/BxYoYkBejcM0ulT4JbKehqTmHSHMLT8Xwyzi
         GzmeWtcS+RqbMiWplFKvMDvbXTQFKlGqiZpGUx1KlNEOo3Edkd2e6jLkjrzNkwtiVVDD
         CzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710355; x=1709315155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGFTWfQw5E4XuRkl79Eh0gX5cuNOn3zqTuN1qWBp1Rg=;
        b=rdesWzgZY4HhqWJVeuTZMcOJIwIt2Z0c2d7ojt/h5QOl5ybOph0A7k5ZAtmXyHN/gX
         dgHihuztSc35ye+sUj+dYTnIS3OeDxSftuHIZD++fCroeP++IqNRjt4+2gFPYGYrvu7Q
         RL2ibuBTDXhE7RbrjYh6h9e0xu92E9Av/TIOsEFOhWC8LByxBHOMaLPTT9EFdr7rQfxg
         wNiohqzDtWF+gcPXRipIuqT0gPOWTAel3Cy4LIA316zkRMJZcRdZKcjv9WPT598V/8lr
         O2oUmEntQfBZ4hIETi8DednD+V42uw5LA9cI6+0lywuhOZxjdOySr6wUzpV6IeC/sHEj
         Jyug==
X-Gm-Message-State: AOJu0Yy5wuhGMh2qc8wxjTWhfzOorOEQuC8CmEdZHOvUd9za8fQqYF25
	cQpwLarJJHSeJIZuJCZHjcr3cRV9kW85quQZ9jkWKHTI7xmaQEe6jOQufaa7vWhCE12GruXmD9Y
	zPh4WBVzz+13lVTB1iUG+D/DY2OZG7QisLIlgkA==
X-Google-Smtp-Source: AGHT+IFLsZA39gK12NleNvIt2YG2fgkOfV84eT1tGAuhvPzSVETj7fb+RaevM4Y6774tLYZ4Zg9fsjd1ztHp0nTQgp4=
X-Received: by 2002:a05:6871:4585:b0:21a:33d2:849d with SMTP id
 nl5-20020a056871458500b0021a33d2849dmr527020oab.11.1708710354791; Fri, 23 Feb
 2024 09:45:54 -0800 (PST)
MIME-Version: 1.0
References: <20240223114012.699391-1-daniel.ammann@bytesatwork.ch>
In-Reply-To: <20240223114012.699391-1-daniel.ammann@bytesatwork.ch>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Feb 2024 09:45:28 -0800
Message-ID: <CAMKF1sqYiOX_cf13guYA+PofUbHVq3Usou8Srm6E54ga_LkOug@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] sdmon: add new package
To: Daniel Ammann <daniel.ammann@bytesatwork.ch>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 17:45:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109013

On Fri, Feb 23, 2024 at 3:40=E2=80=AFAM Daniel Ammann
<daniel.ammann@bytesatwork.ch> wrote:
>
> Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
> ---
>  .../packagegroups/packagegroup-meta-oe.bb     |  1 +
>  meta-oe/recipes-support/sdmon/sdmon_git.bb    | 23 +++++++++++++++++++
>  2 files changed, 24 insertions(+)
>  create mode 100644 meta-oe/recipes-support/sdmon/sdmon_git.bb
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 740835b217c..6e2012daea7 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -874,6 +874,7 @@ RDEPENDS:packagegroup-meta-oe-support =3D"\
>      raptor2 \
>      rdfind \
>      re2 \
> +    sdmon \
>      sdparm \
>      serial-forward \
>      read-edid \
> diff --git a/meta-oe/recipes-support/sdmon/sdmon_git.bb b/meta-oe/recipes=
-support/sdmon/sdmon_git.bb
> new file mode 100644
> index 00000000000..8f4b907c948
> --- /dev/null
> +++ b/meta-oe/recipes-support/sdmon/sdmon_git.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "Get SD card health data"
> +HOMEPAGE =3D "https://github.com/Ognian/sdmon"
> +
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +SRC_URI =3D "git://github.com/Ognian/sdmon;protocol=3Dhttps;branch=3Dmas=
ter"
> +
> +PV =3D "0.8.1+git${SRCPV}"

You can drop appending SRCPV here, its no longer needed.

> +SRCREV =3D "ef1aec457f04a50721f0259651cca9c946f11390"
> +
> +S =3D "${WORKDIR}/git"
> +
> +do_compile() {
> +       oe_runmake -C ${S}/src CC=3D"${CC}" CFLAGS=3D"${CFLAGS} -D_REENTR=
ANT -DVERSION=3D\"\\\"${PV}\\\"\"" LDFLAGS=3D"${LDFLAGS}"
> +}
> +
> +do_install() {
> +       install -d ${D}/${bindir}
> +       install -m 0755 ${S}/src/sdmon ${D}${bindir}/sdmon

you can just squash it into single cmd.

 install -Dm 0755 ${S}/src/sdmon ${D}${bindir}/sdmon

> +}
> +
> +FILES:${PN} =3D "${bindir}/sdmon"

This should happen automatically.

> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109011): https://lists.openembedded.org/g/openembedde=
d-devel/message/109011
> Mute This Topic: https://lists.openembedded.org/mt/104526496/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

