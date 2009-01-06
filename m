Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LKGFK-0003p5-Qf
	for openembedded-devel@openembedded.org; Tue, 06 Jan 2009 19:01:43 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LKG9U-0001GU-OQ
	for openembedded-devel@openembedded.org; Tue, 06 Jan 2009 17:55:40 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 06 Jan 2009 17:55:40 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 06 Jan 2009 17:55:40 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 06 Jan 2009 18:55:29 +0100
Message-ID: <gk05ui$6vr$1@ger.gmane.org>
References: <87r63gseu6.fsf@neumann.lab.ossystems.com.br>	<gjvu32$7dh$1@ger.gmane.org>
	<1231260477.5330.21.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081230 Shredder/3.0b2pre
In-Reply-To: <1231260477.5330.21.camel@dax.rpnet.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] bitbake git fetcher fix
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
X-List-Received-Date: Tue, 06 Jan 2009 18:01:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06-01-09 17:47, Richard Purdie wrote:
> On Tue, 2009-01-06 at 16:41 +0100, Koen Kooi wrote:
>> On 06-01-09 15:12, Otavio Salvador wrote:
>>> Hello,
>>>
>>> I've found a issue when using current GIT fetcher and bellow patch
>>> fixes it for me; could someone take a look at it and commit if it does
>>> look fine?
>>> +        elif tag and tag != "1":
>> That looks to be a hack for lazy people that don't specify a SRCREV nor
>> set AUTOREV. Such a fetch failure is intended behaviour.
>
> How about we adopt Poky's slightly more verbose approach of SRCREV ?=
> "INVALID" in bitbake.conf?
>
> We check for "INVALID" in bitbake and error if we see it.

I like how it's more "in your face" about it :)

regards,

Koen



