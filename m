Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 544BA71E63
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 10:09:13 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id n3so957107wmn.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 03:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=qoJEkSC1oguObKiZdp5Bv3o+0aJ/PuD8NQtjyg7kVik=;
	b=VmsnKHJi+uifrTTtgd1mbNU5Vb5x2N6Y2xeHdBqU6/v9AdL6S1qEmPGcqGfmc/Vvz9
	tu/JriwomkPbfn3FHm1doli99z3FCG1CV2HLvxGkxF/vOm4I5srGvlZraY+RblU9SB+Q
	9WzfOBrY5WZ2kca1YeoC02I7vp+sNXy7vHErE/2F4DXhkQNCcWf5R0q6B+0ti+dOUbDz
	raF4wbt1VcMvmpuRjFDGAutOU2H9UUXYg3Xs2fmXB6HczlA2r+6Fp7o/7nRcs0nAcUAw
	EzzRyu59V2r/z8U6VyZbB/mxgmx8f5fIGZb2F9RRJzE0f2KIhBWSRX6k5LawLG01F50Y
	C/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qoJEkSC1oguObKiZdp5Bv3o+0aJ/PuD8NQtjyg7kVik=;
	b=YOrUiLt6OJDjWD4Kkh+aNL+uVD7bbmIyrJQ26Y6UAPu/NFoEW558hlcsAf4aR8NyQ5
	qyIKQ+LXlqi879IcYncRPI86Zoa917tTHr9s3F4Yo+pZ4jx9WGs7BQyS994orrrs0JMQ
	vk+fPT3vP5mM/VkVAGLBu5vYMLezoYR6+opIau2Zc5vSYWxpGxzAtnC4YYjfmrFQHwzz
	u5funwR+H3XqaoJ/5s7VvLTWqgxe8ypV1l+uFpH3d75abAkXzfcowooipZo5j7No5Ccq
	KPQQt3AF0Tn/gbbjHSLWqhw8JDq8q40XU+SBNEFlum+vpxY1KWL/W47tj8ObEFVR86HE
	67YQ==
X-Gm-Message-State: AOPr4FWdydrfucqV9O8ygm7ZqrGOBs6KZdTdzduvJns46mNLRMDdRx/64BJai7pWqe7S8A==
X-Received: by 10.28.184.22 with SMTP id i22mr17553736wmf.41.1461665354036;
	Tue, 26 Apr 2016 03:09:14 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id y70sm2364539wmd.3.2016.04.26.03.09.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Apr 2016 03:09:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 26 Apr 2016 12:09:29 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160426100929.GB2559@jama>
References: <1461600320-20104-1-git-send-email-contact@jgueytat.fr>
MIME-Version: 1.0
In-Reply-To: <1461600320-20104-1-git-send-email-contact@jgueytat.fr>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: j.madieu@expemb.com
Subject: Re: [meta-qt5][PATCH] Use completely PKG_CONFIG which set the variables: - $libdir_raw - $incdir_raw - $libs - $cflags There is no need to have anything in the .pro files then.
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
X-List-Received-Date: Tue, 26 Apr 2016 10:09:16 -0000
X-Groupsio-MsgNum: 61174
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="neYutvxvOLaeuPCA"
Content-Disposition: inline

--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2016 at 06:05:20PM +0200, Julien Gueytat wrote:
> Please note that the variables used directly through mkspecs set the end =
variables
> while pkgconfig set $libdir_raw - $incdir_raw - $libs - $cflags.

You need blank line as separator of commit summary and body, also please
follow http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
and use better summary.

This patch isn't for meta-qt5 itself, but meta-qt5/qtbase repo, you
should create and test the patch in meta-qt5 (add the patch files to
qtbase directory and qtbase_git.bb).

I'm more concerned about other MACHINEs, I assume you've tested it only
for RPi, but you're changing egl.pro and opengles2.pro also for all
other setups and MACHINEs, so I'll wait a bit more for upstream reaction
for this patch.

I know you've created reports about this in upstream, please mention
them in commit message and also add Upstream-Status flag.

Thanks

