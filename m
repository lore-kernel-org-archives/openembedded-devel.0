Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web12.2280.1595019448196726777
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jul 2020 13:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qMoa7cEf;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 95so7826180otw.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2020 13:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=IxtDvn5OBbDHMpcnpOh6MdPTpBZCeJYfAx9GC7K74Wg=;
        b=qMoa7cEfhiq+k9TzMZMEaBOBdNQU98c+B8saO0GR0lO7pwTXflxzr7ZZhXuvUwZN5Y
         lAroCzCuaV5evLqLpsLsJo2ONKHbwXRiBxl21R2zB5IukfbM+Z7qLVPgEaKTwQAvnmSo
         D7eKWO1kphKww3BqKg4rNwvuIuQAGVTEHdzZNLJhVPs2T7jGi1UTfK8DKf/WfgIbNglL
         AH0aQ2odJQmbQg1rgHF43T23zgzjSgR1jxoEvlorEZn77Hg/4xIBADdre0tuSsYddrXO
         UPdK0PIqqm2saB4NTYDUIjZxmHQVi1Xihd6VTnXEWGbV/0nxn0LENFu89QfpHHJLY/U+
         bKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=IxtDvn5OBbDHMpcnpOh6MdPTpBZCeJYfAx9GC7K74Wg=;
        b=K8y+Wh7wMMbP49IexLTsp5kFtPEbvwdZJvyYzEVWvvzGQq0iC+4WHJx4ftykJ2Apkf
         SjuisclSuTBwk3haNVimQG1dYYiOYZPjdqetgNr/gjq1AKg52rUhMp/rk1YZZ4cbrfMc
         yl70cJCyQMRh0T5J8m11iGmsSUvwNPSjMhAryRkSLcAwMSVGRHzVkDbbnicAxyY6mNet
         zzpmvgUyyvyZ044Ya4kmPKoWFLY//hoVC017XVsc4M1PMTt1oQzdAfK8fygD8Ose+dJi
         XfXNbvFDga1ZiR3yweCKE8qbuAAw4DkyPKSguZB99PFzzs0Z2LfFXz+d7yc1HE+c2c+r
         KCvw==
X-Gm-Message-State: AOAM531VkHwXdiG0simpT/QbWCJ4Y9G2KvexglwnOt0n3zNBGj6lBPB5
	H5lUjoFZTUy1We5AKUBzBxVhFwzVinI=
X-Google-Smtp-Source: ABdhPJzOxrXORlGreQvyPYRS78x22iiOmlelsYT6J69SPxsohVk59Dnikq2DI7Ba4d/TkaEZmsUTVQ==
X-Received: by 2002:a9d:68d1:: with SMTP id i17mr10202000oto.182.1595019447183;
        Fri, 17 Jul 2020 13:57:27 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:b082:650f:a46e:c68d? ([2601:202:4180:a5c0:b082:650f:a46e:c68d])
        by smtp.gmail.com with ESMTPSA id 108sm2135511oth.48.2020.07.17.13.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2020 13:57:26 -0700 (PDT)
Subject: Re: [oe] [dunfell 1/2] Revert "jsoncpp: upgrade 1.9.2 -> 1.9.3"
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-devel@lists.openembedded.org
References: <cover.1594999160.git.akuster808@gmail.com>
 <0e0b4892f50808b87223a1e8dbcd13d4e16368cf.1594999160.git.akuster808@gmail.com>
 <20200717172458.GF1229@localhost>
 <29d972cb-bd13-bae4-9668-57a65c48b938@gmail.com>
 <20200717195356.GG1229@localhost>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <ca9b789c-1aed-fb2e-207e-3312ff3d293f@gmail.com>
Date: Fri, 17 Jul 2020 13:57:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717195356.GG1229@localhost>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 7/17/20 12:53 PM, Adrian Bunk wrote:
> On Fri, Jul 17, 2020 at 12:16:10PM -0700, akuster808 wrote:
>>
>> On 7/17/20 10:24 AM, Adrian Bunk wrote:
>>> On Fri, Jul 17, 2020 at 08:20:54AM -0700, akuster wrote:
>>>> ...
>>>> --- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
>>>> +++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
>>>> ...
>>> This would make the version going backwards, please add
>>>   PV = "1.9.3+really1.9.2"
>> right.  Wouldn't EP = "1"  do the same?
> PE (not EP) would also solve this.
right.
>
> The problem with an epoch is that it is permanent while
> a +really version will go away with 1.9.4.
I don't expect to every update to 1.9.4 as .3 may have introduced ABI
changes otherwise I would not have reverted this to begin with.

-armin
>
> cu
> Adrian

