Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7F80C7F3A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 19:54:30 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id f10so4111560qkg.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 12:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ja5K3IkZJtAv0YzRoMwkcEBYIqifSMfxGhPP+HY1CDY=;
	b=jqfnUFhV9zFjfE4hTe7EDejU1VgzoDGYVIGu2vUXPYyCtZcxObi4DlYtUW2qPwv/kx
	f0MbNEFKu3Div9HPD2HqSbenw+zGmKKF9OEqTjkGmoNFBw9cDXmd6H8Xi1h3+xd8yUkQ
	B2hXjcu0h9t4OxTo3cjKBY2K/g1gJIWdQq3uaTNWdAredXv5Ys/VhnS2Um8JCNSjR4O6
	ksJkpLkyEdaeanWCeOOqOCWPCV7GY4xhvZIBvbHK8NuH25nkP2UBJeJPylAuz82wqd7m
	fPyaLTADCfjhw6Uk5chE9rdegi2hfkKYlD5IC3/MQ4yYrkpElMG7qEYbzaeEkJDAc0+0
	h+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ja5K3IkZJtAv0YzRoMwkcEBYIqifSMfxGhPP+HY1CDY=;
	b=n5XFnQMRBuzWOFuXxwo66E1jlobvB6R++rjGC7f+tTEgswqN4WlwCFqPWrBpkqknvA
	hSe26PPt8lRa08f6owkr7NWsCp09PfXXyrB9pIyf3lQCThZs7lYoTm1Yhk+Is3OSWzkw
	sOF0v8/1s5cuovhYixIZ9gIaUkqgH0dV+UJ83IKrY3IoxKOpoW8P9b48hTsbp6yFEN8d
	Bf/L4YlJjcVCr+IE1Wt2I02sGSHRfVCTw/QwfOHQY7bPjs+6shy2iOfeiedlnyJGd0cb
	RnP8q28rM7qnc4a2KFJ/9APcnXhJTpCxk5er2kb4xFNt2uxF9mhCChn244UybXIX6Uqe
	z9Uw==
X-Gm-Message-State: APjAAAUeNDmhixCXj+hj4AJvIMQ/xHUyhAMVqEFqVMMGwtpgq6bVRkwp
	oBQnUWXZpcTxfv6Yowir8fC3NtLp+tIbf8X8av0JV2nX
X-Google-Smtp-Source: APXvYqz+brdElXGNEzz45W8I9WtfTd6PHQZwOjeDgnKLC77XsORiNetNA1e7abzMotjyT2Dvc1tOkde1sretk2gKCQE=
X-Received: by 2002:a37:c403:: with SMTP id d3mr4623358qki.212.1567108471071; 
	Thu, 29 Aug 2019 12:54:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190829103934.21804-1-bunk@stusta.de>
	<CAMKF1srGz8Zw4vh3_9GJsbmrKzARCrVHrs9k9tmd=aAznXHTHA@mail.gmail.com>
	<20190829191417.GA24691@localhost>
In-Reply-To: <20190829191417.GA24691@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Aug 2019 12:54:16 -0700
Message-ID: <CAMKF1sp-XUzwLpW4_VfWkDOH8vuJ4TAo+Wgj+uPFS4DWSox1wg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libwebsockets: Fix the build with -Os
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
X-List-Received-Date: Thu, 29 Aug 2019 19:54:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 29, 2019 at 12:14 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, Aug 29, 2019 at 11:46:55AM -0700, Khem Raj wrote:
> > On Thu, Aug 29, 2019 at 3:39 AM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > lib/event-libs/libuv/libuv.c: In function 'elops_destroy_context1_uv':
> > > lib/event-libs/libuv/libuv.c:519:7: error: 'm' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> > >     if (m)
> > >        ^
> > >
> > > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > > ---
> > >  .../recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb   | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
> > > index 50620d99e..fcabeb902 100644
> > > --- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
> > > +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.1.0.bb
> > > @@ -28,3 +28,5 @@ EXTRA_OECMAKE += " \
> > >  PACKAGES =+ "${PN}-testapps"
> > >
> > >  FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
> > > +
> > > +CFLAGS_append = " -Wno-error"
> >
> > is it possible to fix the underlying problem? since Os is not default
> > it definitely could be a bug in upstream but
> > by disabling warnings for all kind of builds we are  painting with broad brush
>
> The underlying problem is that some gcc warnings are not reliable with -Os,
> there are bugs open in the gcc bugzilla for that.
>
I am aware of that for maybe-* warnings heuristics may go wrong, but
then its better to just disable that
one warning from being treated as error if thats possible to add
easily something like
-Wno-error=maybe-uninitialized could do it.

> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

