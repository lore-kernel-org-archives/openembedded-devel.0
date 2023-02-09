Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E748AC636D3
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 21:56:24 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.125.1675970761428083445
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Feb 2023 11:26:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RmDoGJie;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: fntoth@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id j25so2887209wrc.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Feb 2023 11:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0NjjuwOeGaskuQGjqrHKUS82QA6DmSZK/v6m4eFwzHI=;
        b=RmDoGJiefxV0fXQcOoqQEvKqR5DNp8YpCRFEGiNasDhsBu01eerMP2l9mPL7SufuyY
         uB4IgdDX0TfY9S9pkaU5O+0iEwOh0YUyjCZcg+7AgNfq3JAIg4PsC/AMEX58wVkVhI5u
         0GqvH2Y8Rpel39wi8dqmqWl/vlsxWYYSC3lbPI/xoMFtj3A3WbLQcipO5H0Vju/OHrLR
         ubQINCd4jGFJBdFeVu524UCX+1cHdKQXArB5PzmYzC8BUrO4rpb4/Xlr/bXF1S6Q8vW5
         UvtVQfNHPiDxAyAKtnEYJIh4zuF72ceA3wF2Knz/1/QmbUj1dKfG28BVTuPP8pE53GJC
         6JkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0NjjuwOeGaskuQGjqrHKUS82QA6DmSZK/v6m4eFwzHI=;
        b=3W8+R8Hioo3r3njq3HDp/v0gdDmW6grWWsNMjDlwrSuiJJ2XTyJlPgZSo41fKy4XJ/
         8xoXX0BMCbUKxIUo/EVIbRcKtywK7F8wMhw6oRJ/t01J+fZnh3Tx92bjQbO4joGzoz4Y
         PGwQRu4snAm5EduZbFZ4f/YQrKc0LG69bOd5WhitrVZulIVESsdPJHAGt19iZziv4vXi
         FtAAuDmHBfXaPmrt6W83EqLthKNQBLPMNFGqQSiGqWeoE2O5cbCATlavkMH+beEfBIpo
         jHVs5PP/tWA21b/xqvaZZ5T5DlrKrZxCybwo6D/En4OMyiShur4FJHU2pzIC7C1QIgmH
         BEUA==
X-Gm-Message-State: AO0yUKV8h+EsIo3cVTkcWgkuJh3M1Wc07v3Abs21EFCURM8yL6mzB/My
	aM21Lev5zu+G2qIvHDvRim8=
X-Google-Smtp-Source: AK7set+OOL8g3oovFSEs11Z2nDEUmWLc+rc2UtJIFvwNhsE0U6dZ+7z8HcNOcU1Ccoi6l4bUbLYsng==
X-Received: by 2002:a5d:680e:0:b0:2c3:def6:3659 with SMTP id w14-20020a5d680e000000b002c3def63659mr11613979wru.35.1675970759620;
        Thu, 09 Feb 2023 11:25:59 -0800 (PST)
Received: from ?IPV6:2a02:a466:68ed:1:808b:d1fe:f63:1ce1? (2a02-a466-68ed-1-808b-d1fe-f63-1ce1.fixed6.kpn.net. [2a02:a466:68ed:1:808b:d1fe:f63:1ce1])
        by smtp.gmail.com with ESMTPSA id l5-20020adfe9c5000000b002c3e7474b0fsm1954145wrn.13.2023.02.09.11.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 11:25:59 -0800 (PST)
Message-ID: <b49ddb5c-3f15-2887-8f53-c6d73c93afa2@gmail.com>
Date: Thu, 9 Feb 2023 20:25:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [oe] [meta-oe][PATCH 0/3] libgpiod: add support for libgpiod v2
To: Bartosz Golaszewski <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>,
 Bruce Ashfield <bruce.ashfield@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230208152541.136848-1-brgl@bgdev.pl>
From: "Ferry Toth" <fntoth@gmail.com>
In-Reply-To: <20230208152541.136848-1-brgl@bgdev.pl>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Feb 2023 21:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101012

Hi,

Op 08-02-2023 om 16:25 schreef Bartosz Golaszewski:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We've just tagged the release candidate for libgpiod v2. This is a major
> release entirely overhauling the API in a backward incompatible way.

Thanks for creating this!

> While this is not the final release yet, it's not likely to change much so
> I'd like to make it available in meta-openembedded to give it exposure to
> some testing. When we do release v2.0, it'll be just a matter of bumping the
> version.
> 
> Currently no other package depends on libgpiod in meta-openembedded, so I'd
> like to avoid having two packages (libgpiod and libgpiod2). Instead let's
> provide recipes for both versions but keep them under the common libgpiod name
> as it's unlikely anyone would need both versions in a single system. This is
> after all a medium-sized project that shouldn't require too much work in order
> to port a user to the new major release.

Nevertheless there may be packages in other layers using it (meta-acpi, 
meta-intel-edison). I think there will be a period where both may need 
to coexist.

> The first patch contains an update of libgpiod v1.6.x to the most recent
> bug-fix release.
> 
> The second contains the recipe for libgpiod v2.0-rc1 while also moving the
> bitbake code around in order to factor out common elements.
> 
> The third contains a recipe for the python bindings that are now in their own
> project in meta-python.
> 
> The new recipes provide the same functionality - including ptest for the C
> library, tools and language bindings.
> 
> Bartosz Golaszewski (3):
>    libgpiod: update to v1.6.4
>    libgpiod: add a recipe for libgpiod v2.0-rc1
>    python3-gpiod: new package
> 
>   ...-don-t-expect-automake-to-set-PYTHON.patch | 37 ---------
>   .../{files => libgpiod-1.6.4}/run-ptest       |  0
>   .../libgpiod/libgpiod-2.0-rc1/run-ptest       | 24 ++++++
>   .../recipes-support/libgpiod/libgpiod-src.inc |  1 +
>   meta-oe/recipes-support/libgpiod/libgpiod.inc | 61 ++++++++++++++
>   .../libgpiod/libgpiod_1.6.3.bb                | 82 -------------------
>   .../libgpiod/libgpiod_1.6.4.bb                | 37 +++++++++
>   .../libgpiod/libgpiod_2.0-rc1.bb              | 21 +++++
>   .../packagegroups/packagegroup-meta-python.bb |  1 +
>   .../python/python3-gpiod/run-ptest            | 15 ++++
>   .../python/python3-gpiod_2.0-rc1.bb           | 45 ++++++++++
>   11 files changed, 205 insertions(+), 119 deletions(-)
>   delete mode 100644 meta-oe/recipes-support/libgpiod/files/0001-build-don-t-expect-automake-to-set-PYTHON.patch
>   rename meta-oe/recipes-support/libgpiod/{files => libgpiod-1.6.4}/run-ptest (100%)
>   create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.0-rc1/run-ptest
>   create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-src.inc
>   create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod.inc
>   delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
>   create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
>   create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_2.0-rc1.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-gpiod/run-ptest
>   create mode 100644 meta-python/recipes-devtools/python/python3-gpiod_2.0-rc1.bb
> 
> 
> 
> 
> 


