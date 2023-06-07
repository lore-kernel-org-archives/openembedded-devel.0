Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD9BC77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 07:53:36 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.3218.1686124406423956267
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jun 2023 00:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VB6HqMhY;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f6e68cc738so58523915e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 00:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686124405; x=1688716405;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ISn295IZYP9jWJKWHLbn0N7VdmsdfpxNBKx8aM8Xv8E=;
        b=VB6HqMhYWKSHPtX1nD5zg/jkw9x812hGik7bpGYkR+se5i9NPuoknD+0XCVBIXUUsm
         oy6z0IcurbSUNFm73vQxXzliMP3k5D0UiUGR2YHSXqeLhCKHwjLfH2Puegf1TTg5w+51
         F7bI9tZ9lXpSa7F0CgHiU1SvFFvLce3RqYXxU5Ygeng64Tqms/fQZ/h5zcxISgs7gh2N
         5bMEvgSCV2/eXTvUqMWEed47P1Ukps2L4bPrzzDPGFjDTjGwJBC3QSKpMbLZ25xYafic
         molfNQgfantFShm+OdOdBq7kpcykugMbZZBIGsy0gePllfjZWa6SN3mKV8lgA5kyUcJO
         MRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686124405; x=1688716405;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ISn295IZYP9jWJKWHLbn0N7VdmsdfpxNBKx8aM8Xv8E=;
        b=P/hDMHAvTKME9j6SUb8xhABZ1aZHtUR1YlCD+3hKAfRu8vSb5Grfh623X8WH7KXF6w
         y7KQuvpdwx2GcozF8yIGKVaGBZm84i2su756pkQAV/bEsd5Vj1MO3MWnfKfvrcfht2w/
         hr3oyFGIPCs6LqzDEP4ua0yNdr1Mylm6iPt6iKysCN1r8eLNCWzpoX5bFGFbk6OT0VP+
         Pm/wtiVLC3B9s1P+Q8kbuXCwFJDzj6WPvzfMk3UxGEEUO8PwJeYrdq3AOvC1TWxoYERm
         CYlPgNG/nM6Qs8+nYrVMg3/EOS9lveVGS6sWiRvx2FW9EwuldhWCr0Qw+ybsl9isqqql
         z3Ng==
X-Gm-Message-State: AC+VfDxateKaFDV0mzILxdygVC5xg0jdwpJ5d2D5TyL76FM9qbB1BR9w
	JCGLolcHCotsVGXkvQNWTrU=
X-Google-Smtp-Source: ACHHUZ7LAdA7Rl/X13J8+Aqbwb72iW4ImAvz/2Eur1Ri7GFeqAlmOB+7IZ0JRxXeCABcOTUyZt4HBg==
X-Received: by 2002:a7b:c8c6:0:b0:3f7:e548:6611 with SMTP id f6-20020a7bc8c6000000b003f7e5486611mr3519096wml.40.1686124404629;
        Wed, 07 Jun 2023 00:53:24 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id c3-20020a056000104300b003062ad45243sm14658829wrx.14.2023.06.07.00.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 00:53:24 -0700 (PDT)
Message-ID: <4e71566e-bcd3-5bd3-02d2-6a1b530619b2@gmail.com>
Date: Wed, 7 Jun 2023 09:53:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [oe] [meta-oe][mickledore][PATCH 05/36] fftw: Remove hardcoded
 sysroot into binaries
Content-Language: en-US
To: Armin Kuster <akuster808@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
 <20230531111309.2454603-5-akuster808@gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <20230531111309.2454603-5-akuster808@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 07:53:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103168

This causes a build error in fftw-native:

ERROR: fftw-native-3.3.10-r0 do_compile: 
ExecutionError('/data2/dtd-yocto-4.2/tmp-sicom-glibc/work/x86_64-linux/fftw-native/3.3.10-r0/temp/run.do_compile.3532203', 
1, None, None)
ERROR: Logfile of failure stored in: 
/data2/dtd-yocto-4.2/tmp-sicom-glibc/work/x86_64-linux/fftw-native/3.3.10-r0/temp/log.do_compile.3532203
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 
'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| sed: -e expression #1, char 0: no previous regular expression
| WARNING: 
/data2/dtd-yocto-4.2/tmp-sicom-glibc/work/x86_64-linux/fftw-native/3.3.10-r0/temp/run.do_compile.3532203:154 
exit 1 from 'sed -i -e 's|||g' config.h'
| WARNING: Backtrace (BB generated script):
|     #1: do_compile, 
/data2/dtd-yocto-4.2/tmp-sicom-glibc/work/x86_64-linux/fftw-native/3.3.10-r0/temp/run.do_compile.3532203, 
line 154
|     #2: main, 
/data2/dtd-yocto-4.2/tmp-sicom-glibc/work/x86_64-linux/fftw-native/3.3.10-r0/temp/run.do_compile.3532203, 
line 200
ERROR: Task 
(virtual:native:/data2/dtd-yocto-4.2/conf/../layers/meta-openembedded/meta-oe/recipes-support/fftw/fftw_3.3.10.bb:do_compile) 
failed with exit code '1'

2023. 05. 31. 13:12 keltezéssel, Armin Kuster írta:
> From: Khem Raj <raj.khem@gmail.com>
>
> FFTW_CC is added to image via version.o and its CC + CFLAGS however CC
> in OE containes --syroot compiler option which encodes buildpaths into
> binary, therefore remove this option from FFTW_CC in config.h
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit ef03326d31360abdfa3e4a34eb00b328a76de12c)
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   meta-oe/recipes-support/fftw/fftw_3.3.10.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb b/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
> index cb45e2b91f..1fead4d029 100644
> --- a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
> +++ b/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
> @@ -55,6 +55,7 @@ do_configure() {
>   do_compile() {
>       for lib in fftw fftwl fftwf; do
>           cd ${WORKDIR}/build-$lib
> +        sed -i -e 's|${TOOLCHAIN_OPTIONS}||g' config.h
>           autotools_do_compile
>       done
>   }
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103034): https://lists.openembedded.org/g/openembedded-devel/message/103034
> Mute This Topic: https://lists.openembedded.org/mt/99239744/3617728
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


