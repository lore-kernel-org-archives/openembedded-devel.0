Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4F4176FF9F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2016 21:10:34 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n129so5300324wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2016 14:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=UyWMJnKrtCNxxEUN75VOq2SMfKrOs/bHIF4r+xhy1J0=;
	b=ChNzpTTuQynncvJjhh9C5yKJrZW5OXkTYKt84oONf8XP7lgLE5+aAp5VLq7enGfDP1
	YXcrQB2JKQduGRskCErNFiaFbqkMp7IDHHyJcJ3/17qBlv3qDL9geky0DLF+AntRTh6X
	1wulp9Mi3eZ+2wh2ZQfaO1QMkL2P/8u1djr5YGP1T2IFw71XUrw+l8V+j7UeluxH03zr
	wKNfmyR25ezMQgQUdRiGqBwIb61J4jC1KTcEcgqhE2bshRXlILua9CtHJPms3WXO0Ekb
	Iq3wc0Rz7HZCvRMTs2yx5tNSLgWT55kpngzY1g4Rx8Mne1Avweyc1a6qtz6cjvxuY49l
	ZVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=UyWMJnKrtCNxxEUN75VOq2SMfKrOs/bHIF4r+xhy1J0=;
	b=HprgJ4MmcYYk5CehdBg/7mNnAsD5ZQefXcZ1T3sz1Ikeh8ixmZoaJLqhyE9tA+F+X1
	5V8YxTza2tmAGHl3btWfobJIl27sz2QAOhlcZdpXjpsFgR92nhDp+UojVlTeLT0lfytQ
	C+4Pm1l7p9LKgYAQNcUDQ+CE0pVmvUpDYLG+R8y0moQtvxE6J3Ko+pDQRylyrI6lmlzV
	dhQIkrvSk6t+uBeAvNhzC9OEXQuB0axwjpNg/AVAJ9hZhNXd5/++Yokn3D93P+E2XUcG
	rGW8L/1kX700f9zA2XhEAvhyp1UPJcGiYPA1JaPeT1WNo8Gi53j1D8NaVvfVR7Lnxxcp
	xh+A==
X-Gm-Message-State: AOPr4FWtG05h6x8L+W4+ZvUDA6JIFHiyit8DkKwk/6bqTPD0sIW9/t+zaha1FnAqYnjSpQ==
X-Received: by 10.28.189.130 with SMTP id n124mr17686414wmf.76.1462914635069; 
	Tue, 10 May 2016 14:10:35 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id n66sm4977346wmn.7.2016.05.10.14.10.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 May 2016 14:10:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 10 May 2016 23:10:57 +0200
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20160510211057.GE5675@jama>
References: <cover.1462896891.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1462896891.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: koen.kooi@linaro.org, openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH V5 0/5] efivar: upgrade to 0.23
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
X-List-Received-Date: Tue, 10 May 2016 21:10:36 -0000
X-Groupsio-MsgNum: 61460
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YkJPYEFdoxh/AXLE"
Content-Disposition: inline

--YkJPYEFdoxh/AXLE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2016 at 12:19:34PM -0400, Hongxu Jia wrote:
> Changed in V5:
> - Fix unknown option while gold linker used

Still fails in world builds:

http://errors.yoctoproject.org/Errors/Details/62248/

i586-oe-linux-gcc  -m32 -march=3Di586 --sysroot=3D/home/jenkins/oe/world/sh=
r-core/tmp-glibc/sysroots/qemux86  -O2 -pipe -g -feliminate-unused-debug-ty=
pes -fdebug-prefix-map=3D/home/jenkins/oe/world/shr-core/tmp-glibc/work/i58=
6-oe-linux/efivar/0.23-r0=3D/usr/src/debug/efivar/0.23-r0 -fdebug-prefix-ma=
p=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux=3D -fde=
bug-prefix-map=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86=
=3D  -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/efivar/=
0.23-r0/git/src/include/efivar/  -specs=3D/home/jenkins/oe/world/shr-core/t=
mp-glibc/work/i586-oe-linux/efivar/0.23-r0/git/gcc.specs  -L.  -Wl,-O1 -Wl,=
--hash-style=3Dgnu -Wl,--as-needed     -o efivar efivar.c -lefivar -ldl -lp=
opt
/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec=
/i586-oe-linux/gcc/i586-oe-linux/5.3.0/ld: fatal error: -f/--auxiliary may =
not be used without -shared
collect2: error: ld returned 1 exit status

