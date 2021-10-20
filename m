Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41418C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 11:45:49 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web08.6874.1634730348252553844
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 04:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U98kgT0I;
 spf=pass (domain: gmail.com, ip: 209.85.160.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id t16so2703685qto.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 04:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2O5fFjxhK5qViKWegKzYDFnnLzz1Choiwi2BIUQ7vKg=;
        b=U98kgT0IQlPuQ1KV0PWxndZhzDzPX20bD6oCD1fzTFOcjgL4zvBiwzTxodGqzFCnMG
         rd9YJgdbyOhBdk526KVzNhyWzXAVGRWmP6xwLyNxkRhzbATEYpu0UHNF2ZeRZF549ICV
         StphbRfI4347kR73U0VMjoPBZPGDsVqnychPITemzju7LlXpjYsK780TJqM4caw2zl8C
         zO0D4sjubPc2vfwSXsYoeI87s1JmFI2dTCwqQvUPJ9JOmEDRpTT1R+fFpCCl6yt0AuDA
         zhtWShqtkCl82D8b2thLp5Ej8UIBo4hI9gKgN1c7rHaf1ku8SWqfJ06zBuHvr8tYNKSg
         0T1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2O5fFjxhK5qViKWegKzYDFnnLzz1Choiwi2BIUQ7vKg=;
        b=RcQFYbkOlqK3kk/JtGIXx+/ajgrHF2MeJ7JSAwt8jLj2yjALAfVVrfxBPZSqOZYLPt
         QqxVTs1ipsHBLBVmTS4Oltg5jE5FY5ndA5JT3SPOuiD/LlJgkAKb1xueOMJnMGE5UORH
         mW2qt8UqKX2A2owxtQEMnArsxekO91XnZd1Ovb3hG78pDAyZNIGqIyVlZSWRPOwxSBo9
         QSp2UrZFTqm7RBjHGzVSQOTjN8J8IcRMEG1BLxUFkRk+BvVeUSibhm9AhN8cMuCYRdqS
         ugMs7CUOd0XSuwjWV8XyBbHRLmlD6YD75fpzYY6EM2NXf5y07hvg9ddzNTh4BzvPH13P
         RqyQ==
X-Gm-Message-State: AOAM532IKVC4TYXrRyfHJXUaqehEZW6FFj6zJmW+DfFDhjN3y1yF2wBA
	R2xvvTuZtuL5rsQ6wPkh1v1fa67CV+TzINva4y0=
X-Google-Smtp-Source: 
 ABdhPJxjFA9sEkQhtKFZsP0rremR+rV81hg+QWBCP0haYf/Ww5GyMn8YukaUioWZoS7/fvzkpQOVWTECLTKNPdNZQR0=
X-Received: by 2002:a05:622a:190e:: with SMTP id
 w14mr6538990qtc.112.1634730347198;
 Wed, 20 Oct 2021 04:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211019131925.21725-1-koansoftware@gmail.com>
In-Reply-To: <20211019131925.21725-1-koansoftware@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Oct 2021 04:45:21 -0700
Message-ID: 
 <CAMKF1sqso8ZijOMFVoEYWZG70W1rAK9ih3AthPOvjV3_A+q-sg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] bluepy_git.bb: Added recipe for
 BluePy Python interface to Bluetooth LE on Linux (v2)
To: Marco Cavallini <koansoftware@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Marco Cavallini <m.cavallini@koansoftware.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 11:45:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93480

fails during install now on musl/x86 arm/glibc

https://errors.yoctoproject.org/Errors/Details/613446/
https://errors.yoctoproject.org/Errors/Details/613456/

On Tue, Oct 19, 2021 at 6:19 AM Marco Cavallini <koansoftware@gmail.com> wrote:
>
> From: Marco Cavallini <m.cavallini@koansoftware.com>
>
> Signed-off-by: Marco Cavallini <koansoftware@gmail.com>
> ---
>  .../recipes-connectivity/bluepy/bluepy_git.bb   | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
>
> diff --git a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> new file mode 100644
> index 000000000..03b1562b6
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "Python interface to Bluetooth LE on Linux"
> +HOMEPAGE = "https://github.com/IanHarvey/bluepy"
> +SECTION = "devel/python"
> +
> +DEPENDS = "${PYTHON_PN} glib-2.0"
> +RDEPENDS_${PN} = "bluez5"
> +
> +LICENSE = "GPLv2 & PD"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"
> +
> +inherit setuptools3 pkgconfig
> +
> +SRC_URI = "git://github.com/IanHarvey/bluepy.git;protocol=https;rev=7ad565231a97c304c0eff45f2649cd005e69db09"
> +S = "${WORKDIR}/git"
> +
> +TARGET_CC_ARCH += "${LDFLAGS}"
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93464): https://lists.openembedded.org/g/openembedded-devel/message/93464
> Mute This Topic: https://lists.openembedded.org/mt/86439385/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

