Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 645FDCD13DA
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 15:55:56 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2117.1777564551689376558
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 08:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qKFBE/gZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-446fea16729so1018353f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 08:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777564550; x=1778169350; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jS8bk1j/+2s/VKD+NAK/UIogSZA2qujtICFlPdEWdwY=;
        b=qKFBE/gZn8eFYq1mwJ/UCV8EDVf0gX+Wt3nFWlXQlAOxEQqIYjWAvBhT0KSu71qGwL
         JWQkmwfJ3NCCVa72NRtQ13rxthI3+ujhL71VBiMbXLt7D2rlxvon8FuQHGx0k3iMdB7V
         LJuSPsZTerbl2Y/i9x+6awoUrDmGga77GbQeqVJ8o8Zm2KdVlJIVLiRpE6w21QWYqk/C
         TiAXx0Rrq/yzhUCF4yEfzThfu+6/VEX7bTQEqEGfeIKtJCyjkkTx9qXTtJkaBxVTvBO3
         P3AgHbmkLN5xSG6m48GV0mUFPYzOQcw+NM0hemnr3dwtBwWTgleRDJO6m0lp0gjSDMYF
         QFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777564550; x=1778169350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jS8bk1j/+2s/VKD+NAK/UIogSZA2qujtICFlPdEWdwY=;
        b=LYmEA+WnnjrofnRSxyICjSARx6VfrBYvPZJXXJLCnOdm3w/L06IAcRx7zErWAZAxca
         pcY8x6D80gDPTrWfVnWH8H47sY0EnMvmCs+W/Ruf/6iKnaveDqVARnY8BJoQc2+o2BB0
         J2lwbpE8Xp98mqmGwx3NQ9mJPQ/JbyCHg2kh296xf3mikhegme7rB8R9yWJnGVLHUqcF
         Dr0rB9UZi4zbcPFlP8QCTAH0yM/dsasLkdwiSWjvYmll2exbBHKbOKjskddV6CQNEiIZ
         gW3WdugSABEDJPJ04BwBz+yY+eENZM0hr2Su4wvP97oB2ha1LT6qcAu171ZGqQZkacrA
         Xa3w==
X-Forwarded-Encrypted: i=1; AFNElJ8k4/TT9ocZE+9X9GV4b0wvE7sfB7ryDYn6iJqPKVycyzdl17uGpgRLmPeLwswV6QMPTaYSJDSpTq1bKHiDz0kAsOw=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxY8/oc0Fn7FL16hhbJDr903+Uqg9nvh8m4lR+EOS7duFxRlITm
	7YtNQIIVvwY38XsabDl5B2caF7B3YBQO15/jiHMYdu4J5OtBTfm4ZETa
X-Gm-Gg: AeBDievyje+O/4nJ/Yh7KJl2s5FFl3uhlDmK63uskis/jUPzMCCyw3pdmhSuC4CYcij
	Y4EO8u7sYQOpiTmcg6M4P2U+KOwIS6D78i54c0U4Bt38h68OhKFZVHuzl8gM/LAmAaFHJk1MkhA
	2OC7yTEROIKy2teNqPDne+qNz027+IsYQBNOkNOi2AScIxN79XhpgEPQXSbta5biTInYnz4gBcD
	ogY5aO1K4VkmOAdWjlRrDON7ty4lqYBXpCDtV6Q4l3wvQemh+00/M1x6KltOSIiRMKHi/jXpOIM
	GZUjzxyxmw4b7RHN9AkCEHXAF78J9lG9PeOwnK72REHi9HRoMYcx5PE53urX4StUgVxCO3CjArt
	bS77zZMUGuYZfPy49kNJhZWYTVnY8rkf3SippUN9XQiGzDx3NumwLepb549daP2i1Nt835k27AC
	Z3ZuFcUtG5fKr4WDqtcKrkYbJT9kojZLa62U1QngnXAg==
