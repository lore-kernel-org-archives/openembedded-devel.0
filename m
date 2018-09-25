Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id E2A96601D4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 17:17:09 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id q4-v6so12089310otf.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 10:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1Z25L/gaK3mzDt0mtzK0F/a0DTtOUFX9nz2nE6wTxuA=;
	b=g9phQYmkrPUBkR4w8guKI8AftfEYatr7eSxFdm02+mttf5QdQsnT5Br4QwfZ9/w94k
	ehSz+WuKhEgcTKqE2H7s+ZqIJH1NmWirislCd4iAv2m6p4O9hTe3DvfV7idYFEGnh+Y+
	yFLuVaHJWcvnJCHUu/Jso4KXCHuiUht/CyHNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1Z25L/gaK3mzDt0mtzK0F/a0DTtOUFX9nz2nE6wTxuA=;
	b=gSEZWb5i8sHltoDg73LvyQlPnbituHCXCvkMysLxabsGEAKrmeznNfI0M/Nvh/juxe
	ENrEpOsBV01huggq9p83Z1KagXxfUkX9RCZMpk9vGmYtdhu/K8XoZ7KkrbZBWTBJ3vcl
	21HhErhfuS/sG6SXAdzVpVdSRfJJron2YStYFK8LIWegNEGcAKc3x3Bsrh5pVYIE8Aml
	k2kOUM49PUjDqbWmy8/1dxUyuBsckkReclTA1jsnIwb2Au1VkipnXQfKn2Xn1AoIhEr+
	cvZoeaP2pMg7C1KG0pnLdnwuOA956+LsS4XI4oQxFSY/dlO5nkQ3IjHomF7nyFlMpwkT
	YYWg==
X-Gm-Message-State: ABuFfojoClzC/jM+aSIJ072iYNrtjKVQ1fOvbUUCGjkJtMHX+uUfoIHM
	EME1w5N4LwNeQdfcTv7Bee1PDoSmIzHtoU2yD9a1NA==
X-Google-Smtp-Source: ACcGV60YNV096lAcwVJ13Uek1TamYuZ7o0rRPn7VopyfMOtTWG+eBgdHvCntcyc6/xK9uRUcmWKrJn4CDv8lYidiV4Y=
X-Received: by 2002:a9d:4008:: with SMTP id
	m8-v6mr1346168ote.283.1537895830493; 
	Tue, 25 Sep 2018 10:17:10 -0700 (PDT)
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
In-Reply-To: <20180925171016.GB1431@jama>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 25 Sep 2018 19:16:56 +0200
Message-ID: <CAP71WjyD6rLuAuwBrPucj7coP56D9kDdnwMy=rC9xNNHiMFw4Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 25 Sep 2018 17:17:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 25, 2018 at 7:10 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Tue, Sep 25, 2018 at 03:05:19PM +0200, Nicolas Dechesne wrote:
> > On Tue, Sep 25, 2018 at 12:29 PM Martin Jansa <martin.jansa@gmail.com> wrote:
> > >
> > > On Tue, Sep 25, 2018 at 12:24:31PM +0200, Martin Jansa wrote:
> > > > > meta-oe: add meta-python in LAYERDEPENDS (needed for protobuf)
> > > >
> > > > This causes another circular dependency which we don't want, doesn't it?
> >
> > What are the issues with circular dependency? LAYERDEPENDS only lists
> > each layers own dependencies, which is helpful for integrators to know
> > which layer they need to pull into bblayers.conf. If all layers from
> > LAYERDEPENDS are pulled in, then it is expected that each recipe will
> > build fine.
>
> It prevents using these layers separately.
>
> Now people can include just meta-oe without meta-python (as long as they
> fix or mask the python-protobuf dependency from protobuf-ptest - which
> is a bug not a feature).
>
> If they have circular dependency then everybody using meta-oe will be
> forced to use meta-python as well and then why should we keep them in
> separate layers? It would be the same as adding all meta-python recipes
> into meta-oe.

It is not because there are circular dependencies that meta-oe
requires meta-python, it is because of protobuf , it really depends on
meta-python... I am tempted to agree with Paul, we should make the
dependency explicitly optional using PACKAGECONFIG instead of
requiring users to fix/mask it.

>
> There was similar issue with meta-perl not so long time ago, before with
> meta-multimedia and meta-networking.. so if we don't fix these issues
> properly and just add more dependencies from meta-oe, then whole
> meta-openembedded as a repository will became one layer soon.

agreed. I think it's good to spot these issues and fix them as they come.

