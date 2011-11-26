Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RUKYU-0000qc-Of
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Nov 2011 16:52:43 +0100
Received: by vbbfc21 with SMTP id fc21so2333904vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2011 07:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=5KObasCxpnzXTD6w3QgaE0S20PUNui0EoTRMPMkoc74=;
	b=WXfJJHyR8wo9GXfmphaFKzt2Rfj4iLGvwfLX4rk4pOUwVpfxXpybCdQ6IbAQk3KN4q
	CGThrFWoBsTVAV6LVKJeuN9iDrU+N3B6UfttoF0PBR0dbmqsJ9IXwdynxoyWCdyHqs4L
	jEB7Rsdkeb09LfRQ3ESSDVhKcco2hxa9ikwR8=
MIME-Version: 1.0
Received: by 10.52.34.207 with SMTP id b15mr37250891vdj.19.1322322359923; Sat,
	26 Nov 2011 07:45:59 -0800 (PST)
Received: by 10.52.28.238 with HTTP; Sat, 26 Nov 2011 07:45:59 -0800 (PST)
In-Reply-To: <CA+M6bX=Xs+ACNOXYfFafb__vGNVYX3y8g7zvLQvDiHyg=5yjRw@mail.gmail.com>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org>
	<CA+M6bX=Xs+ACNOXYfFafb__vGNVYX3y8g7zvLQvDiHyg=5yjRw@mail.gmail.com>
Date: Sat, 26 Nov 2011 16:45:59 +0100
Message-ID: <CACW_hTbDBOV9yikTqpeVDif1J0oCcEorj=vMB1BcRsZG=0gzKg@mail.gmail.com>
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
X-List-Received-Date: Sat, 26 Nov 2011 15:52:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/11/25 Tom Rini <tom.rini@gmail.com>

>
>
> <Putting on TSC hat>
> The problem with this mindset is that we don't want to have
> oe-core+meta-oe+etc and oe.dev diverge any more than they had at the
> start.  This is why at some point master needs to become read-only.
> Everyone and their master based project can still fetch and build and
> work.  But if you're going right now and saying "I need to start a new
> project and it should be oe.dev+master based", please speak up now
> about why you're unable to use oe-core+etc.  We can't solve what we
> don't know is a problem and frankly I think the TSC is of the mind
> that oe-core+etc is as good as or better than oe.dev.  If we're wrong,
> someone needs to tell us what's missing.
>

Well, there is at least the issue of machines and architectures.
Now it is probably not too big a deal to bring over a new machine and turn
it into a BSP layers, but adding another architecture is yet another thing.

We do have products that are based upon NIOS II. This architecture is
present in OE classic and not in OE core.
One of the issues is that the NIOS II toolchain is still based upon (iirc)
gcc 4.1.1
I do not see an upgrade of gcc/niosii happen in the near future (In the
past I did spent some time to see if I could move to a newer version, but
there were some issues, and afaik no one is working on this atm), and I
doubt oe-core is interested in having a 4.1.1 toolchain around.

Therefore probably our next niosii project will still be oe-classic based.
On the other hand we also have ppc projects and the next one might quite
well use oe-core (it is too late to switch for the current one as we need
to release next month).

(and more general: oe classic still has quite some recipes that are not in
oe-core or meta-oe (apart from the fact that the latter is not really too
open to contributions; see the email thread on id3lib from a while ago).

Frans

