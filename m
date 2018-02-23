Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 64134700F3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Feb 2018 01:27:57 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m207so1757875wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 17:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=FzzDIr5rsm2LyY7fgzE6k+NxB4LIeyTUw+TKRp2llBU=;
	b=HVt3I5me6wNzTZcd2JL7oEtkePJ1Y2C66gbkQievjH9LOJrEnuU7dc8dceZGZ7tqpv
	dgrW9MUzdlEHDbUEKYaHEApbMYPjvs5/5b3NJQj6VTFG3dDTYOaMgkhdAwUwlIFpv0R/
	/olUmo66ZfiodE2ZKhUqonzCIE0nv1f0Osu7RMIS6aKUBb/vbcNHWAOJMSneC2mA2hI9
	xzd7i9NtSTZS4ZJoAtBVYRzxE9qCJj0YXqtZjoCV8zqpH+goaEpLTtjT/yn35Ql0iD3X
	LxZgXDlS0qv76M1vgAogFNIHgaRmmfuxPCWhQx59vxOvahW20mb/8yRHer2SfLBvI05S
	PcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=FzzDIr5rsm2LyY7fgzE6k+NxB4LIeyTUw+TKRp2llBU=;
	b=qP6KEjgyY+30QFwYggWfkxXNcFtGLjKLHPSfRALdURZMiiufeFTiHEHHsU7P8attcp
	LWW2J5fwT0GDwYp8hh4cetOrpSQIB4KpFkKJ8y32Dsf+ejonAgv4kT98CUXIsJ4dRxgg
	Es2xy0js9snKU7eCJS/lsPCCyS+HSnSRmNvRriOw8mw33yd3qOZHXri9BxLJV6u4bq7v
	yHSs22933O9BvP7qaPtxlFzSDIwt/nXt75LXE9A97XU2nJR4oaKVp6biYXZdMWuIbJBx
	v7mmh5eWkfyQXNuKfVh4WO1v+qYlBTeugcBpsrEy+pKW3rbeetqOUDrmVawPHAhwXLz4
	aIJQ==
X-Gm-Message-State: APf1xPDKFHcpRqzg2ix4EfGlZxXFCynqyePUex4V0Sx15hwwd3V8pxzQ
	TykoLVlptuK/aG45p42O2kk=
X-Google-Smtp-Source: AG47ELshxXkqxHeHl7yZjmUIfS88s7nl34MwHQuitA6vDu8lYNU1FBAi+ELkg7BHrLmcy9x+2QORbg==
X-Received: by 10.28.112.15 with SMTP id l15mr244467wmc.119.1519349278878;
	Thu, 22 Feb 2018 17:27:58 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id m6sm801324wmb.6.2018.02.22.17.27.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Feb 2018 17:27:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 23 Feb 2018 02:27:57 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180223012757.GA1413@jama>
References: <20180222042940.3770-1-raj.khem@gmail.com>
	<20180222042940.3770-2-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20180222042940.3770-2-raj.khem@gmail.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH 2/2] qtbase: Add packageconfigs for renameat2 and getentropy use
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
X-List-Received-Date: Fri, 23 Feb 2018 01:27:58 -0000
X-Groupsio-MsgNum: 70847
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2018 at 08:29:40PM -0800, Khem Raj wrote:
> These features depend on underlying syscall support in kernel
> and if older kernels are in use, then we can have a knob to
> turn them off.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-qt/qt5/qtbase_git.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index e495b8c..843648f 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -71,7 +71,7 @@ PACKAGECONFIG_DISTRO ?=3D ""
>  PACKAGECONFIG_RELEASE ?=3D "release"
>  # This is in qt5.inc, because qtwebkit-examples are using it to enable c=
a-certificates dependency
>  # PACKAGECONFIG_OPENSSL ?=3D "openssl"
> -PACKAGECONFIG_DEFAULT ?=3D "dbus udev evdev widgets tools libs freetype =
tests"
> +PACKAGECONFIG_DEFAULT ?=3D "dbus udev evdev widgets tools libs freetype =
tests renameat2 getentropy"

