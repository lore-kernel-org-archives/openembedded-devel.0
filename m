Return-Path: <joe@deserted.net>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 166A96059A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2014 03:36:32 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id h18so3876598igc.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jun 2014 20:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=U7gHZYVKvkBS88AHLjCx0xQwyhwfrnizwFzw/2GeUDs=;
	b=CYEx773YB+xAY3umyjIhDqLPZEULVaxTam5eV9LFIFNz948AGQqRG3M7yNIYKiBoU/
	HohX5jdDAE790qmM4XQdxiaoJ6FCebkF85eY16e8NyolX/An3YFS//uDH8lp2VxhZk7b
	HCRWITMR/IbIoKoIVVsVImHkqRjYTwpXcSR59L2GKh0c2J4J1nw+bJxjOn3BTjQMgdWM
	LnDOCSKaVNFQTUGSlCJ+4Wqmi/aVkLOQHOXbjRtd6+CAe/77mEA7A4dsHxO6UMd9mJOu
	LpSxLVaAf5zGGq7BsJnJfCYu7IYakFIASG4CUpSZTsksBUuTRFpdYoXbIvudAcRfFNae
	PLJA==
X-Gm-Message-State: ALoCoQnBuD/+rTQiiwyfQxp9VBKxhl/wBu5Cjys89Ksz+JwPxwkx6iaXcGrD3lyI7DagcueezLVH
X-Received: by 10.50.122.97 with SMTP id lr1mr29837079igb.18.1404099393591;
	Sun, 29 Jun 2014 20:36:33 -0700 (PDT)
Received: from skynet (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id ka6sm21277998igb.8.2014.06.29.20.36.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Jun 2014 20:36:32 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
Received: by skynet (Postfix, from userid 1000)
	id F2408168543; Sun, 29 Jun 2014 23:36:31 -0400 (EDT)
Date: Sun, 29 Jun 2014 23:36:31 -0400
From: Joe MacDonald <joe_macdonald@mentor.com>
To: Amy Fong <amy.fong@windriver.com>
Message-ID: <20140630033630.GB26745@deserted.net>
References: <20140623161121.GA29589@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20140623161121.GA29589@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking] [v2] Uprev memcached from upstream
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
X-List-Received-Date: Mon, 30 Jun 2014 03:36:33 -0000
X-Groupsio-MsgNum: 50621
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3uo+9/B/ebqu+fSQ"
Content-Disposition: inline

--3uo+9/B/ebqu+fSQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged.  I tweaked your commit a bit, though.

   - changed the indenting in do_install_append to 4 spaces from 7.
   - removed a paragraph from the description that didn't really
     describe the package
   - re-set the homepage to point at the memcached.org page since the
     other one just does an immediate redirect there anyway

Thanks Amy.
-J.

[[oe][meta-networking] [v2] Uprev memcached from upstream] On 14.06.23 (Mon=
 12:11) Amy Fong wrote:

> From c786655029c2d2d9f1d78ae5b3d4667003064b95 Mon Sep 17 00:00:00 2001
> From: Amy Fong <amy.fong@windriver.com>
> Date: Mon, 23 Jun 2014 12:08:58 -0400
> Subject: [PATCH] Uprev memcached from upstream
>=20
> memcached 1.4.15 has some configuration errors:
> configure:5798: error: cannot run test program while cross compiling
>=20
> Uprev has the needed fix for the configuration error and some other fixes.
>=20
> Signed-off-by: Amy Fong <amy.fong@windriver.com>
> ---
>  .../recipes-support/memcached/memcached_1.4.15.bb  | 15 -------
>  .../recipes-support/memcached/memcached_1.4.17.bb  | 50 ++++++++++++++++=
++++++
>  2 files changed, 50 insertions(+), 15 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/memcached/memcached_1=
=2E4.15.bb
>  create mode 100644 meta-networking/recipes-support/memcached/memcached_1=
=2E4.17.bb
>=20
> diff --git a/meta-networking/recipes-support/memcached/memcached_1.4.15.b=
b b/meta-networking/recipes-support/memcached/memcached_1.4.15.bb
> deleted file mode 100644
> index 016eaeb..0000000
> --- a/meta-networking/recipes-support/memcached/memcached_1.4.15.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -DESCRIPTION =3D "Free & open source, high-performance, distributed memor=
y object \
> -caching system, generic in nature, but intended for use in speeding up d=
ynamic \
> -web applications by alleviating database load."
> -HOMEPAGE =3D "http://memcached.org/"
> -LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7e5ded7363d335e1bb18013ca0804=
6ff"
> -
> -SRC_URI =3D "http://memcached.googlecode.com/files/memcached-${PV}.tar.g=
z"
> -
> -SRC_URI[md5sum] =3D "36ea966f5a29655be1746bf4949f7f69"
> -SRC_URI[sha256sum] =3D "169721ab7a7531add6ae9f6b14b6b5641725fe0b1f0bdf5c=
3a4327725901e2b4"
> -
> -DEPENDS =3D "libevent"
> -
> -inherit autotools
> diff --git a/meta-networking/recipes-support/memcached/memcached_1.4.17.b=
b b/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
> new file mode 100644
> index 0000000..ab85b61
> --- /dev/null
> +++ b/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
> @@ -0,0 +1,50 @@
> +SUMMARY =3D "A high-performance memory object caching system"
> +DESCRIPTION =3D "\
> + Danga Interactive developed memcached to enhance the speed of LiveJourn=
al.com, \
> + a site which was already doing 20 million+ dynamic page views per day f=
or 1 \
> + million users with a bunch of webservers and a bunch of database server=
s. \
> + memcached dropped the database load to almost nothing, yielding faster =
page \
> + load times for users, better resource utilization, and faster access to=
 the \
