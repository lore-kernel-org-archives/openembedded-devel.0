Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6688EC433EF
	for <webhook@archiver.kernel.org>; Sun, 23 Jan 2022 12:55:31 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.8996.1642942529438488658
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jan 2022 04:55:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=QIk5gh0o;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.46,
 mailfrom: brgl@bgdev.pl)
Received: by mail-ed1-f46.google.com with SMTP id a18so51368762edj.7
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jan 2022 04:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OE3kDtnE1obpN3zzmOP3SufoBcPys8bqQCflrZ87YTs=;
        b=QIk5gh0ob0O4vrqWycq43EwnapmH+XwQVLtyW5r1QaJ/LaH8CRcmurOWGb9jfyrjil
         msEbMUHaXhW7DNvpqERDPROSFRjJ7/oKdyL3chQY55Nb3WORo9uhE4TfKo6qtC7OBOz6
         CeNKUp/e34gUzMK2cQg9ve4PI1FUKzYaUwN0LuMp7dI/BY0j3uz3E4E1A8YtfnO6ft//
         pTgl/XIgv/FwFUUjb3RcXmpsK1biO04h60QzHb43KhAQengAejjpB3YZCT+0S3fYZ+zB
         rKTA65kDuZ8EW3q8irdp/tccp52M3vE7y2pH4P7tqY8JsNQUraX0BbVUEnJ+JuNsMGDm
         SVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OE3kDtnE1obpN3zzmOP3SufoBcPys8bqQCflrZ87YTs=;
        b=fzwmL3hdwOTkQsNRmgw0kTOE0gk+YamFd0Dw+Y4omb/ZJqWn3KLLQjNK1O215vIaz2
         lLPhK7/oQ/Xwz881lT51YsNVdPheRFgo60johU9WPu38NOsjIhkvaPs7ZYwUnc5RbWrC
         4AoSHPwHjAqqBdc8N3/LkXcxEcaVv4JhjbKc/UWwnQjw616nkMu3kgTq7SC/lfCCpPLq
         v1PaS5MyODEioLPQ/oR5HMakEvZjdoJ6NiF9300aE6dclH0G2rCVOFc1Ep/sOOmsDZHL
         im6FseCD59sXiDDQu2MYLnzSvGdQU2JWhxLDKBGWYk0/iuw83qgxe9I8V3gYYUtiZa6a
         Dkag==
X-Gm-Message-State: AOAM531m5CgKFvQ2dL5W6vynojPdCZzh8hdISPQmi3KeWHj3AILtWhXR
	IzfEwu9kl0QIoBl9yAPEEF6LICvNcHYM/0bi+rjYaA==
X-Google-Smtp-Source: 
 ABdhPJxzUUHHED7K6AsSpxwCJwlr1apNqomjjaP5QG5XMB2laFR2hqRpaylT9U/WH3+B72mR5rOh7iY+PvLmH+PG2d8=
X-Received: by 2002:a05:6402:1604:: with SMTP id
 f4mr11724255edv.352.1642942527602;
 Sun, 23 Jan 2022 04:55:27 -0800 (PST)
MIME-Version: 1.0
References: <20220107122702.614365-1-brgl@bgdev.pl>
In-Reply-To: <20220107122702.614365-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 23 Jan 2022 13:55:16 +0100
Message-ID: 
 <CAMRc=Me+wvcyEdN-1na_Em-ba+ZOTfyCt9_CKaceouCBshEhsw@mail.gmail.com>
Subject: Re: [meta-python][PATCH] python3-zeroconf: bump version 0.36.13 ->
 0.38.1
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>,
	Tim moto-timo Orling <TicoTimo@gmail.com>, Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Jan 2022 12:55:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95016

On Fri, Jan 7, 2022 at 1:27 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  .../{python3-zeroconf_0.36.13.bb => python3-zeroconf_0.38.1.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-zeroconf_0.36.13.bb => python3-zeroconf_0.38.1.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.36.13.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.38.1.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-zeroconf_0.36.13.bb
> rename to meta-python/recipes-devtools/python/python3-zeroconf_0.38.1.bb
> index ccab7fe4c..c49782e42 100644
> --- a/meta-python/recipes-devtools/python/python3-zeroconf_0.36.13.bb
> +++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.38.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
>  LICENSE = "LGPL-2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=3bb705b228ea4a14ea2728215b780d80"
>
> -SRC_URI[sha256sum] = "196fa1bd6e166f0333e3e9fff076f9991bf2719c4788287eaec577c241ef96bf"
> +SRC_URI[sha256sum] = "10c501b25d8881b656e56c34674d98fe6bc752240a572e74f918bc849c93ba9c"
>
>  inherit pypi setuptools3
>
> --
> 2.25.1
>

Ping. Did this get lost somehow?

Bart

