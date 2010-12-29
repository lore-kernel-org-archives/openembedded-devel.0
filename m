Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PY038-0001Rw-NM for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 18:42:58 +0100
Received: from f053032040.adsl.alicedsl.de ([78.53.32.40]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PY02u-0007IE-Nx for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 17:42:44 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1293579520.2173.29.camel@saphir>
References: <1293575359.19557.0.camel@mattotaupa>
	<1293579520.2173.29.camel@saphir>
Date: Wed, 29 Dec 2010 18:42:43 +0100
Message-ID: <1293644563.4238.7.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: glib-2.0_2.26.1: task `compile` fails with `gdbus-serialization.c:28:23: fatal error: dbus/dbus.h: No such file or directory` (was: [PATCH] glib-2.0_2.26.1: remove `DEFAULT_PREFERENCE = "-1"`)
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
X-List-Received-Date: Wed, 29 Dec 2010 17:42:58 -0000
X-Groupsio-MsgNum: 27558
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ovgwHtx8+fQazNo2QYrM"

--=-ovgwHtx8+fQazNo2QYrM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 29.12.2010, 00:38 +0100 schrieb Michael 'Mickey' Lauer:
> Would be fine with me, we have been using 2.26.1 here on armv7 for a
> while without any problems.

Well actually Minimal and Minimal uClibc fail in task `compile` when
building `glib-2.0_2.26.1.bb` with `gdbus-serialization.c:28:23: fatal
error: dbus/dbus.h: No such file or directory
compilation terminated.`

        /bin/sh ../../arm-oe-linux-gnueabi-libtool  --tag=3DCC   --mode=3Dc=
ompile arm-oe-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -DHAVE_CONFIG_H -=
I. -I../.. -DG_LOG_DOMAIN=3D\"GLib-GRegex\" -DSUPPORT_UCP -DSUPPORT_UTF8 -D=
NEWLINE=3D-1 -DMATCH_LIMIT=3D10000000 -DMATCH_LIMIT_RECURSION=3D8192 -DMAX_=
NAME_SIZE=3D32 -DMAX_NAME_COUNT=3D10000 -DMAX_DUPLENGTH=3D30000 -DLINK_SIZE=
=3D2 -DPOSIX_MALLOC_THRESHOLD=3D10 -DPCRE_STATIC -I../.. -I../../glib -I../=
../glib -I../.. -DG_DISABLE_CAST_CHECKS -DG_DISABLE_ASSERT -DG_DISABLE_CHEC=
KS -DG_DISABLE_DEPRECATED -DGLIB_COMPILATION   -Wno-pointer-sign   -isystem=
/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/i=
nclude -DG_DISABLE_SINGLE_INCLUDES -pthread  -isystem/oe/build-minimal-egli=
bc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/include -fexpensive-opt=
imizations -fomit-frame-pointer -frename-registers -Os -Wall -MT pcre_fulli=
nfo.lo -MD -MP -MF .deps/pcre_fullinfo.Tpo -c -o pcre_fullinfo.lo pcre_full=
info.c
        arm-oe-linux-gnueabi-libtool: compile:  arm-oe-linux-gnueabi-gcc -m=
arch=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb=
-interwork -mno-thumb -DHAVE_CONFIG_H -I. -I../.. -DG_LOG_DOMAIN=3D\"GLib-G=
Regex\" -DSUPPORT_UCP -DSUPPORT_UTF8 -DNEWLINE=3D-1 -DMATCH_LIMIT=3D1000000=
0 -DMATCH_LIMIT_RECURSION=3D8192 -DMAX_NAME_SIZE=3D32 -DMAX_NAME_COUNT=3D10=
000 -DMAX_DUPLENGTH=3D30000 -DLINK_SIZE=3D2 -DPOSIX_MALLO...skipping...
        .Tpo -c -o resolver.o resolver.c
        mv -f .deps/live-g-file.Tpo .deps/live-g-file.Po
        gdbus-serialization.c:28:23: fatal error: dbus/dbus.h: No such file=
 or directory
        compilation terminated.
        make[4]: *** [gdbus_serialization-gdbus-serialization.o] Error 1
        make[4]: *** Waiting for unfinished jobs....
        mv -f .deps/gdbus_serialization-gdbus-tests.Tpo .deps/gdbus_seriali=
zation-gdbus-tests.Po
        mv -f .deps/resolver.Tpo .deps/resolver.Po
        make[4]: Leaving directory `/oe/build-minimal-eglibc/minimal-dev/wo=
rk/armv7a-oe-linux-gnueabi/glib-2.0-2.26.1-r0/glib-2.26.1/gio/tests'
        make[3]: *** [all-recursive] Error 1
        make[3]: Leaving directory `/oe/build-minimal-eglibc/minimal-dev/wo=
rk/armv7a-oe-linux-gnueabi/glib-2.0-2.26.1-r0/glib-2.26.1/gio'
        make[2]: *** [all] Error 2
        make[2]: Leaving directory `/oe/build-minimal-eglibc/minimal-dev/wo=
rk/armv7a-oe-linux-gnueabi/glib-2.0-2.26.1-r0/glib-2.26.1/gio'
        make[1]: *** [all-recursive] Error 1
        make[1]: Leaving directory `/oe/build-minimal-eglibc/minimal-dev/wo=
rk/armv7a-oe-linux-gnueabi/glib-2.0-2.26.1-r0/glib-2.26.1'
        make: *** [all] Error 2
        FATAL: oe_runmake failed
        ERROR: Function do_compile failed

`dbus.h` is staged though and available as far as I can see.

So `bitbake console-image` fails nevertheless with Minimal{-uClibc}. So
the question is if the freesmartphone should fail or GLib 2.26.1.

The strange thing is, that `bitbake dbus` works and also `bitbake
glib-2.0` afterward although `dbus` depends on `glib-2.0`.

Any ideas?


Thanks,

Paul

--=-ovgwHtx8+fQazNo2QYrM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0bcw0ACgkQPX1aK2wOHViK7gCfTnwpIffCRd0weN4LHcO+Uvki
aSYAniXS3T2aRUV4SB7UoRbO2FlkpVIH
=a4nu
-----END PGP SIGNATURE-----

--=-ovgwHtx8+fQazNo2QYrM--
