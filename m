Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
	[209.85.167.170])
	by mail.openembedded.org (Postfix) with ESMTP id D12A1605B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 06:59:18 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id u197-v6so22995oif.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 23:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2hgBNUrPceyZxKd8DlbJElLmTc/WE0e4ChyrqRqzYF8=;
	b=X9o8btjacYr8LFM6fGzVILoYA1p06AV2qRk7icjYfnTOgiJAHi3+gK3HraaXqsBDPz
	RQjETPpKoq8auLFNvyIyiPRh9yNrEHaJ6omA6VspV3KNziT2JQNvNP6m9YvJ1/ZC0DNI
	fN19r+ucn1ysGN1UfXkNNVr4zQxProQssKPYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2hgBNUrPceyZxKd8DlbJElLmTc/WE0e4ChyrqRqzYF8=;
	b=JHwXX6/2GkBjOwp1ZQemivpdcESuduxZN3o/bZwSL5AFhHGD1C1m6abIkmF319ETtd
	1AOlFZJAx7Z9sRAzqmQlsl6CNdZS3Nhg3nVKcukgM1yIrxBFcJ0uW7lYpvs0zWC97hCx
	+tkl48R/P4XoZisZCyaNjbGhLhIDpB+1ZJueH19sVJ4jEEbvGmO7Q5/oolrt570kJdjF
	UbtR66PcPt41W1VESbARzbw9y1Vt4dzWsBrdkWEwksyjgXA7WdSHrXKHtyE2jj0IM3xW
	hgBLOxxmgN4ul3f4G8/b2pLfsBHdshbtAigP96zs3SPC7Bjdd4dqFTaxzOfRY7Pq+QZY
	k6wQ==
X-Gm-Message-State: ABuFfohZyzmt0qlNrgOTz5/UQiU4VS61q9mdbhdA/qsz3NCInuET2JEK
	JHlgo0h98mtEsR2rez4KP8KL+MSh6ClMlHPET60FRQ==
X-Google-Smtp-Source: ACcGV61gTBXnsGMZ2kwvebaf6pHeFQjC/pcPRW0zOOLhLp/f3t6MhEUhau3ARR0Gc5uS+Bg1QC85c9Ncsl7G6zBdkDw=
X-Received: by 2002:aca:120b:: with SMTP id 11-v6mr510816ois.151.1537858759379;
	Mon, 24 Sep 2018 23:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71Wjxwv3i2=UtbzNai79h-f83xcL6G1R8+kY-C-jA==VFy9Q@mail.gmail.com>
	<2100274.NFsm02Mysr@localhost.localdomain>
	<98342371-c064-7866-1ea1-14819d88a71f@gmail.com>
In-Reply-To: <98342371-c064-7866-1ea1-14819d88a71f@gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 25 Sep 2018 08:59:08 +0200
Message-ID: <CAP71WjyhuQ06BzuYgNDvGDLFo18jyYY4KkFfE0_GFKxWJ7Poyw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
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
X-List-Received-Date: Tue, 25 Sep 2018 06:59:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 24, 2018 at 11:51 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 09/24/2018 02:03 PM, Paul Eggleton wrote:
> > Hi Nicolas,
> >
> > On Monday, 24 September 2018 10:05:02 PM NZST Nicolas Dechesne wrote:
> >> hi Armin, Paul, Richard,
> >>
> >> I was looking at getting the compliance report for meta-oe (sumo
> >> branch), and I have found a few issues.
> >>
> >> * in meta-openembedded/sumo, grpc is in meta-oe layer, while it
> >> depends on meta-networking (c-ares). It was fixes in master, with
> >> 251878e8b6b9 (grpc: move it from oe to networking layer), so I think
> >> this fix needs to be backported to sumo as well if we want the YP 2.0
> >> compliance script to even work. If agreed, once merged, please let me
> >> know so that I can try again to generate a compliance report.
> > Is it appropriate to make such moves in a stable branch? I wouldn't have
> > thought so.
> >
>
> We have to. Per my understanding and why I tried very hard to make
> meta-openembedded clean ( appears I failed) is that if you want to be
> Yocto Compliant and include any layer that does not pass this test, you
> can not become Yocto Compliant.

I believe that we want meta-openembedded to be compliant, and a good
example in general. I will send a backport your way for this change.

>
> Or relax your rules!!!.
>
> - armin
> >> * in order to run the compliance report, i locally added
> >> networking-layer in meta-oe/conf/layer.conf, and it creates a
> >> dependency loop since meta-oe <-> meta-networking. I found out that
> >> yocto-check-layer doesn't like that too much, and brutally fails. The
> >> following patch makes yocto-check-layer work again even with
> >> dependency loop. I am going to do a few more tests and send that over
> >> as a patch.
> >>
> >> diff --git a/scripts/lib/checklayer/__init__.py
> >> b/scripts/lib/checklayer/__init__.py
> >> index 2618416fab..0cc9bf3b6d 100644
> >> --- a/scripts/lib/checklayer/__init__.py
> >> +++ b/scripts/lib/checklayer/__init__.py
> >> @@ -151,11 +151,21 @@ def add_layer_dependencies(bblayersconf, layer,
> >> layers, logger):
> >>          logger.debug('Processing dependencies %s for layer %s.' % \
> >>                      (depends, layer['name']))
> >>
> >> +        # To avoid never ending recursion, we keep track of layers while
> >> +        # they are being processed in this 'static' attribute.
> >> +        if not hasattr(recurse_dependencies, "layers"):
> >> +            recurse_dependencies.layers = []
> >> +
> >>          for depend in depends.split():
> >>              # core (oe-core) is suppose to be provided
> >>              if depend == 'core':
> >>                  continue
> >>
> >> +            if depend in recurse_dependencies.layers:
> >> +                continue
> >> +
> >> +            recurse_dependencies.layers.append(depend)
> >> +
> >>              layer_depend = _find_layer_depends(depend, layers)
> >>              if not layer_depend:
> >>                  logger.error('Layer %s depends on %s and isn\'t found.' % \
> > Patch looks reasonable to me FWIW.
> >
> > Cheers,
> > Paul
> >
> >
>

