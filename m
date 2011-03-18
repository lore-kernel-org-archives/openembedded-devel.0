Received: from zmta01.irigo.dk ([193.200.44.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eha@doredevelopment.dk>) id 1Q0SH8-0006op-An
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 06:31:03 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zmta01.irigo.dk (Postfix) with ESMTP id D05C024BD3BB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 06:29:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at zmta01.irigo.dk
Received: from zmta01.irigo.dk ([127.0.0.1])
	by localhost (zmta01.irigo.dk [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ezJK1TFfUouH
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 06:29:05 +0100 (CET)
Received: from [192.168.1.189] (0x55532124.adsl.cybercity.dk [85.83.33.36])
	by zmta01.irigo.dk (Postfix) with ESMTPSA id 0D75924C0415
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 06:29:05 +0100 (CET)
From: Esben Haabendal <eha@doredevelopment.dk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300395614.3026.2.camel@lenovo.internal.reciva.com>
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<1300180117.2522.14.camel@eha>
	<1300360696.2132.14681.camel@phil-desktop>
	<1300373028.2468.8.camel@eha> <1300374439.9054.21.camel@phil-desktop>
	<1300384355.2175.13.camel@eha> <1300385153.9054.44.camel@phil-desktop>
	<1300391907.2175.23.camel@eha>
	<1300395614.3026.2.camel@lenovo.internal.reciva.com>
Organization: DoreDevelopment ApS
Date: Fri, 18 Mar 2011 06:29:03 +0100
Message-ID: <1300426143.8862.0.camel@eha>
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
X-List-Received-Date: Fri, 18 Mar 2011 05:31:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-17 at 21:00 +0000, Phil Blundell wrote:
> On Thu, 2011-03-17 at 20:58 +0100, Esben Haabendal wrote:
> > There is a number of ways that I believe package based build
> > dependencies are better than recipe based.
> > 
> > a) It is possible to depend on parts of a recipe, which fx. is useful
> > when a recipe provides more than 1 library, where you might not want all
> > of them.
> 
> You'd still need to have built all of them (at least as far as the end
> of do_compile) though, right?

Of-course.  All recipes providing something for  a do_stage must be
build up till the do_package stage, so I can unpack the actual target
packages needed.

> In that case it doesn't seem as though
> installing the unnecessary ones in the sysroot is all that big a
> hardship.

It is not to save time, it is about controlling what goes into a build.
As many software packages scans for presence of various components
through the availability of headers and libraries, I believe it is
important to decide not just what goes into the stage directory, but
also what does not.  So in OE-lite, if I say I depend on libfoo, I do
not get foobar, just because it was built by the same recipe.

> > b) To build a recipe, you depend on some stuff which you don't need to,
> > or perhaps even really don't want to pass on to recipes depending on
> > this recipe.
> 
> Sorry, I don't understand what you're saying here.

Example:

I build recipe A.
Recipe A depends on package B-b from recipe B.
Recipe B depends on package C-c from recipe C, and D-d-native from
recipe D.
Recipe A only get's package B-b staged, unless the B-b package has
specified some build-time dependencies.

This is relevant both for target library and native tools dependencies.

> > c) KISS. Using the actual target packages for satisfying build-time
> > dependencies are a very simple approach, which I strongly believe will
> > make OE a better tool in the long run, by reducing complexity, and thus
> > lowering the bar for contributing to OE archictural work.
> 
> I agree with this, but it seems unrelated to the question of whether
> build dependencies should be specified in terms of recipes or output
> packages.

Yes, I get your point.  You could of-course still specify build
dependencies using recipe names/provides, and then just unpack all
target packages build by that recipe.

This would give you the major part of the KISS win I see, except for in
the dependency handling code of BitBake (and in the learning curve of OE
developers).  Keep in mind that by using packages for build-time
dependencies, the mechanism is exactly identical for run-time and
build-time dependencies.  Exactly the same code in BitBake handles both,
and the same mechanism needs to be understood.  This is also part of the
KISS win of doing it this way.

> > The maintenance headache you talk about is already there.  In OE-lite
> > build-time dependency 95% of the time just follow the run-time
> > dependencies, perhaps making it easier to maintain than OE, as we don't
> > have to think about another type of "item names" to depend on.
> 
> (How) do you deal with library package renaming in OE-lite?

What exactly do you mean?  (We are doing several things with library
package naming...)

/Esben




