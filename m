Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4B83B74793
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jun 2018 16:28:29 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id p21-v6so5705625pgd.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jun 2018 09:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ylHxBjldWMASmVafYbSpZCHiwL6DkZd828hISCMrMWU=;
	b=Vfg3gAwKHe8xMrxRUVKQ2cSrPNgXkTL/CNSnQojQ8aS2f9Pahb9n+6C1uE5dKHiQR8
	y7wN8A7yVvTTVj2qYNAioM3XF4+nNlszpNVk4xavPfbKH6QP9QGDmaa6rocbAZs1POLo
	D69I/Z8g+THKQMdxrq9vg7gdi2JV4j94NaUzO6WhvF2Y1I/vp1Nfh0qyUi9EinZ5ImpM
	XyXhBX0aVySN9Pph5+P2Nt34fTy9myM9MQq8jJYCbi0Kp1LUv1ujwkacs+3iVNN6oQli
	Bjlcb2Z5qWcijKwdKPEas++IBcsijsZQ7qhzjkci9cW/WKmHtSlvo6bLmYw/3SVTDCXo
	bwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ylHxBjldWMASmVafYbSpZCHiwL6DkZd828hISCMrMWU=;
	b=CRAkryOBG9IKxj0z0qT9Thd6c5QjNoSaxOjLA3knGc4tEw0LDkHEYIwYX44bTcGUNJ
	KRyOVpowABL6w+JTyp47GbsOQLpk8B+Q16uyD4pyMzlX9GnezKEmaXGeiTxclG8oG+7E
	RAl0YKpu4NiPgOMDKaoljSd9d0uSl0uleamCAjfzTlbVs8OmTmmBd5b/BcIYb0e+XVDq
	c3xY/3dwXFLdUkLfu2KkuK1sabV6EzbK8XfW055No1gk1ZcJNTH/yzAu6+K8iB9bOBpv
	izqNBnxh4oDKBJwMncG+ZeUl3/q+QFmGbicoVzI5c1PMQ9EgDZPcyP1xtqaCqgf6hYmU
	ihUQ==
X-Gm-Message-State: APt69E2C2Xp4YA8xIxcKpBps8BGlm6YnFxSeSf4DS04RYg2AEUeaovQn
	+n6SBS04xYvi6WFHU8jtClm5+VbT
X-Google-Smtp-Source: ADUXVKKM2808SCgZ89g5Qc0N1ZJRSiiGIXsJvxssPjoylms9rdi3tpUavRaf0sB7dnuDoAWKCOUSDg==
X-Received: by 2002:a63:7983:: with SMTP id
	u125-v6mr5603424pgc.267.1529166509913; 
	Sat, 16 Jun 2018 09:28:29 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:9414:1129:bb93:e38c])
	by smtp.gmail.com with ESMTPSA id
	k13-v6sm14497558pfg.130.2018.06.16.09.28.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Jun 2018 09:28:29 -0700 (PDT)
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
References: <1529119696-3508-1-git-send-email-jpuhlman@mvista.com>
	<CAMKF1spRUMqmBR6V8Yh2v0TM9u6tgWU=jshE_pW-jEDYnY=Uyg@mail.gmail.com>
	<cbf28da3-78f7-2b04-6603-aeb09c753a1d@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <6a038e2f-95d7-a89b-c09a-9632062dfded@gmail.com>
Date: Sat, 16 Jun 2018 09:27:42 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <cbf28da3-78f7-2b04-6603-aeb09c753a1d@mvista.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] stunnel: Use nogroup rather then nobody for group
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
X-List-Received-Date: Sat, 16 Jun 2018 16:28:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/15/18 9:31 PM, Jeremy A. Puhlman wrote:
> 
> 
> On 6/15/2018 9:22 PM, Khem Raj wrote:
>> Hi Jeremy
>>
>> On Fri, Jun 15, 2018 at 8:31 PM Jeremy Puhlman <jpuhlman@mvista.com> 
>> wrote:
>>> [log_check] warning: group nobody does not exist - using root
>>>
>> I do not see this warning in my builds. Could you share steps to 
>> reproduce it ?
> 
> I added meta-networking to my on top of poky(with meta-python and 
> meta-oe) and added
> IMAGE_INSTALL_append = " stunnel "
> bitbake core-image-minimal
> 
> I had been getting it in our production builds, but I literally 
> reproduced it this morning with the current master cloned today. If you 
> inspect the configure file and search for the variable you should be 
> able to see the check. On non-cross compiled systems it checks 
> /ect/group for nogroup and uses it if exists. However since we are cross 
> compiling it defaults to group nobody, which is not provided in our system.
> 

Thanks, I was looking at world builds, but for this warning to show up 
stunnel has to be added to an image and then image be built.

