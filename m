Received: from [209.242.20.84] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwester@dls.net>) id 1IaIZ8-0000GL-9x
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Sep 2007 00:07:42 +0200
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id 990C5412462
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2007 17:03:15 -0500 (CDT)
Message-ID: <0be701c7ffbf$cc912850$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
References: <8c7950360709231220o100ae1d6i2582e20398b04521@mail.gmail.com><1190628401.6176.39.camel@localhost.localdomain><46F79A90.6090709@student.utwente.nl>
	<8c7950360709240636r523b582dx89a7706682776117@mail.gmail.com>
Date: Tue, 25 Sep 2007 17:02:43 -0500
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1807
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1896
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
X-List-Received-Date: Tue, 25 Sep 2007 22:07:44 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Another ugly issue has reared its head.  This occurred with the OpenMoko
build, but will affect most other distros as well.  The problem is that as
far as bitbake is concerned, there is absolutely no difference between
pango-directfb-1.18.1 and pango-1.18.1, at least in terms of their ability
to satisfy dependencies.

Thus, the simple act of creating pango-directfb-1.18.1.bb was enough for new
builds to select pango-directfb instead of the pango recipe -- so the same
build that worked yesterday morning fails in various ways now.  On a
positive note, at least the problem of incorrect recipe selection is
discovered at build time that way -- if it built without error it is
possible that the same build done today will have a radically different
binary image than one done yesterday, and would go undetected until the
binary failed.  Note that existing build environments are fine; the
selection of pango vs pango-directfb has already been done, and bitbake will
be happy that the dependency on pango is met.

My first thought was to place my favorite magic incantation (PREFERENCE =
"-1") in the pango-directfb recipe, but that matters not.  Even such
powerful magic cannot overcome this problem.

Consulting with the experts on #oe, it seems that the only solution is to
add "PREFERRED_PROVIDER" lines for every distro that explicitly select which
recipe they want.   I simply deleted the *-directfb recipes so I could get
the build running, as time was not on my side -- I had 6 hours of build time
to catch up on from this problem.

A few questions, then:

First, this fails the principle of "least surprise".  How is it that when I
specify a dependency on "pango" that the "pango.bb" recipe is ignored and
the "pango-something-different.bb" recipe is used instead?  That's just not
logical.  Shouldn't bitbake select the one who's name matches exactly, when
all else is equal?

Is it really necessary that pango-directfb and pango provide the same thing,
from a "PROVIDES" point-of-view?  A simple change in name would avoid this
problem completely.  I think we're just asking for confusion, and the
problems that stem from confusion, by having multiple somethings that claim
to provide the same thing.

If it is, in fact, necessary that these two recipes provide the same things,
then since one is clearly in early development and can destabilize so many
different distros, then why can we not use a branch to do the initial
testing and development, with a scheduled merge to the mainline so that the
distros are all alerted to the need to verify and test when major changes
happen?   This is a pet peeve of mine - we seem to have frequent "events"
that result in mass build breakage where the only fix is to have  everyone
delete their tmp directories, resync, and build from scratch!  As a
stockholder in Intel, I am grateful for the resulting increased demand for
quad-core CPUs, but as a developer, each of these surprise events takes a
full day of productivity away.  I think all of us value the time we spend on
this hobby, and doing disruptive changes on a branch in isolation just seems
to me to be a respectful, and decent thing for each developer to do as part
of being a community member.  JMNSHO.

Finally, can we have bitbake be a bit more "in your face" about its
decisions when there are no external criteria provided?  A warning to say
"Hey! I've just selected "pango-directfb" to satisfy the dependency for
"pango" -- but you should know that "pango" would equally-well satisfy the
dependency, and I picked one only because you didn't provide any hints to
select one over the other!"?

Thanks,
Mike (mwester)

On 9/24/07, shanevolpe@gmail.com wrote:
> Thanks for the feedback.  I have a couple more questions:
>
> First should I go into all the pango packages and also add
> RCONFLICTS="pango-directfb".  If I should do that can I just and it to
> the pango.inc and override it in pango-directfb with
> RCONFLICTS="pango-directfb"
>
> Second, I have a situation were if you build directfb-1.0 and then
> build directfb-1.1.0 there will be library files for both of them in
> staging.  This is an issue because it seems some packages may use the
> 1.0 libs and others will use the 1.1 libs causing issues on the target
> board which is running 1.1.0.  How should I handle this,  I want to
> completely remove directfb-1.0 from the staging area when directfb-1.1
> is installed.
> Regards,
> Shane
>
>
> On 9/24/07, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > Richard Purdie schreef:
> > > On Sun, 2007-09-23 at 15:20 -0400, shanevolpe@gmail.com wrote:
> > >> I have been adding in support for directFB to as many packages as
> > >> possible, however one issue I have ran into several times is what do
I
> > >> do when there are packages that can be compiled with X11 or directfb
> > >> support and then what do you do with packages that may depend on a
> > >> package compiled with directfb or X11.  Ok that was pretty confusing,
> > >> let me give an example.
> > >>
> > >> I have added cairo-directfb which compiles cairo with directfb
instead
> > >> of X11.  Next I wanted to add (update) gtk+-directfb to use
> > >> cairo-directfb instead of cairo.  That part was easy I just changed
> > >> the DEPENDS cairo in gtk+-directfb to cairo-directfb..  The issue
came
> > >> when I noticed that gtk+ also requires pango which requires cairo so
> > >> what do I do here, do I make a new pango called pango-directfb?  It
> > >> seems like the better thing would be set up a virtual/cairo and set
it
> > >> to either cairo or cairo-directfb.  If I go that route how do I set
it
> > >> up so it does not break everyone's build that does not have
> > >> virtual/cairo set, is there a way to default it to something like
> > >> cairo?
> > >
> > > The thing you need to consider is that pango compiled with a standard
> > > cairo is a different package to pango compiled with cairo-directfb.
> > >
> > > The virtual namespace is used to show things that are equivalent and
> > > pango is different to pango-directfb since I couldn't interchange
them.
> > >
> > > You therefore need to create a pango-directfb, ugly as that may be
(.inc
> > > files can minimise the ugliness though).
> >
> > Don't forget to add RCONFLICTS statements, since the resulting binary
has the same name (IIRC)
> >
> > regards,
> >
> > Koen



