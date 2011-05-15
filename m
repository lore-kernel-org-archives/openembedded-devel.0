Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QLd4N-00053W-RK for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 17:17:23 +0200
Received: from f053043231.adsl.alicedsl.de ([78.53.43.231]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QLd35-0007ZD-Iu for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 15:16:03 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DCE2BF8.50403@eukrea.com>
References: <1305060012.9982.33.camel@mattotaupa>
	<1305061022.9982.44.camel@mattotaupa>  <4DCE2BF8.50403@eukrea.com>
Date: Sun, 15 May 2011 17:14:33 +0200
Message-ID: <1305472473.5838.546.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: qt4-native: `/usr/include/gnu/stubs.h:9:27: error: gnu/stubs-64.h: No such file or directory` because architecture incorrectly detected
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
X-List-Received-Date: Sun, 15 May 2011 15:17:23 -0000
X-Groupsio-MsgNum: 32055
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-HghVbhj4CvCAoNQmy3sw"

--=-HghVbhj4CvCAoNQmy3sw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Eric,


Am Samstag, den 14.05.2011, 09:15 +0200 schrieb Eric B=C3=A9nard:

> On 10/05/2011 22:57, Paul Menzel wrote:
> > Dear Simon and other OpenEmbedded folks,
> >
> >
> > I am sorry for the wrong subject line. I am fixing it hereby.
> >
> >
> > Am Dienstag, den 10.05.2011, 22:40 +0200 schrieb Paul Menzel:
> >
> >> task configure of `qt4-native` fails on my build system which is a Xen
> >> DomU running a 64-bit Linux kernel but 32-bit user space.
> >>
> >>          $ uname -a
> >>          Linux oe-build-host 2.6.32-5-xen-amd64 #1 SMP Tue Mar 8 00:01=
:30 UTC 2011 x86_64 GNU/Linux
> >>          $ dpkg --print-architecture
> >>          i386
> >>
> >> This seems to be a problem in the Qt4 build system which seems to be
> >> using `uname` to determine the architecture.
> >>
> >>          $ more log.do_configure
> >>          + do_configure
> >>          + echo o
> >>          + echo yes
> >>          + ./configure -prefix /oe/build-angstrom-next/angstrom-dev/sy=
sroots/i686-linux/usr -L /oe/build-angstrom-next/angstrom-dev/sysroots/i686=
-linux/usr/lib -I /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/=
usr/include -qt-libjpeg -qt-gif -system-zlib -no-libjpeg -no-libpng -no-lib=
mng -no-libtiff -no-accessibility -no-cups -no-nas-sound -no-nis -no-openss=
l -verbose -release -embedded -no-freetype -no-glib -no-iconv -exceptions -=
xmlpatterns -qt3support -no-fast -silent -no-rpath
> >>          Which edition of Qt do you want to use ?
> >>
> >>          Type 'c' if you want to use the Commercial Edition.
> >>          Type 'o' if you want to use the Open Source Edition.
> >>
> >>
> >>          Determining system architecture... (Linux:2.6.32-5-xen-amd64:=
x86_64)
> >>              64-bit AMD 80x86 (x86_64)
> >>              'x86_64' is supported
> >>          System architecture: 'x86_64'
> >>          Host architecture: 'x86_64'
>=20
> this could maybe be fixed by passing -host-arch=3Di386 to configure but t=
he=20
> problem is to detect you are running a 32bit userland when uname reports =
64 bits.
> bitbake.conf seems also to use uname :
> BUILD_ARCH :=3D "${@os.uname()[4]}"

Unfortunately I have not come around a solution to detect this properly.
I had the same problem with TeX Live [1] and the solution was to add on
option to override this setting [2].

> maybe something like file `which init` and analysing the output ?

Unfortunately `which init` does not return anything on my Debian
Sid/unstable system.

        $ which init
        $ echo $?
        1


Thank you for looking into this problem,

Paul


[1] http://tug.org/pipermail/tex-live/2009-June/021119.html
[2] http://tug.org/pipermail/tex-live/2009-June/021124.html

--=-HghVbhj4CvCAoNQmy3sw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3P7dkACgkQPX1aK2wOHVhKXwCff1dARNhT5QfOooF19tcitJ45
zy0AnAx5O8hvK0Yp2mXn/qq+p75wmucM
=e+Jy
-----END PGP SIGNATURE-----

--=-HghVbhj4CvCAoNQmy3sw--
