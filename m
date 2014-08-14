Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id D323C60424
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 19:13:23 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id hr17so1580976lab.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 12:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=raP+ToMpZbN73+8qVjzTWgUYgIgfFlybG/fgIC+FPSQ=;
	b=WsXP1IoU5yUyiYH5fAGV05YKSjXVr2uXPD24Imtl+5MOd5fm/0vLV1TPqSQJYmogTD
	FdUok/D73XqUaom0N9/qtTdZnFvoU90Bw2Ry3A+3KkMurWHajeJiId5P1kWrJsJFAWA8
	6c30rX5DSpdLRw7VjqmIAffhudJBnbZFLKKiYqwPchjnkt7jUngY7FpAUCVwFmEy0V3y
	rALwsqCCbcRN0PjLlGaeQNJmAzY+lxmvbH+lG952nW27PRg9fpccrZWB149vdlN+2uvf
	wXkDh+tl9UUQ4QQLWSd16s/Dky+hPJoabvF6FTlQKYJMbvOIrFDSbtyzd6zNotgadu+3
	ivVw==
X-Received: by 10.152.205.35 with SMTP id ld3mr7227303lac.48.1408043604087;
	Thu, 14 Aug 2014 12:13:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	aq10sm9104553lbc.9.2014.08.14.12.13.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 12:13:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 14 Aug 2014 21:14:01 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140814191401.GP14848@jama>
References: <1399414836-16702-1-git-send-email-nickdademo@gmail.com>
	<20140506222845.GE30955@jama>
	<CANR6C555Le4jbMW=h3wrSedJgHKWZDnW6WZoz48GJo2dDwd_4A@mail.gmail.com>
	<20140507165709.GI30955@jama>
	<CANR6C56P=cU=J6D_xNCPNdY+0smqzjuRxLWWBoJUgY3LBisfvg@mail.gmail.com>
	<20140716112242.GS2433@jama>
MIME-Version: 1.0
In-Reply-To: <20140716112242.GS2433@jama>
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
X-List-Received-Date: Thu, 14 Aug 2014 19:13:24 -0000
X-Groupsio-MsgNum: 51705
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WmbeDIqooxy+l+0t"
Content-Disposition: inline

--WmbeDIqooxy+l+0t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2014 at 01:22:42PM +0200, Martin Jansa wrote:
> On Sun, Jun 01, 2014 at 02:36:04AM +1000, Nick D'Ademo wrote:
> > Apologies for the late reply on this one.
> >=20
> > jasper (as a dependency) seems to be fine with this recipe.
> > However, libdc1394 gives the following error (camera.h header not found=
):
>=20
> NAK: last test-dependencies build shows:
>=20
> WARN: packages/armv5te-oe-linux-gnueabi/opencv/libopencv-highgui/latest l=
ost dependency on  jasper libdc1394

PING

I've merged this in the end, but the issue is still there

opencv-2.4.9+gitAUTOINC+df8e28283f: libopencv-highgui rdepends on jasper, b=
ut it isn't a build dependency? [build-deps]
opencv-2.4.9+gitAUTOINC+df8e28283f: libopencv-highgui rdepends on libdc1394=
, but it isn't a build dependency? [build-deps]


