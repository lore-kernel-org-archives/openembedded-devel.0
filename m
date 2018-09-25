Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0ACAE7950E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 17:19:34 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id n6-v6so14198864qtl.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 10:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XBR9yQdgZjdDt4/sfKzzvM8p4VhPxNTJ7EldaWG6vXA=;
	b=sbV52N+Vru8z+Ia48IbFsTmlX9Om9js0MdAm70ACQ8MkqkF/piEofXeWLUq8aAxAcP
	KSV/uTx9PitFRZ8R93dgaxzFLg7OTVnhczALn+5RBMI4XsQTGcc7RE5fM5VLpLxP4c+z
	fr8sIGggdhuEi2EoveDXusFVfRki5f9gvF6wPj7HwFjNai2zv+mojeIa2KnBx6pkk1dV
	7P2onakei26kuwOzLIo0SDhSGjgylwmrng9pR3pc0/PFyzyaXOCBQWV/XPZUfat0RlaQ
	Xi8g+9XAVdAO7THxfmGjyEE7Z7NIdKUAhsk5kuo9DiRflVFr+/9TR99mgvKOadWtJTG7
	D2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XBR9yQdgZjdDt4/sfKzzvM8p4VhPxNTJ7EldaWG6vXA=;
	b=kIM6J8gjsOdfuXsWR/X+rBU0BF0h9wYW4Vtj8X4A9mQSpnBvv7JQIJcnnOtlHYeWq5
	0a89LPoWupVe0LkeoDTTYZHidS1eCFvwBLAHQq+/eluTEiKOPrp0g/5Ne7bkLVWcRcZn
	U8kdXVnOTBb0eeBKI8DJSOTczATnau2gna+TATK4ggz6LC+o4pGh9oee6V89ptfZ6OP7
	TVRc7SzfC4sFcgOfn1dO5okngGbhfL3WtK2MlqRYCwoHRRQEIXO4laJ3+EI9wiHH+aEV
	3EJNszlqOhKujP8z0Y/BUwLpjeQx1h1F6ZcqhBH8D17a399FolGWtHmfnUUE9S0BrWFf
	QKrA==
X-Gm-Message-State: ABuFfoimnG9Mr2tVO8P08Vl2MHdTpFNEGqoD5UctK1i5RyqbQ/zvZvKl
	hvVlz0JzCprtJy2RXZjDJle3aXmotseGuQXBVp0=
X-Google-Smtp-Source: ACcGV60PNSiQy/GQNz4GrooyDeADtKaTGVZMZ/q9ubokxF2vtIu9ncuTBd3RHFfKRZM1dx+bFpXPmjLwGazuGkmdgiU=
X-Received: by 2002:ac8:4649:: with SMTP id f9-v6mr1637197qto.34.1537895975459;
	Tue, 25 Sep 2018 10:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71Wjxwv3i2=UtbzNai79h-f83xcL6G1R8+kY-C-jA==VFy9Q@mail.gmail.com>
	<2100274.NFsm02Mysr@localhost.localdomain>
	<98342371-c064-7866-1ea1-14819d88a71f@gmail.com>
	<CAP71WjyhuQ06BzuYgNDvGDLFo18jyYY4KkFfE0_GFKxWJ7Poyw@mail.gmail.com>
	<CAP71WjzB-xkVAnLOBd0jLdKXTh8B87dpHiQUvGhhzm8Q2fNzXQ@mail.gmail.com>
	<CA+chaQf=U8HMA1JeX5SwvXG=Ob8GSdsAyj3fj1OZcVHxDqjk3g@mail.gmail.com>
	<20180925102924.GA1431@jama>
	<CAP71Wjxn2Dezk1OB-6Ez+0PdWGiZuaanxbG+majNH74N6gq5aQ@mail.gmail.com>
	<20180925171016.GB1431@jama>
	<CAP71WjyD6rLuAuwBrPucj7coP56D9kDdnwMy=rC9xNNHiMFw4Q@mail.gmail.com>
