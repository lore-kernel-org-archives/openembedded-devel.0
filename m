Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ocd0m-0003HY-QP
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 13:35:26 +0200
Received: by bwz10 with SMTP id 10so2226340bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jul 2010 04:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=NmbQBJw+IFAahM2OaoUystgAe+ThasJpdRqAzHPgp7c=;
	b=scqVUkjfZlzwzhLFnhy36bV2OtYPQ2Ab48RUZdg3yQTq21d4LfONvr8lpJV2uAZp8k
	sRq3Uir3JTqqVXICVTgl0gF9GrBeB7qzyoexs5uvjqpLTk+wYpCbZKnPV1RY4XArSuGj
	3TlVUL3c9F/AG8uN69g86jWvJRO/Ui9ppkEEk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=O6lZMuZvQq96fvitEI1fdt1FamXs0hOoTLt3JY1PXziYN4DpzESZasxtfdszTARJUY
	0uOAo+guh85Tb67yxmw+GGWhMgpL4oQxuCBgFwUj6/zVHgiitQyAPK7CBnU29Xzuo22N
	QJYvGFGJFcZ0Nm1N5GKqST0oVAVWjAiGy/0RQ=
MIME-Version: 1.0
Received: by 10.204.60.130 with SMTP id p2mr3440150bkh.166.1279971312859; Sat, 
	24 Jul 2010 04:35:12 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Sat, 24 Jul 2010 04:35:12 -0700 (PDT)
In-Reply-To: <i2ega9$e0p$1@dough.gmane.org>
References: <AANLkTim5aAnNi5VFs7=-gg1XaM=+KBeUs-G494SEbR+V@mail.gmail.com>
	<i2ega9$e0p$1@dough.gmane.org>
Date: Sat, 24 Jul 2010 13:35:12 +0200
Message-ID: <AANLkTimTx1hR-EpNi0Q3Hroy1XoBgAKfqNCTSw+FWbCe@mail.gmail.com>
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
X-List-Received-Date: Sat, 24 Jul 2010 11:35:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/24 Koen Kooi <k.kooi@student.utwente.nl>

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> How about this:
>
> People go out and convert recipes they use/care about and try to fix up
> all versions. Once all the build targets people care about are legacy
> free (e.g. SHR and angstrom images, meta-toolchain-*), we evaluate the
> remaining recipes.
>

That procedure is fine with me, although I must say I feel we already tried
this for half a year or so.

In order for this to work I suggest to add owners to it.
E.g. can people speak up who care about a recipe/distro and who want to work
on getting legacy staging removed for those (because it is easy to say that
one feels that X need to be free of legacy staging and leave it to unnamed
others to resolve it).

I for me, I care about the recipes I've created and/or did substantial
additions to.
As far as I know, these are all free of legacy staging with the exception of
a few perl recipes (where the issue is cpan.bbclass; an issue I hopefully
have resolved and that is compiling as I write this).

If noone care about the older versions of converted recipes they get
> placed in removal.txt with the usual date (iirc a few weeks) and the
> list gets posted to the ml. After the date in removal.txt they will get
> deleted.
>
I'm unaware of a removal policy as you describe (although it does not sound
bad to me).
I

> This mean that recipes that noone seems to care about will keep legacy
> staging. And I think that's OK, since there are a *lot* of recipes that
> "just work" and only get built once a year or so, but are still wanted
> by lots of users. I come across recipes like that every week.
>

I seriously doubt that the recipes that compy to the criteria I gave are
build often. They are not the primary/leading version.
If I do a bake of a recipe and it is not for testing purposes it is
invariably the default version (the latest one taking DEFAULT_PREFERENCE
into account).
I seriously doubt many people will bake old versions (like for example
alsa-lib_1.0.14.bb, a recipe that according to the TSC advisory [4] could
have been deleted quite some time ago)

What I would hate to see is that people return from summer holiday and
> suddenly half of OE has been deleted including usefull, but unpopular
> stuff.
>

That is not my intention. Note that my proposal aimed at always keeping the
most recent version (taking DEFAULT_PREFERENCE into account) of a recipe.
I also object to your choice of wording. The recipes are *not* deleted. They
are still in the stable2009 branch as well as in git.
People who need them can still get them from those places.
They are merely removed from dev head.

On the other hand: if someone cares so much about a recipe it would be nice
if he/she should fix it.

Frans.

PS: did one more grep. From the 1119 recipes that contain the word do_stage
there are 716 differently named recipes (recipes that have the same
basename, so are identical expect wrt the part after the _
So more than 400 recipes are older versions (probably more as there are also
recipes like e.g. alsa-lib that have their latest version fixed, could not
think of a simple way to measure how much of it that is).

[4]
http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-May/020047.html

>
> regards,
>
> Koen
>
>
>
> On 24-07-10 11:57, Frans Meulenbroeks wrote:
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
> verified
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
> is
> > not really too desired.
> >
> > B would be nice, but is a hell lot of work. With 1100 recipes, 150 inc
> files
> > and 5 minutes per recipe, this takes about 100 hours.
> > Even with one minute per recipe it would be about 20 hours.
> > Given that lots of the recipes for which this applies seem to be rarely
> used
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
> these
> > at least the time and work needed for B would be less.
> >
> > Now how to proceed?
> > Well that is the reason for this email.
> > I would like to hear your opinions on this, so feel free to voice them.
> > If there is consensus we can start deploying things. If not we might ask
> the
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
> should
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
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-July/021870.html
> > [2]
> >
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-July/021901.html
> > [3]
> >
> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg08150.html
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMSsSJMkyGM64RGpERAhhNAKC6BmsL13nbL3N4z2iirmtkk6JP6ACguLTo
> S6chuyETQHFcfIaiYONuVGY=
> =8fwc
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

