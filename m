Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A02BC433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 03:56:50 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.26181.1655697402483439386
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jun 2022 20:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TL2098tG;
 spf=pass (domain: gmail.com, ip: 209.85.216.53,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 k5-20020a17090a404500b001e8875e6242so9047972pjg.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jun 2022 20:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=8CmNJB7WSm4o0Ys2tJGYKwHpUUZw5OAOWrAovEYXxK4=;
        b=TL2098tGBw6IbNQB+Y2kX4/Z4y/ipnOIe0rvpyh9G2gQD7ZOq8jVump4nEUxZdKmbx
         CsfWvOO85wKJcVYgUXjLW9dJpTUnEM3gqfnxIYbE/W6DW6KnE8yUwM41yHb0XqhAKxDz
         MTAxi0ia0n5Vzy17gZJn9l4xSS+d7hR9pUwQVXrBw/moxk+9yFVOutiGNN3b6S4bbSWn
         Ui+yysLd5dcTwwad7tDiLy0uwVQrpfJ1jnsBxuHalbAlayyzowtm55p4w/wkohMFeBME
         NUIdJJBnhgpdRD+4HHN3OJRWYleRcYXGQjw96PMNDoWVssbGFqXf8OlzZFRtoucxL5lY
         QNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8CmNJB7WSm4o0Ys2tJGYKwHpUUZw5OAOWrAovEYXxK4=;
        b=ZbGl6E0PWCMpEdeJKTOhPsf2EkL58nKeIzS+RA+w4W0x+xcEPGw86+eM+WiEtdFMGF
         +uwRWPBIB4H3dTVrljCfmgxAE71g5h3rYylct9ZA6fkxOhFjxl1xIl+JaIzOFUQelaBS
         aqpB32ytUzs9D7TwYPWVIM6orABfNypD0Y8rn+HoX8iBNBrFB0QUwqqFt4XpDcwlxynX
         uw2LWgkYjPDcPAbOsBGAJ5GJTFXzwp6qsTGCzYXRcLoe20k13QsskNrhpEkYRiTAAMV3
         y4oFiPfDscYLizFun9gz1Eb/WwbJ8UAZp6g5cdjCYYsNSHiP3WcoFDW3IRfIUY7Ifoge
         bIZA==
X-Gm-Message-State: AJIora/z+gBLk6UxB3M80d64Eliud2Bsc3/PWOopl2/1tXG3lX1bD2qF
	RT4R2IFPp6KaIll5EUh1btE=
X-Google-Smtp-Source: 
 AGRyM1vAUXK2dXz4JU9jt6V83vs7hG5My8W7m/LDr6b50G+NdtBA1svfQyI5Rvxy4CtlceyofEUvcQ==
X-Received: by 2002:a17:90b:1115:b0:1ec:72f2:77df with SMTP id
 gi21-20020a17090b111500b001ec72f277dfmr18274348pjb.105.1655697401936;
        Sun, 19 Jun 2022 20:56:41 -0700 (PDT)
Received: from [192.168.18.39] (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p18-20020a17090a931200b001e8875e3326sm9205700pjo.47.2022.06.19.20.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jun 2022 20:56:40 -0700 (PDT)
Message-ID: <5f47f1f6-b0d6-814a-d019-c032fbb7e6c1@gmail.com>
Date: Sun, 19 Jun 2022 20:54:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe] [meta-python] [PATCH] python3-pylint: upgrade 2.13.9 ->
 2.14.1
Content-Language: en-US
To: "xuhuan.fnst@fujitsu.com" <xuhuan.fnst@fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1655429612-19310-1-git-send-email-xuhuan.fnst@fujitsu.com>
 <1655429612-19310-2-git-send-email-xuhuan.fnst@fujitsu.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <1655429612-19310-2-git-send-email-xuhuan.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jun 2022 03:56:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97542

Xu,

On 6/16/22 18:33, xuhuan.fnst@fujitsu.com wrote:
> From: Xu Huan <xuhuan.fnst@fujitsu.com>
>
> Changelog:
> =========
> Avoid reporting unnecessary-dict-index-lookup or unnecessary-list-index-lookup
> when the index lookup is part of a destructuring assignment.
>
> Fixed parsing of unrelated options in tox.ini.
>
> Fixed a crash when linting __new__() methods that return a call expression.
>
> Don't crash if we can't find the user's home directory.
>
> Fixed false positives for unused-import when aliasing typing e.g. as t
> and guarding imports under t.TYPE_CHECKING.
>
> Fixed a false positive regression in 2.13 for used-before-assignment where it is safe to rely
> on a name defined only in an except block because the else block returned.
>
> Fixed the use of abbreviations for some special options on the command line.
>
> Fix a crash in the optional pylint.extensions.private_import extension.

Thanks for the additional information. This helps Stable Branch 
Maintainers in deciding if a change is good to back-port. Sames me time.

Many thanks,
Armin
>
>
> bad-option-value (E0012) is now a warning unknown-option-value (W0012). Deleted messages that do not exist
> anymore in pylint now raise useless-option-value (R0022) instead of bad-option-value. This allows to
> distinguish between genuine typos and configuration that could be cleaned up. Existing message disables for
> bad-option-value will still work on both new messages.
>
> Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
> ---
>   .../{python3-pylint_2.13.9.bb => python3-pylint_2.14.1.bb}      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pylint_2.13.9.bb => python3-pylint_2.14.1.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pylint_2.13.9.bb b/meta-python/recipes-devtools/python/python3-pylint_2.14.1.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-pylint_2.13.9.bb
> rename to meta-python/recipes-devtools/python/python3-pylint_2.14.1.bb
> index 1946a8923..d4d2d2c8a 100644
> --- a/meta-python/recipes-devtools/python/python3-pylint_2.13.9.bb
> +++ b/meta-python/recipes-devtools/python/python3-pylint_2.14.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE= "http://www.pylint.org/"
>   LICENSE = "GPL-2.0-only"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
>   
> -SRC_URI[sha256sum] = "095567c96e19e6f57b5b907e67d265ff535e588fe26b12b5ebe1fc5645b2c731"
> +SRC_URI[sha256sum] = "549261e0762c3466cc001024c4419c08252cb8c8d40f5c2c6966fea690e7fe2a"
>   
>   inherit pypi setuptools3
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97529): https://lists.openembedded.org/g/openembedded-devel/message/97529
> Mute This Topic: https://lists.openembedded.org/mt/91813528/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


