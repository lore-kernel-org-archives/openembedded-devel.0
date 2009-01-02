Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LIbsN-0003LZ-ML
	for openembedded-devel@openembedded.org; Fri, 02 Jan 2009 05:43:12 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090102043729.CFCN2948.fed1rmmtao101.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 1 Jan 2009 23:37:29 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id yUdT1a00F1E665w04UdUu9; Thu, 01 Jan 2009 23:37:28 -0500
X-Authority-Analysis: v=1.0 c=1 a=ZR6E0IMnSakA:10 a=KxA903fidDMA:10
	a=2NGaf0j8IZ3pZ44fqj4A:9 a=ZhPYUrLdNigM_wKTqicA:7
	a=Iz5fw2j01pJF8EC2nlcXPY2WYA4A:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Thu, 1 Jan 2009 21:37:55 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090102043755.GC400@smtp.west.cox.net>
References: <1230827114.5320.42.camel@dax.rpnet.com>
	<20090101182526.GF7040@smtp.west.cox.net>
	<1230840687.5320.56.camel@dax.rpnet.com>
	<20090101220229.GH7040@smtp.west.cox.net>
	<1230858713.10424.4.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1230858713.10424.4.camel@dax.rpnet.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Native/Cross/SDK rethink (Was: Re: RFC: "Virtual" native and	sdk recipes)
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
X-List-Received-Date: Fri, 02 Jan 2009 04:43:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 02, 2009 at 01:11:53AM +0000, Richard Purdie wrote:

[snip]
> Ideally I want to be able to generate a Linux 32 bit toolchain, a Linux
> 64 bit toolchain and a windows one. If I can do that using canadian-sdk,
> the current -sdk stuff can be removed.

It's a theory, and not one I've tested (and I know it won't work _today_
as there's some hard-coded C:\ paths right now.  Those can die if we
build it properly relocatible like CodeSourcery does).

> I'm not sure the one bitbake invocation is going to work though or is
> desirable.

Well, here's my usage.  Right now, we produce an SDK for a specific
target.  It's quite handy that I can do a 'bitbake sdk-release' and
that builds me my Linux SDK in one file, my Windows SDK in another.  I
could live if I had to do 'bitbake linux-sdk-release && bitbake
windows-sdk-release' if I must.  But I'm lazy :)

> I just had a look through the trini/canadian-sdk branch and there are
> bits I like and bits I dislike. I'll try and provide some feedback in
> due course with a view to getting the less controversial bits merged. I

Great, thanks.

> have some tweaks in poky to do with dynamic library extension handling
> for example (from playing with darwin targets) where it would pay us to
> find a common solution.

Sounds good.

> More fundamentally I'm actually very nervous about something here which
> is very difficult to put into words but I'll try. To do this, I'd like
> to take a step back and think about how this should work. Our "normal"
> OE usage has HOST == TARGET where the value is determined by MACHINE.

I think saying the current usage is "BUILD == HOST" would be more
correct.  But I see what you're saying.  We set a machine (which sets
our output target) and assume everything we're building will run on the
machine that's doing the building (and only that machine, which is why
I've switched to doing all my builds inside a minimal Ubuntu chroot.
Hit a few dep issues I need to try and sort out properly sometime w/
ext2 stuff).

> With the introduction of Canadian where BUILD != HOST != TARGET we
> obviously need one more input. 

Yes.  We stop assuming BUILD == HOST, as it may or may not.

> Correct me if I'm wrong but your approach seems to assume MACHINE is the
> TARGET value? If so we may be missing an opportunity.

Yeah.  But it seems to me that's what we always do.  It's currently
always a "build to run on this machine" or "build to run on the target
machine".  But I think I see what you're saying and agree.

> Lets for a second make the decision that MACHINE is actually the HOST
> value. This makes sense in that everything we usually build is to run on
> the HOST. From here we only need to add gcc-canadian recipe which builds
> a compiler that runs on HOST but targets a different TARGET to normal to
> have our BUILD != HOST != TARGET.

Right.  We  get that in the current Canadian stuff, just using different
variable names, I think.  I _think_ if the new SDK_foo variables were
set right, it would in fact kick out a working Linux SDK.

> This does reverse the logic that the current sdk class we use however
> since MACHINE is now the machine we want to run the compiler on, not the
> machine we want to compile for. It should be simple enough to add some
> MACHINEs and version setups which correspond to a Linux 32 bit system, a
> Linux 64 bit system and a windows system though. Assuming the choice of
> TARGET for gcc-canadian is controlled by a variable like SDKTARGET, to
> run the builds I'd want, I'd run:
> 
> MACHINE=i686-generic   SDKTARGET=armv5te-generic bitbake gcc-canadian
> MACHINE=x86-64-generic SDKTARGET=armv5te-generic bitbake gcc-canadian
> MACHINE=winxp-generic  SDKTARGET=armv5te-generic bitbake gcc-canadian

Or 'meta-toolchain-sbox' for an existing SDK type target.

> By contrast, the scheme you are aiming for (as I understand it) would
> be:
> 
> MACHINE=armv5te-generic SDKARCH=i686-generic   bitbake gcc-canadian
> MACHINE=armv5te-generic SDKARCH=x86-64-generic bitbake gcc-canadian
> MACHINE=armv5te-generic SDKARCH=winxp-generic  bitbake gcc-canadian

With a "but I'm lazy and we'll just re-use current SDK recipes for
the first choice, canadian for the second and, what? a third choice?
la-la-la I can't hear you!".  The biggest hiccup I see here is my usage
would be more like (using current machine.conf's):
MACHINE=qemux86 SDKTARGET=db1200 bitbake meta-toolchain-sbox

> Can you see the point I'm making here? If not I'll try again tomorrow
> after some sleep! :)

I think so.  Right now what's bugging me personally the most is the
non-relocatible SDK toolchain, which once fixed could let us kill off
much of the -cross stuff.  Build the SDK version and then use that to
build our regular stuff, always.

> Also note why I don't see this being possible to combine into one
> bitbake command, much the same way you can't build 10 machines with one
> bitbake command.

Trying to get more than one machine into an SDK is something else I've
pondered, but only lightly so far.

-- 
Tom Rini


