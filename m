Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1D8F436BB
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 16:21:20 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49093.1776442874839317716
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2026 09:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sE/LvjRu;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso8980445e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 09:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776442873; x=1777047673; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9j33hUBeKK4zxwDAbWUn+QoiJcilhwkTShVqcp2e8oE=;
        b=sE/LvjRumIFdSirbtMGKm9ls4vm59xx5OlsDCi7evnlRs2O1FqY0+sJaNQwEPgtATH
         FP5/s5DEtjThymnHVqMi8mudb9jUn07YDNWFRzJXqqUlY9/Uic3AHVATqBBfsStVL2MN
         BK1wCTO9vO37HNukU2CO0Zg9IN3XNRfyHxB23HyOZepJSYlkjRo8tppOH/zMvymWZwK1
         VuyEkZQkiq13yBvBPLIVK29n7H6uE0S7UfntR0MmF22F5qc6R0slHqfFgbNZm7//0mgX
         RO2ew0tSjQ3lEXnJQfUUHq8dWpia+dP2lEC/faoJT0ALnqlLjecIPNXItamMj0qCo1JD
         l1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776442873; x=1777047673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9j33hUBeKK4zxwDAbWUn+QoiJcilhwkTShVqcp2e8oE=;
        b=ohCjqTVbVjUkZOULkKXPLptqU8TxTjvSmaQwdoUOjioPUA0UeBRTaBxwpfqD087L4z
         BeAkT+HxydGq3di399RWSfu+b3G6B69mk6H3uK8O157W05YOJIvSLtid9lDuctJ8Pbhj
         UZIWV11822Ac1+b2O+qDw5NgPUbVDyNkTswEz9X8MY+OXuKpo52Sd8l2zMCiKBcuoCJy
         Sq5+YcgWr+q/DdJPPCIkL26DkDocwYz4GvlzNOgGhqJdtEYbwT0VoVM+KsnNcto0rpLd
         EjuPxv4cPZI66ivKBJx1GcTHN0t2E/c5vH35DD+Pw6ON5/t7cHtQKFuVyHk6erjEA2vC
         yRgw==
X-Gm-Message-State: AOJu0YyUugJ4UvNsnTToTSNlBxjf63EcJ7ZAMLjJn/bewrM0aIIZCbRu
	PtphcUd6aUMCwT+v7TFuh3ankLOHjq3u6iCEr+B+KQS1pIUlil0R+9yB
X-Gm-Gg: AeBDieurEuLgKUmwTttxQasrfU6yfaySxHK+p7AGvouXSbVlKnrykAe31ZgKveQ5gHo
	gNIYO3HTUmtKG/7J7HGWdlWs+q93ExAwcyN5OQlTny+QcCAa7GP2YtHKpGUEz4umOl9YOfXetJg
	HvXe/Py9qHOW1vaX/QYb+CY98Uws/k6/Hh+wnRuiO/8HdXvw4uGK8BajMJn1s2G0Le3rTX5FQWv
	R0zEPeXCmlbf7SW0RqiEj+O1fWNm81ukmfw0wqDVEQbi1dGWPaKfHvuUZylldhvQ+7zxPeUv+9h
	D3j5IQopo6MPS7VbqR2rlt7VG1hS39sQNndFnJvvWXTCGMuKcdt54/ZuY7oOzb8P92ZgMGjyTRh
	nwuonRSMDgelRa9losnj48GAPQP3u5jqO5JaMvdrptG/KesBL418fxf4h6K1NIuClQdl5yxsrjP
	3ICeE26ogYZ0QPrP1oYHwylFDtnpUSBEGzq39HNzDOIxdc8tIaY6PZ
X-Received: by 2002:a05:600c:6296:b0:483:64b4:79da with SMTP id 5b1f17b1804b1-488fb7923a9mr51991315e9.26.1776442872921;
        Fri, 17 Apr 2026 09:21:12 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb794d2esm33951535e9.6.2026.04.17.09.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 09:21:12 -0700 (PDT)
Message-ID: <4f2f37e1-321a-40ec-8881-af676788ad20@gmail.com>
Date: Fri, 17 Apr 2026 18:21:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] uutils-coreutils: make selinux
 PACKAGECONFIG dependend on clang-layer
To: Hiago De Franco <hfranco@baylibre.com>
Cc: openembedded-devel@lists.openembedded.org,
 Trevor Gamblin <tgamblin@baylibre.com>, majortomtosourcecontrol@gmail.com
References: <20260416191754.3910026-1-hfranco@baylibre.com>
 <a64fce2a-a609-47e7-a60f-634ddee418f6@gmail.com>
 <18A6F268395035B3.1570320@lists.openembedded.org>
 <7cryzdxdowehb5ig7rd3boyt2kjheqrtchhgimeu76qz3dmvog@7i53kqjpxctl>
 <04d018b2-00d7-4147-8933-b84171bc20e4@gmail.com>
 <57p2oi523zvfjbffibnnbtlc2d6uc743up4s3tgxoai6ndczlh@b25xfcjuvfzs>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <57p2oi523zvfjbffibnnbtlc2d6uc743up4s3tgxoai6ndczlh@b25xfcjuvfzs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 16:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126446

