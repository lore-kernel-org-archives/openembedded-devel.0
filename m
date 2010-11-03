Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PDeot-0006cQ-6i
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 16:00:12 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1PDeo2-0002f0-G3 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 07:59:18 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 3 Nov 2010 07:59:18 -0700
Received: from [172.30.80.221] ([172.30.80.221]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 3 Nov 2010 08:59:17 -0600
Message-ID: <4CD178C2.9010303@mentor.com>
Date: Wed, 03 Nov 2010 07:59:14 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <i9p1d0$7q4$1@dough.gmane.org>	<AANLkTimRY+gDbK9jZvUEuxMAu3PvQ8pnfb3oXjAXeU0B@mail.gmail.com>	<iaptb1$bpb$1@dough.gmane.org>
	<4CD07F3E.7040703@eukrea.com>	<4CD080E2.2000706@mentor.com>
	<AANLkTi=3GwhFb27DDyHnOcQEk1oskP1NSEUw_qaZdNyr@mail.gmail.com>
In-Reply-To: <AANLkTi=3GwhFb27DDyHnOcQEk1oskP1NSEUw_qaZdNyr@mail.gmail.com>
X-OriginalArrivalTime: 03 Nov 2010 14:59:17.0692 (UTC)
	FILETIME=[B01FE7C0:01CB7B67]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] turning conf/machine into a set of bblayers
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
X-List-Received-Date: Wed, 03 Nov 2010 15:00:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Frans Meulenbroeks wrote:
> 2010/11/2 Tom Rini <tom_rini@mentor.com>:
>> Eric Bénard wrote:
>>> Hi,
>>>
>>> Le 02/11/2010 21:46, Koen Kooi a écrit :
>>>> I do fear that pulling things into seperate layers too much will make it
>>>> harder to propagate fixes...
>>>>
>>> yes, in your example, the fines in conf/machine/include are common to all
>>> omap boards (and even all cortexa8 for tune-cortexa8.inc) and thus when
>>> fixing one BSP you have to think to fix the others (and to communicate the
>>> fix to other BSP maintainers).
>>> The same apply for most of the .inc in recipes-bsp/*/.
>>>
>>> Do you think the following setup is possible ?
>>>
>>> - ARM overlay (containing all generic files for ARM achitecture :
>>> conf/machines/include for example)
>>>
>>> - OMAP3 overlay (containing all generic files for OMAP3 SOC :
>>> conf/machines/include/omap* + recipes/linux u-boot x-load base files for
>>> omap3 architecture,
>>>
>>> - specific board overlay (conf/machine/themachine.conf + board specific
>>> additions in recipes/linux u-boot & x-load (with patches based on top of the
>>> OMAP3 overlay).
>> How about:
>>
>> - allow some form of conf/machine/include to continue to exist in the main
>> layer
>>
>> ? There would have to be some judgment calls, but I don't think that should
>> be too hard, over when it's SOC_FAMILY or when it's very generic.  Basically
>> the ARM overlay wouldn't be created in this case (nor the PPC nor MIPS nor
>> ...).  But we must avoid duplicating tune-coretexa8.inc and similar.
>>
> 
> I'd say it is definitely nice to have a arch specific overlay (e.g.
> ARM, MIPS, PPC, Nios2) which contains the specific recipes for that
> architecture.
> To give an example:
> For nios2 the only backend is for gcc 4.1.2 and binutils
> 17.50.something. I can imagine that at some point in time it is
> decided not to support these in the mainline/standard/common/base
> system. In such a case I think the arch specific overlay would be a
> good place.

I would argue that so long as someone is maintaining nios2 that means we 
can't drop gcc 4.1.2 until there's another stable version for it.  And 
having that in the nios2 overlay means that it might well start to miss 
generic fixes, if we aren't careful.

Don't get me wrong, I'm quite in favor of breaking things up, and 
putting on my Mentor hat, we have machine specific overlays and like it.

> Whether there should be an omap3 specific overlay (or wheter it should
> be cortexA8, or maybe cortexA8 and omap3) remains probably to be seen.
> I would suggest initially storing these in the arm machine overlay. If
> that one becomes too crowded we alwasy can create an additional layer.

I'm wary of getting too many overlays involved to describe rather simple 
cases.  An SOC_FAMILY makes sense as an overlay as multiple boards will 
use it but not all boards of that overall cpu architecture will.

-- 
Tom Rini
Mentor Graphics Corporation


