Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id D675978711
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 20:15:40 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id e11so1077955pgq.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 12:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=J+mv61vQgUIGM2UecMKwV6XwGXLhY0S22GN/Af+awek=;
	b=iBvXv+3dQW0TmCC6OMsDrsz7/9H2+62HUQasmB6PTVHi8BTAWp6PVuduZXmzzW2sCw
	FsO0u8CtxMO9P78HGWvH2l72+Bvz19SfE2N2CJSeg3img9EDedu9VZt4HYKXRCuBxPVo
	BYnl7ELlnEVEb/uZz32tWn3ti5DrvY9gPCFpsU7vzAOpwr60cjkKpyrrEVfBPe/dhPBD
	utnrNhbtZEvEN3mxpqj0dTmHrSyMhuLRZL9oyd7clvL2Ovf9PjialnZdlwaQ+ZJWksn9
	XTjq6Roa12BRWTzfgIu3GHF5k8+Ml71PX8c2Cu0+/NQtuUTQlILNj3WtDohYNygwchYW
	COrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=J+mv61vQgUIGM2UecMKwV6XwGXLhY0S22GN/Af+awek=;
	b=dPWAvFXj7/6Wt6NevQf5KjGUdgOuiBQ9SPP+MWUyxZ0ZCTjH084tSfXaW6Fd/CkiH9
	1U8FcPKNZHWMldgF+ENc+E5RYxhTh8ti6YdBXhliXI/YDCA3TW8328xsQ+dqEBY+oiud
	jt0YJstuuiDyn94V3Y3yozapg3txpDMa+15zyHq+TEgwKS7dA20IjCe4bxSR+eza4epa
	Yu7cjP3Ledd98xMDuC9c3RhkQemWz/EbuNcHMne4NmXKEbjfGVeZIixf2h/YysXakqB8
	clGl1IS+mKrDfwrftac4+SxDWCO5aPFP7NANuAfZH9+siNzf+tMd+7mow+mYaszfl3NI
	PZNw==
X-Gm-Message-State: APf1xPCUb6JSxxSjvNP+PmkszT1LTlYixl+DV9fdWp7MbrUsu2/ykzvr
	tvDwj9niJLQGpPjywaFH7XHydMuf
X-Google-Smtp-Source: AH8x224sAs9a8xp0FhDOhRg2WsgRu6Jfv0gTG/fBV3x5p87xUp6T3HbW5eUJxOVNexPXYT1InQny+A==
X-Received: by 10.98.220.207 with SMTP id c76mr4368660pfl.159.1519244141545;
	Wed, 21 Feb 2018 12:15:41 -0800 (PST)
Received: from ?IPv6:2601:646:8880:466c:80a4:aaf5:28b3:6b2e?
	([2601:646:8880:466c:80a4:aaf5:28b3:6b2e])
	by smtp.gmail.com with ESMTPSA id
	q14sm32218769pgq.2.2018.02.21.12.15.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Feb 2018 12:15:40 -0800 (PST)
To: Denys Dmytriyenko <denis@denix.org>
References: <20180215043848.14310-1-raj.khem@gmail.com>
	<20180215234152.GQ2786@denix.org>
	<CAMKF1sp7e7mQRWQPNHYPDHm-QZXtKuNFv_YrwLiD57+Q=JhQOg@mail.gmail.com>
	<20180216220142.GS2786@denix.org>
	<CAMKF1spkGJpYTAmQ9gh+af51ya3qkZja8XMmVP5u=Q-ycc5qbw@mail.gmail.com>
	<20180216230846.GT2786@denix.org>
	<CAMKF1spcrZQ34imyqaXtcHRmphyU1Kfo5nNdo6qaaeOVSx51eg@mail.gmail.com>
	<CAMKF1soMJDnGmK08J+TVEw4dcVZqXfxqM=aAbO6ufg1DS8sjQg@mail.gmail.com>
	<20180221195541.GD2786@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <865fae21-e524-63d2-33e5-fc433a14b6ae@gmail.com>
Date: Wed, 21 Feb 2018 12:15:39 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <20180221195541.GD2786@denix.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtbase: Replace -isystem with -I
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Feb 2018 20:15:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/21/18 11:55 AM, Denys Dmytriyenko wrote:
> On Tue, Feb 20, 2018 at 10:20:03PM -0800, Khem Raj wrote:
>> i can still see it with 5.10.1
>>
>>                  from
>> /mnt/a/zonit/oe-build/build/tmp/work/aarch64-bec-linux/qtbase/5.10.1+gitAUTOINC+6c6ace9d23-r0/git/src/gui/kernel/qgenericpluginfactory.cpp:40:
>> /mnt/a/zonit/oe-build/build/tmp/work/aarch64-bec-linux/qtbase/5.10.1+gitAUTOINC+6c6ace9d23-r0/recipe-sysroot/usr/include/c++/7.3.0/cstdlib:75:15:
>> fatal error: stdlib.h: No such file or directory
>>  #include_next <stdlib.h>
>>                ^~~~~~~~~~
>> compilation terminated.
>> make[2]: *** [Makefile:11592: .obj/qgenericpluginfactory.o] Error 1
>> make[2]: Leaving directory
>> '/mnt/a/zonit/oe-build/build/tmp/work/aarch64-bec-linux/qtbase/5.10.1+gitAUTOINC+6c6ace9d23-r0/build/src/gui'
>>
>> On Fri, Feb 16, 2018 at 6:35 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Fri, Feb 16, 2018 at 3:08 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>>>> On Fri, Feb 16, 2018 at 10:59:39PM +0000, Khem Raj wrote:
>>>>> I am using arch Linux for host distro and security flags enabled May be
>>>>> that is something
>>>>
>>>> Could be... I'm on Ubuntu 16.04.
>>>
>>> maybe you can try to enable security flags and see if you see it
> 
> Do you have any specifics regarding enabling security flags?
> 

add

require conf/distro/include/security_flags.inc

in local.conf

