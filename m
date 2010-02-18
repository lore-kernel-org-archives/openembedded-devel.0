Received: from mail-yw0-f171.google.com ([209.85.211.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ni3P2-00032o-Mw
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 11:14:39 +0100
Received: by ywh1 with SMTP id 1so808491ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 02:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=dweoQX7UA57C/WRj/2TGUM5TxupXiPB9rNKXvG7Efdw=;
	b=SX9CcJynu/zYCTBCo8XrsvYv3BYA4eLd+7VKkS1tUiDWpG4JhNV/sceWdChj/Vyh49
	6gPt4K8VL2kho99PV+Sz8KqArrCNRyFhqrMhM8Gikeq3TgP05ym4+hzUrE/soK3mOXb7
	6Qawp8ZSybZjAJNdWHaAMTavDzxlEo3xqsfuc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=I0Y5rcH5x7mmJS5yuLfHxJ4nVXnQx/NKYKuPLWFf3CCNBAxWrjAw9KBszysI13lxKx
	nicw2ROxS3KHeEZ9LAVtZDy5xfVgRPI8gvG9kdpkDQuIz3C7NfQQyC8rF1ZVvQvVMQZi
	s0ItMEdeN5atwfZfG3ekYpInO7NfPP/IatL4Q=
MIME-Version: 1.0
Received: by 10.101.40.1 with SMTP id s1mr8835730anj.222.1266487911547; Thu, 
	18 Feb 2010 02:11:51 -0800 (PST)
In-Reply-To: <hlj21d$fdf$1@ger.gmane.org>
References: <ac9c93b11001300235y22a60e82qf35d712b8323807d@mail.gmail.com>
	<hk12nm$sdo$1@ger.gmane.org> <hlhc1p$t19$1@ger.gmane.org>
	<ac9c93b11002171058o7f48b417yee87d06da09c7577@mail.gmail.com>
	<hlhf2a$aei$1@ger.gmane.org>
	<ac9c93b11002180118m1512bc71sa6eb91624e83263e@mail.gmail.com>
	<hlj21d$fdf$1@ger.gmane.org>
Date: Thu, 18 Feb 2010 11:11:51 +0100
Message-ID: <ac9c93b11002180211p73d24d7dv4359a61dee5a6c4e@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.171
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
X-List-Received-Date: Thu, 18 Feb 2010 10:14:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/2/18 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 18-02-10 10:18, Frans Meulenbroeks wrote:
>> 2010/2/17 Koen Kooi <k.kooi@student.utwente.nl>:
>>
>>>>> FYI: I popped a question three weeks ago.
>>>>> Today Rolf asked me about the status in #oe.
>>>>> As you can see above 4 people (Rolf, Mickey, Phil and me were in
>>>>> favour of the proposal. In irc mckoan also backed the proposal.
>>>>> There was one person opposed to it: you.
>>>
>>> And funnily enough I'm the maintainer, so I get the final say.
>>
>> Still wondering what makes you the maintainer.
>>
>> git log does not mention any changes for this file by you (apart from
>> yesterdays revert):
>> See http://cgit.openembedded.org/cgit.cgi/openembedded/log/recipes/images/console-base-image.bb
>
> Git doesn't track renames properly, using the parent of the
> packages->recipes commit:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/log/packages/images/console-image.bb?id=fa6cd5a3b993f16c27de4ff82b42684516d433ba

The parent is http://cgit.openembedded.org/cgit.cgi/openembedded/log/packages/images/console-base-image.bb
we're talking about console-base-image here.

>
> And that stops on a rename as well.
>
>>
>> Btw in the commit message you write
>> "If you're touching a recipe at least make sure the creator/maintainer
>> agrees with your changes."
>>
>> How come this "rule" suddenly appears.
>
> It hasn't suddenly appeared, and furthermore console-image is widely
> used enough to label it 'core', so any changes will need to get
> reviewed, which they weren't in this case.
>
> And non-angstrom people created angstrom-named new recipes without any
> approval from angstrom developers is just plain rude.

Sorry, I have no idea who the angstrom developers are or what recipes
are angstrom recipes (unless the name explicitly says so).
I thought we were all openembedded developers.
Anyway, the recipes created by me are openembedded recipes not
angstrom recipes (for what it is worth).
That is also why they live in openembedded/recipes (and not angstrom/recipes).

If you feel so picky about other people touching your recipes, I
suggest to move them to a separate directory or overlay, so people
know when they are breaking new ground.

And finally (and yes I know I am repeating myself): please do unto
others as you would have them do unto you.
If you do not give respect, don't complain of getting none back.

Just my eur 0.02

FM.

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFLfQtuMkyGM64RGpERAuLxAJ9nhJE4wv6U+TDleoStwvk+suGAhACguLZF
> 2RCLURHCtcP3Zq21cd3VjNo=
> =tR5o
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


