Received: from [66.249.92.168] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JKHdC-0007fu-CL
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2008 19:25:54 +0100
Received: by ug-out-1314.google.com with SMTP id i24so403722ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2008 10:26:01 -0800 (PST)
Received: by 10.66.217.20 with SMTP id p20mr3060220ugg.51.1201717560946;
	Wed, 30 Jan 2008 10:26:00 -0800 (PST)
Received: from widy.localdomain ( [88.231.64.33])
	by mx.google.com with ESMTPS id a1sm6149671ugf.78.2008.01.30.10.25.58
	(version=SSLv3 cipher=OTHER); Wed, 30 Jan 2008 10:25:59 -0800 (PST)
Date: Wed, 30 Jan 2008 20:38:32 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080130203832.31fd5919@widy.localdomain>
In-Reply-To: <fnqakr$ffa$1@ger.gmane.org>
References: <fnqakr$ffa$1@ger.gmane.org>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.1; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: RFC: aggressive usurpation of bugs.oe.net by Angstrom
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2008 18:25:54 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Wed, 30 Jan 2008 18:03:23 +0100
Rolf Leggewie <no2spam@nospam.arcornews.de> wrote:

> Hello,
> 
> I have witnessed some aggressive usurpation of the bug-tracker by
> Angstrom devs recently, especially concerning meta-bugs.  This has to
> some extent brought back the bickering we all try to avoid.

Let's descend a bit into past then. Some time ago, Rolf Leggewie was a
Bug Overlord for OE and a new distro, which tried to make coverage of
the most hardware and software in OE, commonly known as Angstrom.
He did lot of good stuff for both users and fellow developers, taking
for himself such important, but well, ungrateful work, as triaging and
organzing bugs, and saving other developers from this, letting them
work more focused on other things. He also cooperated with other
developers on the very development work and maintenance.

As Rolf's might grow, he took more and more steps, and with less and
less drive to discuss/pay attention to other peers, which ended with
him forking (some said usurpating, but let's cut away the pathetic) an
Angstrom wiki, just because he didn't like software it runs on, and
liked some other better, and not paying attention that old wiki already
had contributions from many people, so forking (instead of for example
migration) it was not very respectful to their work as well would put
community into hurdles of the forks.

So, Rolf had an argument about this with other developer(s), and quit
in a vocal way, condemning other developers for not understanding his
best intentions of forking already scarce resource in the way he
personally liked.

But now he came back, just to find out that community recovered somehow
from Bug Overlord loss, and has setup similar, but somewhat different
process. He now tries to act as if he still was Overlord, wanting to
usurp that position back, ignoring other developments and procedures
in bugtracker. (For example, RFC of using bugtracker for Angstrom
release bug management (essentially, poor man's analogue of release
notes, as we don't resources to prepare and update those): 
http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2007-December/001147.html
)

> 
> I want to discuss this with you but cannot offer an immediate
> solution. I think the whole structure needs some reconsideration to
> make sure that different distributions don't step on each other's
> toes or one distribution claims the BTS all for itself.  The
> information in the bug tracker is there for all to share and make OE
> better.

Yes, exactly, share and not step on each other's toes - there're enough
room for that.

> 
> The problem - which I have been considering for almost a year now -
> stems from the fact that OE vs. distribution vs. on-device is not
> clearly distinguished.  bugzilla also does not allow marking two
> entries for field X.
> 
> * there are issues at time of compilation, but they can be
>   distro-specific, host-specific, foo-specific or generic
> * there are issues on-device and they can be device-specific,
>   distro-specific, foo-specific or generic
> * It is also possible that one bug exists in A* 2007 and Sharp ROM,
>   but not in A* 2008.  Currently, this is impossible to mark
> correctly.

Yes, those are all valid "advanced" cases, and if you personally have
resources to deal with them, please do.

> 
> We don't clearly distinguish and our field labels reflect that, making
> it hard for people to carve out the bugs that affect them as well as
> not step on one another when trying to resolve the problem for their
> specific distro.  launchpad for example does this much better, but
> generally sucks even more with regards to fields and searchability.
> 
> The problem partly stems from the fact that bugzilla is usually not
> used in a cross-compile environment (what does the Hardware field
> mean?, what does OS mean?).  We have tried to work around this with
> meta-bugs in the past but it becomes increasingly difficult.
> 
> So much for the status quo.  I think we eventually will need to rework
> the labels and fields and communicate their meaning more clearly, but
> I cannot present "the" solution yet.  Suggestions and discussion
> welcome.

What I would like you to ask is to not change the *internal* tree
structure (i.e. bug dependencies) of the tree rooted at 
http://bugs.openembedded.net/showdependencytree.cgi?id=3487&hide_resolved=1
(more specifically, of subtree at 
http://bugs.openembedded.net/showdependencytree.cgi?id=1573&hide_resolved=1
but some bugs may be moved in and out of 2008 tree too, so I'd like to
ask you to treat entire 2008 tree as Angstrom release status tree).

Please also look at the individual bugs as Angstrom release bugs (i.e.
as ones which are intended to be directly looked at by end users), so
please take additional care when closing them, unassociating, etc.

Those are all kind requests I have from you. For example, feel free to
build alternative structures involving all those bugs - you're welcome,
just please don't change existing dependencies *within* that tree
(tree-iness preference I wrote in one bug of course applies only to
the release tree).

Finally, if you have better ideas how to manage user-facing Angstrom
bugs, please start proposing them and then gradually making them if
they are backed (though you several times responded with different kinds
of "No" for similar invitations, so I already stopped making them just
to not hear them again). But please don't break existing structure, be
respectful to the work others did - it may be not ideal, actually, it's
merely a developers vs users compromise, optimized for maintenance
effort required.

> 
> Regards
> 
> Rolf
> 
> 

Best regards,
Paul


