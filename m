Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5AFE95367
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 09:34:26 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16733.1770197661024391118
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 01:34:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SGYy9Gxq;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-482f2599980so38143715e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 01:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770197659; x=1770802459; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y/BHfwJPuJoqzCHZImvDylVeDy56U4TXabbTvIllPqs=;
        b=SGYy9GxqXu8xBh0BxjHl+EYI41Y9ts2h6OQqwW4/xAEjln5vuwtpfdFR4JMy4szDml
         uoKRDQonnPCxjN/OCZQTFZbB2gX9+ypFlTVe9JtPK1saZbjjuuPHd3VDNMc0pvpxWn7+
         /HDn/2kobHcX3BMZ6dl1snM/MuirlIzKHt0qe0iWgORlE8wydLxRpZZ8LffnM35F2DiO
         7hRWSliPwgSfQ2dkkIh5MpwrcTqVWaw8TQCAJH/VUtDRX0Al4+T3pNZSFrYWF0qy071P
         u39d16o1oLcts+4dGjzUx2wcj04/oaTd3tQubXJNhS0asCxCnbafNcUDp2Nu9BVA0jv/
         zvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770197659; x=1770802459;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/BHfwJPuJoqzCHZImvDylVeDy56U4TXabbTvIllPqs=;
        b=kp5zt5ttr7zYoDik9Tf34/h0CNPAaAuBWkYc1UI1HVCO1ic9VWcjB2I14QcYTUTwg/
         GH/3hdq8F0hiOzGncLs2wqzncAkf3PVRgDEMIINjuq/MBPRHPQhiymyDHJYGUP3qVd1p
         tMilVbisQwiIaCLEO34fGS/DsugHmlKnoZA/0H0rUiPdn9bUXu1qsolNUoJBdDskALoF
         xeoGgJliQ89EonDzBf0Dgggj6TsF5LVtKXwWHsUr7u11ma+eiVYjR7NA6LS0nA5r5Xpp
         QsL4OcUFL1k3zkMvx2564lI/uIGAz3bxpko1EAbpDMflaSXsWvmuM4GdV1nF+sxqcP5N
         cwBA==
X-Gm-Message-State: AOJu0YwY1Aav1/cDmKm2tD4amJIFZm9xCWxwKjppTBDk4/jvHMao2keA
	MXfm8DAU/ZaLBfOwWShFTFM0kBLLnRi89JtH09zXYxl58Lb8yEv6VwPu
X-Gm-Gg: AZuq6aIXuvIsKNSmhLW42yO7fnBDXqcbSqi6a4/+gjtQj5P7a4esjEGLvEsLj7wQt4c
	nnqEAvo4bx6oCdGWJbpazR7HukbeyLKxhs3eZKe5U40qBplQT7410zqHsFJMr9q1ouH1iNpO08S
	J31YZ6hwEzYnE0xuwzkIjZMberqKT4p34GhhhrsnQISxw/nfyWOJWNjl6kw3rVSl9hcpWuxfcB9
	zJ9hsoKAOud+YKnmxs+CaJfOL+WO+0i6FrOAvehhTFjERbMRy9ZfkXcAqCkoTJ1IgQO9WdOzIpB
	AT2Zur30fbfqOsJiEW5uq7m2mTkW8+3f8zzS7EvgBmfaYewZtjnjAFUZfc55oY/qGoBZf0PuK5W
	aoMEyEjpGzwg1lkWwTcLyagL9Fkr3HEx/NWOvCGEDOyRZFQi9DhDRwH/A//VPaMRxai0+wWVTD0
	IZQcdT9HKcejv0NxB1uj4=
X-Received: by 2002:a05:600c:8b0f:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-4830e99dd3emr33550805e9.30.1770197659194;
        Wed, 04 Feb 2026 01:34:19 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe86bebsm14041615e9.10.2026.02.04.01.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 01:34:18 -0800 (PST)
Message-ID: <54ec6b29-5d8b-4504-8aa5-0a359a3709de@gmail.com>
Date: Wed, 4 Feb 2026 10:34:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][whinlatter][PATCH 13/15] nodejs: upgrade 22.21.1
 -> 22.22.0
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260202211401.1287664-1-skandigraun@gmail.com>
 <20260202211401.1287664-13-skandigraun@gmail.com>
 <CADySD0EAw8EY+gHxRU23RLn+2=pKfda1YWWuis1z1DXeAF6-UQ@mail.gmail.com>
 <20c9fdae-9dd0-4a1e-b709-c7d668bb03d5@gmail.com>
Content-Language: en-US
In-Reply-To: <20c9fdae-9dd0-4a1e-b709-c7d668bb03d5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 09:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124122

