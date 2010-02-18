Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ni4gZ-0006NR-S0
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 12:36:50 +0100
Received: by gwaa20 with SMTP id a20so28141gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 03:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=6LIaZvCI/uFYkm8jmFTc7fCI+XX4gM6E1OpdwADZ0dY=;
	b=ahcZEMWkXLa5sF2PrzTPw8FYqD/uTbN7WHfqMVWhNPH6/++2r7J8VJ9UINVQNkVC4b
	0Ewz96cgEFvudj69q1sHWeL6TbK9x7G+7nQfCYDJ5gQjtHn3eQVqzmSOMHw5Ku1giczW
	2WOfe76J4QYObxJffDCHdEnxaddXrrkrrxA0U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=fJlOWo43fhOOYoBe1FaOD4d70628Q4K4OjBHoy3uWCR5/Th4+jyD8ivGMuNPvX3PEV
	HoxUxmqn3GeU2IYT8bOkeKNEO+6LFVxDKzrBzucOLEsOcTAGWCTpIZYvOYfjl0sDvh4/
	ZkXSYTgDyvCKVE8tnn+hA86OQOWrRsgTZndeE=
MIME-Version: 1.0
Received: by 10.101.137.10 with SMTP id p10mr2112002ann.33.1266492846953; Thu, 
	18 Feb 2010 03:34:06 -0800 (PST)
In-Reply-To: <hlj73b$v9k$1@ger.gmane.org>
References: <ac9c93b11001300235y22a60e82qf35d712b8323807d@mail.gmail.com>
	<hk12nm$sdo$1@ger.gmane.org> <hlhc1p$t19$1@ger.gmane.org>
	<ac9c93b11002171058o7f48b417yee87d06da09c7577@mail.gmail.com>
	<hlhf2a$aei$1@ger.gmane.org>
	<ac9c93b11002180118m1512bc71sa6eb91624e83263e@mail.gmail.com>
	<hlj21d$fdf$1@ger.gmane.org>
	<ac9c93b11002180211p73d24d7dv4359a61dee5a6c4e@mail.gmail.com>
	<hlj73b$v9k$1@ger.gmane.org>
Date: Thu, 18 Feb 2010 12:34:06 +0100
Message-ID: <ac9c93b11002180334p6b7d81b6y187e61f62518b9fb@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
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
X-List-Received-Date: Thu, 18 Feb 2010 11:36:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/2/18 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 18-02-10 11:11, Frans Meulenbroeks wrote:
>> 2010/2/18 Koen Kooi <k.kooi@student.utwente.nl>:
>> On 18-02-10 10:18, Frans Meulenbroeks wrote:
>>>>> 2010/2/17 Koen Kooi <k.kooi@student.utwente.nl>:
>>>>>
>>>>>>>> FYI: I popped a question three weeks ago.
>>>>>>>> Today Rolf asked me about the status in #oe.
>>>>>>>> As you can see above 4 people (Rolf, Mickey, Phil and me were in
>>>>>>>> favour of the proposal. In irc mckoan also backed the proposal.
>>>>>>>> There was one person opposed to it: you.
>>>>>>
>>>>>> And funnily enough I'm the maintainer, so I get the final say.
>>>>>
>>>>> Still wondering what makes you the maintainer.
>>>>>
>>>>> git log does not mention any changes for this file by you (apart from
>>>>> yesterdays revert):
>>>>> See http://cgit.openembedded.org/cgit.cgi/openembedded/log/recipes/images/console-base-image.bb
>>
>> Git doesn't track renames properly, using the parent of the
>> packages->recipes commit:
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded/log/packages/images/console-image.bb?id=fa6cd5a3b993f16c27de4ff82b42684516d433ba
>>
>>> The parent is http://cgit.openembedded.org/cgit.cgi/openembedded/log/packages/images/console-base-image.bb
>>> we're talking about console-base-image here.
>
> No, we are not talking about console-base-image, read the subject of
> this mail: "Re: [oe] {RFC] console-image.bb"
>
> Try doing 'git log --follow recipes/images/console-image.bb' in your OE
> checkout and see the ancestry of console-image for the past 3.5 years.

As I already explained in the 3rd message of this email I
misremembered the name when typing the message. See quoted text below.
This should also be clear from the context of the message
And the commit you reverted is also on console-base-image.bb:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=8679a8574893ac8cd3beeebe2e62084b94660999
not console-image.bb

Rolf did not touch console-image and console-image does not contain
angstrom specifics.

Frans.


2010/1/30 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2010/1/30 Rolf Leggewie <no2spam@nospam.arcornews.de>:
>> Frans Meulenbroeks wrote:
>>> Wouldn't it be cleaner to rename ANGSTROM_EXTRA_INSTALL to e.g.
>>> DISTRO_EXTRA_INSTALL ?
>>
>> This has been discussed before, but not changed.  I think it made sense
>> back then and I think it makes sense now.
>>
>> I believe there is even a better name than DISTRO_EXTRA_INSTALL to be
>> found for the variable.  Maybe IMAGE_EXTRA_INSTALL?
>>
> Actually mistyped tye filename, it was console-base-image.bb
> and in the beginning it says that it is an angstrom bootstrap image,
> so having angstrom specific env vars in it makes sense, but guess the
> name then should be angstrom-console-base-image.bb, just like other
> images are prefixed with openmoko, nylon, opie, slugos and whatever
>


