Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 389A165DED
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 11:46:59 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id b15so2939910eek.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 04:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xx4iUGKXn3O4o2B+9tL5FV3A0zTklIOHOzUzDqHHzUI=;
	b=ZTUOSgs2lOo11FziLhGTbVbUQVGJRzDAwLt4siV+GMHXrZmcsWnXYpUK1LyuxzZxjH
	mFRM2gZ9MBdOIC4ilCjKK3e70doKSS1qeahP4CgEMQ8fgoeG1HU2aFM/1SLKpNdjWvBA
	8jVosXWj9agNkCrbG4UBey6+Ofwsew7nSHa1ZyP1BUN9k53B9SE7LmJG3FJ7A/Ev1ALu
	vvA8lvORbvunKVUS5uZGhe436UUjWUemb2yESF13p5/54SCR7l8qFmroj6lrJhVXieQR
	2Gcg1rtcnQxfzVl3hdPxgZqjD9x2qYNbk6gf80FIu8nulErkaEXp5P5dLYWMmRlMj9sn
	c8Jw==
X-Received: by 10.14.3.69 with SMTP id 45mr61632eeg.68.1397994420525;
	Sun, 20 Apr 2014 04:47:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u1sm93952536eex.31.2014.04.20.04.46.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 04:46:59 -0700 (PDT)
Date: Sun, 20 Apr 2014 13:47:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140420114704.GD2486@jama>
References: <1397029826-16492-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1397029826-16492-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] fbset: fix parallel build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Apr 2014 11:47:00 -0000
X-Groupsio-MsgNum: 49337
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4p/IC6kBmCKpHx3O"
Content-Disposition: inline

--4p/IC6kBmCKpHx3O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 09, 2014 at 03:50:26PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Fix an incorrect dependency in makefile so that we can build
> in parallel.

Merged, thanks!

>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../fbset-2.1/fbset-2.1-fix-makefile-dep.patch     |   31 ++++++++++++++=
++++++
>  meta-oe/recipes-support/fbset/fbset_2.1.bb         |    6 ++--
>  2 files changed, 34 insertions(+), 3 deletions(-)
>  create mode 100644 meta-oe/recipes-support/fbset/fbset-2.1/fbset-2.1-fix=
-makefile-dep.patch
>=20
> diff --git a/meta-oe/recipes-support/fbset/fbset-2.1/fbset-2.1-fix-makefi=
le-dep.patch b/meta-oe/recipes-support/fbset/fbset-2.1/fbset-2.1-fix-makefi=
le-dep.patch
> new file mode 100644
> index 0000000..41ab8af
> --- /dev/null
> +++ b/meta-oe/recipes-support/fbset/fbset-2.1/fbset-2.1-fix-makefile-dep.=
patch
> @@ -0,0 +1,31 @@
> +From 3db6782de1de7ca4f1bb9ee7652c4f2808e57539 Mon Sep 17 00:00:00 2001
> +From: Jackie Huang <jackie.huang@windriver.com>
> +Date: Thu, 10 Jan 2013 12:24:33 +0800
> +Subject: [PATCH] fbset 2.1 fix makefile dep modes.tab.c
> +
> +Upstream-Status: Inappropriate [no upstream]
> +
> +fix the error in parallel build:
> +make: *** No rule to make target `modes.tab.h', needed by `lex.yy.o'.  S=
top.=20
> +
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +---
> + Makefile |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 61536c1..09183e5 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -15,7 +15,7 @@ fbset:		fbset.o modes.tab.o lex.yy.o
> +=20
> + fbset.o:	fbset.c fbset.h fb.h
> + modes.tab.o:	modes.tab.c fbset.h fb.h
> +-lex.yy.o:	lex.yy.c fbset.h modes.tab.h
> ++lex.yy.o:	lex.yy.c fbset.h modes.tab.c
> +=20
> + lex.yy.c:	modes.l
> + 		$(FLEX) modes.l
> +--=20
> +1.7.4.1
> +
> diff --git a/meta-oe/recipes-support/fbset/fbset_2.1.bb b/meta-oe/recipes=
-support/fbset/fbset_2.1.bb
> index aa78008..84f35ff 100644
> --- a/meta-oe/recipes-support/fbset/fbset_2.1.bb
> +++ b/meta-oe/recipes-support/fbset/fbset_2.1.bb
> @@ -14,12 +14,12 @@ DEPENDS =3D "bison-native"
>  PR =3D "r4"
> =20
>  SRC_URI =3D "http://ftp.debian.org/debian/pool/main/f/fbset/fbset_2.1.or=
ig.tar.gz \
> -           file://makefile.patch"
> +           file://makefile.patch \
> +           file://fbset-2.1-fix-makefile-dep.patch \
> +"
> =20
>  inherit autotools update-alternatives
> =20
> -PARALLEL_MAKE =3D ""
> -
>  do_install() {
>      install -d ${D}${sbindir} ${D}${datadir}/man/man8 ${D}${datadir}/man=
/man5
>      install -m 0755 ${WORKDIR}/${P}/fbset ${D}${sbindir}/fbset.real
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4p/IC6kBmCKpHx3O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTs7gACgkQN1Ujt2V2gBz4owCgiXvpRPE+XoJMpn3MPAPRXc2p
vD8AnRuJCxMKghm8zx7uj+53w4O5GsI6
=AjRJ
-----END PGP SIGNATURE-----

--4p/IC6kBmCKpHx3O--