Should renameat2 be enabled by default?

Either the test for it is broken in 5.11 or it's not available in
default setup.

In 2 very different builds it currently fail for me with:
| ERROR: Feature 'renameat2' was enabled, but the pre-condition 'config.lin=
ux && tests.renameat2' failed.

| Checking for renameat2()...
| + cd /OE/build/owpb/webos-ports/tmp-glibc/work/aarch64-webos-linux/qtbase=
/5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b-r0/build/config.tests/renameat2 &&=
 PKG_CONFIG_SYSROOT_DIR=3D/OE/build/owpb/webos-ports/tmp-glibc/work/aarch64=
-webos-linux/qtbase/5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b-r0/recipe-sysro=
ot PKG_CONFIG_LIBDIR=3D/OE/build/owpb/webos-ports/tmp-glibc/work/aarch64-we=
bos-linux/qtbase/5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b-r0/recipe-sysroot/=
usr/lib/pkgconfig /OE/build/owpb/webos-ports/tmp-glibc/work/aarch64-webos-l=
inux/qtbase/5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b-r0/recipe-sysroot-nativ=
e/usr/bin/qt5/qmake -qtconf /OE/build/owpb/webos-ports/tmp-glibc/work/aarch=
64-webos-linux/qtbase/5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b-r0/build/bin/=
qt.conf "CONFIG -=3D qt debug_and_release app_bundle lib_bundle" "CONFIG +=
=3D shared use_gold_linker warn_off console single_arch" "QMAKE_CFLAGS +=3D=
 --sysroot=3D/OE/build/owpb/webos-ports/tmp-glibc/work/aarch64-webos-linux/=
qtbase/5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b-r0/recipe-sysroot" "QMAKE_CX=
XFLAGS +=3D --sysroot=3D/OE/build/owpb/webos-ports/tmp-glibc/work/aarch64-w=
ebos-linux/qtbase/5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b-r0/recipe-sysroot=
" "QMAKE_LFLAGS +=3D --sysroot=3D/OE/build/owpb/webos-ports/tmp-glibc/work/=
aarch64-webos-linux/qtbase/5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b-r0/recip=
e-sysroot" -early "CONFIG +=3D cross_compile" /OE/build/owpb/webos-ports/tm=
p-glibc/work/aarch64-webos-linux/qtbase/5.10.1+5.11-alpha+gitAUTOINC+17b73b=
0d2b-r0/build/config.tests/renameat2
| + cd /OE/build/owpb/webos-ports/tmp-glibc/work/aarch64-webos-linux/qtbase=
/5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b-r0/build/config.tests/renameat2 &&=
 MAKEFLAGS=3D make
| > aarch64-webos-linux-g++  --sysroot=3D/OE/build/owpb/webos-ports/tmp-gli=
bc/work/aarch64-webos-linux/qtbase/5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b-=
r0/recipe-sysroot -c -pipe  -O2 -pipe -g -feliminate-unused-debug-types -fd=
ebug-prefix-map=3D/OE/build/owpb/webos-ports/tmp-glibc/work/aarch64-webos-l=
inux/qtbase/5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b-r0=3D/usr/src/debug/qtb=
ase/5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b-r0 -fdebug-prefix-map=3D/OE/bui=
ld/owpb/webos-ports/tmp-glibc/work/aarch64-webos-linux/qtbase/5.10.1+5.11-a=
lpha+gitAUTOINC+17b73b0d2b-r0/recipe-sysroot-native=3D -fdebug-prefix-map=
=3D/OE/build/owpb/webos-ports/tmp-glibc/work/aarch64-webos-linux/qtbase/5.1=
0.1+5.11-alpha+gitAUTOINC+17b73b0d2b-r0/recipe-sysroot=3D  -fvisibility-inl=
ines-hidden --sysroot=3D/OE/build/owpb/webos-ports/tmp-glibc/work/aarch64-w=
ebos-linux/qtbase/5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b-r0/recipe-sysroot=
 --sysroot=3D/OE/build/owpb/webos-ports/tmp-glibc/work/aarch64-webos-linux/=