> > ERROR: Function failed: do_compile (log file is located at
> > /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+git=
rAUTOINC+b90342933b-r0/temp/log.do_compile.10117)
> > ERROR: Logfile of failure stored in:
> > /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+git=
rAUTOINC+b90342933b-r0/temp/log.do_compile.10117
> > Log data follows:
> > | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
> > 'bit-64', 'x86_64-linux', 'common']
> > | DEBUG: Executing shell function do_compile
> > | NOTE: make -j 8
> > | make  all-recursive
> > | make[1]: Entering directory
> > `/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gi=
trAUTOINC+b90342933b-r0/build'
> > | Making all in dc1394
> > | make[2]: Entering directory
> > `/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gi=
trAUTOINC+b90342933b-r0/build/dc1394'
> > | Making all in linux
> > | make[3]: Entering directory
> > `/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gi=
trAUTOINC+b90342933b-r0/build/dc1394/linux'
> > | make[3]: Nothing to be done for `all'.
> > | make[3]: Leaving directory
> > `/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gi=
trAUTOINC+b90342933b-r0/build/dc1394/linux'
> > | Making all in juju
> > | make[3]: Entering directory
> > `/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gi=
trAUTOINC+b90342933b-r0/build/dc1394/juju'
> > | ../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile
> > x86_64-poky-linux-gcc  -m64 -march=3Dcorei7 -mtune=3Dcorei7 -mfpmath=3D=
sse
> > -msse4.2 --sysroot=3D/home/nick/poky/build/tmp/sysroots/8tree -DHAVE_CO=
NFIG_H
> > -I.
> > -I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+g=
itrAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju
> > -I../..
> > -I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+g=
itrAUTOINC+b90342933b-r0/git/libdc1394/dc1394
> > -Wall -Wunused -std=3Dgnu99  -O2 -pipe -g -feliminate-unused-debug-type=
s -c
> > -o control.lo
> > /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+git=
rAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju/control.c
> > | ../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile
> > x86_64-poky-linux-gcc  -m64 -march=3Dcorei7 -mtune=3Dcorei7 -mfpmath=3D=
sse
> > -msse4.2 --sysroot=3D/home/nick/poky/build/tmp/sysroots/8tree -DHAVE_CO=
NFIG_H
> > -I.
> > -I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+g=
itrAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju
> > -I../..
> > -I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+g=
itrAUTOINC+b90342933b-r0/git/libdc1394/dc1394
> > -Wall -Wunused -std=3Dgnu99  -O2 -pipe -g -feliminate-unused-debug-type=
s -c
> > -o capture.lo
> > /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+git=
rAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju/capture.c
> > | x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64
> > -march=3Dcorei7 -mtune=3Dcorei7 -mfpmath=3Dsse -msse4.2
> > --sysroot=3D/home/nick/poky/build/tmp/sysroots/8tree -DHAVE_CONFIG_H -I.
> > -I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+g=
itrAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju
> > -I../..
> > -I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+g=
itrAUTOINC+b90342933b-r0/git/libdc1394/dc1394
> > -Wall -Wunused -std=3Dgnu99 -O2 -pipe -g -feliminate-unused-debug-types=
 -c
> > /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+git=
rAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju/control.c
> > -fPIC -DPIC -o .libs/control.o
> > | x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64
> > -march=3Dcorei7 -mtune=3Dcorei7 -mfpmath=3Dsse -msse4.2
> > --sysroot=3D/home/nick/poky/build/tmp/sysroots/8tree -DHAVE_CONFIG_H -I.
> > -I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+g=
itrAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju
> > -I../..
> > -I/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+g=
itrAUTOINC+b90342933b-r0/git/libdc1394/dc1394
> > -Wall -Wunused -std=3Dgnu99 -O2 -pipe -g -feliminate-unused-debug-types=
 -c
