Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lc0L2-00012x-4z
	for openembedded-devel@openembedded.org; Tue, 24 Feb 2009 17:40:56 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090224163752.DHSK13097.fed1rmmtao102.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 24 Feb 2009 11:37:52 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id Ksdr1b0074dMFYL04sdrxr; Tue, 24 Feb 2009 11:37:51 -0500
X-Authority-Analysis: v=1.0 c=1 a=7jsWU2tSb2dUlhi5bn4A:9
	a=cO3BRM9nevhkeVSxrzZ1KWLapY0A:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 24 Feb 2009 09:37:51 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090224163750.GJ2172@smtp.west.cox.net>
References: <200902131728.08634.openembedded@haerwu.biz>
	<20090224064639.GE2172@smtp.west.cox.net>
	<1235492001.27962.60.camel@andromeda>
	<1235492726.8911.34.camel@alap>
MIME-Version: 1.0
In-Reply-To: <1235492726.8911.34.camel@alap>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: checksums situation
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
X-List-Received-Date: Tue, 24 Feb 2009 16:40:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 24, 2009 at 09:25:26AM -0700, Angus Ainslie wrote:
> On Tue, 2009-02-24 at 17:13 +0100, Michael 'Mickey' Lauer wrote:
> > Am Montag, den 23.02.2009, 23:46 -0700 schrieb Tom Rini:
> > > I'm going to make a different suggestion.  Lets just drop it. 
> > 
> > I'm in favour of this. I don't think they give us the safety we want and
> > they introduce more inconvenience.
> > 
> > Cheers,
> > 
> 
> Couldn't the default be a stern warning if the checksums don't match and
> distro's that want it could change it to an error ?

That's not what's causing heartburn.  What's causing it is the far more
sources than checksums we have today.  Which got me thinking that (as I
said just now in another email) we have a system that's fine for
checking if the tarball changed under me, but worthless for "are the
sources what upstream says they should be", ie guarding against trojans.

-- 
Tom Rini


