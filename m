Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P3BfT-0007Rz-QE
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 19:51:13 +0200
Received: by iwn2 with SMTP id 2so8560717iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 10:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=7Fszgjr9KWu9fXJFT207NCoHe/bx9jUgWkXc/P5T5JY=;
	b=A7xE1aA4TUSEmTMnHT8BADeR4/RD3o0fopNqJ/4AFgPDQj26rOK8xIB9D2XQ1lgsg2
	/CBvecIbsL+o9W8scVlmuow9wdepxsHwhMpPEFU9hrUoUyNp+X2jkXUaIPn/86IcyxDi
	dMxbJiDgG1XfvE2S+R2TWc+6q1/CvNrmXvxMg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=NxzFBgemtnQMFCQxI5hYTujUFz58OFkEjGRhg3joiRlYb9SexOkGnlpBw+1/bl5jaB
	OqPOfMV057JeKHsTnzQssM5H40UGaXgYpepSnUoU1McrLNNqI0PkYPmtPk5MYRDccJcm
	0oCwm3Xsgl5GoFpU/aKiucayPkcNYmAGXkMR8=
MIME-Version: 1.0
Received: by 10.231.182.201 with SMTP id cd9mr12538345ibb.21.1286301053369;
	Tue, 05 Oct 2010 10:50:53 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 5 Oct 2010 10:50:53 -0700 (PDT)
In-Reply-To: <i8fiqe$f3b$1@dough.gmane.org>
References: <1286264643-6352-1-git-send-email-raj.khem@gmail.com>
	<i8ev7s$ts9$1@dough.gmane.org> <4CAB4112.3070505@mentor.com>
	<i8fiqe$f3b$1@dough.gmane.org>
Date: Tue, 5 Oct 2010 19:50:53 +0200
Message-ID: <AANLkTik_JhnFKr66qUfGJKTOQ_HeMazW0MZ_AZ0fQhGc@mail.gmail.com>
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
Subject: Re: [PATCH 0/6] libtool 2.4 upgrade
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
X-List-Received-Date: Tue, 05 Oct 2010 17:51:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/5 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 05-10-10 17:15, Tom Rini wrote:
>> Koen Kooi wrote:
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> On 05-10-10 09:43, Khem Raj wrote:
>>>> Hi
>>>>
>>>> Following set of patches is intial support for getting libtool 2.4 into
>>>> openemebedded. I have so far built minimal-image for two machines
>>>> successfully
>>>>
>>>> The big change that libtool 2.4 brings is sysroot support and I have
>>>> added
>>>> support to use this feature. It should make our life easier.
>>>
>>> I'm a bit concerned about the way this is implemented, it seems to for
>>> libtool 2.4 onto everyone since it changes e.g. autotools.bbclass. Is
>>> that intended? If so we need signoffs from each and every distro
>>> maintainer *and* from the maemo-compat folks as well.
>>> Unless there is a way to make the new features conditional on the
>>> libtool version.
>>
>> It shouldn't be too bad, implementation wise, to set LIBTOOL_HAS_SYSROOT
>> or similar and test for that.
>
> That was I was thinking, make it opt in for now and have the
> trailblazers (angstrom, shr) find & fix issues before RFC it to make it
> the default.
>
>> But can we also set a phase out date for
>> older libtool, even if maemo-compat isn't possible (given chinhook pins
>> to 1.5, I bet it's not) ?
>
> A phase-out would be good, I'm not sure how many people are going to use
> maemo-compat (and friends) from .dev in a few months from now.
>
> Doing something like this is a lot bigger than a toolchain change, so I
> don't think 2 signoffs is enough.

signoffs or acks
For me this *is* a toolchain change, but I agree that more testing and
more eyeballs looking at it is better. What I wanted to say is that I
do not want to block progress because one of the
not-so-very-active-distro's does not want to move forward or does not
respond or whatever.
>
> My proposal:
>
> 1) add libtool recipes to .dev
> 2) create branch for sysroot changes (with or without LIBTOOL_HAS_SYSROOT)
> 3) gather test reports for said branch
> 4) fix issues
> 5) create branch with LIBTOOL_HAS_SYSROOT and propose for merging.
>
> Does that sounds like a decent plan to go forward?

Sounds fair for me.
I can imagine that we create a branch or tag just before the merge so
distro's that do not want to move to the new changes can keep using
that.
Actually we could decide to first merge into the branch (or keep
tracking or so, don't know too much about the technicalities) and do
the weekly testing round on the branch and merge if the testing is
successful.
>
> regards,
>
> Koen

Have fun! Frans


