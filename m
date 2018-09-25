Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id E922C744AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 10:24:41 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id c14-v6so12764487wmb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 03:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ROEG72uHPWTYj5FFK1nk+IboDJ0clzZqW+0e66azRdc=;
	b=CgMPzB1vh8niYyBia+a/uLjPe77tUZEq33vO3hRMRIna/9JQSRyjkbjK75Dw8FJEW/
	K8zC8gABjnP2XV2YsUisj0de3I3FKWnhPeFAflsFMnnBNugPbHBuNqxgYnTRfT4EWd8p
	b2FrHCXVQMLQ790KCeI7nwM88u4nJVis0ox0NkncQcQyRvGJyYQ+1P3MKe7umd4xRZv8
	4Ujn9rL4nBtKSxSoD3m/K6OCPXZksgbkMewOVD2LquNbmLBwzB6mvXnitDqWLzKGtsU3
	P2En+O/zmERZzLGnwDQb2nJXc9xRcqXSMVn69NIPxfuFUsTIIbTmR/nurlnwSUQsrSQt
	qYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ROEG72uHPWTYj5FFK1nk+IboDJ0clzZqW+0e66azRdc=;
	b=dLLk7kwfWVDcH4TZrqcGsmZhuiucnIGx0KQQOHDb8nsEDTNIBiWBbQhIEXu7SgAOCY
	ucWNvFPeqVgyx7JBZ1FZlweu+R7budBufQKtj061VOlBiRR467RYIuM3ceSJGNAcumuJ
	uBDGwPNDVIiz9UCh/DUYXTrV3JVWnl9PD09Eh+JgNJrJpGdmeG3QO7ehEmxJ/ab5jk1N
	vs8gzCp6LcWtvfnpxyfB1wAPQft/WmagvDpc4DPUOXy8L8fQNJvCk21obCROIv6UBD5W
	/qarO47MK+PoiposFb/jGYPrXFHQAN8L8ZepxGXTDmdwmRov40IIMsGfbuo9HBSagwnW
	bfkA==
X-Gm-Message-State: ABuFfogKx5p/UAVOlnGietL1hvaYWgqg6ilwbTXJh4fR3zeB6lnNirw1
	IvQvk9UaJ+02mpQ7BOiCQaHsEB7t1lYW/voqsn4=
X-Google-Smtp-Source: ACcGV62RqQQhzJ7j08WWWq4Ii3DcT2KgOLhHhf4iIkx6Hs2AD3pafZwMVlWlw9y5QYKJm5Vs7bP65lfrsKDXNgUalYQ=
X-Received: by 2002:a1c:cec5:: with SMTP id e188-v6mr81359wmg.85.1537871082572;
	Tue, 25 Sep 2018 03:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71Wjxwv3i2=UtbzNai79h-f83xcL6G1R8+kY-C-jA==VFy9Q@mail.gmail.com>
	<2100274.NFsm02Mysr@localhost.localdomain>
	<98342371-c064-7866-1ea1-14819d88a71f@gmail.com>
	<CAP71WjyhuQ06BzuYgNDvGDLFo18jyYY4KkFfE0_GFKxWJ7Poyw@mail.gmail.com>
	<CAP71WjzB-xkVAnLOBd0jLdKXTh8B87dpHiQUvGhhzm8Q2fNzXQ@mail.gmail.com>
In-Reply-To: <CAP71WjzB-xkVAnLOBd0jLdKXTh8B87dpHiQUvGhhzm8Q2fNzXQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 25 Sep 2018 12:24:31 +0200
Message-ID: <CA+chaQf=U8HMA1JeX5SwvXG=Ob8GSdsAyj3fj1OZcVHxDqjk3g@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Tue, 25 Sep 2018 10:24:42 -0000
Content-Type: text/plain; charset="UTF-8"

> meta-oe: add meta-python in LAYERDEPENDS (needed for protobuf)

This causes another circular dependency which we don't want, doesn't it?

On Tue, Sep 25, 2018 at 11:44 AM Nicolas Dechesne <
nicolas.dechesne@linaro.org> wrote:

