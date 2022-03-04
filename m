Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EACE4C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 13:43:04 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.7015.1646401383672159466
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 05:43:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=bGuk6Inz;
 spf=pass (domain: burtonini.com, ip: 209.85.221.48,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f48.google.com with SMTP id r10so12784250wrp.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 05:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=N/vkKYwQL99nXtQLUlDt5maHn59UdpSx2u7YEFGuRYQ=;
        b=bGuk6Inz9HvHh4EqnKcGHOtzmSigbnieh1x896EGW0jM0z/R6CTlyQzaUUM4dijjPf
         DR/tFbqA/KG8A5dv2Xl5mIJI6I6u7aDp4rZ2HmeUJyNP+Hc3239i6puvbw5dY/Nq+MYt
         xOEVEYg89/32GIZMj3X8Dee8ZWjNewGwOUP/qd5HhEe2nYmaYP07HMbtdt0Wu3kReLSP
         Iuzr+DCb6Ltu9mhOqTsZHI/gki39AsDdoT1qU10YhkCz63mgWxfxUpXtA1XquIp5QcyB
         bxbepqaQ5bAz1ZjURMysWsSUz9FU+dBOQm9oMAEH6u0edtVtL3YMym1+hPRPHkvKILcW
         bjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=N/vkKYwQL99nXtQLUlDt5maHn59UdpSx2u7YEFGuRYQ=;
        b=Cv64zjAXDMt1eVKPvFYdsm/qwitxycLT2UHs1jyuseVgFXggk/ar0yQU4O10HkIE7Y
         5v+30nsBPkzCiSCH9GLVk5du448NGLd0uMeSQaxJ/Hizv+K/D2r/aEs2SmPYhl/z1Aop
         Ln9oawGBTMV7LxMXBT1/5dPDZhPDI6UtePOJ7b/XVSswMsXuRIoK4WDYWsqC3NCZnfCN
         1ro6K8Ai3aZZI9XA1PmbP+PAdikpp478z9puuXANg4J4IT4OfpSzuga5VyYnOcPVMTds
         gaIofL63EF29wkDObAXl8VaURDXbWxhNVtL9oPPoeeIqMwsBQSH1gjuqfGjdqscYU9fN
         cHQg==
X-Gm-Message-State: AOAM533LR9fPNd4Vp14mYxpvZMZzF3teIUE16OGBq0JPvY6iX10MD6jc
	bNE7kdNOmEk6Fq8xTOV9w1dRY6Mn3EQ8PgjSUHOLYBZHs8Mi8A==
X-Google-Smtp-Source: 
 ABdhPJxv6IM+x4inEpJactDcqvA9zQhXvPvsZsAuh86mFFK6um7FPcyeJsW4o/zj4K66ovIb5ivBN9lcHPyEehozsRs=
X-Received: by 2002:a5d:6f0c:0:b0:1ef:d28e:8040 with SMTP id
 ay12-20020a5d6f0c000000b001efd28e8040mr18353422wrb.405.1646401381321; Fri, 04
 Mar 2022 05:43:01 -0800 (PST)
MIME-Version: 1.0
References: <20220304134220.2254908-1-ross.burton@arm.com>
In-Reply-To: <20220304134220.2254908-1-ross.burton@arm.com>
From: Ross Burton <ross@burtonini.com>
Date: Fri, 4 Mar 2022 13:42:50 +0000
Message-ID: 
 <CAAnfSTsCm7yVOPfuJd4fXkp_fZzrP3MfyeOKyZuRt0x+_DyBHQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] ufw: port to setuptools, use setuptools_legacy
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 13:43:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95784

Obviously this depends on the addition of setuptools_legacy to
oe-core, which is on the list now.

Ross

On Fri, 4 Mar 2022 at 13:42, Ross Burton via lists.openembedded.org
<ross=burtonini.com@lists.openembedded.org> wrote:
>
> This package has a traditional setup.py which has a custom install command,
> which isn't supported with the modern wheel/pip installation method.
>
> Until upstream has moved away from distutils, use setuptools_legacy so
> the installation is correct.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../ufw/ufw/setuptools.patch                  | 20 +++++++++++++++++++
>  .../recipes-connectivity/ufw/ufw_0.36.1.bb    |  3 ++-
>  2 files changed, 22 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/setuptools.patch
>
> diff --git a/meta-networking/recipes-connectivity/ufw/ufw/setuptools.patch b/meta-networking/recipes-connectivity/ufw/ufw/setuptools.patch
> new file mode 100644
> index 0000000000..ad5391cb98
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/ufw/ufw/setuptools.patch
> @@ -0,0 +1,20 @@
> +Move to setuptools as distutils is now deprecated.
> +
> +Upstream-Status: Submitted [https://code.launchpad.net/~tgamblin/ufw/distutils-to-setuptools]
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +diff --git a/setup.py b/setup.py
> +index cb67a6a..de648d3 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -25,8 +25,8 @@
> + #
> +
> + from __future__ import print_function
> +-from distutils.command.install import install as _install
> +-from distutils.core import setup
> ++from setuptools.command.install import install as _install
> ++from setuptools import setup
> + import errno
> + import os
> + import re
> diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
> index c427e4ffde..70216a85e3 100644
> --- a/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
> +++ b/meta-networking/recipes-connectivity/ufw/ufw_0.36.1.bb
> @@ -12,12 +12,13 @@ SRC_URI = "https://launchpad.net/ufw/0.36/0.36.1/+download/ufw-0.36.1.tar.gz \
>             file://0001-optimize-boot.patch \
>             file://0002-add-an-option-to-specify-iptables-location.patch \
>             file://0003-only-make-one-reference-to-env.patch \
> +           file://setuptools.patch \
>             "
>  SRC_URI[sha256sum] = "1c57e78fbf2970f0cc9c56ea87a231e6d83d825e55b9e31e2c88b91b0ea03c8c"
>
>  UPSTREAM_CHECK_URI = "https://launchpad.net/ufw"
>
> -inherit distutils3 features_check systemd update-rc.d
> +inherit setuptools3_legacy features_check systemd update-rc.d
>
>  RDEPENDS:${PN} = " \
>                    iptables \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95783): https://lists.openembedded.org/g/openembedded-devel/message/95783
> Mute This Topic: https://lists.openembedded.org/mt/89548753/1676615
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

