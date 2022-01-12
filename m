Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A97C433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 04:41:45 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.19358.1641962504501025780
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 20:41:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m/88p3zh;
 spf=pass (domain: gmail.com, ip: 209.85.216.51,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id oa15so2499762pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 20:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=1cm2g/7Pp8zfnDoUXxwya3DMtGWUL1CeSWOnMaFkqSg=;
        b=m/88p3zhTtDot2Zfwm9MZ03kpLF4p2SyQE1mPsXrLpnbwN2ghXnTZSMBEL29DW++U1
         5ilU7AzvD15eE+q+42PfSlfZblpxvNZFBRCyfLhLDHZW/khHn5HyDA6pvm5Xe9Y/xzUN
         mBGHNJNp4Jp1yQ4bL6AdLMw+tMZ7mbEPIPyr+KXSKlSDJEfz6XYswVsaMyGNti4x5idd
         myTzNvxu+yZ79ndt8Ql06GxPv3blsnNljI5U7KYfLy9xMIni8kXUH57JFgIOnF1psZgB
         aMxqQ+OM5IDocuSbpCb+KgZOoFLrPT/WPCfHMTJdmtPOxii37N7RgSJv4C3yB6Y5GvlW
         Rp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=1cm2g/7Pp8zfnDoUXxwya3DMtGWUL1CeSWOnMaFkqSg=;
        b=21g9w0cMhezOmRUW07EI5U+491FMF2h8OSj8Hf4hyiwNmo+szeQ7wkFGyIz+OlCAdn
         /TD4TBWE7S0fAiRREDm+omw078HjnzwZjAV6B21uZ6gvCtUY6mGKo7mVw8Fdgp3AFLY9
         rnnJTNDX6SEUuOVrIkAJAuKyiPzXUguTNextkgRTrwhPigYuTgT0v6/bVYf2++hgzHCV
         ymjXIwN3kyFBljzPpLe8AkIPMgl5EqSDwmCiIsu7Qbo7ueySUfcY7bVJDKgc6RnfM2+9
         S+iO5PhXy14vG80Ogx1Ki7jgLrKNQInrYax2INlEmcj/ZNLvxwCN/ooEjcETS2oLXaQf
         sWLA==
X-Gm-Message-State: AOAM533qYgBmZgAhSQNWi+8yqzG9iqLDMiRlgk2lDO4uZxde5op4XtKI
	vVWtpA79EfTjnZNq1VJpc4MsOnL5WDA=
X-Google-Smtp-Source: 
 ABdhPJzSUCmshk8udNHT38W0rgikHWOvT1owgKnQb+puEna3NgYyfi07xEJjJf3/lUbzboaSclw8og==
X-Received: by 2002:a63:9dcc:: with SMTP id i195mr7107272pgd.3.1641962503768;
        Tue, 11 Jan 2022 20:41:43 -0800 (PST)
Received: from [10.14.2.168] ([12.196.124.196])
        by smtp.gmail.com with ESMTPSA id t25sm879769pgv.9.2022.01.11.20.41.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 20:41:43 -0800 (PST)
Subject: Re: [oe] [meta-oe][dunfell][PATCH 1/4] Bump sdbus-c++ version to
 v0.8.3
To: openembedded-devel@lists.openembedded.org
References: <20220111152814.1270957-1-marex@denx.de>
From: akuster808 <akuster808@gmail.com>
Message-ID: <1c2727b3-d860-d7b4-9b28-b08fe92b4b8f@gmail.com>
Date: Tue, 11 Jan 2022 20:41:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220111152814.1270957-1-marex@denx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 04:41:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94771



On 1/11/22 7:28 AM, Marek Vasut wrote:
> From: Stanislav Angelovic <angelovic.s@gmail.com>
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit b6213e4dd595d7dd2dbd67c1cad09e958ffd9c2f)
> Signed-off-by: Marek Vasut <marex@denx.de>
Please sell me on the idea of why I should update this? Bug fix only,
this version is a stable or LTS version.

- armin
> ---
>  ...1-Try-to-first-find-googletest-in-the-system-before-do.patch | 0
>  .../sdbus-c++/{sdbus-c++-0.8.1 => sdbus-c++-0.8.3}/run-ptest    | 0
>  .../{sdbus-c++-tools_0.8.1.bb => sdbus-c++-tools_0.8.3.bb}      | 2 +-
>  .../sdbus-c++/{sdbus-c++_0.8.1.bb => sdbus-c++_0.8.3.bb}        | 2 +-
>  4 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-0.8.1 => sdbus-c++-0.8.3}/0001-Try-to-first-find-googletest-in-the-system-before-do.patch (100%)
>  rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-0.8.1 => sdbus-c++-0.8.3}/run-ptest (100%)
>  rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-tools_0.8.1.bb => sdbus-c++-tools_0.8.3.bb} (88%)
>  rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++_0.8.1.bb => sdbus-c++_0.8.3.bb} (96%)
>
> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.1/0001-Try-to-first-find-googletest-in-the-system-before-do.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.3/0001-Try-to-first-find-googletest-in-the-system-before-do.patch
> similarity index 100%
> rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.1/0001-Try-to-first-find-googletest-in-the-system-before-do.patch
> rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.3/0001-Try-to-first-find-googletest-in-the-system-before-do.patch
> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.1/run-ptest b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.3/run-ptest
> similarity index 100%
> rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.1/run-ptest
> rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.3/run-ptest
> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.3.bb
> similarity index 88%
> rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb
> rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.3.bb
> index 9eaec0f2a..3b87c2265 100644
> --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb
> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.3.bb
> @@ -8,7 +8,7 @@ inherit cmake
>  
>  DEPENDS += "expat"
>  
> -SRCREV = "3a4f343fb924650e7639660efa5f143961162044"
> +SRCREV = "6e8e5aadb674cccea5bdd55141db5dad887fbacd"
>  SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master;subpath=tools"
>  
>  S = "${WORKDIR}/tools"
> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.1.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb
> similarity index 96%
> rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.1.bb
> rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb
> index a94fb8def..3f805001f 100644
> --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.1.bb
> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb
> @@ -16,7 +16,7 @@ PACKAGECONFIG[with-tests] = "-DBUILD_TESTS=ON -DTESTS_INSTALL_PATH=${libdir}/${B
>  
>  DEPENDS += "expat"
>  
> -SRCREV = "3a4f343fb924650e7639660efa5f143961162044"
> +SRCREV = "6e8e5aadb674cccea5bdd55141db5dad887fbacd"
>  
>  SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master \
>      file://0001-Try-to-first-find-googletest-in-the-system-before-do.patch \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94746): https://lists.openembedded.org/g/openembedded-devel/message/94746
> Mute This Topic: https://lists.openembedded.org/mt/88351111/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


