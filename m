Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C972F46455
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 11:29:41 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48125.1773660573587177144
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 04:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kt0BVVK3;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso38900955e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 04:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773660572; x=1774265372; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YDl5dG5e8d1vD93eRGjCJONg0X0PDcEaa4YWssVUKE=;
        b=kt0BVVK3FKyXm8rnVejiCWWFfDLe9Fmm0tr/rHVcm//RXyB1XENxudTijyu3rdFjB4
         BlpU31wnGJ1RxcfYlv7B9HffTJ+/7+zcmz8/yWdZMZPceKVbvcaE7GTOmDaXzqdZSLMy
         dLvcOvkkEoYnVQJKBK3+uEbU0O9k+p0acD2MHJXPOV73a4aZ9PsXWKyx3JKkUS3lxSas
         esrCMAsF3RYuPspSM8JnVhFyhy2whFRXqLIZqJUFPDj/SrfMNt9GX+7vbbndY4B88dZB
         F9s51YJlUunOK+zdKfAekxPQssayrWRha9K1VEruzh/LwTmKr/SkjUMi1NzSyMfn5X0U
         TR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773660572; x=1774265372;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1YDl5dG5e8d1vD93eRGjCJONg0X0PDcEaa4YWssVUKE=;
        b=gjs5lBi2ZG1uPTcjUUdK867kD/gDXYJ3146a4lxSBx/6SFXATekjKZEvNApm/kyKdV
         TVtzz5DZnMr54jv9BhkjKjIA8uXN1Jxr6VPIOEamUoFqU9Z5n4EtmXhlIxCJe5sdUoYo
         NGsVPVI9y97+fQPAhWqKkyzF3H55anp03oDmZGVLw6EBIQq2Hd7kmZ1ojB+MC0CtuwDV
         dx8oPN2y0efbTwIkw4GgAjOUw2AHmgn6WxR4BAGzIBoImqfjgtujJMSJB0K+dJUPGrSZ
         bFiANEGFcsTzTiyzCLgQZU4ds7sd5mkyzlWQJLdGWMM/7kXl9mfLb3J62oMRWGt150pZ
         PvcA==
X-Forwarded-Encrypted: i=1; AJvYcCU2Hr+hqZ5PT+q1yVECyM25TLTNF2ou5bUHcbQLwf1i0tud8/T/1V41oOrQEBOhDfT99fFZsWpDJN9OHdD0C7pK0/M=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxkmKR28FdRIjoHZrxHbL+gMabV5YLd4AfEx3bD1lfFwMWbSP+m
	61c9+RD+hltT5rGnA7JBwVDxKnoA64R6VdSHwoWF1b7FSd5IpE2n71njq2NEbA==
X-Gm-Gg: ATEYQzwV+aFYpW/xNTCnWfjyDYWhsK2dN9nhLJO9rE6kZQLgwDSr8PyRQF6TFM8ou62
	j/TYq0KGVkQnGfjLoyptgKxPIonUry5PIW0F0TqH6Or7zgCeZXewnxizK3JP+JuFSlX11WT1/1/
	LI80hzak7tSRjfCe2TEEAGmAV73gQMq17hp58xLp8esfrH4P18DLo5hEkLMeVMtzZ1wtQsENYft
	wbT3XsJKUoLtn/akQR61spGS1INWqalexcT4XAmiR55wiJW8CLvcuChivp0EtWzNLKTRKA2K2E3
	l4qpt05nrQsywCcNLAusESYEFkjAWQcq2T8sMVdfa6SKe+jdWjRD9y1Ioa9gpYUuvKuG3AfNkm6
	RxfuK5VzwmZivubDsYyIzU2buv1CFNi3id7yqX4PlwvxnMdMXFMuJ6PHB4NC8vwBemfL+O2WusB
	dmOkGuYQVnVnvLnaEgI2EfnYsvdCDbsMw=
X-Received: by 2002:a05:600c:8b29:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-485566e314cmr212035095e9.3.1773660571616;
        Mon, 16 Mar 2026 04:29:31 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855725572csm181441595e9.2.2026.03.16.04.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 04:29:31 -0700 (PDT)
Message-ID: <9e353be2-26c5-46c4-8cdf-4ea33d24ac8a@gmail.com>
Date: Mon, 16 Mar 2026 12:29:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] dlt-daemon: upgrade 2.18.10 to 3.0.0
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: changqing.li@windriver.com, openembedded-devel@lists.openembedded.org
References: <20260316083826.1550599-1-changqing.li@windriver.com>
 <20260316083826.1550599-6-changqing.li@windriver.com>
 <64b43660-a810-4ea1-a1b3-3015a0c47e1d@gmail.com>
Content-Language: en-US
In-Reply-To: <64b43660-a810-4ea1-a1b3-3015a0c47e1d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 11:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125271

On 3/16/26 09:57, Gyorgy Sarvari wrote:
> 
> 
> On 3/16/26 09:38, Changqing Li via lists.openembedded.org wrote:
>> Changes:
>> https://github.com/COVESA/dlt-daemon/releases
>>
>> Remove patches already in 3.0.0:
>> 544.patch
>> 567.patch
>> 0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch
>> 0003-allow-build-with-cmake-4.patch
>>
>> Add 3 patches to fix build failures
>> 0001-Fix-compile-failure-related-to-gzlog.patch
>> 0001-Fix-kinds-of-build-failure.patch
>> 0001-Fix-build-failures.patch
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>  .../glib-2.0/glibmm-2.68_2.86.0.bb            |   4 +-
> 
> 
> Is this glibmm change intentional in this patch?
> 
> 
It seems that there are some compilation failures (different errors with
different libc implementations):

musl:
https://gist.github.com/OldManYellsAtCloud/9ec67b1fae3daa99f2a8d20baba3a19a

glibc:
https://gist.github.com/OldManYellsAtCloud/4cd6a4d28156eb486efff83381394913

