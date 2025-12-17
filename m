Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B47D66B83
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 18:21:38 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21415.1765995692023090184
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Dec 2025 10:21:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P+P6bvUF;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47118259fd8so61388215e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 10:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765995690; x=1766600490; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4YE2GD/MoHOXYd9jC4mmWTM9dl+JOx3J5ad+/180Bg=;
        b=P+P6bvUFLvx8/Iuy1fbvjaPuXGjAY8eAOSHhDLJ+MHOTvwH8Yjh4uJxODS0NRHYGJE
         JxxIAV3owDG+8Q88TGjRjM9bJV/zn998ft0LdgbGPbTe4jDV+vf8/uwL+xaWV3yBWXem
         jG+MT9XdijvrxOj9hgZ2la1tAqQv6Z8M0vHAg23xvZdNb8QqrPJqvNY4+900Dlemkbyn
         7qUYXrSk36evTcg5lJNAv5oo3cl3vuSfunNjVMPnls0pjodb0BA71336drPNsjwyXlc6
         GP8i8vpO1DHr+4hUhdNAFozAgi/NR9qCYwHdSwhTlIrH1aNVgzNLmrzLmukTEAbuwIGD
         /99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765995690; x=1766600490;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L4YE2GD/MoHOXYd9jC4mmWTM9dl+JOx3J5ad+/180Bg=;
        b=I6NutRgOQdERc+GS6/CwZbabbCT/dXwW7dtzEowtMjlaNl53y72vqUA+EdVmrdjLoE
         XolXzzPxM8VD9BOA1ySIk9KlTnvY2fSButHmFbOD05AgAt0Lgcy0CgsNv+bHEUCr1yUg
         AOu4ArEmY8Zttw1HV9SRiYpEQ5lsEFIIPHhY7NMNPywcB+zgE1kg/dKyJYr3GlsgjunC
         KjK2nqLbBv29Qva1gxE8uUPT0UuxPmdGbCaJE70mz0T/7DsyDpeYv85TVoj7cPBnTNPE
         tGokuChtwXyvlORdDPxcM/yejrHnF+iL3D4WVB9c2lZ7x5lxDYPj71JUdURGWYVXkqx/
         r+SQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+nAIAjr7SdBzv5RwenDSDBrGkLV2XJvCyhUj7GU0OAicDpN32m9FNkknjk+SxE0x5H3oSBuMSo/5M49ZwR6Gyi+g=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxkr0CYAbHZcMGGIV0ZR61+LkF2eBtHDrgXNecV2QDEdnTjx/Rk
	EXWWcfcgwz4RGrP1rH/mqfr9wn+HnsUZCBO7IeDr1DXa4MfTh3qj5Wfd
X-Gm-Gg: AY/fxX7vpkZF2FHXFv4yRzNqdgn0YVZgWBeEQBVw8MG+SJLwpS5UESpHp+XrvBtKlCw
	W5/YTNv9q0BLXbPlcL7XH7Xz6rhySEIsd/9hmfeFl4EDSHFtyQ2H+lPk44Zjd03FbsKaB1rcHAW
	QV5CPbZspj7qHDxtMK6+EHrLi74UslWR5eh/OqMA0w31mFMk413W5wYJcyPfuXnXKf+oPk+YQWi
	+Ax19J8d70UMINb1viRgk+nTbP3EgHkDg9AvI71xBz1tuCBcEwaZtgztfuyfxhTR8tYHK7vXvTD
	6ddBBII/Mu/xOOBhsKh0CrQYKJEpkU6pij7sdSZvemI9d3Ph41ITwtFkOB+88TBt8nst+KfmYiz
	Wcjj40rGnHO7W/hZhQ59fRavz7zdqZquHc6apzL7JQEGcHxGIoEPE3kbae971oxywCBigQV1Cgh
	NO3TB9a+ptDqcvYZMxj1ax4514ncl/nA==
X-Google-Smtp-Source: AGHT+IEZyaF8bjvPd18RbIgghLA8p6k9LuoQVPo8fMTYTT5Q9A8RdaRZr02VNGf1JKOBK9YmqfZpkw==
X-Received: by 2002:a05:600c:310b:b0:477:af07:dd22 with SMTP id 5b1f17b1804b1-47a8f90f091mr166887445e9.28.1765995690135;
        Wed, 17 Dec 2025 10:21:30 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm4778795e9.12.2025.12.17.10.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 10:21:29 -0800 (PST)
Message-ID: <c13df59c-007b-42ce-ab2f-6fe77ceb20e7@gmail.com>
Date: Wed, 17 Dec 2025 19:21:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/2] drm-lease-manager: add new recipe
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: rbarrau33@gmail.com, openembedded-devel@lists.openembedded.org
References: <20251217161114.403899-1-renaud.barrau@madic.com>
 <20251217161114.403899-2-renaud.barrau@madic.com>
 <ac14ae52-176f-4705-8759-e68a1649d9d7@gmail.com>
Content-Language: en-US
In-Reply-To: <ac14ae52-176f-4705-8759-e68a1649d9d7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 18:21:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122729

On 12/17/25 19:14, Gyorgy Sarvari wrote:
> On 12/17/25 17:11, Renaud Barrau via lists.openembedded.org wrote:
>> From: Renaud Barrau <rbarrau33@gmail.com>
>>
>> Create a recipe for the drm-lease-manager project  https://github.com/AGLExport/drm-lease-manager
>>
>> Signed-off-by: Renaud Barrau <rbarrau33@gmail.com>
>> ---
>>  .../drm-lease-manager_git.bb                  | 20 +++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>  create mode 100644 meta-oe/recipes-graphics/drm-lease-manager/drm-lease-manager_git.bb
>>
>> diff --git a/meta-oe/recipes-graphics/drm-lease-manager/drm-lease-manager_git.bb b/meta-oe/recipes-graphics/drm-lease-manager/drm-lease-manager_git.bb
>> new file mode 100644
>> index 0000000000..621a08f324
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/drm-lease-manager/drm-lease-manager_git.bb
>> @@ -0,0 +1,20 @@
>> +SUMMARY = "Recipe for drm-lease-manager"
>> +HOMEPAGE = "https://github.com/AGLExport/drm-lease-manager"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>> +
>> +SRC_URI = "git://github.com/AGLExport/drm-lease-manager;protocol=https;branch=master"
> This seems to be a development fork, not the upstream repo:
> https://git.automotivelinux.org/src/drm-lease-manager/ - I think this
> (or a mirror of it) would be a better source.
>
>> +
>> +SRCREV = "e6c3bf4ff76ae5eeefdb149e4b4167195dfcfb61"
>> +
>> +S = "${WORKDIR}/git"
> [Same comment about S as in the libtoml recipe]
>
>> +
>> +inherit meson pkgconfig
>> +
>> +DEPENDS += "libdrm pkgconfig-native libtoml"
>> +

Sorry for the spam, one more minor note: when you inherit pkgconfig, you
don't need to add pkgconfig-native to DEPENDS - the pkgconfig class
takes care of this (actually that's the only thing this class does)

>> +# Change default path /var/run/drm-lease-manager.
>> +# For exemple if you wish to move the runtime dir of drm-lease-manager to /etc :
>> +# EXTRA_OEMESON += "-Druntime_subdir=/etc/drm-lease-manager"
>> +
>> +FILES:${PN} += "${bindir}/drm-lease-manager"
> Is this needed to specify? I would expect that ${PN} package grabs the
> content of ${bindir} by default.


