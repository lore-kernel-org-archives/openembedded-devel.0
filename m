Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D4DCD37BF
	for <webhook@archiver.kernel.org>; Sat, 16 Sep 2023 15:55:02 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.14285.1694879693965524466
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Sep 2023 08:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HwPMEjGj;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1c26bb27feeso1930041fac.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Sep 2023 08:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694879693; x=1695484493; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3J3Q/gyjc2gplPCrV3GPABizk1Ryu0YCJmH+kA9BRg=;
        b=HwPMEjGjAZ8eYJOhZ6Mq6IsyygWahVEqkx8K7tBFg4QxRVdibLlc74qEA5Bgb8Kkxb
         SW8LhGNPdE9ehLOpm0p5EEKNXJuxRIlUPGHO1NpYJP/fa8yrkBFkQQLUsk8p7gaXjXPb
         TFj/qV6/UZPJiUfzG6qvT7ytLJE8zUI67m1BekwrWWqC7j3FeMlnu+omYtUEnJDns0GU
         279p14y+qjTvO6PDv3JjvMqw0U23U3GJmm7IMXFDbb9f+oADbBbwf701yoDCq8c+Ieo8
         skyUCPX5OITsFQb8Ccn/jzdEHjzRVeTlujhKuDMlJBX4bH/hmmKo8RDNY5elH6OZsTUy
         yeCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694879693; x=1695484493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I3J3Q/gyjc2gplPCrV3GPABizk1Ryu0YCJmH+kA9BRg=;
        b=uGyMWcBAlZoiJ90OHTx6chJrGT/+34dAo4EahMuijRhPN3S47IE7ZXtNLuP30IWafg
         f32R+92BTaeji+frMFF6/FHfsunqis+A2zc6ibYI4LyGbWe5fKTUgDpn7tOEDDegVjLK
         aiC9IXVJ2/CzzzuxjDZe5AdD01DuthTOBVwqXYEbbpdqBlDoBi6nJJN511Hzn85twaxa
         0dFBWfavBmfNBDuxjz8Cg6dPh5pGGuuSGQIwQmpGCy5Oh3hjmlI1w4LNaPsEfj7Pll2t
         qiC/l3EYU0amyI8RnKcuSMiH5Ng3N8Yiea+YpjQh6J9cG5YPnRaM3eECGXICY0k1c8Ir
         rFlw==
X-Gm-Message-State: AOJu0Yz4Hr/zIcBPo3JfREU9k4ntpJuIXXEQ4tXno+PEPzrifhNo9Gsk
	canDoB+L0uMfzTRKvEHGrX8sQ1DD270iowcu3iE=
X-Google-Smtp-Source: AGHT+IEKDH6x0984b3et49VvwAFLdujxlkhpSQ/HC6n5WhPO7/isbdYoU83LYgOLin8DtqB9ACPQisny1tb0DsNQIC4=
X-Received: by 2002:a05:6870:ac21:b0:1d6:567c:deb4 with SMTP id
 kw33-20020a056870ac2100b001d6567cdeb4mr5142045oab.42.1694879693085; Sat, 16
 Sep 2023 08:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230908114242.1417439-1-f_l_k@t-online.de>
In-Reply-To: <20230908114242.1417439-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 16 Sep 2023 08:54:26 -0700
Message-ID: <CAMKF1srwFz8JWPDE+0Xn4UzveanO5-FhyL5OUTsGeJOrVCqe0g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] libxmlb: update 0.3.10 -> 0.3.14
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Sep 2023 15:55:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104902

This is failing ptest run

You can reproduce it with

bitbake meta-oe-ptest-image-libxmlb
runqemu kvm meta-oe-ptest-image-libxmlb
ssh into qemu
cd /usr/lib/libxmlb/ptest
./run-ptest

ERROR:../git/src/xb-self-test.c:188:xb_common_content_type_func:
assertion failed (error =3D=3D NULL): Failed to open file
?/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/libxmlb/0.3.14/git/dat=
a/test.desktop?:
No such file or directory (g-file-error-quark, 4)
not ok /libxmlb/common{content-type} -
ERROR:../git/src/xb-self-test.c:188:xb_common_content_type_func:
assertion failed (error =3D=3D NULL): Failed to open file
?/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/libxmlb/0.3.14/git/dat=
a/test.desktop?:
No such file or directory (g-file-error-quark, 4)
Bail out!
FAIL: libxmlb/libxmlb.test (Child process killed by signal 6)
SUMMARY: total=3D1; passed=3D0; skipped=3D0; failed=3D1; user=3D0.0s;
system=3D0.0s; maxrss=3D5120
FAIL: libxmlb/libxmlb.test (Child process killed by signal 6)

On Fri, Sep 8, 2023 at 4:42=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wrot=
e:
>
> This update is required for latest appstream release
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../libxmlb/{libxmlb_0.3.10.bb =3D> libxmlb_0.3.14.bb}        | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-gnome/libxmlb/{libxmlb_0.3.10.bb =3D> libxmlb_0.3=
.14.bb} (86%)
>
> diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb b/meta-oe/re=
cipes-gnome/libxmlb/libxmlb_0.3.14.bb
> similarity index 86%
> rename from meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb
> rename to meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.14.bb
> index 61abd07fd..d46811124 100644
> --- a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb
> +++ b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.14.bb
> @@ -5,12 +5,12 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1803fa9c2c3c=
e8cb06b4861d75310742"
>  SRC_URI =3D "git://github.com/hughsie/libxmlb.git;branch=3Dmain;protocol=
=3Dhttps \
>             file://run-ptest \
>             "
> -SRCREV =3D "a6cac6a715d57c393bbddee4d0381ad943341af9"
> +SRCREV =3D "aa577b276adc66564f5777f9a522ca3bf0bfa65e"
>  S =3D "${WORKDIR}/git"
>
> -DEPENDS =3D "glib-2.0 xz"
> +DEPENDS =3D "glib-2.0 xz zstd"
>
> -inherit gobject-introspection gtk-doc meson ptest-gnome lib_package
> +inherit gobject-introspection gtk-doc meson ptest-gnome lib_package pkgc=
onfig
>
>  PACKAGECONFIG ??=3D "\
>      ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104802): https://lists.openembedded.org/g/openembedde=
d-devel/message/104802
> Mute This Topic: https://lists.openembedded.org/mt/101234583/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

