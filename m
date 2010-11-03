Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PDiZQ-0006OM-CJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 20:00:29 +0100
Received: by iwn42 with SMTP id 42so1130625iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 11:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=hm8WgwBj8wbPqlneLF1mzuT5mRiHIpFWEUrK+ogA7To=;
	b=ZP5guOhUwjnv9AlsKl0WljnASLmkHY7bwQ6u/RgunCEOheBAc1QxjE1Iq/gdl+45LQ
	4jragFEs4BuTNuEzvYSofWleWpreTJsR28kbjuhtgmlV+vIgQgYglksUizVEw1wUUCow
	TqmHIeVsXqOI4rCtk5QksIGsKgI67J2iDzPmA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=oH/2gf3SbfdNqPtgliVoFMXcytFFsnKs2Uvk4HGz7/DZMIpTDLk8LfnjYVWSSWW6z8
	o8O6WOwt3mbNgik0O0tg29Ufe33CeMbd1eG4r1ZPfvnAqRlMCRArA+1dfavs64x+5KVg
	isOXkoVbesCJ+v+zm/i0TltLNVyPFmRdJQ10g=
MIME-Version: 1.0
Received: by 10.231.152.143 with SMTP id g15mr3183016ibw.76.1288810778493;
	Wed, 03 Nov 2010 11:59:38 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Wed, 3 Nov 2010 11:59:37 -0700 (PDT)
In-Reply-To: <4CD178C2.9010303@mentor.com>
References: <i9p1d0$7q4$1@dough.gmane.org>
	<AANLkTimRY+gDbK9jZvUEuxMAu3PvQ8pnfb3oXjAXeU0B@mail.gmail.com>
	<iaptb1$bpb$1@dough.gmane.org> <4CD07F3E.7040703@eukrea.com>
	<4CD080E2.2000706@mentor.com>
	<AANLkTi=3GwhFb27DDyHnOcQEk1oskP1NSEUw_qaZdNyr@mail.gmail.com>
	<4CD178C2.9010303@mentor.com>
Date: Wed, 3 Nov 2010 19:59:37 +0100
Message-ID: <AANLkTi=D76QqygmJRdOPEeZJNL9N2X0vyYV8UPVNDPDH@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Wed, 03 Nov 2010 19:00:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/3 Tom Rini <tom_rini@mentor.com>:
> Frans Meulenbroeks wrote:
>>
>> 2010/11/2 Tom Rini <tom_rini@mentor.com>:
>>>
>>> Eric B=E9nard wrote:
>>>>
>>>> Hi,
>>>>
>>>> Le 02/11/2010 21:46, Koen Kooi a =E9crit :
>>>>>
>>>>> I do fear that pulling things into seperate layers too much will make
>>>>> it
>>>>> harder to propagate fixes...
>>>>>
>>>> yes, in your example, the fines in conf/machine/include are common to
>>>> all
>>>> omap boards (and even all cortexa8 for tune-cortexa8.inc) and thus whe=
n
>>>> fixing one BSP you have to think to fix the others (and to communicate
>>>> the
>>>> fix to other BSP maintainers).
>>>> The same apply for most of the .inc in recipes-bsp/*/.
>>>>
>>>> Do you think the following setup is possible ?
>>>>
>>>> - ARM overlay (containing all generic files for ARM achitecture :
>>>> conf/machines/include for example)
>>>>
>>>> - OMAP3 overlay (containing all generic files for OMAP3 SOC :
>>>> conf/machines/include/omap* + recipes/linux u-boot x-load base files f=
or
>>>> omap3 architecture,
>>>>
>>>> - specific board overlay (conf/machine/themachine.conf + board specifi=
c
>>>> additions in recipes/linux u-boot & x-load (with patches based on top =
of
>>>> the
>>>> OMAP3 overlay).
>>>
>>> How about:
>>>
>>> - allow some form of conf/machine/include to continue to exist in the
>>> main
>>> layer
>>>
>>> ? There would have to be some judgment calls, but I don't think that
>>> should
>>> be too hard, over when it's SOC_FAMILY or when it's very generic.
>>> =A0Basically
>>> the ARM overlay wouldn't be created in this case (nor the PPC nor MIPS
>>> nor
>>> ...). =A0But we must avoid duplicating tune-coretexa8.inc and similar.
>>>
>>
>> I'd say it is definitely nice to have a arch specific overlay (e.g.
>> ARM, MIPS, PPC, Nios2) which contains the specific recipes for that
>> architecture.
>> To give an example:
>> For nios2 the only backend is for gcc 4.1.2 and binutils
>> 17.50.something. I can imagine that at some point in time it is
>> decided not to support these in the mainline/standard/common/base
>> system. In such a case I think the arch specific overlay would be a
>> good place.
>
> I would argue that so long as someone is maintaining nios2 that means we
> can't drop gcc 4.1.2 until there's another stable version for it. =A0And
> having that in the nios2 overlay means that it might well start to miss
> generic fixes, if we aren't careful.
>
> Don't get me wrong, I'm quite in favor of breaking things up, and putting=
 on
> my Mentor hat, we have machine specific overlays and like it.

I understand you. Problem is that I have been peeking into moving
nios2 forward, but the changes in the back end structure between 4.1
and 4.5 are not really minimal, and while I have a basic understanding
on compiler internals, I'm by no means a gcc wiz. So guess 4.1.2 for
nios will be around for quite a while.
And yes, I prefer to keep it on the mainline. as long as possible.
Actually I was mostly using this as an example (because I know this one bes=
t).

>
>> Whether there should be an omap3 specific overlay (or wheter it should
>> be cortexA8, or maybe cortexA8 and omap3) remains probably to be seen.
>> I would suggest initially storing these in the arm machine overlay. If
>> that one becomes too crowded we alwasy can create an additional layer.
>
> I'm wary of getting too many overlays involved to describe rather simple
> cases. =A0An SOC_FAMILY makes sense as an overlay as multiple boards will=
 use
> it but not all boards of that overall cpu architecture will.
>

True. I have no strong feelings in favour or against a soc family layer.
The thing that worries me is that we get too many very small layers.
If there is little content in the soc layer, I would not mind getting
that in the ARM layer (in this case).
If needed we can always split it up.
We might also want to peek at how the kernel arch dir and/or the
u-boot arch dir are organized.

Frans


