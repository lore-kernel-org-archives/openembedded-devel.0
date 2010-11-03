Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PDkY2-00005E-N0
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 22:07:11 +0100
Received: by iwn42 with SMTP id 42so1248878iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 14:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=dnzt+SOZLMXihkojg1XfYv5KSjrjKlHEb0BWkEB5zjU=;
	b=H4n7IkI8y7EQBC5gUnCgardHnofBV9R5doo1rJb7ZjAwE/4s1CePhNJdLEwLkJvnnm
	HWNbROmPOKfX7U1lMuIo5ar8H0x/Xkl+59OACdBVCB6nurnTuEglbxJSEWD60kjmUYkC
	oZPA3+wcTRdE6IYb7idQQR5MeNqs90Hu84PsA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kLAYZRwpNHXwLvYyKiof8NKoXO/EeGa+5WBwyKsUvpab02ZJ6Yrh4D/ZCzxBlqI2ZE
	0UgTxvfBNfzsh04e6FnvAWdnICJXVwNmdHJt1/g6AODniDJfP4pW7/ZldVGPwTXceleH
	GCcxgrh3KDv91APwKfpCcMdA90BWzTat/O3Ek=
MIME-Version: 1.0
Received: by 10.231.35.194 with SMTP id q2mr3680159ibd.26.1288818380573; Wed,
	03 Nov 2010 14:06:20 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Wed, 3 Nov 2010 14:06:20 -0700 (PDT)
In-Reply-To: <AANLkTiknWyRh2L9u9jbgYgvK5dXx7x2VFeKGhh89TAxJ@mail.gmail.com>
References: <i9p1d0$7q4$1@dough.gmane.org>
	<AANLkTimRY+gDbK9jZvUEuxMAu3PvQ8pnfb3oXjAXeU0B@mail.gmail.com>
	<iaptb1$bpb$1@dough.gmane.org> <4CD07F3E.7040703@eukrea.com>
	<4CD080E2.2000706@mentor.com>
	<AANLkTi=3GwhFb27DDyHnOcQEk1oskP1NSEUw_qaZdNyr@mail.gmail.com>
	<4CD178C2.9010303@mentor.com>
	<AANLkTi=D76QqygmJRdOPEeZJNL9N2X0vyYV8UPVNDPDH@mail.gmail.com>
	<4CD1C33D.3040207@mentor.com>
	<AANLkTiknWyRh2L9u9jbgYgvK5dXx7x2VFeKGhh89TAxJ@mail.gmail.com>
