Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OWkwL-0003xo-DV
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jul 2010 08:50:35 +0200
Received: by bwz10 with SMTP id 10so278001bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 23:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=3dB0dabodjWBZYBmUnVazWSla9kyW8s/GAG7559s8F4=;
	b=ZIIysPcXsfwi29MT5FRrXRZOYZ88VTmEP9DfNPfEeULWFjRJdBBF4EmrYSzchV9UiZ
	Ngv6WyGQ04qFGwDRNp8ZN5jom+bQusjq+53j7gBzX/WCaOAWkHAqeBU3yXzkiaBTXlbT
	ObnNjQHzk2lUpU896W5E/7LjKJwZ/UFjRx3so=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dmi2p4HvgHnNht2vmbC4P5qWqazJPlOZClT3eeBUe+soEJ8BtdtLrKeOG2n/jsVji+
	Qk/iJHZi24sot1yGiMoSr5b5Bu3Rvns5RY+/X1DBx4o8eUjZ85wuqiitwHab/tfQYPMY
	WCagy0GrzpUTrjY1RdcFPI0IxIlNvEGQuwvzQ=
MIME-Version: 1.0
Received: by 10.204.163.133 with SMTP id a5mr5930991bky.6.1278571540642; Wed, 
	07 Jul 2010 23:45:40 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Wed, 7 Jul 2010 23:45:40 -0700 (PDT)
In-Reply-To: <AANLkTinY0pP1lYELylehQ7H6MNWbnHx-0kAImownNdMg@mail.gmail.com>
References: <i108p5$hd$1@dough.gmane.org> <4C33B301.7010006@mentor.com>
	<i119n7$ej7$1@dough.gmane.org>
	<AANLkTilMeF6JeEaV7XjkOwfb2_G1d3XO3sIe9CP_77-g@mail.gmail.com>
	<AANLkTinY0pP1lYELylehQ7H6MNWbnHx-0kAImownNdMg@mail.gmail.com>
Date: Thu, 8 Jul 2010 08:45:40 +0200
Message-ID: <AANLkTims-FTz6co2XGsGDrTsBJm6Txud6itQeIFBeKrD@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Thu, 08 Jul 2010 06:50:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Khem, thanks for your informative and constructive reply.

Below some response

2010/7/8 Khem Raj <raj.khem@gmail.com>:
> On Wed, Jul 7, 2010 at 1:22 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> 2010/7/7 Koen Kooi <k.kooi@student.utwente.nl>:
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> On 07-07-10 00:49, Tom Rini wrote:
>>>> Koen Kooi wrote:
>>>>
>>>>> +PREFERRED_VERSION_gcc-cross =3D "4.1.2"
>>>>> +PREFERRED_VERSION_gcc-cross-initial =3D "4.1.2"
>>>>> +PREFERRED_VERSION_gcc-cross-intermediate =3D "4.1.2"
>>>>> +PREFERRED_VERSION_binutils =3D "2.17.50.0.12"
>>>>> +PREFERRED_VERSION_binutils-cross =3D "2.17.50.0.12"
>>>> [snip]
>>>>> do NOT belong in a machine.conf (or machine include). Those belong in
>>>>> the distro (or local.conf), not in the machine.
>>>>
>>>> Just putting this out there (and it's indeed _not_ how things are
>>>> today). =A0Why would we not want to move towards having this kind of s=
tuff
>>>> be in the tune-ARCH.inc file, when a specific version is really needed
>>>> (more avr32 or new'ish core on an existing overall arch) ?
>>>
>>> Putting it in a tune-arch is not a problem, just put it in
>>> conf/distro/include.
>>
>> Why should this be distro specific. I'd say this is generic.
>
> We generally categorize distro to support many machines/architectures
> and commonolize on toolchain because 2/3 of gcc is common for all archite=
ctures
> and if a bug gets fixed in front end of middle end all architectures bene=
fit
> if you start locking compiler versions per machine it will pave way to ch=
aos
> as you will be using different compiler for every machine.

I didn't look at it from the gcc commonailty perspective.
When it comes to paving way to chaos, I have some doubts.
I haven't created a new version of gcc (that's why I explicitly didn't
go the gcc-nios2 recipe way).

And actually the chaos is already there. Personally I feel we have way
too many gcc recipes. (21 different versions, not counting the
cross-initial, cross-intermedate, cross, *sdk* *csl* etc ones).
But this has been discussed before and as far as I am concerned we do
not need to rehash that discussion.

