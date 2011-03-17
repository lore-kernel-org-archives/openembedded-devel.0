Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q0KKb-0004oS-8L
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 22:02:05 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q0KIx-000369-0T
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 22:00:23 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300391907.2175.23.camel@eha>
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<1300180117.2522.14.camel@eha>
	<1300360696.2132.14681.camel@phil-desktop>
	<1300373028.2468.8.camel@eha> <1300374439.9054.21.camel@phil-desktop>
	<1300384355.2175.13.camel@eha> <1300385153.9054.44.camel@phil-desktop>
	<1300391907.2175.23.camel@eha>
Date: Thu, 17 Mar 2011 21:00:14 +0000
Message-ID: <1300395614.3026.2.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
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
X-List-Received-Date: Thu, 17 Mar 2011 21:02:05 -0000
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

You'd still need to have built all of them (at least as far as the end
of do_compile) though, right?  In that case it doesn't seem as though
installing the unnecessary ones in the sysroot is all that big a
hardship.

> b) To build a recipe, you depend on some stuff which you don't need to,
> or perhaps even really don't want to pass on to recipes depending on
> this recipe.

Sorry, I don't understand what you're saying here.

> c) KISS. Using the actual target packages for satisfying build-time
> dependencies are a very simple approach, which I strongly believe will
> make OE a better tool in the long run, by reducing complexity, and thus
> lowering the bar for contributing to OE archictural work.

I agree with this, but it seems unrelated to the question of whether
build dependencies should be specified in terms of recipes or output
packages.

> The maintenance headache you talk about is already there.  In OE-lite
> build-time dependency 95% of the time just follow the run-time
> dependencies, perhaps making it easier to maintain than OE, as we don't
> have to think about another type of "item names" to depend on.

(How) do you deal with library package renaming in OE-lite?

p.