In-Reply-To: <CAP71WjyD6rLuAuwBrPucj7coP56D9kDdnwMy=rC9xNNHiMFw4Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Sep 2018 10:19:08 -0700
Message-ID: <CAMKF1soxRyQGiNzoKujp2RradR6EWHEMbvWz9x+ERidFgzN2rQ@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-oe and yocto-check-layer
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
X-List-Received-Date: Tue, 25 Sep 2018 17:19:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 25, 2018 at 10:17 AM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> On Tue, Sep 25, 2018 at 7:10 PM Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > On Tue, Sep 25, 2018 at 03:05:19PM +0200, Nicolas Dechesne wrote:
> > > On Tue, Sep 25, 2018 at 12:29 PM Martin Jansa <martin.jansa@gmail.com> wrote:
> > > >
> > > > On Tue, Sep 25, 2018 at 12:24:31PM +0200, Martin Jansa wrote:
> > > > > > meta-oe: add meta-python in LAYERDEPENDS (needed for protobuf)
> > > > >
> > > > > This causes another circular dependency which we don't want, doesn't it?
> > >
> > > What are the issues with circular dependency? LAYERDEPENDS only lists
> > > each layers own dependencies, which is helpful for integrators to know
> > > which layer they need to pull into bblayers.conf. If all layers from
> > > LAYERDEPENDS are pulled in, then it is expected that each recipe will
> > > build fine.
> >
> > It prevents using these layers separately.
> >
> > Now people can include just meta-oe without meta-python (as long as they
> > fix or mask the python-protobuf dependency from protobuf-ptest - which
> > is a bug not a feature).
> >
> > If they have circular dependency then everybody using meta-oe will be
> > forced to use meta-python as well and then why should we keep them in
> > separate layers? It would be the same as adding all meta-python recipes
> > into meta-oe.
>
> It is not because there are circular dependencies that meta-oe
> requires meta-python, it is because of protobuf , it really depends on
> meta-python... I am tempted to agree with Paul, we should make the
> dependency explicitly optional using PACKAGECONFIG instead of
> requiring users to fix/mask it.
>

packageconfig seems a good approach for now

