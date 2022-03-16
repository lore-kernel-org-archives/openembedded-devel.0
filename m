Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1D5C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 15:58:48 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web12.26794.1647446327110803200
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oNnqLz1T;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id z66so2198975qke.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LvxnHg8orYfVL7/ZzXaqi0qMMroVER9KAMVV+G/DsOM=;
        b=oNnqLz1TPsvA/oXqFzxXvSLRH+BQsdf7C/8kDUxjmqY81kvy3FaC5OjO99IC+t/NQP
         u4eNJdKHSSiQitIGQnx0prUxUYsrcYKr44nibSjfngSr6zJ7joleYyxfXleh1g0HV8CN
         33dw3EgXa+dn25ywsr1fjKdURYWyr6WOftVSAErHQd6Adot350VZKP1aQGIkO5P3cpHl
         NzjJxNPY1IRXqAw1fAKdErBcfkHycVQTCYKipu5eNXh+IqhvVeCIRHGVxb7tlzejehOS
         S8maK2wVbKFXiT7f5mTs90ndVFjmHlbF8Jdc5tkiqCjzBwwaXwGB4WwxRwqorM/pjNIA
         XCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LvxnHg8orYfVL7/ZzXaqi0qMMroVER9KAMVV+G/DsOM=;
        b=ahmKC1xhkmxNOxJl10H7LwasrHDny6VBOvEPY9BKfU3FButOBcAet5qK8/0LODze+0
         VlPSnPcW0DFr1qf6kIgqejiaPbHUeMr6gpE5Fe1o6UI6XTQG7E4ONicCFjPvwSDVKZSQ
         8KeydImcqNPgkwrGqKp0wHh6KozKpuEmk9+fSF8ZpLsBx9RD5XCicKSiGWX9/1KTfFT8
         KeAa8IcF+fFqgVLDcEYYeDrKyKj62kfrrX1DH6hMsawS1w3mvQiqnnPl2IwUwHebc318
         5reRNPO6TNypgezEYTG3v3Zu2yaMZjqXKvWAVlQv68LVkIJ6gdlvlDZQpY+SHy2KHXYv
         knjg==
X-Gm-Message-State: AOAM530AygE1cGEwfr6FKAqudiMuth40Iwx1ALtCCR71o6A2tAU9Bieu
	ErXt/S/QSAZLpBFTDHW1x/xNUL0VSDTv7p85jNI=
X-Google-Smtp-Source: 
 ABdhPJw2NvxSRV4Lpsx5hF3xWHvznf3gHibEYjCgpXE+DbjECOjT1gKxJGePW76Xxsed5KuWy7kax0Vx98rsa7H9MFA=
X-Received: by 2002:a05:620a:2993:b0:67d:7116:a642 with SMTP id
 r19-20020a05620a299300b0067d7116a642mr365105qkp.180.1647446326068; Wed, 16
 Mar 2022 08:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <1647419641-81593-1-git-send-email-wangmy@fujitsu.com>
 <1647419641-81593-4-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1647419641-81593-4-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Mar 2022 08:58:19 -0700
Message-ID: 
 <CAMKF1soOBw-dcU1vm_kLAUn2f3ZEdoNrpfc+sG9wfwmHTjc7Aw@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-asn1crypto: upgrade 1.4.0 ->
 1.5.1
To: wangmy <wangmy@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Mar 2022 15:58:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96023

This recipe has moved to oe-core. Please regenerate against latest
oe-core/master and submit it to oe-core ml

On Wed, Mar 16, 2022 at 1:34 AM wangmy <wangmy@fujitsu.com> wrote:
>
> License-Update: year updated to 2022
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...thon3-asn1crypto_1.4.0.bb => python3-asn1crypto_1.5.1.bb} | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-asn1crypto_1.4.0.bb => python3-asn1crypto_1.5.1.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-asn1crypto_1.4.0.bb b/meta-python/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-asn1crypto_1.4.0.bb
> rename to meta-python/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
> index c052cb8c82..5fa2ed987c 100644
> --- a/meta-python/recipes-devtools/python/python3-asn1crypto_1.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
> @@ -2,12 +2,11 @@ DESCRIPTION = "A fast, pure Python library for parsing and serializing ASN.1 str
>  HOMEPAGE = "https://github.com/wbond/asn1crypto"
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=7439e38f5e04ff62fae436184786b7ca"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b5cda97fbd7959ad47a952651a87051a"
>
>  PYPI_PACKAGE = "asn1crypto"
>
> -SRC_URI[md5sum] = "00bf5b72d37778e62cc73b1d8909ae27"
> -SRC_URI[sha256sum] = "f4f6e119474e58e04a2b1af817eb585b4fd72bdd89b998624712b5c99be7641c"
> +SRC_URI[sha256sum] = "13ae38502be632115abf8a24cbe5f4da52e3b5231990aff31123c805306ccb9c"
>
>  inherit pypi setuptools3
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96014): https://lists.openembedded.org/g/openembedded-devel/message/96014
> Mute This Topic: https://lists.openembedded.org/mt/89817413/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

