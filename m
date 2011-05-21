Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QNoac-0006Gh-TM for openembedded-devel@lists.openembedded.org;
	Sat, 21 May 2011 17:59:42 +0200
Received: from f053038077.adsl.alicedsl.de ([78.53.38.77]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QNoXx-0004jS-8W for openembedded-devel@lists.openembedded.org;
	Sat, 21 May 2011 15:56:57 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DD7C53C.1090906@eukrea.com>
References: <1305060012.9982.33.camel@mattotaupa>
	<1305061022.9982.44.camel@mattotaupa> <4DCE2BF8.50403@eukrea.com>
	<1305472473.5838.546.camel@mattotaupa>
	<1305986011.12054.21.camel@mattotaupa>  <4DD7C53C.1090906@eukrea.com>
Date: Sat, 21 May 2011 17:56:45 +0200
Message-ID: <1305993405.12054.25.camel@mattotaupa>
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
X-List-Received-Date: Sat, 21 May 2011 15:59:43 -0000
X-Groupsio-MsgNum: 32231
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-OK/glJcBJyRtQkbDKo3P"

--=-OK/glJcBJyRtQkbDKo3P
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Eric,


Am Samstag, den 21.05.2011, 15:59 +0200 schrieb Eric B=C3=A9nard:

> On 21/05/2011 15:53, Paul Menzel wrote:

> > Am Sonntag, den 15.05.2011, 17:14 +0200 schrieb Paul Menzel:
> >
> >> Am Samstag, den 14.05.2011, 09:15 +0200 schrieb Eric B=C3=A9nard:
> >>
> >>> On 10/05/2011 22:57, Paul Menzel wrote:
> >>>> Dear Simon and other OpenEmbedded folks,
> >>>>
> >>>>
> >>>> I am sorry for the wrong subject line. I am fixing it hereby.
> >>>>
> >>>>
> >>>> Am Dienstag, den 10.05.2011, 22:40 +0200 schrieb Paul Menzel:
> >>>>
> >>>>> task configure of `qt4-native` fails on my build system which is a =
Xen
> >>>>> DomU running a 64-bit Linux kernel but 32-bit user space.
> >>>>>
> >>>>>           $ uname -a
> >>>>>           Linux oe-build-host 2.6.32-5-xen-amd64 #1 SMP Tue Mar 8 0=
0:01:30 UTC 2011 x86_64 GNU/Linux
> >>>>>           $ dpkg --print-architecture
> >>>>>           i386
> >>>>>
> >>>>> This seems to be a problem in the Qt4 build system which seems to b=
e
> >>>>> using `uname` to determine the architecture.
> >>>>>
> >>>>>           $ more log.do_configure
> >>>>>           + do_configure
> >>>>>           + echo o
> >>>>>           + echo yes
> >>>>>           + ./configure -prefix /oe/build-angstrom-next/angstrom-de=
v/sysroots/i686-linux/usr -L /oe/build-angstrom-next/angstrom-dev/sysroots/=
i686-linux/usr/lib -I /oe/build-angstrom-next/angstrom-dev/sysroots/i686-li=
nux/usr/include -qt-libjpeg -qt-gif -system-zlib -no-libjpeg -no-libpng -no=
-libmng -no-libtiff -no-accessibility -no-cups -no-nas-sound -no-nis -no-op=
enssl -verbose -release -embedded -no-freetype -no-glib -no-iconv -exceptio=
ns -xmlpatterns -qt3support -no-fast -silent -no-rpath
> >>>>>           Which edition of Qt do you want to use ?
> >>>>>
> >>>>>           Type 'c' if you want to use the Commercial Edition.
> >>>>>           Type 'o' if you want to use the Open Source Edition.
> >>>>>
> >>>>>
> >>>>>           Determining system architecture... (Linux:2.6.32-5-xen-am=
d64:x86_64)
> >>>>>               64-bit AMD 80x86 (x86_64)
> >>>>>               'x86_64' is supported
> >>>>>           System architecture: 'x86_64'
> >>>>>           Host architecture: 'x86_64'
> >>>
> >>> this could maybe be fixed by passing -host-arch=3Di386 to configure b=
ut the
> >>> problem is to detect you are running a 32bit userland when uname repo=
rts 64 bits.
> >>> bitbake.conf seems also to use uname :
> >>> BUILD_ARCH :=3D "${@os.uname()[4]}"
> >>
> >> Unfortunately I have not come around a solution to detect this properl=
y.
> >> I had the same problem with TeX Live [1] and the solution was to add o=
n
> >> option to override this setting [2].
> >>
> >>> maybe something like file `which init` and analysing the output ?
> >>
> >> Unfortunately `which init` does not return anything on my Debian
> >> Sid/unstable system.
> >>
> >>          $ which init
> >>          $ echo $?
> >>          1
> >
> > searching the WWW for =C2=BBuname system host architecture 32 64=C2=AB =
I found the
> > following suggestion [3][4].
>
> From my understanding, lshw only tells you if the CPU has 64bits support =
or=20
> not (like cat /proc/cpuinfo). So I can't how that could help here.

`lshw` is not even installed on my system. ;-) I meant

	getconf LONG_BIT

and testing this on a 64-bit user space/64-bit Linux kernel system
returned 64 and on a 32-bit user space/64-bit Linux Kernel system it
returned 32.

I guess another possibility would be to check if `stubs.h` or
`stubs-64.h` is present.


Thanks,

Paul

--=-OK/glJcBJyRtQkbDKo3P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3X4L0ACgkQPX1aK2wOHVgj3ACeL5vwoXxrLJjEL7snSi/PAILV
i1MAmgJIKVpwtMPw3lb1L6H61kh+Z9Xq
=jJNl
-----END PGP SIGNATURE-----

--=-OK/glJcBJyRtQkbDKo3P--
