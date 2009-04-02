Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LpKX5-0004zg-Ul
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 12:53:07 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LpKUl-0006rI-TS
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 10:50:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 02 Apr 2009 10:50:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 02 Apr 2009 10:50:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 02 Apr 2009 12:49:51 +0200
Message-ID: <gr258f$lhg$1@ger.gmane.org>
References: <200903311837.28324.marcin@juszkiewicz.com.pl>	<gqti8d$6qs$1@ger.gmane.org>	<20090331171727.GK14278@smtp.west.cox.net>
	<200903312149.25409.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <200903312149.25409.marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] more streamlined review procedure, was: Re: [STABLE] branch created: stable/2009
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
X-List-Received-Date: Thu, 02 Apr 2009 10:53:22 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 31-03-09 21:49, Marcin Juszkiewicz wrote:
> Dnia wtorek, 31 marca 2009 o 19:17:27 Tom Rini napisał(a):
>>> Great!
>>>
>>> I already have a few patches queued up for the stablebranch:
>>>
>>> http://dominion.thruhere.net/koen/OE/for-stable/
>>>
>>> What's the proper procedure for getting those in?
>>
>> And please answer in the form of a link to a wiki page :)
>
> http://wiki.openembedded.net/index.php/Stable contains first
> informations.

I've found that there's a huge flaw in this setup:

Currently there are 8 people signed up as 'maintainers' for the stable 
branch, but only 2 (yes, two) have looked at some of the patches posted 
2 days ago. Another said he didn't want to look at patches for machines 
he didn't build for. No idea why the other 4 haven't responded, but if 
this continues then the stable branch can be closed down immediately.

Why? The current procedure requires an ACK from a stable 'maintainer' 
(not including yourself, of course), but you won't get an ACK or even a 
NACK.

This is annoying since I've had the first bugreports from users that 
were solved by patches that are 'under review'.

The previous stable branch tried to guarantee that you'd get at least a 
reaction on all your patches within 24 hours, so submitters knew what 
was happening. A 'reaction', not a 'review', so "will look at it next 
week" is perfectly well.

So my proposal:

* within 24 hours of posting at least 1 reaction from any stable 
'maintainer'
* No review within a week means automatic approval, commit must have 
"UNREVIEWED" marker to signify that.

Also:

I still have unreviewed patches in my for-stable bundle: 
http://patchwork.openembedded.org/bundle/koen/koen-for-stable-20090331/


regards,

Koen



