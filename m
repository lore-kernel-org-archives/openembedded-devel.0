Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RUbYs-0002QK-Ii
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Nov 2011 11:02:16 +0100
Received: by vcbfo13 with SMTP id fo13so1178919vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Nov 2011 01:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=zeroLrmF/FoG3IS+T5LpFyDWvd6C7/DiqDKPQQRlfn0=;
	b=OMOHbeJosLhVO6ldlbpYgENCSZ6qPExq8dqTy3UOUtl0NfOvv+qptScnbmHYMGZn0F
	yoe6fG60aY4dolmMlHc8864f5zkLjOyE5MdP8xqvFGC4q1Hp35DVVELKeQuuqPRTxdOI
	+yA2iqw8TgT9ZTwRUIReaZSwwu3r1JmY//Bq8=
MIME-Version: 1.0
Received: by 10.52.34.207 with SMTP id b15mr39241112vdj.19.1322387737553; Sun,
	27 Nov 2011 01:55:37 -0800 (PST)
Received: by 10.52.28.238 with HTTP; Sun, 27 Nov 2011 01:55:37 -0800 (PST)
In-Reply-To: <CA+M6bXkTP9BPgEx_3ykwKJuv73s+0WAsJH_NwRbFEo=ZERhC0A@mail.gmail.com>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org>
	<CA+M6bX=Xs+ACNOXYfFafb__vGNVYX3y8g7zvLQvDiHyg=5yjRw@mail.gmail.com>
	<CACW_hTbDBOV9yikTqpeVDif1J0oCcEorj=vMB1BcRsZG=0gzKg@mail.gmail.com>
	<CA+M6bXkTP9BPgEx_3ykwKJuv73s+0WAsJH_NwRbFEo=ZERhC0A@mail.gmail.com>
Date: Sun, 27 Nov 2011 10:55:37 +0100
Message-ID: <CACW_hTZonV9m3U+gUTBBG2hEL2C9hzDLJrdZt+nM7qcn2LunQw@mail.gmail.com>
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
X-List-Received-Date: Sun, 27 Nov 2011 10:02:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/11/26 Tom Rini <tom.rini@gmail.com>

> On Sat, Nov 26, 2011 at 8:45 AM, Frans Meulenbroeks
>
> >
> > Well, there is at least the issue of machines and architectures.
> > Now it is probably not too big a deal to bring over a new machine and
> turn
> > it into a BSP layers, but adding another architecture is yet another
> thing.
> >
> > We do have products that are based upon NIOS II. This architecture is
> > present in OE classic and not in OE core.
> > One of the issues is that the NIOS II toolchain is still based upon
> (iirc)
> > gcc 4.1.1
> > I do not see an upgrade of gcc/niosii happen in the near future (In the
> > past I did spent some time to see if I could move to a newer version, but
> > there were some issues, and afaik no one is working on this atm), and I
> > doubt oe-core is interested in having a 4.1.1 toolchain around.
>
> An external toolchain should be fine.  You should also be able to put
> that gcc & company into meta-niosii.  If you can't, then IMHO, there's
> a problem someone needs to look at.  But I suspect there isn't a
> problem doing that.
>

In oe-classic it is not an external toolchain. It is also a CPU
architecture.
It mgiht be possible to make an external toolchain for it, but that does
not allow
saying things in recipes like: FILES_niosii += in other recipes (iirc there
are a few of these)

Moving the recipes to meta-niosii could also be done, and is probably
better as the toolchain is a set of OE recipes. I'm not sure if it is
possible to solve the ARCH problem that way, but one might get away with it
by e.g. bbappend-ing in all relevant recipes. This seems a fair amount of
work, so I guess this is not going to happen overnight.

BTW if this is felt to be a good plan then we might consider moving all
arch specific bits into an arch specific layer. (not too sure if that is a
good plan though).

>
> > Therefore probably our next niosii project will still be oe-classic
> based.
> > On the other hand we also have ppc projects and the next one might quite
> > well use oe-core (it is too late to switch for the current one as we need
> > to release next month).
> >
> > (and more general: oe classic still has quite some recipes that are not
> in
> > oe-core or meta-oe (apart from the fact that the latter is not really too
> > open to contributions; see the email thread on id3lib from a while ago).
>
> Where someone asked Koen to document the differences between oe-core
> requirements and meta-oe requirements?  Yes, that's reasonable but
> lets not fool ourselves either, it's not vastly different, it's PR =
> r0 or not (and PR is supposed to go away).
>

I feel that if meta-oe is considered an openembedded layer, its guidelines
should be made clear.
Also in that case it does seem desirable to use the same guidelines as OE
core uses where possible and only deviate if really needed (and in the PR
case there is probably no such compelling reason).
This last section may be off-topic for the discussion at hand, but it might
explain some of the reluctance to contribute to meta-oe and move to meta-oe.

Might be a topic for the TSC to discuss too.

Frans

