Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OdhG2-0007jM-AS
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 12:19:37 +0200
Received: by bwz10 with SMTP id 10so3432687bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 03:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ptnI/6L/2vill5eaOEmyFWfqCYPnMLyJbGBJ+mLQaV4=;
	b=A8yH+vnVFyUnmBTvaYMthmNCSawYJ6xh76/hZRiOQn3jeb8LxZviZVodWdS+e/KIfK
	L6yrA863FnfxjEpfrbl/H75HK0ndtLdrHdPyN53RO66Pa9wMBIXACWK3XMc2dh9RHQ7/
	SKDpkdsT11tNyXS2W64TSRZVApBFvUj/wxDgY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=SHbUvinPKoA+EcN2qCLpnRK1uRkOcBQ1enRUhTSYoQTcY1g9w1OBxrvIcpygmrPX6Y
	rAkK5Dv3rgv1u9bAU5SSB75swOeHgWmaUxk0auE/wL8Y9Vy8nopbc9aC2QEk3uLtef0f
	L6h/EizJzYO94YgMWcOKRL0DZrdI4oPqRWwJw=
MIME-Version: 1.0
Received: by 10.204.162.207 with SMTP id w15mr6309191bkx.63.1280225959106; 
	Tue, 27 Jul 2010 03:19:19 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Tue, 27 Jul 2010 03:19:18 -0700 (PDT)
In-Reply-To: <AANLkTinuoVzs556HmdOx-y1tMd6YB58NgPtoEhqma4HO@mail.gmail.com>
References: <AANLkTim5aAnNi5VFs7=-gg1XaM=+KBeUs-G494SEbR+V@mail.gmail.com>
	<AANLkTiks5W-tPf=D=Qo5UZf77ZA2R10=fkw2MmdeWfHc@mail.gmail.com>
	<AANLkTinuoVzs556HmdOx-y1tMd6YB58NgPtoEhqma4HO@mail.gmail.com>
Date: Tue, 27 Jul 2010 12:19:18 +0200
Message-ID: <AANLkTim1Cps1vdmbxSQGdKvn0WNL3nUB_+9bEu1SpN9R@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
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
X-List-Received-Date: Tue, 27 Jul 2010 10:19:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/26 Chris Larson <clarson@kergoth.com>