>
> > The only circular dependency that I am aware is with yocto-check-layer
> > script , and I sent a patch yesterday to fix this issue. With this
> > patch, yocto-check-layer works fine even when layers have inter
> > dependencies.
> >
> > https://patchwork.openembedded.org/patch/155113/
> >
> > >
> > > Especially if it's caused only by python-protobuf runtime dependency added in:
> > >
> > > https://patchwork.openembedded.org/patch/146867/
> >
> > yes. this is the culprit.
> >
> > >
> > > > On Tue, Sep 25, 2018 at 11:44 AM Nicolas Dechesne <
> > > > nicolas.dechesne@linaro.org> wrote:
> > > >
> > > > > hi Armin,
> > > > >
> > > > > On Tue, Sep 25, 2018 at 8:59 AM Nicolas Dechesne
> > > > > <nicolas.dechesne@linaro.org> wrote:
> > > > > >
> > > > > > On Mon, Sep 24, 2018 at 11:51 PM akuster808 <akuster808@gmail.com>
> > > > > wrote:
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > On 09/24/2018 02:03 PM, Paul Eggleton wrote:
> > > > > > > > Hi Nicolas,
> > > > > > > >
> > > > > > > > On Monday, 24 September 2018 10:05:02 PM NZST Nicolas Dechesne wrote:
> > > > > > > >> hi Armin, Paul, Richard,
> > > > > > > >>
> > > > > > > >> I was looking at getting the compliance report for meta-oe (sumo
> > > > > > > >> branch), and I have found a few issues.
> > > > > > > >>
> > > > > > > >> * in meta-openembedded/sumo, grpc is in meta-oe layer, while it
> > > > > > > >> depends on meta-networking (c-ares). It was fixes in master, with
> > > > > > > >> 251878e8b6b9 (grpc: move it from oe to networking layer), so I think
> > > > > > > >> this fix needs to be backported to sumo as well if we want the YP
> > > > > 2.0
> > > > > > > >> compliance script to even work. If agreed, once merged, please let
> > > > > me
> > > > > > > >> know so that I can try again to generate a compliance report.
> > > > > > > > Is it appropriate to make such moves in a stable branch? I wouldn't
> > > > > have
> > > > > > > > thought so.
> > > > > > > >
> > > > > > >
> > > > > > > We have to. Per my understanding and why I tried very hard to make
> > > > > > > meta-openembedded clean ( appears I failed) is that if you want to be
> > > > > > > Yocto Compliant and include any layer that does not pass this test, you
> > > > > > > can not become Yocto Compliant.
> > > > > >
> > > > > > I believe that we want meta-openembedded to be compliant, and a good
> > > > > > example in general. I will send a backport your way for this change.
> > > > >
> > > > > Running the compliance script on meta-oe turned out to be an
> > > > > interesting exercise ;)
> > > > >
> > > > > I have found several issues, which I have mentioned in a few different
> > > > > threads, so I will summary here.
> > > > >
> > > > > * oe-core: fix the yocto-check-layer for dependency loop
> > > > > * I have the following local commits in meta-oe:
> > > > > meta-oe: add meta-python in LAYERDEPENDS (needed for protobuf)
> > > > > grpc: move it from oe to networking layer
> > > > > meta-multimedia: fixup LAYERDEPENDS (for dos2unix issue)
> > > > >
> > > > > With all changes above, the compliance script finds another issue with
> > > > > meta-xfce:
> > > > >
> > > > > AssertionError: Adding layer meta-xfce changed signatures.
> > > > > 7 signatures changed, initial differences (first hash before, second
> > > > > after):
> > > > >    vim:do_install: 588d445122dccf317f15b0dd852f3888 ->
> > > > > ec086472d75d663c2fe836b935517810
> > > > >
> > > > > This is definitely a violation of one our rule since adding meta-xfce
> > > > > changed changes vim recipe.
> > > > >
> > > > > >
> > > > > > >
> > > > > > > Or relax your rules!!!.
> > > > > > >
> > > > > > > - armin
> > > > > > > >> * in order to run the compliance report, i locally added
> > > > > > > >> networking-layer in meta-oe/conf/layer.conf, and it creates a
> > > > > > > >> dependency loop since meta-oe <-> meta-networking. I found out that
> > > > > > > >> yocto-check-layer doesn't like that too much, and brutally fails.
> > > > > The
> > > > > > > >> following patch makes yocto-check-layer work again even with
> > > > > > > >> dependency loop. I am going to do a few more tests and send that
> > > > > over
> > > > > > > >> as a patch.
> > > > > > > >>
> > > > > > > >> diff --git a/scripts/lib/checklayer/__init__.py
> > > > > > > >> b/scripts/lib/checklayer/__init__.py
> > > > > > > >> index 2618416fab..0cc9bf3b6d 100644
> > > > > > > >> --- a/scripts/lib/checklayer/__init__.py
> > > > > > > >> +++ b/scripts/lib/checklayer/__init__.py
> > > > > > > >> @@ -151,11 +151,21 @@ def add_layer_dependencies(bblayersconf,
> > > > > layer,
> > > > > > > >> layers, logger):
> > > > > > > >>          logger.debug('Processing dependencies %s for layer %s.' % \
> > > > > > > >>                      (depends, layer['name']))
> > > > > > > >>
> > > > > > > >> +        # To avoid never ending recursion, we keep track of layers
> > > > > while
> > > > > > > >> +        # they are being processed in this 'static' attribute.
> > > > > > > >> +        if not hasattr(recurse_dependencies, "layers"):
> > > > > > > >> +            recurse_dependencies.layers = []
> > > > > > > >> +
> > > > > > > >>          for depend in depends.split():
> > > > > > > >>              # core (oe-core) is suppose to be provided
> > > > > > > >>              if depend == 'core':
> > > > > > > >>                  continue
> > > > > > > >>
> > > > > > > >> +            if depend in recurse_dependencies.layers:
> > > > > > > >> +                continue
> > > > > > > >> +
> > > > > > > >> +            recurse_dependencies.layers.append(depend)
> > > > > > > >> +
> > > > > > > >>              layer_depend = _find_layer_depends(depend, layers)
> > > > > > > >>              if not layer_depend:
> > > > > > > >>                  logger.error('Layer %s depends on %s and isn\'t
> > > > > found.' % \
> > > > > > > > Patch looks reasonable to me FWIW.
> > > > > > > >
> > > > > > > > Cheers,
> > > > > > > > Paul
> > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-devel mailing list
> > > > > Openembedded-devel@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > > >
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

