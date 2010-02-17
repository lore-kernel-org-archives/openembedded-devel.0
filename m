Received: from mail-gx0-f220.google.com ([209.85.217.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nhpz4-0004z3-U5
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 20:55:00 +0100
Received: by gxk20 with SMTP id 20so1427920gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2010 11:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=w88nchg8M7NB2fms31xF8jBUvNsXxxZgO/YrnYUPt9c=;
	b=EeV6m7P4AQEjr7ks9LEMz7j+SFxVqeXOdwpKdUMXH0Usr5lT70DWL+AtX7xEjxPXWX
	lfXELyLPToxNYeFlH5OQjc+XvijESYn6oj4YfzCf67jiQfAUu39OowzoIdlTkhkNB21N
	uh0wS0r9TwDcKbNdx2t0opw+RVtuRKED87Uhw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=jqwuAhT0u5oO1ldhzcdzzKvaDlWaLY9P5fjYKDQrZpcIaDHoslzYKBOIZC7aiKXmc4
	Zolrn5rCtMjkzCOaWY+eCsZ2NGtXc8xUxAWNnlZIqcHra+9Ox0vIyzVCxJm9JFBCfYCs
	uIvMuMo8+FDDZ+l2FwKcAbPLdwiM3RTysW0T8=
MIME-Version: 1.0
Received: by 10.100.15.19 with SMTP id 19mr4294955ano.72.1266436334452; Wed, 
	17 Feb 2010 11:52:14 -0800 (PST)
In-Reply-To: <hlhh4u$gh0$1@ger.gmane.org>
References: <ac9c93b11001300235y22a60e82qf35d712b8323807d@mail.gmail.com>
	<hk12nm$sdo$1@ger.gmane.org> <hlhc1p$t19$1@ger.gmane.org>
	<ac9c93b11002171058o7f48b417yee87d06da09c7577@mail.gmail.com>
	<hlhf2a$aei$1@ger.gmane.org>
	<ac9c93b11002171140r54616c87t24667b2fefb129a1@mail.gmail.com>
	<hlhh4u$gh0$1@ger.gmane.org>
Date: Wed, 17 Feb 2010 20:52:14 +0100
Message-ID: <ac9c93b11002171152g9fb9aefx2019e76cacef8b9f@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.220
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
X-List-Received-Date: Wed, 17 Feb 2010 19:55:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/2/17 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 17-02-10 20:40, Frans Meulenbroeks wrote:
>> 2010/2/17 Koen Kooi <k.kooi@student.utwente.nl>:
>> On 17-02-10 19:58, Frans Meulenbroeks wrote:
>>>>> 2010/2/17 Koen Kooi <k.kooi@student.utwente.nl>:
>>>>> On 30-01-10 11:47, Rolf Leggewie wrote:
>>>>>>>> Frans Meulenbroeks wrote:
>>>>>>>>> Wouldn't it be cleaner to rename ANGSTROM_EXTRA_INSTALL to e.g.
>>>>>>>>> DISTRO_EXTRA_INSTALL ?
>>>>>>>>
>>>>>>>> This has been discussed before, but not changed. =A0I think it mad=
e sense
>>>>>>>> back then and I think it makes sense now.
>>>>>>>>
>>>>>>>> I believe there is even a better name than DISTRO_EXTRA_INSTALL to=
 be
>>>>>>>> found for the variable. =A0Maybe IMAGE_EXTRA_INSTALL?
>>>>>
>>>>> of all the ways to solve it, you just had to go out of your way to an=
noy
>>>>> people.
>>>>>
>>>>>> I BEG YOUR PARDON
>>>>>
>>>>>> I did not make the change, actually I have not even seen it. I think
>>>>>> you owe me an apology for this.
>>>>>> I also would like to get the opinion of the TSC on the above accusat=
ion.
>>
>> Please pay attention, I responded to rolfs mail, not yours
>>
>>> You are quoting only from my email and have edited all of Rolfs' text
>>> away, so although technically you might be responding to his email, by
>>> keeping only my text you create the impression that the reaction is
>>> towards me.
>
> I am not, this was Rolfs mail:
>
> - -----------
>
> Frans Meulenbroeks wrote:
>> > Wouldn't it be cleaner to rename ANGSTROM_EXTRA_INSTALL to e.g.
>> > DISTRO_EXTRA_INSTALL ?
> This has been discussed before, but not changed. =A0I think it made sense
> back then and I think it makes sense now.
>
> I believe there is even a better name than DISTRO_EXTRA_INSTALL to be
> found for the variable. =A0Maybe IMAGE_EXTRA_INSTALL?
>
> - -----------
>
> So that's 2 lines by you, 4 lines by rolf, and I included them all, with
> proper quotation levels.

Apologies, I misread the indents.
FM

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFLfEffMkyGM64RGpERAuMPAJ96ERFwAYIhR+eC3JphENgeTtO2rwCfU6yZ
> BPP4J17PFllKuh18Lsqc0vw=3D
> =3DC9Ex
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


