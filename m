Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OZSbp-0002Zo-Nw for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 19:52:35 +0200
Received: from f053040153.adsl.alicedsl.de ([78.53.40.153]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OZSbn-0006ca-AA for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 17:52:31 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100714194822.GB9771@rhein.zuhause.netz>
References: <1279133054.4939.16.camel@mattotaupa>
	<20100714194822.GB9771@rhein.zuhause.netz>
Date: Thu, 15 Jul 2010 19:52:28 +0200
Message-ID: <1279216348.3741.24.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: uclibc-git: oe_runmake failed: error: '__a1' undeclared (first use in this function) (was: angstrom 2008.1, uclibc: libc.so not found, i. e. not in staging directory)
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
X-List-Received-Date: Thu, 15 Jul 2010 17:52:35 -0000
X-Groupsio-MsgNum: 21010
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-CbzspoElYV393gRY+SMg"

--=-CbzspoElYV393gRY+SMg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Henning,


Am Mittwoch, den 14.07.2010, 21:48 +0200 schrieb Henning Heinold:

> hm you want probably uclibc-git anyway because it has nptl-thread support=
.

thank you for the hint. Unfortunately it trying to use `uclibc-git.bb`
fails with the following error in `do_compile()`.

        arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mf=
pu=3Dneon -mfloat-abi=3Dsoftfp -c libm/float_wrappers.c -o libm/acoshf.o -i=
nclude ./include/libc-symbols.h -Wall -Wstrict-prototypes -fno-strict-alias=
ing -Wnested-externs -Wshadow -Wmissing-noreturn -Wmissing-format-attribute=
 -Wformat=3D2 -Wmissing-prototypes -Wmissing-declarations -Wold-style-decla=
ration -Wold-style-definition -Wnonnull -Wundef -funsigned-char -fno-builti=
n -fno-asm -std=3Dgnu99 -mlittle-endian -mtune=3Darm9tdmi -march=3Darmv4t -=
fno-stack-protector -nostdinc -I./include -I./include -I. -I./libc/sysdeps/=
linux -I./libc/sysdeps/linux/arm -fexpensive-optimizations -fomit-frame-poi=
nter -frename-registers -Os -Os -funit-at-a-time -fmerge-all-constants -fno=
-tree-loop-optimize -fno-tree-dominator-opts -fno-strength-reduce -fstrict-=
aliasing -DHAVE_FORCED_UNWIND -I./libpthread/nptl -I./libpthread/nptl -I./l=
ibpthread/nptl/sysdeps/unix/sysv/linux/arm/ -I./libpthread/nptl/sysdeps/uni=
x/sysv/linux/arm -I./libpthread/nptl/sysdeps/arm -I./libpthread/nptl/sysdep=
s/arm -I./libpthread/nptl/sysdeps/unix/sysv/linux -I./libpthread/nptl/sysde=
ps/unix/sysv/linux -I./libpthread/nptl/sysdeps/generic -I./libpthread/nptl/=
sysdeps/pthread -I./libpthread/nptl/sysdeps/pthread/bits -I./ldso/ldso/arm =
-I./ldso/include -I./libc/sysdeps/linux/common -I/tmp/minimal-uclibc-minima=
l-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/include/ -isystem /tmp/minima=
l-uclibc-minimal-dev/cross/armv7a/lib/gcc/arm-oe-linux-uclibceabi/4.4.4/inc=
lude-fixed -isystem /tmp/minimal-uclibc-minimal-dev/cross/armv7a/lib/gcc/ar=
m-oe-linux-uclibceabi/4.4.4/include -DNDEBUG -D__USE_STDIO_FUTEXES__ -DNOT_=
IN_libc -DIS_IN_libm -D_IEEE_LIBM -MT libm/acoshf.o -MD -MP -MF libm/.acosh=
f.o.dep -DL_acoshf
        In file included from libpthread/nptl/sysdeps/pthread/pt-sigprocmas=
k.c:22:
        ./libc/sysdeps/linux/arm/../../../../libc/sysdeps/linux/common/sigp=
rocmask.c: In function '__rt_sigprocmask':
        ./libc/sysdeps/linux/arm/../../../../libc/sysdeps/linux/common/sigp=
rocmask.c:24: error: '__a1' undeclared (first use in this function)
        ./libc/sysdeps/linux/arm/../../../../libc/sysdeps/linux/common/sigp=
rocmask.c:24: error: (Each undeclared identifier is reported only once
        ./libc/sysdeps/linux/arm/../../../../libc/sysdeps/linux/common/sigp=
rocmask.c:24: error: for each function it appears in.)
        make: *** [libpthread/nptl/sysdeps/pthread/pt-sigprocmask.oS] Error=
 1
        make: *** Waiting for unfinished jobs....
        FATAL: oe_runmake failed

I could reproduce this error with the distributions `angstrom-2008.1` and `=
minimal-uclibc`.

Is that a known problem?


Thanks,

Paul

--=-CbzspoElYV393gRY+SMg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkw/StwACgkQPX1aK2wOHViw8ACgg95BZSOxNGV5L+39UrEy44ek
PmYAoIJApLZ/Xs3+m/aVX40OdCmc7+zr
=kR8C
-----END PGP SIGNATURE-----

--=-CbzspoElYV393gRY+SMg--