>
> sometimes some machines use same family of processor like say omap5912osk=
 and
> qemuarm they can use same toolchain if one is compiling for both in
> multimachines.

I'd say the same toolchain can be used (and generally is used) if it
is the same architecture.
>
>>
>>> Experience has shown that putting it the machine includes is a bad idea=
,
>>> It rots and after a while a new machine gets added that doesn't use sai=
d
>>> machine include.
>>
>> I'm not sure how it would rot, but anyway I'd say avoiding this is the
>> responsibility of the architecture maintainer. (which might well be
>> the one who maintains gcc for that arch).
>> Wrt the "new machine gets added that doesn't use said machine
>> include": I agree this is a risk.
>> To me it seems part of the problem is that architectures seem 2nd
>> class citizens. Ideally boards should link to architectures.
>> (btw: I'd say a new board gets added that does not use said
>> architecture include).
>>
>> It might be an idea to restructure the conf/machine dir to turn it into =
a
>> conf/architecture/board hierarchy.
>
> thats a good suggestion.
>
>>
>>> And not to mention the need to change DISTRO_PR for editing a
>>> machine.conf, that's just backwards.
>>
>> As said this is because architectures are 2nd class citizen. I feel it
>> would be better to add an ARCH_PR.
>> (actually by introducing an ARCH_PR, it might be that the need for
>> DISTRO_PR diminshes or goes away, can't fully judge that atm).
>>
>
> DISTRO is sort of profile which drives the software compilation now
> if you intend to hijack its purpose and put it in machine conf you can
> very well do it but its not norm.

I have no desire to hijack DISTRO.
>
>>>
>>>> Yes, it
>>>> should be up to the distro to say "we want 4.4.x + 2.20.x" or whatever=
,
>>>> but then we also get the downside of "special case, XXXX only works we=
ll
>>>> with 4.3.4 + 2.19.x" or what have you, and those special cases get
>>>> introduced in one place and copy/pasted elsewhere.
>>>
>
> whats problem with that. Your patch does same instead of distro it puts i=
t
> in machine confs. I dont know why you dont like how AVR32 is done.

Note that the text quoted above (starting with Yes, it) is not mine
whereas the rest of the text
you reply to is mine.
>
>>> So you have an include file in conf/distro that people can optionally
>>> use or copy/paste. Not all distros can/want to support all machines in
>>> OE. Angstrom tries to, but that's because it's the reference implementi=
on :)
>>
>> I'm not sure if Tom is saying that.
>>
>> Anyway, as the maintainer for the nios2 toolchain I don't feel like
>> chasing down all distro's and making sure they fix their stuff if e.g.
>> a certain version of gcc has to be deprecated (e.g. because it is
>> broken)
>
> so how do you think nios users will use this stuff. I guess they dont
> need a DISTRO is that what you are intending ?

Well I'm using my own for now.
As I felt it others might be interested in and benefit from my work,
that's why I made it available.
As it helped to get acceptance I've added a board definition for a
publicly available board (normally I run this on our own embedded hw).
If a distro wants to support the board, fine with me. If not, equally
fine with me.
The only issue is that for now there is only a backend for gcc
4.1.2/binutils 2.17.50.0.12
Generally speaking this means there should be a way to specify that an
architecture is incompatible with a certain tool vendor.
(and I feel enforcing this one way or another is better than letting
things fail and leave the user to find out why the heck this
combination of machine and toolchain is not working).

Have fun, Frans
>
>
>>>
>>> It boils down to this:
>>>
>>> The distro needs to make a decision to do strange stuff to support a
>>> platform. Silently forcing it is bad.
>>
>> I object to calling this "do strange stuff".
>>>
>>> In this specific case no distro except angstrom has expressed interest
>>> in supporting nios2, so we could even but this in an angstrom.inc.
>>> Seriously, can the distro maintainers that are willing to support nios2
>>> please raise their hands?
>>
>> A few comments here:
>> - I haven't really seen interested from angstrom to support nios2.
>> Feel free to correct me by sending a pointer (preferably referring to
>> the angstrom mailing list)
>> =A0Actually, except for Leon, I am unaware of any serious interest.
>> - I've no idea how many active distro maintainers we have.
>> - and I am not sure how many of them will read this thread.
>>
>> Anyway, I am dealing with a distro (unpublished as of now) which is
>> interested in nios2.
>>
>> Frans
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


