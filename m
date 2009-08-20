Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Me3Ny-0001Uj-K3 for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 10:52:44 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1Me37F-0000hP-VV
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 10:35:25 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 10:35:25 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 10:35:25 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 20 Aug 2009 10:34:58 +0200
Message-ID: <h6j1rj$nvf$1@ger.gmane.org>
References: <20090820032802.GA32010@denix.org>	<200908200752.58210.holger+oe@freyther.de>
	<20090820071052.GA459@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <20090820071052.GA459@denix.org>
Sender: news <news@ger.gmane.org>
Subject: Re: Use AUTOREV and have revision/commit number in package name?
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
X-List-Received-Date: Thu, 20 Aug 2009 08:52:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20-08-09 09:10, Denys Dmytriyenko wrote:
> On Thu, Aug 20, 2009 at 07:52:58AM +0200, Holger Hans Peter Freyther wrote:
>> On Thursday 20 August 2009 05:28:02 Denys Dmytriyenko wrote:
>>> All,
>>>
>>> I've been playing with AUTOREV for some time now and also asked this
>>> question before on the IRC, but so far there seems to be no easy solution
>>> to the problem in subject.
>>>
>>> Usually, when a package is built from an SCM repository, SRCREV is set to a
>>> specific commit#/tag etc. And SRCREV is also usually referenced from PV
>>> (like PV = "X.Y.Z-scmr${SRCREV}") to have the revision/commit number in the
>>> package name, to easily track different builds.
>>>
>>> Now, when SRCREV = "${AUTOREV}", AUTOREV gets resolved into a Python
>>> function, which does the magic of fetching the latest snapshot from a
>>> repository. But now if PV contains references to SRCREV, it breaks
>>> (undesrandably), since SRCREV gets resolved in do_fetch and PV needs to be
>>> resolved early on.
>>>
>>> Are there any standard ways to work around this limitation?
>>
>> Check the mailinglist archives... Openmoko has deployed a solution that has
>> fixed that about 1 1/2 years ago.
>>
>> Short answer:
>> 	- Do not put SRCREV into PV, e.g. create a new var called SRCPV
>> 	- Populate SRCPV with something based on the SRCREV..
>
> Ah, thanks! I was able to find your RFC message from last year on the Openmoko
> mailing list:
> http://markmail.org/message/v3s32gmxxqcaxpph
>
> I'll give it a try. Thanks.
>
> To be clear - it's not used in OE. While there is a single python-phoneutils
> recipe, which references SRCPV, it is not being set anywhere, apparently...

Take a look at 
http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=xora/angstrom-srcpv 
:)

regards,

Koen




