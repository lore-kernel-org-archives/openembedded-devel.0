Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3BE09607A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 10:22:32 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id o76so2904040wrb.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 02:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0ELefYpazZb1vhSsEnc0yP46raJx8CczaWu8KKNMu1w=;
	b=hyGEbj76C0RV0Nb+9Lbo0VPJPHAV/Fc/ZJt5fq0aSjyQVXHIp1FIXqaO7hxBMAjkI5
	Awo2HHAddul5l4R7i5gXUn6gdxReR60V0hHUOS1ItfF9nBulYot5WoxLiZno1Jakxaty
	QsyJUQsrB4dxutB3yXvF+bKE4LaY3ufswykW04rhctOkaMr49zNpP9SG9VLiH9iwin9K
	iDqEWHujAA1YXj02QU9FeH3xpn74WWpjCEaNCGxtE1aso0Zkr4nkShUSJ6XMKvdaasaj
	7hxJASMCWLDZMYGAU04KFI5ipQ95Ld/+ymcmWfCUTfjwlHExWzX50Am39IwNx1OIZFlk
	yF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0ELefYpazZb1vhSsEnc0yP46raJx8CczaWu8KKNMu1w=;
	b=mlTVsUBZTACLMfP1cIqJnvqdvlRIWNle6jeXXV7UR6z/RwIwAZU10K/UGL7OEdMT9m
	LWrCbjmPWSdse6zPmftvq8lDFnxHL4kNhgk+uxXKnEiGK6XSh8iNmZuod/tS4WsvUq/o
	YjZDLZlACanmnsGP43XW5ZYzZpaNPqCYq5JhxPEWzIwasXBbCop6fbXOyXHbONsJLEPz
	E6NX7J1LB8DHvhcObMsBvkaCD27HH4syrSkOeysRDo9Cvkf3SVbsBnAXkh9XC8msKzZF
	JTLWU97xYcOinqlO5EBFhOlNGwjGeuWDZ7yjnpJDBJB6N6IEE1NHIfSHEdmRripos35K
	CGoA==
X-Gm-Message-State: APf1xPCdV9K6jg1pY+BYto0fkEQ5DEkadEHiW0FLFjO0Sw2k6foCulHj
	9DHio9184GBzA+hCex5zc3V7dDU3w+Pnnou96V0=
X-Google-Smtp-Source: AH8x225ZGf/Ggrw7jVyg2ys0dLg9lrtY+nXXB4O1Dqsav2c+EPaDGp560BSwr119l+hC3mqhfTEVGGQO81CHkGm66us=
X-Received: by 10.28.8.137 with SMTP id 131mr1781952wmi.79.1519208553847; Wed,
	21 Feb 2018 02:22:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Wed, 21 Feb 2018 02:22:33 -0800 (PST)
In-Reply-To: <CAAQYJAsOFo6md-ZCRg+KmGQtC9O+pwFzVjpEMOXOFVFWzr4iMw@mail.gmail.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<CADkTA4MdQgigdN+hSsyZjk=1nfDB3M2799Pf-jy4WYt=6PdXyA@mail.gmail.com>
	<8d5be4e4-3fd9-a0f2-c5cf-b967cf428416@gmail.com>
	<CADkTA4P46zCdHEUeAdsC7Ej+N3gp7-6Rxx=UTTYN7U91fL3Z1w@mail.gmail.com>
	<CA+chaQd=LFUw8wV0h6O2O_RvH2R9APE=X3Mn+DarPSwxefs6bg@mail.gmail.com>
	<CA+chaQfpXBL3=z3QwTKQ6MNBKUVhbMjA6G+nADz562zFuYUTUw@mail.gmail.com>
	<CAAQYJAsOFo6md-ZCRg+KmGQtC9O+pwFzVjpEMOXOFVFWzr4iMw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 21 Feb 2018 11:22:33 +0100
Message-ID: <CA+chaQfcD5n9Gs+Hos26qOqE5D8ch0JwTm+7pn_ZtysPCpHmjw@mail.gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Splitting meta-oe?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Feb 2018 10:22:33 -0000
Content-Type: text/plain; charset="UTF-8"

There is good example of inter-layer dependencies from real world:
http://lists.openembedded.org/pipermail/openembedded-devel/2017-February/111447.html

Do you want
A) new git repository meta-libio-socket-ssl-perl so that meta-networking
will depend on this on instead of whole meta-perl
B) meta-ddclient which will probably depend on both meta-perl and
meta-networking
C) ddclient and its dependencies in meta-perl
D) libio-socket-ssl-perl moved to oe-core, so that next time we can say
that oe-core is just like old oe-classic just with a bit less stuff in it

