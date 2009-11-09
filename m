Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1N7Rhx-0007Wk-2Z
	for openembedded-devel@openembedded.org; Mon, 09 Nov 2009 11:42:52 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nA9AahbY026551
	for <openembedded-devel@openembedded.org>; Mon, 9 Nov 2009 10:36:43 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9K1c0wvHx860 for <openembedded-devel@openembedded.org>;
	Mon,  9 Nov 2009 10:36:42 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nA9AabkG026538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>; Mon, 9 Nov 2009 10:36:39 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Mon, 09 Nov 2009 10:36:10 +0000
Message-Id: <1257762970.29038.40.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OEDEM - Summary of some the outcome
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
X-List-Received-Date: Mon, 09 Nov 2009 10:42:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I think the OE Developer meeting was productive and there were some good
discussions. I'd like to start to share some of these with the members
and wider community as there were also some decisions made based on the
discussions and its important to place these in context.

e.V. Meeting
============

It is not my place to report on this so I will leave that to the
official minutes. I'll just say that it took place and was very
positive.

Technical Steering Committee
============================

This was mentioned during the e.V. meeting such that the e.V. board has
been asked to establish a TSC by the members. The wiki was updated with
the key parts of the discussion:
http://wiki.openembedded.net/index.php/TSC

We agreed that 5 people was a good number for this group as there could
be no vote deadlock due to the odd number and that 7 people was probably
too large. Since there are six candidates this means that we need to
vote but that gives members a choice and is therefore perhaps a good
thing. Any further candidates have a short while (a few days?) to come
forward before the board sets up and holds an online vote.

It was highlighted that the people on the TSC are expected to look into
issues and understand them so they can give an opinion so abstaining
from voting on the TSC is not going to reflect well on any person doing
that.

Its expected that people should attempt to resolve issues in the
community first. If that fails a decision can be requested from the TSC
on an issue. TSC decisions will be listed somewhere public. The TSC does
not have to be asked to take action on something, it can issue a
decision without one being requested if it fulfils the objectives and
obligations of the TSC.


Bitbake Roadmap
===============

I presented a summary of the document I sent out via email a short while
ago. In summary, the 1.8 days are coming to an end and 1.10 is now the
future plan. its objective is to sync the good bits from the master
branch client/server split so we can reduce the divergence and then we
can fix the remaining issues with master. The client/server split
remains the objective for a bitbake 2.0 release.

We have the 1.8.16 release (1.8.14 was a mess, sorry about that) and we
agreed we should bump the minimum version requirement in OE.dev so we
can start using features in there like BBCLASSEXTEND and dropping
unneeded "import bb" and "import os" statements.


OE Core Changes
===============

I put the case forward that OE needs to evolve and that other projects
are showing neat features we don't have and that are hard to add to OE
in its current state. My biggest concerns are about our staging process
as other people like e2factory have a neat checksum feature for "staging
packages" and we'd love to have them but staging is such a mess its
effectively strangling us.

Whilst in the future core changes are something the TSC will be
responsible for reaching a decision on it was felt that there was
sufficient people at OEDEM to reach a decision about some current
proposals until the TSC is established, particularly due to the presence
of TSC candidates, OE e.V. board members and members of the former OE
core team.

The proposals were:

a) Adopt the removal of the layout_* variables from Poky.
b) Change the do_populate_staging/do_stage functions to use the results 
   from the do_install step as proposed in other emails
c) Adopt the native.bbclass changes from Poky to allow use of 
   BBCLASSEXTEND = "native"
d) Start removing legacy do_stage functions and convert exclusively to 
   the new model
e) Start converting recipes to BBCLASSEXTEND = "native"
f) Merge the new canadian SDK classes from Poky and start a gradual 
   conversion to them with a view to obsoleting the existing sdk and 
   canadian recipes.
g) Rename "do_populate_staging" to "do_populate_sysroot" and 
   "TMPDIR/staging" to "TMPDIR/sysroots" to reflect how much this 
   directory has changed and to truly reflect its contents. The word 
   "staging" confuses a lot of new users in my experience.

The transition path was discussed and it was agreed that everything that
can reasonably be done has been done with regard to minimising breakage.
Phil proposed adding a staging comparison mode to the new staging
function which would help with the transition.

A target of the end of the year was set of transitioning all staging
functions and the removal of all legacy staging methods. These changes
will therefore be merged into OE.dev forthwith after a tag has been
made. It was felt it was better to get on and make the changes quickly
in one go rather than spreading them out and needing repeated testing
after each set.


Questions/comments/feedback etc. all welcome!

Cheers,

Richard





