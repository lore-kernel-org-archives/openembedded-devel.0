Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D2ACAC5B8
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 17:10:56 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.617.1758906655171164126
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 10:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WrFYe9Dl;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-88f2740619bso110074339f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 10:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758906654; x=1759511454; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GVu1PYxBEjymVAcM0h5HOieOVZD4mycFrP/bbouaIkM=;
        b=WrFYe9DlN3br2IZYttsVnSsbEhA+crHFuY/IWEKqZx4AoHhZ3IugNJsNn8QJjHYgkH
         MQ92MXeMOfABjYIRydqOsshST4MA9GwKLyEojAWuNqZZ73VI6Ja1dThqLjiaJv/yXDA/
         RTVqF6Lyr8Nc8AQ7AK4ms8V2WGn44pzczvYZlRvgGHHlmb98Mmp9Zln63Gi25e1vKKhs
         28+pvrqSHHIxbglVTefetLblweAx8o2OsHg9C0jba7/RWlE6szRicKaKd75dRz/7NS3R
         xmVuF/1r+ZJM6j0TeECgvswJMxORvjvyLI26Jo2bUCd8UvcFD/S1Z1BS69goBEt5CLbe
         u9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758906654; x=1759511454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVu1PYxBEjymVAcM0h5HOieOVZD4mycFrP/bbouaIkM=;
        b=ucq2Z2dORUZKbU3IEVEPejWKBlBJcLa1HbNcSoCBTIlbzOF48LP945VxUskG5MzKfp
         xx5YFV4jVujGQ1dNqgLloRIyIJ5S+GZGk5pz2NXN+4MPZGBzboAqv6CHxW922HntQA9+
         WnnhCNp8Q9N+SFlc8dsHtae0mD8nxmJR8mgY7sczxOMHzRUKl76X6/Hlk/8ty5bKrTYj
         h9lJAuTG02Ctc8bXQEEt6G3ICARJ2KM6j/VLA3Vxb4P4wXUyVUkZUqaXCara6VO//lFi
         +lIzByDePTzaI9cSI/h10oMEEwZEeIk8XfvoCvvH0SgtxfPXy67MgP6RUHO725pJBsVL
         xSTg==
X-Forwarded-Encrypted: i=1; AJvYcCV5mPP3xd8OBBBznlrbup3va4uuC8ZyjTiraYveQ1LL0ZbHfGjOmDPkANJytZa9qBIbFyf6VNd/HYtyq1qerpRRRGw=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzOgfgOf6s91enEqN543yFBlnPqfKUgr/LFfFPhFFbkygejln4r
	1ap4HiMUxA5+Bonq/SON0Slgd95QVuQxeTmeYJcNy7UOanIdoT27mR/sE6gxn0ET
X-Gm-Gg: ASbGnctTFCsKfQWnKXHRZywit9plwqQYQuXJcB5p2Mk5e3V2lnlKRSIQPILMQLOFb9C
	uu2bVbjvu7Gr8OJZW0tZnSy7NZ66UaUXFXytftl3pnCth4hvYk5vVMfJhwU9+ygmaC9nLMJsLrc
	HsbA2PhwUm/Vudq3Uvfwv+Kx07KnXljiIei7DUGVC2SDUwHEo2fry5JgUP4Sf705SHJ3NoO2trw
	Uu4I2zAsHoChU1j1kZo1ac2FIz0at/X4nplu4Fic31o7oNBNBdPjBtq8p1x+Z7keXRfuSmXT5Or
	vtmrNIVEPIebOGbpUUwNVMlHvv0C8frX0UpbDRDTjuNPTe3KI/v9s6ufJq6mtggU2hwktc4MXT0
	lldkcLa3RJYmAsO4Y5pxphPOK4iU6sd7iLHi2e8kAnFxTGyu+HEzeA+T02Autf2W7biOYxQNvyn
	AV+hB7PVnTpcGGp6Yt75WGl/uH14muS3e85O4lIVKramkJuFX7zM5fNv+nHhiXPBo7cmdtBwgOl
	yFkwlkHiCW+r9J+jJl6u2J2J4/Z0F3/37WVfkw4dg==