> + databases on a memcache miss. \
> + . \
> + memcached optimizes specific high-load serving applications that are de=
signed \
> + to take advantage of its versatile no-locking memory access system. Cli=
ents \
> + are available in several different programming languages, to suit the n=
eeds \
> + of the specific application. Traditionally this has been used in mod_pe=
rl \
> + apps to avoid storing large chunks of data in Apache memory, and to sha=
re \
> + this burden across several machines."
> +
> +HOMEPAGE =3D "http://www.danga.com/memcached/"
> +LICENSE =3D "BSD-3-Clause"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7e5ded7363d335e1bb18013ca0804=
6ff"
> +
> +inherit autotools
> +
> +DEPENDS +=3D "libevent"
> +RDEPENDS_${PN} +=3D "perl perl-module-posix perl-module-autoloader perl-=
module-tie-hash"
> +
> +SRC_URI =3D "http://www.memcached.org/files/${PN}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "46402dfbd7faadf6182283dbbd18b1a6"
> +SRC_URI[sha256sum] =3D "d9173ef6d99ba798c982ea4566cb4f0e64eb23859fdbf992=
6a89999d8cdc0458"
> +
> +python __anonymous () {
> +    endianness =3D d.getVar('SITEINFO_ENDIANNESS', True)
> +    if endianness =3D=3D 'le':
> +        d.setVar('EXTRA_OECONF', "ac_cv_c_endian=3Dlittle")
> +    else:
> +        d.setVar('EXTRA_OECONF', "ac_cv_c_endian=3Dbig")
> +}
> +
> +inherit update-rc.d
> +
> +INITSCRIPT_NAME =3D "memcached"
> +INITSCRIPT_PARAMS =3D "defaults"
> +
> +do_install_append() {
> +       install -D -m 755 ${S}/scripts/memcached-init ${D}${sysconfdir}/i=
nit.d/memcached
> +       mkdir -p ${D}/usr/share/memcached/scripts
> +       install -m 755 ${S}/scripts/memcached-tool ${D}/usr/share/memcach=
ed/scripts
> +       install -m 755 ${S}/scripts/start-memcached ${D}/usr/share/memcac=
hed/scripts
> +}
--=20
-Joe MacDonald.
:wq

--3uo+9/B/ebqu+fSQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJTsNs7AAoJEEn8ffcsOfaWWFEH/0repvatwfq5+zjiFyeyaGhw
wcIvvvd1L1rGp6oKvYKbG+K515puxXZwZuZpSjkK+Ya478+9LSVD28aldBsCv+Az
I/HqG4KYhNkQTBDB+c82Kh3t+NnYFHJ8bvtNev00416h3FYkSMOgtUgBQI+9M9pN
2jJECBO6g3o3hKe8OmChXV3K5IirWP2tfQF1BwS5FFldEghQBDny0WH3WVG/1X4F
n/9GNwX3BntYANstLEFPfzp1cItprpJyxdH2k1NY5YSH/DlaW3nxzFEeHmbZkNRP
E8GTTNw9f/3d7wwGPQSiOEypVMwufAP1zU2j7kAikmjXovUINsOI9CWoiHGrm14=
=bYDQ
-----END PGP SIGNATURE-----

--3uo+9/B/ebqu+fSQ--
