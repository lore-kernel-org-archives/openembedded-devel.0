Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PKU0V-0000Gx-EB for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 11:52:26 +0100
Received: from f053040216.adsl.alicedsl.de ([78.53.40.216]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PKTzN-0001Ga-5M for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 10:51:13 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20101119210801.GE8017@gmail.com>
References: <1290185336.3681.13.camel@mattotaupa>
	<20101119210801.GE8017@gmail.com>
Date: Mon, 22 Nov 2010 11:51:11 +0100
Message-ID: <1290423071.3703.9.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gsl.inc: Remove `do_stage`.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Nov 2010 10:52:26 -0000
X-Groupsio-MsgNum: 26409
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-0qfRyEZHOpS1tYPMEOu/"

--=-0qfRyEZHOpS1tYPMEOu/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 19.11.2010, 13:08 -0800 schrieb Khem Raj:
> On (19/11/10 17:48), Paul Menzel wrote:
> > Date: Fri, 19 Nov 2010 17:33:00 +0100
> >=20
> > Inkscape fails to build after commit c2c8fe [1] with the following erro=
r.
> >=20
> >     | checking for CAIRO_USER_FONTS... yes
> >     | checking for INKSCAPE... configure: error: Package requirements (=
gdkmm-2.4  glibmm-2.4 giomm-2.4 gtkmm-2.4 >=3D 2.10.0  gtk+-2.0  libxml-2.0=
 >=3D 2.6.11  libxslt >=3D 1.0.15  cairo  sigc++-2.0 >=3D 2.0.12    gthread=
-2.0 >=3D 2.0 libpng >=3D 1.2 gsl) were not met:
> >     |
> >     | No package 'gsl' found
> >     |
> >     | Consider adjusting the PKG_CONFIG_PATH environment variable if yo=
u
> >     | installed software in a non-standard prefix.
> >     |
> >     | Alternatively, you may set the environment variables INKSCAPE_CFL=
AGS
> >     | and INKSCAPE_LIBS to avoid the need to call pkg-config.
> >     | See the pkg-config man page for more details.
> >     |
> >     | ERROR: Function do_configure failed
> >     NOTE: package inkscape-0.48.0-r0: task do_configure: Failed
> >     ERROR: TaskFailed event exception, aborting
> >     ERROR: Build of /home/paul/oe/openembedded/recipes/inkscape/inkscap=
e_0.48.0.bb do_configure failed
> >=20
> > Removing `do_stage` fixes building `inkscape_0.48.0.bb` with `angstrom-=
2008.1`, `angstrom-2010.x` and `minimal` for `MACHINE =3D "beagleboard"`.
> >=20
> > [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dc2c=
8fe4c5629add94bd0b922f5b3446624a9f4d8
> >=20
> > Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> > ---
> > Please note, that I did not test the removal of this function any furth=
er, that means I did not compare the package contents before and after, and=
 do not know about the implications. If someone more knowledgeable could ch=
eck that, it would be very much appreciated.
>=20
> if you checked what it installed into temp staging install then it should
> be ok.

This is the output of `diff -ur` between both directories. (I left out
the `temp` directory with the log files.) This was build using
`angstrom-2010.x` for `MACHINE =3D "beagleboard"`.

        Only in angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.12-r0=
//gsl-1.12: .install
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/.libs/libgsl.a and /tmp/gsl-1.12-r1//gsl-1.12/.libs/libgsl.=
a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/blas/.libs/libgslblas.a and /tmp/gsl-1.12-r1//gsl-1.12/blas=
/.libs/libgslblas.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/block/.libs/libgslblock.a and /tmp/gsl-1.12-r1//gsl-1.12/bl=
ock/.libs/libgslblock.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/bspline/.libs/libgslbspline.a and /tmp/gsl-1.12-r1//gsl-1.1=
2/bspline/.libs/libgslbspline.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/cblas/.libs/libgslcblas.a and /tmp/gsl-1.12-r1//gsl-1.12/cb=
las/.libs/libgslcblas.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/cdf/.libs/libgslcdf.a and /tmp/gsl-1.12-r1//gsl-1.12/cdf/.l=
ibs/libgslcdf.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/cheb/.libs/libgslcheb.a and /tmp/gsl-1.12-r1//gsl-1.12/cheb=
/.libs/libgslcheb.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/combination/.libs/libgslcombination.a and /tmp/gsl-1.12-r1/=
/gsl-1.12/combination/.libs/libgslcombination.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/complex/.libs/libgslcomplex.a and /tmp/gsl-1.12-r1//gsl-1.1=
2/complex/.libs/libgslcomplex.a differ
        diff -ru angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.12-r=
0//gsl-1.12/config.log /tmp/gsl-1.12-r1//gsl-1.12/config.log
        --- angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.12-r0//gs=
l-1.12/config.log	2010-11-22 11:27:21.270496425 +0100
        +++ /tmp/gsl-1.12-r1//gsl-1.12/config.log	2010-11-22 10:19:04.31763=
6601 +0100
        @@ -1098,7 +1098,7 @@
         configure:11408: result: yes
         configure:11414: checking for _doprnt
         configure:11414: arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -=
mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-=
thumb -o conftest -isystem/oe/build-angstrom-next/angstrom-dev/sysroots/arm=
v7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-fra=
me-pointer -frename-registers -O2 -ggdb2 -isystem/oe/build-angstrom-next/an=
gstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -Wl,-O1 -Wl,-=
-hash-style=3Dgnu conftest.c  >&5
        -/tmp/ccY718Kl.o: In function `main':
        +/tmp/ccgGFYmB.o: In function `main':
         /oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gn=
ueabi/gsl-1.12-r0/gsl-1.12/conftest.c:60: undefined reference to `_doprnt'
         collect2: ld returned 1 exit status
         configure:11414: $? =3D 1
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/deriv/.libs/libgslderiv.a and /tmp/gsl-1.12-r1//gsl-1.12/de=
riv/.libs/libgslderiv.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/dht/.libs/libgsldht.a and /tmp/gsl-1.12-r1//gsl-1.12/dht/.l=
ibs/libgsldht.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/diff/.libs/libgsldiff.a and /tmp/gsl-1.12-r1//gsl-1.12/diff=
/.libs/libgsldiff.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/eigen/.libs/libgsleigen.a and /tmp/gsl-1.12-r1//gsl-1.12/ei=
gen/.libs/libgsleigen.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/err/.libs/libgslerr.a and /tmp/gsl-1.12-r1//gsl-1.12/err/.l=
ibs/libgslerr.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/fft/.libs/libgslfft.a and /tmp/gsl-1.12-r1//gsl-1.12/fft/.l=
ibs/libgslfft.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/fit/.libs/libgslfit.a and /tmp/gsl-1.12-r1//gsl-1.12/fit/.l=
ibs/libgslfit.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/histogram/.libs/libgslhistogram.a and /tmp/gsl-1.12-r1//gsl=
-1.12/histogram/.libs/libgslhistogram.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/ieee-utils/.libs/libgslieeeutils.a and /tmp/gsl-1.12-r1//gs=
l-1.12/ieee-utils/.libs/libgslieeeutils.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/integration/.libs/libgslintegration.a and /tmp/gsl-1.12-r1/=
/gsl-1.12/integration/.libs/libgslintegration.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/interpolation/.libs/libgslinterpolation.a and /tmp/gsl-1.12=
-r1//gsl-1.12/interpolation/.libs/libgslinterpolation.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/linalg/.libs/libgsllinalg.a and /tmp/gsl-1.12-r1//gsl-1.12/=
linalg/.libs/libgsllinalg.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/matrix/.libs/libgslmatrix.a and /tmp/gsl-1.12-r1//gsl-1.12/=
matrix/.libs/libgslmatrix.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/min/.libs/libgslmin.a and /tmp/gsl-1.12-r1//gsl-1.12/min/.l=
ibs/libgslmin.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/monte/.libs/libgslmonte.a and /tmp/gsl-1.12-r1//gsl-1.12/mo=
nte/.libs/libgslmonte.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/multifit/.libs/libgslmultifit.a and /tmp/gsl-1.12-r1//gsl-1=
.12/multifit/.libs/libgslmultifit.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/multimin/.libs/libgslmultimin.a and /tmp/gsl-1.12-r1//gsl-1=
.12/multimin/.libs/libgslmultimin.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/multiroots/.libs/libgslmultiroots.a and /tmp/gsl-1.12-r1//g=
sl-1.12/multiroots/.libs/libgslmultiroots.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/ntuple/.libs/libgslntuple.a and /tmp/gsl-1.12-r1//gsl-1.12/=
ntuple/.libs/libgslntuple.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/ode-initval/.libs/libgslodeiv.a and /tmp/gsl-1.12-r1//gsl-1=
.12/ode-initval/.libs/libgslodeiv.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/permutation/.libs/libgslpermutation.a and /tmp/gsl-1.12-r1/=
/gsl-1.12/permutation/.libs/libgslpermutation.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/poly/.libs/libgslpoly.a and /tmp/gsl-1.12-r1//gsl-1.12/poly=
/.libs/libgslpoly.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/qrng/.libs/libgslqrng.a and /tmp/gsl-1.12-r1//gsl-1.12/qrng=
/.libs/libgslqrng.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/randist/.libs/libgslrandist.a and /tmp/gsl-1.12-r1//gsl-1.1=
2/randist/.libs/libgslrandist.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/rng/.libs/libgslrng.a and /tmp/gsl-1.12-r1//gsl-1.12/rng/.l=
ibs/libgslrng.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/roots/.libs/libgslroots.a and /tmp/gsl-1.12-r1//gsl-1.12/ro=
ots/.libs/libgslroots.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/siman/.libs/libgslsiman.a and /tmp/gsl-1.12-r1//gsl-1.12/si=
man/.libs/libgslsiman.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/sort/.libs/libgslsort.a and /tmp/gsl-1.12-r1//gsl-1.12/sort=
/.libs/libgslsort.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/specfunc/.libs/libgslspecfunc.a and /tmp/gsl-1.12-r1//gsl-1=
.12/specfunc/.libs/libgslspecfunc.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/statistics/.libs/libgslstatistics.a and /tmp/gsl-1.12-r1//g=
sl-1.12/statistics/.libs/libgslstatistics.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/sum/.libs/libgslsum.a and /tmp/gsl-1.12-r1//gsl-1.12/sum/.l=
ibs/libgslsum.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/sys/.libs/libgslsys.a and /tmp/gsl-1.12-r1//gsl-1.12/sys/.l=
ibs/libgslsys.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/test/.libs/libgsltest.a and /tmp/gsl-1.12-r1//gsl-1.12/test=
/.libs/libgsltest.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/utils/.libs/libutils.a and /tmp/gsl-1.12-r1//gsl-1.12/utils=
/.libs/libutils.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/vector/.libs/libgslvector.a and /tmp/gsl-1.12-r1//gsl-1.12/=
vector/.libs/libgslvector.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//gsl-1.12/wavelet/.libs/libgslwavelet.a and /tmp/gsl-1.12-r1//gsl-1.1=
2/wavelet/.libs/libgslwavelet.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//image/usr/lib/libgsl.a and /tmp/gsl-1.12-r1//image/usr/lib/libgsl.a =
differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//image/usr/lib/libgslcblas.a and /tmp/gsl-1.12-r1//image/usr/lib/libg=
slcblas.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//package/usr/lib/libgsl.a and /tmp/gsl-1.12-r1//package/usr/lib/libgs=
l.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//package/usr/lib/libgslcblas.a and /tmp/gsl-1.12-r1//package/usr/lib/=
libgslcblas.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//packages-split/gsl-static/usr/lib/libgsl.a and /tmp/gsl-1.12-r1//pac=
kages-split/gsl-static/usr/lib/libgsl.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//packages-split/gsl-static/usr/lib/libgslcblas.a and /tmp/gsl-1.12-r1=
//packages-split/gsl-static/usr/lib/libgslcblas.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//staging-pkg/deploy/eglibc/ipk/armv7a/gsl-dbg_1.12-r0.9_armv7a.ipk an=
d /tmp/gsl-1.12-r1//staging-pkg/deploy/eglibc/ipk/armv7a/gsl-dbg_1.12-r0.9_=
armv7a.ipk differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//staging-pkg/deploy/eglibc/ipk/armv7a/gsl-dev_1.12-r0.9_armv7a.ipk an=
d /tmp/gsl-1.12-r1//staging-pkg/deploy/eglibc/ipk/armv7a/gsl-dev_1.12-r0.9_=
armv7a.ipk differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//staging-pkg/deploy/eglibc/ipk/armv7a/gsl-doc_1.12-r0.9_armv7a.ipk an=
d /tmp/gsl-1.12-r1//staging-pkg/deploy/eglibc/ipk/armv7a/gsl-doc_1.12-r0.9_=
armv7a.ipk differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//staging-pkg/deploy/eglibc/ipk/armv7a/gsl-static_1.12-r0.9_armv7a.ipk=
 and /tmp/gsl-1.12-r1//staging-pkg/deploy/eglibc/ipk/armv7a/gsl-static_1.12=
-r0.9_armv7a.ipk differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//staging-pkg/deploy/eglibc/ipk/armv7a/gsl_1.12-r0.9_armv7a.ipk and /t=
mp/gsl-1.12-r1//staging-pkg/deploy/eglibc/ipk/armv7a/gsl_1.12-r0.9_armv7a.i=
pk differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//staging-pkg/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgsl.a =
and /tmp/gsl-1.12-r1//staging-pkg/sysroots/armv7a-angstrom-linux-gnueabi/us=
r/lib/libgsl.a differ
        Binary files angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gsl-1.=
12-r0//staging-pkg/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgslcbl=
as.a and /tmp/gsl-1.12-r1//staging-pkg/sysroots/armv7a-angstrom-linux-gnuea=
bi/usr/lib/libgslcblas.a differ

Andreas approved this patch already but I am posting this here for
completeness.


Thanks,

Paul


> > ---
> >  recipes/gsl/gsl.inc |   11 +----------
> >  1 files changed, 1 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/recipes/gsl/gsl.inc b/recipes/gsl/gsl.inc
> > index bc4865c..10bacc5 100644
> > --- a/recipes/gsl/gsl.inc
> > +++ b/recipes/gsl/gsl.inc
> > @@ -3,17 +3,8 @@ HOMEPAGE =3D "http://www.gnu.org/software/gsl/"
> >  SECTION =3D "libs"
> >  PRIORITY =3D "optional"
> >  LICENSE =3D "GPL"
> > -PR =3D "r0"
> > +PR =3D "r1"
> > =20
> >  inherit autotools pkgconfig binconfig
> > =20
> >  LEAD_SONAME =3D "libgsl.so"
> > -
> > -do_stage() {
> > -	oe_runmake DESTDIR=3D${S}/.install install
> > -	oe_libinstall -so -C cblas/.libs/ libgslcblas ${STAGING_LIBDIR}
> > -	oe_libinstall -so -C .libs/ libgsl ${STAGING_LIBDIR}
> > -
> > -	install -d ${STAGING_INCDIR}/gsl
> > -	install -m 0644 .install${includedir}/gsl/* ${STAGING_INCDIR}/gsl
> > -}
> > --=20
> > 1.7.2.3

--=-0qfRyEZHOpS1tYPMEOu/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzqSxMACgkQPX1aK2wOHVitHQCePkOEsL7rPTiIbsn+0ZHhOKU7
+XUAn1ka2sE14y3fOIRFSVhHiWQ50/47
=MFMw
-----END PGP SIGNATURE-----

--=-0qfRyEZHOpS1tYPMEOu/--
