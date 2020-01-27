Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id 752237FE58
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 21:14:52 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id dc14so5216748qvb.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 13:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=P2CDpQj4qZYodd1CrR4JYb69xrS507pWyp/dtatAD5M=;
	b=q3exOnweu06sRsVBOGMJwE/+1ATSc4H6rGolDxAjHlrI/qCrwZz81vpG8OlELOJiol
	biHJ4iClB7wPQ2PbE8Mxd6BTHJ+nVX9nxjeAd6x/I1N/WxNdwJ7ZcAIcf6wHyNyrS/z2
	fTZ69V1/IIXQ9WAfnyD//QFgbPbigJSP/YaN/7e6v4XCkFqEK9RQk0ymbGBPtBurnah3
	vi3hHXdrc/vifl6Wq0uVKsa6saX7g4TbhW9ac3H34DRdUmx3bSxbuQqFFV0gIxOJkns3
	tYADZ/oVUxZO7CaOU/FWOE5aYmbKy+qAwXPg8EjdhfeGcg6L/ettS5FmFKTsgq9w/XZ2
	K4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=P2CDpQj4qZYodd1CrR4JYb69xrS507pWyp/dtatAD5M=;
	b=aoeLyDRgdvrla2pVE+wF59xd79MMY6ckkg3cVsCTJ3VZnc2GbdZT190B01gnVtMmeg
	7Kq/lnpqh+kRSdZX2+xvWxglAn41FhxE83fTTV5SOpxcz4BgKC0kgvxpI7sa7sBSpnY8
	DsGXuJVxNGX+z6/i034YQ02MbQVGw51ejfuROLyT9BL1W5iCPIUKxh/Dj19CT771A6Uj
	jSNz5xyxxOBZ9jNfSoFhg9B25ly2c8O+sPdVVvO0i1mijFuAS2LSUvBDJ28hXHG2RFVy
	WhQmffkIuOP9VnHb7U3ik43d9dDcazQPpw/I8AQtFMKoScJTQa1KzD3Pi0Czn6v7uFOw
	b0Pg==
X-Gm-Message-State: APjAAAX7yypG7qZQEf3AvWGWcE4SmWdhmo6oh3aq5aa4ycOMbBPXI1tN
	Lyc/p2fJyXMPPJt8kz6Be/ZOrz7ktYd2ll8SP4m9vGXz
X-Google-Smtp-Source: APXvYqxnfN4Eqdv8k7Mi+l13T8KfitUX3hFPSz98vWAeIw04TT22hnVMdsX8i3pxBH3h7t+8f53IquWpXJiBILMMs3o=
X-Received: by 2002:a0c:f513:: with SMTP id j19mr18713752qvm.206.1580159693004;
	Mon, 27 Jan 2020 13:14:53 -0800 (PST)
MIME-Version: 1.0
References: <20200127173608.24874-1-andrey.zhizhikin@leica-geosystems.com>
	<CAHtQpK6ayzqiBn=QzrDRF+XGSA6Y0HB7Shg03N1XUYyWVu-TVw@mail.gmail.com>
	<CAMKF1sqqUmNz2qa7W-R-1aK-1Jdqp-Grw3dgt1NfiJpOzduMfg@mail.gmail.com>
	<CAHtQpK4Oo4iq7xLO2TXZwSyn+pOAxJGcyUKfgXCyj8TWmaq9-A@mail.gmail.com>
