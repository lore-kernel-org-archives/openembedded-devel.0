Received: from zmta01.irigo.dk ([193.200.44.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eha@doredevelopment.dk>) id 1PZJ9x-0003xv-9x
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Jan 2011 09:19:25 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zmta01.irigo.dk (Postfix) with ESMTP id 371F522B4834;
	Sun,  2 Jan 2011 09:19:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at zmta01.irigo.dk
Received: from zmta01.irigo.dk ([127.0.0.1])
	by localhost (zmta01.irigo.dk [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vM6yk+9jtOTi; Sun,  2 Jan 2011 09:19:00 +0100 (CET)
Received: from [192.168.1.20] (0x55532124.adsl.cybercity.dk [85.83.33.36])
	by zmta01.irigo.dk (Postfix) with ESMTP id 8B62D22B48E4;
	Sun,  2 Jan 2011 09:19:00 +0100 (CET)
From: Esben Haabendal <eha@doredevelopment.dk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1293911357.17519.17117.camel@rex>
References: <1293763348.17519.11220.camel@rex>
	<1293805474.18787.366.camel@eha>  <1293911357.17519.17117.camel@rex>
Organization: =?ISO-8859-1?Q?Dor=E9Development?= ApS
Date: Sun, 02 Jan 2011 09:18:59 +0100
Message-ID: <1293956339.18787.425.camel@eha>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: Bitbake Architecture, Roadmap, Maintainers and the future
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
X-List-Received-Date: Sun, 02 Jan 2011 08:19:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-01-01 at 19:49 +0000, Richard Purdie wrote:

> The split between the code in general in bitbake is in general ever
> improving in my opinion. Chris has some some really great work on
> bitbake recently, particularly making it more pythonic. Some of the
> changes just before the holidays, particularly the UI changes on the
> cooker to UI relationship make me uncomfortable, particularly if they
> mean the xmlrpc client/server code no longer works. My concern is that
> they cross the boundary into what I'd class as regressing an API
> boundary, particularly one that is only in the early stages of being
> properly established and that we very much need. I don't know if this is
> an API you use or not but its the kind of thing we need to be careful
> about. FWIW, its independent of the parallel parsing code and other
> changes which is partly why I'm so concerned it was merged as is :(.

While when I first heard of the xmlrpc client/server code, I was
extremely exited, believing it was a near perfect fit for OE-lite.  But
later on I had second thoughtsBut looking more into it, I don't like the
complexity it adds. I believe that projects like OE, Poky and OE-lite is
best served by a BitBake implementation that is as simple as possible,
so that as many meta-data developers as possible will dare wander off
into BitBake code land also. So BitBake code improvement in general, and
simplification of BitBake in particular is on the road to better OE like
projects IMHO.

I haven't looked into the parallel parsing code yet, but hope to find
the time for it in the not so distant future.  As I am not using the
BitBake cooker, I assume I will have to hand-carry Chris' work on this
to OE-lite.

> > As for merging with sstate, OE-lite uses a completely different staging
> > model (simple per-recipe package based), and I would be very unhappy if
> > merging sstate into BitBake will make it impossible for OE-lite to use
> > upstream BitBake.  I haven't looked enough into the sstate
> > implementation with regards to this yet though.
> 
> To put your mind at rest, there is no "policy" enforced by bitbake on
> the way staging works in sstate.

Great.  I assume also that the sstate code lives in the cooker part of
BitBake, right?

> You might find the checksums useful and
> you might be able to use them in your code but its all opt in. I'm
> therefore not worried about this breaking OE-lite.

I have a different checksums implementation, with a different
fundamental cooncept.  I do not try to figure out which variables is
(seemingly) related to a specific task, but simply checksums all
variables that is available to a task.  I plan to instead improve the
meta-data to remove unrelated variables.  This way, I don't have to
worry about calling python functions with access to the all-inclusive
'd' variable, and thus potentially voiding the generated signature.

This approach turns out to be much smaller in code size, so I am bit
reluctant to change course unless some really good technical arguments
mandates it.

> If there are
> problems, please just let us/me know and we'll see how we can fix that
> but since everything is backwards compatible, it shouldn't be an issue.

Well, as the API's I am using is not really in any form properly
formalized, I will not put to much money on BitBake staying backwards
compatible on them.

This leads to my #1 wishlist item for BitBake.  A real split between
BitBake as a parser and BitBake as a cooker (called baker in OE-lite,
just to stay in the bakery :).

Opposite to what seems to be the common belief, the current BitBake has
a rather strong linkage with OE (and thus Poky) meta-data, but all of
this seems to be concentrated in the cooker/runqueue code which has a
lot of assumptions on the dependency model used. So for a project like
OE-lite, using a different dependenncy model, the cooker/runqueue code
is not really usable. And I do not believe it would be sane to try and
code up a "super cooker" that handles multiple/any dependency models
thrown at it.  It would simply be to complex, and thereby making it
unreasonably difficult for innocent meta-data developers to figure out
what is going on. KISS.

> > Most of all, I would like to stress that there actually are other users
> > of BitBake than OE and Poky. I hope this is considered a good thing seen
> > from a BitBake perspective, and not a disturbance.
> 
> Its what the bitbake developers have always wanted/intended. It doesn't
> mean bitbake won't change as the need for functionality appears but we
> will do our best to keep things backwards compatible within reason
> (although replaced functionality will still get phased out over time if
> nobody needs it).

I feel confident that yours "within reasons" is much stronger than I
would find reasonable, so no worries here ;-)

> I would suggest it would be time well spent for you to find a way to be
> able to use a standard upstream bitbake rather than requiring any patch
> set as it will then be easier to understand what functionality and APIs
> are being used and what impact changes to bitbake have.

I actually already did 99.9% of that work.  The first work was some kind
of work-in-progress/prototype, with a lot of ugly hacking to get the
cooker/runqueue code to do what I needed.  I have now reimplemented this
entirely in OE-lite, and using an (almost) upstream BitBake for parsing
and task execution.

The main change is a rather innocent addition of recdeptask (similar to
recrdeptask, just for build dependencies), and recadeptask (a special
kind of "any" recursive dependency I need for fetchall and stuff like
that).

The __init__.py code is a fix or workaround, I would like to discuss
here on list, as I am not sure if that is a proper fix for upstream, and
if not, how to fix it properly (or if it is even considered a bug in
BitBake).

eha@fire:~/oe-lite/master/bitbake$ git diff oe/master|diffstat
 __init__.py       |    1 +
 build.py          |    2 ++
 fetch/__init__.py |    3 +++
 3 files changed, 6 insertions(+)

I should be safe and make sense to get the recdeptask/recadeptask into
upstream, but on the other hand, it is not really a big issue to keep it
in an OE-lite branch.  But having this in upstream BitBake would make it
possible for users to use any new upstream BitBake, although a big YMMV
boiler plate will have to be placed on it.

> > If possible, perhaps we could have a small BitBake meeting at FOSDEM,
> > trying to coordinate the way forward?
> 
> I think I will be at FOSDEM and as always, am happy to talk :). I don't
> think Chris is likely to be there based on previous F
> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> OSDEMs but I could
> be wrong.

With Chris being the most active BitBake maintainer right now, I hope to
find him there as well.

But I will of-course be very much interested in talking with you about
the future of BitBake anyways.  See you there!
 
/Esben



