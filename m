Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Od60S-0002zE-Cl
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Jul 2010 20:33:02 +0200
Received: by bwz10 with SMTP id 10so2659962bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jul 2010 11:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=d8bg90FkSjEaqpGUor/5+BgvPTNKoFtydragAPrpeuM=;
	b=l89UW4ui5A+aUwgsd/NB8pTAOvRFy2D2emdgQWhrTClg/MzP/61Javr4RnCYaz8q8V
	eoFRk7AxOfAd+toe0xgH3AkR8HUen6lyHgMpIzZ35+dXw55gRuG/5mFHABGSSodkxSzV
	SBjoJeVDv4mQxfnS1rEUt5tFsS7GJodLkhnxw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=hT9tHImbRIJUrEpby3jDPmC9xtX8deoxzi2SuklUHOEJobRrkjpjnh/bhsaU1hvpwL
	vZpaQa3SS01131c2E0r2gEdsTILvPmQ5xL1IQoPj0HNqSxTaSlC4j9AjtC5CccR5ibQb
	oZ85b/bJxbIn+utq41i9QkbEfXQQ7E5BLRm8A=
MIME-Version: 1.0
Received: by 10.204.126.92 with SMTP id b28mr4843536bks.47.1280082767065; Sun, 
	25 Jul 2010 11:32:47 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Sun, 25 Jul 2010 11:32:46 -0700 (PDT)
In-Reply-To: <AANLkTi=3tLxtsvO-ETEW90+Y-AH7=02kqeF8tzS1Cfhc@mail.gmail.com>
References: <AANLkTim5aAnNi5VFs7=-gg1XaM=+KBeUs-G494SEbR+V@mail.gmail.com>
	<4C4AE42C.5000306@welchs.me.uk>
	<AANLkTimG_U4Gsc9LuK6oKDJO2rE=xB7cDQzGf6dsh2GM@mail.gmail.com>
	<4C4B0125.1040304@vollmann.ch>
	<AANLkTi=MJyW68ppn7YH-1LNp3rVwii9Gas+kUjQYAEEo@mail.gmail.com>
	<AANLkTimfB5y2WDyrNr7EZD+gFDS4cE-F_LkquAtD+UZF@mail.gmail.com>
	<AANLkTinerH6EoKXHEcZa4As35XHbeVo8nk4BqkvDNnRV@mail.gmail.com>
	<AANLkTi=3tLxtsvO-ETEW90+Y-AH7=02kqeF8tzS1Cfhc@mail.gmail.com>
Date: Sun, 25 Jul 2010 20:32:46 +0200
Message-ID: <AANLkTimbeZanQ_UKEcdEnqcYQji+1n3Si2nA8CNdrkpZ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] get rid of legacy staging
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
X-List-Received-Date: Sun, 25 Jul 2010 18:33:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/24 Khem Raj <raj.khem@gmail.com>

> On Sat, Jul 24, 2010 at 10:22 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
> > 2010/7/24 Chris Larson <clarson@kergoth.com>
> >
> >> On Sat, Jul 24, 2010 at 9:08 AM, Frans Meulenbroeks <
> >> fransmeulenbroeks@gmail.com> wrote:
> >>
> >> > 2010/7/24 Detlef Vollmann <dv@vollmann.ch>
> >> >
> >> > > On 07/24/10 16:35, Frans Meulenbroeks wrote:
> >> > >
> >> > >> 2010/7/24 Martyn Welch <martyn@welchs.me.uk>
> >> > >>
> >> > >>  Can anyone point me to any documentation that describes what
> legacy
> >> > >>> staging
> >> > >>> is and roughly what needs to be done to remove it?
> >> > >>>
> >> > >>
> >> > >
> >> > >> There was a post half a year or so ago from Koen, but I can't find
> it.
> >> > >> Basically it boils down to removing do_stage from a recipe in which
> >> case
> >> > >> do_install is used to install things in staging
> >> > >> in some cases do_install need to be modified to deal with
> >> peculiarities
> >> > >> that
> >> > >> were done in do_stage
> >> > >>
> >> > >> For native recipes NATIVE_INSTALL_WORKS = "1" may need to be added.
> >> > >>
> >> > > That's not really much of an explanation.
> >> > > Let's take an example.  I have two out of tree kernel modules A and
> B.
> >> > > B depends on A.
> >> > > With "legacy" staging, in A_1.0.bb I have a do_install, that copies
> >> > > the kernel object, and a do_stage, that copies the header file at
> >> > > a place where B_1.0.bb can find it.
> >> > >
> >> > > How do I do that with non-"legacy" staging?
> >> > >
> >> >
> >> > Apologies if my explanation was too brief. Didn't have too much time
> (and
> >> > still haven't)
> >> > I hope Koen's explanation below helps.
> >> > The way I perceive it is that the non-legacy staging is performed by
> >> doing
> >> > a
> >> > do_install with the staging dir as target directory.
> >> > Guess someone will correct this if I am wrong.
> >>
> >>
> >> You never touch a staging directory from do_install, ever.  You install
> >> into
> >> the usual paths, relative to ${D}, and the machinery in the classes will
> >> automatically populate staging from that.  If you need to mangle a file
> >>
> >
> > That is what actually what I wanted to say but apparently failed to
> express
> > properly
> > It is indeed the machinery that does the work, not the user itself.
> >
> > Frans.
> >
> >> differently in staging from how you want it in your package, you can
> >> install
> >> a hook that will be called at staging population time.
> >> --
>
>
> when we are at it may be at the same time look into converting native
> recipes
> to use BBCLASSEXTEND. In my experience whenever I went to remove legacy
> staging I ended up converting the native recipes to use BBCLASSEXTEND along
> with
>

We still have 400 native recipes. in 270 or so directories

>
> I have a huge patch where I have removed inherit autotools_staging from
> all recipes in OE. I havent tested it so far but should be done in few days
>

Cool, that would be a great step.

>
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

