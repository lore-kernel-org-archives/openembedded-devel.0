Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id D15FA71633
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jan 2015 23:52:34 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1YBXjk-0007Lp-9H for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jan 2015 00:52:33 +0100
Received: from 212-41-66-29.adsl.solnet.ch ([212.41.66.29])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 00:52:32 +0100
Received: from max.oss.09 by 212-41-66-29.adsl.solnet.ch with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 00:52:32 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Wed, 14 Jan 2015 23:52:19 +0000 (UTC)
Message-ID: <loom.20150115T002923-253@post.gmane.org>
References: <54B220B0.8070609@gmail.com> <54B222F2.4070802@gmail.com>
	<loom.20150113T130012-516@post.gmane.org>
	<20150113132422.GJ18240@mail.itconsulting-heinold.de>
	<CAP9ODKocqaD+cXFba28jxXyd75aRmWnpwNY3NNx1wVY4Q3wVuA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 212.41.66.29 (Mozilla/5.0 (X11; Linux x86_64;
	rv:34.0) Gecko/20100101 Firefox/34.0)
Subject: Re: Query on meta-java layer openjdk-7-jre build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Jan 2015 23:52:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Otavio, Henning

Otavio Salvador <otavio <at> ossystems.com.br> writes:

> 
> Hello Max,
> 
> On Tue, Jan 13, 2015 at 11:24 AM, Henning Heinold
> <henning <at> itconsulting-heinold.de> wrote:
> > On Tue, Jan 13, 2015 at 01:02:01PM +0000, Max Krummenacher wrote:
> >> > I have OpenEmbedded setup and using the daisy branch. For the meta-java
> >> layer I
> >> > am using the master branch of
> >> http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/.
> >> >
> >> > For our embedded modules we have our own meta layer. I am trying to build
> >> > an angstrom image with LXDE.
> >> >
> >> > We are using ARMv7 hard-float Thumb2 builds (armv7at2hf-vfp). Most errors
> >> seems
> >> > to be "not declared in this scope" errors. Are there some definitions to
> >> be
> >> > declared in the conf file, so the build picks it up or is some
modification
> >> > required to the source with a custome patch declared in the bb file for
> >> this?
> >> I have run into the same issues.
> >>
> >> This are follow up errors. The failing qemu-arm runs should have produced
> >> header files which provide those definitions.
> >>
> >> >
> >> > Not much knowledge on OpenEmbedded. Also can someone explain the qemu
> >> segmentation
> >> > fault errors?
> >> see above
> >>
> >> > Trying to build openjdk-7-jre gives me the following error. A complete
> >> log file is also attached.
> >> >
> >> > Can someone give me any pointers on how can I get the build to be
> >> successful for
> >> > using Java?
> >>
> >> My investigation showed that qemu-arm can not execute any binary which is
> >> compiled with the compiler for Colibri-T20 and is linked with the -static
> >> flag.
> >> Even a simple hello world program does not work. When executing that hello
> >> world on the real hardware I also get a segmentation fault.
> >>
> >> I got java compiling and running by updating to the latest of meta-java,
> >> applying the patch which enables xawt and applying a patch which compiles
> >> all binaries without the -static flag. Compiling with dynamic linking
> >> however produces a binary which run on qemu-arm and on the target.
> >> Currently I have no idea why statically linked binaries fail.
> >>
> >
> > Hi Max,
> >
> > thanks to investigate this and now it make some sense why qemu is
collapsing.
> > To notice I switched to static builds long ago
> > because the qemu-calls did not worked with the shared compiled
executables. Now
> > it looks like the other way around. And we maybe should consider to
switch back
> > to shared library builds.
> 
>  Can you prepare a patchset for it?
> 

I'm not really convinced that reverting the static linking is a good
approach as obviously something failed when linking dynamically.

Both mails which reported the issue with the failing qemu-arm run were built
for colibri-t20. The Tegra T20 SOC is a bit special as it does not have a
Neon unit. Plus our standard setup uses angstrom which builds the linaro
toolchain with thumb2 support.

So the failing builds are failing with an unusual oe toolchain configuration
and the root cause is the toolchain. 
I'm unsure if risking the failing builds with dynamic linking poping up
again justifies fixing the build failures in an unusual configuration.

If you don't think so I can prepare a patch, no problem.

Regards
Max




