Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QbcZJ-00055N-Ks
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 19:59:25 +0200
Received: by gxk3 with SMTP id 3so189570gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 10:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=laU7ul5e07V9xOPSaJCC/Xj3Q4ojiE2hadfPTJQ2Sf8=;
	b=pG3cKQS9/GpPW235OhdPMHj0OKtJ6VgTNm7VQVEC13EFNEFB4KcDH+K6ZYprKU1MS5
	NeC32Kn0iDTJKHkUOzwR49yRJDibKk6SOIu6v4TSIrl02c62MeL/utTaZVXFMD8LSlGB
	o4qW3uo5j1PEwkbQgjd2mkHGOa7IyhX/xLC28=
MIME-Version: 1.0
Received: by 10.91.4.21 with SMTP id g21mr7173928agi.198.1309283740875; Tue,
	28 Jun 2011 10:55:40 -0700 (PDT)
Received: by 10.90.75.8 with HTTP; Tue, 28 Jun 2011 10:55:40 -0700 (PDT)
In-Reply-To: <4E0A0D7B.3000602@mentor.com>
References: <cover.1309272010.git.otavio@ossystems.com.br>
	<iucpq7$uav$1@dough.gmane.org>
	<BANLkTinqwZhxLGtp997dgKh9BmAD02LU-A@mail.gmail.com>
	<iucsbb$gp2$1@dough.gmane.org>
	<BANLkTinrcfQvNW4=s5vbjD=8FhaqVYpbEQ@mail.gmail.com>
	<4E0A0D7B.3000602@mentor.com>
Date: Tue, 28 Jun 2011 19:55:40 +0200
Message-ID: <BANLkTiknObFkD03qK=QxDeOc4oNaJJN0VA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH 0/2] Fix parse errors
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
X-List-Received-Date: Tue, 28 Jun 2011 17:59:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/6/28 Tom Rini <tom_rini@mentor.com>

> On 06/28/2011 10:14 AM, Frans Meulenbroeks wrote:
> > 2011/6/28 Koen Kooi <koen@dominion.thruhere.net>
> >
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1
> >>
> >> On 28-06-11 16:59, Otavio Salvador wrote:
> >>> On Tue, Jun 28, 2011 at 11:51, Koen Kooi <koen@dominion.thruhere.net>
> >> wrote:
> >>>> I'm not going pull those in, since the whole point was to not make
> them
> >>>> machine specific. RP has pushed a workaround for it so parsing
> >>>> continues. I'll push a proper fix for systemd later.
> >>>
> >>> What's the difference if the package will be built from same source?
> >>>
> >>> In case you change anything you'll need to rebuild all packages anyway
> >>> so I see no gain in having it per package.
> >>
> >> It makes it easier to deploy updates for the main packages (e.g.
> >> sysvinit, systemd) to all the targets without having to build it for all
> >> targets. It's a weird optimization, but makes life a lot easier for
> >> people needing to support a ton of machines :)
> >>
> >
> > Hm. saving some CPU cycles and wall clock time makes life a lot easier.
> > Guess you haven't too much of a life then :-)
> > No kidding, why not keep things simple. and elegant.
> > (and actually people needing to maintain a lot of machines and keeping
> them
> > up to date is somewhat an oddity anyway; My experience is that most
> embedded
> > developers need to support only a few machines and typically freeze their
> > sources and stabilize their product).
>
> Really?  One of those big requests we see a lot is for things like "how
> can I support the N different revs of the board for this product".
> Looking over at the kernel side of things that was one of the drivers
> for device tree stuff.  So yes, outside of community based distributions
> like Angstrom and SHR and SlugOS and ... there are commercial uses for
> this change as well.  And it doesn't change the world of one machine
> embedded products at all.
>
>
The vendors of embedded products I am aware of (and then I'm talking about
TV's, NAS-es, Audio systems etc etc but also boards running embedded linux
code) focus on stability. Actually none of my managers ever cared if we were
running the latest version of Linux. They do care about stability and
maturity. Some of the products I need to care about still use a 2.6.24
kernel. No way this is going to move. Customers are happy with the product,
and do not care about kernel etc, so for these products only some bug fixing
is done. And yes, we have boards with multiple revs, but we try to keep the
changes small and localized. This might mean some kernel fixes, but
generally no upgrades to newer versions or so.

Of course this is my experience and other places might do things
differently. And of course this is going off-topic.

Have fun! Frans.

