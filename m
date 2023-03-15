Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B751AC6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:18:30 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.9323.1678889908099344993
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e0ZhP6/k;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id fd5so42302018edb.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 07:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678889906;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hHmAJqjGwOrvmzqyCdbn9AI/nwRDsF9+iVvnznSXJtE=;
        b=e0ZhP6/kex8JfIAWeqTbzqUHUquUdHNcyhqK1RJI+avaTtbP3h+X3sSLqz8LAH+0zf
         SUgPAbAJKiOrrky6/V/wJ+7ENkm1Hv9CcwN4ipGQJnqA1sNrGhQtjr8a4eSPzHHdp2Iy
         0tvJbmJHVPXb5Dm0Sujf+lqpEQ13fnvOelKxBQcO8bgheduPSqS9/SdoRaiKTJfv7rPd
         k+whrB7nZiMtFtVk91PomZJaarGwiqTX1Juain1wauc8LeME9+gEc0vuS9NbUTycs3Kp
         vb5nl1YeqMsSR3Kuhews8LkiyADpD3KW3TqeEWcrjGAHw7rENpmIoWpcNmxEFuxfEH0j
         VqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678889906;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHmAJqjGwOrvmzqyCdbn9AI/nwRDsF9+iVvnznSXJtE=;
        b=Zc105I2OfaIwBGT3FlYUm57hmmC/zV6dY+beoJ6C53pCVjqxXQonFHQAVxc7GywdlK
         6fTW6jKCobWinu56zfBfyJx1YVw3g9YLMbMebJvBqdt3lidRPUiC+b2Wi1yWgy8tR2Sp
         yKGaqDNHR4fV7GSzzU4IXD1Cp5aHVRpPG6TgV/PRoJX2ivLKT/FSY/SvgLglvtSfWnSM
         rgJq0fZaN1z2fWLRL/RyRVzyzahgj7JLYsj7I4zK51OR+F9CWQvexFJo+rL7hphuEEm5
         S71RAipwmgGgYmvtgWb6SMy0hMdBYcQDxTwikKiueNTt2feLcSVMG20i06c9KmTfIvAe
         O8uQ==
X-Gm-Message-State: AO0yUKWCQiM9e/dAGJmDYI1BYMsQq+H+Q9P7s/eFClFVEg1ANKhT2G9j
	R8tioZnTzTQbzPULbOII/npxwNnYUqY=
X-Google-Smtp-Source: AK7set9UT3PEXeGPor8Rfv+tsAfJ5ZKZ6gAJOeFrMpE8lxgZZh4TeCz7NKWqYyCWsS+xjAoF1P2uGw==
X-Received: by 2002:a17:906:6552:b0:886:7eae:26c4 with SMTP id u18-20020a170906655200b008867eae26c4mr6400498ejn.5.1678889906628;
        Wed, 15 Mar 2023 07:18:26 -0700 (PDT)
Received: from [192.168.1.143] (BC2440CC.dsl.pool.telekom.hu. [188.36.64.204])
        by smtp.gmail.com with ESMTPSA id z92-20020a509e65000000b004bf5981ef3dsm2526856ede.94.2023.03.15.07.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 07:18:26 -0700 (PDT)
Message-ID: <55bf6202-445d-51d9-9502-34a2180fbe42@gmail.com>
Date: Wed, 15 Mar 2023 15:18:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [oe] [meta-python][PATCH 2/4] python3-patchelf: New recipe
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20230315080429.2722555-1-zboszor@gmail.com>
 <20230315080429.2722555-2-zboszor@gmail.com>
 <D47E7172-2A7E-4B2A-9F1B-CFEE77D06563@arm.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <D47E7172-2A7E-4B2A-9F1B-CFEE77D06563@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101562

2023. 03. 15. 13:42 keltezéssel, Ross Burton írta:
> On 15 Mar 2023, at 08:04, Zoltan Boszormenyi via lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org> wrote:
>> +++ b/meta-python/recipes-devtools/python/python3-patchelf_0.17.2.1.bb
>> @@ -0,0 +1,31 @@
>> +# This is a dummy package needed by python3-meson-python
> I note the words “dummy package”

See the sources of https://pypi.org/project/patchelf/
There is none, only the build system.

The build system would have just built patchelf, and
installed into ${bindir} which would conflict with the
existing patchelf recipe.

>> +DEPENDS = "python3-scikit-build-native"
> Where is this dependency from?

 From its build system. The meta build complains.
The scikit-build recipe I previously sent was already merged,
so it may be used.

>> +PYPI_PACKAGE = "patchelf"
>> +PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
>> +
>> +inherit pypi python_setuptools_build_meta
> Why is it downloading stuff?
>
> Why is any of this needed?  Can’t we just comment out the requirement for patchelf, or write a proper stub package?

It means less patching in modules depending on this
particular module, like meson-python.

Do you prefer patching out this dependency from meson-python
and any other that may depend on it?


