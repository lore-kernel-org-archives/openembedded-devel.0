Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M3Peg-0005u7-Ut
	for openembedded-devel@openembedded.org; Mon, 11 May 2009 09:10:52 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M3PYP-0005D1-Dp
	for openembedded-devel@openembedded.org; Mon, 11 May 2009 07:04:01 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 11 May 2009 07:04:01 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 11 May 2009 07:04:01 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 11 May 2009 09:03:46 +0200
Message-ID: <gu8ikj$gvo$1@ger.gmane.org>
References: <20090427141943.GG18788@smtp.west.cox.net>	<20090429161224.GB18788@smtp.west.cox.net>
	<49FCA524.10102@dls.net>	<c384c5ea0905030529n585de20awfcc6bb835a282483@mail.gmail.com>	<20090503165318.GA7973@smtp.west.cox.net>	<20090510194704.GZ7973@smtp.west.cox.net>	<gu7ff8$cmr$1@ger.gmane.org>	<20090510215154.GA7973@smtp.west.cox.net>	<be7a9f3d0905101527i3123f921sc86f01f43d5eacfe@mail.gmail.com>
	<20090510223606.GB7973@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090427 Shredder/3.0b3pre
In-Reply-To: <20090510223606.GB7973@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] Bring PREFERRED_LIBC to all distros
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
X-List-Received-Date: Mon, 11 May 2009 07:11:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11-05-09 00:36, Tom Rini wrote:
> On Sun, May 10, 2009 at 07:27:42PM -0300, Otavio Salvador wrote:
>> Hello Tom,
>>
>> On Sun, May 10, 2009 at 6:51 PM, Tom Rini<trini@embeddedalley.com>  wrote:
>>> Not too wierd looking?  Otherwise, is there somewhere we can do,
>>> roughly, sort -u, on ${OVERRIDES} ?  And not require a new bitbake for
>>> everyone?

How do you decide which one to drop? The one with a lower or higher 
priority? You can see how that gets real ugly real fast.

>> I belive that we shouldn't add hacks into OE recipes to avoid the
>> requirement of new bitbake. If someone is using dev tree we can assume
>> that this person can also use a development version from bitbake
>> stable branch.
>
> I don't mean a hack to glibc*.bb, but rather changing base.bbclass (and
> anything else) to not blow up if OVERRIDES contains duplicates.  I think
> it's possible to add a python function that does it, but it would have
> to be 'slow' since the fast method is to throw everything into a dict
> and then return the list of keys.  So perhaps it's best to just say
> libc-<foo>  for an additional per-libc override.

libc-<foo> is also a lot clearer in the case of newlib :)

regards,

Koen




