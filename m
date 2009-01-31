Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LTLA7-0002N5-I0
	for openembedded-devel@openembedded.org; Sat, 31 Jan 2009 20:05:53 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx01.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LTL2V-0003qa-VS
	for openembedded-devel@openembedded.org; Sat, 31 Jan 2009 12:58:00 -0600
Message-ID: <49849F35.60509@dls.net>
Date: Sat, 31 Jan 2009 12:57:57 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.19) Gecko/20081209 Thunderbird/2.0.0.19 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <97574E2A-03E4-421C-8C29-21A6556D4F7E@ngndg.com>	<EE7737BC-A57D-402B-A4A5-6CB0271716C8@ngndg.com>	<498473E8.1010707@dls.net>
	<8145A528-65C8-4B2A-B7BB-D006779396B8@ngndg.com>
In-Reply-To: <8145A528-65C8-4B2A-B7BB-D006779396B8@ngndg.com>
Subject: Re: samba-3.2.5 missing
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
X-List-Received-Date: Sat, 31 Jan 2009 19:05:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Tim Ellis wrote:

> Is it right that you will want every single point release of samba I add
> then? 

You need to re-read my mail.  It is NOT about point releases, it is the
fact that you did NOT just do a point release; you added major new
dependencies and then deleted the original recipe.  It also has nothing
to do with the desirability of the new recipe -- heck it doesn't matter
if your recipe will solve global warming if it won't build.

> working with as it works for all the distros I tried it on, however this
> is a dev branch right? Occasional breakage happens sometimes, despite
> best efforts. I hope you can see the benefit in the samba cleanup as it
> was very messy and repetitive before.

I acknowleged that.  That's not the problem. And neither is a cleanup a
problem.

The problem is that you added major new dependencies in a new version
and deleted the old one.

It has nothing whatever to do with anything you're talking about -- it's
really very simple!  And don't quote OE guidelines at me either.  Please
grep for "_slugos" and other things in the recipes -- you'll find all
the places where I've taken enormous pains to ensure that the changes I
make do not risk anyone else's environment or builds.  I'm not even
asking *that much* -- I'm just asking that when someone commits a major
new recipe, that they don't delete the old one -- so that I can go
adjust my environment to build the old one until I can debug and
troubleshoot why the new one won't work.

There would be no problem at all if, in fact, your change was a minor
update - but it wasn't! You added major new dependencies in a dot
upgrade, and then deleted the original recipe.  That combination of
actions, together, is the problem.

> I will probably be able to push changes discussed at some point today,
> but after I'm happy they are all working. Normally if I get a blocker I
> would try and talk to the maintainer and remove the package until its
> fixed - I suggest you do that unless you are testing samba.

Again, I can't follow what you're saying here.  You want me to send an
email, and then wait for you to argue with me via email, and finally
commit a fix that may or may not work?  That's what we're doing, right?

But look - I've now spent more time in trying to get this all fixed, and
in discussing this than it's worth.  Really.

So just forget it completely.

I'll just commit my own samba-nokrb recipe (I recovered the old stuff
from git; it's really quite easy when one is wide awake), and we can
move on.  I'll even put it in my own package directory to avoid any
confusion.

Thanks
Mike (mwester)