> >
> > There was similar issue with meta-perl not so long time ago, before with
> > meta-multimedia and meta-networking.. so if we don't fix these issues
> > properly and just add more dependencies from meta-oe, then whole
> > meta-openembedded as a repository will became one layer soon.
>
> agreed. I think it's good to spot these issues and fix them as they come.
>
> >
> > > The only circular dependency that I am aware is with yocto-check-layer
> > > script , and I sent a patch yesterday to fix this issue. With this
> > > patch, yocto-check-layer works fine even when layers have inter
> > > dependencies.
> > >
> > > https://patchwork.openembedded.org/patch/155113/
> > >
> > > >
> > > > Especially if it's caused only by python-protobuf runtime dependency added in:
> > > >
> > > > https://patchwork.openembedded.org/patch/146867/
> > >
> > > yes. this is the culprit.
> > >
> > > >
> > > > > On Tue, Sep 25, 2018 at 11:44 AM Nicolas Dechesne <
> > > > > nicolas.dechesne@linaro.org> wrote:
> > > > >
> > > > > > hi Armin,
> > > > > >
> > > > > > On Tue, Sep 25, 2018 at 8:59 AM Nicolas Dechesne
> > > > > > <nicolas.dechesne@linaro.org> wrote:
> > > > > > >
> > > > > > > On Mon, Sep 24, 2018 at 11:51 PM akuster808 <akuster808@gmail.com>
> > > > > > wrote:
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > On 09/24/2018 02:03 PM, Paul Eggleton wrote:
> > > > > > > > > Hi Nicolas,
> > > > > > > > >
> > > > > > > > > On Monday, 24 September 2018 10:05:02 PM NZST Nicolas Dechesne wrote:
> > > > > > > > >> hi Armin, Paul, Richard,
> > > > > > > > >>
> > > > > > > > >> I was looking at getting the compliance report for meta-oe (sumo
> > > > > > > > >> branch), and I have found a few issues.
> > > > > > > > >>
> > > > > > > > >> * in meta-openembedded/sumo, grpc is in meta-oe layer, while it
> > > > > > > > >> depends on meta-networking (c-ares). It was fixes in master, with
> > > > > > > > >> 251878e8b6b9 (grpc: move it from oe to networking layer), so I think
> > > > > > > > >> this fix needs to be backported to sumo as well if we want the YP
> > > > > > 2.0
> > > > > > > > >> compliance script to even work. If agreed, once merged, please let
> > > > > > me
> > > > > > > > >> know so that I can try again to generate a compliance report.
> > > > > > > > > Is it appropriate to make such moves in a stable branch? I wouldn't
> > > > > > have
> > > > > > > > > thought so.
> > > > > > > > >
> > > > > > > >
> > > > > > > > We have to. Per my understanding and why I tried very hard to make
> > > > > > > > meta-openembedded clean ( appears I failed) is that if you want to be
> > > > > > > > Yocto Compliant and include any layer that does not pass this test, you
> > > > > > > > can not become Yocto Compliant.
> > > > > > >
> > > > > > > I believe that we want meta-openembedded to be compliant, and a good
> > > > > > > example in general. I will send a backport your way for this change.
> > > > > >
> > > > > > Running the compliance script on meta-oe turned out to be an
> > > > > > interesting exercise ;)
> > > > > >
> > > > > > I have found several issues, which I have mentioned in a few different
> > > > > > threads, so I will summary here.
> > > > > >
> > > > > > * oe-core: fix the yocto-check-layer for dependency loop
> > > > > > * I have the following local commits in meta-oe:
> > > > > > meta-oe: add meta-python in LAYERDEPENDS (needed for protobuf)
> > > > > > grpc: move it from oe to networking layer
> > > > > > meta-multimedia: fixup LAYERDEPENDS (for dos2unix issue)
> > > > > >
> > > > > > With all changes above, the compliance script finds another issue with
> > > > > > meta-xfce:
> > > > > >
> > > > > > AssertionError: Adding layer meta-xfce changed signatures.
> > > > > > 7 signatures changed, initial differences (first hash before, second
> > > > > > after):
> > > > > >    vim:do_install: 588d445122dccf317f15b0dd852f3888 ->
> > > > > > ec086472d75d663c2fe836b935517810
> > > > > >
> > > > > > This is definitely a violation of one our rule since adding meta-xfce
> > > > > > changed changes vim recipe.
> > > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > Or relax your rules!!!.
> > > > > > > >
> > > > > > > > - armin
> > > > > > > > >> * in order to run the compliance report, i locally added
> > > > > > > > >> networking-layer in meta-oe/conf/layer.conf, and it creates a
> > > > > > > > >> dependency loop since meta-oe <-> meta-networking. I found out that
> > > > > > > > >> yocto-check-layer doesn't like that too much, and brutally fails.
> > > > > > The
> > > > > > > > >> following patch makes yocto-check-layer work again even with
> > > > > > > > >> dependency loop. I am going to do a few more tests and send that
> > > > > > over
> > > > > > > > >> as a patch.
> > > > > > > > >>
> > > > > > > > >> diff --git a/scripts/lib/checklayer/__init__.py
> > > > > > > > >> b/scripts/lib/checklayer/__init__.py
> > > > > > > > >> index 2618416fab..0cc9bf3b6d 100644
> > > > > > > > >> --- a/scripts/lib/checklayer/__init__.py
> > > > > > > > >> +++ b/scripts/lib/checklayer/__init__.py
> > > > > > > > >> @@ -151,11 +151,21 @@ def add_layer_dependencies(bblayersconf,
> > > > > > layer,
> > > > > > > > >> layers, logger):
> > > > > > > > >>          logger.debug('Processing dependencies %s for layer %s.' % \
> > > > > > > > >>                      (depends, layer['name']))
> > > > > > > > >>
> > > > > > > > >> +        # To avoid never ending recursion, we keep track of layers
> > > > > > while
> > > > > > > > >> +        # they are being processed in this 'static' attribute.
> > > > > > > > >> +        if not hasattr(recurse_dependencies, "layers"):
> > > > > > > > >> +            recurse_dependencies.layers = []
> > > > > > > > >> +
> > > > > > > > >>          for depend in depends.split():
> > > > > > > > >>              # core (oe-core) is suppose to be provided
> > > > > > > > >>              if depend == 'core':
> > > > > > > > >>                  continue
> > > > > > > > >>
> > > > > > > > >> +            if depend in recurse_dependencies.layers:
> > > > > > > > >> +                continue
> > > > > > > > >> +
> > > > > > > > >> +            recurse_dependencies.layers.append(depend)
> > > > > > > > >> +
> > > > > > > > >>              layer_depend = _find_layer_depends(depend, layers)
> > > > > > > > >>              if not layer_depend:
> > > > > > > > >>                  logger.error('Layer %s depends on %s and isn\'t
> > > > > > found.' % \
> > > > > > > > > Patch looks reasonable to me FWIW.
> > > > > > > > >
> > > > > > > > > Cheers,
> > > > > > > > > Paul
> > > > > > > > >
> > > > > > > > >
> > > > > > > >
> > > > > > --
> > > > > > _______________________________________________
> > > > > > Openembedded-devel mailing list
> > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > > > >
> > > >
> > > > --
> > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

