Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434B3C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 15:08:01 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web12.20770.1658934474119019583
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 08:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YhBnhMwv;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id n138so13774324iod.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 08:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:references
         :content-language:from:in-reply-to:content-transfer-encoding;
        bh=iI3RjT9U06wMJPCRG0Y4RF7/moa7mkmLWpYdwWXiM+o=;
        b=YhBnhMwvh8fY7fM/9x6hHDdB/SO+2DjpJF5KNH2IaFjpMXx0/Wd8+65gfuuyN2eAyH
         aFKqKOQANuR28Qayufh8lQCoy8+ftK+3GZaO3F+rlGMpPAv+3Ycl7I6EmcnsVn9xxImr
         Dpwhmqt74UYlvvw8ZLt4nox7ijMiRysGeiL/+3BnPJo31ddRZQHoyiyu5iSCIIoEtrvK
         Q5jj6gAUn9/fMbpZDzCeqdAI4hwmryPqAnM9a6yGjZDuUSf/EuT5T8t53YY4E+YZUt6a
         /1Hr4d3zJEC9nR933dDmDP2GtMamgefsAwL1LZLyM9zqqWBqHQQqXRXliViA1imAuRPw
         do0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:references:content-language:from:in-reply-to
         :content-transfer-encoding;
        bh=iI3RjT9U06wMJPCRG0Y4RF7/moa7mkmLWpYdwWXiM+o=;
        b=mwR+RhnGDw3pZm6GpopDYajIq2NCwQVS/XO2AWa7hsTjhA/GMFH3Rl9BMNTi5Mrf+F
         xeTYnf5S+uuib5HjQXBK2+ziTXad49bBL3yimyEKtIlix9Lu6hNrysu7hQ/LU4IhufDQ
         7k5XRs2ABH3jkbOQX56E6/BxJcSddxLzapW1n+fPxuSWAO56YGYEYU1nvnwRNxKThbAr
         WaogZcs8G03IhxQAKUz1VXJvs+BHDE4+bdZArUE6vFgAkLwk51ZPa6MSZAtIF5sFSxZ9
         MEnYJss4eoINW/OZFVPKRoIl5jQZmidYxu9qZ+D4MgyqO8k3HZU0JH7B0QF+XuqRFZlh
         ZzqQ==
X-Gm-Message-State: AJIora9T+WFXuVptZEWFSKfXpLd39MY5arlNahwfTV6dtXtlzFt2cIkq
	hnsGKM5rGO84kYrW3IA+rNI=
X-Google-Smtp-Source: 
 AGRyM1tgUAlvsrCKEDKw3s82SNFGMthqhX239SUXlGBzZjX/qSC28Clc/e6e5Ecyv61i5aLcSoCjGA==
X-Received: by 2002:a05:6638:3010:b0:341:dda0:dcc5 with SMTP id
 r16-20020a056638301000b00341dda0dcc5mr3368067jak.210.1658934473444;
        Wed, 27 Jul 2022 08:07:53 -0700 (PDT)
Received: from ?IPV6:2607:fea8:95df:9730:e8b7:596a:a352:5d5c?
 ([2607:fea8:95df:9730:e8b7:596a:a352:5d5c])
        by smtp.gmail.com with ESMTPSA id
 z3-20020a92d183000000b002dae42fa5f2sm6771708ilz.56.2022.07.27.08.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 08:07:52 -0700 (PDT)
Message-ID: <9b6e137e-0e05-21e1-4a28-646e5c805663@gmail.com>
Date: Wed, 27 Jul 2022 11:07:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [oe] [meta-python][PATCH v1] python3-pystemd: Upgrade 0.8.0 ->
 0.10.0:
To: johannes.schneider@leica-geosystems.com,
 openembedded-devel@lists.openembedded.org
References: <20220727094550.2519009-1-johannes.schneider@leica-geosystems.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: 
 <20220727094550.2519009-1-johannes.schneider@leica-geosystems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Jul 2022 15:08:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98015



On 7/27/22 5:45 AM, Johannes Schneider via lists.openembedded.org wrote:
> most important fix: version 0.8.0 errors out on dbus-lib interaction,
> which is fixed with the most recent commit
> 
> 505e2b5 (tag: v.0.10.0) add interactive_authorization options for buses
> 2d90700 pystemd: add copyright boilerplate to typing stubs
> 5b95888 pystemd: update branch name in github workflow
> 16817d2 Add type stub for pystemd.run
> 410fd77 (tag: v.0.9.0) update changelog for 0.9.0
> 71aae43 GetProcesses() - info about systemd version (#59)
> fcafd08 Also include .pxd and .pxi in the source distribution
> 475cd2f also support 3.9
> ea98275 some formatting options and start pystemd 0.9 development
> eb7d225 pystemd: update install instructions in README
> 6fdf2c8 Daily `arc lint --take BLACK`
> 50e61b7 add a LIBSYSTEMD_VERSION macro for gating new functions (#58)
> 
> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
> ---
>   .../{python3-pystemd_0.8.0.bb => python3-pystemd_0.10.0.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pystemd_0.8.0.bb => python3-pystemd_0.10.0.bb} (61%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb b/meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb
> similarity index 61%
> rename from meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
> rename to meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb
> index 0056a794f..0b8216e87 100644
> --- a/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb
> @@ -2,13 +2,13 @@ SUMMARY = "Python bindings for interacting with systemd over DBus"
>   LICENSE = "LGPL-2.1-only"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
>   
> -SRC_URI[md5sum] = "f993739eca645749f18d4ccfd4a0fbf3"
> -SRC_URI[sha256sum] = "cac2e42043ab28d43adf33dab493c6a3cf8a99794f824ae8af6d9cd6458b9972"
> +SRC_URI[md5sum] = "c8c7337d21a0e9a2e62d1708caf4bdbe"

We dont need md5sums for SRC_URI anymore

> +SRC_URI[sha256sum] = "d74a814bfda01085db1a8ad90be3cb27daf23a51ab6b03e7e29ec811fa2ae859"
>   
>   DEPENDS = "systemd"
>   RDEPENDS:${PN} += "python3-xml python3-pprint"
>   REQUIRED_DISTRO_FEATURES = "systemd"
>   
> -inherit pypi setuptools3 features_check
> +inherit pypi setuptools3 features_check pkgconfig
>   
>   BBCLASSEXTEND = "native"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98002): https://lists.openembedded.org/g/openembedded-devel/message/98002
> Mute This Topic: https://lists.openembedded.org/mt/92645896/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

