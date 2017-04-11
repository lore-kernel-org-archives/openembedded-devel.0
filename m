Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id ED41777D03
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 18:51:17 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id x75so2050909wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Apr 2017 11:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/l0djt6A6odJiJYrKKPiLF6UxDq+d0K8+BwfCqzS5Ss=;
	b=ublGbQQa+hbMD3gZNqqadd8jLOQCezPt/uNZpA9k0OJcu8mhQkUHEentAGnPWWkuv7
	x/D8GSQM5feRdDoOzww7Hwfi6kX55mlC29C8xBGR4IUp+P9HMKUe1Mgf9rXUz4amUOqd
	d2ls/QQ0OBZ6lJCm0r3hX7DfEWSB3vUgH44cTSRivIVwFI1MToOOlVa58BDHX4RxrN0j
	hAGTnNrI+Pl4M9tUFgS4J0zUu1pbQkaK3bVkrH9YDKccz5lml63oNiV6WSvFyhe3I2iq
	EdSP1uXXv44PAAAaFJfBRyEFT/wPb+2pjviEJBG47h6or11NCHXpfRtvQY1Bi6EyBcwd
	d84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/l0djt6A6odJiJYrKKPiLF6UxDq+d0K8+BwfCqzS5Ss=;
	b=A8kEd/SFsy4AQFOFXGNNPJ/QFhWoTtwJ2Yuf8Y+hcQC8foGbDrs+uHhIIgotLXQnJP
	/wb2CAC5pBUx31V+J06q1xTp+P7Ij04hF2y9FTOx+uySZwq4SqldoDYp49lwQw4bCLpp
	1ISdIC+rwI7GOES0cW88OUCdw26hVM1e4RHtf9NJhcj3xJ99RR5KZK4t9m1iEyD8ISgT
	YCojkbpOIg3YooKOD4s84I4seB4reQOkxW4QK/VCR+pnPp9QYIpBii4Zf+P+p4F2f3ve
	l5XWDQhff8Pd49MciDHwYMphbXlnDiVsMhPvb9Ve/RieaFqeKGS6ZIqUBonYd8m+GhUK
	5UJA==
X-Gm-Message-State: AN3rC/7hlAqjn4vxss+sZ7vK3zhhEiao5po9yifbMkPvNWMIyq95Vwn24ggKIxWj0hxkkvLLlgw2LdDfeD4X6A==
X-Received: by 10.28.199.65 with SMTP id x62mr9095430wmf.20.1491936678665;
	Tue, 11 Apr 2017 11:51:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.153.248 with HTTP; Tue, 11 Apr 2017 11:51:17 -0700 (PDT)
In-Reply-To: <58ECD3E2.1090601@linaro.org>
References: <1491590447-19476-1-git-send-email-andrey.konovalov@linaro.org>
	<CAJ86T=US2yATN4uK55O2vjoY-aJvU6Q-mJrkDuGOPEwsueHYug@mail.gmail.com>
	<58ECD3E2.1090601@linaro.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 11 Apr 2017 11:51:17 -0700
Message-ID: <CAJ86T=WWRhgpONcfvJRGSyARzFS4pkmWrnx2BenOZKasv9Y7MQ@mail.gmail.com>
To: Andrey Konovalov <andrey.konovalov@linaro.org>
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
X-List-Received-Date: Tue, 11 Apr 2017 18:51:18 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 11, 2017 at 6:02 AM, Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
> On 04/11/2017 03:40 AM, Andre McCurdy wrote:
>>
>> On Fri, Apr 7, 2017 at 11:40 AM, Andrey Konovalov
>> <andrey.konovalov@linaro.org> wrote:
>>>
>>> This patch prevents "Aw Snap" error when loading a page with JavaScript.
>>>
>>> Tested by running:
>>> - chromium-wayland on Beagle X15
>>> - chromium-wayland on HiKey (with a separate patch to enable aarch64
>>> build)
>>> - cromium on dragonboard-410c (with a separate patch to enable aarch64
>>> build)
>>>
>>> Based on the fix for Gentoo's bug 588596:
>>> https://bugs.gentoo.org/show_bug.cgi?id=588596#c10
>>>
>>> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
>>> ---
>>>   recipes-browser/chromium/chromium.inc | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/recipes-browser/chromium/chromium.inc
>>> b/recipes-browser/chromium/chromium.inc
>>> index 60edccb..7e057ec 100644
>>> --- a/recipes-browser/chromium/chromium.inc
>>> +++ b/recipes-browser/chromium/chromium.inc
>>> @@ -15,7 +15,8 @@ CHROMIUM_BUILD_TYPE ??= "Release"
>>>   inherit gettext pythonnative
>>>
>>>   ARMFPABI_armv7a = "${@bb.utils.contains('TUNE_FEATURES',
>>> 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"
>>
>>
>> Not related to the patch, but this over-ride should be duplicated for
>> _armv7ve
>>
>>> -GYP_DEFINES += "${ARMFPABI}
>>> release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
>>> +GYP_DEFINES += " ${ARMFPABI}
>>> release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot='' \
>>> +       ${@bb.utils.contains("AVAILTUNES", "mips", "",
>>> "release_extra_cflags='-fno-delete-null-pointer-checks'", d)}"
>>
>>
>> What's the significance of skipping the workaround if AVAILTUNES
>> contains "mips" ?
>
>
> This change (to add '-fno-delete-null-pointer-checks' to gcc flags) was
> initially merged into chromium directly,
> but soon reverted as it broke mips somehow:
> https://bugs.chromium.org/p/v8/issues/detail?id=3782#c10

OK, thanks. Note that building for MIPS isn't currently supported at
all according to the COMPATIBLE_MACHINE definitions at the top of the
recipe.

>>>   GYP_DEFINES_append_x86 = " generate_character_data=0"
>>>
>>>   do_configure() {
>>> --
>>> 2.1.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

