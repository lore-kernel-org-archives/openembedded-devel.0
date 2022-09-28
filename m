Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6719C54EE9
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 02:17:35 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.3208.1664331450360877312
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 19:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ft7d5b+s;
 spf=pass (domain: gmail.com, ip: 209.85.167.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id j188so13982387oih.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 19:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=3mUabR32V4EywJ11JGePyM9NKOBcjpmDWCsb2kVi0QA=;
        b=ft7d5b+sqar5kLn3oLymQKEtBYglJ4Ye0rXy3nS7avffcLHOyMwkt1UnwBO1MJxhbg
         uWyakG8/WF7up69b8s6bNJE+w5AC1ZmgK3q1I8oIAj+9LRUT7F+TqQkxTGSb17DLAeAL
         y/pqh/Dq7S3n380gabWrMNAGdtM+mYU5to7rg1HjRou/XKp0M4jNnt0IeKxJ4z66QRkH
         Vv6kZ7fG9XX/jcUwDfFE1J7sx5EKRnAI4SUjAIiesdtRZh88YrzBsJPc+DW4NXX0heby
         NssoE7Y0zPBmEdEh2wS1OnxfmyMJmUFFuyK7+WZYJjyRl7XvFqlhBO5nLozVMI2HfDXz
         4AAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=3mUabR32V4EywJ11JGePyM9NKOBcjpmDWCsb2kVi0QA=;
        b=jiN5CB/IgSJxQx5IFDDEAIS/sEFItYzqF8m+F0MdSZjJXWbi/Hit0Bg/gQJnS9bQRi
         TIkR3a3BoxbCIQGCQ5DlPbmtOsXV28Fj8XwG3duFWgKb+0MC+shlLRHKcpoMEJTPsM2A
         rKWpeCJY8ULPxMSAK017HU3WFwuHGTFVbgBZE7A81L6AbXVMRpnVcRSglzS+aaRa3ZDc
         5qHXReMSVOb9VHphWe8mXXQiSDSkmD6rZLLObDHHyE4RwSYYLG057qcyyqEKeH9sjafy
         K2rloEPiLTFLSnjSQVKIS6oRKSZ7OiLpa8u9Gv+7l874dyRxRA99ScVTKykN4XzQ6t7j
         zgZQ==
X-Gm-Message-State: ACrzQf222ByF8/S5N9hJ+ne+6m/yUr4n8GMdbA8qpjHeArtcY7tInoGy
	DncQkbj/ollEilJHuYjGtBbAN9TZLjma5cC2aQQ=
X-Google-Smtp-Source: 
 AMsMyM51tGs8wJinkmxixcKzEjjQfgWVc0p3PJ2POeuMgZfbFCG4ct1hajN6BUFuzGPhr9+gcDnQkE7hJQB0yRpLA6I=
X-Received: by 2002:a05:6808:1988:b0:34f:de19:411c with SMTP id
 bj8-20020a056808198800b0034fde19411cmr3208282oib.262.1664331449102; Tue, 27
 Sep 2022 19:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <1664267003-2293-1-git-send-email-wangmy@fujitsu.com>
 <1664267003-2293-3-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1664267003-2293-3-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Sep 2022 19:17:03 -0700
Message-ID: 
 <CAMKF1sqDH+AOJWXW=ZbsO-oDEGyLoUzj3P=ksYVN6cGCSPrhLA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] xterm: upgrade 372 -> 373
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Sep 2022 02:17:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98997

seeing this error on qemuarm/clang

https://errors.yoctoproject.org/Errors/Details/672175/

On Tue, Sep 27, 2022 at 1:23 AM wangmy <wangmy@fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../recipes-graphics/xorg-app/{xterm_372.bb => xterm_373.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-graphics/xorg-app/{xterm_372.bb => xterm_373.bb} (94%)
>
> diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_372.bb b/meta-oe/recipes-graphics/xorg-app/xterm_373.bb
> similarity index 94%
> rename from meta-oe/recipes-graphics/xorg-app/xterm_372.bb
> rename to meta-oe/recipes-graphics/xorg-app/xterm_373.bb
> index 3e1e9d7042..7e36f475c4 100644
> --- a/meta-oe/recipes-graphics/xorg-app/xterm_372.bb
> +++ b/meta-oe/recipes-graphics/xorg-app/xterm_373.bb
> @@ -8,7 +8,7 @@ SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
>             file://0001-Add-configure-time-check-for-setsid.patch \
>            "
>
> -SRC_URI[sha256sum] = "c6d08127cb2409c3a04bcae559b7025196ed770bb7bf26630abcb45d95f60ab1"
> +SRC_URI[sha256sum] = "deb0989473a63908b5a8d44dfeea8301c8710f6ce01fb57ce8c30002375746b6"
>
>  PACKAGECONFIG ?= ""
>  PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98971): https://lists.openembedded.org/g/openembedded-devel/message/98971
> Mute This Topic: https://lists.openembedded.org/mt/93945580/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

