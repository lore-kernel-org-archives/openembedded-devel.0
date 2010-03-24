Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NuYSA-0001Eq-Jj
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 22:49:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2OLkJwU029389
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Mar 2010 21:46:19 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29264-03 for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Mar 2010 21:46:15 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2OLkAUg029383
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Mar 2010 21:46:11 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b11003241317y2f6a6bbbs78936ee603d8ce3b@mail.gmail.com>
References: <1269437224.1681.134.camel@rex>
	<ac9c93b11003240815o796152a7y50601b03e91be40@mail.gmail.com>
	<b6ebd0a51003240851i3f91860ia1100c4677569cf6@mail.gmail.com>
	<ac9c93b11003241317y2f6a6bbbs78936ee603d8ce3b@mail.gmail.com>
Date: Wed, 24 Mar 2010 21:46:07 +0000
Message-ID: <1269467167.1681.169.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Checksums in Bitbake
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
X-List-Received-Date: Wed, 24 Mar 2010 21:49:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-03-24 at 21:17 +0100, Frans Meulenbroeks wrote:
> 2010/3/24 Chris Larson <clarson@kergoth.com>:
> > On Wed, Mar 24, 2010 at 8:15 AM, Frans Meulenbroeks <
> > fransmeulenbroeks@gmail.com> wrote:
> >
> >> Interesting ideas.
> >> I need to let this digest a little  bit.
> >>
> >> Some initial thougths
> >> The checksum should also depend on the checksum of the underlying
> >> packages. E.g. if A depends on B and the checksum of B changes it
> >> should trigger a rebuild of A.
> >>
> >
> > I don't think this is a very good idea, personally.  As an option, perhaps,
> > but we do things the way we do for a reason, just because a dep of mine is
> > rebuilt doesn't automatically require that I be rebuilt.  I'd suggest moving
> > to an alternative which encodes the library ABI and incorporates that into
> > the hashes of things that depend upon it, but we can certainly do what you
> > want as an optional feature.
> 
> If a dep is rebuild there is a reason for it (bug fix, packaging
> changed, changes in exported files etc etc).
> This might impact the using recipe.
> If baking a file does not result in a rebuild when a dependency is
> changed, probably a warning should be given.
> 
> Encoding the library ABI is only part of the job. You'd also have to
> take the .h files a package exports into account as constants in it
> could be changed.
> And even the using package could change its behaviour (e.g. because
> configure runs differently).
> Note also that if we abandon PR we do not really have an easy
> mechanism to force recompilation of a package (if a depenency changed
> and we want to force a rebuild).

Its worth noting you can enable this now with BB_STAMP_POLICY. I see
something similar being the likely outcome with checksums. Some people
will want the full dependency tree, some people won't. We can support
both just as we do now.

> > Global variables should absolutely be included, imo.  The reason for going
> > with a blacklist rather than a whitelist approach is to, as richard says,
> > make it less error prone.  It ensures that the failure mode is something
> > being rebuilt, rather than using possibly incorrect binaries.  I'd rather it
> > take a bit longer to build than result in questionable output.  If
> > calculating the checksum time becomes a concern, which I doubt, you could
> > hash the configuration metadata at ConfigParsed time and incorporate that
> > hash into the hash generated of the recipe.  This could increase the
> > likelihood of collisions, but I'm not too worried.  Let's get things
> > working, and determine the bottlenecks at that point.
> 
> Agree, but as changes in vars are less likely we could consider having
> something to DISTRO_PR.
> My nightmare is that if I am going to build console-image (about 3000
> tasks) that it goes to check 3000 times if my TMPDIR is not changed.
> Some caching will definitely be needed

The checksums are likely to be constructed at parsing time. Compared to
the cost of building the datastore I'm hopeful the cost of building the
checksum will be low. The current caching algorithms will rebuild the
checksums when needed just fine.

Cheers,

Richard




