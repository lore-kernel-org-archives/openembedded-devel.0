Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PDYVa-00013Q-C0
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 09:15:51 +0100
Received: by iwn42 with SMTP id 42so443361iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 01:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=tkHl5KyEcEuCEcd45sfc0Ch0UxfTtpCSzG3iX6PNjEM=;
	b=CqU0BckKL797iYg3Deo/wx2aw7yQWW9rydxKQNCWzbNt/ixmTC00NeJZRp+H3jX67/
	N81hrsXDFWKsXG+hnsO1Jtlwdi/HH32Xf8oIcATmszxsrTpwGJ0IbHpjw8t1cCROZaou
	RqT3qY5+ACThbQZ/EU+ujCQmzep1FxAga9b98=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=BtcNskb8Qi+tfiHeOWRoNuuKa2mltmTvN84t/SR4LY8tc/nUSJFFo+9OxpqgnbhNDX
	8hKX+HXW6ydo9CnRISZ55+idTDsPh6LqOgAr8TZj6FnsmZOhFHA5XOf6+skWzbzxWyCk
	TK76aUKGzmsxOfMX+5dw07szP+e+Pmv341i3U=
MIME-Version: 1.0
Received: by 10.231.35.194 with SMTP id q2mr2958360ibd.26.1288772101253; Wed,
	03 Nov 2010 01:15:01 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Wed, 3 Nov 2010 01:15:01 -0700 (PDT)
In-Reply-To: <4CD080E2.2000706@mentor.com>
References: <i9p1d0$7q4$1@dough.gmane.org>
	<AANLkTimRY+gDbK9jZvUEuxMAu3PvQ8pnfb3oXjAXeU0B@mail.gmail.com>
	<iaptb1$bpb$1@dough.gmane.org> <4CD07F3E.7040703@eukrea.com>
	<4CD080E2.2000706@mentor.com>
Date: Wed, 3 Nov 2010 09:15:01 +0100
Message-ID: <AANLkTi=3GwhFb27DDyHnOcQEk1oskP1NSEUw_qaZdNyr@mail.gmail.com>
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
X-List-Received-Date: Wed, 03 Nov 2010 08:15:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/2 Tom Rini <tom_rini@mentor.com>:
> Eric B=E9nard wrote:
>>
>> Hi,
>>
>> Le 02/11/2010 21:46, Koen Kooi a =E9crit :
>>>
>>> I do fear that pulling things into seperate layers too much will make i=
t
>>> harder to propagate fixes...
>>>
>> yes, in your example, the fines in conf/machine/include are common to al=
l
>> omap boards (and even all cortexa8 for tune-cortexa8.inc) and thus when
>> fixing one BSP you have to think to fix the others (and to communicate t=
he
>> fix to other BSP maintainers).
>> The same apply for most of the .inc in recipes-bsp/*/.
>>
>> Do you think the following setup is possible ?
>>
>> - ARM overlay (containing all generic files for ARM achitecture :
>> conf/machines/include for example)
>>
>> - OMAP3 overlay (containing all generic files for OMAP3 SOC :
>> conf/machines/include/omap* + recipes/linux u-boot x-load base files for
>> omap3 architecture,
>>
>> - specific board overlay (conf/machine/themachine.conf + board specific
>> additions in recipes/linux u-boot & x-load (with patches based on top of=
 the
>> OMAP3 overlay).
>
> How about:
>
> - allow some form of conf/machine/include to continue to exist in the mai=
n
> layer
>
> ? There would have to be some judgment calls, but I don't think that shou=
ld
> be too hard, over when it's SOC_FAMILY or when it's very generic. =A0Basi=
cally
> the ARM overlay wouldn't be created in this case (nor the PPC nor MIPS no=
r
> ...). =A0But we must avoid duplicating tune-coretexa8.inc and similar.
>

I'd say it is definitely nice to have a arch specific overlay (e.g.
ARM, MIPS, PPC, Nios2) which contains the specific recipes for that
architecture.
To give an example:
For nios2 the only backend is for gcc 4.1.2 and binutils
17.50.something. I can imagine that at some point in time it is
decided not to support these in the mainline/standard/common/base
system. In such a case I think the arch specific overlay would be a
good place.

Whether there should be an omap3 specific overlay (or wheter it should
be cortexA8, or maybe cortexA8 and omap3) remains probably to be seen.
I would suggest initially storing these in the arm machine overlay. If
that one becomes too crowded we alwasy can create an additional layer.

Khem wrote:
> in general we should try to move minimal stuff into machine layers for ob=
vious maintenance
> burdening reasons. I am afraid that this has potential of leading usinto =
maintenance problems
> if we hold this loosely.

I fully agree with this.
In my opinion the rule should be:
machine specific stuff should go into the machine overlay. A machine
overlay could cover several closely related machines (e.g.
beagleboard, beagleboard-XM (should these be considered as different)
arch specific stuff (including stuff that is appropriate for multiple
machines in the arch.
non hw specific stuff should go into the common base.

We should definitely avoid that multiple recipes and multiple recipe
variants are created as that creates a maintenance nightmare.

Coming back on the gcc/nios2 example.
I'd expect this to be in the common base, but if at some point in time
it is decided to eliminate it from there, it should move to the nios2
overlay.
Maintenance responsibility then shifts from the maintainers of the
common base to the maintainer of the nios2 layer.

Frans.


