Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q0Wqw-0004PF-Ks
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 11:24:18 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q0WpH-0003Ib-Mo
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 11:22:35 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300426143.8862.0.camel@eha>
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<1300180117.2522.14.camel@eha>
	<1300360696.2132.14681.camel@phil-desktop>
	<1300373028.2468.8.camel@eha> <1300374439.9054.21.camel@phil-desktop>
	<1300384355.2175.13.camel@eha> <1300385153.9054.44.camel@phil-desktop>
	<1300391907.2175.23.camel@eha>
	<1300395614.3026.2.camel@lenovo.internal.reciva.com>
	<1300426143.8862.0.camel@eha>
Date: Fri, 18 Mar 2011 10:26:27 +0000
Message-ID: <1300443987.9054.64.camel@phil-desktop>
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
X-List-Received-Date: Fri, 18 Mar 2011 10:24:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-03-18 at 06:29 +0100, Esben Haabendal wrote:
> Yes, I get your point.  You could of-course still specify build
> dependencies using recipe names/provides, and then just unpack all
> target packages build by that recipe.
> 
> This would give you the major part of the KISS win I see, except for in
> the dependency handling code of BitBake (and in the learning curve of OE
> developers).  Keep in mind that by using packages for build-time
> dependencies, the mechanism is exactly identical for run-time and
> build-time dependencies.  Exactly the same code in BitBake handles both,
> and the same mechanism needs to be understood.  This is also part of the
> KISS win of doing it this way.

Right.  So, it seems to me that the appropriate way to attack the
problem in OE is to start by doing exactly that: leave the syntax of
DEPENDS alone for now, treat each entry in DEPENDS as meaning "all
packages built by the named recipe", and then implement the per-recipe
sysroot construction that I think we are agreed is highly desirable.

Then, as a later refinement, we could introduce a mechanism for
specifying dependencies more precisely, at the package level rather than
the recipe level.  We could do that either by extending the syntax of
DEPENDS, something like:

DEPENDS = "boost:boost-iostreams"

(to say that you wanted just the boost-iostreams package from the boost
recipe)

or, alternately, by introducing a new variable which would either
supplement or replace DEPENDS.  Either of those would allow us to
migrate to fine-grained dependencies without breaking existing recipes.

> > (How) do you deal with library package renaming in OE-lite?
> 
> What exactly do you mean?  (We are doing several things with library
> package naming...)

I was thinking of situations like the Debian package autonamer, ie the
thing that causes glibc-dev to come out named "libc6-dev.ipk" or similar
depending on the soname of the library that was built.  It seems like
this would be a bit awkward to deal with if your dependencies were
specified purely in terms of output packages.

p.




