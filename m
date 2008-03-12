Received: from [66.249.92.173] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1JZYb7-00082M-Mv
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 22:34:56 +0100
Received: by ug-out-1314.google.com with SMTP id i24so533125ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 14:32:48 -0700 (PDT)
Received: by 10.151.15.3 with SMTP id s3mr4830822ybi.143.1205357566799;
	Wed, 12 Mar 2008 14:32:46 -0700 (PDT)
Received: from widy.localdomain ( [88.231.54.215])
	by mx.google.com with ESMTPS id l33sm1405060ugc.67.2008.03.12.14.32.44
	(version=SSLv3 cipher=OTHER); Wed, 12 Mar 2008 14:32:45 -0700 (PDT)
Date: Wed, 12 Mar 2008 23:34:17 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080312233417.0a20762c@widy.localdomain>
In-Reply-To: <c384c5ea0803121326r631bf595v72126de8c7905835@mail.gmail.com>
References: <200803110807.11368.zecke@selfish.org>
	<20080311114938.GM30267@ibawizard.net>
	<f96d234e0803110712t6d88dfc6t521fdf39081e2c76@mail.gmail.com>
	<20080311145739.GN30267@ibawizard.net>
	<1205250588.4521.111.camel@dax.rpnet.com>
	<20080312014945.4783ae6a@widy.localdomain>
	<1205280598.16531.26.camel@dax.rpnet.com>
	<20080312024408.44d9192e@widy.localdomain>
	<c384c5ea0803121138r4bf89729t18c530b67e80c107@mail.gmail.com>
	<fr997r$aat$1@ger.gmane.org>
	<c384c5ea0803121326r631bf595v72126de8c7905835@mail.gmail.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 66.249.92.173
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Wed, 12 Mar 2008 21:34:56 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Wed, 12 Mar 2008 21:26:30 +0100
"Leon Woestenberg" <leon.woestenberg@gmail.com> wrote:

> Hello Koen, all,
> 
> On Wed, Mar 12, 2008 at 8:00 PM, Koen Kooi
> <koen@dominion.kabel.utwente.nl> wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> >  |
> > http://lists.freedesktop.org/archives/cairo/2006-February/006255.html
> > | | His arguments on the (main two) differences strongly favors me
> > to move | to GIT, not HG.
> >
> >  Actually it shows that hg fits better into the OE way of using a
> > DSCM: central repo (and mirrors) with distributed developers.
> >
> Quoting Carl: "Namely, it [hg] appears to force a more centralized,
> (or at least, a more strictly hierarchical), model on the development
> process, while git allows a more fully distributed model making it
> easier for users to pull (even speculatively with "fetch") from
> multiple sources, track them in the local repository as separate
> branches and merge when appropriate."
> 
> Carl carefully uses the words "force" and "allows". Git does not
> preclude a central model, whilst still allowing more centralized
> development.

Well, in practice it happens not exactly that way. In practice, git
proponents happen to overestimate universal usefulness of some of git
features, and underestimate problems those feature may bring in some
cases, and yet use those features to push git's superiority.

I find one of the links among those posted by Cliff Blake very good
display of that:
http://www-cs-students.stanford.edu/~blynn/gitmagic/ch04.html . That's
generally good read, I personally love lively and literary style, but
well, gentleman's idea why git is cool appears to be based on following
facts: 1) git was the first system SCM system he used (at all appears
- we apparently have new generation of developers growing, who don't
know what CVS is. LOL, or sigh.); 2) his Internet connection sucks.

> And the centralized way we work currently is also DUE to us using mtn,
> i.e. it forces us more or less to work this way.

No, centralized way is due to way humans form communities. Linux kernel
is also works that way. Only Linus' repo is Linux kernel, anything else
is just somebody's hacks on that.

> Is that the desired way? Yes, for us it might be. For 3rd party
> vendors it might not be. They might want to run their own GIT repo,
> but keep pulling from OE (or vice versa).

That can be done with any DSCM, and could be done with mtn.

> My view at the desired model:
> - central repository with mirrors
> - lightweight branches for the active developers so that intrusive
> changes can be worked on in parallel, but shared fashion.
> - easy push/pull/cherrypick from cloned repositories branches, given
> that we might see more and more vendors stepping into the OE
> bandwagon.
> 
> Some thoughts:
> - Why wouldn't the kernel model work for us? There is one upstream
> tree and distributed developers.

Isn't that how we work already? Don't let me guess, but give myself as
example - I'm working on some things over long period of time, then
long period of time may pass before they are pushed to central repo.
Isn't that what you mean by "distributed"? Or if there're no
"lightweight branch" stamp, it's not distributed.

> - Suppose we were using GIT today, would we consider going to HG or
> MTN?

Who knows?

> - Suppose we were using HG today, would we consider going to GIT or
> MTN?

Who knows?


Getting answers for questions like above are exactly why I participate
in this discussion. I missed previous switchover, but I'm trying to
grasp what exactly happens now and why? What has happened recently
which wasn't the case a year ago? Why we get big amounts of strange
confessions that people don't participate well enough in OE and hate it
because of it - now, if it was so for couple of years? Newcomers
suffered mtn *all* the time, I myself coming in 1.5 years had lots of
gore with it, thought gradually it *improved*, not become worse.

Unfortunately, the only reasonable answer I have for myself is that
coredevs finally ate some of Monotone fun. So, users' complaints were
of no avail, but feeling it on own skin is better. So, they hasted to
move somewhere. But where? I have strong suspicion that where it's more
easier and comfortable to them, users' needs and troubles might be
ignored again.

Well, we have by now we broke preconception that git is the *only*
choice to migrate too, and possible situation that hg was mentioned in
the initial mail for sole purpose of emulating pluralism. So, even if
git will be chosen (which is quite likely), then at least we can be sure
that wasn't done blindly, without understanding what that choice would
mean.

> 
> Proposal: Can we work with MTN and GIT, or MTN and HG in parallel?
> I.e. each developer has to do everything DOUBLE, has two checkouts
> against two SCM systems, and then learn in practise what works best?
> :-)


Hopefully not. But one of the outcome of this discussion may be  that
core devs ask the original proposer to evaluate both choices in more
detail before hasting with the switch. (Note that I personally don't
seek such result or want to complicate proposer's task. But I would
really like to know what to answer people who will hit this or that
tool issues, and I do come at such situations regularly - far more
frequent than I'd like, so knowing that needs and troubles of "mere"
users were ignored during selection, doesn't help me at all with
doing community support.)

> 
> 
> Regards,
> -- 
> Leon


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


