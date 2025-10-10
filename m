Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB81BCCA476
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 04:44:13 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.1510.1760071438781771874
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 21:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TKeLc4hf;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b4c89df6145so253891866b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 21:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760071437; x=1760676237; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1D4nmrJYb92drFBXb4crvel+R3hF8iJRAYJYs8WUsig=;
        b=TKeLc4hfcVNgXMZ+c/eyw+OFWSTCBnqDEwK2ToZ5vfnk3A3QmK8vER3fVwyVQ+/nBN
         oTo2AS0WsyPB8cTVI11N/6ZK2ESBghXnQ/90MO0NAaSyhJWDja+2OoUcBdknQvcG0JM2
         id7uUc2XVaMwc9pVih0iEUpc1HIP50T3GOCKmrqWsrQ8LyDmJsDgDcasZWjKcNvxWdT3
         4s/KKGd0G48JlN4KE5iFpIcuJjK2OpI2picXo3VHC4PlUyC5TWCLpHI4ETcI5+CGbl4y
         wlPBU+CRjXiSgFd5XfcFbGKDfTR8yNImWQg9ATDwHUuBho2RqKboYpUMXGCbsS9bHT+8
         3b1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760071437; x=1760676237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1D4nmrJYb92drFBXb4crvel+R3hF8iJRAYJYs8WUsig=;
        b=Di9HIkovMaHuPJJ1PberNCB28+tl1YQsUHeD3FxykcK7J17Yceld5l0BfFt76/9SjV
         JG2j8Og6w88mLEoPLJTRiaIVhJmJF9P7vYxDO2cYnNsWNJXLNzR6USXDfHk2z8ZmKhvC
         uJWuzdb5XxMWe8kEZmHKJAHBeXwOAmZl/KfIpZOhEKFPZG7E3tSS7wKzmPT5VWFY9Dlx
         2Jf1gVzwAQcg1rBqyJ6wYe4H7as2W37POjXDuuQyvSpzpJxb+uHg93gvqUXPrMUAlxyc
         1at9nrXXDRla9vuzfKz1q4Lx2pjh0yal2bvbcVvmUC4af09I3u/luz4nINH3ERPM2ZDy
         REQw==
X-Forwarded-Encrypted: i=1; AJvYcCX5gUaCHBX2U9NsQkkMFour31NC7b/tAb3uvuXC1gzKb202ocjWXZHNXTv9Dl8cThU8PZbjptmIflYNxSm0i3ekzIc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzkSwEbV9VX0LupYDJChNWoyZbhgmaPLITr4pFIF/CtL6p/OpQU
	mSTP8Tj8rsHrAVXPUvla8/TvcwFik1ZGqg9TG63MrX9SddhLfaVpxv+l
X-Gm-Gg: ASbGncvunqm9GhKuH0A1ZUDWp/EQ9Mehehv9N90rq3FateZVBTKsQmNtSfUCkp1jKOr
	8e2t4FarIIBMFedbHSye2rNgzGeUtUSwAG6vvsT7h+EyQYmhZ/VBEnGYO9Xx/zEcfgxAaTsz1en
	Je5uvhLymgA8nbqM7MDkoUsFD+znLLBPKBdFYFf3ZXUFOIaqwcjbrByPdKnnUZav8vgrF0G+eA9
	n0R8LsFkVn6s2ipxQjXhLwYXUclc9P0C+DLDsbrc7gkwfS6KwKZiGsQFKcPynhzRILY9bogdZKe
	sVR+tkI5zpz3dl3QwbfRUI+52MK1xcKG260UDwqHeLdYpLpcdiZpca/NXDAyULLtY5ZOEWRnpXx
	yWpQGb8lgtVvPul0Dv4ChgbJ8WcE9dX/SyGgtiHffcG+mXQ2Rkg==
X-Google-Smtp-Source: AGHT+IFVrF9qGcfftbYncEW06iy5XAiMiQ3hOwDBsJ3zPsZrl7mbgW3RSnEXaUEwNr4bpkWERC7kyg==
X-Received: by 2002:a17:907:2d8c:b0:b32:2b60:ee2 with SMTP id a640c23a62f3a-b50ac1c46d7mr1042737066b.41.1760071436973;
        Thu, 09 Oct 2025 21:43:56 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d2a76499sm142021466b.0.2025.10.09.21.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 21:43:56 -0700 (PDT)
Message-ID: <abae9f0b-e1c6-4258-9c99-5efc9a8ce736@gmail.com>
Date: Fri, 10 Oct 2025 06:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] Last call for Walnascar patches
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <6822ecae-ec76-4cc2-84d1-b2aa7efe0698@gmail.com>
 <DB5PR02MB102138E2023F0AF2403B2ECAAEFEEA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <DB5PR02MB102138E2023F0AF2403B2ECAAEFEEA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 04:44:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120471


On 10/9/25 23:43, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> On Behalf Of Gyorgy Sarvari via lists.openembedded.org
>> Sent: den 9 oktober 2025 19:09
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] Last call for Walnascar patches
>>
>> Hello,
>>
>> The last merge for Walnascar branch of meta-oe is planned soon - I
>> intend to submit the PR early next week.
>>
>> If there is something you would like to get into it still, please send
>> it by the end of Friday, tomorrow.
>>
>> Thank you.
> Where can we see what you have staged for Walnascar?
>
> //Peter
>
Here:
https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/walnascar-nut


