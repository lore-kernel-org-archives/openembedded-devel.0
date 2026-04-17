Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AA7F8E4A8
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 04:14:22 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35137.1776399257194422364
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 21:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S2gKw9Dc;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488ba840146so2048965e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 21:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776399255; x=1777004055; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I2QJCuruCUz2xrZtd7p6a1sRdT8xOMhe8+2EXBPL0/c=;
        b=S2gKw9DcXp/IAhWuiIZT6nKzXMQ+RoHUwNhONR+YSAqCufzCckrP7TZb8aIjFnuGNI
         fjR+afQxw1Dl3/EquyQj6q1I62kk4rgwaI5ToYz4L38phO29r1fSf0qT82+SZdbE9hxJ
         nw9Kom8PxbLEhbJER8Ls3YbPxYymJ9iLmlhSb6YoM6dMcy7PTNuWN/Wv+18FAoBzAD7Q
         M87ppnMztpTmt6ksEJB5tHDLJZKXfMfK8LddBXc1swA5QDntLjkKVhYag4lYzVjbuzrr
         2mE/r7N2KMaOF6k/DZKzp3Mb3oBKYtGHKeXx2Q8ny5rdnDJO/xSJcBnTwAbmUmNnINbt
         eBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776399255; x=1777004055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I2QJCuruCUz2xrZtd7p6a1sRdT8xOMhe8+2EXBPL0/c=;
        b=aWEvXElGbUWgUjFncdN6XeCFP9bL9ikG1ynicEBnypTXhhmpmsXQGV03ZnCJHVoZDi
         hHVi36cdmDBjhxo7E6Itoh5mXfMPwAaTTT1zjvVhcTfsCseVftZHR/0httDcH0Lx93xl
         FkodYMJ0d3N/Z6qIWzRtVT3+AQwX4Q05p/55zB5tbTWBaJHo6+4DHUQRiFIfBbso64mv
         w9xuQloDSpy11zePA30vVY8dy6jdDvNvPk0ddnYWdvTy5RdO6r4tLnpw4kuAH8Jt5y9r
         6v+lYM1U720KItxK0ziPjSIXf/2079J2NuWcTyfHbOa7c5ZnVR7CxkWkCAAY5Wb3D+3V
         LIrg==
X-Forwarded-Encrypted: i=1; AFNElJ8m6yUG881YzYBVgQ1FIixxUQ66KHURG1ltP5fi26WiWQnCnV1ry2Cp7Za0APpUwXQaB5CDsjx4JJuTNJ/kaAt1vkA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxBnmu6cOSXe6A7+4BFte3vB2jW3fEtgctEkBSxQjmHg2T79Ydq
	nsKPW4BaZWy8a1OLaCq0A9PgtYUYG7D768w7oAJrM4WzAKKoQkI/E+n2nqfvkg==
X-Gm-Gg: AeBDiesPCp6sCfu0awoEjhBgwLh4IIrQabltlAOS56eSBmVb64jWQjq2Qy4kpql2Sc/
	PQuS4TDRhaRJ0v1Xnr4N+xXhQDxBeDgxWKva7c85OIXh+F6t0EdsOmu49W8b6BjSy84fcEwYwlQ
	sIcpg6L9YxSqjHDvAuYkdbuIfUMjhKVtiVp1yeOzibQq3uYOnSs23qWfnsiaZGYokNC4TwGfxdI
	u/+gTNLAPVW2pPeRttRlj2yT1+W7xmYb1ywXyn1eAogMFFD7sGO31lCZxM4WWjHVFdUSI/p/7rC
	i/38vV+axx3QkxG3S+GLqyqE4CkBdUfaXYVOmnji1m9oOQw/GAch3xqpCiNWmPmepP+tAtiZnjP
	ZSo6StdV/LTkmOcUBB4JA19pMLsjrJHOsLaswDz1EHW+kmZQWMZQX8muNdYrZmYlf1LkkolU0nz
	kBa3mFnAh+VzqK/eTflZ13jAbGWy6ilR92ZYoFTAB+SA==
X-Received: by 2002:a05:600c:46cb:b0:488:a723:ea53 with SMTP id 5b1f17b1804b1-488fb744fbemr15211025e9.7.1776399255266;
        Thu, 16 Apr 2026 21:14:15 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc10019bsm13041645e9.4.2026.04.16.21.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 21:14:14 -0700 (PDT)
Message-ID: <04d018b2-00d7-4147-8933-b84171bc20e4@gmail.com>
Date: Fri, 17 Apr 2026 06:14:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] uutils-coreutils: make selinux
 PACKAGECONFIG dependend on clang-layer
To: Hiago De Franco <hfranco@baylibre.com>,
 openembedded-devel@lists.openembedded.org,
 Trevor Gamblin <tgamblin@baylibre.com>
