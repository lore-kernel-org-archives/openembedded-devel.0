Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83BFCAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 06:04:29 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.7350.1758175465531311716
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 23:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mQvwlcK4;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62ecd3c21d3so806966a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 23:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758175464; x=1758780264; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X59pFsC6KaM2vrILAwJPvFcvmp1TzGxrw4rjhIvJ9vw=;
        b=mQvwlcK4eQBWapmyhpZg5bDbdSZHMW02R26WsyrvXmvLFxxF11VGGmjSkX7Np0/TPt
         iHFrlMcSRMVdi2GAhQ4KtMwC06tEx1MLyFhrNtiCGA3LLP/jpe8Emz/0amWiWOoJUkqS
         XsfuSzBs9f7Ii9oM7Y13lnI7DljzZeTvDGsFYUGz9wy+TZJ6+cv/wZ2mK3b6RVx4sIvh
         b7dfP0oTshbZFqy2lxih/W4OFIgKohmqZ95Io5llaSbHDEH9WqmuwjXV+STURwsV0+bM
         wLFMqwpEG84f5jQLKr6EA5m2w0cH68jgzj0cOZH9dBupAsjDLoYZrhztm5pun3zfWd+p
         s1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758175464; x=1758780264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X59pFsC6KaM2vrILAwJPvFcvmp1TzGxrw4rjhIvJ9vw=;
        b=JwKXeUs2vPW6A3ciCzH4s+uJ0ioO3lGdBl2G7PdrqsEI3BN/6hrjCypsYG3VvZTrpa
         dPOFICF8UJEcj0Uu1B3ZRPibeinOyApiataIRUsmBKZUTXsM9sKVZGeZlCNVCZph9TqC
         +VGy/2HXebFb7juink3JJpc6ca4I4jULR515tnwVuYfsoB8IayxLCwfenSqYELWFmXxw
         BIcMGlfzptVMsBp48jEXldZixbFjZP0EfyRK/H5RxPw/8rpLBQvqHSZ/3BrZnrqAeFx0
         MePhqjUzs1RwudYEALxj16MzP52Yu2yheLlHuYzx+0ou3iR6i9/GSNJbkNyRAG3Nn7Yd
         0gtA==
X-Forwarded-Encrypted: i=1; AJvYcCWqtLs5XzQ9FLoj4jDuslLUFI1t4CiKsaX9JfkAPEB6vZQcD16EHZjaWXUR96/RVfqNIbWNDxl0LQDA4RyHapi/ous=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy1gdhRsqEjRYazSAToL7shNC2Xpb/IEuZ+fPaVolynVNa/eKN5
	hkgSkYvN2nhPjzftoS+LjeU3VvB8weK2F1WUtPZrGKd1Wdrjdvj0WTR/
X-Gm-Gg: ASbGncsSepZlHovSjem+xFgAgax88uE4bJgV7f9nu3jWIN+dyeKLhhjm6mXDp4fFdpv
	6hCiznvsxngduX2+TuAL7qtju/8Hu2VOYnvm0Wm9gwGpvT2y7aOWFDn1/wJkgZ29X4nL9lGtimi
	aYl9iSmWwgDZ6KuTo4ETYq8c9iDdNAhXQfMaxz1fpPtWpLvqj26c4dG/Y0fwdGJHsHxVFGn9dxr
	6fzQrxn3xH1fUOlLfoCTmiejWIcNW7HNugoiGbCtH0FomZMarL5qIAMQR1XSWZK6N0Pq9Il1zKG
	5qYyWbmRHQ/pp7I5kxHPjrKitgAeoy69h0tA746U9zL7yFuFzvba/BzOq4n81Ndvtta1JbRxyih
	Q/hXtMst5ij9ITaLG3a9EkSFH3A1YAwDahrJ+WlF67w3sGiCX9w==
X-Google-Smtp-Source: AGHT+IHPIuS2qqIrbwEr5xhY9owgYS6f7gCfREPjQfUT8bT9RBGgZ59nVbz3+ccVLwiZEkihcmN5ZQ==
X-Received: by 2002:a05:6402:40cc:b0:62f:a988:6f9d with SMTP id 4fb4d7f45d1cf-62fa98872d8mr703752a12.23.1758175463548;
        Wed, 17 Sep 2025 23:04:23 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5f41594sm815357a12.48.2025.09.17.23.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 23:04:23 -0700 (PDT)
Message-ID: <0a28eb90-d30a-40af-9809-657748160ba7@gmail.com>
Date: Thu, 18 Sep 2025 08:04:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][walnascar][PATCH 1/2] webkitgtk3: fix build
 failure with DEBUG_BUILD enabled
To: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>,
 "ankur.tyagi85@gmail.com" <ankur.tyagi85@gmail.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20250918034613.2714914-1-jiaying.song.cn@windriver.com>
 <9bc0177a-325b-4e15-bf4b-02eff47f3238@gmail.com>
 <IA4PR11MB9420D1F4C1459F8C20223514B816A@IA4PR11MB9420.namprd11.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <IA4PR11MB9420D1F4C1459F8C20223514B816A@IA4PR11MB9420.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 06:04:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119525

On 9/18/25 07:59, Song, Jiaying (CN) wrote:
> Thanks for your feedback. I’ve already sent a new patch to walnascar and fixed the typo in the master branch as well.

Thank you - but v2 seems to still have the same typo :)

>
> Thanks,
> Jiaying.
>
> -----Original Message-----
> From: Gyorgy Sarvari <skandigraun@gmail.com> 
> Sent: Thursday, September 18, 2025 12:30 PM
> To: Song, Jiaying (CN) <Jiaying.Song.CN@windriver.com>; ankur.tyagi85@gmail.com; openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][walnascar][PATCH 1/2] webkitgtk3: fix build failure with DEBUG_BUILD enabled
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On 9/18/25 05:46, Song, Jiaying (CN) via lists.openembedded.org wrote:
>> diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb 
>> b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
>> index b03ed3cbb9..c3d2169102 100644
>> --- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
>> +++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
>> @@ -21,6 +21,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
>>             file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
>>             file://fix-typo-denormaldisabler.patch \
>>             file://fix-ftbfs-riscv64.patch \
>> +           
>> + file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.pat
>> + ch \
>>             "
>>  SRC_URI[sha256sum] = "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f"
>>
>> @@ -99,7 +100,8 @@ EXTRA_OECMAKE = " \
>>       -DUSE_GTK4=OFF \
>>       ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
>>       ${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
>> -     -DENABLE_MINIBROWSER=ON \
>> +     ${@oe.utils.vartrue('DEBUG_BUILD', 
>> + '-DWEBKIT_NO_INLINE_HINTS=ON', '-DWEBKIT_NO_INLINE_HINTS=OFFF', d)} 
>> + \
> This seems to have an extra F (OFFF). It seems to be present in the patch for master branch aswell.
>
>> +        -DENABLE_MINIBROWSER=ON \
>>       -DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
>>               "
>>  # pass -g1 to massively reduce the size of the debug symbols (4.3GB 
>> to 700M at time of writing)
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#119514): 
>> https://lists.openembedded.org/g/openembedded-devel/message/119514
>> Mute This Topic: https://lists.openembedded.org/mt/115304633/6084445
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub 
>> [skandigraun@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


