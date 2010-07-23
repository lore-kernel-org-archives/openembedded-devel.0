Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OcEOx-0007Ap-6X
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 11:18:44 +0200
Received: by bwz10 with SMTP id 10so1528612bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 02:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=7G7n77zeftu5N60SP7S6GeIRLhmywqdFSEb/wLlA6VI=;
	b=CTaGt4vjOjNlIAaNR2h4rLvE/1dAYth6jxqf/mFJJfZ5iJKiWD6KYSlIikiqfin/R8
	OZsenLiMMiBruWLb1inIWilneVCsnsT+Ddgio7lrsIsslNIke1PvGAJ5dpXy3Rksn5wA
	RGyGqELbfZpvSOEw37dcioCoQe/XuvlBV4oYA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=K8StFmGsXM8NJSsOsdYjNs2KQaGc2dQKdmXQ6qnV5ppcttKYN2Gurk/8PYAIciUK2k
	KBCd81ZjRh98umLv583t5YGVvmEVDG0Ta+AqoSeEMe05T563mjgDVnkvAJI8Au25KGSk
	TGIb+bDxKNJvVX0vCXhjlfzXYWo2iJoNGKkvQ=
MIME-Version: 1.0
Received: by 10.204.154.66 with SMTP id n2mr2588674bkw.8.1279876712492; Fri, 
	23 Jul 2010 02:18:32 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Fri, 23 Jul 2010 02:18:32 -0700 (PDT)
In-Reply-To: <1279875548.13006.32.camel@rex>
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>
	<i2bg5t$mvp$1@dough.gmane.org>
	<1279872152.21888.149.camel@lenovo.internal.reciva.com>
	<i2bir6$un3$1@dough.gmane.org> <1279875548.13006.32.camel@rex>
Date: Fri, 23 Jul 2010 11:18:32 +0200
Message-ID: <AANLkTi=XnYtiTtUke0aiPgvFao3De6-xxb1cWt3hr7=X@mail.gmail.com>
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
Subject: Re: [PATCH 0/4][RFC] Remove CROSS_DIR, install cross-packages 	into native sysroot
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
X-List-Received-Date: Fri, 23 Jul 2010 09:18:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/23 Richard Purdie <rpurdie@rpsys.net>

> On Fri, 2010-07-23 at 10:11 +0200, Koen Kooi wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > On 23-07-10 10:02, Phil Blundell wrote:
> > > On Fri, 2010-07-23 at 09:25 +0200, Koen Kooi wrote:
> > >> There is a BIG problem with these patches, they break multimachine
> builds.
> > >>
> > >> The previous situation had:
> > >>
> > >> cross/armv7a-angstrom-foo/usr/bin/
> > >> cross/armv5te-angstrom-foo/usr/bin/
> > >> etc
> > >>
> > >> The new situation has:
> > >>
> > >> x86_64-linux/usr/bin
> > >>
> > >> So all the toolchains get dropped into the *same* directory, which
> > >> breaks horribly.
> > >
> > > Which are the actual binaries that collide?  I would have thought that
> > > everything which gets installed into the cross bindir ought to be
> > > prefixed with TARGET_SYS (i.e. usr/bin/armv7a-angstrom-linux-gcc, etc).
> >
> > It's all 'arm-angstrom-foo', I was just about to make the suggestion to
> > change it to 'armv7a-angstrom-foo' :)
>
> I've just been talking to Koen about this. When building for armv7a,
> TARGET_ARCH which goes into TARGET_PREFIX and TARGET_SYS is "arm".
>
> I suspect if we change TARGET_ARCH to be armv7a, nasty things will
> happen but I could be wrong.
>

I've been pondering if TARGET_ARCH should be the real arch (like armv7a) and
whether adjacent to that there should be a TARGET_ARCH_FAMILY or so.

Changing TARGET_ARCH to armv7a without other changes definitely is going to
break things.
There are 110 .bb files that reference TARGET_ARCH

the last two lines of the grep read:
xqt2/xqt2_20060509.bb:    if [ ${TARGET_ARCH} == "arm" ]; then
xqt/xqt_0.0.9.bb:    if [ ${TARGET_ARCH} == "arm" ]; then
so these are definitely not going to fly

for some other of the 110 recipes the change is harmless (e.g. because they
compare to "mips" in gcc-common.inc)
for most others I cannot judge this, e.g. because the value is passed to
configure.

unrelated side note:
while grepping I noticed the existence of dirs like linux-uml and linux-atm.
These contain kernel recipes.
Shouldn't these be in linux recipes dir? (or alternately shouldn't there be
also things like linux-omap and linux-nios2).

frans


> If that doesn't help which I suspect it won't, my gut instinct is to add
> a architecture specific directory under bin for the cross bits. This
> could be as simple as changing bindir in cross.bbclass.
>
> > I don't know if that solves the binutils-cross problem[1], though.
> >
> > Koen
> >
> > [1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/34685
>
> Is that libiberty.a file actually useful or could we just stop
> binutils-cross installing it?
>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

