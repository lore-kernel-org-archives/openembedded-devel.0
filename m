Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q0jtu-0005O1-Mq for openembedded-devel@lists.openembedded.org;
	Sat, 19 Mar 2011 01:20:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2J0ISkD015214
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Mar 2011 00:18:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15169-01 for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Mar 2011 00:18:24 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2J0INIx015208
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Mar 2011 00:18:24 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300391907.2175.23.camel@eha>
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<1300180117.2522.14.camel@eha>
	<1300360696.2132.14681.camel@phil-desktop>
	<1300373028.2468.8.camel@eha> <1300374439.9054.21.camel@phil-desktop>
	<1300384355.2175.13.camel@eha> <1300385153.9054.44.camel@phil-desktop>
	<1300391907.2175.23.camel@eha>
Date: Sat, 19 Mar 2011 00:18:06 +0000
Message-ID: <1300493886.30423.2226.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Eliminating dependency race-conditions (was Re: [PATCH] net-snmp: disable libnl use)
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
X-List-Received-Date: Sat, 19 Mar 2011 00:20:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-17 at 20:58 +0100, Esben Haabendal wrote:
> On Thu, 2011-03-17 at 18:05 +0000, Phil Blundell wrote:
> > On Thu, 2011-03-17 at 18:52 +0100, Esben Haabendal wrote:
> > > Well, it might be possible to minimize the disruption for a transitional
> > > period by carefully specifying some catch-all build-time package
> > > dependencies pulling in all packages for recipes not ported yet.
> > 
> > Yes, that's the sort of thing I was thinking of.  It isn't even totally
> > obvious to me that specifying individual packages is any better than
> > "all packages from recipe X", since with the former you then have a
> > potential maintenance headache if files get moved from one package to
> > another.
> 
> There is a number of ways that I believe package based build
> dependencies are better than recipe based.
> 
> a) It is possible to depend on parts of a recipe, which fx. is useful
> when a recipe provides more than 1 library, where you might not want all
> of them.
> 
> b) To build a recipe, you depend on some stuff which you don't need to,
> or perhaps even really don't want to pass on to recipes depending on
> this recipe.
> 
> c) KISS. Using the actual target packages for satisfying build-time
> dependencies are a very simple approach, which I strongly believe will
> make OE a better tool in the long run, by reducing complexity, and thus
> lowering the bar for contributing to OE archictural work.

I'd like to step in here and point out that your approach is not as
simple as you claim. It certainly is a really nice solution for one very
specific use case.

There are however many other problems which appear when you step away
from your isolated usecase.

Take the case of different package managers, how is that handled? Can
you only have one enabled at a given time? What happens if you switch
package manager half way through a build. Currently package managers and
package format are abstracted, I suspect we lose that with your
implementation. What if the package managers have slightly different
behaviours?

Secondly, how about task output that isn't packages? The output of
do_deploy for example(kernel/firmware/bootloader)? The pkgdata generated
by do_package? A generic extra task added by the user which outputs some
data?

What you're proposing is to totally actually totally collapse our
current generic task structure into something entirely governed by
target packages and their specific requirements. Of course you could say
the existing mechanisms are still available but then where is the
simplification?

sstate is very simple in concept and very simple in operation compared
to anything we've previously had. It is generic being task based and can
apply to any task as required. It doesn't require radical changes to the
existing model, there is a clear migration path and it also embraces
things like the checksum/signature generation which I believe are going
to play a significant role in the future.

This isn't to say what you're doing is wrong or that we shouldn't be
looking at it for ideas but I believe it needs to be something
incremental on top of what we already have and functionality we have now
cannot simply be lost as people use it.

Cheers,

Richard




