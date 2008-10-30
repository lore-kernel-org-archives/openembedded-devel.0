Received: from [76.96.30.17] (helo=QMTA10.emeryville.ca.mail.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tmtalpey@rcn.com>) id 1Kvag4-00019S-HV
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Oct 2008 17:47:21 +0100
Received: from OMTA11.emeryville.ca.mail.comcast.net ([76.96.30.36])
	by QMTA10.emeryville.ca.mail.comcast.net with comcast
	id YyF01a0020mlR8UAA4mFsu; Thu, 30 Oct 2008 16:46:15 +0000
Received: from tmt.rcn.com ([98.229.118.72])
	by OMTA11.emeryville.ca.mail.comcast.net with comcast
	id Z4mD1a0051ZoUlN8X4mEzn; Thu, 30 Oct 2008 16:46:15 +0000
X-Authority-Analysis: v=1.0 c=1 a=DJk50H63dC_OMaPMB0AA:9
	a=mso7PQLGC34dHUxECz4A:7 a=G1egdhCFjpGr-umQXzuommLjphkA:4
	a=h9s5Ru71U4oA:10
X-Mailer: QUALCOMM Windows Eudora Version 7.1.0.9
Date: Thu, 30 Oct 2008 12:45:58 -0400
To: openembedded-devel@lists.openembedded.org
From: Tom Talpey <tmtalpey@rcn.com>
In-Reply-To: <1225379284.3822.154.camel@mill.internal.reciva.com>
References: <1225294016.3822.81.camel@mill.internal.reciva.com>
	<E1KvYmj-0007s2-Og@linuxtogo.org>
	<1225379284.3822.154.camel@mill.internal.reciva.com>
Mime-Version: 1.0
Subject: Re: arm kernel configurations
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
X-List-Received-Date: Thu, 30 Oct 2008 16:47:21 -0000
Message-ID: <MADEUP.15FE1A15EFDA8F40.13558@groups.io>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

At 11:08 AM 10/30/2008, Phil Blundell wrote:
>On Thu, 2008-10-30 at 10:40 -0400, Tom Talpey wrote:
>> At 11:26 AM 10/29/2008, Phil Blundell wrote:
>> >- if your userspace is pure EABI, make sure that you have
>> >CONFIG_OABI_COMPAT turned off.
>>=20
>> My kernel(s) have all hung during exec of init when trying this.
>> Are you able to turn this off with non-thumb userspace?
>
>Yes, it doesn't require Thumb.  Are you sure that your userspace really
>is compiled for EABI and not OABI?

Yes:

>>[tmt@tmt bin]$ ./arm-angstrom-linux-gnueabi-gcc -v
>>Using built-in specs.
>>Target: arm-angstrom-linux-gnueabi
>>Configured with:=
 /home/tmt/armdev/H1940/oe/build-h1940-gpe/tmp/work/armv4t-angstrom-linux-gn=
ueabi/gcc-cross-4.2.4-r1/gcc-4.2.4/configure --build=3Di686-linux=
 --host=3Di686-linux --target=3Darm-angstrom-linux-gnueabi=
 --prefix=3D/home/tmt/armdev/H1940/oe/build-h1940-gpe/tmp/cross=
 --exec_prefix=3D/home/tmt/armdev/H1940/oe/build-h1940-gpe/tmp/cross=
 --bindir=3D/home/tmt/armdev/H1940/oe/build-h1940-gpe/tmp/cross/bin=
 --sbindir=3D/home/tmt/armdev/H1940/oe/build-h1940-gpe/tmp/cross/bin=
 --libexecdir=3D/home/tmt/armdev/H1940/oe/build-h1940-gpe/tmp/cross/libexec=
 --datadir=3D/home/tmt/armdev/H1940/oe/build-h1940-gpe/tmp/cross/share=
 --sysconfdir=3D/home/tmt/armdev/H1940/oe/build-h1940-gpe/tmp/cross/etc=
 --sharedstatedir=3D/home/tmt/armdev/H1940/oe/build-h1940-gpe/tmp/cross/com=
 --localstatedir=3D/home/tmt/armdev/H1940/oe/build-h1940-gpe/tmp/cross/var=
 --libdir=3D/home/tmt/armdev/H1940/oe/build-h1940-gpe/tmp/cross/lib=
 --includedir=3D/home/tmt/armdev/H1940/oe/build-h1940-gpe/tmp/cross/include=
 --oldincludedir=3D/home/tmt/armdev/H1940/oe/build-h1940-gpe/tmp/cross/inclu=
de --infodir=3D/home/tmt/armdev/H1940/oe/build-h1940-gpe/tmp/cross/share/inf=
o --mandir=3D/home/tmt/armdev/H1940/oe/build-h1940-gpe/tmp/cross/share/man=
 --with-gnu-ld --enable-shared --enable-target-optspace=
 --enable-languages=3Dc,c++,fortran --enable-threads=3Dposix=
 --enable-multilib --enable-c99 --enable-long-long --enable-symvers=3Dgnu=
 --enable-libstdcxx-pch --program-prefix=3Darm-angstrom-linux-gnueabi-=
 --enable-libssp --disable-bootstrap --disable-libgomp --disable-libmudflap=
 --with-float=3Dsoft=
 --with-local-prefix=3D/home/tmt/armdev/H1940/oe/build-h1940-gpe/tmp/staging=
/arm-angstrom-linux-gnueabi/usr=
 --with-gxx-include-dir=3D/home/tmt/armdev/H1940/oe/build-h1940-gpe/tmp/stag=
ing/arm-angstrom-linux-gnueabi//usr/include/c++=
 --with-sysroot=3D/home/tmt/armdev/H1940/oe/build-h1940-gpe/tmp/staging/arm-=
angstrom-linux-gnueabi=
 --with-build-sysroot=3D/home/tmt/armdev/H1940/oe/build-h1940-gpe/tmp/stagin=
g/arm-angstrom-linux-gnueabi --disable-libunwind-exceptions=
 --with-mpfr=3D/home/tmt/armdev/H1940/oe/build-h1940-gpe/tmp/staging/i686-li=
nux/usr --enable-__cxa_atexit
>>Thread model: posix
>>gcc version 4.2.4
>>[tmt@tmt bin]$=20

>> One side effect of turning off OABI_COMPAT is that the floating
>> point emulation also vanishes. I get the same behavior if I leave
>> OABI_COMPAT on and play with fp settings.
>
>That sounds rather like some part of your userspace has been built with
>hard-fpa floating point.  FPA is basically incompatible with EABI (and I
>think all extant EABI configs in OE are soft-float) so this would also
>indicate that you are actually using OABI.

As above - the specs do include "--with-float=3Dsoft". I guess I'll have to
dig some more. Do I also need -mfloat-abi=3Dsoftfp in the machine.conf like
some of the other arm's?

BTW, on the subject of turning off the kernel frame pointer, I certainly=
 agree
it's worth it. For one thing, the tiny screen never manages to show me=
 enough
of a backtrace on oops anyway.

But the Kconfig comment does warn that RMK will kill us! ;-)

Tom. =20



