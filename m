Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CD4C197BF
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 20:09:02 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.20646.1740686939530986799
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Feb 2025 12:08:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ICVWoca/;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abf1da0cb66so111651366b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 12:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740686938; x=1741291738; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9rmfXThpajqf66qozWgdgumpdoj2ShmdiiGCjJcRgWE=;
        b=ICVWoca/Qy7R6qe6sh6b8KGgqnJdBnnoKP25Y9ysHhjW269mGQ63/M/QdH3a3s2k/j
         0u/BkxFofZ6KlgSDRTpuCYb1HTuCL+JBwpk3vfzntw9lXOUpqay6+ad1VdNVmXLa+esc
         B/pZW64ONMPbMPFfDJdczmYTv7poNCWC3PgCNnkkP9NUr0vLjNLJVZvn379Eam1lf7xQ
         wY4ah5y9u6nVq3AbqR1KID3cB5MZcvfiSWNWYxN9DUjcQy0Pv1Ai8I0dJg6+MXPcSbVg
         Tce24vDZEHkJ/khJifmwqZQaLqtGbFWc0qHYQCCd/aLcQvY2teod0XU0lCMtKq1BDNZI
         DVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740686938; x=1741291738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9rmfXThpajqf66qozWgdgumpdoj2ShmdiiGCjJcRgWE=;
        b=PnEYj1epggVboEm3xKnJrrojaMPQF8+jekyF64y0J1Z/2E+Xk+g9XqGfQuuzelXClV
         f3qcUx+Lag3X21kU1MK6kCjgHwzauGScr3kgyVrai7UA6bQ9PIaB1/Wvu8IU40by+Rt3
         u8Zkf8fTg6sVXcHGUtaAA51qPG2O12kZZnXMvnKYTzHFMejSuaSxcS40Y8t/qj/+kx/b
         Z/xlkqU/as0PHPlylcYlz+XddpmQQUpvDpdsltkKFaZ+3LkTvyc2bTqrYAcn3DD7FucQ
         uSu4fCOIkkNYyAOrS89m5E0zpvtNX5HnoSmEyHa3x2kycQeH062AUXF0XqTRHxZ9lsGi
         CiKA==
X-Gm-Message-State: AOJu0YxxR/Hw0FcFayQlPV4raL6IZrGdtd6lajjr2qJvx/2m6K9808Au
	pz3E8rLM3FNdM/cczj8rI6GPOlrhhpOocqXv1AqTYZL/Xk4t/+tc
X-Gm-Gg: ASbGncvrdKe2HOZ2t+uB/yPbCuKIIcR7eujXuvOU3RjxSKXvu/O8dctniikoKN0uLc+
	Sun9v4XPnASrlGMCv7gAxMiD9ycc5d07Lu990R1N//b1nqmyu3ej5UKdWibFOlDJCktorq61+au
	sr9/GMBKbbA1E1/Tq/AkrN4riiYaon3f6MJueZ0vPvLQ6zZWq0+9667k9BvPQgTGAZsvhiDZo47
	NxrguBAXaa30FgQStKs9alIY8+WbOXDvOxGuxfCzowKgn4HXfFZKGxdJIdUuf+tqiIHW7zJM5QK
	kMNDjQ4Wmw+aOvgnC40hhsHrvKg5tPQ1ZA==
X-Google-Smtp-Source: AGHT+IESGpHPuDu0kzy6xv/9OpzdUZ6SQD2ZkoZ8XYEoRVxAlyLVvtHgCoZK44VZvgKe/0xdOps3qg==
X-Received: by 2002:a17:907:8688:b0:ab7:b878:e8bc with SMTP id a640c23a62f3a-abf265cd71dmr75919666b.38.1740686937670;
        Thu, 27 Feb 2025 12:08:57 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf17fa4a4asm128599766b.92.2025.02.27.12.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 12:08:57 -0800 (PST)
Message-ID: <ba566c7e-9bdc-4e5e-8891-cb096a703daa@gmail.com>
Date: Thu, 27 Feb 2025 21:08:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v3] thin-provisioning-tools: add target and
 sysroot to bindgen flags
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250227183238.1909597-1-skandigraun@gmail.com>
 <CAMKF1sry2Eb4EGJi4hU6OJxgiA2yzkrFrJxnqHf9dp+UH5qzrA@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1sry2Eb4EGJi4hU6OJxgiA2yzkrFrJxnqHf9dp+UH5qzrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 20:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115702


On 27.02.25 21:02, Khem Raj wrote:
> On Thu, Feb 27, 2025 at 10:32 AM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> BUILD_CFLAGS doesn't contain information about the recipe sysroot nor about the target
>> system - and in case these are not specified for bindgen, then it builds against
>> the build system's headers, using the build system's arch.
>>
>> Instead of BUILD_CFLAGS pass HOST_CC_ARCH and TOOLCHAIN_OPTIONS, which contain the sysroot
>> and the requred cross-compiling flags, beside passing the target flag also.
>>
>> Fixes the following do_compile error:
>>
>> |   /usr/include/linux/types.h:5:10: fatal error: 'asm/types.h' file not found
>> |   thread 'main' panicked at /yocto/sandbox/build/tmp/work/cortexa72-poky-linux/thin-provisioning-tools/1.1.0/sources-unpack/cargo_home/bitbake/devicemapper-sys-0.3.0/build.rs:24:10:
>> |   Could not generate dm.h bindings: ClangDiagnostic("/usr/include/linux/types.h:5:10: fatal error: 'asm/types.h' file not found\n")
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  .../thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb    | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
>> index bb4b53c28b..d0241c7016 100644
>> --- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
>> +++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
>> @@ -21,7 +21,7 @@ inherit pkgconfig
>>  DEPENDS += "udev libdevmapper libdevmapper-native clang-native"
>>
>>  export LIBCLANG_PATH = "${WORKDIR}/recipe-sysroot-native${libdir}"
>> -export BINDGEN_EXTRA_CLANG_ARGS = "${BUILD_CFLAGS}"
>> +export BINDGEN_EXTRA_CLANG_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --target=${TARGET_SYS}"
>>
> we do not need -target anymore its part of HOST_CCARCH

It is not:

$ bitbake -e thin-provisioning-tools | grep ^HOST_CC_ARCH
HOST_CC_ARCH=" -mcpu=cortex-a72+crc -mbranch-protection=standard
-fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-
security -Werror=format-security"

If I remove it, it gets unhappy:

|   error: unsupported option '-mcpu=' for target 'x86_64-unknown-linux-gnu'
|   error: unsupported option '-mbranch-protection=' for target
'x86_64-unknown-linux-gnu'
(etc..)


>
>>  require ${BPN}-crates.inc
>>  require ${BPN}-git-crates.inc
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#115699): https://lists.openembedded.org/g/openembedded-devel/message/115699
>> Mute This Topic: https://lists.openembedded.org/mt/111420486/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

