Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.25904.1612730260255712472
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 12:37:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sIstM3d9;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id j2so8943313pgl.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 12:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r/PdG/8BPOKU/QsgSWhi93hgx3xt7uEY9I/EZZdaOmQ=;
        b=sIstM3d9ljojm1JzeeJ9ngHqpYFv/q/LV7FM80k4oBszV/XpqmqO2WNMzB/VC3xgyi
         GFu96zUT5yaoxUmLokXN5ZWz4IyWjV42CSvUdaBh2OfjCg9Tu03NfXwcqBBp0+3xb2c9
         ckSWmy3sTuJTrLZCxWjAHlV7qtuUl8u31Wp/N/8JH3zTYYa7JHXD/kDHamwqzTP/LTDO
         LJe7hiOLRpXAqX64ypGlBYZhnaW6h4GI0igZD740sYGu/Y8LAe7lFnBLnluCORiWQJJj
         TBzcsbkpyF5HzHjd2hG9Mv7UfTtGYB6EWfd2okr/s+jLfnTd+SX2jDXqphTQd8MOoHnZ
         ivrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=r/PdG/8BPOKU/QsgSWhi93hgx3xt7uEY9I/EZZdaOmQ=;
        b=nsh7eeNIelme/Z6jlcM6JD9cYeCGwgAuK4fY3ivfkmrgS1hcSYtd6e0CiyjAXr8u9g
         W+16KIZLEONnezDSbqIa+4WtqJngpZpOZKKalwEcF015fp3pMgPHJ7bxR4CDbMI9IuEt
         CCcaoZXaBPhd1keeQzRbeFzdxDLVLUT8hzUxcwaL/ldlnbhsuaW7MdKTWtjWn1uyBRej
         2KAePa3RP3ei4t3EnE0MpRscu9bcGTHeBD51JhZl9woUYeoo1/IUFMdhIg6dbE+fuoJL
         JHefsYc8zrOqIIn8N5eM9nvdZg20QsjxtZzF136Qe+5IM+BnlWa1sxnjHXm1hK8Ar2iE
         d1GA==
X-Gm-Message-State: AOAM531+j1lHWTA4ORTdrUxxoUZsmYLv9iqhcskGoM9mmrsXdIHYraQq
	XR5/w77chFPKGM+N125eBb5Ic5vC64TdAA==
X-Google-Smtp-Source: ABdhPJwyP0Ku1oR3Sr+NqVYBaX14z+f7Fveq7sPhe8ru+iRTg6hdO5gcT7jh2YAiBfDiNSaa1nq6Ew==
X-Received: by 2002:a63:db57:: with SMTP id x23mr14339780pgi.131.1612730259584;
        Sun, 07 Feb 2021 12:37:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:5c42:26fc:b9c5:a11c? ([2601:646:9200:a0f0:5c42:26fc:b9c5:a11c])
        by smtp.gmail.com with ESMTPSA id 74sm292442pfw.53.2021.02.07.12.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Feb 2021 12:37:39 -0800 (PST)
Subject: Re: [oe] [meta-oe][PATCH] meta-oe/README: add Ubuntu 20 req.
To: Martin Jansa <Martin.Jansa@gmail.com>, akuster <akuster808@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20210207192056.30420-1-akuster808@gmail.com>
 <CA+chaQde30a46vvvQUBzdx-gwj_RBmBpfaP37Va_6DMnNdgPLw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <a1bdd8fe-4f85-a2c3-db60-477c9b976b1e@gmail.com>
Date: Sun, 7 Feb 2021 12:37:37 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQde30a46vvvQUBzdx-gwj_RBmBpfaP37Va_6DMnNdgPLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 2/7/21 11:28 AM, Martin Jansa wrote:
> On Sun, Feb 7, 2021 at 8:21 PM akuster <akuster808@gmail.com 
> <mailto:akuster808@gmail.com>> wrote:
> 
>     When building on Ubuntu 20.04, luajit needs 32bit support
>     so install 'gcc-multilib'
> 
>     Signed-off-by: Armin Kuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>>
>     ---
>       meta-oe/README | 3 +++
>       1 file changed, 3 insertions(+)
> 
>     diff --git a/meta-oe/README b/meta-oe/README
>     index 8d787df68b..9034342643 100644
>     --- a/meta-oe/README
>     +++ b/meta-oe/README
>     @@ -14,6 +14,9 @@ e.g. on archlinux based distributions install
>     prerequisites like below
> 
>       pacman -S lib32-gcc-libs lib32-glibc
> 
>     +Ubuntu 20.05
>     +sudo apt-get install gcc-multilib
> 
> 
> This is true for older ubuntu versions as well, so I would drop the 
> version here (or fix the typo in it)
> 
> Also I don't see this in master branch.

I have edited it to be version agnostic and applied it to master-next

> 
>     +
>       Send pull requests to openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org> with '[meta-oe]'
>     in the subject'
> 
>       When sending single patches, please use something like:
>     -- 
>     2.17.1
> 
> 
> 
> 
> 
> 
> 
> 