On 2/3/26 22:50, Gyorgy Sarvari wrote:
>
> On 2/3/26 10:55, Ankur Tyagi wrote:
>> Hi Gyorgy,
>>
>> Getting following error when building for qemux86 with musl and clang
>>
>> | /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/core2-32-poky-linux-musl/nodejs/22.22.0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld:
>> /usr/lib/i686-poky-linux-musl/15.2.0/../../../include/c++/15.2.0/bits/atomic_base.h:1090:(.text._ZN2v88internal12_GLOBAL__N_120ElementsAccessorBaseINS1_21TypedElementsAccessorILNS0_12ElementsKindE37EdEENS1_18ElementsKindTraitsILS4_37EEEE27CopyTypedArrayElementsSliceENS0_6TaggedINS0_12JSTypedArrayEEESB_jj+0xe05):
>> undefined reference to `__atomic_store'
>> | /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/core2-32-poky-linux-musl/nodejs/22.22.0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld:
>> /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/core2-32-poky-linux-musl/nodejs/22.22.0/sources/node-v22.22.0/out/Release/obj.host/v8_base_without_compiler/deps/v8/src/objects/elements.o:
>> in function `std::remove_volatile<double>::type
>> std::__atomic_impl::load<double>(double const*, std::memory_order)':
>> | /usr/lib/i686-poky-linux-musl/15.2.0/../../../include/c++/15.2.0/bits/atomic_base.h:1099:(.text._ZN2v88internal12_GLOBAL__N_121TypedElementsAccessorILNS0_12ElementsKindE37EdE15GetInternalImplEPNS0_7IsolateENS0_6HandleINS0_8JSObjectEEENS0_13InternalIndexE+0x7c):
>> undefined reference to `__atomic_load'
>> | /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/core2-32-poky-linux-musl/nodejs/22.22.0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld:
>> /usr/lib/i686-poky-linux-musl/15.2.0/../../../include/c++/15.2.0/bits/atomic_base.h:1099:(.text._ZN2v88internal12_GLOBAL__N_120ElementsAccessorBaseINS1_21TypedElementsAccessorILNS0_12ElementsKindE38EhEENS1_18ElementsKindTraitsILS4_38EEEE27CopyTypedArrayElementsSliceENS0_6TaggedINS0_12JSTypedArrayEEESB_jj+0x549):
>> undefined reference to `__atomic_load'
>>
>> Can you please have a look into it?
> I don't think that I can unfortunately. It seems to be something with
> the -latomic LDFLAG. I *think* that the problem is the library order in
> the linker invocation. libatomic appears very early in the command,
> before any other resource, and I think it should appear at the end. But
> I'm not familiar with gyp, and nodejs takes 30 minutes to show that my
> try about reordering the flags was unsuccessful.
>
> As a sidenote, it is not a regression from this patch, it has the same
> issue with the current version also - but if it's a stopper for
> Whinlatter, feel free to drop this. I might take another shot at it in
> the future.
>

I had a sleep since, and it frequently helps with annoying problems.

I have a potential fix[1], but first I want to run it thru master to see
if anyone has a better idea. It can be cherry-picked if it makes its way
to master successfully (which has the this problem also).

Meanwhile feel free to test it if you want to, the patch should apply
clean on Whinlatter.

[1]: https://lists.openembedded.org/g/openembedded-devel/message/124121

>> cheers
>> Ankur
>>
>>
>> On Tue, Feb 3, 2026 at 10:14 AM Gyorgy Sarvari via
>> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
>> wrote:
>>> From: Jason Schonberg <schonm@gmail.com>
>>>
>>> This is the December 2025 security release that the nodejs team released
>>> January 13, 2026.
>>>
>>>   3 high severity issues.
>>>   4 medium severity issues.
>>>   1 low severity issue.
>>>
>>> High priority fixes:
>>>   CVE-2025-55131
>>>   CVE-2025-55130
>>>   CVE-2025-59465
>>>
>>> Medium priority fixes:
>>>   CVE-2025-59466
>>>   CVE-2025-59464
>>>   CVE-2026-21636 *
>>>   CVE-2026-21637
>>>
>>> Low priority fixes:
>>>   CVE-2025-55132
>>>
>>> * note that this medium priority CVE only effects Nodejs v25.
>>>
>>> https://nodejs.org/en/blog/vulnerability/december-2025-security-releases
>>>
>>> Changelog: https://github.com/nodejs/node/releases/tag/v22.22.0
>>>
>>> Signed-off-by: Jason Schonberg <schonm@gmail.com>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> (cherry picked from commit 0bb156371e433cf3e9fdc4291da2319d63a83575)
>>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>>> ---
>>>  .../oe-npm-cache                                                | 0
>>>  ...oe-cache-native_22.21.bb => nodejs-oe-cache-native_22.22.bb} | 0
>>>  .../nodejs/{nodejs_22.21.1.bb => nodejs_22.22.0.bb}             | 2 +-
>>>  3 files changed, 1 insertion(+), 1 deletion(-)
>>>  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.21 => nodejs-oe-cache-22.22}/oe-npm-cache (100%)
>>>  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.21.bb => nodejs-oe-cache-native_22.22.bb} (100%)
>>>  rename meta-oe/recipes-devtools/nodejs/{nodejs_22.21.1.bb => nodejs_22.22.0.bb} (98%)
>>>
>>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.21/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.22/oe-npm-cache
>>> similarity index 100%
>>> rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.21/oe-npm-cache
>>> rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.22/oe-npm-cache
>>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.21.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.22.bb
>>> similarity index 100%
>>> rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.21.bb
>>> rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.22.bb
>>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
>>> similarity index 98%
>>> rename from meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
>>> rename to meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
>>> index ccaf9f7bb2..443cdc430d 100644
>>> --- a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
>>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
>>> @@ -39,7 +39,7 @@ SRC_URI:append:class-target = " \
>>>  SRC_URI:append:toolchain-clang:powerpc64le = " \
>>>             file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
>>>             "
>>> -SRC_URI[sha256sum] = "487d73fd4db00dc2420d659a8221b181a7937fbc5bc73f31c30b1680ad6ded6a"
>>> +SRC_URI[sha256sum] = "4c138012bb5352f49822a8f3e6d1db71e00639d0c36d5b6756f91e4c6f30b683"
>>>
>>>  S = "${UNPACKDIR}/node-v${PV}"
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#124086): https://lists.openembedded.org/g/openembedded-devel/message/124086
>>> Mute This Topic: https://lists.openembedded.org/mt/117604901/3619737
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ankur.tyagi85@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>


