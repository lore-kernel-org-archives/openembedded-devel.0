Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 49EDA74D00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 04:44:06 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id u6-v6so3838399pls.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 21:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8Ek0M4Lrn7wJDYusJHVkGezBuMKFcRFzXyL099nTymY=;
	b=cHEwej1bhCEkF4Bwu1TzASIF3bV3ZavanBkYa76e+6GVBvEwSnditzCYfQnu2RNbdz
	vl0pIGAndPDeMg1VQ1Bh1ZYpqonuI8JGdMowOba9W0bVlwulUkG0sG5ugIro7GQsuFl/
	3rgyjfBurA4Peg4ce0ve69TwJq3kmWQWZAB0fwp3YSBjMjaQnA0JdzuE7K7KCv7PCerj
	NHuhL9bQAVmo60gkFoGYadzoOjoGIr775ms+eem6E4QAvrgOhhmoaPJtwM2dTTYPkg9w
	6Mqh920e0NF5EjY+UNXKvUQquWuR/jQoh33EmEG24TwLQvwj2okDgPj2GmFhMkhfQ9rl
	aqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=8Ek0M4Lrn7wJDYusJHVkGezBuMKFcRFzXyL099nTymY=;
	b=NVRL9og7b0XEpp7iWBGcNeT/1yN7/ScljWZms2DNZcusWP/ILHcaAZDZRdpRGDnZ99
	oMn7BbSFualAqgObGuK3Z+P3L+Z4U55/TTDNYRmEc0WNQR9itAVl8BDkj7IsSjrv4BW3
	2NXaYLVVCERn8yzFjPGEXD73dzbrAbFkN+7DQE8JwWA1MhAW38UhE0wNRrGrhiloEOcl
	G5O7/EYG3nVW6RCQxWJXYRy5fzYrNtLW62M8bOxq2VvLmYoLIq9KXmBEz/QWxIiuPnS6
	ckMYATW+XlCca7FV7zR8cxbFhTy7R/sNXdrow1CZtqgjgRZdR7p9nM/cq9qUOIZc1Kur
	bEpQ==
X-Gm-Message-State: ALKqPwcNASTpiThKH/ZPrFadIYPFkL7bK9mwabKJ+wxnvwU0sM26mV+C
	4ZJtdiCg3qX7+UcLp0wktAvFMmZi
X-Google-Smtp-Source: AB8JxZoQFzaH3f0gFzfND+NbFu6FPirGKcfsNSob4pHJ9nmgfs9K0AgI1/+PAalvin0oUvCB5uHE7Q==
X-Received: by 2002:a17:902:4603:: with SMTP id
	o3-v6mr8206171pld.49.1526618647495; 
	Thu, 17 May 2018 21:44:07 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:14d:1a81:a65f:63a5])
	by smtp.gmail.com with ESMTPSA id
	q68-v6sm11107676pfb.182.2018.05.17.21.44.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 May 2018 21:44:06 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <20180512030758.31409-1-raj.khem@gmail.com>
	<20180512030758.31409-5-raj.khem@gmail.com>
	<8c2ae33c-fbde-11de-6fd7-d220c0b55d57@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <b55b0545-7867-a168-a853-903313da12de@gmail.com>
Date: Thu, 17 May 2018 21:44:06 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <8c2ae33c-fbde-11de-6fd7-d220c0b55d57@igalia.com>
Subject: Re: [meta-oe][PATCH 5/8] luajit: Dont use BUILD_LDFLAGS when compiling host binaries
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
X-List-Received-Date: Fri, 18 May 2018 04:44:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Carlos

Thanks for your review

On 5/17/18 9:38 PM, Carlos Alberto Lopez Perez wrote:
> On 12/05/18 05:07, Khem Raj wrote:
>> BUILD_LDFLAGS add --dynamic-linker to point to uninative but
>> some binaries in luajit are for 32bit build host, so even if
>> your host has the needed runtime, it will fail to execute because
>> uninative ldso doesn't know about multilib
>>
>> we get cyptic errors like
>>
>> | make[1]: execvp: host/minilua: Accessing a corrupted shared library
>> | make[1]: *** [Makefile:610: host/buildvm_arch.h] Error 127
>>
>> Switch to using git for SRC_URI, master is pointing to latest
>> 2.0 stable, it gets us all the patches done since last 2.0.5 relases
>> in 2017
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb | 9 ++++-----
>>   1 file changed, 4 insertions(+), 5 deletions(-)
>>
> 
> I think HOST_LDFLAGS should remain for the native class.
> 
> Otherwise building luajit-native might fail.
> 
> I suggest adding something like this:
> 
> EXTRA_OEMAKE_remove_class-target = "'HOST_LDFLAGS=${BUILD_LDFLAGS}'"
> 

This would be a general case where we have bbclassextend for native
luajit is a special case however, where the needed build time tools
are built along the target build, thats why this fix.  The change you
you proposed might not work in this case.

