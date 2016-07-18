Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 92740606D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 07:52:09 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1bP3LU-00028g-P5 for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2016 09:52:09 +0200
Received: from p5DE8CA75.dip0.t-ipconnect.de ([93.232.202.117])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 09:52:08 +0200
Received: from patrick.ohly by p5DE8CA75.dip0.t-ipconnect.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 09:52:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Patrick Ohly <patrick.ohly@intel.com>
Date: Mon, 18 Jul 2016 07:51:55 +0000 (UTC)
Message-ID: <loom.20160718T094851-958@post.gmane.org>
References: <20160622163845.29573-1-danismostlikely@gmail.com>
	<loom.20160711T131713-153@post.gmane.org>
	<CACS+7ZQ_GxdipW4exewtzfyK2nrDFR2=jHJ83d_Ze=@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 93.232.202.117 (Mozilla/5.0 (X11; Linux x86_64;
	rv:38.0) Gecko/20100101 Firefox/38.0 Iceweasel/38.7.1)
Subject: Re: [meta-java][PATCH] openjdk-8: make GCC6 happy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jul 2016 07:52:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Dan McGregor <danismostlikely <at> gmail.com> writes: 
> On 11 July 2016 at 05:29, Patrick Ohly <patrick.ohly <at> intel.com> wrote:
> > Dan McGregor <danismostlikely <at> gmail.com> writes:
> >> From: Daniel McGregor <daniel.mcgregor <at> vecima.com>
> >>
> >> GCC 6 sets the default C++ standard to C++14 and introduces dead store
> >> elimination by default. OpenJDK 8 is not ready for either of these
> >> changes, so set the C++ standard back to gnu++98 and disable dead
> >> store elimination.
> >>
> >> Switched to using --with-extra-cflags, cxxflags, and ldflags. The added
> >> patch fixes building when using those flags, and are needed to get
> >> CFLAGS into the JDK build in the native case.
> >
> > Has anyone tested this on a host system where gcc is still 4.x, like 4.9.2
> > on Debian Wheezy?
> >
> > I'm finding that -fno-lifetime-dse is also getting passed to the gcc used
> > for compiling native binaries (obviously in openjdk-8-native, but also for
> > some helper executables in openjdk-8). This then breaks the compilation
> > because older gcc rejects that flag.
> >
> > I've briefly toyed with the patch below which worked for openjdk-8-native,
> > but not for openjdk-8. I'm just going to work around it by staying on gcc
> > 5.x and clearing these extra flags.
> >
> > I'm not familiar enough with the openjdk-8 build process to propose a better
> > solution, but perhaps someone else has an idea?
> >
[...]
> This regex doesn't work in the cross case because the version string
> doesn't start with "gcc". It starts with '<target-triple>-gcc', so
> that should be checked instead.
> 
> I'll fiddle with this patch some more. It looks like a good short-term
> solution to building OpenJDK on GCC 4 hosts.

Thanks for taking this further. But please really test on such an older 
system, because the patch alone is not enough. Something also needs to
be done when configuring openjdk-8 such that it uses different flags
when invoking the host compiler (old gcc) and the target compiler (gcc 6).

I haven't found a solution for that (not familiar enough with the Java
build system).

Bye, Patrick


