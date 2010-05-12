Received: from cassiel.sirena.org.uk ([80.68.93.111] ident=Debian-exim)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <broonie@sirena.org.uk>) id 1OCFFD-0007ga-9N
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 18:57:15 +0200
Received: from broonie by cassiel.sirena.org.uk with local (Exim 4.69)
	(envelope-from <broonie@sirena.org.uk>) id 1OCFBT-0001j3-0h
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 17:53:23 +0100
Date: Wed, 12 May 2010 17:53:22 +0100
From: Mark Brown <broonie@sirena.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100512165322.GC4312@sirena.org.uk>
References: <4BE13C20.1010902@dresearch.de> <4BE81DE7.90609@dresearch.de>
	<1273518881.22943.378.camel@trini-m4400>
	<4BE90A56.3090605@dresearch.de>
	<1273588024.22943.391.camel@trini-m4400>
	<4BEA448D.5060008@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <4BEA448D.5060008@dresearch.de>
X-Cookie: Used staples are good with SOY SAUCE!
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 80.68.93.111
X-SA-Exim-Mail-From: broonie@sirena.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Kernel Headers Quality Issue
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
X-List-Received-Date: Wed, 12 May 2010 16:57:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 12, 2010 at 08:02:53AM +0200, Steffen Sledz wrote:
> 11.05.2010 16:27, Tom Rini wrote:

> -> autotools report availability of some syscalls (e.g. inotify_init1 or epoll_create1)
> -> apps can use them
> -> if called on older kernels glibc will handle this "gracefully"
> -> fine

> But tests showed that glibc did not handle syscalls this way.

It does but...

> Then you wrote that *every app* itself is responsible to handle syscalls
> which are reported by autotools (linux-libc-headers) as *available* but

...what it does not do is emulate syscalls which are being used by
applications directly.  There are a bunch of kernel features which are
used by glibc internally - for those it will just use fallbacks at
runtime.  For things like epoll which are used directly by applications
it's up to the application to decide if it is willing or able to cope on
older systems.  For many kernel features there's no sane possibility of
emulation.

> are *not available* ? I can't believe that. This sounds absurd for me.

glibc is frequently built for systems other than the one it runs on
(obviously, OE is a big example here) so it needs to support building
against a kernel other than the running one, and there's plenty of cases
even with desktop/server systems where it's useful to be able to link
against features which can't be run (eg, user installs old kernel for a
binary driver, or a vendor wants to distribute a binary which can
optionally use newer features but still run on older systems).


