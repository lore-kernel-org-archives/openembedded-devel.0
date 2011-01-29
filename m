Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PjCB6-0007s2-8M
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 15:53:28 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PjCAH-0003jg-1B from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 06:52:37 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sat, 29 Jan 2011 06:52:36 -0800
Received: from [172.30.80.64] ([172.30.80.64]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 29 Jan 2011 07:52:35 -0700
Message-ID: <4D4429AC.3010705@mentor.com>
Date: Sat, 29 Jan 2011 07:52:28 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>	<20110129112942.GB3265@jama>
	<AANLkTikgSv7C9zwrWDbVU7eVYOyWvcnxwKYQXypK08oj@mail.gmail.com>
In-Reply-To: <AANLkTikgSv7C9zwrWDbVU7eVYOyWvcnxwKYQXypK08oj@mail.gmail.com>
X-OriginalArrivalTime: 29 Jan 2011 14:52:35.0997 (UTC)
	FILETIME=[2AA25CD0:01CBBFC4]
Subject: Re: [PATCH 0/5] Relocatable perl-native and use it always
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
X-List-Received-Date: Sat, 29 Jan 2011 14:53:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/29/2011 04:59 AM, Frans Meulenbroeks wrote:
> 2011/1/29 Martin Jansa<martin.jansa@gmail.com>:
>> On Fri, Jan 28, 2011 at 11:52:28AM -0700, Tom Rini wrote:
>>> Hey all,
>>>
>>> As I've talked about before[1] there's build reproducibility issues
>>> depending on when perl-native is built.  After talking with Mark Hatle
>>> a little bit I started thinking about relocation in perl again and it
>>> turns out that starting in 5.10, upstream perl supports relocation.
>>>
>>> This in turn makes it less painful to make perl-native be what we use
>>> when we want perl runtime, nearly everywhere (since you can use pstaging
>>> to avoid it the time next time).
>>>
>>> This patch set drops perl 5.8.8 and bumps all of the perl stuffs PR,
>>> switches to relocatable perl-native, and then the big switch to using it
>>> early.
>>
>> Looks good and as we're using 5.10 already then for whole series:
>>
>> Acked-by: Martin Jansa<Martin.Jansa@gmail.com>
>>
>> Can we also get rid of legacy staging from recipes/perl/perl_5.10.1.bb ?
>
> Would be nice.
> Then again we could also decide to keep 5.10.1 as is, and try to move
> forward to 5.12.
> poky already has that recipe.

I've also posted a similar patch to poky for userelocatableinc, but not 
the rest of the series (yet).

-- 
Tom Rini
Mentor Graphics Corporation


