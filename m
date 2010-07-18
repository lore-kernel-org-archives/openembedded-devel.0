Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Oaar5-0008Dn-Ln
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jul 2010 22:53:00 +0200
Received: by qyk30 with SMTP id 30so1607503qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jul 2010 13:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=IsaK3nItas2kTlG+cML0wV7MuebInjJVOBs/lbp0CkE=;
	b=ROPzURokG5SkFAz16mGe9oxA5MqR/fXwN7WhzzniDIZc3d7QHBoOO2+K0PwvjEp/pc
	c946wZH2CtbfRaCduafp/VY79jOr6RBAbGZ63OGzvqC2NQcksarPQuo+cZBHYViykvGW
	28UnOgDEZro9GAlov9iMiCv+67Oq+o7Lii69s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=TbOODXiC/s8jPi1ZSkY+/rkge5vR/pJmTvrbiPo3c1TZQYysRL7YvaOWprOPIPDQ8K
	xtV/qqA5aIx25dR/xeGpCIHlbtkt+3DtYsIAhTjmiYvIa2RBfvxOw/Sqw2L2q7T41Trg
	omhiJbm+S0USiE1Ddyga75PAeCtf3qmaTMsQQ=
Received: by 10.224.49.197 with SMTP id w5mr3508566qaf.172.1279486371174; Sun, 
	18 Jul 2010 13:52:51 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.212.11 with HTTP; Sun, 18 Jul 2010 13:52:31 -0700 (PDT)
In-Reply-To: <AANLkTinYiD78udRbI9UYYpWceIKsIy0ZCY9V8GDFNN2t@mail.gmail.com>
References: <1279290319.10837.1747.camel@rex>
	<AANLkTinYiD78udRbI9UYYpWceIKsIy0ZCY9V8GDFNN2t@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 18 Jul 2010 13:52:31 -0700
X-Google-Sender-Auth: PXB6UnE-4B9R9PzyVGxVZuKIuBw
Message-ID: <AANLkTinHBLgYoEXUEbKGCsxs3sZME1VE2H8_yrAad4w3@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: A new bitbake extension: .bbappend files
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
X-List-Received-Date: Sun, 18 Jul 2010 20:53:01 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jul 18, 2010 at 12:47 PM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> 2010/7/16 Richard Purdie <rpurdie@rpsys.net>
>
> > Whilst our layers mechanism, is great it does have a drawback which has
> > bugged me for a while. If you have a recipe like pointercal which has
> > machine specific information in it and you have your new machine code in
> > a layer, how do you add a pointercal file for your machine?
> >
> > Answer is you copy the whole pointercal recipe and files into your
> > layer, then add the single file for your machine. To me this is ugly,
> > ugly, ugly. We hate code duplication and as soon as you create two
> > copies of the same information, we've failed.
> >
> > So how could we do this better? Somehow we need to say that a given
> > directory X has some information which should be merged with the
> > original recipe. I've thought through several different ways of doing
> > this and the best solution I found was "bbappend".
> >
> > The idea is that if bitbake finds any X.bbappend files, when it loads
> > X.bb, it will also include these files after it parses the base .bb file
> > (but before finalise and the anonymous methods run). This means that
> > the .bbappend file can poke around and do whatever it might want to the
> > recipe to customise it.
> >
> > I went ahead and tried it out as its quite simple to code this in
> > bitbake. I liked the result enough I've already merged this into Poky:
> >
> >
> >
> http://git.pokylinux.org/cgit.cgi/poky/commit/?id=63e6ba85677b8aa9f4cf9942a1fccbb8a8c72660
> >
> > I'm proposing to push it to bitbake master if there are no serious
> > objections.
> >
> > As an example use case, for the pointercal case above in another later
> > you could add a pointercal_0.0.bbappend file which contained something
> > like:
> >
> > FILESPATH := "${FILESPATH}:${@os.path.dirname(bb.data.getVar('FILE', d,
> > True))}"
> >
> > which would then cause the directory containing the bbappend file to be
> > searched for pointercal files.
> >
> > There are of course many other uses this could be put to for creating
> > customised layers, its totally generic.
> >
> > For the specific case of paths, I have wondered if there would be a way
> > to leverage help from bitbake in creating a sane set of search paths but
> > I'm still thinking about that. This extension is good enough in its own
> > right in my opinion to be worthwhile.
> >
> > Cheers,
> >
> > Richard
> >
>
> I've been pondering a litlte bit more about this.
> Will the .bbappend mechanism allow me to override a file in the original
> recipe?
> If so how?
>
> Typical use case: I want to have a dedicated defconfig for my linux kernel.
> Alternate use case: a dedicated busybox configuration.
>

You can do this today with FILESPATHBASE.

I.e. FILESPATHBASE =. "${TOPDIR}/files:", then mkdir -p files/busybox; cp
mybusyboxdefconfig files/busybox/defconfig
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

