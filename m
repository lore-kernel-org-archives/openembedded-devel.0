Return-Path: <andrey.konovalov@linaro.org>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id CDAF277BD9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 13:02:28 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id 75so26858149lfs.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 06:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=TPIeBq08SXoBdw1yC1C9NyqHqvG7B/Q/G+7CMhb9WOg=;
	b=Fluq2JteRzjxCmO5Ticu6Q5BWioYKSSELfvQHf17uCf0NK9eZpspKUt7SLIGnxKrdE
	goM/xR4Dwi6w/jsQXs9vginzM+Tcme4O+mrPPThqjWU0J0tkT/Aoxu53f02NW8epvq7w
	uKB7KzEF9zn8thjXFaOQBuzLSZykUQ5C8lx/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=TPIeBq08SXoBdw1yC1C9NyqHqvG7B/Q/G+7CMhb9WOg=;
	b=Q1jxfdrrt6SP3xCzpbH7XwUADOYAW3iGmGaT7xImr0Y1KDjY6+4BULc2U1hcM5xMx4
	rWHk+J37yoyL9BNLvVITgHWFjux4CzxWMNBqtQEHLI8abYcyUwrtJMCeZcuAZ/nb2AQ2
	bTmazSclaUXNU5B7W9d1/lCwtSbMcyUPeVlG7yJB0MZXl9jPE73SbkgqZJIfkEGH5cME
	r4/OuCniXeJhA/WMsHiBx/FEwASxSskKuR8qN5zuqFjrwzk8wh6TJiGtg1L8Oa6ZDeVo
	g8pg4bRtkBtl403uwVwAQ0ZbjzaxSEWSohQjOBBXQWAslSpPX5jF0fuk9sjg8d9/tob4
	Tklg==
X-Gm-Message-State: AFeK/H1Or9flJS7YXJzoBjgfIqYAU6Kn1oSWtIqdcnHfvLUgU60UlWYNKYNTLQugBr20Ttc7
X-Received: by 10.46.32.17 with SMTP id g17mr16671432ljg.37.1491915749111;
	Tue, 11 Apr 2017 06:02:29 -0700 (PDT)
Received: from [192.168.11.27] (mail.dev.rtsoft.ru. [213.79.90.226])
	by smtp.googlemail.com with ESMTPSA id
	c5sm3445918lfk.51.2017.04.11.06.02.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Apr 2017 06:02:28 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>
References: <1491590447-19476-1-git-send-email-andrey.konovalov@linaro.org>
	<CAJ86T=US2yATN4uK55O2vjoY-aJvU6Q-mJrkDuGOPEwsueHYug@mail.gmail.com>
From: Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <58ECD3E2.1090601@linaro.org>
Date: Tue, 11 Apr 2017 16:02:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=US2yATN4uK55O2vjoY-aJvU6Q-mJrkDuGOPEwsueHYug@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] [PATCH] chromium: fix null pointer dereference in V8 with gcc-6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Apr 2017 13:02:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2017 03:40 AM, Andre McCurdy wrote:
> On Fri, Apr 7, 2017 at 11:40 AM, Andrey Konovalov
> <andrey.konovalov@linaro.org> wrote:
>> This patch prevents "Aw Snap" error when loading a page with JavaScript.
>>
>> Tested by running:
>> - chromium-wayland on Beagle X15
>> - chromium-wayland on HiKey (with a separate patch to enable aarch64 build)
>> - cromium on dragonboard-410c (with a separate patch to enable aarch64 build)
>>
>> Based on the fix for Gentoo's bug 588596:
>> https://bugs.gentoo.org/show_bug.cgi?id=588596#c10
>>
>> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
>> ---
>>   recipes-browser/chromium/chromium.inc | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
>> index 60edccb..7e057ec 100644
>> --- a/recipes-browser/chromium/chromium.inc
>> +++ b/recipes-browser/chromium/chromium.inc
>> @@ -15,7 +15,8 @@ CHROMIUM_BUILD_TYPE ??= "Release"
>>   inherit gettext pythonnative
>>
>>   ARMFPABI_armv7a = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"
>
> Not related to the patch, but this over-ride should be duplicated for _armv7ve
>
>> -GYP_DEFINES += "${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
>> +GYP_DEFINES += " ${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot='' \
>> +       ${@bb.utils.contains("AVAILTUNES", "mips", "", "release_extra_cflags='-fno-delete-null-pointer-checks'", d)}"
>
> What's the significance of skipping the workaround if AVAILTUNES
> contains "mips" ?

This change (to add '-fno-delete-null-pointer-checks' to gcc flags) was initially merged into chromium directly,
but soon reverted as it broke mips somehow:
https://bugs.chromium.org/p/v8/issues/detail?id=3782#c10

>>   GYP_DEFINES_append_x86 = " generate_character_data=0"
>>
>>   do_configure() {
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