>=20
> The previous code was trying to set the variable like QMAKE_LIBS_EGL
> through pkgconfig but it was not working.
>=20
> Use compileTestWithPkgconfig for the EGL test and the EGLFS RaspberryPi t=
est.
>=20
> The package config file from EGL already triggers bcm_host as a dependenc=
y.
>=20
> The master branch of meta-raspberrypi does the proper job.
>=20
> The way *.pro files and pkg_config needs changes.
> ---
>  config.tests/qpa/egl/egl.pro               |  8 --------
>  config.tests/qpa/eglfs-brcm/eglfs-brcm.pro |  9 ---------
>  config.tests/unix/opengles2/opengles2.pro  |  7 -------
>  configure                                  | 12 ++----------
>  4 files changed, 2 insertions(+), 34 deletions(-)
>=20
> diff --git a/config.tests/qpa/egl/egl.pro b/config.tests/qpa/egl/egl.pro
> index f04d053..c1889c5 100644
> --- a/config.tests/qpa/egl/egl.pro
> +++ b/config.tests/qpa/egl/egl.pro
> @@ -1,10 +1,2 @@
>  SOURCES =3D egl.cpp
> -
> -for(p, QMAKE_LIBDIR_EGL) {
> -    exists($$p):LIBS +=3D -L$$p
> -}
> -
> -!isEmpty(QMAKE_INCDIR_EGL): INCLUDEPATH +=3D $$QMAKE_INCDIR_EGL
> -!isEmpty(QMAKE_LIBS_EGL): LIBS +=3D $$QMAKE_LIBS_EGL
> -
>  CONFIG -=3D qt
> diff --git a/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro b/config.tests/qp=
a/eglfs-brcm/eglfs-brcm.pro
> index ce16a3a..164cdb4 100644
> --- a/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro
> +++ b/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro
> @@ -1,11 +1,2 @@
>  SOURCES =3D eglfs-brcm.cpp
> -
>  CONFIG -=3D qt
> -
> -INCLUDEPATH +=3D $$QMAKE_INCDIR_EGL
> -
> -for(p, QMAKE_LIBDIR_EGL) {
> -    exists($$p):LIBS +=3D -L$$p
> -}
> -
> -LIBS +=3D -lEGL -lGLESv2 -lbcm_host
> diff --git a/config.tests/unix/opengles2/opengles2.pro b/config.tests/uni=
x/opengles2/opengles2.pro
> index c4d7689..899ad99 100644
> --- a/config.tests/unix/opengles2/opengles2.pro
> +++ b/config.tests/unix/opengles2/opengles2.pro
> @@ -1,12 +1,5 @@
>  SOURCES =3D opengles2.cpp
> -INCLUDEPATH +=3D $$QMAKE_INCDIR_OPENGL_ES2
> -
> -for(p, QMAKE_LIBDIR_OPENGL_ES2) {
> -    exists($$p):LIBS +=3D -L$$p
> -}
> -
>  CONFIG -=3D qt
> -LIBS +=3D $$QMAKE_LIBS_OPENGL_ES2
>  mac {
>      DEFINES +=3D BUILD_ON_MAC
>  }
> diff --git a/configure b/configure
> index c696e7e..6d0567b 100755
> --- a/configure
> +++ b/configure
> @@ -5796,15 +5796,7 @@ if [ "$CFG_EGL" !=3D "no" ]; then
>          exit 101
>      fi
> =20
> -    if [ -n "$PKG_CONFIG" ] && $PKG_CONFIG --exists egl 2>/dev/null; then
> -        QMAKE_INCDIR_EGL=3D`$PKG_CONFIG --cflags-only-I egl 2>/dev/null =
| sed -e 's,^-I,,g' -e 's, -I, ,g'`
> -        QMAKE_LIBS_EGL=3D`$PKG_CONFIG --libs egl 2>/dev/null`
> -        QMAKE_CFLAGS_EGL=3D`$PKG_CONFIG --cflags egl 2>/dev/null`
> -        QMakeVar set QMAKE_INCDIR_EGL "$QMAKE_INCDIR_EGL"
> -        QMakeVar set QMAKE_LIBS_EGL "$QMAKE_LIBS_EGL"
> -        QMakeVar set QMAKE_CFLAGS_EGL "`echo " $QMAKE_CFLAGS_EGL " | sed=
 -e 's, -I[^ ]* , ,g;s,^ ,,;s, $,,'`"
> -    fi       # detect EGL support
> -    if compileTest qpa/egl "EGL" $QMAKE_CFLAGS_EGL $QMAKE_LIBS_EGL; then
> +    if compileTestWithPkgConfig egl qpa/egl "EGL" EGL; then
>          CFG_EGL=3Dyes
>          if compileTest qpa/egl-x11 "EGL-X11" $QMAKE_CFLAGS_EGL $QMAKE_LI=
BS_EGL; then
>              CFG_EGL_X=3Dyes
> @@ -5827,7 +5819,7 @@ if [ "$CFG_EGLFS" !=3D "no" ]; then
>      if [ "$XPLATFORM_QNX" =3D "no" ] && [ "$CFG_OPENGL" !=3D "no" ]; then
>          CFG_EGLFS=3D"$CFG_EGL"
>          # Detect eglfs backends.
> -        if compileTest qpa/eglfs-brcm "eglfs-brcm"; then
> +        if compileTestWithPkgConfig egl qpa/eglfs-brcm "eglfs-brcm" EGLF=
S_BRCM; then
>              CFG_EGLFS_BRCM=3Dyes
>          else
>              CFG_EGLFS_BRCM=3Dno
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--neYutvxvOLaeuPCA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcfPlgACgkQN1Ujt2V2gBxUQwCfd9jUSlf0QHKYuvY6CknQ0//o
xUwAoLhU7xsjAyz6oUt6nr2I593PRcey
=JR8h
-----END PGP SIGNATURE-----

--neYutvxvOLaeuPCA--
