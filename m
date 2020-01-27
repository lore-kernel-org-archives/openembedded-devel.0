Return-Path: <obi@opendreambox.org>
Received: from relay.dream-property.net (relay.dream-property.net
	[178.19.67.222])
	by mail.openembedded.org (Postfix) with ESMTP id C3B457FA0E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 23:45:10 +0000 (UTC)
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by relay.dream-property.net (Postfix) with ESMTPS id 7401310045D60;
	Mon, 27 Jan 2020 23:45:11 +0000 (UTC)
Received: from localhost (ip-176-199-141-47.hsi06.unitymediagroup.de
	[176.199.141.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
	server-digest SHA256) (No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id BD9B4314001C;
	Tue, 28 Jan 2020 00:45:10 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=opendreambox.org; 
	s=dkim; t=1580168710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=hRSZSeF3nsTrujlFdA+x9UG95eeTSGllxHRBPbR8aW8=;
	b=I/CxGGPZvcYS6gkBtHjmIu32SYhPzru1g7eSIwHE9+MlMTtJigxW07/UdI9q9fhAJOtSeu
	KMylw/b/z6WP3WAg==
Date: Tue, 28 Jan 2020 00:45:08 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: Andrey Zhizhikin <andrey.z@gmail.com>
Message-ID: <20200128004508.6cb940a3@opendreambox.org>
In-Reply-To: <CAHtQpK7Owmuf6ks=ysjgTz6qCYyhspJD+wFYuJrzg-D3cM5rXw@mail.gmail.com>
References: <20200127173608.24874-1-andrey.zhizhikin@leica-geosystems.com>
	<20200127211618.28e763ec@opendreambox.org>
	<CAHtQpK7Owmuf6ks=ysjgTz6qCYyhspJD+wFYuJrzg-D3cM5rXw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: [RFC] Manage python symlinks with update-alternatives
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
X-List-Received-Date: Mon, 27 Jan 2020 23:45:11 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrey, everybody,

This was "[meta-oe][PATCH 1/3] pcsc-lite: update recipe to use python3", wh=
ere I suggested to use update-alternatives for python.

I changed the topic in the hope of gaining a wider audience. Please don't s=
kip the quoted text:

On Mon, 27 Jan 2020 23:42:50 +0100
Andrey Zhizhikin <andrey.z@gmail.com> wrote:

> Hi Andreas,
>=20
> On Mon, Jan 27, 2020 at 9:16 PM Andreas Oberritter <obi@opendreambox.org>=
 wrote:
> >
> > Hi Andrey,
> >
> > On Mon, 27 Jan 2020 17:36:06 +0000
> > Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> > > +--- a/src/spy/pcsc-spy
> > > ++++ b/src/spy/pcsc-spy
> > > +@@ -1,4 +1,4 @@
> > > +-#! /usr/bin/python
> > > ++#!/usr/bin/env python3
> > > +
> > > + """
> > > + #    Display PC/SC functions arguments
> > > +@@ -22,12 +22,7 @@ from __future__ import print_function
> > > + import os
> > > + import signal
> > > + import time
> > > +-try:
> > > +-    # for Python3
> > > +-    from queue import Queue
> > > +-except ImportError:
> > > +-    # for Python2
> > > +-    from Queue import Queue
> > > ++from queue import Queue
> > > + from threading import Thread
> > > + from operator import attrgetter
> > > +
> > > +--
> > > +2.17.1
> > > +
> >
> > This patch would not have been necessary if we managed the python symli=
nk with update-alternatives. I'm doing this in my layer. Maybe that would b=
e a better way to go? I won't be able to build master in the next days or w=
eeks, but if you want to try and submit it, here's what I have in my bbappe=
nds:
> >
> > python_%.bbappend:
> >
> > inherit update-alternatives
> >
> > ALTERNATIVE_${PN}-core =3D "python"
> > ALTERNATIVE_TARGET[python] =3D "${bindir}/python2"
> > ALTERNATIVE_PRIORITY =3D "2"
> >
> > do_install_append_class-target() {
> >     rm -f ${D}${bindir}/python
> > }
> >
> > python3_%.bbappend:
> >
> > inherit update-alternatives
> >
> > ALTERNATIVE_${PN}-core =3D "python"
> > ALTERNATIVE_TARGET[python] =3D "${bindir}/python3"
> > ALTERNATIVE_PRIORITY =3D "3"
>=20
> That is an interesting suggestion... The only potential problem with
> this one I see is that when target would require to have both versions
> (2 and 3) then it might be interpreted wrong. This patch states
> explicitly that python3 is the interpreter of choice, with
> update-alternatives I would never be sure what would land up on my
> device.

In the case of your patch, this would have been no problem, because the pat=
ched
file had support for both Pythons.

=46rom a distro owner's point of view, the priorities define which one gets
preferred.

This should be in line with PEP 394, and I think having a python symlink
always beats having none. :)

To explain the reasoning behind my approach a litte more: People want to wr=
ite
Python scripts compatible with both new and old devices. Many old devices w=
on't
ever get a Python 3 interpreter. It's possible to gain full compatibility on
a source code level, but you can never autodetect whether python2, python3 =
or
both are installed in $PATH with a single shebang. Also, people are already
used to not knowing whether python points to python2 or python3 (see Arch L=
inux).

Of course, many of you expect to have all scripts under control of OE, but =
what
I primarily have in mind are the device owners, who just copy over their sc=
ripts
with SSH.

Additionally, every patch that's not present in OE is a win for maintainabi=
lity.

Best regards,
Andreas

