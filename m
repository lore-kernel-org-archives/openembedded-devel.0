Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web09.4832.1618961037782592503
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Apr 2021 16:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kPFSImvH;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id i81so40676274oif.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Apr 2021 16:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=jePsYdlAerN8cBHPYt9LS9LpwKP71lFavGhXnfZPJ6I=;
        b=kPFSImvH0+V9XRuhmAM/IAA9dOjpw8CGS7+vVtXByNlK5h7ks8mtl7m7Dx+RAGpxCk
         51qTz6yCj6WKp8k8EDyrUw1mf1kfSuYjZ0Y488rH+BBGxuMvy7o5VqWjq0sA13XnxQCM
         MpjuFaXH258gqEAM+47NrWlIX6BirGdtsE6VewvXM0wI7m9vXCsDzXKgSkktbdB/koUE
         huVXjcZljtgRitRDmV1ynwzaMi3wvmaQw9Y9H1H7lSn904yoVG0oyLUWeBkKH2BRtws4
         GQgl610KtUCbG9Mw8/dHTKsEMFUDz3Oe+WeZjhYrnPNoZS2pGea8v38LIZjFubcz1X1I
         A0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=jePsYdlAerN8cBHPYt9LS9LpwKP71lFavGhXnfZPJ6I=;
        b=YmjAPYylLPxBAmq0TbAglHk5OzH4qmvpS8T38TDQPpnnLringE1Cq2j2yA6iiKNpTB
         vU9uov+tpDSiF5tZH7I7XJVtVIAxkFICFwmAC9PBKGfWog/yUGVGG5Tx66sIaQsdwyT7
         jkiS0yWwV21+KIGts/ylobzFEvX5sNyQpILzHELbEdmNaIPt4lUIKtCqgpd58qz07S8d
         cHoJ4NV5ihMQIFsqJ4/p+oWLVsqs5P5WwjxrtqSsSW2hBEJJusx6wPMTq/tQdGjdqph/
         y3CDLdPqMOP05io37PFpHKapTx3zhUCWf96NplgdmPpnZ4A8GKEhDs3T4XuQjn2SBqw6
         vusw==
X-Gm-Message-State: AOAM531Db55DsC42N2e1U6ofz7YmHhFryO1cnmz2RMKYKDtq9x03dISi
	jc7FAEQ68JuMLET1UakS1z9hosnpaefb8Q==
X-Google-Smtp-Source: ABdhPJzrBb0mrZF1nUmTiOG6vQGoNub4nHoV4qSwm7CrcJZ/wPNEclUWd9LZdusGEEEkX3Yu9rq7YA==
X-Received: by 2002:aca:5d82:: with SMTP id r124mr4760933oib.59.1618961036906;
        Tue, 20 Apr 2021 16:23:56 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:eda2:54f2:452e:fbfe? ([2601:202:4180:a5c0:eda2:54f2:452e:fbfe])
        by smtp.gmail.com with ESMTPSA id g96sm129805otg.39.2021.04.20.16.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 16:23:56 -0700 (PDT)
Subject: Re: [oe] [meta-oe][dunfell][PATCH 3/3] libyui: switch to libyui-old repo which still has this SRCREV
To: Martin Jansa <Martin.Jansa@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20210406184327.1585452-1-Martin.Jansa@gmail.com>
 <1673590F38769AC5.4402@lists.openembedded.org>
 <20210420105624.nbhzv633jdso2m34@jama>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <7ffb0762-4e9b-72d8-492b-f158594339c0@gmail.com>
Date: Tue, 20 Apr 2021 16:23:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210420105624.nbhzv633jdso2m34@jama>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/20/21 3:56 AM, Martin Jansa wrote:
> On Tue, Apr 06, 2021 at 08:43:27PM +0200, Martin Jansa via lists.openembedded.org wrote:
>> * 8459235919f592b1bc099ecf9a947cb6344b6fa5 doesn't exist in current repo:
>>   libyui$ git branch -a --contains 8459235919f592b1bc099ecf9a947cb6344b6fa5
>>   error: no such commit 8459235919f592b1bc099ecf9a947cb6344b6fa5
>>
>> * there are no common commits in the new libyui repo, but luckily old
>>   repo is kept as
>>   https://github.com/libyui/libyui-old
>>   similarly libyui-ncurses now contains only README about being obsolete in:
>>   https://github.com/libyui/libyui-ncurses
>>   but at least it wasn't rewritten to have the new content
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb b/meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb
>> index 7c6f4c13d2..f3c112c3b8 100644
>> --- a/meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb
>> +++ b/meta-oe/recipes-graphics/libyui/libyui_3.6.0.bb
>> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.gpl-3;md5=d32239bcb673463ab874e80d47fae504 \
>>                      file://COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
>>                     "
>>  
>> -SRC_URI = "git://github.com/libyui/libyui.git \
>> +SRC_URI = "git://github.com/libyui/libyui-old.git \
>>             file://0001-Fix-build-with-clang.patch \
>>             file://0001-Use-relative-install-paths-for-CMake.patch \
>>             "
> Gentle ping for these 3 (and 3 hostapd fixes currently in
> stable/dunfell-nut).
Noted. Thanks. Ill get to those once my current Gategarth builds finish.

-armin
>
> 
>

