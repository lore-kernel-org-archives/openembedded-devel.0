Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PZ3Ik-0008FV-OB for openembedded-devel@lists.openembedded.org;
	Sat, 01 Jan 2011 16:23:26 +0100
Received: from f053036243.adsl.alicedsl.de ([78.53.36.243]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PZ3IT-0000mu-G6 for openembedded-devel@lists.openembedded.org;
	Sat, 01 Jan 2011 15:23:09 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 01 Jan 2011 16:23:07 +0100
Message-ID: <1293895387.4179.30.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: python-numpy_1.4.1: task `compile` fails with `numpy/core/include/numpy/ufuncobject.h:309:18: fatal error: fenv.h: No such file or directory`
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
X-List-Received-Date: Sat, 01 Jan 2011 15:23:26 -0000
X-Groupsio-MsgNum: 27627
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-K9XOTB/G13MTBzRPwPTr"

--=-K9XOTB/G13MTBzRPwPTr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


task `compile` fails with `minimal-uclibc` for `MACHINE =3D "beagleboard"`
and `binutils_2.21.bb` with the following error.

        | compile options: '-Ibuild/src.linux-i686-2.6/numpy/core/src/umath=
 -Inumpy/core/include -Ibuild/src.linux-i686-2.6/numpy/core/include/numpy -=
Inumpy/core/src/private -Inumpy/core/src -Inumpy/core -Inumpy/core/src/npym=
ath -Inumpy/core/src/multiarray -Inumpy/core/src/umath -Inumpy/core/include=
 -I/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/arm-oe-linux-uclibc=
eabi/usr/include/python2.6 -I/oe/build-minimal-uclibc/minimal-uclibc-dev/sy=
sroots/armv7a-oe-linux-uclibceabi/usr/include/python2.6 -Ibuild/src.linux-i=
686-2.6/numpy/core/src/multiarray -Ibuild/src.linux-i686-2.6/numpy/core/src=
/umath -c'
        | arm-oe-linux-uclibceabi-gcc: numpy/core/src/umath/umathmodule_one=
file.c
        | In file included from numpy/core/src/private/npy_config.h:4:0,
        |                  from numpy/core/src/umath/loops.c.src:7,
        |                  from numpy/core/src/umath/umathmodule_onefile.c:=
1:
        | build/src.linux-i686-2.6/numpy/core/include/numpy/config.h:7:0: w=
arning: "SIZEOF_LONG_DOUBLE" redefined
        | /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-li=
nux-uclibceabi/usr/include/python2.6/pyconfig.h:898:0: note: this is the lo=
cation of the previous definition
        | build/src.linux-i686-2.6/numpy/core/include/numpy/config.h:14:0: =
warning: "HAVE_LOG1P" redefined
        | /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-li=
nux-uclibceabi/usr/include/python2.6/pyconfig.h:386:0: note: this is the lo=
cation of the previous definition
        | build/src.linux-i686-2.6/numpy/core/include/numpy/config.h:15:0: =
warning: "HAVE_EXPM1" redefined
        | /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-li=
nux-uclibceabi/usr/include/python2.6/pyconfig.h:173:0: note: this is the lo=
cation of the previous definition
        | In file included from numpy/core/src/umath/loops.c.src:14:0,
        |                  from numpy/core/src/umath/umathmodule_onefile.c:=
1:
        | numpy/core/include/numpy/ufuncobject.h:309:18: fatal error: fenv.=
h: No such file or directory
        | compilation terminated.
        | In file included from numpy/core/src/private/npy_config.h:4:0,
        |                  from numpy/core/src/umath/loops.c.src:7,
        |                  from numpy/core/src/umath/umathmodule_onefile.c:=
1:
        | build/src.linux-i686-2.6/numpy/core/include/numpy/config.h:7:0: w=
arning: "SIZEOF_LONG_DOUBLE" redefined
        | /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-li=
nux-uclibceabi/usr/include/python2.6/pyconfig.h:898:0: note: this is the lo=
cation of the previous definition
        | build/src.linux-i686-2.6/numpy/core/include/numpy/config.h:14:0: =
warning: "HAVE_LOG1P" redefined
        | /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-li=
nux-uclibceabi/usr/include/python2.6/pyconfig.h:386:0: note: this is the lo=
cation of the previous definition
        | build/src.linux-i686-2.6/numpy/core/include/numpy/config.h:15:0: =
warning: "HAVE_EXPM1" redefined
        | /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-li=
nux-uclibceabi/usr/include/python2.6/pyconfig.h:173:0: note: this is the lo=
cation of the previous definition
        | In file included from numpy/core/src/umath/loops.c.src:14:0,
        |                  from numpy/core/src/umath/umathmodule_onefile.c:=
1:
        | numpy/core/include/numpy/ufuncobject.h:309:18: fatal error: fenv.=
h: No such file or directory
        | compilation terminated.
        | error: Command "arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtu=
ne=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thu=
mb -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -isystem/oe/build-minimal-ucli=
bc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/include -fexp=
ensive-optimizations -fomit-frame-pointer -frename-registers -Os -isystem/o=
e/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibcea=
bi/usr/include -fPIC -Ibuild/src.linux-i686-2.6/numpy/core/src/umath -Inump=
y/core/include -Ibuild/src.linux-i686-2.6/numpy/core/include/numpy -Inumpy/=
core/src/private -Inumpy/core/src -Inumpy/core -Inumpy/core/src/npymath -In=
umpy/core/src/multiarray -Inumpy/core/src/umath -Inumpy/core/include -I/oe/=
build-minimal-uclibc/minimal-uclibc-dev/sysroots/arm-oe-linux-uclibceabi/us=
r/include/python2.6 -I/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/=
armv7a-oe-linux-uclibceabi/usr/include/python2.6 -Ibuild/src.linux-i686-2.6=
/numpy/core/src/multiarray -Ibuild/src.linux-i686-2.6/numpy/core/src/umath =
-c numpy/core/src/umath/umathmodule_onefile.c -o build/temp.linux-i686-2.6/=
numpy/core/src/umath/umathmodule_onefile.o" failed with exit status 1
        | FATAL: python setup.py build_ext execution failed.
        | ERROR: Function do_compile failed
        NOTE: package python-numpy-1.4.1-ml0: task do_compile: Failed
        ERROR: TaskFailed event exception, aborting
        ERROR: Build of /oe/openembedded/recipes/python/python-numpy_1.4.1.=
bb do_compile failed
        ERROR: Task 500 (/oe/openembedded/recipes/python/python-numpy_1.4.1=
.bb, do_compile) failed with 256
        ERROR: '/oe/openembedded/recipes/python/python-numpy_1.4.1.bb' fail=
ed
        ERROR: '/oe/openembedded/recipes/python/python-numpy_1.4.1.bb' fail=
ed
        ERROR: '/oe/openembedded/recipes/python/python-numpy_1.4.1.bb' fail=
ed

`fenv.h` is available though.

        /oe/build-minimal-uclibc$ find minimal-uclibc-dev/ -name fenv.h
        minimal-uclibc-dev/sysroots/i686-linux/usr/armv7a/arm-oe-linux-ucli=
bceabi/include/c++/4.5.3/fenv.h
        minimal-uclibc-dev/sysroots/i686-linux/usr/armv7a/arm-oe-linux-ucli=
bceabi/include/c++/4.5.3/tr1/fenv.h
        minimal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/python-numpy-1.4=
.1-ml0/numpy-1.4.1/numpy/core/include/numpy/fenv/fenv.h


Thanks,

Paul

--=-K9XOTB/G13MTBzRPwPTr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0fRtsACgkQPX1aK2wOHVgekQCfXoNWbJbcQR/3uelBryM1DQxq
NnMAn2qbGdALGG0AzllUiiu3lNCJz0z1
=G7Ng
-----END PGP SIGNATURE-----

--=-K9XOTB/G13MTBzRPwPTr--
