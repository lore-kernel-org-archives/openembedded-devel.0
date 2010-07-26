Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OdVPP-0005Ho-As
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 23:40:29 +0200
Received: by qyk32 with SMTP id 32so2634487qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 14:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=LkJTTqOsAbc/iWsSsrt3Zp5oUBYEvGiF5SK41P5NWuE=;
	b=eXCQFerE9ifftbRBlCUklf043l1Me5N/1JCvZW0ova3FPVc2zmKur15nkt+BE0lhVt
	dPZZh+ldbxYVVsD/GC5GvMgUAk4px+VOnPkIfxWZQCW7wRLdO6H9h6zZB6ePUZRNTMCX
	/LawDa8rJKWcShPmjmVwJrV78ULpuHj+JETCs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=p6rVjNEEA8Iox5j6sUwNA5/mSk1KUCmtcHSn8eGfM4l5wAbfQffDXp4D0KgqKK1pgH
	JvxVpenVM+c5r/bjcaefNKZdN9Mkdpx5PpLxaX7KQywe1O3oLqJt4ZaFb55LY5MZg/06
	w9PSTIxC7mPpHDL96ifUrjeQqYozkDG9HZv8o=
Received: by 10.224.3.6 with SMTP id 6mr6568715qal.128.1280180410253; Mon, 26 
	Jul 2010 14:40:10 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.236.80 with HTTP; Mon, 26 Jul 2010 14:39:50 -0700 (PDT)
In-Reply-To: <AANLkTiks5W-tPf=D=Qo5UZf77ZA2R10=fkw2MmdeWfHc@mail.gmail.com>
References: <AANLkTim5aAnNi5VFs7=-gg1XaM=+KBeUs-G494SEbR+V@mail.gmail.com> 
	<AANLkTiks5W-tPf=D=Qo5UZf77ZA2R10=fkw2MmdeWfHc@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 26 Jul 2010 14:39:50 -0700
X-Google-Sender-Auth: uN63tTOufkLO75igmvChCUs2W_8
Message-ID: <AANLkTinuoVzs556HmdOx-y1tMd6YB58NgPtoEhqma4HO@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] get rid of legacy staging
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
X-List-Received-Date: Mon, 26 Jul 2010 21:40:29 -0000
Content-Type: text/plain; charset=UTF-8

The way bitbake works today, it can't build *anything* unless it's parsed
*everything*, because anything could have PROVIDES / RPROVIDES what you're
wanting to build.  If you want to shift things to a server, which I agree
would be nice, you'd have to have a daemon running there to make available
the full dependency information.

On Mon, Jul 26, 2010 at 1:59 PM, C Michael Sundius <msundius@sundius.com>wrote:

