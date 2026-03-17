Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8B3FD7076
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 10:33:41 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72957.1773743614369495653
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 03:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K9yC+lB+;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486b96760easo3534125e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 03:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773743613; x=1774348413; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qKh4H0XKQqDj5kNuOy5S66S11BDv8aJlGCmpJXGaY2o=;
        b=K9yC+lB+YSRAncdxNiScAwF/e9nqyLtIBR5j5LGPn7F8BklF+4YUSk0ofMbF4sKHPU
         ErMivDVrdMqFTLtMxbVx1i99SY7qfUOFXLF7t8eqWgh8lSqGnM3aVez2NKv4Bipsy0go
         m4LY0F3yDCBQ/a9Z7+5C/JmQPwjTlVfNbbUrDkDkT3Aunyhlqd6kxeucBsFNAgq7En3v
         W4FctY6wA4iJU9Hlb4mS6i2z/dIQ0UypfZRvp9L8Ah0QfV/tjdF374PIofT9/KP5AeYX
         k6hd2nvCWC9xoORL+Xlb8WkcyFxmJL4OPpnzVQWSgq/8BP9TPQ6dhYLdwq1iu1aPU50D
         +U3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773743613; x=1774348413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKh4H0XKQqDj5kNuOy5S66S11BDv8aJlGCmpJXGaY2o=;
        b=IQJoe1YPQYl6YObpYYrhYwwLZnGfDesSMTNSthpu6+lH30rvC9OfI+7VvleKGpwpvq
         RqVb5xCTKmmgCp+Dl7sXQVoebbJO84Rc9HbzWAG8SxRFf5X/JN5ZSRTcS56Qe0zCQATP
         dR+Q/+txUb4zgwC1DI4JsMlZMm/oZwJyHJ4/WHVA5+driAllHoooC3tfIL045AjgVqDc
         EreFzowXCgJ6XlVToMl2uNV7SJdOfbtZMWL5urovQYn+mr1Tub+RnR6XuVeOAe5z3hF0
         OOKDuhJRvABaViGSUKdErELtrCpHALCP0Pd/zx85sKQjrv17byZaBLk9BoIkmmcND5wa
         Jhag==
X-Forwarded-Encrypted: i=1; AJvYcCUp+hPJHbEO3Kyj0EK2Nr4ZEBiHiJWC8/7YgRIcxDS7l/SYILyvcWccgd4wHzW1xvGE3LV/nsvjkPP/Or3+KCsT+cM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwCd/8LY/uXRW4uI97ViCRbGmQ8PpbR6I+sACVdJf+tm7wwqarn
	r+XdYk9HKxIX6iB2SJchROeQ+Hud/rje0h4RqNjnVGCaSf9ODUNkcns6
X-Gm-Gg: ATEYQzyPDkuP1nbtRSA0phi+1iU84pjByrNowH8IGwvHPqhwOtuS066im+ie6F/SGk/
	5z5bwruFg9ZrMJ3ApwEKYVmwPBkvs2ecKrvLbRaX+fqimi298fWwO37ePMuw8T+B9aIgdPDrFzx
	Ls4x93Wtt7pZsjT+Db9Ggkp29HSir0ceaO++uXD0rO7PX8wNNVDXcDbihcNijjWmnpYZq0Rk9ig
	54jv6kgb8qIWk0vZwb1xfj36YudUx2WuBSr7sXXUJNK9nOSPTCRTx+SYeEUAsPDC7G3c1WMfYQ1
	cfM0vOFkGd02rxI61jYlXZv1rP3dmWrusXBXBpoUoNWDgZ1PxgiYCFLCdFAv75t4wUO5Iaa+nev
	5HhFjZxk1RVYpe3e2avmzbCJC3jbh3u0wGeKjMWmiY4yIEc2SRZCLDnT/he5uPqxWR7SEegzi/v
	VTV90jhkqzzNt8Q9Bg5tyiFI5vaosHzck=
X-Received: by 2002:a05:600c:1e28:b0:485:3e19:9e01 with SMTP id 5b1f17b1804b1-4855670e7d2mr259669925e9.28.1773743612476;
        Tue, 17 Mar 2026 03:33:32 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43a0b2db487sm33086025f8f.28.2026.03.17.03.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 03:33:31 -0700 (PDT)
Message-ID: <cee29eab-457e-481e-857d-f552117fdc4d@gmail.com>
Date: Tue, 17 Mar 2026 11:33:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] dlt-daemon: upgrade 2.18.10 to 3.0.0
To: Changqing Li <changqing.li@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20260316083826.1550599-1-changqing.li@windriver.com>
 <20260316083826.1550599-6-changqing.li@windriver.com>
 <64b43660-a810-4ea1-a1b3-3015a0c47e1d@gmail.com>
 <9e353be2-26c5-46c4-8cdf-4ea33d24ac8a@gmail.com>
 <9e4de336-1673-4ff8-90fc-878f99ff4888@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <9e4de336-1673-4ff8-90fc-878f99ff4888@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 10:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125310


On 3/17/26 10:25, Changqing Li wrote:
> 
> On 3/16/26 19:29, Gyorgy Sarvari wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>
>> On 3/16/26 09:57, Gyorgy Sarvari wrote:
>>>
>>> On 3/16/26 09:38, Changqing Li via lists.openembedded.org wrote:
>>>> Changes:
>>>> https://github.com/COVESA/dlt-daemon/releases
>>>>
>>>> Remove patches already in 3.0.0:
>>>> 544.patch
>>>> 567.patch
>>>> 0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch
>>>> 0003-allow-build-with-cmake-4.patch
>>>>
>>>> Add 3 patches to fix build failures
>>>> 0001-Fix-compile-failure-related-to-gzlog.patch
>>>> 0001-Fix-kinds-of-build-failure.patch
>>>> 0001-Fix-build-failures.patch
>>>>
>>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>>> ---
>>>>   .../glib-2.0/glibmm-2.68_2.86.0.bb            |   4 +-
>>>
>>> Is this glibmm change intentional in this patch?
>>>
>>>
>> It seems that there are some compilation failures (different errors with
>> different libc implementations):
>>
>> musl:
>> https://gist.github.com/OldManYellsAtCloud/9ec67b1fae3daa99f2a8d20baba3a19a
> after research,  this is reproduced since systemd init manager used, so 
> the PACKAGECONFIG is different.
>>
>> glibc:
>> https://gist.github.com/OldManYellsAtCloud/4cd6a4d28156eb486efff83381394913
> 
> I cannot reproduce this.   strrchar return char* is aligned with return 
> type. seems should not have this error.
> 
> I build with sysvinit + musl , systemd + musl , sysvinit+glibc , systemd 
> +glibc with V2 patch, all can build successfully.
> 
> //Changqing
> 


Did you try it with glibc 2.43[1] in oe-core? That error indicates a
failed new restriction that came with this version

[1]:
https://git.openembedded.org/openembedded-core/commit/?id=f791d6c52870f3571e740ff7818d45bb0a717934

