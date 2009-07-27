Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MVOgn-0007N9-7G
	for openembedded-devel@openembedded.org; Mon, 27 Jul 2009 13:48:21 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MVOSa-0005wY-Ci
	for openembedded-devel@openembedded.org; Mon, 27 Jul 2009 11:33:40 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 27 Jul 2009 11:33:40 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 27 Jul 2009 11:33:40 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 27 Jul 2009 13:33:26 +0200
Message-ID: <h4k3a6$1o1$1@ger.gmane.org>
References: <alpine.LFD.2.00.0907250800110.9021@localhost>	<200907251651.19932.holger+oe@freyther.de>	<alpine.LFD.2.00.0907251719260.3720@localhost>
	<200907270743.12287.holger+oe@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090712 Shredder/3.0b3pre
In-Reply-To: <200907270743.12287.holger+oe@freyther.de>
Sender: news <news@ger.gmane.org>
Subject: Re: getting bitbake-1.8.12 for the org.openembedded.dev branch?
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
X-List-Received-Date: Mon, 27 Jul 2009 11:48:21 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27-07-09 07:43, Holger Hans Peter Freyther wrote:
> On Saturday 25 July 2009 23:43:09 Robert P. J. Day wrote:
>> On Sat, 25 Jul 2009, Holger Hans Peter Freyther wrote:
>>> On Saturday 25 July 2009 15:01:20 Robert P. J. Day wrote:
>>>>    for consistency, either bitbake should be included in an OE
>>>> checkout, or it shouldn't.  it shouldn't depend on which branch
>>>> you're working with.  that way lies confusion.
>>>
>>> In which way do you see breakage? bin/bitbake is gone when you
>>> switch from stable to dev? So you executed the host bitbake (which
>>> you said was bitbake 1.8.10). What error happened?
>>
>>    it was temporary breakage since, when i switched to the dev branch,
>> the invocation of bitbake reverted to the fedora-installed package,
>> which was 1.8.10, which was rejected as being too old for the dev
>> branch.  it just took a few seconds to realize what had happened.
>
> Looking at this. First of all the answers were not as friendly as they should
> have been. Second, I think you have a point that there is a inconsistency with
> stable and dev.
>
> Personally I'm not using stable so I have no idea.
>
> Marcin, Koen. Do you switch from dev to stable? How do you do that? Do you
> have two complete build trees for stable/dev?

I use the same bitbake for both in my F11 VM and bitbake 1.8-head for 
.dev on my debian buildmachine, but with seperate TMPDIRs and BBPATH on 
each machine.

regards,

Koen