> every time I see a conversation on this list that says something to the
> effect of "we have xxx number of recipes that do this" or "if we make this
> sort of change we'll have to change yyy number of recipes" I cringe. I ran:
>
> [msundius@msundius-lnx1 recipes]$ find . -type f | grep "\.bb$" | wc
>   8581    8581  276766
> [msundius@msundius-lnx1 recipes]$ ls -1 | wc
>   2023    2023   18851
>
> 8500 recipes just doesn't seem like a scalable number of recipes to manage
> w/ our development community. Its problematic for the following reasons:
>
> 1) making a change that affects compatibility is difficult if not
> impossible
> 2) most people working w/ embedded distros want only a small percentage of
> this beast
> 3) building involves bitbake parsing all of these recipes before going to
> do
> the tree of what actually needs to be built.
> there are probably more complaints from the masses
>
> It seems to me that we need to decouple in a formal way the recipes from OE
> (classes and config files) and from each other.
> I am proposing that we do the following:
> - that we define exactly what it means to conform to a particular version
> of
> the OE Recipe API (or whatever you call it).
> - that we "fetch" recipes from well known repositories/mirrors (or locally)
> in the same way we fetch tarballs.
> - we parse recipes as we build the dependency tree.
>
> That way we don't have to look through the entire list 8500 recipes
> (parsing
> them all) before we build our tiny little embedded application that
> controls
> a refrigerator's ice making machine or whatever you make.
>
> For us, we simply don't use most of all of the recipes and I have found it
> hard to manage the disparity of the entire official tree vs the recipes
> that
> we use. I have simply created my own (sub)tree that is a subset to the
> greater tree.
>
> I also like the idea that we would be able to append our own configuration
> data patches etc for selected standard recipes (that could be "fetched"
> from
> somewhere) so that we would not really have to merge all of those specifics
> of our own system into the repository of recipes used by the whole world
> (i.e. noone cares about the busybox config file we use or a patch to the
> kernel to fix a dumb thing our HW engineers did). somthing akin to the
> .bbappend discussion as of late
>
> I realize that this is off topic here. I also am not qualified to propose
> how to implement such a solution. I'm just wondering if that might have
> already occurred to any of us that there's a fundamental issue that
> detracts
> us from creating a truly independent build framework. I'm also not trying
> to
> be a complainer.. I've been thinking about this for a long time and I'd
> like
> to help... I'm just not that good  w/ python :]
>
> Back to the discussion at hand, If we have a (versioned) compatibility
> standard for recipes then we could simply bump the number and exclude old
> recipes until their maintainer or someone who needed it, got around to
> upgrading the recipe.
>
> Mike
>
> On Sat, Jul 24, 2010 at 2:57 AM, Frans Meulenbroeks <
> fransmeulenbroeks@gmail.com> wrote:
>
> > Dear all,
> >
> > The topic of legacy staging has been on the table for probably 8 months
> or
> > so.
> > Still we have a lot of recipes that use legacy staging.
> > This email tries to stir up the discussion on how to get rid of these.
> >
> > Most of the major recipes seem to be converted.
> > Koen reported 53 recipes with legacy staging after building
> > angstrom-gnome-image and openjdk. [1]
> > This seems an indication that lots of common and actively used recipes
> are
> > converted.
> > However there are still 1100+ recipes and about 150 .inc files that have
> a
> > do_stage rule [2]
> >
> > This indicates that quite some work is still needed.
> > Let's have a look at the options. What I see as possibilities are:
> >
> > A: accept that we will have lots of recipes around that use legacy
> staging
> > B: update and test all recipes (at least up to the level that it is
> > verified
> > that the files stage properly after removing the legacy staging
> > C: with a sed script or so remove all do_stage functions and hope the
> best
> > for it.
> > D: remove the recipes that still use legacy staging as apparently no-one
> is
> > enough interested in them to update them.
> >
> > Let us now look at the pro's and con's of these possiblities:
> >
> > From the various calls to fix this that I have seen on the mailing list A
> > is
> > not really too desired.
> >
> > B would be nice, but is a hell lot of work. With 1100 recipes, 150 inc
> > files
> > and 5 minutes per recipe, this takes about 100 hours.
> > Even with one minute per recipe it would be about 20 hours.
> > Given that lots of the recipes for which this applies seem to be rarely
> > used
> > or are older versions of recipes that are not used any more, this seems
> > somewhat a waste of time.
> > Unless someone stands up as volunteer or someone develops an automated
> > solution, I feel this is not going to happen.
> > (and no: I feel no desire at all to spend hours and hours of my spare
> time
> > to convert recipes most of which I am very unlikely to use).
> >
> > C is a quick hack without warranty that the recipe is not broken.
> > I've no idea how you feel about this, but in my opinion I'd rather have a
> > legacy staging recipe which works than a non-legacy staging one which
> might
> > or might not be broken.
> >
> > That leaves option D. Of course removing all recipes that still use
> legacy
> > staging is not desired, as that would also mean e.g. removal of the 53
> > recipes identified by Koen. [1]
> > However, the idea has some merits. Lots of the recipes with legacy
> staging
> > seem to be old recipes. See e.g. the alsa-lib example [3]. By removing
> > these
> > at least the time and work needed for B would be less.
> >
> > Now how to proceed?
> > Well that is the reason for this email.
> > I would like to hear your opinions on this, so feel free to voice them.
> > If there is consensus we can start deploying things. If not we might ask
> > the
> > TSC for some guidance.
> >
> > To start off the discussion let me give you my personal view.
> >
> > I would be in favour to remove all recipes that use legacy staging and
> that
> > do not fit into one of the following categories:
> > - it is  the most recent version of the package that is build by the
> recipe
> > - it is not the most recent version but all more recent versions have
> > DEFAULT_PREFERENCE = "-1"
> > - it is pinned by a distro
> > - it is a toolchain recipe (gcc, binutils, automake, autoconf and
> probably
> > glibc)
> > - it is a kernel or u-boot recipe
> > The rationale behind this is that it removes a lot of recipes (and hence
> a
> > lot of work converting).
> > Note that the recipes are not gone. They will remain in the stable 2009
> > branch and they can always be retrieved from git.
> > So should someone for whatever reason need a recipe he/she can recover
> it,
> > fix it and put it back.
> >
> > After that we can make an inventory of the work remaining.
> > If there are relatively few recipes remaining it will become a lot
> simpler
> > to find volunteers to clean up those.
> > If there are many e.g. because an orphaned distro or machine pins lots of
> > legacy recipes) we might consider a different scenario.
> >
> > This is my personal view, but ofc I would like to have a discussion on
> this
> > and hear other opinions so preferably we can come to a consensus.
> > The only request I have is that if you advocate a certain solution that
> you
> > are willing to participate in realising that solution.
> > E.g. it is easy to say that B is the desired scenario and that others
> > should
> > implement this.
> >
> > Best regards, Frans.
> >
> > PS: if the consensus is to start off removing the legacy recipes as I
> > proposed above, I am more than willing to participate in that.
> > and if someone has a good idea on how to automate identification of
> > qualifying recipes (especially weeding out from the list, the ones we
> still
> > want to retain), I'd love to learn about that too.
> >
> > [1]
> >
> >
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-July/021870.html
> > [2]
> >
> >
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-July/021901.html
> > [3]
> >
> >
> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg08150.html
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