> hi Armin,
>
> On Tue, Sep 25, 2018 at 8:59 AM Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
> >
> > On Mon, Sep 24, 2018 at 11:51 PM akuster808 <akuster808@gmail.com>
> wrote:
> > >
> > >
> > >
> > > On 09/24/2018 02:03 PM, Paul Eggleton wrote:
> > > > Hi Nicolas,
> > > >
> > > > On Monday, 24 September 2018 10:05:02 PM NZST Nicolas Dechesne wrote:
> > > >> hi Armin, Paul, Richard,
> > > >>
> > > >> I was looking at getting the compliance report for meta-oe (sumo
> > > >> branch), and I have found a few issues.
> > > >>
> > > >> * in meta-openembedded/sumo, grpc is in meta-oe layer, while it
> > > >> depends on meta-networking (c-ares). It was fixes in master, with
> > > >> 251878e8b6b9 (grpc: move it from oe to networking layer), so I think
> > > >> this fix needs to be backported to sumo as well if we want the YP
> 2.0
> > > >> compliance script to even work. If agreed, once merged, please let
> me
> > > >> know so that I can try again to generate a compliance report.
> > > > Is it appropriate to make such moves in a stable branch? I wouldn't
> have
> > > > thought so.
> > > >
> > >
> > > We have to. Per my understanding and why I tried very hard to make
> > > meta-openembedded clean ( appears I failed) is that if you want to be
> > > Yocto Compliant and include any layer that does not pass this test, you
> > > can not become Yocto Compliant.
> >
> > I believe that we want meta-openembedded to be compliant, and a good
> > example in general. I will send a backport your way for this change.
>
> Running the compliance script on meta-oe turned out to be an
> interesting exercise ;)
>
> I have found several issues, which I have mentioned in a few different
> threads, so I will summary here.
>
> * oe-core: fix the yocto-check-layer for dependency loop
> * I have the following local commits in meta-oe:
> meta-oe: add meta-python in LAYERDEPENDS (needed for protobuf)
> grpc: move it from oe to networking layer
> meta-multimedia: fixup LAYERDEPENDS (for dos2unix issue)
>
> With all changes above, the compliance script finds another issue with
> meta-xfce:
>
> AssertionError: Adding layer meta-xfce changed signatures.
> 7 signatures changed, initial differences (first hash before, second
> after):
>    vim:do_install: 588d445122dccf317f15b0dd852f3888 ->
> ec086472d75d663c2fe836b935517810
>
> This is definitely a violation of one our rule since adding meta-xfce
> changed changes vim recipe.
>
> >
> > >
> > > Or relax your rules!!!.
> > >
> > > - armin
> > > >> * in order to run the compliance report, i locally added
> > > >> networking-layer in meta-oe/conf/layer.conf, and it creates a
> > > >> dependency loop since meta-oe <-> meta-networking. I found out that
> > > >> yocto-check-layer doesn't like that too much, and brutally fails.
> The
> > > >> following patch makes yocto-check-layer work again even with
> > > >> dependency loop. I am going to do a few more tests and send that
> over
> > > >> as a patch.
> > > >>
> > > >> diff --git a/scripts/lib/checklayer/__init__.py
> > > >> b/scripts/lib/checklayer/__init__.py
> > > >> index 2618416fab..0cc9bf3b6d 100644
> > > >> --- a/scripts/lib/checklayer/__init__.py
> > > >> +++ b/scripts/lib/checklayer/__init__.py
> > > >> @@ -151,11 +151,21 @@ def add_layer_dependencies(bblayersconf,
> layer,
> > > >> layers, logger):
> > > >>          logger.debug('Processing dependencies %s for layer %s.' % \
> > > >>                      (depends, layer['name']))
> > > >>
> > > >> +        # To avoid never ending recursion, we keep track of layers
> while
> > > >> +        # they are being processed in this 'static' attribute.
> > > >> +        if not hasattr(recurse_dependencies, "layers"):
> > > >> +            recurse_dependencies.layers = []
> > > >> +
> > > >>          for depend in depends.split():
> > > >>              # core (oe-core) is suppose to be provided
> > > >>              if depend == 'core':
> > > >>                  continue
> > > >>
> > > >> +            if depend in recurse_dependencies.layers:
> > > >> +                continue
> > > >> +
> > > >> +            recurse_dependencies.layers.append(depend)
> > > >> +
> > > >>              layer_depend = _find_layer_depends(depend, layers)
> > > >>              if not layer_depend:
> > > >>                  logger.error('Layer %s depends on %s and isn\'t
> found.' % \
> > > > Patch looks reasonable to me FWIW.
> > > >
> > > > Cheers,
> > > > Paul
> > > >
> > > >
> > >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

