Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LyuPq-0004Bo-Aj
	for openembedded-devel@openembedded.org; Tue, 28 Apr 2009 23:00:34 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090428205520.XKUK10385.fed1rmmtao107.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 28 Apr 2009 16:55:20 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id l8vL1b0094dMFYL038vLC0; Tue, 28 Apr 2009 16:55:20 -0400
X-Authority-Analysis: v=1.0 c=1 a=FWpWOkutOBYA:10 a=GclPNJOSj40A:10
	a=ZkfgYe9bbhQ5YjfCQh0A:9 a=BhSxu5EzzIZCihcPY_uipCLzhSUA:4
X-CM-Score: 0.00
Date: Tue, 28 Apr 2009 13:55:20 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090428205520.GV18788@smtp.west.cox.net>
References: <20090427141943.GG18788@smtp.west.cox.net>
	<20090428203009.GH26082@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20090428203009.GH26082@gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [RFC] Bring PREFERRED_LIBC to all distros
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
X-List-Received-Date: Tue, 28 Apr 2009 21:00:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 28, 2009 at 01:30:09PM -0700, Khem Raj wrote:
> On (27/04/09 07:19), Tom Rini wrote:
> > Hey all.  I've created a new branch, trini/add-libc-overrides which does
> > the following:
> > - Make every distro declare PREFERRED_LIBC, either outright or
> >   overridable.
> 
> may be you should call it something like SYSTEM_LIBC

OK, will rework and get a new branch up sometime soon.

> > - For Angstrom/foonas have DISTROVAR ?= ${PREFERRED_LIBC},
> >   PREFERRED_LIBC ?= default
> > - Add conf/distro/include/{eglibc,glibc,uclibc}.inc that have:
> >   - Add 'glibc' to OVERRIDES for eglibc/glibc and 'uclibc' for
> >     uclibc.inc
> 
> what about klibc so some distro's use klibc too ?

Not that I could see.  At least not as the only libc.

> > That last change was required so that a number of distros would parse
> > without trying to build say both glibc_2.3.3 and glibc_2.9 (for
> > virtual-libc-dev) when I ran bitbake -g meta-toolchain minimal-image.
> > 
> > The next step, once something like this goes in, would be to change all
> > of the overrides that test for uclibc (or glibc) from
> > linux/linux-gnueabi vs linux-uclibc/linux-uclibcgnueabi to just
> > linux_glibc vs linux_uclibc.
> 
> only those two ? or one for each libc we have.

Until eglibc / glibc need different overrides, there's no need to have
them be different.  uClibc isn't always done correctly however as you
have to catch both (ie the USE_NLS thing in the gcc recipes isn't right
for every version).  And if we add another libc, we'll add another
override of course.

-- 
Tom Rini


