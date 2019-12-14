Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id 63D597F8B5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2019 05:40:13 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id g4so620969pjs.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2019 21:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Dv2LzSKi8rXl69zvi4BfyrfQJhL//3hVxRkxJHroqE4=;
	b=YVWM27TsDkbZjJMB5DtFt1kY9f7QLQTQUUNqIoCOrFadtPlQuVimKi7oJFW96GnMgz
	6W032vZ02tXpvG/bn5+g0sGdd3YS8p/WLuD7HDwDTP4J55B/+95XAYmY8x380vW9hK6g
	hdf6SbfzUC11EAEZ/SVZRO4q+F688m6HqRtMh4JpVL3VBtIk2xtGgbDOIqJefdDsRT9F
	GDbtWA0EBnI9gBG1ctCMc89KtUUHInWihML8W/dOIyFxkkqHi1ImLF6RqmUXLrOvEaoJ
	FaiKx6somgmNxCTM1uheH62oWmTB+Bms8rIuFP2wpbJqdUCwYgcy/gL2qgyW9V+w3fFH
	uJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Dv2LzSKi8rXl69zvi4BfyrfQJhL//3hVxRkxJHroqE4=;
	b=nAj9szS5g+TMPSooLxgk6GBZuRHpAH3Dt5WxDM537MK8Esky4MDNJR2SrfRAHFX9/G
	zK8+LlC5UZylkLZTm7yxQEPFLL6B/opMsgf27khwtYUw26CztgxYxZmvqhvHtFTp8y10
	r8SKo7IL2RuVasDA/KOj7zBxS4/4qm7cMcD3vjFdegsQEdWF9BsgxXp4wCBorDqLb008
	9R01VRoOWzLYIfp/ZvqIq0dkSshYzu8hDjm0iBiO8mm2eZSrsPmK53HzFdA5zVHCgtvJ
	k+k7z1tZYS1gnYr8oECwBV/uASrY71n0gqyZpqeXNA/vlOsD4+kFUcrGgU9nQsgTX2wp
	f4hQ==
X-Gm-Message-State: APjAAAWYMNj5NqjIrehWD5nLYIAQ0dy5qa6OwyGKK0zCHf0Yp1GgrfdO
	jogs9NqWfI6I+/aEfaAn9Z9L4xsvXLU=
X-Google-Smtp-Source: APXvYqwXufbTrxJq5U/xb4JPquv/I7wapuUdj9MUxqMdANAaWbZr6EeLCJsIYpiEK+aHgwHZUheSlQ==
X-Received: by 2002:a17:90a:2409:: with SMTP id
	h9mr3801167pje.110.1576302013986; 
	Fri, 13 Dec 2019 21:40:13 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:15c5:f71b:d732:763f?
	([2601:646:9200:4e0:15c5:f71b:d732:763f])
	by smtp.gmail.com with ESMTPSA id
	g17sm14144942pfb.180.2019.12.13.21.40.12
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 13 Dec 2019 21:40:13 -0800 (PST)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	Changqing Li <changqing.li@windriver.com>
References: <1576226743-346140-1-git-send-email-changqing.li@windriver.com>
	<CALbNGRTaVVnL6qPcnSqV6w+_o-ad3=GT3D=cWOLGGDUsuYJ0Rw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <8789eb25-d588-8333-c510-09df13f9067b@gmail.com>
Date: Fri, 13 Dec 2019 21:40:11 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRTaVVnL6qPcnSqV6w+_o-ad3=GT3D=cWOLGGDUsuYJ0Rw@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] gtk-xfce-engine: remove this recipe
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
X-List-Received-Date: Sat, 14 Dec 2019 05:40:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/13/19 1:27 AM, Andreas Müller wrote:
> On Fri, Dec 13, 2019 at 9:45 AM <changqing.li@windriver.com> wrote:
>>
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> * Part of xfce 4.14 changelog
>>    Theme Engine (gtk-xfce-engine)
>>        The gtk-xfce-engine has been deprecated and archived.
>>
>> * repo have been remove from upstream
>>    https://archive.xfce.org/src/xfce/
>>    no gtk-xfce-engine now
>>
>> so remove this recipe
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> Think this is a good thing and wanted to test it. Unfortunately it did
> not make it into patchwork - similar as Kai's patches sent recently.
> Who can look into patchwork?
> 

I have staged it into master-next as well. In case you want to try

> 
> Andreas
> 