On 4/17/26 15:56, Hiago De Franco wrote:
> On Fri, Apr 17, 2026 at 06:14:14AM +0200, Gyorgy Sarvari wrote:
>>
>>
>> On 4/17/26 00:04, Hiago De Franco wrote:
>>> On Thu, Apr 16, 2026 at 06:07:05PM -0300, Hiago De Franco via lists.openembedded.org wrote:
>>>> On Thu, Apr 16, 2026 at 09:33:48PM +0200, Gyorgy Sarvari wrote:
>>>>> On 4/16/26 21:17, Hiago De Franco via lists.openembedded.org wrote:
>>>>>> SELinux layer build fails if 'meta-clang' is not present, which
>>>>>> shouldn't happen, since 'meta-clang' isn't a dependency.
>>>>>>
>>>>>> If 'selinux' is on DISTRO_FEATURES, PACKAGECONFIG calls
>>>>>> 'clang-native' even if uutils-coreutils is not being used (this is
>>>>>> enough to make the recipe fails on parsing time if meta-clang is not
>>>>>> present).
>>>>>>
>>>>>
>>>>>
>>>>> But meta-clang doesn't provide clang-native anymore, it's a shadow of
>>>>> what it used to be - clang-native comes from oe-core. Or am I
>>>>> misunderstanding the problem here? I don't really get the role of
>>>>> meta-clang with this recipe.
>>>>
>>>> You are correct, actually this is only affecting Scarthgap branch. I
>>>> fist spotted this on scarthgap, changed to master to test it too but I
>>>> probably did something wrong and kept the clang-layer or something
>>>> during my test. Sorry, my mistake.
>>>>
>>>> Thanks for letting me know clang-native is actually on oe-core now, I
>>>> fount the commit [0]. So maybe I should propose a backport of this to
>>>> fix the scarthgap issue?
>>>>
>>>> I will do a test now on Scarthgap, cherry-picking this commit to see how
>>>> it goes.
>>>>
>>>> [0] https://github.com/openembedded/openembedded-core/commit/43ba5ed17e069b13cd43c36650524a0113c81955
>>>
>>> So it is actually harder than only cherry-picking this commit, there are
>>> more commits needed and they do not actually fit into Scarthgap.
>>
>> That commit was a very major change in oe-core that took months to sort
>> out, it wouldn't be considered for acceptance in Scarthgap.
>>
>>>
>>> A BBMASK on uutils-coreutils will fix the issue for now, until I move to
>>> the next LTS.
>>
>>
>> I think your patch could be acceptable and useful for Scarthgap, if you
>> are interested in that.
> 
> I am interested. Just for clarification, you mean the original patch I
> sent, not the BBMASK patch, right?
> 
> If this is about the original patch, I can add it to Scarthgap and
> re-send.
> 

Yes, I meant it for the original patch - I didn't realize that Clayton
took a stab at the very same issue also. This is an issue that I think
deserves a patch, it does have a hidden dependency on meta-clang which
is not nice, and apparently caused some headaches for multiple people.

I do see Anuj's issue with Clayton's patch, as it changes the default
behavior - I think this patch could have a better chance as it tries to
keep the original behavior.

But overall I don't have a strong opinion on the way it is solved, if
there is a patch that makes everyone happy.


> Regards,
> Hiago.
> 
>>
>>
>>>
>>> Sorry for the noise, please ignore this patch since it is not suitable
>>> for master branch.
>>>
>>> Regards,
>>> Hiago.
>>>>
>>>> Thanks,
>>>> Hiago.
>>>>>
>>>>>
>>>>>
>>>>>> Make 'selinux' PACKAGECONFIG dependend on clang-layer, and print a
>>>>>> warning if the user wants selinux support o uutils-coreutils but haven't
>>>>>> add clang-layer.
>>>>>>
>>>>>> Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
>>>>>> ---
>>>>>>  .../uutils-coreutils/uutils-coreutils_0.8.0.bb       | 12 +++++++++++-
>>>>>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
>>>>>> index 8b9b4dc199..99beb70104 100644
>>>>>> --- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
>>>>>> +++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.8.0.bb
>>>>>> @@ -18,7 +18,17 @@ require ${BPN}-crates.inc
>>>>>>  PROVIDES = "coreutils"
>>>>>>  RPROVIDES:${PN} = "coreutils"
>>>>>>  
>>>>>> -PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux systemd', d)}"
>>>>>> +PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
>>>>>> +# This is required since uutils-coreutils uses selinux features that require clang-layer
>>>>>> +python __anonymous() {
>>>>>> +    if bb.utils.contains('DISTRO_FEATURES', 'selinux', True, False, d):
>>>>>> +        if bb.utils.contains('BBFILE_COLLECTIONS', 'clang-layer', True, False, d):
>>>>>> +            d.appendVar('PACKAGECONFIG', ' selinux')
>>>>>> +        else:
>>>>>> +            bb.warn("selinux is enabled but clang-layer is not in BBFILE_COLLECTIONS, "
>>>>>> +                "selinux support will be disabled. Add meta-clang to your bblayers.conf "
>>>>>> +                "if selinux support on uutils-coreutils is required.")
>>>>>> +}
>>>>>>  PACKAGECONFIG[selinux] = "--features feat_selinux,,clang-native libselinux-native libselinux"
>>>>>>  PACKAGECONFIG[systemd] = "--features feat_systemd_logind,,systemd"
>>>>>>  
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#126414): https://lists.openembedded.org/g/openembedded-devel/message/126414
>>>> Mute This Topic: https://lists.openembedded.org/mt/118863961/10204532
>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [hfranco@baylibre.com]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>
>>>
>>


