Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6F36B70333
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 11:22:40 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id x13so716938wgg.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 04:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DkhpWH0PYMlEexmCy0sNFiiGoDM47Hs0mqUOJJjW76U=;
	b=Y6yVyRLraiCzX3Z3PL+drlsDgKSJWmYxj0RRhaF4w+C01y3j1GTDcslB4N+IwSo5bJ
	v459IHyan/h2ko+1Nv/CSm4hTpvCozaz3pTPH7TqeDSOHHAwrt3HOezVVl1AT0imXsC2
	LiWHnN2Q5Ff+e9ux5BECoEYUx/JsktYdd3UhR0FGZ1MgWe9+L+AYjOW9+E//EXAvD2WG
	okgiXZPhACjf82hOoZ1BXDOM56Y7nR6CSbFj9iOwLgWORQTygYnpisBmH3psrK+3NTxS
	t9noOyCzUNyqcoPf9t75fq+4PLoB3xJ7/DY7XZxQd4IBz0pyiAfPEAosOI9CBP/rWxF4
	yBIA==
X-Received: by 10.180.187.113 with SMTP id fr17mr12793100wic.51.1405509756932; 
	Wed, 16 Jul 2014 04:22:36 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	10sm39128558wjr.22.2014.07.16.04.22.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jul 2014 04:22:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 16 Jul 2014 13:22:42 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140716112242.GS2433@jama>
References: <1399414836-16702-1-git-send-email-nickdademo@gmail.com>
	<20140506222845.GE30955@jama>
	<CANR6C555Le4jbMW=h3wrSedJgHKWZDnW6WZoz48GJo2dDwd_4A@mail.gmail.com>
	<20140507165709.GI30955@jama>
	<CANR6C56P=cU=J6D_xNCPNdY+0smqzjuRxLWWBoJUgY3LBisfvg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANR6C56P=cU=J6D_xNCPNdY+0smqzjuRxLWWBoJUgY3LBisfvg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] opencv: Bump SRCREV to 2.4.9 release tag, PV is now 2.4.9+git.
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
X-List-Received-Date: Wed, 16 Jul 2014 11:22:46 -0000
X-Groupsio-MsgNum: 50994
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YqKeQn+qkMVHQmbT"
Content-Disposition: inline

--YqKeQn+qkMVHQmbT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 01, 2014 at 02:36:04AM +1000, Nick D'Ademo wrote:
> Apologies for the late reply on this one.
>=20
> jasper (as a dependency) seems to be fine with this recipe.
> However, libdc1394 gives the following error (camera.h header not found):

NAK: last test-dependencies build shows:

WARN: packages/armv5te-oe-linux-gnueabi/opencv/libopencv-highgui/latest los=
t dependency on  jasper libdc1394