>=20
> Changed in V4:
> - Fix one failed with:
> | install -d -m 755 efivar/0.23-r0/image/usr/lib/pkgconfig/
> | install -m 644 efivar.pc efivar/0.23-r0/image/usr/lib/pkgconfig/
> ;  install -m 644 efiboot.pc efivar/0.23-r0/image/usr/lib/pkgconfig/
> ;
> | install: cannot stat 'efivar.pc': No such file or directory
> | install: cannot stat 'efiboot.pc': No such file or directory
> | make[1]: *** [install] Error 1
> | make[1]: Leaving directory `efivar/0.23-r0/git/src'
> | make: *** [install] Error 2
> | ERROR: oe_runmake failed
>=20
> //Hongxu
>=20
> The following changes since commit a6c172e2713f0018c5ebac0f957cff28b7ac26=
30:
>=20
>   poppler: add --std=3Dc++11 to fix build with Qt 5.7 (2016-05-06 12:40:2=
8 +0200)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib hongxu/fix-efivar
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Dhongxu/fix-efivar
>=20
> Hongxu Jia (3):
>   efivar: fix do_install failed
>   efibootmgr: sync with upstream while efivar upgraded to 0.23
>   efivar: fix unknown option while gold linker used
>=20
> Koen Kooi (2):
>   efivar: update to 0.23
>   efibootmgr: update and unblacklist
>=20
>  .../recipes-extended/efibootmgr/efibootmgr_0.12.bb | 14 ++---
>  .../efibootmgr/files/ldflags.patch                 | 17 ------
>  .../efivar/0001-efivar-fix-for-cross-compile.patch | 28 +++++----
>  .../efivar/efivar/0002-disable-static-build.patch  | 33 ++++++++++
>  .../efivar/0003-efivar-fix-for-cross-compile.patch | 44 ++++++++++++++
>  .../0004-fix-unknow-option-for-gold-linker.patch   | 40 ++++++++++++
>  ...ptions-not-supported-by-lower-version-gcc.patch | 71 ----------------=
------
>  .../efivar/{efivar_0.21.bb =3D> efivar_0.23.bb}      | 29 ++++-----
>  8 files changed, 155 insertions(+), 121 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/efibootmgr/files/ldflags.pat=
ch
>  create mode 100644 meta-oe/recipes-extended/efivar/efivar/0002-disable-s=
tatic-build.patch
>  create mode 100644 meta-oe/recipes-extended/efivar/efivar/0003-efivar-fi=
x-for-cross-compile.patch
>  create mode 100644 meta-oe/recipes-extended/efivar/efivar/0004-fix-unkno=
w-option-for-gold-linker.patch
>  delete mode 100644 meta-oe/recipes-extended/efivar/efivar/efivar-drop-op=
tions-not-supported-by-lower-version-gcc.patch
>  rename meta-oe/recipes-extended/efivar/{efivar_0.21.bb =3D> efivar_0.23.=
bb} (46%)
>=20
> --=20
> 2.8.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YkJPYEFdoxh/AXLE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcyTl8ACgkQN1Ujt2V2gBw2wQCgtNah9TwvDC2qvhfMS1/L27nQ
jU0An3uhdyIOVXZ+3TxyKX5XbiFjTY/c
=cw+A
-----END PGP SIGNATURE-----

--YkJPYEFdoxh/AXLE--