Neither of these options is ideal, but meta-networking getting meta-perl
dependency is the one which causes fewest issues to OE users. As mentioned
before by few people, most builds for "real world products" are already
including many layers, adding meta-perl to BBLAYERS (it's probably there
already for other recipes) without the need to update other build setup
like checking additional git repositories is simple and I don't see how it
makes meta-oe to be like oe-classic. The layers still separate stuff and I
don't need to include layers from where I don't need anything at all.

Smallest set of upstream layers we use at LGE already contains half of
meta-oe repository:
oe-core meta-gplv2 meta-oe meta-multimedia meta-networking meta-python
meta-filesystems meta-qt5
and around 8 internal layers, so it's far from oe-classic days and
different builds for different products have different subset of layers.

For internal layers we also use only a few git repositories 12 layers in
the main one, because it makes it easier to keep them all compatible with
each other at all times (e.g. by triggering the CI for all products from
each gerrit review for this single repository).

I'm not advocating for putting _everything_ into single git repository or
even the use of combo-layer tool, but keeping the layers maintained by the
same "organization" with the same update cycle makes things easier to
maintain and easier to consume by others.

Regards,

On Wed, Feb 21, 2018 at 10:48 AM, Andrea Adami <andrea.adami@gmail.com>
wrote:

> On Wed, Feb 21, 2018 at 10:06 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >> I'm actually very worried about these (re)tired maintainers. If the
> > layers were more independent it would allow some of the patch handling
> > responsibilities and testing responsibilities to move to other people,
> > reducing the load on those maintainers.
> >
> > Armin can update his own view, but for me the main issue wasn't the
> "patch
> > handling" part, but actually the lack of patches for the new issues
> (often
> > caused by new changes in oe-core).
> >
>
> That's one point.
> If I may add my experience as maintainer of two minor layers
> (meta-handheld and meta-initramfs), I have to say there have been many
> cases where an upgrade to oe-core did break one of these layers.
> Just a variable rename for example...this fall-outs could have been
> avoided if the oe-core dev would have spent a minute grepping the
> repository,
> Heh..now we have to define what is the public repository, which layers
> have to be checked...
>
> And about layer interdependencies...well..it is very delicate.
> For example meta-handheld, a BSP layer, must depend since some time on
> meta-oe. Why? Because tslib was removed from oe-core.
> This is ugly...here a more separated layering structure would help
>
> So I somehow feel we should refine what is in the repository but
> absolutely not split it around.
> Even, I think we should host all public layers (definition lacks
> today) in the OpenEmbedded Git Repository .
>
> My 2 cents
> Andrea
>
> > Yes, the "patch handling" part was the most boring piece, but patches
> from
> > regular contributors or co-maintainers were always easy to handle and
> > rarely caused any extra work.
> >
> > The untested drive-by contributions from people who don't even reply to
> > review comments are completely different category, but separate git
> > repositories won't drive those away (until it gets so confusing that
> these
> > people will even fail to find correct repository and just gave up trying
> to
> > contribute anything at all). Nothing is blocking more people to collect,
> > fix, test these drive-by contributions and then send consolidated
> > pull-request which will be easily merged to shared repository - but I
> never
> > seen this happen and I don't know how separate git repositories will help
> > with this.
> >
> > In the end after spending a lot of own time doing this boring part, I
> > always felt responsible for fixing as many build failures detected in
> world
> > build as I could, but that's never-ending uphill battle where very few
> > people ever help (big thanks to those exceptions who sometimes help). And
> > what you get for that extra afford to get it building as much as possible
> > in spare time? Comments about how garbage meta-oe layers are.
> >
> > We need patches not more git repos!
> >
> > On Wed, Feb 21, 2018 at 9:49 AM, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >
> >> > I need an updated python-<foo> package for an unrelated package
> >>
> >> And how far will you go?
> >>
> >> If you want just newer python-<foo> and nothing else, will you take
> other
> >> changes to other python-* recipes from meta-python layer? There is a
> lot of
> >> recipes there, if you're so picky about updates, then you shouldn't
> update
> >> whole oe-core as well.
> >>
> >> On Wed, Feb 21, 2018 at 1:51 AM, Bruce Ashfield <
> bruce.ashfield@gmail.com>
> >> wrote:
> >>
> >>> On Tue, Feb 20, 2018 at 1:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>> > On 2/20/18 9:13 AM, Bruce Ashfield wrote:
> >>> >> On Tue, Feb 20, 2018 at 11:50 AM, akuster808 <akuster808@gmail.com>
> >>> wrote:
> >>> >>>
> >>> >>>
> >>> >>> On 02/20/2018 02:45 AM, Burton, Ross wrote:
> >>> >>>> Hi,
> >>> >>>>
> >>> >>>> Is now a good time to talk about splitting up meta-oe?  Some
> layers
> >>> are
> >>> >>>> actively developed and maintained (one example: meta-python),
> others
> >>> are
> >>> >>>> basically bitrotting and only get touched when something else
> causes
> >>> them
> >>> >>>> to break world builds (one example: meta-gnome).  I've long felt
> that
> >>> >>>> meta-oe should be split up and the high quality layers managed in
> >>> their own
> >>> >>>> repositories so patches to them don't get held up by breakage in
> >>> other
> >>> >>>> sub-layers.
> >>> >>> You make it sound like meta-oe is not a high quality layer.  I
> could
> >>> >>> make the same claim about oe-core master.
> >>> >>>
> >>> >>> I don't see the connection in patches being held up due to
> breakage in
> >>> >>> other sub layers. This only happens if the dependency fail to
> build.
> >>> >>>
> >>> >>> You lose control over the quality in current layers that reside in
> >>> >>> meta-openbedded just like you have no control over all the other
> >>> layers
> >>> >>> residing in the community. It makes maintaining stable versions
> very
> >>> >>> difficult. Well, unless The Yocto Project takes over them.. I guess
> >>> that
> >>> >>> would work then.
> >>> >>>
> >>> >>>>
> >>> >>>> Another advantage of splitting out the high quality layers is that
> >>> we'd
> >>> >>>> like to look at running more community layers through the Yocto
> >>> >>>> autobuilder, and granular layers make that easier to manage.
> >>> >>>  I thought not including layers in bblayers.conf was easy enough.
> >>> >>>>
> >>> >>>> Comments?
> >>> >>>
> >>> >>> What problem do you thing you are trying to solve here?
> >>> >>
> >>> >> My unrelated issues are that I can't update one layer, without
> getting
> >>> >> all of the updates.
> >>> >> .. but that is both a good thing (i.e. they are all tested together,
> >>> >> so you know that the
> >>> >> single SRCREV update is good for all layers), and a bad thing (when
> >>> >> you just want a
> >>> >> new python recipe update from meta-python, but don't want other
> >>> changes).
> >>> >>
> >>> >
> >>> > if you dont include the layers in your BBLAYERS and they become
> >>> > effectively non existent, unless you are on metered internet
> connection,
> >>> > where downloading unused stuff would save you bandwidth, it should be
> >>> > ok.  No ?
> >>>
> >>> Its not that.
> >>>
> >>> I *am* building the different layers, but say I have a stable set of
> >>> packages
> >>> and working images .. but for whatever reason, I need an updated
> >>> python-<foo>
> >>> package for an unrelated package, or some other layer that needs a
> newer
> >>> version, etc.
> >>>
> >>> How do I get that, without taking updates to all the layers ? .. and
> >>> layers that
> >>> I really didn't want to update. I have to do some sort of combo-layer,
> >>> carry
> >>> my own copy of the recipe, etc.
> >>>
> >>> So there are definitely ways to do it, I'm just pointing out that I
> >>> end up taking
> >>> some build failures/issues from time to time on packages I didn't
> really
> >>> need to update.
> >>>
> >>> The flip side of that argument is that all of the layers and sub layers
> >>> have
> >>> gone through some sort of global build, and hence I know that they all
> >>> have
> >>> worked together for someone. If I can update pieces individually, I
> break
> >>> that .. and I own the broken bits after that .. which again, goes to
> >>> my point that
> >>> fixing one workflow/issue can break another :D
> >>>
> >>> Bruce
> >>>
> >>> >
> >>> >> It is very likely that splitting the layer would help one issue, but
> >>> >> make the other worse.
> >>> >>
> >>> >> So no solution from me, just an observation about potential issue.
> >>> >>
> >>> >> Cheers,
> >>> >>
> >>> >> Bruce
> >>> >>
> >>> >>>
> >>> >>> - armin
> >>> >>>>
> >>> >>>> Ross
> >>> >>>
> >>> >>>
> >>> >>> --
> >>> >>> _______________________________________________
> >>> >>> Openembedded-devel mailing list
> >>> >>> Openembedded-devel@lists.openembedded.org
> >>> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>> >>
> >>> >>
> >>> >>
> >>> >
> >>>
> >>>
> >>>
> >>> --
> >>> "Thou shalt not follow the NULL pointer, for chaos and madness await
> >>> thee at its end"
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>
> >>
> >>
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

