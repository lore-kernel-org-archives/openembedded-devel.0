Received: from [77.233.226.4] (helo=public.doredevelopment.dk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eha@doredevelopment.dk>) id 1Q0Yjl-0006SU-Pf
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 13:25:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by public.doredevelopment.dk (Postfix) with ESMTP id 697B951B7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 13:15:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at dev.doredevelopment.dk
Received: from public.doredevelopment.dk ([127.0.0.1])
	by localhost (public.doredevelopment.dk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id PbTOy6omjuz4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 13:14:56 +0100 (CET)
Received: from eha (unknown [192.168.18.101])
	by public.doredevelopment.dk (Postfix) with ESMTP id 6B41040F9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 13:14:56 +0100 (CET)
Received: by eha (Postfix, from userid 1000)
	id 4AC4DAA113; Fri, 18 Mar 2011 13:14:56 +0100 (CET)
From: Esben Haabendal <eha@doredevelopment.dk>
To: openembedded-devel@lists.openembedded.org
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<1300180117.2522.14.camel@eha>
	<1300360696.2132.14681.camel@phil-desktop>
	<1300373028.2468.8.camel@eha> <1300374439.9054.21.camel@phil-desktop>
	<1300384355.2175.13.camel@eha> <1300385153.9054.44.camel@phil-desktop>
	<1300391907.2175.23.camel@eha>
	<1300395614.3026.2.camel@lenovo.internal.reciva.com>
	<1300426143.8862.0.camel@eha> <1300443987.9054.64.camel@phil-desktop>
Date: Fri, 18 Mar 2011 13:14:56 +0100
In-Reply-To: <1300443987.9054.64.camel@phil-desktop> (Phil Blundell's message
	of "Fri, 18 Mar 2011 10:26:27 +0000")
Message-ID: <87ei6439rz.fsf@eha.doredevelopment.dk>
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
X-List-Received-Date: Fri, 18 Mar 2011 12:25:01 -0000
Content-Type: text/plain; charset=us-ascii

Phil Blundell <philb@gnu.org> writes:

> On Fri, 2011-03-18 at 06:29 +0100, Esben Haabendal wrote:
>> Yes, I get your point.  You could of-course still specify build
>> dependencies using recipe names/provides, and then just unpack all
>> target packages build by that recipe.
>> 
>> This would give you the major part of the KISS win I see, except for in
>> the dependency handling code of BitBake (and in the learning curve of OE
>> developers).  Keep in mind that by using packages for build-time
>> dependencies, the mechanism is exactly identical for run-time and
>> build-time dependencies.  Exactly the same code in BitBake handles both,
>> and the same mechanism needs to be understood.  This is also part of the
>> KISS win of doing it this way.
>
> Right.  So, it seems to me that the appropriate way to attack the
> problem in OE is to start by doing exactly that: leave the syntax of
> DEPENDS alone for now, treat each entry in DEPENDS as meaning "all
> packages built by the named recipe", and then implement the per-recipe
> sysroot construction that I think we are agreed is highly desirable.

By doing it this way, I don't think we are getting much closer to the
second step (package-based build-time dependencies).  The OE-lite
implementation of per-recipe staging builds on top of package-based
build-time dependencies, so to do it the other way around, would imply
taking the sstate concept and extend it to do per-recipe sysroots.
After that, I believe you have exactly the same amount of development
left to get where OE-lite is in respect to package-based build-time
depencies and per-recipe staging.

As I see it, package-based build-time dependencies practically obsoletes
sstate.  So if we for a moment imagine that we have moved OE to have
sstate based per-recipe staging, we still have the same amount of work
to do in the following areas:

* Modifying BitBake and OE metadata to handle package-based build-time
  dependencies
* Modifying existing recipes to include package-based build-time
  dependency information

You can see the per-recipe staging as a postive side-effect of the
package-based build-time dependency implementation.

So why take the detour instead of just doing it?

> Then, as a later refinement, we could introduce a mechanism for
> specifying dependencies more precisely, at the package level rather than
> the recipe level.  We could do that either by extending the syntax of
> DEPENDS, something like:
>
> DEPENDS = "boost:boost-iostreams"
>
> (to say that you wanted just the boost-iostreams package from the boost
> recipe)

That is IMO just adding more cruft to OE.  Not really what we need.

> or, alternately, by introducing a new variable which would either
> supplement or replace DEPENDS.  Either of those would allow us to
> migrate to fine-grained dependencies without breaking existing recipes.

Sounds better.

Also, just as for run-time dependencies, the build-time package
dependencies is not necesarely the actual package names, but some
provides names, so having a "recipe:package" syntax really does not make
much sense.

>> > (How) do you deal with library package renaming in OE-lite?
>> 
>> What exactly do you mean?  (We are doing several things with library
>> package naming...)
>
> I was thinking of situations like the Debian package autonamer, ie the
> thing that causes glibc-dev to come out named "libc6-dev.ipk" or similar
> depending on the soname of the library that was built.  It seems like
> this would be a bit awkward to deal with if your dependencies were
> specified purely in terms of output packages.

As OE-lite is not OE, we are currently not supporting such type of
package renaming.  Let's leave that to Debian guys to fight with ;-)

But as we build-time dependencies are typically in the form of some
package "provides", it doesn't really matter if the package is renamed.

/Esben


