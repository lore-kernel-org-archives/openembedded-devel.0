Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.9917.1613491109434737154
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Feb 2021 07:58:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TG0ZBqVG;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id cl8so5943621pjb.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Feb 2021 07:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=OanNEGcnAgv3OWAeYbRRbzXSlm1A6KTDE1/VW4YkRfA=;
        b=TG0ZBqVGPF37zkaTzzbkJNdXjPC3MCCKcB3fFmQIUTxHH9gqlE2afgSauH10clpzuT
         AX0T/wU3ClnTLbgJN5cOMFKYmaPPxRL3iRuLPP8xSbftirLKFtVnPtgxWgML/6Ep+oQf
         w1CGVstSknICuinQweZTamnYy/bK+V0Xb3h03Pn0lczkgyniuUtTw1FDA04T5Ucz9DDr
         SPswZ5tV0yUEHMy3J5a+J6IsdPzPlwxWhxJTDSCGxJ1poLRWMehf1aLGQzjJ/DEqiFFQ
         rnBPCLiXwKP29QZjX+e1bWC6XTzTKg0rgcRAsREn8cXP4vBYlgAUDG21LzLK6yMbF+sA
         kzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=OanNEGcnAgv3OWAeYbRRbzXSlm1A6KTDE1/VW4YkRfA=;
        b=lnEFqWeCie5ILSXRoaHxQwl8vidik5cDfSFZPtoqnoN41RRMlN78TMii0egkOtsYo/
         OVe3TX9OGTaO3FwcbF8jIbI4/VgngAp87DUMFt8VgC+7ifcJ6LacJSyqrEIrRorkb/JE
         SrCzSK7f25b2flQsMUq0dGKuo9ToAdCekBZnqycypwGYkVKcYjAKBMLZnefzkjO5/DHn
         ysP2owdfMxvC9QBxl7DUHu0hsWPv7MUc1v2MIOitobvqDDW3zzwGKSY9ibuDpmmHTFmt
         isuQ8mnId8GQKAujqinBIiszsnvegK30vwnOZz6UrKAJAcmDNpwu7CdJ3c+pVazh06DY
         zkrg==
X-Gm-Message-State: AOAM530iziyP/bADD9vo6AJmszBRLP90vnO3AdzZGss7TD6xcf8M3aO+
	6aWmQgGgvKkV/Augd3sr3a0zYJrN19WJLA==
X-Google-Smtp-Source: ABdhPJzO2o/SnhtTxRp835pvE9CkLkeMTBjgJF5VHFvlet7XhKRg45wyGWq+dastcLXY3P/V1mQwlQ==
X-Received: by 2002:a17:90a:6549:: with SMTP id f9mr4888764pjs.17.1613491108581;
        Tue, 16 Feb 2021 07:58:28 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:3567:4d62:c82e:b7f7? ([2601:202:4180:a5c0:3567:4d62:c82e:b7f7])
        by smtp.gmail.com with ESMTPSA id s11sm21272338pfu.69.2021.02.16.07.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Feb 2021 07:58:28 -0800 (PST)
Subject: Re: [oe] [dunfell 00/11] Patch review Feb 15th
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <cover.1613440394.git.akuster808@gmail.com>
 <20210216095535.57niv5clax3lzwlr@jama>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <98cfdeec-d542-5eca-3c3e-3eeabc8ca334@gmail.com>
Date: Tue, 16 Feb 2021 07:58:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216095535.57niv5clax3lzwlr@jama>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/16/21 1:55 AM, Martin Jansa wrote:
> On Mon, Feb 15, 2021 at 05:58:08PM -0800, akuster wrote:
>> Here is the next set for review.
>> Please have reviews back by Wednesday
>>
>> The following changes since commit de37512b25c1f8c6bb6ab2b3782ac0fe01443483:
>>
>>   gpsd: mark CLEANBROKEN (2021-01-31 09:42:35 -0800)
>>
>> are available in the Git repository at:
>>
>>   git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
>>   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut
> Please include
> https://lists.openembedded.org/g/openembedded-devel/message/89395
> as well.
got it thanks.
Armin