References: <20260416191754.3910026-1-hfranco@baylibre.com>
 <a64fce2a-a609-47e7-a60f-634ddee418f6@gmail.com>
 <18A6F268395035B3.1570320@lists.openembedded.org>
 <7cryzdxdowehb5ig7rd3boyt2kjheqrtchhgimeu76qz3dmvog@7i53kqjpxctl>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <7cryzdxdowehb5ig7rd3boyt2kjheqrtchhgimeu76qz3dmvog@7i53kqjpxctl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 04:14:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126425



On 4/17/26 00:04, Hiago De Franco wrote:
> On Thu, Apr 16, 2026 at 06:07:05PM -0300, Hiago De Franco via lists.openembedded.org wrote:
>> On Thu, Apr 16, 2026 at 09:33:48PM +0200, Gyorgy Sarvari wrote:
>>> On 4/16/26 21:17, Hiago De Franco via lists.openembedded.org wrote:
>>>> SELinux layer build fails if 'meta-clang' is not present, which
>>>> shouldn't happen, since 'meta-clang' isn't a dependency.
>>>>
>>>> If 'selinux' is on DISTRO_FEATURES, PACKAGECONFIG calls
>>>> 'clang-native' even if uutils-coreutils is not being used (this is
>>>> enough to make the recipe fails on parsing time if meta-clang is not
>>>> present).
>>>>
>>>
>>>
>>> But meta-clang doesn't provide clang-native anymore, it's a shadow of
>>> what it used to be - clang-native comes from oe-core. Or am I
>>> misunderstanding the problem here? I don't really get the role of
>>> meta-clang with this recipe.
>>
>> You are correct, actually this is only affecting Scarthgap branch. I
>> fist spotted this on scarthgap, changed to master to test it too but I
>> probably did something wrong and kept the clang-layer or something
>> during my test. Sorry, my mistake.
>>
>> Thanks for letting me know clang-native is actually on oe-core now, I
>> fount the commit [0]. So maybe I should propose a backport of this to
>> fix the scarthgap issue?
>>
>> I will do a test now on Scarthgap, cherry-picking this commit to see how
>> it goes.
>>
>> [0] https://github.com/openembedded/openembedded-core/commit/43ba5ed17e069b13cd43c36650524a0113c81955
> 
> So it is actually harder than only cherry-picking this commit, there are
> more commits needed and they do not actually fit into Scarthgap.

That commit was a very major change in oe-core that took months to sort
out, it wouldn't be considered for acceptance in Scarthgap.

> 
> A BBMASK on uutils-coreutils will fix the issue for now, until I move to
> the next LTS.


I think your patch could be acceptable and useful for Scarthgap, if you
are interested in that.


> 
> Sorry for the noise, please ignore this patch since it is not suitable
> for master branch.
> 
> Regards,
> Hiago.
>>
>> Thanks,
>> Hiago.
>>>
>>>
>>>
>>>> Make 'selinux' PACKAGECONFIG dependend on clang-layer, and print a
>>>> warning if the user wants selinux support o uutils-coreutils but haven't
>>>> add clang-layer.
>>>>
>>>> Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
>>>> ---
>>>>  .../uutils-coreutils/uutils-coreutils_0.8.0.bb       | 12 +++++++++++-
>>>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
>>>> index 8b9b4dc199..99beb70104 100644
>>>> --- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
>>>> +++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
>>>> @@ -18,7 +18,17 @@ require ${BPN}-crates.inc
>>>>  PROVIDES = "coreutils"
>>>>  RPROVIDES:${PN} = "coreutils"
>>>>  
>>>> -PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux systemd', d)}"
>>>> +PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
>>>> +# This is required since uutils-coreutils uses selinux features that require clang-layer
>>>> +python __anonymous() {
>>>> +    if bb.utils.contains('DISTRO_FEATURES', 'selinux', True, False, d):
>>>> +        if bb.utils.contains('BBFILE_COLLECTIONS', 'clang-layer', True, False, d):
>>>> +            d.appendVar('PACKAGECONFIG', ' selinux')
>>>> +        else:
>>>> +            bb.warn("selinux is enabled but clang-layer is not in BBFILE_COLLECTIONS, "
>>>> +                "selinux support will be disabled. Add meta-clang to your bblayers.conf "
>>>> +                "if selinux support on uutils-coreutils is required.")
>>>> +}
>>>>  PACKAGECONFIG[selinux] = "--features feat_selinux,,clang-native libselinux-native libselinux"
>>>>  PACKAGECONFIG[systemd] = "--features feat_systemd_logind,,systemd"
>>>>  
>>>>
>>>>
>>>>
>>>>
>>>>
>>>
> 
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#126414): https://lists.openembedded.org/g/openembedded-devel/message/126414
>> Mute This Topic: https://lists.openembedded.org/mt/118863961/10204532
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [hfranco@baylibre.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 


