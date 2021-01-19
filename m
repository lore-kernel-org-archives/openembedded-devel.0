Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.16099.1611083130186805250
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jan 2021 11:05:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gnMfcmKZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id z21so13554297pgj.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Jan 2021 11:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=sh/TzcStVSx4HVVFR5L00BoFeKRAYHVX2rddcYO4BpM=;
        b=gnMfcmKZWRGGOo+prHEziDmGi7xESSvkfXaL8sXO0Kbt6eN7xZMM449madUV2srCz8
         +JS27kpKicGOb5YY+vWGQ5vPgVf4pSpG5BQcd5qjw4EkyyELR6sJ/KBso9qbEw1rpYg1
         0rDCIkVLJMqF9KM7yR87Woi77wNgQUUTFB9J9SjcCxRcQ1yEyXh7CZxv+Cn4pMA8HjuK
         jAi5x/u/vWOh8tE/a0f84YX802Funo3iCvBAHPCCcGOSFcKgZmz6jWePuBYuVRIpecNa
         rKv/S1pZhnclS5lPdCtrcjm5LoTMjM0Wmltb59w7573t13VB6haEcZ0HWkJxNlNsmY5J
         S4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sh/TzcStVSx4HVVFR5L00BoFeKRAYHVX2rddcYO4BpM=;
        b=d8B4INI70PrYfAyq1Ms3+07aqaWHY1DfSv3j2NiTo4TxhwzACpdyVUAUnD+Mml+1J2
         GzomuuPIVo15ZASJtsBiJSlQMJInLRPbuEVo3T9uDPayeMatQCWmEwdMs9wf8Nlt+sFe
         h969b6VdQCVvuxJjkT2r7oSy/w1YfM3gyKmHKsnXhAU/JnmaMb0T7s/WTwDn6SzhLEgY
         5764XqA3cqwnzXIWYuHlt2n3M2ExNIkjJrU10CRJ+usKAoYNgSZTxZaTDFHwvPxa+dun
         +abRfanNFxz2Ndw1nhJQeK8gA9BnHLn0qFud0hWzV0L7RjpThX56GzEHLFL4u1TtC6Oz
         ZYuA==
X-Gm-Message-State: AOAM5328aRWNcyq+FgudjEkKg0shnT9xgYGaJoW8pOHW+y6E47vXpGJH
	r5zgHiSkOUfPI1fpEWs+KnqpaofLaM0b7Q==
X-Google-Smtp-Source: ABdhPJzQDbkXFcYNJftCszOf8gDN7X57PaYaREvFXIcg9k90pEhVDyzvKICpt+tRqB34JirwdYNaUA==
X-Received: by 2002:a63:e5e:: with SMTP id 30mr5811691pgo.181.1611083129437;
        Tue, 19 Jan 2021 11:05:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::5a9a? ([2601:646:9200:a0f0::5a9a])
        by smtp.gmail.com with ESMTPSA id 81sm6384741pfa.188.2021.01.19.11.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jan 2021 11:05:28 -0800 (PST)
Subject: Re: [oe] glibc fetcher failure issue in poky dunfell
To: Jyothi-k <jyothik41rao@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <ADdO.1611038508226492907.K9Qv@lists.openembedded.org>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <7bd63c53-df42-1894-4f38-6eedf4f59ee0@gmail.com>
Date: Tue, 19 Jan 2021 11:05:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <ADdO.1611038508226492907.K9Qv@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

it seems you are setting BB_NO_NETWORK which means all your downloads/ 
directory should be already populated. If this is not the case then 
perhaps check if you have to undo setting BB_NO_NETWORK

On 1/18/21 10:41 PM, Jyothi-k wrote:
> Hello all,
> 
> I am using poky (dunfell) for my development and recently during my 
> automated builds am getting the below error in recipe 
> poky/meta/recipes-core/glibc/glibc_2.31.bb. Kindly provide your inputs 
> to resolve the issue.
> 
> ERROR: glibc-2.31+gitAUTOINC+df31c7ca92-r0 do_fetch: Network access 
> disabled through BB_NO_NETWORK (or set indirectly due to use of 
> BB_FETCH_PREMIRRORONLY) but access requested with command LANG=C git -c 
> core.fsyncobjectfiles=0 fetch -f --progress 
> "git://sourceware.org/git/glibc.git" refs/*:refs/* (for url 
> git://sourceware.org/git/glibc.git;branch=release/2.31/master;name=glibc)
> 
> 
> DEBUG: Mirror fetch failure for url 
> http://downloads.yoctoproject.org/mirror/sources/git2_sourceware.org.git.glibc.git.tar.gz 
> (original url: 
> git://sourceware.org/git/glibc.git;branch=release/2.31/master;name=glibc) DEBUG: 
> Fetcher failure: Fetch command export PSEUDO_DISABLED=1; unset 
> _PYTHON_SYSCONFIGDATA_NAME; LANG=C git -c core.fsyncobjectfiles=0 fetch 
> -f --progress "git://sourceware.org/git/glibc.git" refs/*:refs/* failed 
> with exit code 128, output: fatal: unable to connect to sourceware.org: 
> sourceware.org[0: 8.43.85.97]: errno=Connection timed out 
> sourceware.org[1: 2620:52:3:1:0:246e:9693:128c]: errno=Cannot assign 
> requested address
> 
> 
> Note : Same issue occurs for *cross-localedef-native-2.31 recipe*
> 
> Thanks,
> Jyothi
> 
> 
> 
> 
