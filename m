Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OcM5w-0007YM-IO
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 19:31:39 +0200
Received: by qwg8 with SMTP id 8so3886756qwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 10:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=PJO2Kx1owle5j2fXB1Cue7nJB5uJXMTEiovjQdv2vuk=;
	b=EvN3lLtHKQROO8MY/yyewQu90mr6JFLUiMqvWl1/CO6cSh95XD7ObZSthMIdnF90ca
	vAFSklj01WdxsYW+PBFFoFNknA3eW5Ox6a0ohvkcsuHF/IcZcrcf5r3uEstxybeRQ3F0
	1/ZgUX7JFnTh7bHB0gf7/FShECqvFDfmCEmMg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=CZB3sPBXhLYXre+KG55aYl1MK1JiMhQZYmHMIeu9kHBVWJQd4Xpj9FCjv4XCwOwVAA
	HaNK2p2MMXDUDZFUf0787DqLKU0al1X4OBlItN82fsGvbKwNMCJmkMYa6bIUZpQtoV3X
	fhBtKpJ7KjiJ5UZxzmGaE82dNTK2l37EzCJ6I=
Received: by 10.224.43.100 with SMTP id v36mr2890494qae.201.1279906255857; 
	Fri, 23 Jul 2010 10:30:55 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.212.11 with HTTP; Fri, 23 Jul 2010 10:30:32 -0700 (PDT)
In-Reply-To: <AANLkTinJZ-Nst4HvkGtuPG5Y9X3MQuqfFhmkoU=cKaER@mail.gmail.com>
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com> 
	<i2bg5t$mvp$1@dough.gmane.org>
	<1279872152.21888.149.camel@lenovo.internal.reciva.com> 
	<i2bir6$un3$1@dough.gmane.org> <1279875548.13006.32.camel@rex> 
	<AANLkTi=XnYtiTtUke0aiPgvFao3De6-xxb1cWt3hr7=X@mail.gmail.com> 
	<AANLkTinJZ-Nst4HvkGtuPG5Y9X3MQuqfFhmkoU=cKaER@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 23 Jul 2010 10:30:32 -0700
X-Google-Sender-Auth: 4DYihnSxw2tzZCV3Y7VpgJNqIy4
Message-ID: <AANLkTin0jdsw3Pu9BkmEp0O9908dtMDN_=mmgsAehgH0@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: kergoth@gmail.com
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
X-List-Received-Date: Fri, 23 Jul 2010 17:31:43 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 23, 2010 at 10:20 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Jul 23, 2010 at 2:18 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
> > 2010/7/23 Richard Purdie <rpurdie@rpsys.net>
> >
> >> On Fri, 2010-07-23 at 10:11 +0200, Koen Kooi wrote:
> >> > -----BEGIN PGP SIGNED MESSAGE-----
> >> > Hash: SHA1
> >> >
> >> > On 23-07-10 10:02, Phil Blundell wrote:
> >> > > On Fri, 2010-07-23 at 09:25 +0200, Koen Kooi wrote:
> >> > >> There is a BIG problem with these patches, they break multimachine
> >> builds.
> >> > >>
> >> > >> The previous situation had:
> >> > >>
> >> > >> cross/armv7a-angstrom-foo/usr/bin/
> >> > >> cross/armv5te-angstrom-foo/usr/bin/
> >> > >> etc
> >> > >>
> >> > >> The new situation has:
> >> > >>
> >> > >> x86_64-linux/usr/bin
> >> > >>
> >> > >> So all the toolchains get dropped into the *same* directory, which
> >> > >> breaks horribly.
> >> > >
> >> > > Which are the actual binaries that collide?  I would have thought
> that
> >> > > everything which gets installed into the cross bindir ought to be
> >> > > prefixed with TARGET_SYS (i.e. usr/bin/armv7a-angstrom-linux-gcc,
> etc).
> >> >
> >> > It's all 'arm-angstrom-foo', I was just about to make the suggestion
> to
> >> > change it to 'armv7a-angstrom-foo' :)
> >>
> >> I've just been talking to Koen about this. When building for armv7a,
> >> TARGET_ARCH which goes into TARGET_PREFIX and TARGET_SYS is "arm".
> >>
> >> I suspect if we change TARGET_ARCH to be armv7a, nasty things will
> >> happen but I could be wrong.
> >>
> >
> > I've been pondering if TARGET_ARCH should be the real arch (like armv7a)
> and
> > whether adjacent to that there should be a TARGET_ARCH_FAMILY or so.
> >
> > Changing TARGET_ARCH to armv7a without other changes definitely is going
> to
> > break things.
>
>
> maybe we should not change TARGET_ARCH but use FEED_ARCH to construct
> TARGET_SYS


Using a variable from packaging / rootfs creation as a field passed to
configure at build time strikes me as a terrible idea.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

