Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 018337FDC8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 22:09:06 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q6so13528942wro.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 14:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=crpXjxMZQHs9p/b4cC5FMsTg5C3MtIbSqMxuZ3hbRnM=;
	b=twUwVXSX7YHuLkWS4Nzfqw3rwfZ8sLAMo/mplkQe2jpmN4dJV+Bjg5SP1SAjjKjjwX
	yA6pAozFfhHW/0uE2OeTowv6jn3vxxRZ6XDXlywWuQqX0yFWgo4zZlyubH+iAr5mpNA+
	Tk0OcDg7uJOxpOUFkWq8IKVDQr8PQK0mU+rZjqUqDJISgkxnpx8xOYXPpZ1ZbXhciiRM
	Plz3RET92R7mZfcDXCA0h//opvvtkkuNL1FcCZ3ncUdfL4cdkQWnldQZNOEg8nwCmLwK
	sdIoO4s9J1bx2YSP6hvFM5zRZReVN3TuV0+XEAOEsX590iLcED+ACW1eziavnDXyfz8X
	iBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=crpXjxMZQHs9p/b4cC5FMsTg5C3MtIbSqMxuZ3hbRnM=;
	b=R9qQihzad2tFwZG+AnAfM+u1BYUBzislyyOki2zKBASjlSNc7k17wDKoG3HPbwXoNq
	Qr7JjaUB+NF+6/SDxZKl9R4zMrIvbj1tmOY4ju0Colcnrk4j17373lvxVmNED+DMANgK
	OgETgJYDR2NcVjyG3Cdx6bqCG0jEirB/nknZqcki9pri+lAGWM+DoYXWFZsTspVqdgxk
	TY59epODM5/+q01R8uZmwrA/CL9JZJzun9yoo18sooDLbA9dsVS+//TW6QvBLMZaon/k
	Mg93RBjH9RIqxpmU9W0Wuqqff16Dqemlb5TGxO1pLwZB86A7gZKQJ9cb41BQGwlo7bCS
	AJkA==
X-Gm-Message-State: APjAAAUkXv7VXn2ybJHzq5Fg41Ef4JBYQzDKQ7SHEngH62GONrk5rxDp
	bkyoUgoW2x6+onm2udCIHQafPk62pyD028udFKU=
X-Google-Smtp-Source: APXvYqxppnKib72GydlOaMr4HVc0s6pxdMd/u8jJSMYrsqlvhbgaXyZaNeq5FpxHpEUeULh447j2W5lAC3fklRM3chU=
X-Received: by 2002:adf:f308:: with SMTP id i8mr24169822wro.42.1580162947537; 
	Mon, 27 Jan 2020 14:09:07 -0800 (PST)
MIME-Version: 1.0
References: <20200127173608.24874-1-andrey.zhizhikin@leica-geosystems.com>
	<CAHtQpK6ayzqiBn=QzrDRF+XGSA6Y0HB7Shg03N1XUYyWVu-TVw@mail.gmail.com>
	<CAMKF1sqqUmNz2qa7W-R-1aK-1Jdqp-Grw3dgt1NfiJpOzduMfg@mail.gmail.com>
	<CAHtQpK4Oo4iq7xLO2TXZwSyn+pOAxJGcyUKfgXCyj8TWmaq9-A@mail.gmail.com>
	<CAMKF1srV5MQ=i6JP6LFLRvs=M0iAqPxDTC+SDXT8_WBkMp_7RA@mail.gmail.com>