Date: Wed, 3 Nov 2010 22:06:20 +0100
Message-ID: <AANLkTikNnKRhrVWf0J92eazn=C4p4anByx3F+mJBj3kK@mail.gmail.com>
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
X-List-Received-Date: Wed, 03 Nov 2010 21:07:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/3 Khem Raj <raj.khem@gmail.com>:
> On Wed, Nov 3, 2010 at 1:17 PM, Tom Rini <tom_rini@mentor.com> wrote:
>> Frans Meulenbroeks wrote:
>>>
>>> 2010/11/3 Tom Rini <tom_rini@mentor.com>:
>>>>
>>>> Frans Meulenbroeks wrote:
>>>>>
>>>>> 2010/11/2 Tom Rini <tom_rini@mentor.com>:
>>>>>>
>>>>>> Eric B=E9nard wrote:
>>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> Le 02/11/2010 21:46, Koen Kooi a =E9crit :
>>>>>>>>
>>>>>>>> I do fear that pulling things into seperate layers too much will m=
ake
>>>>>>>> it
>>>>>>>> harder to propagate fixes...
>>>>>>>>
>>>>>>> yes, in your example, the fines in conf/machine/include are common =
to
>>>>>>> all
>>>>>>> omap boards (and even all cortexa8 for tune-cortexa8.inc) and thus
>>>>>>> when
>>>>>>> fixing one BSP you have to think to fix the others (and to communic=
ate
>>>>>>> the
>>>>>>> fix to other BSP maintainers).
>>>>>>> The same apply for most of the .inc in recipes-bsp/*/.
>>>>>>>
>>>>>>> Do you think the following setup is possible ?
>>>>>>>
>>>>>>> - ARM overlay (containing all generic files for ARM achitecture :
>>>>>>> conf/machines/include for example)
>>>>>>>
>>>>>>> - OMAP3 overlay (containing all generic files for OMAP3 SOC :
>>>>>>> conf/machines/include/omap* + recipes/linux u-boot x-load base file=
s
>>>>>>> for
>>>>>>> omap3 architecture,
>>>>>>>
>>>>>>> - specific board overlay (conf/machine/themachine.conf + board
>>>>>>> specific
>>>>>>> additions in recipes/linux u-boot & x-load (with patches based on t=
op
>>>>>>> of
>>>>>>> the
>>>>>>> OMAP3 overlay).
>>>>>>
>>>>>> How about:
>>>>>>
>>>>>> - allow some form of conf/machine/include to continue to exist in th=
e
>>>>>> main
>>>>>> layer
>>>>>>
>>>>>> ? There would have to be some judgment calls, but I don't think that
>>>>>> should
>>>>>> be too hard, over when it's SOC_FAMILY or when it's very generic.
>>>>>> =A0Basically
>>>>>> the ARM overlay wouldn't be created in this case (nor the PPC nor MI=
PS
>>>>>> nor
>>>>>> ...). =A0But we must avoid duplicating tune-coretexa8.inc and simila=
r.
>>>>>>
>>>>> I'd say it is definitely nice to have a arch specific overlay (e.g.
>>>>> ARM, MIPS, PPC, Nios2) which contains the specific recipes for that
>>>>> architecture.
>>>>> To give an example:
>>>>> For nios2 the only backend is for gcc 4.1.2 and binutils
>>>>> 17.50.something. I can imagine that at some point in time it is
>>>>> decided not to support these in the mainline/standard/common/base
>>>>> system. In such a case I think the arch specific overlay would be a
>>>>> good place.
>>>>
>>>> I would argue that so long as someone is maintaining nios2 that means =
we
>>>> can't drop gcc 4.1.2 until there's another stable version for it. =A0A=
nd
>>>> having that in the nios2 overlay means that it might well start to mis=
s
>>>> generic fixes, if we aren't careful.
>>>>
>>>> Don't get me wrong, I'm quite in favor of breaking things up, and putt=
ing
>>>> on
>>>> my Mentor hat, we have machine specific overlays and like it.
>>>
>>> I understand you. Problem is that I have been peeking into moving
>>> nios2 forward, but the changes in the back end structure between 4.1
>>> and 4.5 are not really minimal, and while I have a basic understanding
>>> on compiler internals, I'm by no means a gcc wiz. So guess 4.1.2 for
>>> nios will be around for quite a while.
>>> And yes, I prefer to keep it on the mainline. as long as possible.
>>> Actually I was mostly using this as an example (because I know this one
>>> best).
>
> I dont think it would make sense to put things like gcc and binutils
> and core components
> into overlays. You stand the risk of out dating these recipes for
> developers it would be more focused
> to make changes for such things in one place. I will not go into every
> overlay and =A0propagate a gcc change to
> each one of them thats simply waste of time. Because the change to
> core effects all =A0I urge to
> practice restrain and not do these kind of things. OE can have recipes
> for multiple versions of a given package live together.
> As far as machine specific recipes are considered I think its ok
> although I would suggest to leverage common stuff as much as can be
> done.
>
I'm not planning to.
This would be the solution if for one reason or another gcc 4.1.2 was
kicked from the base layers (or the associated binutils).
I have a very strong preference ot keep them in the base layer.
This was only intended as an example.
Apologies for the misunderstanding and confusion.

FM


