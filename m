Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6DC3E7FE44
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 21:04:09 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id v25so8553206qto.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 13:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QNFr9Iv+xROs3esl9Iq+VuiOaJutLjf5NvwIwjfmv+M=;
	b=uB5R30dwxh3o4qKSk92pujCxrQxOSiLcdQhIb+nDfTgAYhjKmX8RGm6HxyEcwR3LJX
	Ww1/dx6/fETuDjGhBYDGBE+R2nYJGuI/jkCfDnQfsNuqFM2zIjwuDSHyfdVTMLgEZ7iO
	NsyJ/anOPi2ta3/dSb0glSMu0jK7G3tUHkZjWZuOzhsVu7PMLjyHTeH6/2c6+Oufz2Ce
	T5zn02qjHsst1HQIRiIMoDcVVrG8jRnM+OKvXYYEFe1cFikMi/w/HYsIUFBMDui3AkcV
	c8ia+MoJuYETM+1ZdVH4qSUtvssWV1g6s0bQVOVNt1qIJ3ZLKcvxmbEn1z6+RQevKRd7
	60IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QNFr9Iv+xROs3esl9Iq+VuiOaJutLjf5NvwIwjfmv+M=;
	b=BT2p54zUOahKu/bfoud0PlJo5H+4u3xhDFO3skh0FSfQYmFtkXeQAc0zLIXc5hf66V
	BnlxBq4Gg0RQ5OK+ZHikVA++5gwTx3ewTAKpcIGJVjWuUtvltiB8ZDiQlaYCn8BMyfLG
	kGmp2wTMLe7wxxWGKQmb2gigfrAEKX3OiVINvplrZEXTY6YGZSHsRiEiVMCZNJOqCeda
	ZEF67QEubgBRYCvf50OMsDT5IzmkV8jPJtVDF+RJ/YUyMmU00zS/jhlAcdBib+nxmheW
	LDLhBXYBZZ1RJzOgGbBvo/HPL4LM2CZmFRbvylbO25Wq1cHuzu6AOo89FMUy1BrurKjs
	JbFg==
X-Gm-Message-State: APjAAAUFTO7ptM+IU8kezegvueAFEDGR3OUTHbcb3g5LySrhwTdzBmCC
	SVthIQckXFfQzddX4q93W/a5UzoWrgTyYNhQ7J6M6eYN
X-Google-Smtp-Source: APXvYqwVZZsc6C2Aghwc/Ap3nb3zGV7Hoknxm2aEHLA2Y341M9cb8wShP/m/AsMRajKwOQI/Mr68ICLrZRCTFSi7Ycg=
X-Received: by 2002:ac8:1a30:: with SMTP id v45mr17291631qtj.80.1580159050203; 
	Mon, 27 Jan 2020 13:04:10 -0800 (PST)
MIME-Version: 1.0
References: <20200127173608.24874-1-andrey.zhizhikin@leica-geosystems.com>
	<CAHtQpK6ayzqiBn=QzrDRF+XGSA6Y0HB7Shg03N1XUYyWVu-TVw@mail.gmail.com>
