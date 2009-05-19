Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M6PYr-0002I6-C2
	for openembedded-devel@openembedded.org; Tue, 19 May 2009 15:40:58 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M6PRi-0001LX-Cm
	for openembedded-devel@openembedded.org; Tue, 19 May 2009 13:33:30 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 19 May 2009 13:33:30 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 19 May 2009 13:33:30 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 19 May 2009 15:33:19 +0200
Message-ID: <guucev$bfe$1@ger.gmane.org>
References: <go498c$bqq$1@ger.gmane.org>	<200902261144.46548.openembedded@haerwu.biz>	<guq6vh$tmi$1@ger.gmane.org>	<ac9c93b10905190519h5cfa8a96h688bbc00271de76d@mail.gmail.com>
	<4A12ADFD.4040500@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090515 Shredder/3.0b3pre
In-Reply-To: <4A12ADFD.4040500@balister.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] renaming packages/ to recipes/
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
X-List-Received-Date: Tue, 19 May 2009 13:41:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19-05-09 15:02, Philip Balister wrote:
> Frans Meulenbroeks wrote:
>> 2009/5/18 Rolf Leggewie <no2spam@nospam.arcornews.de>:
>>> Marcin Juszkiewicz wrote:
>>>> My addition to this:
>>>>
>>>> mkdir recipes-broken
>>>> git add recipes-broken
>>>> git mv recipes/obsolete recipes-broken/obsolete
>>>> git mv recipes/nonworking recipes-broken/nonworking
>>>>
>>>> As this will allow users to set:
>>>>
>>>> BBFILES = "/somewhere/oe/recipes/"
>>>>
>>>> which is supported by BitBake for years.
>>> I'd like to revisit this suggestion from Marcin which came up during the
>>> discussion of the packages->recipes renaming. I think the above makes
>>> sense
>>> and should be committed. I think it would be nice if the folder was
>>> named
>>> broken-recipes instead of recipes-broken. First of all, it sounds nicer
>>> IMHO ;-) but more importantly, this works better with bash-completion.
>>>
>>> Reopening discussion for this change.
>>
>> I think adding recipes-broken (or broken-recipes) is a bad idea.
>> It is quite possible that a recipe is broken only for some platforms
>> (e.g. because they use an older libc or gcc, or because functionality
>> is not working in the machine specific parts.
>> In that case I can image we end up in a recipe being shifted around.
>> Not really a good plan.
>> Unless of course we end up with some good rules on when a recipe
>> should be moved to broken.
>>
>> If I look at tinderbox I see various recipes that do not build for
>> some archtectures or configurations.
> A broken recipes directory sounds like a good idea, but I think it will
> not work well in practive. My concern is the history will be filled with
> people miving recipes in and out of the broken directory (for reasons
> mentioned by Frans)
>
> ow about trying to generate a report from tinderbox that lists broken
> recipes?

Sounds like the coverage matrix I proposed at OEDEM 2006 :)

regards,

Koen



