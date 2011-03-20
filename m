Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q1NEf-0007Tz-Ov
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Mar 2011 19:20:18 +0100
Received: by pzk35 with SMTP id 35so636410pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Mar 2011 11:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=pBuClCPx+yU3cAgUOSsXOBIhUkbsbJxjznIDnZ9Shec=;
	b=FglnniNxjY+VDwSjDWI8JIdk3bGhveXPcxtGiFzNFiVpoI2aNZ9SGk+YA0BEcn95QV
	HekoLX/lfAgv7G0NqSpLFB4vWmNb9cWlekFWcUL9/pbc2e3f4PrkOzgAtquzBM0/l8Ue
	G48NeLDhcEVFRo1WD+zckHrMNjURB5qQSVliQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=JO2BUC6ZhHAO5PNPlY0uwPgtC8m3raAqzUu76v2HliDLZVsWv+ljxamtuzFQOp3LTN
	ojTfScrAGpWWMbEetzSV5jDyPvf7zD+Vi6lmX25fF79D8+SZnHblbWNBbmRmE24yvWbl
	nQWS3PUuZLct+iUddeggcdL/RtQTOxYFH+IDY=
Received: by 10.143.33.18 with SMTP id l18mr2333420wfj.334.1300645109191;
	Sun, 20 Mar 2011 11:18:29 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 25sm6170341wfb.22.2011.03.20.11.18.26
	(version=SSLv3 cipher=OTHER); Sun, 20 Mar 2011 11:18:27 -0700 (PDT)
Message-ID: <4D8644E1.4040808@gmail.com>
Date: Sun, 20 Mar 2011 11:18:09 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20110311081950.GG7353@excalibur.local>	<1300385432.2298.33.camel@saphir>
	<1300396447.30423.2113.camel@rex>	<AANLkTi=9DUeh3eyaW=fQciA_Qk51yvqbBP_792n8fwQD@mail.gmail.com>	<1300443329.9054.53.camel@phil-desktop>	<1300496638.30423.2249.camel@rex>
	<AANLkTi=s9L+Q8k9ds3BiSZj7MC1BOe8=1jWoObi2qu02@mail.gmail.com>
In-Reply-To: <AANLkTi=s9L+Q8k9ds3BiSZj7MC1BOe8=1jWoObi2qu02@mail.gmail.com>
Subject: Re: OE Bugzilla Future
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
X-List-Received-Date: Sun, 20 Mar 2011 18:20:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 3/19/2011 1:28 AM, Frans Meulenbroeks wrote:
> 2011/3/19 Richard Purdie<richard.purdie@linuxfoundation.org>:
>> On Fri, 2011-03-18 at 10:15 +0000, Phil Blundell wrote:
>>> On Fri, 2011-03-18 at 08:57 +0100, Frans Meulenbroeks wrote:
>>>> 2011/3/17 Richard Purdie<richard.purdie@linuxfoundation.org>:
>>>>> On Thu, 2011-03-17 at 19:10 +0100, Michael 'Mickey' Lauer wrote:
>>>>>> I'm in favor of keeping it, cleaning it up, and improve
>>>>>> the integration with patchwork / git. Throwing it away
>>>>>> would be a very bad sign to all those countless people
>>>>>> who've gone through the pains of actually working with
>>>>>> the bugtracker.
>>>>>
>>>>> The simple question is who is actually going to sort out the mess its
>>>>> in?
>>>>>
>>>>> Who is going to look after it on a continuing basis?
>>>>>
>>>>> If there isn't ownership, nothing is going to change.
>>>>
>>>> Actually I feel the real problem is that:
>>>> - people did not want to get bugs assigned to them (at least that was
>>>> what someone told me in the past)
>>>> - we're lacking a good notion of package or recipe ownership, so even
>>>> if we had someone acting as a bug manager, (s)he would have a hard
>>>> time to find out who to assign an issue to.
>>>
>>> Yes, agreed.  A few people have tried in the past to take responsibility
>>> for bugzilla itself (in infrastructure terms) and I would be happy
>>> enough to do that for the future.  But it clearly is not reasonable to
>>> expect the Bugzilla maintainer(s) to be personally responsible for
>>> fixing every bug that gets reported.
>>
>> This is the key question. Who is responsible for fixing bugs?
>>
>> The recipe's original author?
>> The maintainer?
>> The reporter?
>> The bugzilla maintainer?
>> The TSC?
>>
>> The answer in general is whoever has time and an interest in it and none
>> of the above.
>
> Well, I do feel it is one of them, and that is the maintainer of the
> package (who might be the original author).
>
> To me being the maintainer of a recipe says that one cares about a
> recipe and tries to maintain it (as the word says :-) )
> Maintainership comes with responsibilities. If people do not want to
> take these responsibilities then they should not list themselves as
> maintainer.
> I have seen too many incidents where someone does not care about a
> package or bugs submitted to it, but if someone else steps in and
> fixes things, then suddenly the original author or maintainer feels
> they are stepped onto their toes, and react hostile.

Its always good to get reviews from people who have prior experience 
even if it comes in ways you don't like since in the end it makes the 
software better. A little attitude adjustment is however needed sometimes :)

>
> Btw this is the main reason I stopped trying to fix bugs that do not
> affect me (apart from the recipes I maintain).

Thats pretty selfish view of world I must say in a community of 
volunteers :)

-Khem