X-Received: by 2002:a05:6000:184a:b0:43d:7508:c9c6 with SMTP id ffacd0b85a97d-4493e1c1653mr6192333f8f.28.1777564549867;
        Thu, 30 Apr 2026 08:55:49 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b4216ecasm14181989f8f.14.2026.04.30.08.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 08:55:49 -0700 (PDT)
Message-ID: <893542e3-5c74-4160-86d6-f2882cdd201b@gmail.com>
Date: Thu, 30 Apr 2026 17:55:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH v2] mbedtls: add recipe for v4.1.0
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
References: <20260424064603.728430-1-skandigraun@gmail.com>
 <CAMKF1sp4hCeyML8MMaOne2t2p_1+oKH37mvJUjF4M-soB2U_6A@mail.gmail.com>
 <CAMKF1so9vPsqk7eTi_ypsr-TiTJSeZFNPgri1KvvKzaT+yinug@mail.gmail.com>
 <18A9E5089EA766DA.2188217@lists.openembedded.org>
 <CAO5Uq5TarogKhyRTSZeYaZmSPPhJb0k2bKCJhSG3hev-Wf9m-g@mail.gmail.com>
 <7380b427-4e88-4eaa-906d-6274080ff715@gmail.com>
 <18AA71BEBB6753BD.2323083@lists.openembedded.org>
 <CAO5Uq5Q_L=V_G9GPzec-9Nu1iD0zgRAGCxg8gO9V0qXfzkbqow@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAO5Uq5Q_L=V_G9GPzec-9Nu1iD0zgRAGCxg8gO9V0qXfzkbqow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 15:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126759


On 4/30/26 09:37, Alex Kiernan wrote:
> On Tue, Apr 28, 2026 at 7:34 AM Alex Kiernan via
> lists.openembedded.org <alex.kiernan=gmail.com@lists.openembedded.org>
> wrote:
>>
>> On Mon, Apr 27, 2026 at 3:08 PM Gyorgy Sarvari <skandigraun@gmail.com> wrote:
>>>
>>> On 4/27/26 11:09, Alex Kiernan wrote:
>>>> On Sun, Apr 26, 2026 at 12:35 PM Alex Kiernan via
>>>> lists.openembedded.org <alex.kiernan=gmail.com@lists.openembedded.org>
>>>> wrote:
>>>>>
>>>>> Just dropping mbedtls/ecp.h looks like it might be sufficient for mdns
>>>>> (untested because of the mbedtls build failure around qemuwrapper):
>>>>>
>>>>> diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c
>>>>> index 6726ef9b9145..c2e47ba232a5 100644
>>>>> --- a/mDNSPosix/mbedtls.c
>>>>> +++ b/mDNSPosix/mbedtls.c
>>>>> @@ -31,7 +31,6 @@
>>>>>
>>>>>  #include <mbedtls/error.h>
>>>>>  #include <mbedtls/pk.h>
>>>>> -#include <mbedtls/ecp.h>
>>>>>  #include <mbedtls/ecdsa.h>
>>>>>  #include <mbedtls/entropy.h>
>>>>>  #include <mbedtls/ctr_drbg.h>
>>>>>
>>>>
>>>> Scratch that... the changes needed are much more than simple header removal.
>>>>
>>>
>>>
>>> Good to know, thanks - but I think this also means that it won't get
>>> into Wrynose unfortunately. Doing big changes on multiple recipes is
>>> just too unstable for a stable branch, I guess.
>>>
>>
>> Given how much of the legacy API they've removed/the transition to
>> PSA, I wonder if we're at the point of needing mbedtls3 as a separate
>> recipe - for mDNSResponder we're at Apple's mercy to upgrade it to
>> something that works with mbedtls4, or we'll just carry patches
>> forever.
> 
> Actually it looks like the changes might be trivial... will wait for
> the mbedtls4 recipe to land so I can check.
> 

Just in case you are (or anyone else is) waiting on me, please don't.
When it became apparent that the extent of this change is way too big
for Wrynose, it became a low priority issue for me. I might get back to
it in the future, but if anyone has more motivation to do the upgrade
than I, please feel free to finish it.


