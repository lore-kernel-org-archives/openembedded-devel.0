Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 443186007A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 10:38:34 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l2so4090919wml.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 02:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=2ncZ8CWv4m2b5r6EhSxoBTXZPaq51wtUv5YOX8GScRM=;
	b=S3ApjKYT/MmUEu7vp3J1Mdx8OhlEb8swuQHbCe65ichHNr5p6uByJXDZetQjgexsbT
	BCg25/J6xvsxvm1yDHDR06xebpBIBfsyb3GPFF/UdXrENTA+o3IhsfaZR7zM3wuDdo7v
	QR30LB3pZUISEzeL6IT2VAkbiXm2LGTCwwSkbkXa5PKGpizMmFm6kpX/csRSv9T7MIwy
	mRejbNUPiNGiSiPZGTClr5m0YyVbv4vwWctZRdOxWIaqXpEfQkNVvQc6bU0vEjNbqbM8
	tbMfDLZjyRf5XwAdw0QKuoU3jOrrAE2MpqtLTv+wIw9fksSFXpvwhTPcz0gpoNsXOjVA
	7+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=2ncZ8CWv4m2b5r6EhSxoBTXZPaq51wtUv5YOX8GScRM=;
	b=TlD9YlRWUgQq6NQyHxBzVjPvZt9ZLTsood+8+YUmu9KY55W4XYknqMGZ2XcwBvgMbb
	ZoTan+pY/HS7X0OiW6HQ5fSXt7VlKhKRin/9uBc0dJHD6PFrblB4tDMwJw6oUu5fCW91
	OxDZ5apM7ZC0ZlDQF5KzjY7oU4Fdw9faVcWaCsXjBhjSAaqkn61lbK9DJfYFnMxnWvVk
	P46Yy/VIe6agjsoanuCidCpeyDObx923Hlv8nAgoS76vXgMi8BCGTKMzQgtkn/uWIQ6m
	1JaycKj6CM/V8QCRxHy9qit4E4Rmk3xM8DwUZ8X7PuNna2YaVZsQW/0OlC7yE6QWYYrt
	v4Tg==
X-Gm-Message-State: AIkVDXLom8N8RGl5ctMfjqo13lqMfJOled0NX+WAaGS949pml9yHwt5iFqPJN5dN9Hy3Bw==
X-Received: by 10.28.8.12 with SMTP id 12mr997944wmi.46.1482316715320;
	Wed, 21 Dec 2016 02:38:35 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	v202sm26309109wmv.8.2016.12.21.02.38.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Dec 2016 02:38:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 21 Dec 2016 11:38:34 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161221103834.GA3002@jama>
References: <20161216221033.18446-1-raj.khem@gmail.com>
	<20161220123446.GC3275@jama>
MIME-Version: 1.0
In-Reply-To: <20161220123446.GC3275@jama>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-oe][PATCH] hplip: Fix build with clang
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
X-List-Received-Date: Wed, 21 Dec 2016 10:38:36 -0000
X-Groupsio-MsgNum: 64453
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline

--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2016 at 01:34:46PM +0100, Martin Jansa wrote:
> On Fri, Dec 16, 2016 at 02:10:33PM -0800, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...de-cups-ppd.h-for-missing-ppd-definitions.patch | 42 ++++++++++++++=
++++++++
> >  meta-oe/recipes-extended/hplip/hplip_3.12.6.bb     |  1 +
> >  2 files changed, 43 insertions(+)
> >  create mode 100644 meta-oe/recipes-extended/hplip/hplip-3.12.6/0001-in=
clude-cups-ppd.h-for-missing-ppd-definitions.patch
> >=20
> > diff --git a/meta-oe/recipes-extended/hplip/hplip-3.12.6/0001-include-c=
ups-ppd.h-for-missing-ppd-definitions.patch b/meta-oe/recipes-extended/hpli=
p/hplip-3.12.6/0001-include-cups-ppd.h-for-missing-ppd-definitions.patch
> > new file mode 100644
> > index 0000000..f259b5f
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/hplip/hplip-3.12.6/0001-include-cups-ppd=
=2Eh-for-missing-ppd-definitions.patch
> > @@ -0,0 +1,42 @@
> > +From 7ef9c040dd959105c16d4dc67e14f3bbea25e77f Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 16 Dec 2016 19:51:19 +0000
> > +Subject: [PATCH] include cups/ppd.h for missing ppd definitions
> > +
> > +Fixes errors spotted by clang
> > +
> > +| prnt/hpcups/HPCupsFilter.cpp:365:18: error: use of undeclared identi=
fier 'ppdFindAttr'
> > +|     if (((attr =3D ppdFindAttr(m_ppd, "hpPrinterLanguage", NULL)) =
=3D=3D NULL) ||
> > +|                  ^
> > +| prnt/hpcups/HPCupsFilter.cpp:368:13: error: use of undeclared identi=
fier 'ppdClose'
> > +|             ppdClose(m_ppd);
> > +|             ^
> > +| prnt/hpcups/HPCupsFilter.cpp:444:9: error: use of undeclared identif=
ier 'ppdClose'
> > +|         ppdClose(m_ppd);
> > +|         ^
> > +| prnt/hpcups/HPCupsFilter.cpp:497:13: error: use of undeclared identi=
fier 'ppdOpenFile'
> > +|     m_ppd =3D ppdOpenFile(getenv("PPD"));
> > +|             ^
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > +Upstream-Status: Pending
> > +
> > + prnt/hpcups/HPCupsFilter.h | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/prnt/hpcups/HPCupsFilter.h b/prnt/hpcups/HPCupsFilter.h
> > +index 0431a7a..eb0cad6 100644
> > +--- a/prnt/hpcups/HPCupsFilter.h
> > ++++ b/prnt/hpcups/HPCupsFilter.h
> > +@@ -37,6 +37,7 @@
> > + #include "Job.h"
> > +=20
> > + #include "dbuscomm.h"
> > ++#include <cups/ppd.h>
> > +=20
> > + #define		DBITMAPFILEHEADER		14
> > + #define		DBITMAPINFOHEADER		40
> > +--=20
> > +1.9.1
> > +
> > diff --git a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb b/meta-oe/r=
ecipes-extended/hplip/hplip_3.12.6.bb
> > index 9848e5a..1f1e80c 100644
> > --- a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
> > +++ b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
> > @@ -9,6 +9,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
> >             file://fix-libusb-paths.patch \
> >             file://cups-1.6.patch \
> >             file://configure.patch \
> > +           file://0001-include-cups-ppd.h-for-missing-ppd-definitions.=
patch \
> >  "
>=20
> It failed to build even without clang (when using default toolchain),
> but this patch fails to apply:
>=20
> http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.dependencies.qemu=
arm.20161218_140914.log//2_max/failed/hplip.log

I've cherry-picked this directly from you branch and it fixed the line
endings in the patch and might fix to application of the .patch, lets
see if it fixes also the build with default toolchain.

>=20
> > =20
> >  DEPENDS +=3D "cups python libusb"
> > --=20
> > 2.10.2
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWFpbqQAKCRA3VSO3ZXaA
HEC5AJ9HzmLZIxiG1mPbWBFfhrWv+x736ACgi0iK0bFcATSfi8BMnj+UnnIdB7Q=
=bZ7m
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
