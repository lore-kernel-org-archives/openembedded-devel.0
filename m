Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id CD7B66BAAB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 22:43:00 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a5so396780wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 14:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=uLBd3Cl/6F5aB5bw9pI2HSZTwMk6i3yBwVmx4vZx1Xs=;
	b=AbM2u2Ke6GcihNBChjceRKtVZhcxvi2Fq2MkabAGLLCNba3H5tmsR35B1Q29BWInX6
	n95Y+zai7W5lRS5ZsOwsv5Jb+OcvTv8p+o9G9g3Zt62hxctgouR+4m3+sCbjZXXRQDjq
	KHS2BoVHIwyC9Ik6RjBSJIDZcrZCC+wBcqGOCTSmNYidnTWeuZVUkIF0prOInOqdihro
	nkn5bXBlK8nd8igl+3h0bLyaxiITrcbfp0UX2IzyPtCW2HhQFoJLamsjP0Mjewvy8T46
	PKcOzsBVUN67u7nxmOqVH4fJcU+DN9Xqraof8Gbs5zybre2EH3UWGeK1W4zdogBN6MHY
	0wTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uLBd3Cl/6F5aB5bw9pI2HSZTwMk6i3yBwVmx4vZx1Xs=;
	b=AVZiDQb6gaWdoyjBuq1rowEvjlHQPZeaFgUsbVIg6VLPpYON60M7ENcEyzaIHa5l9i
	Zhu6h/J7fwa4qHzyDtbembILMivIRBtq8o/tKWbGO+L4QyAxc7erzM6VOgX6ewf9DS0M
	RLGIQEJIgdAnWMmyNSbEoJ54za+8jBpKuOiEw8bTxZy9VApNM6VtXumGZ+p9UVwv9Ff2
	Lvy3609+5rNyAu5p+K8E5CwB2acZK0cUFN8QKtrQwPKBuEIIqSr7rllUppwQNg59D+TO
	eFBFFNFCSJxE5t2Tb77+4cnJYVHLnmv0jzC/8Xv53iJ0hpi1IBkUBYdGVXzGdZSPvDGx
	8uVg==
X-Gm-Message-State: APjAAAUHbsIV4v/H42tquLy6yRxFyFj/tS/AxOsUIXPhpdS26Xhf0jNC
	wGSyo2/Z5b3TdZczVnKqiGMKTPhmtfq7jT2Fnag=
X-Google-Smtp-Source: APXvYqwS0OnuG0ZtFp1+/rWou6DyZ9t1qMqsePFK4XFgra1PUp0eV2PZW5FVUC9Yx8uufe+GVbBGGVjhTrrKzYH8MEk=
X-Received: by 2002:a05:600c:2c53:: with SMTP id
	r19mr884728wmg.39.1580164981396; 
	Mon, 27 Jan 2020 14:43:01 -0800 (PST)
MIME-Version: 1.0
References: <20200127173608.24874-1-andrey.zhizhikin@leica-geosystems.com>
	<20200127211618.28e763ec@opendreambox.org>
In-Reply-To: <20200127211618.28e763ec@opendreambox.org>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Mon, 27 Jan 2020 23:42:50 +0100
Message-ID: <CAHtQpK7Owmuf6ks=ysjgTz6qCYyhspJD+wFYuJrzg-D3cM5rXw@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
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
X-List-Received-Date: Mon, 27 Jan 2020 22:43:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On Mon, Jan 27, 2020 at 9:16 PM Andreas Oberritter <obi@opendreambox.org> w=
rote:
>
> Hi Andrey,
>
> On Mon, 27 Jan 2020 17:36:06 +0000
> Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
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
> >  create mode 100644 meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pc=
sc-spy-use-python3-only.patch
> >
> > diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-=
use-python3-only.patch b/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-p=
csc-spy-use-python3-only.patch
> > new file mode 100644
> > index 000000000..3e7b0adda
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-pyt=
hon3-only.patch
> > @@ -0,0 +1,43 @@
> > +From 75dd98876951d86890ceb30be521de57fd31e3c7 Mon Sep 17 00:00:00 2001
> > +From: Andrey Zhizhikin <andrey.z@gmail.com>
> > +Date: Mon, 27 Jan 2020 13:27:12 +0000
> > +Subject: [PATCH] pcsc-spy: use python3 only
> > +
> > +Python2 has been EOL and most distributions would not provide any
> > +support for it anymore. Since Python3 is available in all distribution=
s
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
> > +-try:
> > +-    # for Python3
> > +-    from queue import Queue
> > +-except ImportError:
> > +-    # for Python2
> > +-    from Queue import Queue
> > ++from queue import Queue
> > + from threading import Thread
> > + from operator import attrgetter
> > +
> > +--
> > +2.17.1
> > +
>
> This patch would not have been necessary if we managed the python symlink=
 with update-alternatives. I'm doing this in my layer. Maybe that would be =
a better way to go? I won't be able to build master in the next days or wee=
ks, but if you want to try and submit it, here's what I have in my bbappend=
s:
>
> python_%.bbappend:
>
> inherit update-alternatives
>
> ALTERNATIVE_${PN}-core =3D "python"
> ALTERNATIVE_TARGET[python] =3D "${bindir}/python2"
> ALTERNATIVE_PRIORITY =3D "2"
>
> do_install_append_class-target() {
>     rm -f ${D}${bindir}/python
> }
>
> python3_%.bbappend:
>
> inherit update-alternatives
>
> ALTERNATIVE_${PN}-core =3D "python"
> ALTERNATIVE_TARGET[python] =3D "${bindir}/python3"
> ALTERNATIVE_PRIORITY =3D "3"

That is an interesting suggestion... The only potential problem with
this one I see is that when target would require to have both versions
(2 and 3) then it might be interpreted wrong. This patch states
explicitly that python3 is the interpreter of choice, with
update-alternatives I would never be sure what would land up on my
device.

Have you sent and RFC with those .bbappends of yours? This might be
something to be review.

>
> Best regards,
> Andreas

--=20
Regards,
Andrey.

