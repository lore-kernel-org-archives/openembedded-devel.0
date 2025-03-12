Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28149C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 17:05:06 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.298.1741799099269137725
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 10:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SJLhRRde;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2b10bea16so18702266b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 10:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741799098; x=1742403898; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nX86hHp1qdiOkLNhsNCma9PDRneRB/+gKu1EhJWXeZI=;
        b=SJLhRRdeZuDypuaNWn8pcs8/W+Q6HWOUyubMJn5EZElJfDpnn0x9sdXdixslNdSjVp
         7j75OqA9yIwm/wwTpWzTQcY97PMVwza01QDjpG0gLDENiA4zOQ3wd/vrPRuO90AOnbOF
         WmgrZMfYnUTvIZlstvc/44zFg4opPmzHbofqmSTuqQtkjhPm1Yx15lgi8hD7DcPyHjYV
         N4PjndDVuT8wRh0VxBGtfqxJrQ2mT59jlHXRkgTl3suG1Tm8PyUJcQN9+rt362jcBgTw
         EiCrOLO6k1R35EJQ2doWVI28zx4Ne6z11gbBeYZPFEqtvbUM/mC21n+bTsWtxzr08m9T
         9m/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741799098; x=1742403898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nX86hHp1qdiOkLNhsNCma9PDRneRB/+gKu1EhJWXeZI=;
        b=tXQLbfp/U+Hl1BGkj1vCnmBbQpOyXP96ZTMx/J/JNvpG2/VnAFwU5scxETlH+1fOtU
         X9smtXrTMXkn1HxKHSrQF7mYi7+hBJCS7VDqT7tEk+FtrzkH7ClkLhUAmkwJcVAnSZXR
         tpHw8QwagmabAjjoYKHjN541wYtC7sEfly2oi6AaEuI74jmTa+eHTeMaSBZpSPaIzcqQ
         e8J/Lnn3kWe29WKVjBe03+C/AzpsbHIPhXHoXh3MFqRhcdg48H0e4alvTKiux7M7aJRG
         TxVGNSjktaHBKj/+iaO2vBb9eNoyxZGil9HPqIabstIpR5zJy/Lpq3yA0+yFKEuwghVT
         gKNQ==
X-Gm-Message-State: AOJu0Yz4xE7iFM6VExBAKXTmRTci2+IyZwBskbkhKSdZ5MSf0oux1USL
	7ZFFBkGya8YyqbZE9FCYHRoIcVXRosLEbmj5TdZcx66kPFsL8vIh
X-Gm-Gg: ASbGncsc+RALRElZuT6BgM7Pu6JJCULFMMZnMFV0wwbiycXmPg4Y574MNkBzViPoqrJ
	A2SYDAyRrlZK4K3DiX8+enoa9tL/+MJE53Oz5CLvUMWN2mGD8bwEuyEhfBJP+WjTTpEImIMfbxF
	rpmu6j4hKKAQT7DUID71ZyFJVoiLlKh1uG29SeBzFW9sNYrRSh0PAJjgBIlR14y4GUdD1i6HpvN
	aRDPRcZXZTUre5W5bnl/SYvDXjfge7IEMSFbKEn7wNXdhnT8PLFMLR22AGjtIoHnqj+NToBB0FR
	fl8f+q+kyw/H9tdJpDtzon4Ub8DoiHbhNoOIWxrCOBAZNpqeUvU3
X-Google-Smtp-Source: AGHT+IHr0VyU5sTMf/ZLGSagxgxpron7nn6L2XMbdy0O2tsLvGm/2LBGnY0KL6Sdx5iVf+sTBQbakA==
X-Received: by 2002:a17:907:2d20:b0:ac3:aa7:fa0b with SMTP id a640c23a62f3a-ac30aa7fbf3mr59796866b.53.1741799097251;
        Wed, 12 Mar 2025 10:04:57 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2a27d2613sm507862966b.12.2025.03.12.10.04.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 10:04:56 -0700 (PDT)
Message-ID: <356a4c72-2155-47ef-9ee1-180b861b94b1@gmail.com>
Date: Wed, 12 Mar 2025 18:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] meta-openembedded: flashrom: Update to
 v1.4.0
To: Naresh Solanki <naresh.solanki@9elements.com>
Cc: openembedded-devel@lists.openembedded.org, linux-kernel@vger.kernel.org,
 "Signed-off-by: Patrick Rudolph" <patrick.rudolph@9elements.com>
References: <20250312111915.2970032-1-naresh.solanki@9elements.com>
 <66b24018-0b7e-42b6-ad86-d80f37538678@gmail.com>
 <CABqG17im5hO7xv-r16mFhJwcXyXt-6OKA_vTaRdc7kuQrdZyzA@mail.gmail.com>
 <130308e4-b9c5-4e6c-97d2-c36f9edc1f43@gmail.com>
 <CABqG17hBviQ64jXgZ1fa5+ir37YPyK62LZvMgrSGADOxSTFo-w@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CABqG17hBviQ64jXgZ1fa5+ir37YPyK62LZvMgrSGADOxSTFo-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 17:05:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115931


On 12.03.25 17:56, Naresh Solanki wrote:
> Hi
>
> On Wed, 12 Mar 2025 at 22:09, Gyorgy Sarvari <skandigraun@gmail.com> wrote:
>> On 12.03.25 17:03, Naresh Solanki wrote:
>>> Hi Gyorgy,
>>>
>>> On Wed, 12 Mar 2025 at 19:47, Gyorgy Sarvari <skandigraun@gmail.com> wrote:
>>>> On 12.03.25 12:19, Naresh Solanki via lists.openembedded.org wrote:
>>>>> -Upstream-Status: Submitted [https://review.coreboot.org/c/flashrom/+/51960]
>>>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>> -Change-Id: I55c4e8529d36f0850dd56441c3fb8602c5d889fd
>>>>> +Upstream-Status: Inactive-Upstream
>>>> Is that really the case? I mean it is just being updated to a new
>>>> version, it doesn't look that inactive. That PR seems to be abandoned by
>>>> the submitter at the first superficial sight, is this not the case?
>>> Yes. its being inactive for long time.
>> The last commit date in the main branch of
>> https://review.coreboot.org/flashrom is "Sat Mar 1 19:19:16 2025 +1100"
>> - less than 2 weeks ago, with last release just before Christmas. It's
>> not as busy as Yocto, but doesn't look abandoned.
>>
>> Or am I looking at a wrong repo?
> Your right.
> I can work on flashrom 1.5.1 release. Please let me know.
>
> Thanks,
> Naresh

I was mostly interested about the Upstream-Status, thank you for the
confirmation.

I have no strong opinion about the new version - please do as you see it
fit.

>>>>> +
>>>>> +EXTRA_OEMESON="-Dbash_completion=disabled -Dtests=disabled"
>>>> Nitpick: Could you please fix the whitespaces around the equal sign?
>>> Sure.
>>>
>>> Regards,
>>> Naresh

