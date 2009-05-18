Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M69Nq-0001s1-Pf
	for openembedded-devel@openembedded.org; Mon, 18 May 2009 22:24:27 +0200
Received: (qmail 31251 invoked from network); 18 May 2009 20:17:08 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 18 May 2009 13:17:08 -0700
Date: Mon, 18 May 2009 13:17:07 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090518201707.GL23842@smtp.west.cox.net>
References: <20090517212442.6E35A1893E6@amethyst.openembedded.net>
	<200905181716.24601.khimov@altell.ru>
	<4A11B5B4.8040804@kernelconcepts.de>
	<200905182351.06676.khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <200905182351.06676.khimov@altell.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [oe-commits] Roman I Khimov : (e)glibc-package: fix	kernel version passed to qemu
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
X-List-Received-Date: Mon, 18 May 2009 20:24:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2009 at 11:51:06PM +0400, Roman I Khimov wrote:
> On Monday 18 May 2009 23:23:32 Florian Boor wrote:
> > Hi,
> >
> > Roman I Khimov schrieb:
> > > I've not heard yet of this really breaking something. And frankly I don't
> > > see any reason for that. If it actually does - feel free to shout and
> > > scream of course, we'll think how to handle it better.
> >
> > I assume it breaks for everyone using qemu 0.9.x. I see it failing with
> > this message now:
> 
> OK, this is a problem in second patch from series, "-E" parameter was added 
> recently, dated Jan 30 2009 in qemu git. Bad, bad, bad.
> 
> How to fix that? Check QEMU version?

Use the 0.10.3 recipe and build libc for ppc, arm OABI, arm EABI and
lets drop 0.9.x crap already, in dev

-- 
Tom Rini


