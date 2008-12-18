Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LDKo0-0004j9-UO
	for openembedded-devel@openembedded.org; Thu, 18 Dec 2008 16:28:53 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LDKjW-0007Ck-MV
	for openembedded-devel@openembedded.org; Thu, 18 Dec 2008 15:24:14 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 18 Dec 2008 15:24:14 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 18 Dec 2008 15:24:14 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 18 Dec 2008 16:24:04 +0100
Message-ID: <gidpuk$29d$1@ger.gmane.org>
References: <20081218071901.GB2135@buddha.tw.openmoko.com>
	<20081218150517.GI2135@buddha.tw.openmoko.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081211 Shredder/3.0b2pre
In-Reply-To: <20081218150517.GI2135@buddha.tw.openmoko.com>
Sender: news <news@ger.gmane.org>
Subject: Re: openmoko-merges
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
X-List-Received-Date: Thu, 18 Dec 2008 15:28:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18-12-08 16:05, John Lee wrote:
> Okay, here is what I will do:
>
> 1) commit zero controversial part into oe.dev first.

You don't know if it's controversial or not without it being reviewed. 
So no, don't commit stuff.

> 2) put fastboot related stuffs into another branch for review

Make another branch for the stuff you thing is non-controversial so we 
can review that as well.

> 3) rebase -i the rest to create a clean history, force update the
> openmoko-merges branch, then ask for review again.

Try to keep every branch below approx 30 commits, otherwise it becomes 
to cumbersome to review.

regards,

Koen

>
>
> Regards,
> John
>
>
>
>
> On Thu, Dec 18, 2008 at 03:19:01PM +0800, John Lee wrote:
>> Hi,
>>
>> Please review john_lee/openmoko-merges.  I started from
>> holger/openmoko-merges then rebased it to oe.dev.
>>
>> The general principle is:
>>
>> 1) Minimal impact: most of the big changes apply to om distro only.
>> My thought is we merge this first, then apply to the general.
>>
>> 2) Keep history: I did it the hard way by cherry-picking one by one
>> since the history is different after the mtn->git switch.  Most of the
>> commit messages are kept, but that creates a lot of commits to review.
>>
>> 3) PKG_TAGS, qtopia, toolchain, om-utils and opkg stuffs are left out
>> for later merge.
>>
>> Not sure how long it's going to take.  My plan is to merge it this
>> Monday if it's okay...
>>
>>
>> Regards,
>> John
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




