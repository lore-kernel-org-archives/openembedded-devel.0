Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.9649.1588868295857611070
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2020 09:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q9KpYpzV;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id q24so2834897pjd.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 May 2020 09:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=NKF/bS0P/9BdaEvB4S3zBXLMn5MHKF+aTF8DxHW6YW4=;
        b=Q9KpYpzV5n6+rSYjdA0gS9jy7OeoR9pJGWdeNV3JgoaP4RfkjNuOO1+E/F3hynoHKW
         gjVA8PyzO1YLWtIHBQt2qYAsIsSOYlyCaxaZ/j0jVuSlMJrM4WE7zowpND7lPATx5dKm
         QmQcIuBOgH9vlG4KkI1Do4Elm5NyrwAPwprwT7DyTZuNr/SKcKbZMqtOONuEbKEgMEuw
         QxNhWozN60Nx2ZDuC17YBqIC9+MaEd2X0va8WsK4Nhyo5lES5TY7F2u5WJfzPQkKg7JF
         +1exONF077y8dGmIxUQxZDFmQxb9hWswapCwUZGDG3EjWz0f36jYVyVrgaMPnGqn+CW4
         d3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NKF/bS0P/9BdaEvB4S3zBXLMn5MHKF+aTF8DxHW6YW4=;
        b=jvD7TpAH25zm2Pon9hPgONESxVfDgJ0+ipL8GU0+DVbxA7h7CXvETaqIwTKyyr7iWG
         3/COvDJHsy45Nxe+G/EwF7hJevrR1AItnZ2ose2QsPPIHnE4hBr24LCTuQOohZKl3DKk
         Xprd2c8U8Edr38IYpBfL0sdkRUzsS6Pn09pvcMbgNkLVZ3hyE88V361oni22HgLWgbEf
         go1ZZvyn50ndnztER+xAA0kPAbYe0m5DJ0ZesVQlggxaRBEo6Rbg2J5R8NuyXCypwGSx
         /J6eVXYoAc9+qQRyKJVlML6Y6RceLurODUruK79DzgXTB8GEuSQZh+QtAU/27w1cWGHV
         OnJw==
X-Gm-Message-State: AGi0Pub5RbLdi48smhEMZ5S43y0d5VAoIMvhK074wLmpWhMqKc5VO2ha
	VnZ7/Bd+x/80VODpirwdbFVexwofIQI=
X-Google-Smtp-Source: APiQypL0Z/39J3CjJZ7t3sqhy4Qjs0v2ieOYN+nkNGUkw0YFjUaFr9En0xMt65yindF1FV7cgd67+g==
X-Received: by 2002:a17:90b:128d:: with SMTP id fw13mr848475pjb.23.1588868294761;
        Thu, 07 May 2020 09:18:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:fd65:d4fd:fbf6:bf1b? ([2601:646:9200:4e0:fd65:d4fd:fbf6:bf1b])
        by smtp.gmail.com with ESMTPSA id e10sm3710360pfl.195.2020.05.07.09.18.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 09:18:14 -0700 (PDT)
Subject: Re: [oe] [meta-oe] php: error running opcache
To: openembedded-devel@lists.openembedded.org
References: <160CC6B663840241.1278@lists.openembedded.org>
 <bded3d1a-d0b0-0fd7-a023-0d358650a721@cybernetics.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <b6b68078-5c4c-42b4-a689-364db2df13f5@gmail.com>
Date: Thu, 7 May 2020 09:18:13 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <bded3d1a-d0b0-0fd7-a023-0d358650a721@cybernetics.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/7/20 8:59 AM, Claude Bing wrote:
> I think that I have fixed the issue by overriding the following line in
> php_7.4.4.bb:
> 
> PACKAGECONFIG[opcache] = "--enable-opcache,--disable-opcache"
> 
>    to
> 
> PACKAGECONFIG[opcache] = "--enable-opcache=shared,--disable-opcache"
> 
> Regards,
> 

Can you also prepare a patch and send here

> Claude Bing
> 
> On 5/7/20 10:53 AM, Claude Bing wrote:
>> Hello all.  I am in the process of upgrading our Yocto installation to
>> the Dunfell branch(es), and I came across a peculiar issue with PHP.  We
>> use the opcache extension, but it is emitting the following error on
>> startup:
>>
>> Failed loading
>> /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so:
>> /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so: undefined
>> symbol: shm_unlink
>>
>> Is anyone else having this issue in their environment?  I will continue
>> researching to see what caused the problem to appear between Zeus and
>> Dunfell, but I suspect it has something to do with the PHP 7.4 upgrade.
>>
>>
>>
>>
>>
>> 
