Received: from [209.85.134.186] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1IaKWi-0001WC-5N
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Sep 2007 02:13:16 +0200
Received: by mu-out-0910.google.com with SMTP id w9so2568403mue
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2007 17:08:46 -0700 (PDT)
Received: by 10.86.93.17 with SMTP id q17mr49420fgb.1190765326329;
	Tue, 25 Sep 2007 17:08:46 -0700 (PDT)
Received: from ?192.168.20.110? ( [82.193.99.11])
	by mx.google.com with ESMTPS id 28sm139514fkx.2007.09.25.17.08.45
	(version=SSLv3 cipher=OTHER); Tue, 25 Sep 2007 17:08:45 -0700 (PDT)
Date: Wed, 26 Sep 2007 03:08:44 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1162450671.20070926030844@gmail.com>
To: "Mike (mwester)" <mwester@dls.net>
In-Reply-To: <0be701c7ffbf$cc912850$6e01a8c0@twilight>
References: <8c7950360709231220o100ae1d6i2582e20398b04521@mail.gmail.com><1190628401.6176.39.camel@localhost.localdomain><46F79A90.6090709@student.utwente.nl>
	<8c7950360709240636r523b582dx89a7706682776117@mail.gmail.com>
	<0be701c7ffbf$cc912850$6e01a8c0@twilight>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Adding support for DirectFB across the board
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
X-List-Received-Date: Wed, 26 Sep 2007 00:13:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Mike,

Wednesday, September 26, 2007, 1:02:43 AM, you wrote:

> Another ugly issue has reared its head.  This occurred with the OpenMoko
> build, but will affect most other distros as well.  The problem is that as
> far as bitbake is concerned, there is absolutely no difference between
> pango-directfb-1.18.1 and pango-1.18.1, at least in terms of their ability
> to satisfy dependencies.

> Thus, the simple act of creating pango-directfb-1.18.1.bb was enough for new
> builds to select pango-directfb instead of the pango recipe -- so the same
> build that worked yesterday morning fails in various ways now.  On a
> positive note, at least the problem of incorrect recipe selection is
> discovered at build time that way -- if it built without error it is
> possible that the same build done today will have a radically different
> binary image than one done yesterday, and would go undetected until the
> binary failed.  Note that existing build environments are fine; the
> selection of pango vs pango-directfb has already been done, and bitbake will
> be happy that the dependency on pango is met.

> My first thought was to place my favorite magic incantation (PREFERENCE =
> "-1") in the pango-directfb recipe, but that matters not.  Even such
> powerful magic cannot overcome this problem.

  I faced this issue too and chatted about it with Richard Purdie, but
I believe it isn't even submitted as as bitbake bug. But in general,
this should be the right and the most logic solution - unless
PREFERRED_PROVIDER explicitly selects some variant, one with higher
preference should be used, not random.

> Consulting with the experts on #oe, it seems that the only solution is to
> add "PREFERRED_PROVIDER" lines for every distro that explicitly select which
> recipe they want.   I simply deleted the *-directfb recipes so I could get
> the build running, as time was not on my side -- I had 6 hours of build time
> to catch up on from this problem.

> A few questions, then:

> First, this fails the principle of "least surprise".  How is it that when I
> specify a dependency on "pango" that the "pango.bb" recipe is ignored and
> the "pango-something-different.bb" recipe is used instead?  That's just not
> logical.  Shouldn't bitbake select the one who's name matches exactly, when
> all else is equal?

  Mildly good heuristic too, but using DEFAULT_PREFERENCE would be even
better.

> Is it really necessary that pango-directfb and pango provide the same thing,
> from a "PROVIDES" point-of-view?

  Apparently yes, as they provide the same facility/functionality, but
different implementation of it. It is the essence of PROVIDES. And we
shouldn't give up this idea simply because current version of
OE/bitbake doesn't do it right.

>   A simple change in name would avoid this
> problem completely.  I think we're just asking for confusion, and the
> problems that stem from confusion, by having multiple somethings that claim
> to provide the same thing.

> If it is, in fact, necessary that these two recipes provide the same things,
> then since one is clearly in early development and can destabilize so many
> different distros, then why can we not use a branch to do the initial
> testing and development, with a scheduled merge to the mainline so that the
> distros are all alerted to the need to verify and test when major changes
> happen?   This is a pet peeve of mine - we seem to have frequent "events"
> that result in mass build breakage where the only fix is to have  everyone
> delete their tmp directories, resync, and build from scratch!  As a
> stockholder in Intel, I am grateful for the resulting increased demand for
> quad-core CPUs, but as a developer, each of these surprise events takes a
> full day of productivity away.  I think all of us value the time we spend on
> this hobby, and doing disruptive changes on a branch in isolation just seems
> to me to be a respectful, and decent thing for each developer to do as part
> of being a community member.  JMNSHO.

  With a good chance, that won't improve integral productivity of OE
developers, just will make breakages "more scheduled". At least not
before we'll make tools and conventions right.

> Finally, can we have bitbake be a bit more "in your face" about its
> decisions when there are no external criteria provided?  A warning to say
> "Hey! I've just selected "pango-directfb" to satisfy the dependency for
> "pango" -- but you should know that "pango" would equally-well satisfy the
> dependency, and I picked one only because you didn't provide any hints to
> select one over the other!"?

  That's exactly what it does - it says something like "Consider
defining PREFERRED_PROVIDER". It's notice though, IIRC.

> Thanks,
> Mike (mwester)

[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



