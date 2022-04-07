Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3EEAC43217
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:13 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.835.1649290739436861740
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Apr 2022 17:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mEjilFCJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id x5so3809688qvk.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Apr 2022 17:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GtlVupAZaZIjS6I2milZf0J2Tt7htfcmInY0zKgDdbI=;
        b=mEjilFCJD8jNYHxEYEcc636paKt4aQTxNKIhM4dYoTy1dEv6QZy9zkSyW3Xn8q1Kc+
         yNmQ3kjc6UjFyCjVuvlmEa5exGJRT5s1UDRkANU8EQmKfQfOetQdAvxspUUTUX08LIrt
         vO9LFdDxFtZkeET7ruJ8qvYDmlyU9zWP0oxsLliZT02ffw635RT4yV9+yGKiVXpUCTlC
         oVhZ5yCumdfjxc6WGnqy5UeWhdgTpc98vlZ2mmKJp5wKwuUaz3hV7Ao43j2WQxvvHt28
         yZXkdTiAhLrSeLVs071Rx93l4FgD0ry8yg3ylwww+iT0yxXi01UO7jvRYb96Cj7tVuub
         NukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GtlVupAZaZIjS6I2milZf0J2Tt7htfcmInY0zKgDdbI=;
        b=vHQTKfJfL7WGY2LYKbr2YBFZQSxorGYBCOR0vcVggtnKvpG0tOUPITMIiGVlWunrSb
         SEnWRaTizVFhlxZIDnFIXHFWdnpZpVO/FITDQSsrfkSmWbaJ6+eO6ZPLvA5v0gnwcDTN
         lalSxLONICQeYCs33x3Js7NoygZky6gm1JBwu0lqNOlyCR+fBgWLuGAzjXea7NGtAdVk
         4uYHrfcQjl0n1o4QbFakPTma+LWBoMaL9r3VA2HSLWmNVp6Ln4srG7chZlPGPDGieM3M
         pp10ThqS5LOUZuZbo05VB7s+u/cz1bfxxR6BUcdqWFCHASnTPuO8og8gcaYjPBrSkpB1
         22Mw==
X-Gm-Message-State: AOAM533Q+0DT/biDiuMkmjBAABK0iKp8GyVUHfAroUtGK06Jo2SlW1jU
	mpZueIrnFDjDV1bl2KrnL+qA1iatiySEiGZl3iU=
X-Google-Smtp-Source: 
 ABdhPJx7tXoEQeRW4QxhXbSYNVKuKlcox+8Kq2axl8MObxgNj5SaA93ZgUIaBr0hVbb+fYiJ4RDZBctSulpEa/q2+1I=
X-Received: by 2002:a0c:f9cc:0:b0:443:cec3:c9b5 with SMTP id
 j12-20020a0cf9cc000000b00443cec3c9b5mr9726262qvo.36.1649290738463; Wed, 06
 Apr 2022 17:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <1648784524-10262-1-git-send-email-zhengrq.fnst@fujitsu.com>
In-Reply-To: <1648784524-10262-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Apr 2022 20:18:32 -0400
Message-ID: 
 <CAMKF1sqaFVhYfKZ5JQML0qKxmWwCnktARuGPJ=YBmEEtJHeimA@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-kiwisolver: upgrade 1.4.0 ->
 1.4.2
To: zhengruoqin <zhengrq.fnst@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96442

fails to build

https://errors.yoctoproject.org/Errors/Details/654011/

On Thu, Mar 31, 2022 at 11:42 PM zhengruoqin <zhengrq.fnst@fujitsu.com> wrote:
>
> Changelog:
> =========
> This allows to buil with setuptools >= 61.2
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>  ...{python3-kiwisolver_1.4.0.bb => python3-kiwisolver_1.4.2.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-kiwisolver_1.4.0.bb => python3-kiwisolver_1.4.2.bb} (82%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.0.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.2.bb
> similarity index 82%
> rename from meta-python/recipes-devtools/python/python3-kiwisolver_1.4.0.bb
> rename to meta-python/recipes-devtools/python/python3-kiwisolver_1.4.2.bb
> index ab1ad717b4..48ff7df52d 100644
> --- a/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.2.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/nucleic/kiwi"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=f137eeae9cf8004d06830f6ab25b2d52"
>
> -SRC_URI[sha256sum] = "7508b01e211178a85d21f1f87029846b77b2404a4c68cbd14748d4d4142fa3b8"
> +SRC_URI[sha256sum] = "7f606d91b8a8816be476513a77fd30abe66227039bd6f8b406c348cb0247dcc9"
>
>  inherit pypi python_setuptools_build_meta
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96315): https://lists.openembedded.org/g/openembedded-devel/message/96315
> Mute This Topic: https://lists.openembedded.org/mt/90170580/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

