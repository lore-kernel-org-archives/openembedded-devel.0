Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PWaFb-0003la-EQ
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 20:58:00 +0100
Received: by pxi17 with SMTP id 17so1645508pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Dec 2010 11:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=g+7QennOXoZZYAYikaazHXhkAJnwBlSelbSxIuF6Z4Y=;
	b=kW6OrtdxuunLNqGdt1Pu9JCQsMVhxc2zqc3oNxNqJSE0+Zaj0YQ5vDJDI+8xYXAriZ
	y9bT2isST0t06pk6JyjJGLabdmivuatTyMwpB/ra/zb3rPeWZlLO0+brbSQTYQK/F9rF
	gXL4Pk8QuiKPFfQxsKOU0TvxTtebYdb1h+4kE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=hTskCty++Dfk8SzjqaGyixDzTTZPtw083Q6Rx57IYUvnOAvTTqTLUSqkSOHDbiENvv
	iUbjqnkAi82YL17DwiT1Ar1RjyzWvNGHfSNPUUvQrtJkt2G8EM+tGvkjaSWHVAeD1i+h
	r5/hUChvqGvDuRYGL6RrCH7dPzGtlYlkIDjLk=
Received: by 10.142.232.15 with SMTP id e15mr8555328wfh.341.1293307066048;
	Sat, 25 Dec 2010 11:57:46 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id e14sm14599430wfg.8.2010.12.25.11.57.44
	(version=SSLv3 cipher=RC4-MD5); Sat, 25 Dec 2010 11:57:45 -0800 (PST)
Message-ID: <4D164CB7.8010509@gmail.com>
Date: Sat, 25 Dec 2010 11:57:43 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1293274109-15695-1-git-send-email-khimov@altell.ru>	<1293274109-15695-2-git-send-email-khimov@altell.ru>	<4D162A49.8060009@gmail.com>
	<201012252125.25836.roman@khimov.ru>
In-Reply-To: <201012252125.25836.roman@khimov.ru>
Subject: Re: [PATCH 2/5] perl 5.10.1: fix Time::HiRes cross-compilation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 25 Dec 2010 19:58:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/25/2010 10:25 AM, Roman I Khimov wrote:
> В сообщении от Суббота 25 декабря 2010 20:30:49 автор Khem Raj написал:
>> On 12/25/2010 2:48 AM, Roman I Khimov wrote:
>>> We can't do 'run' check, so let's hope compile check is enough.
>>> Fixes
>>>
>>> Time::HiRes::nanosleep(): unimplemented in this platform
>>>
>>> error.
>>>
>>> Signed-off-by: Roman I Khimov<khimov@altell.ru>
>>
>> is it possible to cache the vars instead? that will be better to keep
>> list of variables that are not runchecked
>
> Well, glancing at code another time, it probably could be solved via
> d_nanosleep in Config.sh. I think it's safe to assume that all of our targets
> implement nanosleep().
>

hmmm, I would be skeptical on the assumption but if you add this to the 
comment that would help someone who would want to use on  a weird 
architecture one day


Acked-by: Khem Raj <raj.khem@gmail.com>

>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



