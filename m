Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1EDC433EF
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 12:36:34 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web09.10088.1634387793823266266
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 05:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UhjPPO5Y;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id r15so11009050qkp.8
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 05:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BBpjOgPQFJVGzqB/Hv3ns3e4nLVhpwmAy4W0XM99YOw=;
        b=UhjPPO5YwW1GTz4p7UvG4TB49pBMspO3tQVtbYcYIYCQwLzjsZiEdyx64YdwCrORHB
         ySAkEmpCymP2goc3nUm3AAeNqUfuFYCQHP3ho9mip3Sy9R6p73aQL8Gp4A0r3xURP88D
         Ovs/0AUG9Ex/sOt63yTfgbsQ6Li59qUo9z55gBDFzCEzaVvXL/+9BPeEDlDDhcxO4nqh
         DAJCtgvyBKRGb3ixkveDS+X2EwpoqpHbmce0BAC2rxhFqFkEyVFFOgxvCMm6EmQHOm4N
         hhlC7sKQRPqgbXhov2EqqptfGxHEasmbBpKpmukB4YoEQQVEoX9xCNocYC5t4tgdeBUS
         tYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BBpjOgPQFJVGzqB/Hv3ns3e4nLVhpwmAy4W0XM99YOw=;
        b=0Z7YRPV3P9CAQCbVHSFXtn+pyErmeweqUU6kPDNdTlx8mQaN8VZnc6sXnXiq7kvSsq
         N25qNwv+I9umj0Zp3/ABIiINHqTQ73BpcBWu9QXTmaa0YV4Un7dICI8hzuclM5AsvyL5
         A/bSBZuZ+MOOEiF3UDHuFtIgNgtC2DSVzwZHcNaEfl/+u/DdhB+ujLNQJBxEd910gVP/
         D209nSI0QaD5ZKWzcV53nXDm92fY+cjmzjuTVqfKZcdwkuZntwV31ANsHO+Hok7jWuCY
         f4rNI5GMX60M5a90ZZ7mjUe+zK+HEuRagGhV+XfzrVaKLC/B1hXp3ueNlBZvRThcLRU/
         Je5g==
X-Gm-Message-State: AOAM532lceTDMOogHszk/rCJexOtm3lqsaOM8LomFpKt7SvErQgmD9oP
	SAJjgWwEnQlNdQd75CPCgU0ypbjEyXIMrLBj96VGDVqqid1W1A==
X-Google-Smtp-Source: 
 ABdhPJxuvlAV75HMmywz2isaWkI6/0SZv2/lWFcCBXVyek6JZEt2HHGZQBREbHWMKorYW/ON05Nk1DtFeKyWSLM+daU=
X-Received: by 2002:ae9:de07:: with SMTP id s7mr14144821qkf.47.1634387792884;
 Sat, 16 Oct 2021 05:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211015225633.4163097-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20211015225633.4163097-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 16 Oct 2021 05:36:06 -0700
Message-ID: 
 <CAMKF1srCH2xg8krgSM24voFnOqzycJqR2TytDEJYA7C0W17brw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-jsonschema: update to 4.1.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Oct 2021 12:36:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93399

fails to build

https://errors.yoctoproject.org/Errors/Details/612590/

On Fri, Oct 15, 2021 at 3:56 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  ...python3-jsonschema_3.2.0.bb => python3-jsonschema_4.1.0.bb} | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-jsonschema_3.2.0.bb => python3-jsonschema_4.1.0.bb} (90%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb b/meta-python/recipes-devtools/python/python3-jsonschema_4.1.0.bb
> similarity index 90%
> rename from meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-jsonschema_4.1.0.bb
> index c7efe33a8..8db72658f 100644
> --- a/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-jsonschema_4.1.0.bb
> @@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
>                      file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
>  DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
>
> -SRC_URI[md5sum] = "f1a0b5011f05a02a8dee1070cd10a26d"
> -SRC_URI[sha256sum] = "c8a85b28d377cc7737e46e2d9f2b4f44ee3c0e1deac6bf46ddefc7187d30797a"
> +SRC_URI[sha256sum] = "9dd7c33b4a96138dc37bb86b3610d3b12d30d96433d4d73435ca3025804154a8"
>
>  inherit pypi setuptools3
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93362): https://lists.openembedded.org/g/openembedded-devel/message/93362
> Mute This Topic: https://lists.openembedded.org/mt/86361681/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

