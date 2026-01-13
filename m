Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE03D2D0E7
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 12:37:02 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57674.1768307815200083570
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 04:36:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kepCwOyL;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so6388994f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 04:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768307813; x=1768912613; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VklYrTVHe94T1r4pdm4nkZqtd0GK/SWiWfsTweTfsTg=;
        b=kepCwOyLGyD3C73pG2c8sM1arlqqRB0jcZ5v4mdZvNEW1VwNrzS4j0LG0srGtQG+9F
         MxNGJF6KkT8xHgqBokUWErkpOvEHWvSVMJkd7t7VCzBvkmQImuFGxVm/G0sVU5jVsHOh
         Fkszg3hd+97RkT9NL6/lVMbxzrl+I15/+U+2n5Wohnno+AHBgD/hS0zsKr0iPdFyfkyh
         s4/Ep5VvqMDtNm011NZFiqQTTGzoVjS3n47h0+lF45hruMBPKhZusNbTFAOpukjYdoW9
         sM3/L8OM4ScwqQHgxlRPGDkJBYdsOjb6lV3xHLdOybXkq39jPd8Po5iSOu6OvIgQbFHz
         93Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768307813; x=1768912613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VklYrTVHe94T1r4pdm4nkZqtd0GK/SWiWfsTweTfsTg=;
        b=rfkr38I1ntUWPHqADbphSJURq9Mg+8XGcDH0T+qkdOPd3qBipjlwFGoxd794pMd+AS
         A0NfSj4dlC0mLMW96/Jzf7WgMKHOp89vN0EaJYgGGhLNzRes6+M2vZ13WboVCs3XxwCk
         7pK65D4QVkJhmBMk4sXa93GMJ00hD/kKAXBUjQwlvH2NTeW1j9Cz8sjUQDf7J5CkSv2p
         sTQxwct+2fmMB0zSgAes+Gt6aOfAET/HKm9AkXs0gjAq1fZzq31xNFyAVcEsKVB3ZKmG
         ZkvLw9xvzThew4+cCfkT3nFRkTC8aEHn93qWw5enOzfRhJ4YcoGqk5ea0ZNj0WioMAc7
         RrKw==
X-Forwarded-Encrypted: i=1; AJvYcCX7XKQxa/iL8ydsNlHlfTj0LvwFrwizjPFRct5lvTmdJKy17jiOlTCVl5MfEGlEtaJw7w3JGaEwEGFJUDC3zxpX/w8=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwJ4n+sh6bmMDTe9fC6OG0XqPw5ohEexFhQJ6lGffJrTtOr4CuA
	Rxamnqzy0KwjiCq/NJ1P8f0gP83LaP1wJHcEgsDtSyUuvoaoNy60aXYh
X-Gm-Gg: AY/fxX5BvM7uHDyPfZgP8BaSOVcXCLAUQGCFPR87JfBI7o1BYvMHXMXxnNjObZtgCb4
	EUvjW6lJ3JGkEYqiVv7J3mF04zZBKq2pcjWFRv/61ZF4X5/L4AcRxes3tvhq5L6CG319AufdGVR
	KEkLdBeLvSdXISdjr6GcQFIs5Y3+iMBc0EC38mJNKHfNG1/8yyQG8VJRL3whfSu9vf12jKgmVBo
	sLfOtvWA33/1ZB5Ci44f6AGiCJ6IOsrAqB2AyosbNim3sXEfXaHyj6Sq238/1+aFEgB+Ft7RvKP
	FQDzy7T22qDSk7x1mebIxKm5qkCJch9OAn4e/Rag5UiI8SSHKjS+kHr3Bl0tvPVv4J090qYMOc1
	ULA/cOeM61i15Kn01y0QfFf5akg8yxPZl2uKgTNA0ROl8LDRJw6dDu4jNOxGgc6k3LgNuKcwDEO
	H88BPcDVbrpXd3LA0qbH8=