qtbase/5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b-r0/recipe-sysroot -O2 -w -fP=
IC  -I. -I/OE/build/owpb/webos-ports/tmp-glibc/work/aarch64-webos-linux/qtb=
ase/5.10.1+5.11-alpha+gitAUTOINC+17b73b0d2b-r0/git/mkspecs/linux-oe-g++ -o =
main.o main.cpp
| > main.cpp: In function 'int main(int, char**)':
| > main.cpp:9:53: error: 'RENAME_NOREPLACE' was not declared in this scope
| >      renameat2(AT_FDCWD, argv[1], AT_FDCWD, argv[2], RENAME_NOREPLACE |=
 RENAME_WHITEOUT);
| >                                                      ^~~~~~~~~~~~~~~~
| > main.cpp:9:53: note: suggested alternative: '_IOS_NOREPLACE'
| >      renameat2(AT_FDCWD, argv[1], AT_FDCWD, argv[2], RENAME_NOREPLACE |=
 RENAME_WHITEOUT);
| >                                                      ^~~~~~~~~~~~~~~~
| >                                                      _IOS_NOREPLACE
| > main.cpp:9:72: error: 'RENAME_WHITEOUT' was not declared in this scope
| >      renameat2(AT_FDCWD, argv[1], AT_FDCWD, argv[2], RENAME_NOREPLACE |=
 RENAME_WHITEOUT);
| >                                                                        =
 ^~~~~~~~~~~~~~~
| > main.cpp:9:5: error: 'renameat2' was not declared in this scope
| >      renameat2(AT_FDCWD, argv[1], AT_FDCWD, argv[2], RENAME_NOREPLACE |=
 RENAME_WHITEOUT);
| >      ^~~~~~~~~
| > main.cpp:9:5: note: suggested alternative: 'renameat'
| >      renameat2(AT_FDCWD, argv[1], AT_FDCWD, argv[2], RENAME_NOREPLACE |=
 RENAME_WHITEOUT);
| >      ^~~~~~~~~
| >      renameat
| > Makefile:174: recipe for target 'main.o' failed =20
| > make: *** [main.o] Error 1
| test config.corelib.tests.renameat2 FAILED
|

I'll retry with 5.10(.1) soon.

> =20
>  PACKAGECONFIG ?=3D " \
>      ${PACKAGECONFIG_RELEASE} \
> @@ -146,6 +146,10 @@ PACKAGECONFIG[widgets] =3D "-widgets,-no-widgets"
>  PACKAGECONFIG[libproxy] =3D "-libproxy,-no-libproxy,libproxy"
>  PACKAGECONFIG[libinput] =3D "-libinput,-no-libinput,libinput"
>  PACKAGECONFIG[journald] =3D "-journald,-no-journald,systemd"
> +# needs kernel 3.16+
> +PACKAGECONFIG[renameat2] =3D "-feature-renameat2,-no-feature-renameat2,"
> +# needs kernel 3.17+
> +PACKAGECONFIG[getentropy] =3D "-feature-getentropy,-no-feature-getentrop=
y,"
> =20
>  QT_CONFIG_FLAGS_GOLD =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is=
-gold', '-use-gold-linker', '-no-use-gold-linker', d)}"
>  QT_CONFIG_FLAGS +=3D " \
> --=20
> 2.16.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWo9uHAAKCRA3VSO3ZXaA
HBA+AKCA9Oqx/8bqMGuPFZ3oMmwvFURd3ACfYP87On1qJeHSF6FqQMkmNm0STPM=
=R+zi
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
