Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <e.robertson.svg@gmail.com>) id 1Jgi8G-0006Ig-Sy
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Apr 2008 17:10:42 +0200
Received: by an-out-0708.google.com with SMTP id b33so574709ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2008 08:10:29 -0700 (PDT)
Received: by 10.100.249.9 with SMTP id w9mr19565693anh.63.1207062629698;
	Tue, 01 Apr 2008 08:10:29 -0700 (PDT)
Received: from debian ( [74.254.162.162])
	by mx.google.com with ESMTPS id 36sm71274agc.9.2008.04.01.08.10.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Apr 2008 08:10:28 -0700 (PDT)
From: E Robertson <e.robertson.svg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 1 Apr 2008 09:10:22 -0500
User-Agent: KMail/1.9.7
References: <200803311438.09825.e.robertson.svg@gmail.com>
	<200803312307.51210.zecke@selfish.org>
	<200804010807.38670.e.robertson.svg@gmail.com>
In-Reply-To: <200804010807.38670.e.robertson.svg@gmail.com>
MIME-Version: 1.0
Message-Id: <200804010910.27677.e.robertson.svg@gmail.com>
Cc: Holger Freyther <zecke@selfish.org>
Subject: Re: stable branch checksum missmatch for quilt-0.45
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Apr 2008 15:10:42 -0000
X-Groupsio-MsgNum: 4884
Content-Type: multipart/signed; boundary="nextPart1253015.mTKzWTahFR";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1253015.mTKzWTahFR
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tuesday 01 April 2008 08:07:34 am E Robertson wrote:
> Hi Z,
> You must be the funny one.
>
> > Resolving facts:
> > 	sha256 might be equal to SHA256
> >
> > 	oe_sha256sum might be an OpenEmbedded (oe) program to calculate a
> > 	sha256. It was not able to execute it
> >
> > 	It was not able to execute oe_sha256sum, the stuff printed on the
> > console was "".
> >
> > 	This could explain the mismatch?
> >
> > Applying knowledge:
> > 	You have a failure because oe_sha256sum failed to be executed.
> >
> > Possible next steps:
> > 	- Check if you have a oe_sha256sum
> > 	- Check if your home partition allows execution of binaries
> > 	- Check your build logs if oe_sha256sum was attempted to be built
> > 	- Check the dep graph if there is a oe_sha256sum in it (bitbake -g and
> > then read the files and search for sha256)
> >
> > oe_sha256sum is supposed to be built before everything else, and normal=
ly
> > is. So good luck and please provide more feedback (you seem to get
> > started)
>
> I had already checked if the oe_sha256sum executable was build and it was
> not. I also did a grep to see where the build was initiated.
> Building from the dev branch did not give me this error because it was
> build - hence I specify the _stable_ branch:
>
> ./oetmp/work/i686-linux/shasum-native-1.0-r1/oe_sha256sum
> ./oetmp/staging/i686-linux/usr/bin/oe_sha256sum
>
> Since it was already built by the dev branch and I use the same local file
> to build the stable branch, would it / should it skip the build and use t=
he
> built binary? Or would it just rebuild the binary?
> What is the command to a clean build?
>
> In your last point above, what is a "dep graph"?

I did a clean build (?) (bitbake shasum-native -c clean && bitbake -b=20
shasum-native.bb)  and it build suscessfully (at least it appears to be).
At what point is staging/i686-linux/usr/bin/oe_sha256sum copy updated?

rebuilding bitbake -b quilt_0.45.bb I got the error below but the quilt-nat=
ive=20
package build successfully.=20

NOTE: package quilt-0.45: started
NOTE: package quilt-0.45-r1: task do_configure: started
ERROR: function do_configure failed
ERROR: log data follows=20
(/OpenEmbedded_Stuff/oetmp/work/armv5te-angstrom-linux-uclibcgnueabi/quilt-=
0.45-r1/temp/log.do_configure.16497)
| automake (GNU automake) 1.10.1
| Copyright (C) 2008 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later=20
<http://gnu.org/licenses/gpl.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.10
| NOTE: Executing=20
autoreconf --verbose --install --force --exclude=3Dautopoint -I/OpenEmbedde=
d_Stuff/oetmp/staging/arm-angstrom-linux-uclibcgnueabi/share/aclocal-1.10 -=
I /OpenEmbedded_Stuff/oetmp/staging/arm-angstrom-linux-uclibcgnueabi/share/=
aclocal
| /usr/bin/autoreconf: unrecognized option `--exclude=3Dautopoint'
| Try `/usr/bin/autoreconf --help' for more information.
| FATAL: autoreconf execution failed.
NOTE: Task=20
failed: /OpenEmbedded_Stuff/oetmp/work/armv5te-angstrom-linux-uclibcgnueabi=
/quilt-0.45-r1/temp/log.do_configure.16497
NOTE: package quilt-0.45-r1: task do_configure: failed
ERROR: TaskFailed event exception, aborting
NOTE: package quilt-0.45: failed
ERROR: Build of 'quilt' failed


Also:
bitbake helloworld
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it to=
=20
increase performance.
NOTE: Handling BitBake files: - (4974/4974) [100 %]
NOTE: Parsing finished. 4718 cached, 0 parsed, 256 skipped, 0 masked.
NOTE: build 200804010853: started

OE Build Configuration:
BB_VERSION     =3D "1.8.10"
OE_REVISION    =3D "a0a3cc0088bc51023a19b1d6942f7cc643e6bb52"
TARGET_ARCH    =3D "arm"
TARGET_OS      =3D "linux-uclibcgnueabi"
MACHINE        =3D "at91sam9263ek"
DISTRO         =3D "angstrom"
DISTRO_VERSION =3D "2008.1-test-20080401"
TARGET_FPU     =3D "soft"

NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for=20
virtual/arm-angstrom-linux-uclibcgnueabi-libc-for-gcc (uclibc,=20
external-toolchain);
NOTE: consider defining=20
PREFERRED_PROVIDER_virtual/arm-angstrom-linux-uclibcgnueabi-libc-for-gcc
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1 of 290 (ID:=20
22, /OpenEmbedded_Stuff/org.openembedded.stable/packages/shasum/shasum-nati=
ve.bb,=20
do_prepackaged_stage)
NOTE: package shasum-native-1.0: started
ERROR: InvalidTask event exception, aborting
NOTE: package shasum-native-1.0: failed
ERROR: Build=20
of /OpenEmbedded_Stuff/org.openembedded.stable/packages/shasum/shasum-nativ=
e.bb=20
do_prepackaged_stage failed
ERROR: Task 22=20
(/OpenEmbedded_Stuff/org.openembedded.stable/packages/shasum/shasum-native.=
bb,=20
do_prepackaged_stage) failed
NOTE: Tasks Summary: Attempted 0 tasks of which 0 didn't need to be rerun a=
nd=20
1 failed.
ERROR: '/OpenEmbedded_Stuff/org.openembedded.stable/packages/shasum/shasum-=
native.bb'=20
failed


--nextPart1253015.mTKzWTahFR
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBH8kJT2sS31XKVICURAugTAKCFKQZvcj51Xgh1h+CwUwse+ZxNYACfWAn+
sdF9fxcnbhTmo/g4KInLtWU=
=Vdsn
-----END PGP SIGNATURE-----

--nextPart1253015.mTKzWTahFR--
