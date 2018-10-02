Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9AB177950E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Oct 2018 18:44:02 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id c25-v6so3125574qtp.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Oct 2018 11:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hO6UQWYzUbbfXlbeO65QmvABfGN1Pa+/u7Iggb5ZkUs=;
	b=VMy+RCW43JieXL9RWnvDa9gYb14DM5BjP5cB4YF04XuQgbw4+Bbp6RWN9Foj85YVPB
	BUPAlvQvk2rHrMxZQHtIPp6M1daN7s6JprSqyrWw++9gwpuDvN4r7+Nr+Hyk3AhCOyhT
	vqDbgDJpO+ItaclqZkUcJSiRyfsS8TOx0LUbl9GXtg29f9yqx5iU63jZ/Q4xDhI+8yy8
	l6Mkq0by36mHvYvPbEO8dV+mAGsdZPvvXS9T5rOcmxxVPHU8Pb+lil3g2LOG4LjWAO33
	jYhuMpinuxEhgb/OzR7a0E+sKLi5mtkgEoSOPxuPGV+QA5poaPj3FnLOi0fNDepXKDXy
	flzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hO6UQWYzUbbfXlbeO65QmvABfGN1Pa+/u7Iggb5ZkUs=;
	b=LCpXEBO1t2vMhkyBn8YG9QfPEJL4ducRxjaABKre1NRmGVhWSUdvod35KZ5aLEWA85
	9KJZVW+6ByV+VdgFyn95M9DqcMAfT+kviLEx7txXHT8h7H93M/9fS0MB6CssPot9Ngt9
	rrF20OpmxgmI6mzFJptpbdJl6qUGp9Fle+ZImjHsqfPArW88qGzYHCLjEt4oYCGPLqgh
	cIWl73Sb/38pFsXNK9EWE6k2X66k+ZdDJDF3U7c3a1Aq3f6N4jNq3Njlxkn9RGX8Ctrg
	IELDdLPnqFMxE/Ei/LBHL2UdWYMum31ijmdrozAkqnfMpaTZfbKpdOgwBr37BPG2uBKU
	EVzw==
X-Gm-Message-State: ABuFfojlpqUrD80yyJ+UsZsoAdUNAVW5gEUp2d2ZElGBWln0VOLtVmd/
	3ITxOvj7vT6q1AbzifGqfCPLZcWcJquOS8vhZ9g=
X-Google-Smtp-Source: ACcGV63CIkC2JIg1B6JDV5wvnY+MgbB7nWy0+geOz8X1OeUkr9zCPRPsESneo7w0LyO7A1DJv0yJ4WkoqzWLOYHPH/o=
X-Received: by 2002:a0c:f091:: with SMTP id
	g17-v6mr13546567qvk.55.1538505843277; 
	Tue, 02 Oct 2018 11:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <20181002083238.74140-1-uvv.mail@gmail.com>
	<CAMKF1srWp+SANX2zBC_H4tRZS_Jk7+2ZMXBgA4z==+h7KyjTsg@mail.gmail.com>
	<575d6aa9-91d2-b4e6-2f0c-0b7a1edfad39@gmail.com>
In-Reply-To: <575d6aa9-91d2-b4e6-2f0c-0b7a1edfad39@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Oct 2018 11:43:35 -0700
Message-ID: <CAMKF1sry7NjSZ13OfVLwMv9nf6cTjg8hzgWQmLgK64yVgLxSwA@mail.gmail.com>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libeigen: allow empty packages
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
X-List-Received-Date: Tue, 02 Oct 2018 18:44:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 2, 2018 at 10:52 AM Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>
> Hi Khem,
> It's a build time failure. libeigen is header-only library.
> All headers go into dev package, therefore the main package is empty.
> Dependency on the dev package doesn't work, AFAIK, so you have to allow
> empty package for build to succeed. Otherwise I get an error that empty
> packages are not allowed. I reproduced it when I built ceres-solver
> recipe (although I don't use the latest poky). Perhaps I'm missing
> something and it has been solved in the latest poky?
>

that helps. So lets add this to commit message and send v2, we could then move
ahead with this patch.

> Vyacheslav
>
> On 02/10/2018 17:14, Khem Raj wrote:
> > Hi Vyacheslav
> >
> > On Tue, Oct 2, 2018 at 1:33 AM Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
> >> When libeigen is used as a dependency (e.g. in ceres library),
> >> the build is broken because empty packages are not constructed be default
> >>
> > can you explain a bit more on whats going on? it is a runtime failure
> > or build time failure.
> >
> >> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> >> ---
> >>   meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
> >> index 31a42a9d6..a59320655 100644
> >> --- a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
> >> +++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
> >> @@ -18,3 +18,4 @@ FILES_${PN}-dev = "${includedir} ${datadir}/eigen3/cmake ${datadir}/cmake/Module
> >>   # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
> >>   RDEPENDS_${PN}-dev = ""
> >>   RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
> >> +ALLOW_EMPTY_${PN} = "1"
> >> --
> >> 2.19.0
> >>
> >> --
> >> _______________________________________________
>

