Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 91D5160125
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 10:09:21 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so17830908wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2015 03:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8Tll6rW02drSJ1kFly96uKx6gcH9ZPhAlWNQ374/eEc=;
	b=FWuTPmil63M2ZG9UdtgNQt9qYyqsulyoUqybiBglct0KzLoqwbH3MRIbBFngyc1lKH
	CraVHnVrrN1n0u2Vpp9z3u3qMhP7K/0xMuCUl9ncaO3miozRDw6h9y2Eyx9E3QWrhAFh
	I7KchIALlNFIe/kZfRnFGV3gZqLz4SUAR1zRgB8aoFoiyCBu2swCJhvYQ5tNMFtqcIRR
	DF8LwYK/TCzUDJ86mz+l6utaXWq1hyXvhN36rEsnnKxv1GI6amFwzK+GiAgIIw2fV7sZ
	Y7o/rKbh+66km8S5xHDm2+b88RLLIhBJ8+2i6MaJ1R5Fu1Poi3bNVeNOt/4YYlc6rl2Z
	rYPg==
X-Received: by 10.180.149.167 with SMTP id ub7mr3064239wib.43.1444298961171;
	Thu, 08 Oct 2015 03:09:21 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id x7sm6553855wia.10.2015.10.08.03.09.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Oct 2015 03:09:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Oct 2015 12:09:32 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151008100932.GE2385@jama>
References: <1443047695-22567-1-git-send-email-haris.okanovic@ni.com>
MIME-Version: 1.0
In-Reply-To: <1443047695-22567-1-git-send-email-haris.okanovic@ni.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe] [PATCH] inotify-tools: Add
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
X-List-Received-Date: Thu, 08 Oct 2015 10:09:22 -0000
X-Groupsio-MsgNum: 57731
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6Vw0j8UKbyX0bfpA"
Content-Disposition: inline

--6Vw0j8UKbyX0bfpA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2015 at 05:34:55PM -0500, Haris Okanovic wrote:
> Add inotify-tools package, a C library and a set of command-line
> programs for Linux providing a simple interface to inotify kernel
> subsystem.
>=20
> https://github.com/rvoicilas/inotify-tools/wiki
> http://lwn.net/Articles/104343/
>=20
> Testing: Built and installed IPK onto an x64 system (OE Fido).
> inotifywatch and inotifywait successfully detected changes to
> a test file.

Fails to fetch from github.com, because of redirect to https and native
wget used in e.g. Ubuntu 12.04:

http://errors.yoctoproject.org/Errors/Details/20240/

>=20
> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> ---
>  meta-oe/recipes-support/inotify-tools/inotify-tools_3.14.bb | 9 +++++++++
>  1 file changed, 9 insertions(+)
>  create mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools_3=
=2E14.bb
>=20
> diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.14.bb =
b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.14.bb
> new file mode 100644
> index 0000000..75183ba
> --- /dev/null
> +++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.14.bb
> @@ -0,0 +1,9 @@
> +SUMMARY =3D "inotify command line utilities"
> +SECTION =3D "console/utils"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dac6c26e52aea428ee7f56dc2c5642=
4c6"
> +
> +SRC_URI =3D "http://github.com/downloads/rvoicilas/inotify-tools/inotify=
-tools-${PV}.tar.gz"
> +SRC_URI[sha256sum] =3D "222bcca8893d7bf8a1ce207fb39ceead5233b5015623d099=
392e95197676c92f"
> +
> +inherit autotools-brokensep
> --=20
> 2.4.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6Vw0j8UKbyX0bfpA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYWQNsACgkQN1Ujt2V2gBxsFACeNZP0DpRHJt904xP5JPAKRYfb
Mc4An1uRV8WbByAckU8pUtWQAIm9pohR
=MF22
-----END PGP SIGNATURE-----

--6Vw0j8UKbyX0bfpA--
