Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38373ECAAD7
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 06:17:54 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web12.33818.1661494669908844809
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RAl4sTVY;
 spf=pass (domain: gmail.com, ip: 209.85.128.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-334dc616f86so12229937b3.8
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=al20mffjqnvQTHtRL0euyMiXcD3xYjYXBK95fH6Kugg=;
        b=RAl4sTVYFfbSrdxsbNvQ42LbaTr+KSreuOLGCs6NDflxtfnF3RyVLKuX/0+xsJmXpO
         8RNsZodfC0f7WSlXKAzpTYFzORJOyG2fB/mPMb4PMeCzX8Jgbp7cIjQBf6BRKilt7522
         eGFApSIfzVj1w5tqg9iUCo0xHLcIIUotCeqaOQRovec+2ebHs6+Mh52FSy53I98Kd3mc
         pqVSkMa4dfRX+9p1Og5hrmgnwiDXM1J1viN+RWkIt8JecSHUAfjyBNJzYSa11Y9KV58a
         Zmw1NOOht0k4MYeB3sfFy4u81M5ikOTPhQ8yyfdsPyAWJlWVXJEj0HLW9HjFGlh8LH+s
         1pEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=al20mffjqnvQTHtRL0euyMiXcD3xYjYXBK95fH6Kugg=;
        b=Ti9SLPCU/gx5vzb13GC9FY4Vu8Hol5Ym3gTRda7BJ23KrVT/hEixecEwCtaZFMp2Jx
         do2N91vYWkMtd2OZAIfGbOTiNWC4LUj6bV+N3f45+Jtejh0TjreUlWk5XgBSLud31cK4
         fRsFC782GD7VhNET5E3wBpCFE0AgzAEu+55bIxPdOWFz+I3XPZojCMxJvHugl7HxAKMi
         okUu2q3rIQlBb1c3qcPXLQq/R1VFyi2UBN3buGYocKa7p7tHic8kYP7z+SURsWcunZWy
         5AfroXBI6M2U6QYM/jWMyaIRnbkeVdGblYlcSB4uFio7DRjwh5+wPhY/nSU/pNAcCd2t
         zvlg==
X-Gm-Message-State: ACgBeo1GUuNabYT68hiYBM4IiaHBo/uJxFm5L2yKM2VrX1kIx+goshcV
	LS9wYk+AM4aUWJKZmgtV4vBgDPZzlfXVi/WhXpM4sMuyfbg=
X-Google-Smtp-Source: 
 AA6agR6PRuiOGsjFUxCEFA0febuIW34fTTai3YOCIA3TtitvgPcee3J+om3CJkSEGuIHkURrnkpV/RMDMrNRjGwF4FA=
X-Received: by 2002:a81:b61c:0:b0:333:9118:4020 with SMTP id
 u28-20020a81b61c000000b0033391184020mr6932446ywh.282.1661494668988; Thu, 25
 Aug 2022 23:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <1661482908-10720-1-git-send-email-wangmy@fujitsu.com>
 <1661482908-10720-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1661482908-10720-2-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Aug 2022 23:17:22 -0700
Message-ID: 
 <CAMKF1soiW7un3C5o2hTiTGznRyBUn9OBXVy6ZX+aVpACGOxy3w@mail.gmail.com>
Subject: Re: [PATCH] [oe] [meta-python] [PATCH] python3-jsonrpcserver: upgrade
 5.0.7 -> 5.0.8
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 06:17:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98473

On Thu, Aug 25, 2022 at 8:02 PM wangmy <wangmy@fujitsu.com> wrote:
>
> Add dependence python3-typing-extensions
>
> Changelog:
> ==========
> Use importlib.resources instead of pkg_resources.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...3-jsonrpcserver_5.0.7.bb => python3-jsonrpcserver_5.0.8.bb} | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-jsonrpcserver_5.0.7.bb => python3-jsonrpcserver_5.0.8.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.7.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.8.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.7.bb
> rename to meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.8.bb
> index 12e9003798..88b1d6856e 100644
> --- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.8.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/explodinglabs/jsonrpcserver"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=61b63ea9d36f6fb63ddaaaac8265304f"
>
> -SRC_URI[sha256sum] = "b15d3fd043ad0c40b2ff17f7df2ddaec2e880bb923b40d133939a107c97fde5c"
> +SRC_URI[sha256sum] = "5150071e4abc9a93f086aa0fd0004dfe0410de66adfaaf513613baa2c2fc00d7"
>
>  inherit pypi setuptools3
>
> @@ -17,6 +17,7 @@ RDEPENDS:${PN} += "\
>      python3-netclient \
>      python3-pkgutil \
>      python3-oslash \
> +    python3-typing-extensions \

This part I have rebased on top of master-next

>  "
>
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98461): https://lists.openembedded.org/g/openembedded-devel/message/98461
> Mute This Topic: https://lists.openembedded.org/mt/93263104/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

