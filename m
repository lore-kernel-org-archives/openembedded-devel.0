Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4990EC61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 19:59:24 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web10.833.1675972756393658540
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Feb 2023 11:59:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=oRTeIj7S;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.217.46, mailfrom: brgl@bgdev.pl)
Received: by mail-vs1-f46.google.com with SMTP id h19so3318584vsv.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Feb 2023 11:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w9HcmbvuxzdUN1JequqJpCfXWgbCeptC8NDxVYjMV9o=;
        b=oRTeIj7SM1Crm85fQ0w57Ofx4fqFlZlwwG8TowjpmD89EDJzDH0eBrMFjUGF0aA54a
         ZHXOXE2ZPOfE2OjdsAwkN+R3WxHM6CNInJR5wY6cRgtAKBoYms2Rz40pOGsrBk94ayox
         00yvN0DyLBlW7qwF5RiGH8KAtH2Rwol6MjlJmNMYTdP4DPUB5t4bzIP0lJ6Jhcoc3S8R
         1PVDU2eXBm1o+EKrcIAlx1veU8OlfK5obUve1JYqCHbGBF2Y1T963v2YU+ySr/2Of/2u
         RCrNQm4Qp4loZ2tp04ZLryRp1DqJYzrMgkXX5fIW6/8JKEBLjLewH6f6yd3DwOLlOluc
         wCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9HcmbvuxzdUN1JequqJpCfXWgbCeptC8NDxVYjMV9o=;
        b=Wd8lGpHboy+/sVDS8+1SarKurrghT6VNJAMZwiwuUdgcZh+QfXBu+g1UrOluIiYszd
         dL/bSq+c8hKLzSSuXFOyoBq1Z8UMFQLVmZp9CcIetJ7Ka/iNfHghAp7A195V1Urdnhxq
         YQQalC1PsGaIH/6x/vy5N+Uxd04/qTCryO2/RHUmGWqG56TiH37ZEilgHQEf2RQzqqAe
         mrB+AKVOIfy2dIV5vvb44ovp/6IgWaSQkncQ+H3d4d4oUcS2LCLlTF8JElY8fgEGrDyo
         B/h4zDFN0JrMkQiCOFQHrqENMAia1XHy+hGqUuS6xJEFk8+UihWmng3WTy9herlE4cjV
         4J3w==
X-Gm-Message-State: AO0yUKU3GsHf4i4cBeSl1VicIs2wGg7nUVL/yrfDb5rzDo/r56VoDF/n
	z4rcVA5ZrsIqpfHmjp0V/b+T6DJLvQDI6gI9x1Q7pg==
X-Google-Smtp-Source: AK7set9gnhg3mLxquhmx3RYuULdMF7h82vPFFMzCV6tm5GFzIdnbw3hPpy4sqMGhPsMnbXq8ooDYpaeLJGJDczIfjvQ=
X-Received: by 2002:a05:6102:3c94:b0:3fe:b46c:7889 with SMTP id
 c20-20020a0561023c9400b003feb46c7889mr3472459vsv.78.1675972755355; Thu, 09
 Feb 2023 11:59:15 -0800 (PST)
MIME-Version: 1.0
References: <20230208152541.136848-1-brgl@bgdev.pl> <20230208152541.136848-3-brgl@bgdev.pl>
 <CAMKF1sp1Ey1tBRYZ1gFZWwweFAxk-EB0u98eTz-70yRpiGuvzw@mail.gmail.com>
In-Reply-To: <CAMKF1sp1Ey1tBRYZ1gFZWwweFAxk-EB0u98eTz-70yRpiGuvzw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 9 Feb 2023 20:59:04 +0100
Message-ID: <CAMRc=MdfFQ8JXpMRO5b70KGMXE2v8RkQQyoTQSaX8K+rMSkwCQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 2/3] libgpiod: add a recipe for libgpiod v2.0-rc1
To: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Feb 2023 19:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101009

On Thu, Feb 9, 2023 at 4:50 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> fails to build with clang
>
> https://errors.yoctoproject.org/Errors/Details/689563/
>

Thanks for the report. I fixed this one but it seems like there are
more issues with clang and musl. For instance musl doesn't have
twalk_r() which libgpiod uses in tests. I need to spend some time on
it.

Bart

