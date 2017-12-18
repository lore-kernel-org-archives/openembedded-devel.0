Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 1DF117842D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 21:27:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1513632473; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=so8f7alzO/uQ/yETWrwDaoKpX9EJLB8lL6nbObRneh4=;
	b=OYfyy+CzPggRUNfFiSQQylQFiSKC59n0/B7W6l7+wri8acAWadYVloFiD4NhRm2XBuys3Go5
	XcxxGCBh7B8r/vWMXuWnDczk5MC7qRhPJYhEJQ3qb7GXKJee2WvjOSIMwv8A0byjInXL5m/h
	lR3mF+cCzvUrqR7d89c1rf1weFI=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Sender: derek@asterius.io
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mxa.mailgun.org with ESMTP id 5a3832d9.7f74280d0ef0-smtp-out-n03;
	Mon, 18 Dec 2017 21:27:53 -0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id i40so21830750qti.8;
	Mon, 18 Dec 2017 13:27:52 -0800 (PST)
X-Gm-Message-State: AKGB3mLP9NGdC7kXvdrCFinY+ES4acC+d+puEEAIdVvYbDBLRKMktzLw
	gr1fywRK5kIkXbZj1+6TNza8oM9/SO/phhxXoQ4=
X-Google-Smtp-Source: ACJfBos9vnJwH2tXjb+eRDMPGpuOAODR08cvvdC1myBLGK0qRXamlInb7lhQiGNNsaYu/PUzhLZZ/UtZQmzj4GzdzKE=
X-Received: by 10.200.15.76 with SMTP id l12mr1689263qtk.225.1513632472049;
	Mon, 18 Dec 2017 13:27:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.177 with HTTP; Mon, 18 Dec 2017 13:27:51 -0800 (PST)
In-Reply-To: <3152872.oFNfv7Rrbj@yow-masselst-lx1>
References: <1512414044-1012-1-git-send-email-mark.asselstine@windriver.com>
	<20171218210256.GQ27580@vctlabs.com>
	<CADNbA1qZ=m2MwE78Er4MjBr3jEcQtgE+a4Z-FCDWxLSw1Tc=Eg@mail.gmail.com>
	<3152872.oFNfv7Rrbj@yow-masselst-lx1>
From: Derek Straka <derek@asterius.io>
Date: Mon, 18 Dec 2017 16:27:51 -0500
X-Gmail-Original-Message-ID: <CADNbA1rSmj=3u4nR_860wKv0L90ye6kZru0PpbVQWvrMWk0j0w@mail.gmail.com>
Message-ID: <CADNbA1rSmj=3u4nR_860wKv0L90ye6kZru0PpbVQWvrMWk0j0w@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-pyroute2: uprev to v0.4.21 (from 0.3.22)
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
X-List-Received-Date: Mon, 18 Dec 2017 21:27:52 -0000
Content-Type: text/plain; charset="UTF-8"

Go ahead and do a v2, it was more of a reminder for me.

On Mon, Dec 18, 2017 at 4:26 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> On Monday, December 18, 2017 4:07:44 PM EST Derek Straka wrote:
> > I also need to look at the UPSTREAM_CHECK_URI for this recipe since it
> > isn't finding the latest version and telling me to update the package.
>
> Odd. Let me know how it goes. If it is easier for you to make the changes
> locally and complete the merge go for it.
>
> Mark
>
> >
> > On Mon, Dec 18, 2017 at 4:02 PM, S. Lockwood-Childs <sjl@vctlabs.com>
> wrote:
> > > On Mon, Dec 18, 2017 at 03:17:25PM -0500, Derek Straka wrote:
> > > > I have several customers who have optimized for space and would like
> to
> > >
> > > see
> > >
> > > > the capability maintained unless core removes the ability to split
> > > > python
> > > > packages out.  They also remove the *.py files in favor of *.pyo
> files
> > >
> > > (via
> > >
> > > > a custom packaging mechanism).  I have automated tests that go
> through
> > >
> > > the
> > >
> > > > module importing on each of the meta-python packages to ensure it
> works
> > >
> > > on
> > >
> > > > minimal python installations.  When other contributors don't do
> provide
> > > > that functionality, I either catch it when I do package update or
> when
> > > > it
> > > > breaks for one of my customers.  I'm fine if you don't want to
> perform
> > >
> > > the
> > >
> > > > checks yourself and it breaks my use case with missing dependencies,
> but
> > >
> > > I
> > >
> > > > would prefer that you don't remove the dependencies that are
> currently
> > > > in
> > > > place.  Thanks.
> > >
> > > Me too -- some of my projects still use NAND for rootfs, where space is
> > > tight and
> > > ability to split out python modules is very useful. Thus it is not an
> > > unused
> > > feature, though many projects have SD/eMMC for rootfs and those ones
> > > generally
> > > will not care about it.
>
>