In-Reply-To: <CAMKF1srV5MQ=i6JP6LFLRvs=M0iAqPxDTC+SDXT8_WBkMp_7RA@mail.gmail.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Mon, 27 Jan 2020 23:08:56 +0100
Message-ID: <CAHtQpK6Fx31NF+c4hjJZX6NtBn4xRDh1_y=90kOQGey2dZn5QQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Mon, 27 Jan 2020 22:09:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 27, 2020 at 10:14 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Jan 27, 2020 at 1:08 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> >
> > On Mon, Jan 27, 2020 at 10:04 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Mon, Jan 27, 2020 at 12:59 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> > > >
> > > > Hello Raj,
> > > >
> > > > On Mon, Jan 27, 2020 at 6:36 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> > > > >
> > > > > From: Andrey Zhizhikin <andrey.z@gmail.com>
> > > > >
> > > > > Update pcsc-lite recipe to target python3 since python2 is EOL and has
> > > > > been dropped from OE-Core.
> > > > >
> > > > > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > > > > ---
> > > > >  .../0001-pcsc-spy-use-python3-only.patch      | 43 +++++++++++++++++++
> > > > >  .../pcsc-lite/pcsc-lite_1.8.26.bb             |  7 ++-
> > > > >  2 files changed, 48 insertions(+), 2 deletions(-)
> > > > >  create mode 100644 meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch
> > > > >
> > > > > diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch b/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch
> > > > > new file mode 100644
> > > > > index 000000000..3e7b0adda
> > > > > --- /dev/null
> > > > > +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch
> > > > > @@ -0,0 +1,43 @@
> > > > > +From 75dd98876951d86890ceb30be521de57fd31e3c7 Mon Sep 17 00:00:00 2001
> > > > > +From: Andrey Zhizhikin <andrey.z@gmail.com>
> > > > > +Date: Mon, 27 Jan 2020 13:27:12 +0000
> > > > > +Subject: [PATCH] pcsc-spy: use python3 only
> > > > > +
> > > > > +Python2 has been EOL and most distributions would not provide any
> > > > > +support for it anymore. Since Python3 is available in all distributions
> > > > > +now, switch pcsc-spy to use it exclusively.
> > > > > +
> > > > > +Upstream-Status: Pending
> > > > > +
> > > > > +Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > > > > +---
> > > > > + src/spy/pcsc-spy | 9 ++-------
> > > > > + 1 file changed, 2 insertions(+), 7 deletions(-)
> > > > > +
> > > > > +diff --git a/src/spy/pcsc-spy b/src/spy/pcsc-spy
> > > > > +index 85222c6..965138e 100755
> > > > > +--- a/src/spy/pcsc-spy
> > > > > ++++ b/src/spy/pcsc-spy
> > > > > +@@ -1,4 +1,4 @@
> > > > > +-#! /usr/bin/python
> > > > > ++#!/usr/bin/env python3
> > > > > +
> > > > > + """
> > > > > + #    Display PC/SC functions arguments
> > > > > +@@ -22,12 +22,7 @@ from __future__ import print_function
> > > > > + import os
> > > > > + import signal
> > > > > + import time
> > > >
> > > > Please take a note, that this block is different from the patch staged
> > > > in the [master-next] (ad388282aa2b6e286fc9f92d37d43cc061a6a753):
> > > > ==================
> > > > > +-try:
> > > > > +-    # for Python3
> > > > > +-    from queue import Queue
> > > > > +-except ImportError:
> > > > > +-    # for Python2
> > > > > +-    from Queue import Queue
> > > > > ++from queue import Queue
> > > > ==================
> > > >
> > > > In addition to switching the interpreter, it also removes the block
> > > > which targets python2 as it does not make sense with explicit python3
> > > > interpreter invoked.
> > > >
> > > > Not that I'm complaining that this patch was not taken :)
> > > > It might just be that you haven't seen the difference between this
> > > > patch and the one you picked up. Otherwise, if you feel that the
> > > > version staged is more correct - discard this patch.
> > >
> > > I have missed it because this should have been v2 to get my attention.
> >
> > That was still the original version, you must've gotten 2 patches from
> > me and another person for the same change. :) And you picked up the
> > one not from this series, but a separate patch from Laurent Bonnans
> > which has above block missing. :)
>
> yes that's, right, I was thinking of asking to rebase this one on top
> of the first one
> but then I took the changes in this one and merged them along with
> prior patch from Laurent

Got it, saw it now in the [master-next]. Thanks a lot!

>
>
> >
> > >
> > > >
> > > > > + from threading import Thread
> > > > > + from operator import attrgetter
> > > > > +
> > > > > +--
> > > > > +2.17.1
> > > > > +
> > > > > diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
> > > > > index 5e6084656..fb8c4a202 100644
> > > > > --- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
> > > > > +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
> > > > > @@ -10,7 +10,10 @@ LICENSE_${PN}-spy = "GPLv3+"
> > > > >  LICENSE_${PN}-spy-dev = "GPLv3+"
> > > > >  LIC_FILES_CHKSUM = "file://COPYING;md5=628c01ba985ecfa21677f5ee2d5202f6"
> > > > >
> > > > > -SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
> > > > > +SRC_URI = "\
> > > > > +       https://pcsclite.apdu.fr/files/${BP}.tar.bz2 \
> > > > > +       file://0001-pcsc-spy-use-python3-only.patch \
> > > > > +"
> > > > >  SRC_URI[md5sum] = "9d36882998449daceec267c68a21ff0d"
> > > > >  SRC_URI[sha256sum] = "3eb7be7d6ef618c0a444316cf5c1f2f9d7227aedba7a192f389fe3e7c0dfbbd9"
> > > > >
> > > > > @@ -50,6 +53,6 @@ RPROVIDES_${PN} += "${PN}-systemd"
> > > > >  RREPLACES_${PN} += "${PN}-systemd"
> > > > >  RCONFLICTS_${PN} += "${PN}-systemd"
> > > > >  SYSTEMD_SERVICE_${PN} = "pcscd.socket"
> > > > > -RDEPENDS_${PN}-spy +="python"
> > > > > +RDEPENDS_${PN}-spy +="python3"
> > > > >
> > > > >  BBCLASSEXTEND = "native"
> > > > > --
> > > > > 2.17.1
> > > > >
> > > >
> > > >
> > > > --
> > > > Regards,
> > > > Andrey.
> >
> >
> >
> > --
> > Regards,
> > Andrey.



-- 
Regards,
Andrey.

