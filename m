Received: from cassiel.sirena.org.uk ([80.68.93.111] ident=Debian-exim)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <broonie@sirena.org.uk>) id 1OEAVX-0004O0-I0
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 May 2010 02:18:05 +0200
Received: from broonie by cassiel.sirena.org.uk with local (Exim 4.69)
	(envelope-from <broonie@sirena.org.uk>) id 1OEARh-0003qd-NX
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 May 2010 01:14:05 +0100
Date: Tue, 18 May 2010 01:14:05 +0100
From: Mark Brown <broonie@sirena.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100518001404.GB9592@sirena.org.uk>
References: <4BE13C20.1010902@dresearch.de> <4BE81DE7.90609@dresearch.de>
	<1273518881.22943.378.camel@trini-m4400>
	<4BE90A56.3090605@dresearch.de>
	<1273588024.22943.391.camel@trini-m4400>
	<4BEA448D.5060008@dresearch.de>
	<1273750831.18119.498.camel@mill.internal.reciva.com>
	<4BED1EFC.7010905@dresearch.de>
	<1273832754.18119.691.camel@mill.internal.reciva.com>
	<4BED36A8.6070602@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <4BED36A8.6070602@dresearch.de>
X-Cookie: Put your trust in those who are worthy.
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 80.68.93.111
X-SA-Exim-Mail-From: broonie@sirena.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Tue, 18 May 2010 00:18:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 14, 2010 at 01:40:24PM +0200, Thilo Fromm wrote:

>> Yes.  Or, if this is performance critical code, you can cache the result
>> (since the kernel is unlikely to suddenly gain support for a syscall
>> that it didn't have last time) and go directly to the implementation
>> that works.

> This would mean that checking for kernel features (e.g. inotify_init1())  
> at compile time via an application's configure.ac is pointless, right?  
> Because configure will report availability of this interface even though  
> it won't be there when the application runs. In other words, everything  
> configure is telling me about kernel features (native kernel thread  
> availability, inotify, sysfs, ...) might be false anyway. Code like this

If you know that you are running on the same system as you are using for
the build you *can* write a configure check which actually tries to call
the syscall (and will therefore check for -ENOSYS) but obviously this
can't be relied upon if someone runs the binary on another system or
changes the configuration of the current system.

>> Clearly you don't like the idea very much but yes, this is basically how
>> backwards compatibility code is done, and it is more or less an
>> inescapable consequence of the rather fluid nature of the Linux syscall
>> ABI.

> I don't like your proposal... but not from an application programmer's  
> POV, but from the perspective of a system integrator (i.e. a  
> distribution maintainer). I think just assuming that your proposal is  
> true for every application I need to integrate would be a mistake and  
> devastating to a distribution's overall quality.

This is something that Linux distributions (and any other system
integrator working over multiple OS releases) have always had to deal
with.  If you're shipping a binary which may run in a different
environment to the one it was built in this has always been a
possibility.


