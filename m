Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PInfM-0000XH-43
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 20:27:39 +0100
Received: by gwaa11 with SMTP id a11so1403685gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 11:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=iTUBkHgBDWhtPQBkIVyrvQoLAEAViNEJBSTVfQCgTXQ=;
	b=SmZpNi73KtW8Mf3pxnhRlakU9gLKaw8XuKsp8j52o6o7Q/pdD7wr9aKfrIMneOjt1K
	0q7xpsBeETMOFn5IN60EBSfJHMyyMHudxtghjH/Lp7Vc/kxvU4T6SVQJFI2J193bjkQd
	LTx7p7Mh5308hMNgnGf0qYSYBqdIwlDCbX6OI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=ZLjcq/dMdIBqHhzYhxUQwTSwuCaVaEWZoeLTRzJFrC0ILmrk0ODiMJXQ0u5Buj5FZh
	93vaxiTsQs+sBES1YtQUxccI67F9uyEGnqJqAE6O13FgUDHBVVLsaA6St3Fi8IubcYpk
	6/nuxf7Qtj2xJC/kJCQoH74O4M38LjHYPGzeg=
Received: by 10.91.121.3 with SMTP id y3mr5913911agm.156.1290021984784; Wed,
	17 Nov 2010 11:26:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Wed, 17 Nov 2010 11:26:04 -0800 (PST)
In-Reply-To: <ic0aj2$hqc$1@dough.gmane.org>
References: <AANLkTi=4sU4238+b8zyJJ35VCyJB2ysestx9N=_my697@mail.gmail.com>
	<ic06a8$uft$1@dough.gmane.org> <4CE3A6DE.2070203@xora.org.uk>
	<ic0aj2$hqc$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Nov 2010 11:26:04 -0800
Message-ID: <AANLkTimdqZ1hdZNPN70LXd1WuJSn4pU2y=2C5tZs0-LT@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Preparing for release - Freeze on master
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
X-List-Received-Date: Wed, 17 Nov 2010 19:27:41 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 17, 2010 at 2:25 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 17-11-10 10:56, Graeme Gregory wrote:
>> On 17/11/2010 09:12, Koen Kooi wrote:
>>> On 16-11-10 19:20, Khem Raj wrote:
>>>> Hello All,
>>>
>>>> In order to get to the 2010.12 release, I would like to request to
>>>> stop pushing any changes to master until release. Please keep your
>>>> changes in you local tree ready for when the window
>>>> opens again after the release.
>>>
>>> At OEDEM we agreed that the release would pick a tested branch tag to
>>> avoid such a draconic freeze.
>>>
>> I must say I am puzzled why the freeze when git supports branches. In
>> the past we have just picked a point branched then cherry picked
>> anything interesting that went into org.openemedded.dev until release date.
>
> At OEDEM we decided that the release would be a tag, not branch of .dev.
> To make this release easy and unobtrusive the release team would pick a
> tag of the tested stuff that they thought is best. So the december
> release might actually use a tag from september if that proves to be the
> most "stable".

well. if thats the case then I guess there is not much to be done isn't it.
we just convert a tag into release tag. I was trying to cover more
than what we usually
test on weekly bases in coming couple of tags. Should we create a release branch
before we release and solidify that ? and how many of us would be
willing to help there
if there are not many then it would not work.

>
> I would think our normal commit policy would cover "dangerous" commits
> already, so I object to this draconion freeze proposal.
>

No, commits happen without review and they break stuff for others its
an ongoing thing which is OK for a dev branch
but can be a problem when we are trying to release. This is a minimize
that effect until release.

> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFM462iMkyGM64RGpERAvkmAJ4glGYefhsTMST+UGbZFHI6pjS2qACgrS9g
> AvU3Xy0Y1105HoW1/vLGU2I=
> =EVng
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


