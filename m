Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1N7t05-00031E-Ez
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 16:51:24 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1N7sua-0004ES-7c
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 15:45:40 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1N7sua-0006rt-46
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 15:45:40 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2009 15:45:36 +0000
Message-Id: <1257867936.1484.281.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OEDEM 2009 summary: Future plans for stable branch(es)
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
X-List-Received-Date: Tue, 10 Nov 2009 15:51:24 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Here's a summary of the stable branch session from last weekend's
meeting.  This was a somewhat long and wide-ranging session; I have
summarised it to the best of my recollection but corrections from other
attendees are welcome.

--

The current "stable" branches are considered by some as being still too
unstable to build a product on.  There is a perception that the
stable/2009 branch still tracks the .dev tree more closely than would be
expected of a truly stable branch.  This seems to be due, at least in
part, to a desire to be able to cherry-pick patches verbatim from
the .dev tree into stable/2009 after suitable review.

Philip Balister pointed out that the current "stable" philosophy does
fit the needs of some users.  General agreement that there are multiple
valid approaches and users should be free to pick the one that suits
them best.

What would a "more stable" branch look like?  Proposal:

- goal is monotonically increasing quality: primary criterion for
checkins should be not making anything worse for other users.

- branch should be long-lived although we expect checkin activity to
drop off as time goes by. 

- new packages, and new versions of existing packages, are acceptable so
long as they don't change anything else.  Branch users are expected to
lock down their preferred versions and hence adding new versions is
"safe".

- removal of packages is unacceptable

- disruptive changes to existing packages are unacceptable unless
measures are taken to mitigate the damage.  For example, when a package
is split, must provide a dummy package under the old name which depends
on all the new ones.

- definitely no global ABI changes unless in the form of a new DISTRO

- accept that the stable branch will diverge from .dev and that
cherry-picking patchsets is not always going to be feasible.  

- also accept that some issues which have an elegant fix in .dev may
require a different (and maybe more cumbersome) fix in stable due to
core class differences.

- also accept that there is some truth in "stable == stale" and the
stable branch will not have all the newest stuff that is available in
the dev tree.

- users of the branch should be able to "git pull" without worrying
whether their build will still work afterwards

How to create new stable branches?

- the .dev tree is a melting pot of many distros with different agendas
and release cycles, and there is currently no single governing authority
for that branch (though the TSC should help to fill that gap).
Attempting to stabilise .dev in place before branching is going to be a
losing proposition.

- instead, proposal to simply cut new stable branches on a defined
timescale (eg every six months), stabilise the tree on the branch for a
further period, and then declare it "released".

- several attendees spoke up to say that this is basically what they do
already for internal company use.  If we can find a way to share this
effort then it would reduce the amount of duplicated work.

- is there enough manpower to make this feasible?  Given the number of
companies who seem to be maintaining their own stable branches
internally, it seems as if manpower should be available.

Making now-private branches public would help with collaboration.  Maybe
this is a first step to having a common stable branch.

What to do about stability in .dev?

[see also "OE and poky" and "splitting the trees" discussions which
overlapped with this one to quite a large extent]

- accept that .dev branch will not always be stable and that folks with
overlays and the like may be better off using a stable branch of some
description.

- however, note that some groups (eg sharprom-compat) have been driven
away from OE in the past because their ABI requirements could not be met
in the .dev tree.  We should try to support such people in the future.

- General agreement that features such as ARM oabi should not be removed
just because they are no longer fashionable.  However, no need for
heroic efforts to keep them working.

- RP: important not to let backwards compatibility stand in the way of
progress; development tree needs to move forwards.  There will come a
point where old stuff cannot be sensibly maintained and must be deleted:
e.g. old gcc versions do not support sysroot which is needed for staging
nowadays.

- Phil B: agreed, but would prefer to keep old versions working as long
as there is little/no cost in doing so.

- KG: lots of old cruft in tree makes it hard for new users to find
examples of best current practice.

- Phil B: can we move the cruft out of sight rather than deleting it?
Punt this to discussion on splitting the tree.

Buildability of .dev

- learn from poky: pick a core set of packages, plus one or two
DISTRO/MACHINE tuples, and run frequent regression tests on them to make
sure they don't break.  Can we leverage tinderbox/oestats to do that?

- "bitbake world" is not expected to work in .dev tree and confuses new
users.  Agreed that documentation should not recommend this command.
Also note that bitbake itself encourages user to do "bitbake world" if
given silly instructions: can this be stopped?

--

p.