In-Reply-To: <CAHtQpK6ayzqiBn=QzrDRF+XGSA6Y0HB7Shg03N1XUYyWVu-TVw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Jan 2020 13:03:43 -0800
Message-ID: <CAMKF1sqqUmNz2qa7W-R-1aK-1Jdqp-Grw3dgt1NfiJpOzduMfg@mail.gmail.com>
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
X-List-Received-Date: Mon, 27 Jan 2020 21:04:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 27, 2020 at 12:59 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> Hello Raj,
>
> On Mon, Jan 27, 2020 at 6:36 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> >
> > From: Andrey Zhizhikin <andrey.z@gmail.com>
> >
> > Update pcsc-lite recipe to target python3 since python2 is EOL and has
> > been dropped from OE-Core.
> >
> > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > ---
> >  .../0001-pcsc-spy-use-python3-only.patch      | 43 +++++++++++++++++++
> >  .../pcsc-lite/pcsc-lite_1.8.26.bb             |  7 ++-
> >  2 files changed, 48 insertions(+), 2 deletions(-)
> >  create mode 100644 meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch
> >
> > diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch b/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch
> > new file mode 100644
> > index 000000000..3e7b0adda
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch
> > @@ -0,0 +1,43 @@
> > +From 75dd98876951d86890ceb30be521de57fd31e3c7 Mon Sep 17 00:00:00 2001
> > +From: Andrey Zhizhikin <andrey.z@gmail.com>
> > +Date: Mon, 27 Jan 2020 13:27:12 +0000
> > +Subject: [PATCH] pcsc-spy: use python3 only
> > +
> > +Python2 has been EOL and most distributions would not provide any
> > +support for it anymore. Since Python3 is available in all distributions
> > +now, switch pcsc-spy to use it exclusively.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > +---
> > + src/spy/pcsc-spy | 9 ++-------
> > + 1 file changed, 2 insertions(+), 7 deletions(-)
> > +
> > +diff --git a/src/spy/pcsc-spy b/src/spy/pcsc-spy
> > +index 85222c6..965138e 100755
> > +--- a/src/spy/pcsc-spy
> > ++++ b/src/spy/pcsc-spy
> > +@@ -1,4 +1,4 @@
> > +-#! /usr/bin/python
> > ++#!/usr/bin/env python3
> > +
> > + """
> > + #    Display PC/SC functions arguments
> > +@@ -22,12 +22,7 @@ from __future__ import print_function
> > + import os
> > + import signal
> > + import time
>
> Please take a note, that this block is different from the patch staged
> in the [master-next] (ad388282aa2b6e286fc9f92d37d43cc061a6a753):
> ==================
> > +-try:
> > +-    # for Python3
> > +-    from queue import Queue
> > +-except ImportError:
> > +-    # for Python2
> > +-    from Queue import Queue
> > ++from queue import Queue
> ==================
>
> In addition to switching the interpreter, it also removes the block
> which targets python2 as it does not make sense with explicit python3
> interpreter invoked.
>
> Not that I'm complaining that this patch was not taken :)
> It might just be that you haven't seen the difference between this
> patch and the one you picked up. Otherwise, if you feel that the
> version staged is more correct - discard this patch.

I have missed it because this should have been v2 to get my attention.

>
> > + from threading import Thread
> > + from operator import attrgetter
> > +
> > +--
> > +2.17.1
> > +
> > diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
> > index 5e6084656..fb8c4a202 100644
> > --- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
> > +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
> > @@ -10,7 +10,10 @@ LICENSE_${PN}-spy = "GPLv3+"
> >  LICENSE_${PN}-spy-dev = "GPLv3+"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=628c01ba985ecfa21677f5ee2d5202f6"
> >
> > -SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
> > +SRC_URI = "\
> > +       https://pcsclite.apdu.fr/files/${BP}.tar.bz2 \
> > +       file://0001-pcsc-spy-use-python3-only.patch \
> > +"
> >  SRC_URI[md5sum] = "9d36882998449daceec267c68a21ff0d"
> >  SRC_URI[sha256sum] = "3eb7be7d6ef618c0a444316cf5c1f2f9d7227aedba7a192f389fe3e7c0dfbbd9"
> >
> > @@ -50,6 +53,6 @@ RPROVIDES_${PN} += "${PN}-systemd"
> >  RREPLACES_${PN} += "${PN}-systemd"
> >  RCONFLICTS_${PN} += "${PN}-systemd"
> >  SYSTEMD_SERVICE_${PN} = "pcscd.socket"
> > -RDEPENDS_${PN}-spy +="python"
> > +RDEPENDS_${PN}-spy +="python3"
> >
> >  BBCLASSEXTEND = "native"
> > --
> > 2.17.1
> >
>
>
> --
> Regards,
> Andrey.

