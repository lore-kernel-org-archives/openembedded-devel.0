Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
	[209.85.222.177])
	by mail.openembedded.org (Postfix) with ESMTP id 488187FA13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 23:59:50 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id t204so10764148qke.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 15:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=iLOeCgbR0eFZXCmv5npvvroMkyCaY93ihm4THEtLCls=;
	b=KnlGvc7POoYSyJhC4iWW1UuiDk54fcSjzJVg3w69G/xu0nqPi1+oJJjNEkf7K9btZE
	pJWDPCNaz7Ds6H1KR8J8nSttKiO8xoYS9phmRWzckzBdER1svLkiAJw7SWUrKqfkTfjC
	xGXpNA9dy8GM64qwwgg9ODoyUCERfx1BgENl3q7cubk3KH51Xxgg1axLQbSU/SJZKnY+
	Pg9Bwa7FKuoc3mIZbba+90SQrkfGlmojLGtZSw8+zBazJtbwXXZTyv9JGPiE9l56+uJX
	qmslmi8WiCbAod6+tllMk0uYA4XnIx1G1zpYkovh7bK2D/PWccb64ROU0C0DQF/mRzyl
	ar6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=iLOeCgbR0eFZXCmv5npvvroMkyCaY93ihm4THEtLCls=;
	b=jvH0c02crHxy/EDJ7/kyvyAfhHi9ZWV9ypM3kI00bUfZTlHWSSbzJ3uquqoeiWME+/
	c5e7kd5/G9fUi2j1KppYjZlHSbGpVoOJVMfDbYyWn2CDvy6BMo7PVu7UsxpsgZwq1cNE
	g89JqXQkEHf4eVXrrqiho9j4kwkaKXe0FljoXpQ+ZNqqszVRvQIgRY/KEKbJtwhF2wOl
	z/5G9dgpI1688oz0m6rWWe5H76kAaaCEDwhoXaKci8PsIHK7ZZHd3HCtUhBXjvoVJxg3
	exyq+wA1j6zcm2JTH5rGSP0IECLcSkwYCtOFzMpYql1bwZKGfCTSHYIXLyUKjSGs2zya
	enZQ==
X-Gm-Message-State: APjAAAUsDc0CeJlmczCjbsYt6DUFmbEt7v0K0bJ0el8k0H1p57oDJ/7v
	uvmhxp6lwdUB+nGap7UQhscY3TeU7Z3Bbw19LRM=
X-Google-Smtp-Source: APXvYqzfTCCFZTM5QFRfoOIiLfoftLugmXfq6C9hNM6vONrxzG5PEYWCR85giVk+S1NxVnKyHz5B6WsMZGxFwUacKMc=
X-Received: by 2002:a37:a3c7:: with SMTP id
	m190mr19673589qke.212.1580169590911; 
	Mon, 27 Jan 2020 15:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20200127173608.24874-1-andrey.zhizhikin@leica-geosystems.com>
	<20200127211618.28e763ec@opendreambox.org>
	<CAHtQpK7Owmuf6ks=ysjgTz6qCYyhspJD+wFYuJrzg-D3cM5rXw@mail.gmail.com>
	<20200128004508.6cb940a3@opendreambox.org>
In-Reply-To: <20200128004508.6cb940a3@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Jan 2020 15:59:24 -0800
Message-ID: <CAMKF1soxUZttyk5Q03ypPKTxEG=1k_BPjKFK65c5qnimTB8CwQ@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC] Manage python symlinks with update-alternatives
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
X-List-Received-Date: Mon, 27 Jan 2020 23:59:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2020 at 3:45 PM Andreas Oberritter <obi@opendreambox.org> w=
rote:
>
> Hi Andrey, everybody,
>
> This was "[meta-oe][PATCH 1/3] pcsc-lite: update recipe to use python3", =
where I suggested to use update-alternatives for python.
>
> I changed the topic in the hope of gaining a wider audience. Please don't=
 skip the quoted text:
>
> On Mon, 27 Jan 2020 23:42:50 +0100
> Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> > Hi Andreas,
> >
> > On Mon, Jan 27, 2020 at 9:16 PM Andreas Oberritter <obi@opendreambox.or=
g> wrote:
> > >
> > > Hi Andrey,
> > >
> > > On Mon, 27 Jan 2020 17:36:06 +0000
> > > Andrey Zhizhikin <andrey.z@gmail.com> wrote:
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
> > > > +-try:
> > > > +-    # for Python3
> > > > +-    from queue import Queue
> > > > +-except ImportError:
> > > > +-    # for Python2
> > > > +-    from Queue import Queue
> > > > ++from queue import Queue
> > > > + from threading import Thread
> > > > + from operator import attrgetter
> > > > +
> > > > +--
> > > > +2.17.1
> > > > +
> > >
> > > This patch would not have been necessary if we managed the python sym=
link with update-alternatives. I'm doing this in my layer. Maybe that would=
 be a better way to go? I won't be able to build master in the next days or=
 weeks, but if you want to try and submit it, here's what I have in my bbap=
pends:
> > >
> > > python_%.bbappend:
> > >
> > > inherit update-alternatives
> > >
> > > ALTERNATIVE_${PN}-core =3D "python"
> > > ALTERNATIVE_TARGET[python] =3D "${bindir}/python2"
> > > ALTERNATIVE_PRIORITY =3D "2"
> > >
> > > do_install_append_class-target() {
> > >     rm -f ${D}${bindir}/python
> > > }
> > >
> > > python3_%.bbappend:
> > >
> > > inherit update-alternatives
> > >
> > > ALTERNATIVE_${PN}-core =3D "python"
> > > ALTERNATIVE_TARGET[python] =3D "${bindir}/python3"
> > > ALTERNATIVE_PRIORITY =3D "3"
> >
> > That is an interesting suggestion... The only potential problem with
> > this one I see is that when target would require to have both versions
> > (2 and 3) then it might be interpreted wrong. This patch states
> > explicitly that python3 is the interpreter of choice, with
> > update-alternatives I would never be sure what would land up on my
> > device.
>
> In the case of your patch, this would have been no problem, because the p=
atched
> file had support for both Pythons.
>
> From a distro owner's point of view, the priorities define which one gets
> preferred.
>
> This should be in line with PEP 394, and I think having a python symlink
> always beats having none. :)
>

I differ slightly and would like to not create python symlink
intentionally, so we can
find and fix the needed packages. python2 is on its way out and
python4 doesn't yet exist
so, packages while so far have maintained backward compatibility with py2 m=
ight
not want to carry that along and would be open to use python3 explicitly so=
 they
might be upstreamable patches as well.

> To explain the reasoning behind my approach a litte more: People want to =
write
> Python scripts compatible with both new and old devices. Many old devices=
 won't
> ever get a Python 3 interpreter. It's possible to gain full compatibility=
 on
> a source code level, but you can never autodetect whether python2, python=
3 or
> both are installed in $PATH with a single shebang. Also, people are alrea=
dy
> used to not knowing whether python points to python2 or python3 (see Arch=
 Linux).
>
> Of course, many of you expect to have all scripts under control of OE, bu=
t what
> I primarily have in mind are the device owners, who just copy over their =
scripts
> with SSH.
>
> Additionally, every patch that's not present in OE is a win for maintaina=
bility.
>
> Best regards,
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

