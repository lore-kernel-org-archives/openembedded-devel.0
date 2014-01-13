Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id CAA186BCE6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2014 10:11:31 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e51so2546857eek.41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2014 02:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Utz7IFXInjzZYy3MffszTxxCuRVtqqUdNcuCvzqPemE=;
	b=oYnFsnoU9oAqOpW+U+AgPkUhgNpRY2Mo6AXPdl+xdCb887xSIYoH4hmzjvVTv9BO+j
	bFDUGJakzTJRU8IIoGEn7e6P8K/3iejhaHsodybq4ipPkMW1DJHxVeE+wuphJwQrkOZC
	s995XTG4LHa9L0vME/b66/aOPyoUpmsAu5rQOUBxJh6UrE6UpHfKvNehcuSf5i4jhNlr
	vWgW3U4iQSwqpz7h+XRFEWxQGjpM+sdiPckwCgebFcr++KLMnft2LpHqneaeHzuNOXaG
	pu5w+TBAbQBnENzbtqKOR1zzVNWgaRdGvY+/5Pr5MNvEs8Qk6c3UqTIKAj76ikVZLZup
	diEA==
X-Received: by 10.14.0.201 with SMTP id 49mr26919758eeb.38.1389607890264;
	Mon, 13 Jan 2014 02:11:30 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id z46sm209884een.1.2014.01.13.02.11.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Jan 2014 02:11:28 -0800 (PST)
Date: Mon, 13 Jan 2014 11:11:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140113101147.GI16995@jama>
References: <CAPbeDCnrC84D8tqjT-A29YLO_hn2K1wQ5a_cK85uMVfGEzbrhQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPbeDCnrC84D8tqjT-A29YLO_hn2K1wQ5a_cK85uMVfGEzbrhQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5][jansa/qt5-5.2.0] libQt5*.la references OE build directories
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
X-List-Received-Date: Mon, 13 Jan 2014 10:11:32 -0000
X-Groupsio-MsgNum: 47694
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cN519qCC4CN1mUcX"
Content-Disposition: inline

--cN519qCC4CN1mUcX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2014 at 01:58:25AM +0100, Jacob Kroon wrote:
> Hi,
>=20
> I'm seeing what I believe is a problem with the *.la files in the Qt5
> dev-packages.
> The files references paths in my OE build environment, like so:
>=20
> ...
> # Libraries that this one depends upon.
> dependency_libs=3D'-lQt5Gui
> -L/home/jkroon/Projects/oe-devel/build/tmp-eglibc/sysroots/wandboard-solo=
/usr/lib
> -lQt5Core -lpthread '
> ...
> # Directory that this library needs to be installed in:
> libdir=3D'/home/jkroon/Projects/oe-devel/build/tmp-eglibc/sysroots/wandbo=
ard-solo/usr'
> ...
>=20
> I noticed this since my Qt5 autotools project wouldn't link properly when
> using the SDK, unless I first removed all libQt5*.la files.
>=20
> I'm not quite sure where to look for the problem so any pointers would be
> appreciated.

Probably bad rebase on my side, please compare

mkspecs/features/qt_module.prf in 5.1.1 and 5.2.0

changed in:
https://github.com/meta-qt5/meta-qt5/blob/master/recipes-qt/qt5/qtbase-5.1.=
1/0008-qt_module-Fix-pkgconfig-replacement.patch
and
https://github.com/meta-qt5/meta-qt5/blob/jansa/qt5-5.2.0/recipes-qt/qt5/qt=
base/0005-qt_module-Fix-pkgconfig-replacement.patch

Or better in meta-qt5's qtbase repo:
https://github.com/meta-qt5/qtbase/blob/b5.1.1/mkspecs/features/qt_module.p=
rf
https://github.com/meta-qt5/qtbase/blob/b5.2.0/mkspecs/features/qt_module.p=
rf

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cN519qCC4CN1mUcX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLTu+MACgkQN1Ujt2V2gBxHGACcCcGa5dD32k/d7PH+njsdpcJ8
DdYAn16BOyxJr2zRhzudv//q3lu4lUNM
=B9Qs
-----END PGP SIGNATURE-----

--cN519qCC4CN1mUcX--