> ERROR: Function failed: do_compile (log file is located at
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrA=
UTOINC+b90342933b-r0/temp/log.do_compile.10117)
> ERROR: Logfile of failure stored in:
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrA=
UTOINC+b90342933b-r0/temp/log.do_compile.10117
> Log data follows:
> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
> 'bit-64', 'x86_64-linux', 'common']
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 8
> | make  all-recursive
> | make[1]: Entering directory
> `/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitr=
AUTOINC+b90342933b-r0/build'
> | Making all in dc1394
> | make[2]: Entering directory
> `/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitr=
AUTOINC+b90342933b-r0/build/dc1394'
> | Making all in linux
> | make[3]: Entering directory
> `/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitr=
AUTOINC+b90342933b-r0/build/dc1394/linux'
> | make[3]: Nothing to be done for `all'.
> | make[3]: Leaving directory
> `/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitr=
AUTOINC+b90342933b-r0/build/dc1394/linux'
> | Making all in juju
> | make[3]: Entering directory
> `/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitr=
AUTOINC+b90342933b-r0/build/dc1394/juju'
> | ../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile
> x86_64-poky-linux-gcc  -m64 -march=3Dcorei7 -mtune=3Dcorei7 -mfpmath=3Dsse
> -msse4.2 --sysroot=3D/home/nick/poky/build/tmp/sysroots/8tree -DHAVE_CONF=
IG_H
> -I.
> -I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+git=
rAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju
> -I../..
> -I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+git=
rAUTOINC+b90342933b-r0/git/libdc1394/dc1394
> -Wall -Wunused -std=3Dgnu99  -O2 -pipe -g -feliminate-unused-debug-types =
-c
> -o control.lo
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrA=
UTOINC+b90342933b-r0/git/libdc1394/dc1394/juju/control.c
> | ../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile
> x86_64-poky-linux-gcc  -m64 -march=3Dcorei7 -mtune=3Dcorei7 -mfpmath=3Dsse
> -msse4.2 --sysroot=3D/home/nick/poky/build/tmp/sysroots/8tree -DHAVE_CONF=
IG_H
> -I.
> -I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+git=
rAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju
> -I../..
> -I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+git=
rAUTOINC+b90342933b-r0/git/libdc1394/dc1394
> -Wall -Wunused -std=3Dgnu99  -O2 -pipe -g -feliminate-unused-debug-types =
-c
> -o capture.lo
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrA=
UTOINC+b90342933b-r0/git/libdc1394/dc1394/juju/capture.c
> | x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64
> -march=3Dcorei7 -mtune=3Dcorei7 -mfpmath=3Dsse -msse4.2
> --sysroot=3D/home/nick/poky/build/tmp/sysroots/8tree -DHAVE_CONFIG_H -I.
> -I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+git=
rAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju
> -I../..
> -I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+git=
rAUTOINC+b90342933b-r0/git/libdc1394/dc1394
> -Wall -Wunused -std=3Dgnu99 -O2 -pipe -g -feliminate-unused-debug-types -c
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrA=
UTOINC+b90342933b-r0/git/libdc1394/dc1394/juju/control.c
> -fPIC -DPIC -o .libs/control.o
> | x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64
> -march=3Dcorei7 -mtune=3Dcorei7 -mfpmath=3Dsse -msse4.2
> --sysroot=3D/home/nick/poky/build/tmp/sysroots/8tree -DHAVE_CONFIG_H -I.
> -I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+git=
rAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju
> -I../..
> -I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+git=
rAUTOINC+b90342933b-r0/git/libdc1394/dc1394
> -Wall -Wunused -std=3Dgnu99 -O2 -pipe -g -feliminate-unused-debug-types -c
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrA=
UTOINC+b90342933b-r0/git/libdc1394/dc1394/juju/capture.c
> -fPIC -DPIC -o .libs/capture.o
> | In file included from
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrA=
UTOINC+b90342933b-r0/git/libdc1394/dc1394/juju/control.c:35:0:
> |
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrA=
UTOINC+b90342933b-r0/git/libdc1394/dc1394/platform.h:27:27:
> fatal error: dc1394/camera.h: No such file or directory
> |  #include <dc1394/camera.h>
> |                            ^
> | compilation terminated.
> | make[3]: *** [control.lo] Error 1
> | make[3]: *** Waiting for unfinished jobs....
> | In file included from
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrA=
UTOINC+b90342933b-r0/git/libdc1394/dc1394/internal.h:28:0,
> |                  from
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrA=
UTOINC+b90342933b-r0/git/libdc1394/dc1394/juju/juju.h:29,
> |                  from
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrA=
UTOINC+b90342933b-r0/git/libdc1394/dc1394/juju/capture.c:37:
> |
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrA=
UTOINC+b90342933b-r0/git/libdc1394/dc1394/platform.h:27:27:
> fatal error: dc1394/camera.h: No such file or directory
> |  #include <dc1394/camera.h>
> |                            ^
> | compilation terminated.
> | make[3]: *** [capture.lo] Error 1
> | make[3]: Leaving directory
> `/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitr=
AUTOINC+b90342933b-r0/build/dc1394/juju'
> | make[2]: *** [all-recursive] Error 1
> | make[2]: Leaving directory
> `/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitr=
AUTOINC+b90342933b-r0/build/dc1394'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory
> `/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitr=
AUTOINC+b90342933b-r0/build'
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | WARNING:
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrA=
UTOINC+b90342933b-r0/temp/run.do_compile.10117:1
> exit 1 from
> |   exit 1
> | ERROR: Function failed: do_compile (log file is located at
> /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gitrA=
UTOINC+b90342933b-r0/temp/log.do_compile.10117)
> ERROR: Task 1372
> (/home/nick/poky/meta-openembedded/meta-multimedia/recipes-multimedia/lib=
dc1394/
> libdc1394_git.bb, do_compile) failed with exit code '1'
>=20
>=20
>=20
>=20
> On Thu, May 8, 2014 at 2:57 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
>=20
> > On Wed, May 07, 2014 at 11:57:09PM +1000, Nick D'Ademo wrote:
> > > The recipe successfully builds without errors (multilib build) -
> > however, I
> > > also had no dependencies issues with the previous version of the reci=
pe
> > > either (2.4.8+git).
> >
> > Have you tried building opencv before and after building jasper nad
> > libdc1394 in the same sysroot and comparing opencv output?
> >
> > >
> > >
> > > On Wed, May 7, 2014 at 8:28 AM, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> > >
> > > > On Wed, May 07, 2014 at 08:20:36AM +1000, Nick D'Ademo wrote:
> > > > > Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
> > > >
> > > > Does it fix this issue reported in test-dependencies report?
> > > >
> > > > opencv/libopencv-highgui/latest lost dependency on  jasper libdc1394
> > > >
> > > > > ---
> > > > >  meta-oe/recipes-support/opencv/opencv_2.4.bb |    4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git
> > a/meta-oe/recipes-support/opencv/opencv_2.4.bbb/meta-oe/recipes-support=
/opencv/
> > > > opencv_2.4.bb
> > > > > index df512f6..43e6a2b 100644
> > > > > --- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
> > > > > +++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
> > > > > @@ -9,12 +9,12 @@ ARM_INSTRUCTION_SET =3D "arm"
> > > > >
> > > > >  DEPENDS =3D "python-numpy libtool swig swig-native python bzip2 =
zlib
> > > > glib-2.0"
> > > > >
> > > > > -SRCREV =3D "a4b34e7ae10351fc4d30dc55995679340efc488e"
> > > > > +SRCREV =3D "df8e28283f09825cca0c2902160b7abebcfe1b64"
> > > > >  SRC_URI =3D "git://github.com/Itseez/opencv.git;branch=3D2.4 \
> > > > >             file://opencv-fix-pkgconfig-generation.patch \
> > > > >  "
> > > > >
> > > > > -PV =3D "2.4.8+git${SRCPV}"
> > > > > +PV =3D "2.4.9+git${SRCPV}"
> > > > >
> > > > >  S =3D "${WORKDIR}/git"
> > > > >
> > > > > --
> > > > > 1.7.9.5
> > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-devel mailing list
> > > > > Openembedded-devel@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > >
> > > > --
> > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > >
> > > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YqKeQn+qkMVHQmbT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPGYIIACgkQN1Ujt2V2gBxM6wCfZYgzRi50d+bTglyWvpTdUE2v
b8AAnjjjBbcr9XlSmhQaTxPXDSKBuBlr
=yNzL
-----END PGP SIGNATURE-----

--YqKeQn+qkMVHQmbT--