> The way bitbake works today, it can't build *anything* unless it's parsed
> *everything*, because anything could have PROVIDES / RPROVIDES what you're
> wanting to build.  If you want to shift things to a server, which I agree
> would be nice, you'd have to have a daemon running there to make available
> the full dependency information.
>
> On Mon, Jul 26, 2010 at 1:59 PM, C Michael Sundius <msundius@sundius.com
> >wrote:
>
> > every time I see a conversation on this list that says something to the
> > effect of "we have xxx number of recipes that do this" or "if we make
> this
> > sort of change we'll have to change yyy number of recipes" I cringe. I
> ran:
> >
> > [msundius@msundius-lnx1 recipes]$ find . -type f | grep "\.bb$" | wc
> >   8581    8581  276766
> > [msundius@msundius-lnx1 recipes]$ ls -1 | wc
> >   2023    2023   18851
> >
> > 8500 recipes just doesn't seem like a scalable number of recipes to
> manage
> > w/ our development community. Its problematic for the following reasons:
> >
> > 1) making a change that affects compatibility is difficult if not
> > impossible
> > 2) most people working w/ embedded distros want only a small percentage
> of
> > this beast
> > 3) building involves bitbake parsing all of these recipes before going to
> > do
> > the tree of what actually needs to be built.
> > there are probably more complaints from the masses
> >
> > It seems to me that we need to decouple in a formal way the recipes from
> OE
> > (classes and config files) and from each other.
> > I am proposing that we do the following:
> > - that we define exactly what it means to conform to a particular version
> > of
> > the OE Recipe API (or whatever you call it).
> > - that we "fetch" recipes from well known repositories/mirrors (or
> locally)
> > in the same way we fetch tarballs.
> > - we parse recipes as we build the dependency tree.
> >
> > That way we don't have to look through the entire list 8500 recipes
> > (parsing
> > them all) before we build our tiny little embedded application that
> > controls
> > a refrigerator's ice making machine or whatever you make.
> >
> > For us, we simply don't use most of all of the recipes and I have found
> it
> > hard to manage the disparity of the entire official tree vs the recipes
> > that
> > we use. I have simply created my own (sub)tree that is a subset to the
> > greater tree.
> >
> > I also like the idea that we would be able to append our own
> configuration
> > data patches etc for selected standard recipes (that could be "fetched"
> > from
> > somewhere) so that we would not really have to merge all of those
> specifics
> > of our own system into the repository of recipes used by the whole world
> > (i.e. noone cares about the busybox config file we use or a patch to the
> > kernel to fix a dumb thing our HW engineers did). somthing akin to the
> > .bbappend discussion as of late
> >
> > I realize that this is off topic here. I also am not qualified to propose
> > how to implement such a solution. I'm just wondering if that might have
> > already occurred to any of us that there's a fundamental issue that
> > detracts
> > us from creating a truly independent build framework. I'm also not trying
> > to
> > be a complainer.. I've been thinking about this for a long time and I'd
> > like
> > to help... I'm just not that good  w/ python :]
> >
> > Back to the discussion at hand, If we have a (versioned) compatibility
> > standard for recipes then we could simply bump the number and exclude old
> > recipes until their maintainer or someone who needed it, got around to
> > upgrading the recipe.
> >
> > Mike
> >
> > On Sat, Jul 24, 2010 at 2:57 AM, Frans Meulenbroeks <
> > fransmeulenbroeks@gmail.com> wrote:
> >
> > > Dear all,
> > >
> > > The topic of legacy staging has been on the table for probably 8 months
> > or
> > > so.
> > > Still we have a lot of recipes that use legacy staging.
> > > This email tries to stir up the discussion on how to get rid of these.
> > >
> > > Most of the major recipes seem to be converted.
> > > Koen reported 53 recipes with legacy staging after building
> > > angstrom-gnome-image and openjdk. [1]
> > > This seems an indication that lots of common and actively used recipes
> > are
> > > converted.
> > > However there are still 1100+ recipes and about 150 .inc files that
> have
> > a
> > > do_stage rule [2]
> > >
> > > This indicates that quite some work is still needed.
> > > Let's have a look at the options. What I see as possibilities are:
> > >
> > > A: accept that we will have lots of recipes around that use legacy
> > staging
> > > B: update and test all recipes (at least up to the level that it is
> > > verified
> > > that the files stage properly after removing the legacy staging
> > > C: with a sed script or so remove all do_stage functions and hope the
> > best
> > > for it.
>
>>
>>
>> --
>> Christopher Larson
>> clarson at kergoth dot com
>> Founder - BitBake, OpenEmbedded, OpenZaurus
>> Maintainer - Tslib
>> Senior Software Engineer, Mentor Graphics
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> > > D: remove the recipes that still use legacy staging as apparently
> no-one
> > is
> > > enough interested in them to update them.
> > >
> > > Let us now look at the pro's and con's of these possiblities:
> > >
> > > From the various calls to fix this that I have seen on the mailing list
> A
> > > is
> > > not really too desired.
> > >
> > > B would be nice, but is a hell lot of work. With 1100 recipes, 150 inc
> > > files
> > > and 5 minutes per recipe, this takes about 100 hours.
> > > Even with one minute per recipe it would be about 20 hours.
> > > Given that lots of the recipes for which this applies seem to be rarely
> > > used
> > > or are older versions of recipes that are not used any more, this seems
> > > somewhat a waste of time.
>
>>
>>
>> --
>> Christopher Larson
>> clarson at kergoth dot com
>> Founder - BitBake, OpenEmbedded, OpenZaurus
>> Maintainer - Tslib
>> Senior Software Engineer, Mentor Graphics
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> > > Unless someone stands up as volunteer or someone develops an automated
> > > solution, I feel this is not going to happen.
> > > (and no: I feel no desire at all to spend hours and hours of my spare
> > time
> > > to convert recipes most of which I am very unlikely to use).
> > >
> > > C is a quick hack without warranty that the recipe is not broken.
> > > I've no idea how you feel about this, but in my opinion I'd rather have
> a
> > > legacy staging recipe which works than a non-legacy staging one which
> > might
> > > or might not be broken.
> > >
> > > That leaves option D. Of course removing all recipes that still use
> > legacy
> > > staging is not desired, as that would also mean e.g. removal of the 53
> > > recipes identified by Koen. [1]
> > > However, the idea has some merits. Lots of the recipes with legacy
> > staging
> > > seem to be old recipes. See e.g. the alsa-lib example [3]. By removing
> > > these
> > > at least the time and work needed for B would be less.
> > >
> > > Now how to proceed?
> > > Well that is the reason for this email.
> > > I would like to hear your opinions on this, so feel free to voice them.
> > > If there is consensus we can start deploying things. If not we might
> ask
> > > the
> > > TSC for some guidance.
> > >
> > > To start off the discussion let me give you my personal view.
> > >
> > > I would be in favour to remove all recipes that use legacy staging and
> > that
> > > do not fit into one of the following categories:
> > > - it is  the most recent version of the package that is build by the
> > recipe
> > > - it is not the most recent version but all more recent versions have
> > > DEFAULT_PREFERENCE = "-1"
> > > - it is pinned by a distro
> > > - it is a toolchain recipe (gcc, binutils, automake, autoconf and
> > probably
> > > glibc)
> > > - it is a kernel or u-boot recipe
> > > The rationale behind this is that it removes a lot of recipes (and
> hence
> > a
> > > lot of work converting).
> > > Note that the recipes are not gone. They will remain in the stable 2009
> > > branch and they can always be retrieved from git.
> > > So should someone for whatever reason need a recipe he/she can recover
> > it,
> > > fix it and put it back.
> > >
> > > After that we can make an inventory of the work re
>
>>
>>
>> --
>> Christopher Larson
>> clarson at kergoth dot com
>> Founder - BitBake, OpenEmbedded, OpenZaurus
>> Maintainer - Tslib
>> Senior Software Engineer, Mentor Graphics
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> maining.
> > > If there are relatively few recipes remaining it will become a lot
> > simpler
> > > to find volunteers to clean up those.
> > > If there are many e.g. because an orphaned distro or machine pins lots
> of
> > > legacy recipes) we might consider a different scenario.
> > >
> > > This is my personal view, but ofc I would like to have a discussion on
> > this
> > > and hear other opinions so preferably we can come to a consensus.
> > > The only request I have is that if you advocate a certain solution that
> > you
> > > are willing to participate in realising that solution.
> > > E.g. it is easy to say that B is the desired scenario and that others
> > > should
> > > implement this.
> > >
> > > Best regards, Frans.
> > >
> > > PS: if the consensus is to start off removing the
>
>>
>>
>> --
>> Christopher Larson
>> clarson at kergoth dot com
>> Founder - BitBake, OpenEmbedded, OpenZaurus
>> Maintainer - Tslib
>> Senior Software Engineer, Mentor Graphics
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> legacy recipes as I
> > > proposed above, I am more than willing to participate in that.
> > > and if someone has a good idea on how to automate identification of
> > > qualifying recipes (especially weeding out from the list, the ones we
> > still
> > > want to retain), I'd love to learn about that too.
> > >
> > > [1]
> > >
> > >
> >
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-July/021870.html
> > > [2]
> > >
> > >
> >
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-July/021901.html
> > > [3]
> > >
> > >
> >
> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg08150.html
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> > >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
>
> I strongly share Michaels feeling and I have been pondering about solutions
too (including parsing when needed)

I was aware of the DEPENDS issue. workarounds for it could be
- split recipes in two , one part which only contains the DEPENDS (e.g.
similar to .inc where the DEPENDS is in the recipe and most of the rest is
in the .inc)
- only one package provided in a recipe so from the name it is clear what is
provided. eg. gcc_x provides gcc (and maybe some additional related packages
like gcc-dbg, gcc-doc etc etc)

Another option is to split the recipes dir in parts, so users can select not
to include part of it (e.g. I have no interest in opie recipes)

On my system parsing the 84xx recipes that we have (after touching a conf
file) takes 3 minutes or so.

Bringing the thread back to the topic:
I see no real interest into tackling removal of old style staging (or old
native recipes).
No opinions on how to proceed ?
If not, things probably will remain as they are.

Frans.

PS: I think part of the problem is that most recipes do not have a
well-defined owner who is responsible for maintaining them. I know we use to
have them  mentioned in the recipes. That had some issues, but at least it
was more clear who felt responsible for what, and it was also more clear who
to bother to fix a recipe (and it was more clear which recipes are orphaned
or become orphaned when the maintainer leaves).