In-Reply-To: <CAHtQpK4Oo4iq7xLO2TXZwSyn+pOAxJGcyUKfgXCyj8TWmaq9-A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Jan 2020 13:14:26 -0800
Message-ID: <CAMKF1srV5MQ=i6JP6LFLRvs=M0iAqPxDTC+SDXT8_WBkMp_7RA@mail.gmail.com>
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] pcsc-lite: update recipe to use python3
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
X-List-Received-Date: Mon, 27 Jan 2020 21:14:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 27, 2020 at 1:08 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> On Mon, Jan 27, 2020 at 10:04 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Mon, Jan 27, 2020 at 12:59 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> > >
> > > Hello Raj,
> > >
> > > On Mon, Jan 27, 2020 at 6:36 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> > > >
> > > > From: Andrey Zhizhikin <andrey.z@gmail.com>
> > > >
> > > > Update pcsc-lite recipe to target python3 since python2 is EOL and has
> > > > been dropped from OE-Core.
> > > >
> > > > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > > > ---
> > > >  .../0001-pcsc-spy-use-python3-only.patch      | 43 +++++++++++++++++++
> > > >  .../pcsc-lite/pcsc-lite_1.8.26.bb             |  7 ++-
> > > >  2 files changed, 48 insertions(+), 2 deletions(-)
> > > >  create mode 100644 meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch
> > > >
> > > > diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch b/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch
> > > > new file mode 100644
> > > > index 000000000..3e7b0adda
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch
> > > > @@ -0,0 +1,43 @@
> > > > +From 75dd98876951d86890ceb30be521de57fd31e3c7 Mon Sep 17 00:00:00 2001
> > > > +From: Andrey Zhizhikin <andrey.z@gmail.com>
> > > > +Date: Mon, 27 Jan 2020 13:27:12 +0000
> > > > +Subject: [PATCH] pcsc-spy: use python3 only
> > > > +
> > > > +Python2 has been EOL and most distributions would not provide any
> > > > +support for it anymore. Since Python3 is available in all distributions
> > > > +now, switch pcsc-spy to use it exclusively.
> > > > +
> > > > +Upstream-Status: Pending
> > > > +
> > > > +Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > > > +---
> > > > + src/spy/pcsc-spy | 9 ++-------
> > > > + 1 file changed, 2 insertions(+), 7 deletions(-)
> > > > +
> > > > +diff --git a/src/spy/pcsc-spy b/src/spy/pcsc-spy
> > > > +index 85222c6..965138e 100755
> > > > +--- a/src/spy/pcsc-spy
> > > > ++++ b/src/spy/pcsc-spy
> > > > +@@ -1,4 +1,4 @@
> > > > +-#! /usr/bin/python
> > > > ++#!/usr/bin/env python3
> > > > +
> > > > + """
> > > > + #    Display PC/SC functions arguments
> > > > +@@ -22,12 +22,7 @@ from __future__ import print_function
> > > > + import os
> > > > + import signal
> > > > + import time
> > >
> > > Please take a note, that this block is different from the patch staged
> > > in the [master-next] (ad388282aa2b6e286fc9f92d37d43cc061a6a753):
> > > ==================
> > > > +-try:
> > > > +-    # for Python3
> > > > +-    from queue import Queue
> > > > +-except ImportError:
> > > > +-    # for Python2
> > > > +-    from Queue import Queue
> > > > ++from queue import Queue
> > > ==================
> > >
> > > In addition to switching the interpreter, it also removes the block
> > > which targets python2 as it does not make sense with explicit python3
> > > interpreter invoked.
> > >
> > > Not that I'm complaining that this patch was not taken :)
> > > It might just be that you haven't seen the difference between this
> > > patch and the one you picked up. Otherwise, if you feel that the
> > > version staged is more correct - discard this patch.
> >
> > I have missed it because this should have been v2 to get my attention.
>
> That was still the original version, you must've gotten 2 patches from
> me and another person for the same change. :) And you picked up the
> one not from this series, but a separate patch from Laurent Bonnans
> which has above block missing. :)

yes that's, right, I was thinking of asking to rebase this one on top
of the first one
but then I took the changes in this one and merged them along with
prior patch from Laurent


>
> >
> > >
> > > > + from threading import Thread
> > > > + from operator import attrgetter
> > > > +
> > > > +--
> > > > +2.17.1
> > > > +
> > > > diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
> > > > index 5e6084656..fb8c4a202 100644
> > > > --- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
> > > > +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
> > > > @@ -10,7 +10,10 @@ LICENSE_${PN}-spy = "GPLv3+"
> > > >  LICENSE_${PN}-spy-dev = "GPLv3+"
> > > >  LIC_FILES_CHKSUM = "file://COPYING;md5=628c01ba985ecfa21677f5ee2d5202f6"
> > > >
> > > > -SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
> > > > +SRC_URI = "\
> > > > +       https://pcsclite.apdu.fr/files/${BP}.tar.bz2 \
> > > > +       file://0001-pcsc-spy-use-python3-only.patch \
> > > > +"
> > > >  SRC_URI[md5sum] = "9d36882998449daceec267c68a21ff0d"
> > > >  SRC_URI[sha256sum] = "3eb7be7d6ef618c0a444316cf5c1f2f9d7227aedba7a192f389fe3e7c0dfbbd9"
> > > >
> > > > @@ -50,6 +53,6 @@ RPROVIDES_${PN} += "${PN}-systemd"
> > > >  RREPLACES_${PN} += "${PN}-systemd"
> > > >  RCONFLICTS_${PN} += "${PN}-systemd"
> > > >  SYSTEMD_SERVICE_${PN} = "pcscd.socket"
> > > > -RDEPENDS_${PN}-spy +="python"
> > > > +RDEPENDS_${PN}-spy +="python3"
> > > >
> > > >  BBCLASSEXTEND = "native"
> > > > --
> > > > 2.17.1
> > > >
> > >
> > >
> > > --
> > > Regards,
> > > Andrey.
>
>
>
> --
> Regards,
> Andrey.