X-Google-Smtp-Source: AGHT+IFuBWX3Y37pORDdiiSXeWy6pmKDyH418y3+N4edvtHh5DZt1l5UN0jmho+W37WQVdTJGaoZwA==
X-Received: by 2002:a05:6000:184e:b0:430:fa9a:74d with SMTP id ffacd0b85a97d-432c3790925mr24147786f8f.24.1768307813353;
        Tue, 13 Jan 2026 04:36:53 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edd51sm44006647f8f.29.2026.01.13.04.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 04:36:51 -0800 (PST)
Message-ID: <769a4be8-60f5-4e81-8223-39fe410f6759@gmail.com>
Date: Tue, 13 Jan 2026 13:36:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-libevdev: Upgrade 0.12 ->
 0.13.1
To: leon.anavi@konsulko.com, openembedded-devel@lists.openembedded.org
References: <20260113103421.3568307-1-leon.anavi@konsulko.com>
 <20260113103421.3568307-5-leon.anavi@konsulko.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260113103421.3568307-5-leon.anavi@konsulko.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 12:37:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123435

Small simplification: if you inherit the ptest-python-ptest[1] class
instead of ptest, it takes care of all other test boilerplate (test
installation, run-ptest creation, RDEPENDS...)

Though I wouldn't submit a v2 because of this - but for next time it
might be useful.

[1]:
https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/ptest-python-pytest.bbclass

On 1/13/26 11:34, Leon Anavi via lists.openembedded.org wrote:
> Add ptest and upgrade to release 0.13.1:
>
> - pyproject.toml: add pytest as dev dependency
> - Import Self from type_checking if needed to be compat with 3.9
> - CI: run pytest via uv
> - CI: test against multiple python versions
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../python/python3-libevdev/run-ptest          |  3 +++
>  ...vdev_0.12.bb => python3-libevdev_0.13.1.bb} | 18 ++++++++++++++++--
>  2 files changed, 19 insertions(+), 2 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-libevdev/run-ptest
>  rename meta-python/recipes-devtools/python/{python3-libevdev_0.12.bb => python3-libevdev_0.13.1.bb} (52%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-libevdev/run-ptest b/meta-python/recipes-devtools/python/python3-libevdev/run-ptest
> new file mode 100644
> index 0000000000..8d2017d39c
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-libevdev/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest --automake
> diff --git a/meta-python/recipes-devtools/python/python3-libevdev_0.12.bb b/meta-python/recipes-devtools/python/python3-libevdev_0.13.1.bb
> similarity index 52%
> rename from meta-python/recipes-devtools/python/python3-libevdev_0.12.bb
> rename to meta-python/recipes-devtools/python/python3-libevdev_0.13.1.bb
> index cabcfd8df6..1c8a99eb33 100644
> --- a/meta-python/recipes-devtools/python/python3-libevdev_0.12.bb
> +++ b/meta-python/recipes-devtools/python/python3-libevdev_0.13.1.bb
> @@ -5,13 +5,27 @@ SECTION = "devel/python"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d94c10c546b419eddc6296157ec40747"
>  
> -SRC_URI[sha256sum] = "02e952632ec6c249cbb9c66f6fa00012ea448b06606c77cd139133bc2fe46b08"
> +SRC_URI[sha256sum] = "dc3369cd1401767b9ecb1117cd6b73faba9038e3bd9e1695a710a9e9d9415e8d"
>  
> -inherit pypi setuptools3
> +inherit pypi python_hatchling ptest
>  
>  PYPI_PACKAGE = "libevdev"
>  
> +SRC_URI += " \
> +    file://run-ptest \
> +"
> +
>  RDEPENDS:${PN} += " \
>      libevdev \
>      python3-ctypes \
>  "
> +
> +RDEPENDS:${PN}-ptest += " \
> +    python3-pytest \
> +"
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/test
> +    cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
> +}
> +
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123434): https://lists.openembedded.org/g/openembedded-devel/message/123434
> Mute This Topic: https://lists.openembedded.org/mt/117241112/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


