Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BED9C0219E
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 10:27:59 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.47748.1739183268971076828
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 02:27:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PCU9Fz8X;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4368a293339so46708385e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 02:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739183267; x=1739788067; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:to:from:content-language
         :references:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UqrqiTPYfVHrgia/oK+t2N87Lva+iE+VxaTA51tHWFk=;
        b=PCU9Fz8XAsGAZM+iewA2DCJqmE6WldXp0wr/eotq1c4z3m18uhUxJR6/CQzWoLgGV5
         yLdzGITM8io/jGuVcrl4nCAIAp2ag6KLHqpSjxJIRpS3LAK7TbNiCnEibO1nE7Vugakc
         SB/u+m0UQgD0R2zEUWJlPIhJ7B5ZYYPPMgO787zhTk1g2gYRh2rBZ0/dVkmLPs8XwAbW
         AQj8EwnWrXL62m87DxA0I1m11Jety1TWnbaemMf2bQyH2K3BBemKynzAx/rFTDpI/tfQ
         9YYuzZUlg4MMdalGmZau4k2sD90zjGSscs5BAiiIJI+HUXqB8PduOuf9czANmo9Npjbo
         xE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739183267; x=1739788067;
        h=content-transfer-encoding:in-reply-to:to:from:content-language
         :references:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UqrqiTPYfVHrgia/oK+t2N87Lva+iE+VxaTA51tHWFk=;
        b=LOBGaCxXr14aSRxHd7sb5oG2CQDxH/3nPty4ASIQD8kryeLwahQYjUuvpFWsQThIx9
         dIhCCiqSvRDmdtEYm/gZqKGQz1jTC+oWnsXbSY7VpzPnehXgtG+lsojA/7TMC+2TStv4
         zZGTPmyuXk0FZy7KxrH7U4awlcaISd0Oz3FuRURehbRtr5KQ9xG8aVnoifmotGrZRd99
         avIpIGeb8+8N8bS0nWUH3u2HNBgxfIsMHaldm25v4LWExCJiTc5ZXmYuACRYaHUEdVRR
         RHM5msF9kW63mf9klpaXb4v7vdmsqJq0LSeeA6QbuJeNUsIQCthJDbJcIDaXCM3Swfkq
         9S9Q==
X-Gm-Message-State: AOJu0YyZGiGBhzwTr1Z6LuG+BNj13jK1i1JuAkPe49v/ZIkvHECQrp5Q
	aR1b5PryxIRFkaSn+4nPNsALntxQvO9fFta5UFaVg8ivM6wxp07oI42tcxOW
X-Gm-Gg: ASbGncsdTOMvkP9GScanewLf78TfWKBVSJQqfx5jqkJKDJg/Hu/Qq/MtVNExfdN7uWc
	eN0Xz/kKAUfdqLPFiTWCP0TuX5EmevY9C3o2ehWlGxpLcDxfQhV+Oi4/eBV3teIBQhlMm8v8PA5
	4lDie0VyjHfaZkVDa3Hlu9z4wHEstvnVlmofJLUBO2jwqdSEGiGQk3RYVxRNw1X54Ok91N261W8
	v1uAerHgKdFoXr3VItJaGYOC8WitFmxCjoEyOEClEOpYHxdCVT7KfI0VJKLuzUUZjdWgPr+OsT4
	yFN1+/odu0jBCc5SqCtQy4w=
X-Google-Smtp-Source: AGHT+IGQZZyuxiGtsKPrig5iVqMxn2B8j3T2LyY7t95Yk5tHDT4iK9HCwi6WTznQK0OMSMesvBRb5Q==
X-Received: by 2002:adf:f58d:0:b0:38d:a8f7:cb73 with SMTP id ffacd0b85a97d-38dc9138f08mr9031984f8f.40.1739183266880;
        Mon, 10 Feb 2025 02:27:46 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd150eed5sm7127461f8f.28.2025.02.10.02.27.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 02:27:46 -0800 (PST)
Message-ID: <4e8eb4ac-a4dc-4beb-81ca-4bcfe7179722@gmail.com>
Date: Mon, 10 Feb 2025 11:27:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] Disable FASTCV HAL implementation
References: <23700.1739182003353626062@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
In-Reply-To: <23700.1739182003353626062@lists.openembedded.org>
X-Forwarded-Message-Id: <23700.1739182003353626062@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 10:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115400

(Please keep the discussion on the mailing list)

I have enabled the fastcv PACKAGECONFIG in my run, since that's the
point of having it, isn't it? With that it has -DWITH_FASTCV=ON amonst
the CMake flags, and that part seems to work as it should.
Did enabling this new PACKAGECONFIG flag work for you?

-------- Forwarded Message --------

Hi, 
 
It should not download the tar file when FastCV is disabled.  Try
sourcing the env again and check for the flag : DWITH_FASTCV=OFF in the
configure file.
 
On Mon, Feb 10, 2025 at 12:45 AM, Gyorgy Sarvari wrote:

        +#Fastcv based Opencv HAL/Extensions are not supported on all
        platforms, hence disabling it by default
        +PACKAGECONFIG[fastcv] = "-DWITH_FASTCV=ON,-DWITH_FASTCV=OFF,,"

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


