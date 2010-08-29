Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Opfqj-0001IQ-GF
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 13:14:58 +0200
Received: by iwn2 with SMTP id 2so3920398iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 04:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=VamdwiQknmN16KZcpaDoHCKHtQUAxAVnJ91LSPlpRjw=;
	b=WpUyr8CKy0AufHqW1+odz4yS15klOuYOuBaxmtUcIWFE2fHUDdYQBLTm5T8DSJVmBI
	1KxqFw4wvBUsmG4Wl1ujY7V+TL7DP4Se3hw2iKvYx08Vnt06SlhiFOxV8G8413floZqz
	7rx3hVXaNrkmKkAPTwjnPCfbpxV62PUiger5o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=uIGxJ+wJ6UL/VWkyrclB0Y5tr6Dqq5lyB83q5lFG3p02N25+pZAZ9Q5mpe/zEGuqzk
	c8/sYSxd52Kqd80mka1XR8iAux9KScfk2oaVgWMvZWx/NuSzvb3eOaypnRTtTGCCONkg
	Lst4Ha09joqPenjTLHZlZLqZRKtT3M7ozBMXQ=
MIME-Version: 1.0
Received: by 10.231.13.130 with SMTP id c2mr3720975iba.24.1283080468264; Sun,
	29 Aug 2010 04:14:28 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 04:14:28 -0700 (PDT)
In-Reply-To: <i5b82o$kgn$1@dough.gmane.org>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>
	<i586bt$t12$1@dough.gmane.org>
	<AANLkTikWe-88_U7FmV2mi4=J6XV-A3-nYUqJdjDNzOA9@mail.gmail.com>
	<i5aoas$sja$2@dough.gmane.org>
	<AANLkTi=stV1ahzagn-7Fzq73pL3xYDDBZpAsfRUbA86v@mail.gmail.com>
	<4C790CCD.9060403@balister.org>
	<AANLkTinMWegmS0vGvqXnkrPPqHXnDh+YkB-sxJ95KcTp@mail.gmail.com>
	<i5b82o$kgn$1@dough.gmane.org>
Date: Sun, 29 Aug 2010 13:14:28 +0200
Message-ID: <AANLkTimq19A5AzXG5pVuzKU84RUEBM7RyW4uNf_tSpXC@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] recipes: Update recipes to get 'bitbake world' parse and calculate runqueue successfully.
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
X-List-Received-Date: Sun, 29 Aug 2010 11:14:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/28 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 28-08-10 16:39, Chris Larson wrote:
>
>> *Every* patch that gets proposed is a patch that "works for you, but may=
 not
>> for others". =A0You simply can't test every combination for every change=
 you
>> make, it's not possible. =A0As long as these sorts of patches go the lis=
t for
>> review, as they now seem to be, I don't see the problem.
>
> You mean like the patch that removed the default openssl version for
> *every* distro and introduced an SOVERSION change to libs that can't be
> parallel installed, that got pushed without review? That one?

This was an error, reverted as soon as I could after I became aware of it.
And no, it was not reviewed and not properly tested.
I've apologised for that and I apologize for that again right now.
Sorry for any inconvenience caused by it.

BTW: I am a lttle bit surprised to et complaints about not following
the procedure from a person who in the past repeatedly shown not to
take too much care when it comes to following the procedures.
I'm aware of several commits that are against the revert policy or
that touch recipes from other maintainers without any discussion with
the recipe maintainer and without posting a patch for review.
And some of these patches were not correct either.

> Of course reverting fixes it, no problem, we don't have to manually
> check all recipes and packages to see what dynamically links against
> openssl to bump PR and rebuild and upload all of those, of course. And
> of course the person causing the mess did all that to clean it up.

When I wrote the email message on the removals I offered to repair
whatever was brought up.
See http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-August/022=
846.html

There were a few issues brought to my attention and I have dealt with
it swiftly (in my opinion).
I did not get any information or request from you to clean up things.

> And no need to check recipes that statically link either.
> </sarcasm>
>
> So a patch was was tested nor reviewed that broke a lot got pushed and
> the person who pushed it refuses to help with the cleanup, just awesome.

Please provide proof for your statement that I refusded to help with
cleanup, or eat your words and apologize!
You are spreading incorrrect information..
>
> Drat, that was a bit sarcastic as well.

Frans.


