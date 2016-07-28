Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3337A60721
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jul 2016 09:05:05 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q128so10137615wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jul 2016 02:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=55OCA+c2vmZkSdIaM6SqiSO63lOExlmo9He1fpoR95I=;
	b=xn5VNqBN+/w+0CnKCMSE+bz2jCEBZEK5aabMw+uH7fdpolbT9Q3544IuaWw+BOBiMR
	OAZGD8G6XGiYSaXVBmqKDotsPcQyGsqIRwRm5ysKDWbj0EUOiSFyQ2iUo4FYAKVD9Cox
	+eAcubhq66uKiBVsGauSYSOlfs7s4ofkrIPd4ySEF+c3XpfsH48bptD1ooZQtDCDsd0X
	8VmE8w6aHveQn2T7jGLtzj8QizuahHgJ5y0uernJE6Wsm0Xo5cAMglATaIjaPoxNhdTp
	x8AfOKB85TYct+ksSWBwLaysnlfQkBsT2oYxWu5iZ4aPBy3Rr/z3sBK9zb9Fa0I0kSPw
	19gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=55OCA+c2vmZkSdIaM6SqiSO63lOExlmo9He1fpoR95I=;
	b=O4laNXeSlso+x+C97aIl/+BwH+0wuJrLHf9iw0/t7dcvxOGcSXb+pXEj7qrE4QHhxm
	UBu54mofhcXFuByxQl3AAnHe6UsuQFIRvkI6KQTtTV35+uTqHPtnerTG3uF5Jxtf8Ej6
	TyjtRkm4acI3RBzwjimtk1vLWZrz6GAsEdbTm2xofESOVCDEM/2ClpZIesHA3XkloWsV
	qox9ErU9o8kdQJsjx5T76bES2Jvl3rZa5eHAlM7PhWqwCJ0Gur7HDXPrQ/XtT5qBon98
	oCgfxSvfuQamj4xg9fq0Ylwv1tHMnxfqfekOnGlc+Ce+VN9pTbXbaqPHPQDzzeQU1DAt
	aeaw==
X-Gm-Message-State: AEkoouvFv1nYwm+9zThl+ddTm5PsgvFzsGtxr7JnebejW7hHyGSuQ3RDDzZuz+vlYQWnPg==
X-Received: by 10.28.166.1 with SMTP id p1mr19898354wme.85.1469696706222;
	Thu, 28 Jul 2016 02:05:06 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	c13sm10480763wjx.12.2016.07.28.02.05.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 28 Jul 2016 02:05:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 28 Jul 2016 11:05:09 +0200
To: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <20160728090509.l3t775n7kzo3kv6x@jama>
References: <20160726092312.16134-1-kai.kang@windriver.com>
	<CA+chaQdZE=VDh7w61d0OHi15id+oRwhj1LudsRj1B_Z0MGC7nA@mail.gmail.com>
	<57999CC9.7080504@windriver.com>
MIME-Version: 1.0
In-Reply-To: <57999CC9.7080504@windriver.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] mariadb: upgrade to 5.5.50
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
X-List-Received-Date: Thu, 28 Jul 2016 09:05:07 -0000
X-Groupsio-MsgNum: 62379
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="teeybcxc7tkwmsd6"
Content-Disposition: inline

--teeybcxc7tkwmsd6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2016 at 01:48:57PM +0800, Kang Kai wrote:
> On 2016=E5=B9=B407=E6=9C=8827=E6=97=A5 17:50, Martin Jansa wrote:
> > Can you please double check the checksums? Doesn't work for me:
>=20
> Hi Martin,
>=20
> The checksums are right. Please see:
>=20
> http://archive.mariadb.org/mariadb-5.5.50/source/md5sums.txt
> 5cfb169934170a429589e05f0f5aba9c ./mariadb-5.5.50.tar.gz
>=20
> http://archive.mariadb.org/mariadb-5.5.50/source/sha256sums.txt
> 030b60a787333bf20ec0ee02b02da52474772c069954dc914f894a7703989b76=20
> ./mariadb-5.5.50.tar.gz

I did similar check yesterday and you're right they are ok.

Downloading from downloads.mariadb.org was quick (few seconds) while
downloading from archive.mariadb.org took over 1 hour (but in the end I
got the same file in manual test) maybe it failed to fetch it completely
during my jenkins builds.

> Please clean the source and try it again.

Bitbake cleans it automatically, so lets see in next bitbake world
build.