X-Google-Smtp-Source: AGHT+IFXlkAcSVY2jmO+epqECKng+xcaeA3YNCIlt7GD8GKTa9DfkyKLbtR0V5xAlSFZo2wjzeBquA==
X-Received: by 2002:a05:6e02:184e:b0:425:e850:b2e3 with SMTP id e9e14a558f8ab-425e850b550mr104684675ab.32.1758906654184;
        Fri, 26 Sep 2025 10:10:54 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:8d7c:fa44:7948:cb52? ([2601:646:8201:fd20:8d7c:fa44:7948:cb52])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-56a69a1b7f9sm2032111173.53.2025.09.26.10.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 10:10:53 -0700 (PDT)
Message-ID: <aa332d23-cdd4-4b05-a0da-6163941bc83f@gmail.com>
Date: Fri, 26 Sep 2025 10:10:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH v4 1/6] python3-frozenlist: support
 reproducibility
To: hongxu.jia@eng.windriver.com, openembedded-devel@lists.openembedded.org
References: <20250926081914.3127272-1-hongxu.jia@windriver.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250926081914.3127272-1-hongxu.jia@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 17:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119935



On 9/26/25 1:19 AM, hongxu via lists.openembedded.org wrote:
> In order to make the generated library be reproducible, build wheel
> in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain's
> option -fdebug-prefix-map could work as expected
> 
> Note: To support reproducibility, it also requires oe-core commit [1] to be merged
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=61d98d12eca1c7bdf3b7387a820c83d3b8fad965
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   .../0001-build-wheel-in-place.patch           | 31 +++++++++++++++++++
>   .../python/python3-frozenlist_1.7.0.bb        |  3 ++
>   2 files changed, 34 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-frozenlist/0001-build-wheel-in-place.patch
> 
> diff --git a/meta-python/recipes-devtools/python/python3-frozenlist/0001-build-wheel-in-place.patch b/meta-python/recipes-devtools/python/python3-frozenlist/0001-build-wheel-in-place.patch
> new file mode 100644
> index 0000000000..84f81da775
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-frozenlist/0001-build-wheel-in-place.patch
> @@ -0,0 +1,31 @@
> +From 606843ad079d9d0dac1172533d42b5a2327b99ed Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Wed, 17 Sep 2025 15:41:09 +0800
> +Subject: [PATCH] build wheel in place
> +
> +In order to make the generated library be reproducible, build wheel
> +in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain's
> +option -fdebug-prefix-map could work as expected
> +
> +Upstream-Status: Pending

This is worth submitting upstream.

> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + packaging/pep517_backend/_backend.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/packaging/pep517_backend/_backend.py b/packaging/pep517_backend/_backend.py
> +index 61cad34..d5d839e 100644
> +--- a/packaging/pep517_backend/_backend.py
> ++++ b/packaging/pep517_backend/_backend.py
> +@@ -316,7 +316,7 @@ def build_wheel(
> +     """
> +     with maybe_prebuild_c_extensions(
> +             line_trace_cython_when_unset=False,
> +-            build_inplace=False,
> ++            build_inplace=True,
> +             config_settings=config_settings,
> +     ):
> +         return _setuptools_build_wheel(
> +--
> +2.34.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
> index 7d813a026c..d832494c82 100644
> --- a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
> @@ -7,6 +7,9 @@ SRC_URI[sha256sum] = "2e310d81923c2437ea8670467121cc3e9b0f76d3043cc1d2331d56c7fb
>   
>   inherit pypi python_setuptools_build_meta cython
>   
> +SRC_URI += " \
> +    file://0001-build-wheel-in-place.patch \
> +"
>   DEPENDS += " \
>       python3-expandvars-native \
>   "
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119899): https://lists.openembedded.org/g/openembedded-devel/message/119899
> Mute This Topic: https://lists.openembedded.org/mt/115445260/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


