Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RUKwb-0002EJ-PJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Nov 2011 17:17:40 +0100
Received: by vcbfo13 with SMTP id fo13so931572vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2011 08:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=GiLsSFtrQC+A/OchwB1pNG7DXx+bwS29qUePwqF2vu4=;
	b=V2/YxFu91S/zyFFWQbvb+phNhTzDSIqrTUg59IquVXCBZmkPojbyUhYseQMA+Wsx/T
	yxvTwDh4hU0v+cAG+S7+h7KCfCxUAIQ7KQkD0tO9r9yeqYkV8XpOMWfVXte/YUj0wJm7
	JaA/25eri7aF6K+GOblrzT/lL22S9FeBgOdWI=
MIME-Version: 1.0
Received: by 10.220.148.68 with SMTP id o4mr3492134vcv.123.1322323861752; Sat,
	26 Nov 2011 08:11:01 -0800 (PST)
Received: by 10.52.28.238 with HTTP; Sat, 26 Nov 2011 08:11:01 -0800 (PST)
In-Reply-To: <CA+M6bXkQUtRu5+JgufshDHnb8suc1sRFiR4ViJ+GoisbYx1JOQ@mail.gmail.com>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org> <jal1pc$2u7$1@dough.gmane.org>
	<CACW_hTZpUU0Zyjv4d+ut1n+Rte55TTh5GT_k1W98KzMY9sjL1w@mail.gmail.com>
	<20111124170654.GA28572@sakrah.homelinux.org>
	<1322166832.13272.2.camel@mattotaupa>
	<CA+M6bXkQUtRu5+JgufshDHnb8suc1sRFiR4ViJ+GoisbYx1JOQ@mail.gmail.com>
Date: Sat, 26 Nov 2011 17:11:01 +0100
Message-ID: <CACW_hTbH8Mvh5+mE0kViaXe8Rh9D_La87nZj0pH4RuWxKWM75g@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Sat, 26 Nov 2011 16:17:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/11/25 Tom Rini <tom.rini@gmail.com>

> On Thu, Nov 24, 2011 at 1:33 PM, Paul Menzel
> <paulepanter@users.sourceforge.net> wrote:
> > Am Donnerstag, den 24.11.2011, 09:06 -0800 schrieb Khem Raj:
> >> On (24/11/11 10:31), Frans Meulenbroeks wrote:
> >> > 2011/11/24 Koen Kooi <koen@dominion.thruhere.net>
> >> >
> >> > > OE .dev will go read-only soon, If you need an OE-classic setup,
> >> > > 2011.03-maintenance is there for you.
> >> >
> >> > As stated before there are still people using .dev and committing to
> it
> >> > [1], and there are people interested in keeping it that way for a
> while.
> >> > So as it stands I suggest to keep it open for a while for those that
> still
> >> > are interested to use it.
> >>
> >> I would suggest that people interested in oe classic should use 2011.03
> >> branch since its maintained and tested regularly. Its in their best
> >> interest too since there are people behind the branch and it gets
> >> regular bug fixes thats not true for master.
> >
> > That statement is not true as far as I can see from the commit log.
> > Almost all patches to 2011.03-maintenance went through master.
>
> Yes, but that's also due, in general to the nature of the branch.
> Angstrom/TI related stuff was going master->2011.03-maintenance before
> I clarified that coming from oe-core is also fine.  As of yet, no one
> else has stepped up and said "I need DISTRO=foo MACHINE=bar working
> here, and I intend to keep an eye on things".  Having angstrom-2008.1
> in there seems to be good enough for most cases.
>

Forgot to mention this in my previous email, but I do have an interest in
minimal and minimal-uclibc for mpc8313. Then again virtually all of my work
is console only, so I'm not really into a position to test lots of things.
I'm keeping an eye on things though and have one or two patches pending
(e.g. our current netsnmp version and uclibc do not seem to be friends).
Personally I prefer to commit these patches to master and issue a pull
request for them and I prefer it if others do the same, so we have a
centralized location, instead of a gazillion git trees at several places.

Frans.

