Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LpQno-0008Tc-57
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 19:34:46 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LpQlR-0007QL-J0
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 17:31:42 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 02 Apr 2009 17:31:41 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 02 Apr 2009 17:31:41 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 02 Apr 2009 19:31:28 +0200
Message-ID: <gr2spg$afn$1@ger.gmane.org>
References: <200903311837.28324.marcin@juszkiewicz.com.pl>	<gqti8d$6qs$1@ger.gmane.org>	<20090331171727.GK14278@smtp.west.cox.net>	<200903312149.25409.marcin@juszkiewicz.com.pl>	<gr258f$lhg$1@ger.gmane.org>
	<49D4DA4D.1090400@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <49D4DA4D.1090400@gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] more streamlined review procedure, was: Re: [STABLE] branch created: stable/2009
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
X-List-Received-Date: Thu, 02 Apr 2009 17:35:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02-04-09 17:31, Marco Cavallini wrote:
> Koen Kooi ha scritto:
>> I've found that there's a huge flaw in this setup:
>>
>> Currently there are 8 people signed up as 'maintainers' for the stable
>> branch, but only 2 (yes, two) have looked at some of the patches posted
>> 2 days ago. Another said he didn't want to look at patches for machines
>> he didn't build for. No idea why the other 4 haven't responded, but if
>> this continues then the stable branch can be closed down immediately.
>>
>> Why? The current procedure requires an ACK from a stable 'maintainer'
>> (not including yourself, of course), but you won't get an ACK or even a
>> NACK.
>>
>> This is annoying since I've had the first bugreports from users that
>> were solved by patches that are 'under review'.
>>
>> The previous stable branch tried to guarantee that you'd get at least a
>> reaction on all your patches within 24 hours, so submitters knew what
>> was happening. A 'reaction', not a 'review', so "will look at it next
>> week" is perfectly well.
>>
>> So my proposal:
>>
>> * within 24 hours of posting at least 1 reaction from any stable
>> 'maintainer'
>> * No review within a week means automatic approval, commit must have
>> "UNREVIEWED" marker to signify that.
>
> Hi
> I'm trying to understand the best way to proceed.
> I think you shouldn't ACK a patch that you can't test.
> Maybe I'm wrong or I'm misunderstanding the goal of a 'stable' branch?

It seems you didn't read http://wiki.openembedded.net/index.php/Stable:

"It is important to note that we will test for building. Testing on 
target devices is left for users which can (and should) report bugs if 
something is not working. More about reporting bugs later in that text."

There's no "can't" when it comes for testing for the stable branch.

regards,

Koen

PS: I do think we should test on a target device whenever possible



