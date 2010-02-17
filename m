Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nhpnt-0003tw-Dr
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 20:43:24 +0100
Received: by yxe5 with SMTP id 5so6651108yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2010 11:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=rMwljjW3oYfVA3qHvNmmRcH9WKmUgM72Q6NiZqQMwns=;
	b=dWZh9kmtI3j8aG7J7jw9SH18Do8or+/diAkl1MCoE3tCiBaAw4dpPsXVZOJvbFKusb
	SholTQE04GwvxNfvKiF2yGaFcgathB1LvMAmzgejMadynUENIl9jYhpAIc2fakse+w/7
	0ne8IUhYGsoVcqKqT8+bS+pkjJVIX5LZMIch4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ZyilLFUsWGBakgXeXcglzFvTPYduOWi1yn+1VdXSlI5HpjX0aNmS4WgX6nLB2pfRAI
	UveC3KF5I5gTkS9mg7s22Xq+1iSrlqEMPTreLzG40DffNQCTwSX5r8KJsxxLCiZjSeex
	TMBjOgarzcm5ZE+irHdSG/qrCTvyttJ7vwVZ0=
MIME-Version: 1.0
Received: by 10.100.83.3 with SMTP id g3mr6204467anb.3.1266435640453; Wed, 17 
	Feb 2010 11:40:40 -0800 (PST)
In-Reply-To: <hlhf2a$aei$1@ger.gmane.org>
References: <ac9c93b11001300235y22a60e82qf35d712b8323807d@mail.gmail.com>
	<hk12nm$sdo$1@ger.gmane.org> <hlhc1p$t19$1@ger.gmane.org>
	<ac9c93b11002171058o7f48b417yee87d06da09c7577@mail.gmail.com>
	<hlhf2a$aei$1@ger.gmane.org>
Date: Wed, 17 Feb 2010 20:40:40 +0100
Message-ID: <ac9c93b11002171140r54616c87t24667b2fefb129a1@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: {RFC] console-image.bb
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
X-List-Received-Date: Wed, 17 Feb 2010 19:43:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/2/17 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 17-02-10 19:58, Frans Meulenbroeks wrote:
>> 2010/2/17 Koen Kooi <k.kooi@student.utwente.nl>:
>> On 30-01-10 11:47, Rolf Leggewie wrote:
>>>>> Frans Meulenbroeks wrote:
>>>>>> Wouldn't it be cleaner to rename ANGSTROM_EXTRA_INSTALL to e.g.
>>>>>> DISTRO_EXTRA_INSTALL ?
>>>>>
>>>>> This has been discussed before, but not changed. =A0I think it made s=
ense
>>>>> back then and I think it makes sense now.
>>>>>
>>>>> I believe there is even a better name than DISTRO_EXTRA_INSTALL to be
>>>>> found for the variable. =A0Maybe IMAGE_EXTRA_INSTALL?
>>
>> of all the ways to solve it, you just had to go out of your way to annoy
>> people.
>>
>>> I BEG YOUR PARDON
>>
>>> I did not make the change, actually I have not even seen it. I think
>>> you owe me an apology for this.
>>> I also would like to get the opinion of the TSC on the above accusation=
.
>
> Please pay attention, I responded to rolfs mail, not yours

You are quoting only from my email and have edited all of Rolfs' text
away, so although technically you might be responding to his email, by
keeping only my text you create the impression that the reaction is
towards me.
>
>>
>> A simple IMAGE_EXTRA_INSTALL +=3D ANGSTROM_EXTRA_INSTALL would have done
>> the job, but no, lets create more work for people, break existing docs
>> and especially ignore what the maintainer of the recipes said.
>>
>> Way to go
>>
>>> FYI: I popped a question three weeks ago.
>>> Today Rolf asked me about the status in #oe.
>>> As you can see above 4 people (Rolf, Mickey, Phil and me were in
>>> favour of the proposal. In irc mckoan also backed the proposal.
>>> There was one person opposed to it: you.
>
> And funnily enough I'm the maintainer, so I get the final say.

Is it? This is, as far as I know, not the way we cooperate within OE.
And, funnily enough, I have not seen such prudence or reluctance by
you when it comes to changing other peoples recipes.

BTW just checked the MAINTAINERS file and it does not list you as
maintainer of that recipe either. FWIW

>
>>> Rolf asked whether he could make the change. As I was about to leave I
>>> agreed that he made the change.
>
> IRC isn't worth anything when it comes to decision making.

It is the place where the developers gather.
But the decision taking was not done on irc. As I already explained
before there was a proposal with 4 reactions on it on the mailing
list. So total 5 opinions. 4 were in favour, 1 was against.

>
>>> If you want it to be an angstrom recipe, please name it as such (or,
>>> even better: start your own angstrom tree or branch).
>
> There are multiple things wrong with the commit:
>
> 1) it silently changes the outcome of 'bitbake console-image' if you
> have ANGSTROM_EXTRA_INSTALL set
>
> 2) It doesn't mention in the commit message that 1) happens
>
> 3) It invalidates docs without any hint
>
> 4) It wasn't discussed on the mailinglist, but on a medium where I'm not
> present
>
> 5) the maintainer of the recipe wasn't informed of the change
>
> With this change it seems angstrom developers have to update docs, deal
> with user complaints, update sample config files, etc, etc, just because
> Rolf jumped the gun. I find that unacceptable.

I haven't reviewed the change yet, so I cannot comment on 1 or 2.
As far as 3 concerns: yeah, changes often invalidate docs. Btw they
are not OE docs.
As far as 4 concerns: I think the change has been discussed in this very th=
read.
and wrt 5 I already explained my position above.

Frans.
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD4DBQFLfD+MMkyGM64RGpERAsHcAJ0TvgFEzIULXdGV3vTl1MdduSDDugCY3VgD
> Ut2LwB0i1AH9GMz7YedxjA=3D=3D
> =3DF5i2
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


