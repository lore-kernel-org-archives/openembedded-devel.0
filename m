Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E42C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 08:45:56 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.46461.1739177150189821837
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 00:45:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sj1wooB0;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4362f61757fso40191395e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 00:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739177148; x=1739781948; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V70i2/DAQtfRd+5O5v8VBh+evgsnQ1v5zciVeQfA7x8=;
        b=Sj1wooB0gYeRHT4Rc6ZdrDu3ECIhiRQr72HBezhwi/uRZHm8oJ+OX/Y541uPLjl9XG
         SQot3ty9iBPR85JTcbTkHcyiN0CnhEPKIWtVaI7oATG9BN6RI5NVTTdvBxi6XqiPMbW3
         nUp+jPsi5vG2PhIZThpzj4PHI84rY2E3XLufwSt4ldC0L2+mIkqh4DAIVhiS74RmcPZf
         Fmmarx6FRKYU49HFd6qZY9ed8ygi0ITPjOGzsdAF5Kk+bLMhQfNRXUtRA9ndskZ8gpaD
         KJ8zlT3cjXNy4w/Oab2aCEksfY7hVHgocXviPxo86M54VXphaSNNxwBFifg22lL97k6f
         LEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739177148; x=1739781948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V70i2/DAQtfRd+5O5v8VBh+evgsnQ1v5zciVeQfA7x8=;
        b=mrzxyUAZ9EybL4vssloGNGAUf0sSSfPD2xuMClS0tdhokeFGogFMD17c9fb6+Ux4bi
         zxnQhhmaZ5XDpjq4EZD+Lc+SL0/CmSj28xSYEYaQb3QFN2J7YZXx/S3TzHVzZG8qvNj/
         +yfUhLkyyY07k0g+KaE/Gye4KIg3mF6kEtnKVZRtqR4fipOatZ/w7jur/BjHGFT/LdXD
         MlJET18bLSh7N/xZkP/sf6QO3KxJqIrjVQnYMlGrDSwzHl5irWJtWkpbNPUGT2COWyYK
         A/dseMIanL6YXKFuby76YXI93//hbfNv0/CbFKS3YMlYnst9hUBy/0/rGZV+LU8TzQAK
         +Zhw==
X-Forwarded-Encrypted: i=1; AJvYcCXLEcFtWXJdPukyJvemGBxzb3rYOfnp3krv8Cq1S4eGqiauWCYbMQNT6ISRIaNY0nOIjyg2ch114K8F8xeQyy54s98=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxfv51yNIrxWfpXJpy0XiZ6Yn+M6fH2TX9PBbHCxFy6pGl8M7cJ
	bzIExQHG5XzuJ/kV3aH0i+yvncZbhV8PnG2FVhr753ozjzYlCGll
X-Gm-Gg: ASbGnctGMKguHrQVEX8p2v7/xX8dybRAJA6mLEajgCVsfgLh0pPDnWEkNu2JciacPQ/
	o+uKJGugAuPVGwEB+5Jm4GzQSv/SivMljEaIofKpf8RyF1kolCVv6z6uvhrvazeTLDFfQRm1oDB
	Ajwkbtee/WDDLvtHTr6IQBaYXESYPfFEH4ra2XJZH/G2C7MqzZL6YzPE32XQF4zLmBCTMW+RiNP
	m+x9IORH50kd7abxcOhunopcmY9a1UqrmwTgaL8zAf3flQ3xm/M9LzKllnsj2YcFKulwhk6wCPL
	dpU5rJI6F6I3dKnQcr2rk4I=
X-Google-Smtp-Source: AGHT+IFsVh7twec/EQgy9BjnvES/J01W3W/Z89WryVb2R56G/rtIFLnGxymNzRgp9fLeW7Kr6FekFw==
X-Received: by 2002:a05:600c:1f10:b0:436:fb9e:26c with SMTP id 5b1f17b1804b1-4392f4e14e1mr56699375e9.17.1739177148336;
        Mon, 10 Feb 2025 00:45:48 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439492affe2sm5813665e9.28.2025.02.10.00.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 00:45:47 -0800 (PST)
Message-ID: <70985d7a-1c09-48f9-a04e-049ffb7c4a74@gmail.com>
Date: Mon, 10 Feb 2025 09:45:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] Disable FASTCV HAL implementation
To: quic_ptak@quicinc.com, openembedded-devel@lists.openembedded.org
Cc: quic_sssanjee@quicinc.com, quic_vkaruchu@quicinc.com
References: <20250210075352.3942800-1-quic_ptak@quicinc.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250210075352.3942800-1-quic_ptak@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 08:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115328

> +#Fastcv based Opencv HAL/Extensions are not supported on all platforms, hence disabling it by default
> +PACKAGECONFIG[fastcv] = "-DWITH_FASTCV=ON,-DWITH_FASTCV=OFF,,"
Is there a dependency missing? Using this new packageconfig fails with
the following error during do_configuration:

| -- FASTCV: Downloading fastcv_linux_aarch64_2024_12_11.tgz from
https://raw.githubusercontent.com/opencv/opencv_3rdparty/dc5d58018f3af915a8d209386d2c58c0501c0f2c/fastcv/fastcv_linux_aarch64_2024_12_11.tgz
| CMake Error at cmake/OpenCVDownload.cmake:210 (message):
|   Not going to download fastcv_linux_aarch64_2024_12_11.tgz
| Call Stack (most recent call first):
|   3rdparty/fastcv/fastcv.cmake:29 (ocv_download)
|   cmake/OpenCVFindLibsPerf.cmake:188 (download_fastcv)
|   CMakeLists.txt:800 (include)
|
|
| -- Configuring incomplete, errors occurred!

