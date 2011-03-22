Received: from [77.233.226.4] (helo=mail.doredevelopment.dk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eha@dev.doredevelopment.dk>) id 1Q1xUI-0006zn-FM
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 10:02:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.doredevelopment.dk (Postfix) with ESMTP id 98209EB7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 10:00:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at dev.doredevelopment.dk
Received: from mail.doredevelopment.dk ([127.0.0.1])
	by localhost (public.doredevelopment.dk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id CjpddWPxhL6W
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 10:00:48 +0100 (CET)
Received: from eha (unknown [192.168.18.101]) (Authenticated sender: eha)
	by mail.doredevelopment.dk (Postfix) with ESMTPA id 8E5F5A6E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 10:00:48 +0100 (CET)
Received: by eha (Postfix, from userid 1000)
	id 6C21CA7B3D; Tue, 22 Mar 2011 10:00:48 +0100 (CET)
From: Esben Haabendal <eha@dev.doredevelopment.dk>
To: openembedded-devel@lists.openembedded.org
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<1300180117.2522.14.camel@eha>
	<1300360696.2132.14681.camel@phil-desktop>
	<1300373028.2468.8.camel@eha> <1300374439.9054.21.camel@phil-desktop>
	<1300384355.2175.13.camel@eha> <1300385153.9054.44.camel@phil-desktop>
	<1300391907.2175.23.camel@eha> <1300493886.30423.2226.camel@rex>
Date: Tue, 22 Mar 2011 10:00:48 +0100
In-Reply-To: <1300493886.30423.2226.camel@rex> (Richard Purdie's message of
	"Sat, 19 Mar 2011 00:18:06 +0000")
Message-ID: <8762rbwmv3.fsf@eha.doredevelopment.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: Eliminating dependency race-conditions
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
X-List-Received-Date: Tue, 22 Mar 2011 09:02:50 -0000
Content-Type: text/plain; charset=us-ascii

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> On Thu, 2011-03-17 at 20:58 +0100, Esben Haabendal wrote:
>> On Thu, 2011-03-17 at 18:05 +0000, Phil Blundell wrote:
>> > On Thu, 2011-03-17 at 18:52 +0100, Esben Haabendal wrote:
>> > > Well, it might be possible to minimize the disruption for a transitional
>> > > period by carefully specifying some catch-all build-time package
>> > > dependencies pulling in all packages for recipes not ported yet.
>> > 
>> > Yes, that's the sort of thing I was thinking of.  It isn't even totally
>> > obvious to me that specifying individual packages is any better than
>> > "all packages from recipe X", since with the former you then have a
>> > potential maintenance headache if files get moved from one package to
>> > another.
>> 
>> There is a number of ways that I believe package based build
>> dependencies are better than recipe based.
>> 
>> a) It is possible to depend on parts of a recipe, which fx. is useful
>> when a recipe provides more than 1 library, where you might not want all
>> of them.
>> 
>> b) To build a recipe, you depend on some stuff which you don't need to,
>> or perhaps even really don't want to pass on to recipes depending on
>> this recipe.
>> 
>> c) KISS. Using the actual target packages for satisfying build-time
>> dependencies are a very simple approach, which I strongly believe will
>> make OE a better tool in the long run, by reducing complexity, and thus
>> lowering the bar for contributing to OE archictural work.
>
> I'd like to step in here and point out that your approach is not as
> simple as you claim. It certainly is a really nice solution for one very
> specific use case.
>
> There are however many other problems which appear when you step away
> from your isolated usecase.
>
> Take the case of different package managers, how is that handled?
> Can you only have one enabled at a given time? What happens if you
> switch package manager half way through a build. Currently package
> managers and package format are abstracted, I suspect we lose that
> with your implementation. What if the package managers have slightly
> different behaviours?

In OE-lite, which is designed for a much more specific use-case than OE,
it is handled very simple.  OE-lite (currently) does not support package
managers at all.  The package format used is simple flat tarballs.  The
way I see package managers handled would be to add them on top of that.
With that I mean that the meta-data contains the necessary packaging
information, this is stored in some standardized meta-data container
stored together with the tarballs (but propbably in separate files), and
packages (RPM/dpkg/ipkg) generation would be implemented on top of that.

I don't believe it is worth the added complexity to support package
managers internally in OE-lite.

But if OE were to implement something similar, then I don't see any real
showstoppers to extending the do_stage/do_rstage functions to handle
multiple package managers.  But I believe it would be best to let
BitBake handle all the dependencie stuff as OE-lite of-course does.

> Secondly, how about task output that isn't packages?

As of now, there is no other type of output.  But I don't see any real
blockers for having non-package output.  That said, in OE-lite the goal
is to only have packages as task output.

> The output of do_deploy for example(kernel/firmware/bootloader)?

The output from do_deploy is never used by other tasks.  Instead, the
recipes that uses do_deploy can just arrange for a package to generated
with the stuff that needs by other tasks (like the things you mentioned
above).

> The pkgdata generated by do_package?

As OE-lite does not generate packages for real package managers (just
tarballs), this is currently not handled.  But I would just store it in
some way together with the tarball (fx. *.tar and *.pkgdata).

> A generic extra task added by the user which outputs some data?

Like what?

> What you're proposing is to totally actually totally collapse our
> current generic task structure into something entirely governed by
> target packages and their specific requirements.

I partly agree.  The proposal is to let target packages have a much more
central role than in current OE.  But the task structure in OE-lite is
actually very much similar to in OE, so I don't think really agree with
your wording (totally collapse).

> Of course you could say the existing mechanisms are still available

And they are.

> but then where is the simplification?

The simplification I have been trying to explain here is the fact that I
don't have to handle two different ways if dependency-handling for
build- and run-time dependencies.  They are completely identical.  Also,
I don't have to care about crafting any kind of special sysroot/sstate
packages, just target packages (tarballs).

> sstate is very simple in concept and very simple in operation compared
> to anything we've previously had.

Could be.  But my main point is that it still builds on what I believe
is a fundamentally flawed concept, ie. the idea of sharing anything
between recipes other than clearly defined entities (ie. packages).

> It is generic being task based and can apply to any task as
> required. It doesn't require radical changes to the existing model,
> there is a clear migration path

I agree on that.

> and it also embraces things like the checksum/signature generation
> which I believe are going to play a significant role in the future.

Yes, that will definitely be important in the future.  But I don't see
how checksum/signature generation is made much easier by the design
concepts being discussed here.

> This isn't to say what you're doing is wrong or that we shouldn't be
> looking at it for ideas but I believe it needs to be something
> incremental on top of what we already have and functionality we have now
> cannot simply be lost as people use it.

And that is probably the core of this discussion.

I am happy to see that there seems to be some kind of concensus that
what I am doing/showing in OE-lite has some clear merits.

So the important choice is if the absolute driving force for development
has to be that everything has to be "incremental on top of what we
already have", or it is sometimes better to replace something.

I basically does not see as much value in "incremental on top of ..." as
you do, but understand and appreciate the need for a transitional phase
for meta-data.  But these are really two different issues.  If something
(like this proposal for "real" package-based staging/sysroot) is
chosen for the OE future, a plan for transition needs to be made and
executed.  But that is not the same as to say that we cannot at the same
time replace some core parts/concepts.

/Esben


