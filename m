Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE9AC433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 19:40:56 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web08.617.1642794055810723068
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 11:40:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mrPWMjy3;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id 193so11047448qkh.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 11:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b4kjJ7fGPETc0YzBmleiUjxVKNubEfPwYjrSNM3wUoY=;
        b=mrPWMjy3c/AClxwYTcnFIkvftxTf25DaXT7LzpaCGfsWSMNADsO0gxOvbKnjEQmNop
         CwnVUw0WS5sjgrFLWuruvelZ/yCT8SPhq1/PrPXUsBux7aiJD55gvNz5CZfs49IvV7lg
         5QXGD99RcDrs8JdpPV/5F3vwJQuS5KfRlLbD+birXtPYhvQ8bECt5q1+Ne6VXvvwZhKR
         wbmuABbBRaOnif3nL3uDxnGrfTq6vpjpagoY39ZPrLsUz2VVEjdt69Fhwy7EuEtgFNFI
         dnQGY/XXxakYCdMoWYXT4K7ALaTnKaBtfQ/wm4/0AZObRi3FWpSj67pRxGKEpvqfMFOS
         SYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b4kjJ7fGPETc0YzBmleiUjxVKNubEfPwYjrSNM3wUoY=;
        b=b+bOggu1WEhePJPfTPt6vXn3CzxECWXFdl1KjkrxKY7FBi8lZqxZmhMVCwfiArnMib
         4nyF4UW45Lqm9Jm6wAjxiSPtkLODmb50HcZUGk0c1QrIEDLizbe3vseuM42vGnjKZZh9
         b8kfeg551RLto+dDssoU3fqw3kCMY3nNW3nWAmwAsVx5+R14BiFu0AVyB8n92U34CTIL
         0AsiwhfdMX6rfP7MHTzUaqn5uNE5pJT/0NWwESL921lpPIz7nW/Q/pphJkSLQzk7FI//
         46DGTGYZWk+b+Qm2I6GqImOnmQz6L3bstTIU74jiP+qqeXRfKp2jGwWdcAGx9+3QNWFS
         ImGQ==
X-Gm-Message-State: AOAM533s9B7EU7jyQe6xw26A6rulvxk5o7WjIgK5r32DjaT4/mxanyKG
	FtobGNT/S1WSiLEsw8S2ua0JcmKQGaP2+7iJ8PE=
X-Google-Smtp-Source: 
 ABdhPJxVs2falIg65viSUjJLSL3rggAbq6X2x4t0MyMso5/gN4Hx7QCkcalZ7f7tnwwx+OB9wDTZqzM8j9LTgUNPEzc=
X-Received: by 2002:a37:a84:: with SMTP id 126mr4030683qkk.72.1642794054744;
 Fri, 21 Jan 2022 11:40:54 -0800 (PST)
MIME-Version: 1.0
References: <1642725351-24004-1-git-send-email-wangmy@fujitsu.com>
 <1642725351-24004-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1642725351-24004-2-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Jan 2022 11:40:28 -0800
Message-ID: 
 <CAMKF1sq17qpZjOv_wD5OLM9yyW-_KkLX9=B5nPfpKgLRneHNvg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] sdbus-c++-libsystemd: upgrade 249 -> 250.3
To: wangmy <wangmy@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 19:40:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94978

this fails on musl
https://errors.yoctoproject.org/Errors/Details/623260/

On Thu, Jan 20, 2022 at 4:36 PM wangmy <wangmy@fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...us-c++-libsystemd_249.bb => sdbus-c++-libsystemd_250.3.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-libsystemd_249.bb => sdbus-c++-libsystemd_250.3.bb} (97%)
>
> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_249.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb
> similarity index 97%
> rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_249.bb
> rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb
> index a3ef6a747..0cd96f528 100644
> --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_249.bb
> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb
> @@ -10,8 +10,8 @@ inherit meson pkgconfig
>
>  DEPENDS += "gperf-native gettext-native util-linux libcap util-linux python3-jinja2-native"
>
> -SRCREV = "00b0393e65252bf631670604f58b844780b08c50"
> -SRCBRANCH = "v249-stable"
> +SRCREV = "1b003bbc806198dbdd57b405d968f30565495e70"
> +SRCBRANCH = "v250-stable"
>  SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
>             file://static-libsystemd-pkgconfig.patch \
>             "
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94961): https://lists.openembedded.org/g/openembedded-devel/message/94961
> Mute This Topic: https://lists.openembedded.org/mt/88573656/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

