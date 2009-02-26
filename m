Received: from [209.85.218.165] (helo=mail-bw0-f165.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LcjxW-0006Eb-9u
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Feb 2009 18:23:42 +0100
Received: by bwz9 with SMTP id 9so677764bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2009 09:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=ajxpWwnAzKKCzO2NC+zKlJ95MYXGQUrcCPH64GLHjhA=;
	b=nQVqdvdscC3qn2jh9rkhlA5lhtwQaYnSxm0quBeyP3qWO/D2LzdWRU72fnvL4knJIj
	JXGZmN7zpsd1VT1YIWYs/dD3jA3oSOPHzbATxS6Y2bLIrEfC/onCCNMrtIvywnrUTGnq
	u19vR0EsD5U1rYV9SYVHxWg14ACCSOrzJbbLc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=tuuiEraeB1E76mitEMA3FbyIZZ1i6nnQbGElNbCtpOaDYusoXdrA/fxcRLYT19n1E7
	mxwqOYeDFDgBBUjeBbHNKdyZMfgOet5yVclg8UBFWk7JEdpn9x/2246K0maKkXxgEFh0
	+/cv/OKL5nuY3D7zGEuhzjHoOjDmuf20nxzLs=
MIME-Version: 1.0
Received: by 10.223.114.135 with SMTP id e7mr2292065faq.89.1235668819920; Thu, 
	26 Feb 2009 09:20:19 -0800 (PST)
Date: Thu, 26 Feb 2009 18:20:19 +0100
Message-ID: <ac9c93b10902260920s24a8c5we592cbb4d0d63221@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE breakages, was: Re: fakeroot fails to build
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
X-List-Received-Date: Thu, 26 Feb 2009 17:23:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

> On 25-02-09 16:14, Mike (mwester) wrote:
>
>> ((Also, are there any non-angstrom distros still left in OE, besides
>> SlugOS? =A0I really feel like I'm swimming upstream all the time with OE
>> -- things break for me so often that just don't seem to affect anyone
>> else...))
>
> Things break often<period>
>
> I'm 'fortunate' enough to be able to spend 2 hours every day fixing
> breakages for angstrom, so I can get a working demo for my presentation
> at the bossaconference. Thanks to all the people in the beagleboard
> community I get notified of breakages pretty much the instant they
> happen, which makes finding the cause a lot easier.
>
> This also means that my 'OE time' is almost completely filled with
> bugfixing, instead of working that is fun. I've been trying to push for
> better testing frameworks and removing the taboo stamp from the word
> 'review'.
>
> The review bit seems to gaining traction, but 'testing' is still a alien
> and mystic concepts for a lot of OE committers. Worse, some people turn
> *off* testing frameworks like insane.bbclass!
>
> Maybe it's time for OE to consider whether it really wants a zillion
> commits per day or only a few tested commits per day. Having a ton of
> active developers means nothing when people using OE can never get a
> build completed due to all the small, but fatal bugs appearing lately.
>
> I'm close to finishing the new stable branch manifesto which lists
> options and procedures to make it easier to do releases of OE (not
> builds, releases of the metadata itself) and track regressions, but it
> would need about 3 or four people spending a few hours on it every week,
> which sadly might not be feasible, since the .dev branch is too nice and
> shiny compared to any branch.

Well I'm happy to follow whatever procedure is needed (and if I do
something wrong by accident, please educate me (no need for anyone to
clean up my mess, I'm more than happy to do that myself, provided I
understand the problem and the proper way to fix it).

The problem I am facing is somewhat different.
I've added packages which build and test fine in my environment but
for some reason they do not build properly on tinderbox. E.g. the
latest version of mpd seems to pick up that there are some residual
elements of docbook present so it assumes docbook is there (but
docbook is in packages/nonworking)!.
This is beyond my capabilities to fix.

BTW, I noticed that there are a lot of bugs in bugzilla about packages
that do not build. Most of these are old. Guess the bugs are fixed but
no-one seems to close them.

Frans.


