Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id B016062131
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 02:08:50 +0000 (UTC)
Received: by igcto18 with SMTP id to18so28106430igc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2015 18:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=NDdyW6kY9aFpohDacOTwFVzH1w/UTiUC53jvnOA1T1E=;
	b=m6s1U9og0245HJ/w7s9TJG9FcVM237kcYnebNresK4VXIe0iQ9nH3N2hK+tY5MQqRW
	QWo2NzSZAOOFSQRLCs+8KtIb6bSf2ArvskBjQzwgUvDSWDzn/H4GTWukMedJwfc2PEFL
	U/aF03V7ZEC9crmQBTPxsf8gRMxyTYSI0uUJaan1+zp8SPJs97uiqkbLl9H4JQA9k3kw
	wVeRZRpdgc5gO/4AMBvxTAjkQlD/ynUS7L36XZtQ+rAXKX4OYBcp3cIFELxmjeXqGDWg
	CnbLlTr394D/02h5Z80PLnCzDfjN1ArSZpI0oNiY3nlSwJRWRKI6nI2FtcnaYJBa7ha2
	hOlQ==
X-Received: by 10.50.13.72 with SMTP id f8mr5438575igc.38.1447812530854; Tue,
	17 Nov 2015 18:08:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.93.7 with HTTP; Tue, 17 Nov 2015 18:08:31 -0800 (PST)
In-Reply-To: <577B0BDF-3AAB-44E9-AA59-781219452896@gmail.com>
References: <9A2ED550-50FC-4223-B79E-5801010FEF49@gmail.com>
	<CABcZAN=+c2SkEiZtVjZ1ZGtp5dXs79xYmRh2f1P50qV0Kzd2cw@mail.gmail.com>
	<CABcZAN=EgNrRxnML=Jb_ipNL-yYiFfwZRQLVaoNT2qBmpHA+rQ@mail.gmail.com>
	<577B0BDF-3AAB-44E9-AA59-781219452896@gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 17 Nov 2015 19:08:31 -0700
Message-ID: <CABcZANm4cka2so5sm0C0FQcJXzAeNjXqBkNAjQChH4VqL=EUTA@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] talloc: rename to libtalloc and cleanup dependency mess
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
X-List-Received-Date: Wed, 18 Nov 2015 02:08:51 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 13, 2015 at 10:08 AM, Jens Rehsack <rehsack@gmail.com> wrote:

> > Am 13.11.2015 um 18:01 schrieb Christopher Larson <kergoth@gmail.com>:
> >
> > On Fri, Nov 13, 2015 at 9:56 AM, Christopher Larson <kergoth@gmail.com>
> wrote:
> > On Fri, Nov 13, 2015 at 8:53 AM, Jens Rehsack <rehsack@gmail.com> wrote:
> > To avoid errors when building dev-images (talloc-dev is missing), and to
> avoid
> > insane empty packages for that, rename talloc -> libtalloc as libtevent
> shows.
> >
> > With that, remove dependencies to attr/xattr and libbsd - unless
> explicitely
> > enabled via PACKAGECONFIG.
> >
> > Signed-off-by: Jens Rehsack <sno@netbsd.org>
> >
> > Our recipe names should be named based on the upstream project name, not
> the library they happen to ship.
> >
> > Instead, either we could we should kill all the libtalloc bits in the
> PACKAGES var, and let the debian shlib renaming handle renaming talloc* to
> libtalloc*, or add a talloc-dev that pulls in libtalloc-dev & pytalloc-dev.
> >
> > I just realized this may sound critical, but that wasn't intended. The
> other changes look great, thanks for your work on making those dependencies
> optional, it's good stuff.
>
> In that case - please take me by the hand and explain a bit more detailed
>
> > Instead, either we could we should kill all the libtalloc bits in the
> PACKAGES var, and let the debian shlib renaming handle renaming talloc* to
> libtalloc*
>
> since I have no clue what you try to guide me.


I'm not able to reproduce any error when building an image. Add libtalloc
and dev-pkgs, and it builds just fine. You can't add talloc, as there is no
talloc package emitted.

That said, what I was suggesting was something along the lines of
https://gist.github.com/kergoth/ead0e1d2682a9e9fcd59 -- debian.bbclass will
automatically rename the ${PN}, ${PN}-dev, and ${PN}-dbg packages based on
the library soname, so will end up named libtalloc* anyway if you use it.
Since the main packages weren't emitted at all, it was pointless complexity
in the packaging to add libtalloc* explicitly.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

