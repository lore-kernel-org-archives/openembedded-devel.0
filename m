Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web10.22847.1589724472462580311
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2020 07:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=first header.b=dP30UQRu;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from [192.168.100.99] (xb90f4a16.cust.hiper.dk [185.15.74.22])
	by first.geanix.com (Postfix) with ESMTPSA id 9870F20224AA;
	Sun, 17 May 2020 14:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1589724468; bh=CPBlznOlqoQrdFRDwpgfksLZAFR+o6OpCSSryT/9KKo=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=dP30UQRupG/qcoxj3znsboir0wuXZRo4QBLmrkWYm7jO8Ad507lkzi+lsOza7WFbG
	 JcG2UwvA0cS3ZO8kGGdSmXiRGl121dITp0uNv028eS6hzDowZ7rVRO/DeHwUNS1QdE
	 NddGkzuosWfep6jNyrlma4pltLOHU2wzpIUyH70VbPfk5uJcToP8uOti2m6I4Zz/CG
	 8C1V92JuEm9jG81hHHgZ0fNGg93+bPpnZoWw/5oGpAD1DE63r+/+lRO2Ax8u/kNlOW
	 tiQ0YtT25yrNpZgzprP5NzjSuKlEWcAtZgOdE2Wk83AeMVLReY6eEXjn8ILP5CXCj8
	 cHD1lqKfPCDfw==
Subject: Re: [oe] [meta-oe] [PATCH] gpsd: fix build on aarch64
To: Adrian Bunk <bunk@stusta.de>, Martin Jansa <Martin.Jansa@gmail.com>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 openembedded-devel <openembedded-devel@lists.openembedded.org>,
 Alistair Francis <alistair23@gmail.com>
References: <20200515121436.2078760-1-sean@geanix.com>
 <CAP71Wjw91K67Z2fV9AyySsapyjmg20WE4c3JY84kr5+i0=u-Og@mail.gmail.com>
 <CA+chaQeKWuojLcT8Hq+CwycKS9Apgf2kwwmTP+6R4Zwb9OqY1Q@mail.gmail.com>
 <20200515154645.GA20323@localhost>
From: "Sean Nyekjaer" <sean@geanix.com>
Message-ID: <6bc2b312-1319-f1ca-8415-67f17a003539@geanix.com>
Date: Sun, 17 May 2020 16:07:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200515154645.GA20323@localhost>
X-Spam-Status: No, score=-3.1 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on fdf6823a942a
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit



On 15/05/2020 17.46, Adrian Bunk wrote:
> On Fri, May 15, 2020 at 05:07:37PM +0200, Martin Jansa wrote:
>> I was seeing this issue also on arm (raspberrypi4), so it's not specific to
>> aarch64 as subject says.
>>
>> With this fix I'm still seeing build failure:
>> | ppsthread.c:1281: error: undefined reference to 'pthread_create'
>>
>> going back to 3.19 fixes both issues (so it's not caused by my setup).
>> ...
> 
> The root cause of all these problems is likely:
> 
> ...
> DEBUG: Executing shell function do_compile
> scons: Reading SConscript files ...
> This system is: linux
> Checking whether the C compiler works... no
> ERROR: CC doesn't work
> Checking if compiler accepts -pthread... no
> ...

I have tested both with a aarch64 and cortexa7t2hf build.
Both of them show:

Checking whether the C compiler works... yes


/Sean