> > /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+git=
rAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju/capture.c
> > -fPIC -DPIC -o .libs/capture.o
> > | In file included from
> > /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+git=
rAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju/control.c:35:0:
> > |
> > /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+git=
rAUTOINC+b90342933b-r0/git/libdc1394/dc1394/platform.h:27:27:
> > fatal error: dc1394/camera.h: No such file or directory
> > |  #include <dc1394/camera.h>
> > |                            ^
> > | compilation terminated.
> > | make[3]: *** [control.lo] Error 1
> > | make[3]: *** Waiting for unfinished jobs....
> > | In file included from
> > /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+git=
rAUTOINC+b90342933b-r0/git/libdc1394/dc1394/internal.h:28:0,
> > |                  from
> > /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+git=
rAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju/juju.h:29,
> > |                  from
> > /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+git=
rAUTOINC+b90342933b-r0/git/libdc1394/dc1394/juju/capture.c:37:
> > |
> > /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+git=
rAUTOINC+b90342933b-r0/git/libdc1394/dc1394/platform.h:27:27:
> > fatal error: dc1394/camera.h: No such file or directory
> > |  #include <dc1394/camera.h>
> > |                            ^
> > | compilation terminated.
> > | make[3]: *** [capture.lo] Error 1
> > | make[3]: Leaving directory
> > `/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gi=
trAUTOINC+b90342933b-r0/build/dc1394/juju'
> > | make[2]: *** [all-recursive] Error 1
> > | make[2]: Leaving directory
> > `/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gi=
trAUTOINC+b90342933b-r0/build/dc1394'
> > | make[1]: *** [all-recursive] Error 1
> > | make[1]: Leaving directory
> > `/home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+gi=
trAUTOINC+b90342933b-r0/build'
> > | make: *** [all] Error 2
> > | ERROR: oe_runmake failed
> > | WARNING:
> > /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+git=
rAUTOINC+b90342933b-r0/temp/run.do_compile.10117:1
> > exit 1 from
> > |   exit 1
> > | ERROR: Function failed: do_compile (log file is located at
> > /home/nick/poky/build/tmp/work/corei7-64-poky-linux/libdc1394/2.2.1+git=
rAUTOINC+b90342933b-r0/temp/log.do_compile.10117)
> > ERROR: Task 1372
> > (/home/nick/poky/meta-openembedded/meta-multimedia/recipes-multimedia/l=
ibdc1394/
> > libdc1394_git.bb, do_compile) failed with exit code '1'
> >=20
> >=20
> >=20
> >=20
> > On Thu, May 8, 2014 at 2:57 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> >=20
> > > On Wed, May 07, 2014 at 11:57:09PM +1000, Nick D'Ademo wrote:
> > > > The recipe successfully builds without errors (multilib build) -
> > > however, I
> > > > also had no dependencies issues with the previous version of the re=
cipe
> > > > either (2.4.8+git).
> > >
> > > Have you tried building opencv before and after building jasper nad
> > > libdc1394 in the same sysroot and comparing opencv output?
> > >
> > > >
> > > >
> > > > On Wed, May 7, 2014 at 8:28 AM, Martin Jansa <martin.jansa@gmail.co=
m>
> > > wrote:
> > > >
> > > > > On Wed, May 07, 2014 at 08:20:36AM +1000, Nick D'Ademo wrote:
> > > > > > Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
> > > > >
> > > > > Does it fix this issue reported in test-dependencies report?
> > > > >
> > > > > opencv/libopencv-highgui/latest lost dependency on  jasper libdc1=
394
> > > > >
> > > > > > ---
> > > > > >  meta-oe/recipes-support/opencv/opencv_2.4.bb |    4 ++--
> > > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git
> > > a/meta-oe/recipes-support/opencv/opencv_2.4.bbb/meta-oe/recipes-suppo=
rt/opencv/
> > > > > opencv_2.4.bb
> > > > > > index df512f6..43e6a2b 100644
> > > > > > --- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
> > > > > > +++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
> > > > > > @@ -9,12 +9,12 @@ ARM_INSTRUCTION_SET =3D "arm"
> > > > > >
> > > > > >  DEPENDS =3D "python-numpy libtool swig swig-native python bzip=
2 zlib
> > > > > glib-2.0"
> > > > > >
> > > > > > -SRCREV =3D "a4b34e7ae10351fc4d30dc55995679340efc488e"
> > > > > > +SRCREV =3D "df8e28283f09825cca0c2902160b7abebcfe1b64"
> > > > > >  SRC_URI =3D "git://github.com/Itseez/opencv.git;branch=3D2.4 \
> > > > > >             file://opencv-fix-pkgconfig-generation.patch \
> > > > > >  "
> > > > > >
> > > > > > -PV =3D "2.4.8+git${SRCPV}"
> > > > > > +PV =3D "2.4.9+git${SRCPV}"
> > > > > >
> > > > > >  S =3D "${WORKDIR}/git"
> > > > > >
> > > > > > --
> > > > > > 1.7.9.5
> > > > > >
> > > > > > --
> > > > > > _______________________________________________
> > > > > > Openembedded-devel mailing list
> > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-dev=
el
> > > > >
> > > > > --
> > > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-devel mailing list
> > > > > Openembedded-devel@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > > >
> > > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > >
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WmbeDIqooxy+l+0t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPtCnkACgkQN1Ujt2V2gBx7uACaA5CmdfRPEFb0mI3V7j8nk+bR
mvsAnjErnvo6i01MjSywKxI8VEpgpf0c
=DIET
-----END PGP SIGNATURE-----

--WmbeDIqooxy+l+0t--
