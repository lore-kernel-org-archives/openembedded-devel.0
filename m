Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 704F0601A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 10:37:26 +0000 (UTC)
Received: by wmww144 with SMTP id w144so191013861wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 02:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=m+Qs6gnBnpAZ7B7uqeYQ7j0fzQqQZ45yaPd9fr2Ek74=;
	b=QS/01syk/H1DWXjaIqf3aECWg3+5W4J8jM9Xo/sLYsDeTlPETvkpX4KIHvgbWfKbsa
	7cAyHPT16iZJI4hBmXKW6AYK4LasDjHFIQImgVeBrIZZ+uovXrXuFyngVeZlV9EHb8Al
	VV46g/UQd97Dgh0iGWfznYXm5Ar7hn6JAb+jPopQq3WDGQaKjCWHJ252+0g+LRtY/7+W
	bT0IAYCkUf516pw6Wjdjhmt/Er/iuvnI6lF4x7nBiEGXSfHVcY8UdZ41J3bAYxSHFSM4
	1dXPdtcwmTilffUtYTlz0+sIDlMKB8D8184CXmNHb/u3nKxHtJwE1GYHFnp8LHd5sUOR
	JxaA==
X-Received: by 10.195.13.135 with SMTP id ey7mr1038475wjd.25.1447843047461;
	Wed, 18 Nov 2015 02:37:27 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12])
	by smtp.gmail.com with ESMTPSA id at4sm2178038wjc.9.2015.11.18.02.37.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Nov 2015 02:37:26 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CABcZANm4cka2so5sm0C0FQcJXzAeNjXqBkNAjQChH4VqL=EUTA@mail.gmail.com>
Date: Wed, 18 Nov 2015 11:37:25 +0100
Message-Id: <186ABEC8-B079-467A-BC1F-F0EE5043531E@gmail.com>
References: <9A2ED550-50FC-4223-B79E-5801010FEF49@gmail.com>
	<CABcZAN=+c2SkEiZtVjZ1ZGtp5dXs79xYmRh2f1P50qV0Kzd2cw@mail.gmail.com>
	<CABcZAN=EgNrRxnML=Jb_ipNL-yYiFfwZRQLVaoNT2qBmpHA+rQ@mail.gmail.com>
	<577B0BDF-3AAB-44E9-AA59-781219452896@gmail.com>
	<CABcZANm4cka2so5sm0C0FQcJXzAeNjXqBkNAjQChH4VqL=EUTA@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
X-Mailer: Apple Mail (2.2104)
Cc: Matthias Rabe <matthias.rabe@sigma-chemnitz.de>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 18 Nov 2015 10:37:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 18.11.2015 um 03:08 schrieb Christopher Larson <kergoth@gmail.com>:
>=20
>=20
> On Fri, Nov 13, 2015 at 10:08 AM, Jens Rehsack <rehsack@gmail.com> =
wrote:
> > Am 13.11.2015 um 18:01 schrieb Christopher Larson =
<kergoth@gmail.com>:
> >
> > On Fri, Nov 13, 2015 at 9:56 AM, Christopher Larson =
<kergoth@gmail.com> wrote:
> > On Fri, Nov 13, 2015 at 8:53 AM, Jens Rehsack <rehsack@gmail.com> =
wrote:
> > To avoid errors when building dev-images (talloc-dev is missing), =
and to avoid
> > insane empty packages for that, rename talloc -> libtalloc as =
libtevent shows.
> >
> > With that, remove dependencies to attr/xattr and libbsd - unless =
explicitely
> > enabled via PACKAGECONFIG.
> >
> > Signed-off-by: Jens Rehsack <sno@netbsd.org>
> >
> > Our recipe names should be named based on the upstream project name, =
not the library they happen to ship.
> >
> > Instead, either we could we should kill all the libtalloc bits in =
the PACKAGES var, and let the debian shlib renaming handle renaming =
talloc* to libtalloc*, or add a talloc-dev that pulls in libtalloc-dev & =
pytalloc-dev.
> >
> > I just realized this may sound critical, but that wasn't intended. =
The other changes look great, thanks for your work on making those =
dependencies optional, it's good stuff.
>=20
> In that case - please take me by the hand and explain a bit more =
detailed
>=20
> > Instead, either we could we should kill all the libtalloc bits in =
the PACKAGES var, and let the debian shlib renaming handle renaming =
talloc* to libtalloc*
>=20
> since I have no clue what you try to guide me.
>=20
> I'm not able to reproduce any error when building an image. Add =
libtalloc and dev-pkgs, and it builds just fine. You can't add talloc, =
as there is no talloc package emitted.
>=20
> That said, what I was suggesting was something along the lines of =
https://gist.github.com/kergoth/ead0e1d2682a9e9fcd59 -- debian.bbclass =
will automatically rename the ${PN}, ${PN}-dev, and ${PN}-dbg packages =
based on the library soname, so will end up named libtalloc* anyway if =
you use it. Since the main packages weren't emitted at all, it was =
pointless complexity in the packaging to add libtalloc* explicitly.

Well, I had the problem and one of our contributors either that samba's =
dependency on talloc prevents creating a dev-image (not a regular =
image!), because no -dev image was emitted but talloc-dev was added as =
RDEPENDS automatically because it might contain header files or so (no =
idea).

I don't see the win in =
https://gist.github.com/kergoth/ead0e1d2682a9e9fcd59#file-talloc-patch-L25=
-L34 vs. renaming the recipe, but during meta-java cleanup and packaging =
openjdk-8 I encountered lot's of issues with RPROVIDES - so I try to =
avoid it where possible. And - as said - libtevent =
(http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recip=
es-support/libtevent) is currently there and accepted, don't see =
adopting talloc -> libtalloc doing similar.

You can HL me in #yocto if I miss something which might be clarified in =
a short talk.

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


