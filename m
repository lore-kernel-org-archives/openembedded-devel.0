Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LCz4g-0008Hk-R7
	for openembedded-devel@openembedded.org; Wed, 17 Dec 2008 17:16:38 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LCz0I-0003DQ-G1
	for openembedded-devel@openembedded.org; Wed, 17 Dec 2008 16:12:06 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 17 Dec 2008 16:12:06 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 17 Dec 2008 16:12:06 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 17 Dec 2008 17:11:57 +0100
Message-ID: <gib8cd$dkp$1@ger.gmane.org>
References: <gib10j$i28$1@ger.gmane.org>
	<87r6467rj6.fsf@neumann.lab.ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081211 Shredder/3.0b2pre
In-Reply-To: <87r6467rj6.fsf@neumann.lab.ossystems.com.br>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] collapse commits in branches to easy review
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
X-List-Received-Date: Wed, 17 Dec 2008 16:16:39 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17-12-08 16:25, Otavio Salvador wrote:
> Koen Kooi<k.kooi@student.utwente.nl>  writes:
>
>> Big branches CANNOT be merged without proper review, but I don't think
>> anyone wants to review a few hundred commits :/
>>
>> So, what do you think about this?
>
> Big branches are usually wrong. Instead of using diffsplit I'd suggest
> that people provide the patches as patch series, as done in Linux
> kernel, or in topic branches.

That's an implementation detail, I think we are after the same thing :)

The thing that prompted me to write is email is this:

http://cgit.openembedded.net/cgit.cgi?url=openembedded/log/&h=john_lee/openmoko-merges

I tried to review a portion of it, but it is too much and doing a time 
based review ends up in going "hmm, this is wrong" and seeing it is 
fixed a few commits later. But let's not get ahead of things, no-one has 
asked for a review of that branch yet :)

I'd love to see that branch as patch series where we will have a few 
review rounds, but I don't know if John was enough time to do something 
like that, so the diffsplit suggestion was there to save him a bootload 
of time.

> If the user/devel has a server where he/she can host the branches, a
> set of small topic branches are easier to review and merge. Otherwise
> git send-email does the work and could send the patch set to mailing
> list.

I agree on that.

regards,

Koen



