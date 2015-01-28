Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 335BE7147D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 10:51:47 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id p10so20042714wes.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 02:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qgEoW83xNG2oFbKqSvtB959JYsJ+Cfxugv1mz2E0+Vg=;
	b=0j/qfZpJ7ZkQPO0QZzeB/aRu7XOw/wsDxYVGJA4elQcyhZY4mAw9aE777uiIn0XF2s
	kmlv7Nm3CpQ2+Xs31vXcXWdUO8H2lk3YGv1HIugmp0iTlLSdx1p+k6+knl9Yf3OviRgJ
	zVLu+gXxukABihej7NTMFQSKMuBrH1q6x7Te3jYffhuGp9jHReEeLC63c2EOMyfBciPo
	RBOPeMaIj+mbn/XRbfQh9Jd75xRi0HP4L/tuowy9E7WqFW3umufe2j8uewD/vy4tFJf2
	sWobCw3XiBpC7BZjYumkJLm73TlNUnDrzek6z+jD5kBU3a1WUhDkpIB3SR5tioCP71ew
	Dtpg==
X-Received: by 10.181.8.199 with SMTP id dm7mr5562530wid.81.1422442307634;
	Wed, 28 Jan 2015 02:51:47 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	b10sm5532253wjr.32.2015.01.28.02.51.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jan 2015 02:51:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 28 Jan 2015 11:51:48 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150128105148.GE2477@jama>
References: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH 0/5] qt-creator for target machine
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
X-List-Received-Date: Wed, 28 Jan 2015 10:51:49 -0000
X-Groupsio-MsgNum: 54009
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3O1VwFp74L81IIeR"
Content-Disposition: inline

--3O1VwFp74L81IIeR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2015 at 06:53:48AM +0100, Andreas M=FCller wrote:
> These patches were build tested for 5.4.0 with all qt5 recipes I am worki=
ng on
> currently (kf5/hawaii/mauii). Git versions were not yet tested.
> On target:
>=20
> * toolchain was set
> * QT5 c++ project was build and debugged
>=20
> We shall see what Martin's world says - maybe we need a EXCLUDE_FROM_WORL=
D for
> meta-oe's qt-creator (conditional on meta-qt5 included in layer).

One of these is causing qtbase_git build failure:

| generators/win32/cesdkhandler.cpp:96: error: undefined reference to 'QDeb=
ug::~QDebug()'
| ../src/corelib/io/qdir.cpp:2330: error: undefined reference to 'QDebug::~=
QDebug()'
| ../src/corelib/io/qdir.cpp:2330: error: undefined reference to 'QDebug::~=
QDebug()'
| ../src/corelib/io/qdir.cpp:2328: error: undefined reference to 'QDebug::~=
QDebug()'
| collect2: error: ld returned 1 exit status
| make: *** [bin/qmake] Error 1
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtbase/5.4.0+gitA=
UTOINC+47326b9c5c-r0/temp/log.do_compile.23226)

> Andreas M=FCller (5):
>   qtbase: remove patches required for native(-sdk) only
>   qtbase/EXTERNAL_HOST_BINS: split out code only required for
>     native-(sdk)
>   qtbase: build qmake for target with paths aligned
>   qt5-creator: add 3.3.0 of qt-creator
>   add gdb append to enable python packageconfig
>=20
>  recipes-devtools/gdb/gdb_%.bbappend                |   1 +
>  recipes-qt/qt5/nativesdk-qtbase.inc                |   1 +
>  recipes-qt/qt5/nativesdk-qtbase_git.bb             |   1 +
>  ...t-creator-to-build-on-arm-aarch32-and-aar.patch |  94 +++++++++++++++=
+++
>  recipes-qt/qt5/qt5-creator/qtcreator.desktop.in    |  10 ++
>  recipes-qt/qt5/qt5-creator_3.3.0.bb                |  87 +++++++++++++++=
++
>  recipes-qt/qt5/qtbase-native.inc                   |   1 +
>  recipes-qt/qt5/qtbase.inc                          |  27 +++---
>  .../0003-Add-external-hostbindir-option.patch      |  75 ---------------
>  ...-build-it-in-configure-but-allow-to-build.patch |  27 ++++--
>  ...014-Add-external-hostbindir-option-native.patch | 106 +++++++++++++++=
++++++
>  .../0015-Set-paths-for-target-properly.patch       |  72 ++++++++++++++
>  recipes-qt/qt5/qtbase_git.bb                       |   3 +-
>  13 files changed, 407 insertions(+), 98 deletions(-)
>  create mode 100644 recipes-devtools/gdb/gdb_%.bbappend
>  create mode 100644 recipes-qt/qt5/qt5-creator/0001-Fix-Allow-qt-creator-=
to-build-on-arm-aarch32-and-aar.patch
>  create mode 100644 recipes-qt/qt5/qt5-creator/qtcreator.desktop.in
>  create mode 100644 recipes-qt/qt5/qt5-creator_3.3.0.bb
>  create mode 100644 recipes-qt/qt5/qtbase/0014-Add-external-hostbindir-op=
tion-native.patch
>  create mode 100644 recipes-qt/qt5/qtbase/0015-Set-paths-for-target-prope=
rly.patch
>=20
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3O1VwFp74L81IIeR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTIv0QACgkQN1Ujt2V2gBzSIwCfay4ZROBLpWHF02rZs5w7H5zZ
iw4AoI8aLPy56kDivY/v6lC87soa3NIe
=wDJF
-----END PGP SIGNATURE-----

--3O1VwFp74L81IIeR--
