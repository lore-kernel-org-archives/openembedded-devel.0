Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 21D5A78766
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Mar 2018 00:05:08 +0000 (UTC)
Received: by mail-ua0-f176.google.com with SMTP id m43so8259713uah.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Mar 2018 16:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eSfNq7iIo+lW8iAjqN2gkJfxEX4wVE7B5+5PUHfemmE=;
	b=KEY37vS5Qjo5qaFqlOhbCFHnEu7YXSjyKJFxQJ6Mlw0Dmtg8vmkdUVZa5s3pTpn7iX
	kbzSndR/lqNtBOif+1gD7iUyWIVsLHCvfujhk851FDZRq/QITsMqI3aShDljdNI4snn2
	TdmpMkbIs4UoP+KznwMQRVCcCYJlhxfoamnNluMKr92IiVXKBOy3B8By8GP7D05nWjx/
	C9U2+E6X69Gk1nJ4f8ZwJY0PAbs6xnwlkPxDooUsGGkM0Ss8PsDBEP0SAdwEReCTsFY6
	iTH7wpBK8x1pcoCfvewE/at6QBnKKTa9lxITI08eqn06jDjcahukCXxKcpHLKHLEV0B2
	vngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eSfNq7iIo+lW8iAjqN2gkJfxEX4wVE7B5+5PUHfemmE=;
	b=jeh/+gWMRhf+Qurn/Ggge3i4ccnzILz+IhHdZDGgAdqr4XCxlqbTddNzFlLjCWLFd1
	pxp2Sfqm2PANKCa+jrOWjNWJVMgIWOrNSakFVh1S2nAE9A2WVgzzTfvO05sH9szLblDs
	k2LRwqh9V07+LBvnwxNa84XIvTBSu+0mz2UsOId+HR2acgVJdSRtQamOzDx7Jl6JV5CB
	24SpirAx/ZVjCfiFQqtFm6mdlamF/xzBibYcwb44F6XJxrkQAEkTyqaqbtaHpTifEuMz
	wKKS3Aq6VB5HKEYH9J0nw9X9uSz1sxiM2RiQ5bJv/ULJpW9QmibHv7RiV3LchGTz4/5Q
	54yA==
X-Gm-Message-State: APf1xPAmBZzbn+0Aj9773l/cy/BCwY/zo7C7mYhIjFH/CirR0DHNcGsI
	Djb+bwxL4mtPIhjiOmX787325QqSrqSkvObEew8=
X-Google-Smtp-Source: AG47ELtUP62z3Dh9VhWP2VxHE8w+JDAisSteluW/9WWMAHY0/S25Wr68aOt+vk6R8kW5yF8eRWGGi8zMgwb4zfaW5/E=
X-Received: by 10.176.20.49 with SMTP id b46mr7210274uae.28.1520121908615;
	Sat, 03 Mar 2018 16:05:08 -0800 (PST)
MIME-Version: 1.0
References: <1520089170-25302-1-git-send-email-derek@asterius.io>
	<4ef80f7b-18fa-2615-3b08-bfe25ad169da@gmail.com>
	<CADNbA1pnZFQqyNpxqiGtW8m4YGONHB1kcCZxmeCLr=LkBkg=gA@mail.gmail.com>
	<CAMKF1srdL6JxV-ve1qA3OeGFV-yzagzkqxhU4OUrXbAmvvCUQg@mail.gmail.com>
	<CANx9H-AEN6rCFenD7F9TBPfn9c4jPwswmb7fH0Hq=DDQvsB+VQ@mail.gmail.com>
	<18b0c3c3-c634-4bd6-1fb5-62d32b783e8a@balister.org>
In-Reply-To: <18b0c3c3-c634-4bd6-1fb5-62d32b783e8a@balister.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 04 Mar 2018 00:04:58 +0000
Message-ID: <CANx9H-B7pgCOswJZdQ=AzVT+QBNxh+vgpDFDe2SXpDs=cP=r4Q@mail.gmail.com>
To: Philip Balister <philip@balister.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCHv2] python-sqlalchemy: update to version 1.1.17
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
X-List-Received-Date: Sun, 04 Mar 2018 00:05:09 -0000
Content-Type: text/plain; charset="UTF-8"

the input to patchtest is a feed from a mailing list. The
openembedded-devel list is multiple layers and patchtest was not written
for that design.
On Sat, Mar 3, 2018 at 3:42 PM Philip Balister <philip@balister.org> wrote:

