Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 709B5C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 15:24:35 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web12.6902.1657207474167833094
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 08:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MvTECfXu;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id r2so23156143qta.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 08:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Cr5ljRxAK3Kkp6WjKo0s62TzX/WiKdW2ocmzlS4+Xs=;
        b=MvTECfXuyjElbgM9j0+gtkYrpwTSEl6ok1uq94EPH18lmRBhDOBLz4jslvv4Iwzr98
         1nylvQCAFeT6OGUQbNl2jg8NsJWvKXH5b+cnYjDOhz+51izCncjY8GhqagWETLwR5PMm
         J5XhpF1fIZYKIv+eiIxCT9oxUkOmTXQlXaLSN2YeYK2osgOPt3C9glk5R6ooLvzvH0kF
         xMGT+c/v97N0aRtan9ChAMH+G0VFSyQGexDU7UEx24oWXJDAjF6uGVGhuerD/E55FFCU
         FGfd7107WRZXcnN+s7AoaxQ9PlVzYBlUM6q39Q97diLmAxu/fquN1p3gI5S6ZttjZQkE
         vvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Cr5ljRxAK3Kkp6WjKo0s62TzX/WiKdW2ocmzlS4+Xs=;
        b=jPg3io5vX3JZtsrX+wV7zZcbz5q/0Ari6I65njvGuyQV05JIrW1//u6ojzTm/m+sEE
         kvzH23LqhdlYDr89HVsMWEapnp0BAQgKRkSEnkH9o+HsFio1amvE/qjX16ybu3zq+5uG
         o1KV0JxaSo7fcCiKYAmdnSCWhJiYYGIg/35WRL7KK2TamP/F+4aTuDSGn1mtRF7I+g1N
         gUPHZjgj/Kkm2jPRirfzb9wjijbcyZ839y4gvGXB0bu6eezPqqfnp8y6+cwU8VDOf+SU
         5gkoi59cIJNuyIEGevYMkekRuG3pJvti4aq5v/wCjrMQO7w+7/CxKkRsbj3NtE0FhZ+G
         5JPA==
X-Gm-Message-State: AJIora+Ro1XlwN+3stbzkV4lNgMCJ80xKmRlFyZLFFYS36ZHsre3rZEj
	xEws7JjAVIc69MI6sY0wSaCg7fmn8FWI1QnfBGKz4I/xvA4WgA==
X-Google-Smtp-Source: 
 AGRyM1ubSAoQV9qbGi7ONC9AtlaxE3yqDcSBxI9NioAjLQpTIWMgOy0KHm7QKokGGb2oL79UNEcIqYjKUpJ+M3elyjg=
X-Received: by 2002:a05:6214:27e3:b0:472:ece6:3af5 with SMTP id
 jt3-20020a05621427e300b00472ece63af5mr21854055qvb.63.1657207473022; Thu, 07
 Jul 2022 08:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <1657177137-28347-1-git-send-email-wangmy@fujitsu.com>
 <1657177137-28347-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1657177137-28347-2-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Jul 2022 11:24:06 -0400
Message-ID: 
 <CAMKF1sq6ZXoJr1qvFt11KYNkuuH0Jo9SkcZSP4jC9qftTz2-uw@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] fmt: upgrade 8.1.1 -> 9.0.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 15:24:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97780

We need to fix these recipes to migrate to 9.x as well. I will hold
this patch until they are migrated

https://errors.yoctoproject.org/Errors/Build/148044/

On Thu, Jul 7, 2022 at 2:59 AM wangmy <wangmy@fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-support/fmt/{fmt_8.1.1.bb => fmt_9.0.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/fmt/{fmt_8.1.1.bb => fmt_9.0.0.bb} (90%)
>
> diff --git a/meta-oe/recipes-support/fmt/fmt_8.1.1.bb b/meta-oe/recipes-support/fmt/fmt_9.0.0.bb
> similarity index 90%
> rename from meta-oe/recipes-support/fmt/fmt_8.1.1.bb
> rename to meta-oe/recipes-support/fmt/fmt_9.0.0.bb
> index c53dd3890..fd37a1e0f 100644
> --- a/meta-oe/recipes-support/fmt/fmt_8.1.1.bb
> +++ b/meta-oe/recipes-support/fmt/fmt_9.0.0.bb
> @@ -5,7 +5,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
>
>  SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
> -SRCREV = "b6f4ceaed0a0a24ccf575fab6c56dd50ccf6f1a9"
> +SRCREV = "c4ee726532178e556d923372f29163bd206d7732"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97738): https://lists.openembedded.org/g/openembedded-devel/message/97738
> Mute This Topic: https://lists.openembedded.org/mt/92223702/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

