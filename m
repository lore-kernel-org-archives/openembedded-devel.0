Received: from zmta01.irigo.dk ([193.200.44.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eha@doredevelopment.dk>) id 1Q0HOv-000145-MS
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 18:54:21 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zmta01.irigo.dk (Postfix) with ESMTP id 29E4124C01E0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 18:52:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at zmta01.irigo.dk
Received: from zmta01.irigo.dk ([127.0.0.1])
	by localhost (zmta01.irigo.dk [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1vZDFJr+9DBv
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 18:52:36 +0100 (CET)
Received: from [192.168.1.189] (0x55532124.adsl.cybercity.dk [85.83.33.36])
	by zmta01.irigo.dk (Postfix) with ESMTPSA id 0744F24C0402
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 18:52:36 +0100 (CET)
From: Esben Haabendal <eha@doredevelopment.dk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300374439.9054.21.camel@phil-desktop>
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<1300180117.2522.14.camel@eha>
	<1300360696.2132.14681.camel@phil-desktop>
	<1300373028.2468.8.camel@eha> <1300374439.9054.21.camel@phil-desktop>
Organization: DoreDevelopment ApS
Date: Thu, 17 Mar 2011 18:52:35 +0100
Message-ID: <1300384355.2175.13.camel@eha>
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
X-List-Received-Date: Thu, 17 Mar 2011 17:54:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-17 at 15:07 +0000, Phil Blundell wrote:
> On Thu, 2011-03-17 at 15:43 +0100, Esben Haabendal wrote:
> > Is OE really in a position to permantly settle for something suboptimal
> > in such a central area?
> 
> No, but rejecting the big bang doesn't mean that we can't make the
> change; it just means that we need to find a way to make the old and new
> arrangements coexist for a transition period.  This is the way every
> other architectural change in OE has been done and I don't see any
> reason that this one needs to be different.

Exactly

> 
> If we really did want to go ahead and have a metadata flag day then no
> doubt there are plenty of other things we would like to change at the
> same time.  But, thus far, this has never seemed to justify the
> disruption of breaking every recipe in both the main OE repo and third
> party overlays.

Well, it might be possible to minimize the disruption for a transitional
period by carefully specifying some catch-all build-time package
dependencies pulling in all packages for recipes not ported yet.

I think it would be much more worthwhile to put effort into this than to
push for per-recipe sysroot with the current sstate solution.

Having package-based build-time dependencies, using the same packages as
when building run-time images, is much simpler than what is currently
done in OE, while at the same time giving increased flexibility in
specifying the build-time dependencies needed for a recipe and it's
packages.

But you might have to try it out before really understanding why you
cannot live without it ;-)

> I must admit that I'm also slightly unclear about why the change in
> build dependency specifications is a prerequisite for doing per-recipe
> sysroots.

It might not be, but the result will of-course not be the same.

>Is that just an artifact of the way you implemented it in
> OE-lite or is there some fundamental constraint that means it needs to
> be this way?

I don't think there are any fundamental constraint.  Sometimes doing
things right are simply so much easier.  As a result, I already do have
a solution with both per-recipe staging/sysroot and buld-time
dependencies using target packages.  I feel pretty confident that this
was the fast path, which is sort of backed by the fact that it is done,
whereas the path (detour?) currently being worked on in OE is still just
on it's way.

/Esben