> Thanks.
>=20
> --Kai
>=20
> >
> > ERROR: mariadb-native-5.5.50-r0 do_fetch: Fetcher failure for URL:
> > 'http://archive.mariadb.org/mariadb-5.5.50/source/mariadb-5.5.50.tar.gz=
'.
> > Checksum mismatch!
> > File: '/home/jenkins/oe/world/shr-core/downloads/mariadb-5.5.50.tar.gz'
> > has md5 checksum 13cc3e0dfbc64698fd7838990ecae828 when
> > 5cfb169934170a429589e05f0f5aba9c was expected
> > File: '/home/jenkins/oe/world/shr-core/downloads/mariadb-5.5.50.tar.gz'
> > has sha256 checksum
> > 01227fd2954e02139e31ff16161754d82d9d9568746e7ebdb2cd49eb94ec849a when
> > 030b60a787333bf20ec0ee02b02da52474772c069954dc914f894a7703989b76 was
> > expected
> > If this change is expected (e.g. you have upgraded to a new version
> > without updating the checksums) then you can use these lines within
> > the recipe:
> > SRC_URI[md5sum] =3D "13cc3e0dfbc64698fd7838990ecae828"
> > SRC_URI[sha256sum] =3D
> > "01227fd2954e02139e31ff16161754d82d9d9568746e7ebdb2cd49eb94ec849a"
> > Otherwise you should retry the download and/or check with upstream to
> > determine if the file has become corrupted or otherwise unexpectedly
> > modified.
> >
> > ERROR: mariadb-native-5.5.50-r0 do_fetch: Function failed: Fetcher
> > failure for URL:
> > 'http://archive.mariadb.org/mariadb-5.5.50/source/mariadb-5.5.50.tar.gz=
'.
> > Unable to fetch URL from any source.
> > ERROR: Logfile of failure stored in:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/x86_64-linux/mariadb-nat=
ive/5.5.50-r0/temp/log.do_fetch.31301
> > NOTE: recipe mariadb-native-5.5.50-r0: task do_fetch: Failed
> > ERROR: Task /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/r=
ecipes-support/mysql/mariadb-native_5.5.50.bb:do_fetch
> > (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-supp=
ort/mysql/mariadb-native_5.5.50.bb:do_fetch)
> > failed with exit code '1'
> >
> >
> > On Tue, Jul 26, 2016 at 11:23 AM, <kai.kang@windriver.com> wrote:
> >
> >> From: Kai Kang <kai.kang@windriver.com>
> >>
> >> Upgrade mariadb from 5.5.46 to 5.5.50.
> >>
> >> * update runtime dependency of mariadb-setupdb which requires command
> >> install
> >>
> >> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> ---
> >>   .../mysql/{mariadb-native_5.5.46.bb =3D> mariadb-native_5.5.50.bb}  =
   | 0
> >>   meta-oe/recipes-support/mysql/mariadb.inc                           =
 | 5
> >> +++--
> >>   .../recipes-support/mysql/{mariadb_5.5.46.bb =3D> mariadb_5.5.50.bb}=
   | 0
> >>   3 files changed, 3 insertions(+), 2 deletions(-)
> >>   rename meta-oe/recipes-support/mysql/{mariadb-native_5.5.46.bb =3D>
> >> mariadb-native_5.5.50.bb} (100%)
> >>   rename meta-oe/recipes-support/mysql/{mariadb_5.5.46.bb =3D>
> >> mariadb_5.5.50.bb} (100%)
> >>
> >> diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.5.46.bb
> >> b/meta-oe/recipes-support/mysql/mariadb-native_5.5.50.bb
> >> similarity index 100%
> >> rename from meta-oe/recipes-support/mysql/mariadb-native_5.5.46.bb
> >> rename to meta-oe/recipes-support/mysql/mariadb-native_5.5.50.bb
> >> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc
> >> b/meta-oe/recipes-support/mysql/mariadb.inc
> >> index 4801ffe..9c3d234 100644
> >> --- a/meta-oe/recipes-support/mysql/mariadb.inc
> >> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
> >> @@ -17,8 +17,8 @@ SRC_URI =3D "
> >> http://archive.mariadb.org/mariadb-${PV}/source/mariadb-${PV}.tar.gz
> >>              file://fix-a-building-failure.patch \
> >>             "
> >>
> >> -SRC_URI[md5sum] =3D "92f682b00eb137af01e59ea93f7e31f7"
> >> -SRC_URI[sha256sum] =3D
> >> "45b66b7adc87cad32e553df1d5211e5b6426b78a3bc318a5ccde088bf93e6e10"
> >> +SRC_URI[md5sum] =3D "5cfb169934170a429589e05f0f5aba9c"
> >> +SRC_URI[sha256sum] =3D
> >> "030b60a787333bf20ec0ee02b02da52474772c069954dc914f894a7703989b76"
> >>
> >>   S =3D "${WORKDIR}/mariadb-${PV}"
> >>
> >> @@ -176,6 +176,7 @@ RDEPENDS_${PN}-leftovers =3D "perl perl-module-cwd
> >> perl-module-benchmark perl-modu
> >>       perl-module-file-spec perl-module-file-find perl-module-file-bas=
ename
> >> perl-module-file-path \
> >>       perl-module-constant perl-module-lib perl-module-file-temp
> >> perl-module-file-spec-functions \
> >>       perl-module-io-socket-inet perl-module-io-select"
> >> +RDEPENDS_${PN}-setupdb =3D "coreutils"
> >>
> >>   # Allow old code to link to the backward compatible library
> >>   RDEPENDS_libmysqlclient-dev =3D "libmysqlclient-r-dev"
> >> diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.46.bb
> >> b/meta-oe/recipes-support/mysql/mariadb_5.5.50.bb
> >> similarity index 100%
> >> rename from meta-oe/recipes-support/mysql/mariadb_5.5.46.bb
> >> rename to meta-oe/recipes-support/mysql/mariadb_5.5.50.bb
> >> --
> >> 2.9.2.368.g08bb350
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
>=20
>=20
> --=20
> Regards,
> Neil | Kai Kang
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--teeybcxc7tkwmsd6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleZysEACgkQN1Ujt2V2gByv1gCeIOkbzTwpaY6nkPvSQVMraMBU
S1cAn2gQRF8J5DvFrpR3xRUFP7PuuZsC
=yUrH
-----END PGP SIGNATURE-----

--teeybcxc7tkwmsd6--
