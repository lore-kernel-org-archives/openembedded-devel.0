Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K6OLe-0000h3-52
	for openembedded-devel@openembedded.org; Wed, 11 Jun 2008 13:18:38 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K6OGG-0006xI-9T
	for openembedded-devel@openembedded.org; Wed, 11 Jun 2008 11:13:04 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 11 Jun 2008 11:13:04 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Jun 2008 11:13:04 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 11 Jun 2008 13:12:50 +0200
Message-ID: <g2obvj$45d$1@ger.gmane.org>
References: <g2h415$pk1$1@ger.gmane.org>
	<484ED558.7070907@bolloretelecom.eu>	<1213135673.5013.60.camel@dax.rpnet.com>	<c384c5ea0806110123k4682543btfd87a864f374741f@mail.gmail.com>
	<1213177678.5010.9.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008060303)
In-Reply-To: <1213177678.5010.9.camel@dax.rpnet.com>
Sender: news <news@ger.gmane.org>
Subject: Re: pkg_postinst_* not working anymore -> broken packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 11 Jun 2008 11:18:38 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Wed, 2008-06-11 at 10:23 +0200, Leon Woestenberg wrote:
>> I would like to re-issue the problem where bitbake gives an ERROR that
>> multiple packages provide something and that bitbake then happily
>> starts building two packages.
>>
>> Even though the user has specified one.
>> In one case this happens even when the user has specified a specific
>> provider but that provider is somehow not fully "providing something
>> but should".
>>
>> After the two packages built, there is no way to get rid of this behaviour.
>
> This last bit is no longer true, bitbake now no longer looks for the
> populate_staging stamps to influence its choice of providers making
> builds more deterministic. To put this another way, bitbake no longer
> cares whether packages have built or not, it no longer influences it.
>
> I guess what you're suggesting is that the "multiple packages provide
> something" error should be fatal. I seem to remember trying this and
> people were not happy. That warning is still experimental and I'd
> probably prefer to leave it as an error for now, perhaps considering
> making it fatal for the release after next?

The problem case Leon and I are seeing:

  Multiple kernel recipes are getting built when doing 'bitbake 
something', which makes builds fail, or worse, succeed and you end up 
with bogus kernels for your machine.

In the past we have worked around it by adding COMPATIBLE_MACHINE to 
each kernel (people should do that, yes, I'm looking at you, 
linux-bd-neon). But now we have linux_<version>.bb that are meant to be 
reused, we are stuck with this 'feature' again.

Maybe we should special case recipes that do 'inherit kernel'?

regards,

Koen



