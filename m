Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 797DAC32793
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 02:10:29 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.6476.1661307021586994211
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 19:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gyu/V7Vs;
 spf=pass (domain: gmail.com, ip: 209.85.128.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-324ec5a9e97so425375027b3.7
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 19:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=ryonVz+PiXel8p2CNS/P8CfZ2nlYDIR1f727CBZACoo=;
        b=Gyu/V7VskEjED6bNMdxGgSDyAvRajGHq5Qm8ymzxrShWvNpYlOcF9sxUSNnF+/Ds9H
         ckAEvvr+zmoApFbOtgiZNchPCHfzqlGbDvYklxuuBOVujg4cJUVyHkHFp+fiIUKc2Em9
         bv0xrp51EiVALJ7cw06gLQ/zMoBJVXt5Xvda/kvX9qG6EjykmNc7v1SwJNjIkpjzkSlX
         ylJc6etM44ulFeILV25UCj1gYm7Ft5n922HK0S2NuPhEd5pnSBZJHpoyfcp18IQKLK/N
         f60MLZpG9TuNnGjjowcIMq0c23R5wpMIjeCI7Unw0DndI+uyRP9E8LimdoXWVFZLKGMb
         kamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=ryonVz+PiXel8p2CNS/P8CfZ2nlYDIR1f727CBZACoo=;
        b=dfxwCZIwiWG4xlNhCIu2gCjE5+VycnpU5LSq1hi9W/1ZaB0FAPt/7kTRDcXM+i3qkP
         vX6pEkKwK6nRIkf/gVnYEXS7W3h8WnQ8NLqJAlftgkMCbuOZmocH3dSNp+C9lmJKnoKS
         /hBksWiKmCjL/3zbQP1mnHnBY+9yTsjwAONR7f3vFvDCt8qlZyjF25/JWCyhWiWOdGz5
         V6W+2UFD77uL4Fj0kPsT+Iq/I2F1KL8bgNu6Raqzbm+EUUYFp0GzDNuXes2ZJPENNqof
         mSTY4+q/zzirtklywR6SZdmPwF7oGPJqgQWGKejjmf4ZBJuyKgHv8r8/BbvHWnzSsRnI
         e9yg==
X-Gm-Message-State: ACgBeo2MO0Ga8Lr8R+viJUxjAumVswBGoRDOZTGvj5HMIf4G4tZeu6/G
	iUSt0vxRWdEbnvemBuebEsVS5ptn0uc+vW+Z2vY=
X-Google-Smtp-Source: 
 AA6agR521/J+Rwm1BbEhzH9zOh4y8fsK0WcMRQDODZAcEZmCZRhiSs76oWBCt3lU0yQ399Yt69Y9L1plu4l6Uu/t2gk=
X-Received: by 2002:a0d:eb42:0:b0:339:4059:fd62 with SMTP id
 u63-20020a0deb42000000b003394059fd62mr20900722ywe.139.1661307020745; Tue, 23
 Aug 2022 19:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <1661243978-4657-1-git-send-email-wangmy@fujitsu.com>
 <1661243978-4657-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1661243978-4657-2-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Aug 2022 19:09:54 -0700
Message-ID: 
 <CAMKF1spD_9M0icztJK3KK6wumon+4rH36OZhR_XMzO6AdkvJHQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] libbpf: upgrade 0.8.0 -> 1.0.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Aug 2022 02:10:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98414

This does cause issues on musl

https://errors.yoctoproject.org/Errors/Details/669389/
https://errors.yoctoproject.org/Errors/Details/669389/

On Tue, Aug 23, 2022 at 1:40 AM wangmy <wangmy@fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../recipes-kernel/libbpf/{libbpf_0.8.0.bb => libbpf_1.0.0.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-kernel/libbpf/{libbpf_0.8.0.bb => libbpf_1.0.0.bb} (92%)
>
> diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_0.8.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.0.0.bb
> similarity index 92%
> rename from meta-oe/recipes-kernel/libbpf/libbpf_0.8.0.bb
> rename to meta-oe/recipes-kernel/libbpf/libbpf_1.0.0.bb
> index 76fd862142..b6ec9f77bc 100644
> --- a/meta-oe/recipes-kernel/libbpf/libbpf_0.8.0.bb
> +++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.0.0.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
>  DEPENDS = "zlib elfutils"
>
>  SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master"
> -SRCREV = "86eb09863c1c0177e99c2c703092042d3cdba910"
> +SRCREV = "a0325403afa8a3eca0d3a3e43f43784dc6b47511"
>
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  COMPATIBLE_HOST = "(x86_64|i.86|aarch64|riscv64|powerpc64).*-linux"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98382): https://lists.openembedded.org/g/openembedded-devel/message/98382
> Mute This Topic: https://lists.openembedded.org/mt/93200193/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

