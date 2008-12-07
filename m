Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1L9QE5-0001HL-9m
	for openembedded-devel@openembedded.org; Sun, 07 Dec 2008 21:27:37 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20081207202344.RPJL131.fed1rmmtao107.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sun, 7 Dec 2008 15:23:44 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo01.cox.net with bizsmtp
	id oLPl1a00E1E665w03LPlzE; Sun, 07 Dec 2008 15:23:46 -0500
X-Authority-Analysis: v=1.0 c=1 a=r3GHcGUpGo4A:10 a=9VVw_kwqqekA:10
	a=eVUyA3bpAAAA:8 a=bl2yFgSlPmK1haMxm4kA:9 a=Pk9kFdsDEKtZtXi8OFgA:7
	a=ultvuMbaT9pvoPwTwcGBARI69YoA:4 a=y_8xDiJ-a8QA:10 a=MSl-tDqOz04A:10
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sun, 7 Dec 2008 13:23:56 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081207202356.GE15204@smtp.west.cox.net>
References: <c384c5ea0812061551j27c4e7eagb10e01f64d9e8668@mail.gmail.com>
	<d1b08f940812070258l25a1b54cg91b2b00a5fbafcaf@mail.gmail.com>
	<c384c5ea0812071155k45880240heba43426d39a2ff6@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <c384c5ea0812071155k45880240heba43426d39a2ff6@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: BUG? Some files in the build end up without read	permission (mostly in .pc/)
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
X-List-Received-Date: Sun, 07 Dec 2008 20:27:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 07, 2008 at 08:55:36PM +0100, Leon Woestenberg wrote:
> Hello,
> 
> On Sun, Dec 7, 2008 at 11:58 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> >
> > yes, I noticed this trying to copy the whole tmp/angstrom dir.
> >
> > permission denied   /input/keyboard/sharpsl_rc.c
> > ...input/touchscreen/tsc2101_ts.c
> > .../arm/mach-pxa/poodle_pm.c
> > ...asm-arm/arch-pxa/hx2750.h
> >
> > The whole list here:
> >
> > http://www.pastebin.ca/1278657
> >
> > I suspect this in not intended...
> >
> Thanks for the confirmation.
> 
> I have no idea where the missing permissions are created, but I
> strongly suspect a missing third argument to open(path, ...O_CREAT
> ..., );
> which typically gives these results.
> 
> 
> Anyone: is this quilt who writes these files there?

IIRC, yes.

-- 
Tom Rini


