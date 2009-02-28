Received: from [68.230.241.43] (helo=fed1rmmtao103.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LdTzj-0001NV-G1
	for openembedded-devel@openembedded.org; Sat, 28 Feb 2009 19:33:03 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090228182920.ZLPN4363.fed1rmmtao103.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sat, 28 Feb 2009 13:29:20 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id MWVK1b0024dMFYL04WVKfb; Sat, 28 Feb 2009 13:29:19 -0500
X-Authority-Analysis: v=1.0 c=1 a=w2fQQtqhE8cA:10 a=fsJ8Y90igy4A:10
	a=wMNdZWldAAAA:8 a=CUuKp0Jf44b_SPOxft4A:9 a=tYKfo8lunnFiNdBhMH0A:7
	a=A7TwK_zXX6RVWjfUwf3PEEXB9BsA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sat, 28 Feb 2009 11:29:19 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090228182919.GK5420@smtp.west.cox.net>
References: <ac9c93b10902260920s24a8c5we592cbb4d0d63221@mail.gmail.com>
	<c384c5ea0902270806n70ce6bbfg45d19b5ebaf64050@mail.gmail.com>
	<20090227162633.GD5420@smtp.west.cox.net>
	<ac9c93b10902280254j3ac8533bod972dfd150b46621@mail.gmail.com>
	<20090228155335.GJ5420@smtp.west.cox.net>
	<ac9c93b10902281007h3e063b81u63bbad13419c5d6c@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b10902281007h3e063b81u63bbad13419c5d6c@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: OE breakages, was: Re: fakeroot fails to build
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
X-List-Received-Date: Sat, 28 Feb 2009 18:33:04 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Feb 28, 2009 at 07:07:55PM +0100, Frans Meulenbroeks wrote:
> 2009/2/28 Tom Rini <trini@kernel.crashing.org>:
> > On Sat, Feb 28, 2009 at 11:54:46AM +0100, Frans Meulenbroeks wrote:
> > [snip]
> >> Not sure whether it will be easy to make a build env with chroot
> >> (although I know debian does something like that).
> >
> > Having done this, yes.  It's basically using deboostrap to setup a new
> > system, then for Ubuntu use aptitude and mark everything auto-installed
> > except ubuntu-minimal and ubuntu-standard.  Then use (and update)
> > the OEAndYourDistro wiki page + bitbake to see what other host stuff you
> > must bring in.  Vanilla Debian would be, I think, just a different set
> > of meta packages.
> 
> I've used debootstrap in the past, but was not too sure whether it
> could also do a cross build.
> If it can I would say such a solution would make it a lot easier to
> port packages.

It sounds like you want something slightly different, a target env setup
on your host.  In a limited sense (ARM only) OpenBossa folks have done
this.

> What also could speed up starting from scratch is if you can download
> a binary build environment.
> Currently if you remove your tmp dir it takes hours and hours to build
> things like gcc, glibc, etc etc

Depends on your build box :)  I've been playing with PARALLEL_MAKE and
BB_NUMBER_THREADS and on a dual dual core box (2 dual core
processors) -j 4 / 4 gives me my SDK targets (Linux and MinGW) in under
2 hours.  I'm still tweaking the numbers however to see if I can get it
down to 90min.

Tangentally, packaged staging _can_ help here, but it's not I believe,
relocatible (unless you assume-provided some -native packages and
possibly we've fixed what we're doing wrong with gcc configure args).
IOW, if you build in, /OE/tmp you can't re-use the packaged staging
packages in /home/me/OE/tmp

-- 
Tom Rini