> On 03/03/2018 06:09 PM, Tim Orling wrote:
> > It is about which resources are running the actual patchtest job (Linux
> > Foundation vs. Open Embedded) and the complication of multiple layers all
> > going to one mailing list (openembedded-devel). This was part of the
> > motivation for splitting up meta-openembedded, which turns into nothing
> but
> > a flame war (well, no obvious outcome or conclusion anyway). The solution
> > is probably to improve patchtest. But we still need to decide who and
> where
> > will run the actual job. We can discuss, yet again, at OEDAM.
>
> I'm confused why you can't use patchtest with the individual layers in
> meta-oe. Keeping several layers within one git repo is a useful
> construct. We should be able to sort out how to manage this.
>
> Declaring the construct to be the problem is not a useful starting point.
>
> Philip
>
> >
> > On Sat, Mar 3, 2018 at 11:59 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> >> On Sat, Mar 3, 2018 at 11:24 AM, Derek Straka <derek@asterius.io>
> wrote:
> >>> Is there a reason the patchtest scripts are not run on the openembedded
> >>> layers?  Is it just a matter of doing the work?
> >>>
> >>
> >> I believe so.
> >>
> >>> On Sat, Mar 3, 2018 at 11:42 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 3/3/18 6:59 AM, Derek Straka wrote:
> >>>>>
> >>>>> Update the license checksum for copyright year and verify the terms
> >>>>> remain the same
> >>>>>
> >>>>> diff -u SQLAlchemy-1.1.15/LICENSE SQLAlchemy-1.1.17/LICENSE
> >>>>> --- SQLAlchemy-1.1.15/LICENSE   2017-11-03 16:47:01.000000000 -0400
> >>>>> +++ SQLAlchemy-1.1.17/LICENSE   2018-02-22 16:08:41.000000000 -0500
> >>>>> @@ -1,6 +1,6 @@
> >>>>>   This is the MIT license:
> >>>>> http://www.opensource.org/licenses/mit-license.php
> >>>>>
> >>>>> -Copyright (c) 2005-2017 the SQLAlchemy authors and contributors <see
> >>>>> AUTHORS file>.
> >>>>> +Copyright (c) 2005-2018 the SQLAlchemy authors and contributors <see
> >>>>> AUTHORS file>.
> >>>>
> >>>>
> >>>> Thanks for follow up. This looks good.
> >>>>
> >>>>
> >>>>>   SQLAlchemy is a trademark of Michael Bayer.
> >>>>>
> >>>>>   Permission is hereby granted, free of charge, to any person
> >> obtaining a
> >>>>> copy of this
> >>>>>
> >>>>> Signed-off-by: Derek Straka <derek@asterius.io>
> >>>>> ---
> >>>>>   meta-python/recipes-devtools/python/python-sqlalchemy.inc
> >>  | 6
> >>>>> +++---
> >>>>>   .../{python-sqlalchemy_1.1.15.bb => python-sqlalchemy_1.1.17.bb}
> >> | 0
> >>>>>   .../{python3-sqlalchemy_1.1.15.bb => python3-sqlalchemy_1.1.17.bb}
> >> | 0
> >>>>>   3 files changed, 3 insertions(+), 3 deletions(-)
> >>>>>   rename meta-python/recipes-devtools/python/{
> >> python-sqlalchemy_1.1.15.bb
> >>>>> => python-sqlalchemy_1.1.17.bb} (100%)
> >>>>>   rename
> >>>>> meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.15.bb =>
> >>>>> python3-sqlalchemy_1.1.17.bb} (100%)
> >>>>>
> >>>>> diff --git
> a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> >>>>> b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> >>>>> index 2683a6a..0c191ae 100644
> >>>>> --- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> >>>>> +++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
> >>>>> @@ -2,13 +2,13 @@ DESCRIPTION = "Python SQL toolkit and Object
> >> Relational
> >>>>> Mapper that gives \
> >>>>>   application developers the full power and flexibility of SQL"
> >>>>>   HOMEPAGE = "http://www.sqlalchemy.org/"
> >>>>>   LICENSE = "MIT"
> >>>>> -LIC_FILES_CHKSUM =
> >> "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
> >>>>> +LIC_FILES_CHKSUM =
> >> "file://LICENSE;md5=b1c412c9d8d1ce018f7a9374407c22bb"
> >>>>>     PYPI_PACKAGE = "SQLAlchemy"
> >>>>>   inherit pypi
> >>>>>   -SRC_URI[md5sum] = "077f9bd3339957f53068b5572a152674"
> >>>>> -SRC_URI[sha256sum] =
> >>>>> "8b79a5ed91cdcb5abe97b0045664c55c140aec09e5dd5c01303e23de5fe7a95a"
> >>>>> +SRC_URI[md5sum] = "03db1c8f8ae911977c0bf3950a4c9c21"
> >>>>> +SRC_URI[sha256sum] =
> >>>>> "6b55ec379c11ad696f9371ce8e0de93c7f21134323f56a56a1b0d8fbef17013c"
> >>>>>     RDEPENDS_${PN} += " \
> >>>>>       ${PYTHON_PN}-json \
> >>>>> diff --git
> >>>>> a/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.15.bb
> >>>>> b/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.17.bb
> >>>>> similarity index 100%
> >>>>> rename from
> >>>>> meta-python/recipes-devtools/python/python-sqlalchemy_1.1.15.bb
> >>>>> rename to meta-python/recipes-devtools/python/
> >> python-sqlalchemy_1.1.17.bb
> >>>>> diff --git
> >>>>> a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
> >>>>> b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.17.bb
> >>>>> similarity index 100%
> >>>>> rename from
> >>>>> meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
> >>>>> rename to
> >>>>> meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.17.bb
> >>>>>
> >>>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
>

