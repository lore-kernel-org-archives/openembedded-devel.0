Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.3271.1600886973674181142
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 11:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=um773TgU;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id y14so237709pgf.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2020 11:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rJ4DcmCDFgIaxIqz8ARwI7qE/rASxxY9IZX4+7zjqvg=;
        b=um773TgU3Pri50zDT9bHaQ4PvfcKs5R0XspuuCn690Phs0XEW5xR1q1MS2gMxWAJO6
         cYSJM8g1hQoTKqyWT0b1GJSSaEJg5DZZScdSoAiB/bVOIbQ3ItByvgMYHgi0kZzd2h2p
         GasFLNRlTMqh+OO6lTU0hSAZbU93KmtTCkyrMU2lqEBx2wL+H2X1hkEwg9sRrH92RvPj
         9S0HPVStnJRNAfO1aTO3qojT2O9Zv6z1JjP6O9/zsvGGp29YushuExeHENoLL9ubCc8Y
         ENRchVZMdIMQ1tU4Ss/xzZFuXjaFDWO6x4QhUwnG4G+Zo9kWVB4UosxW3yrsJIL/Aos3
         +3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rJ4DcmCDFgIaxIqz8ARwI7qE/rASxxY9IZX4+7zjqvg=;
        b=rsqetui1mcg4dIC+waxdYA8zfoMIaDE8Vg/0M74u/LtHfHIOFeJNjhDfVQZhFBlZdK
         Nt2IdZhVAasSDQypgsdsVfM608qYPvh77pXVosC9plQTA/QU1h3tbkqu1PsFRLqUyxKH
         4JcmxZgu34kOI7vEqHvIC4Nq7W3lXoqytcsclzhGaunc1iGcXiFP1ecXNsrs8H5Ab65t
         4BSwOfcjqT1hTu7glDLQ7eGw+BH385Tz7osVW+bXrS3lOakJX4RqFrQqoDC6I+tTj0JI
         vIhYMtVWU2ij6xZzyQ1Ps1xvggx/lS67rGdptVoRHFnCrqJcCX6A8xDSIwRPYKrS+o4w
         Op6A==
X-Gm-Message-State: AOAM531m5uJa6/KaMcE8howESNUtfHmFCu6o5SjWFWcCTmND6sVAWTSE
	YrLfwUK0z+m+Pv4Mm9s3bYcgC3Xh+Bm9Dg==
X-Google-Smtp-Source: ABdhPJxtCpKdKkD8/c4foHPw1mvKzm3AefzZMc0Qud6MOP1NidP7gX+Iov5ZTCsXjG7rNHhQqprGRw==
X-Received: by 2002:a65:594b:: with SMTP id g11mr945475pgu.382.1600886972338;
        Wed, 23 Sep 2020 11:49:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:6542:959:8931:2e8c? ([2601:646:9200:4e0:6542:959:8931:2e8c])
        by smtp.gmail.com with ESMTPSA id ml20sm244774pjb.20.2020.09.23.11.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2020 11:49:31 -0700 (PDT)
Subject: Re: [oe] dunfell: zbar linking broken
To: Marek Belisko <marek.belisko@gmail.com>,
 OpenEmbedded Development mailing list
 <openembedded-devel@lists.openembedded.org>
References: <CAAfyv36V01GDPqHp614ti5E4UBuVPSz=cUj98HwaThUDAYsh+w@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <02f068f0-b7c5-33d7-4689-e29ba8f26058@gmail.com>
Date: Wed, 23 Sep 2020 11:49:30 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <CAAfyv36V01GDPqHp614ti5E4UBuVPSz=cUj98HwaThUDAYsh+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 9/23/20 1:39 AM, Marek Belisko wrote:
> Hi,
> 
> adding zbar as dependency of some binary fails to link with this error:
> recipe-sysroot/usr/lib/libzbar.so: undefined reference to `dsprintbuf'
> 
> when checked zbar code dsprintbuf is a static method and it's not exported.
> Any ideas?

It seems the function is defined only when DEBUG_EAN is set in compiler 
cmdline, but uses of this function in not appropriately guarded. So a 
fix would be to find the use of this function within the code and guard 
it with DEBUG_EAN as well. As a workaround you can try compiling zbar with

CFLAGS += "-DDEBUG_EAN"

> 
> Thanks,
> 
> marek
> 
> 
> 
> 
> 
