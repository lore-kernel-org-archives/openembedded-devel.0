Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OWfbn-0002YF-Dc
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jul 2010 03:09:00 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OWfX4-00076D-Ji from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 18:04:06 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 7 Jul 2010 18:04:06 -0700
Received: from [172.30.80.233] ([172.30.80.233]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 7 Jul 2010 19:04:05 -0600
Message-ID: <4C352401.3080207@mentor.com>
Date: Wed, 07 Jul 2010 18:04:01 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <i108p5$hd$1@dough.gmane.org> <4C33B301.7010006@mentor.com>
	<i119n7$ej7$1@dough.gmane.org>
In-Reply-To: <i119n7$ej7$1@dough.gmane.org>
X-OriginalArrivalTime: 08 Jul 2010 01:04:05.0371 (UTC)
	FILETIME=[761C0CB0:01CB1E39]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: commit 4d6a63850b4dc7ca2f060aedda26ddf4efa0e5cc
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
X-List-Received-Date: Thu, 08 Jul 2010 01:09:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 07-07-10 00:49, Tom Rini wrote:
>> Koen Kooi wrote:
>>
>>> +PREFERRED_VERSION_gcc-cross = "4.1.2"
>>> +PREFERRED_VERSION_gcc-cross-initial = "4.1.2"
>>> +PREFERRED_VERSION_gcc-cross-intermediate = "4.1.2"
>>> +PREFERRED_VERSION_binutils = "2.17.50.0.12"
>>> +PREFERRED_VERSION_binutils-cross = "2.17.50.0.12"
>> [snip]
>>> do NOT belong in a machine.conf (or machine include). Those belong in
>>> the distro (or local.conf), not in the machine.
>> Just putting this out there (and it's indeed _not_ how things are
>> today).  Why would we not want to move towards having this kind of stuff
>> be in the tune-ARCH.inc file, when a specific version is really needed
>> (more avr32 or new'ish core on an existing overall arch) ?
> 
> Putting it in a tune-arch is not a problem, just put it in
> conf/distro/include.
> Experience has shown that putting it the machine includes is a bad idea,
> It rots and after a while a new machine gets added that doesn't use said
> machine include.
> And not to mention the need to change DISTRO_PR for editing a
> machine.conf, that's just backwards.

machine.conf directly is bad, agreed.  So again, thinking out loud a bit 
here, perhaps a good bit of, if not all of the current 
machine/include/tune- files should be under conf/distro/include/ (cpu/ 
?)  How do we optimize (or rather, optimize harder), feed / package 
arches, that too is all distro stuff.

>> Yes, it
>> should be up to the distro to say "we want 4.4.x + 2.20.x" or whatever,
>> but then we also get the downside of "special case, XXXX only works well
>> with 4.3.4 + 2.19.x" or what have you, and those special cases get
>> introduced in one place and copy/pasted elsewhere.
> 
> So you have an include file in conf/distro that people can optionally
> use or copy/paste. Not all distros can/want to support all machines in
> OE. Angstrom tries to, but that's because it's the reference implemention :)

Yes, make it easy for people to get what they want working right.

> It boils down to this:
> 
> The distro needs to make a decision to do strange stuff to support a
> platform. Silently forcing it is bad.

That last part is where I'm unconvinced.  And I'm also not suggesting 
that every CPU architecture lock program versions down.  But it should 
be as easy as possible to add a machine and have it Just Work.  As it 
stands today there's already (and as you allude to, bit rotten at times) 
lock platform X to version Y overrides in Angstrom.

What I'm trying to say, and I'm not picking on Angstrom here, just using 
this as an example, I think it'd be better if ppc405/xilinx-ml403 gcc 
lockdowns lived somewhere more obvious to all because it's either 
universally true or universally bunk, 9 times out of 10.

> In this specific case no distro except angstrom has expressed interest
> in supporting nios2, so we could even but this in an angstrom.inc.
> Seriously, can the distro maintainers that are willing to support nios2
> please raise their hands?

I'm going to look at this from my old hat (as I think there's other 
people on the list, lurking or not that are in that kind of situation). 
  It's quite possible that next week I'll have a contract to work on 
NIOS2 and it'd be real nifty if I could just include the right file and 
things work.

-- 
Tom Rini
Mentor Graphics Corporation


