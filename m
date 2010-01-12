Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NUf4a-0004E6-Jb for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 12:38:11 +0100
Received: from g225082252.adsl.alicedsl.de ([92.225.82.252]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NUf2X-0004Tt-Fi for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 11:36:01 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1263249767.3308.236.camel@mattotaupa.wohnung.familie-menzel.net>
References: <1263109998.16109.11.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100110123923.GB6363@rhein.zuhause.netz>
	<1263156477.3423.6.camel@mattotaupa.wohnung.familie-menzel.net>
	<1263249767.3308.236.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Tue, 12 Jan 2010 12:36:00 +0100
Message-ID: <1263296160.20557.136.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [vdr] TARGET_CXXFLAGS do not include CXX_FLAGS from Makefile (was: vdr: questions regarding cplusplus.patch)
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
X-List-Received-Date: Tue, 12 Jan 2010 11:38:11 -0000
X-Groupsio-MsgNum: 15588
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-4bxXV73h3EIdhVitGnYb"

--=-4bxXV73h3EIdhVitGnYb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE hackers,


Am Montag, den 11.01.2010, 23:42 +0100 schrieb Paul Menzel:

[=E2=80=A6]

> Putting
>=20
>         PREFERRED_VERSION_binutils               =3D "2.20"
>         PREFERRED_VERSION_binutils-cross         =3D "2.20"
>         PREFERRED_VERSION_binutils-cross-sdk     =3D "2.20"
>        =20
>         PREFERRED_VERSION_gcc                    =3D "4.4.2"
>         PREFERRED_VERSION_gcc-cross              =3D "4.4.2"
>         PREFERRED_VERSION_gcc-cross-sdk          =3D "4.4.2"
>         PREFERRED_VERSION_gcc-cross-initial      =3D "4.4.2"
>         PREFERRED_VERSION_gcc-cross-intermediate =3D "4.4.2"
>=20
> in my `local.conf` and running `bitbake vdr` gave me an error in
> `do_compile` for `libcap_1.10.bb`.
>=20
>         arm-angstrom-linux-gnueabi-ld -soname libcap.so.1 -x -shared -o l=
ibcap.so.1.10 cap_alloc.o cap_proc.o cap_extint.o cap_flag.o cap_text.o cap=
_sys.o
>         arm-angstrom-linux-gnueabi-ld: cap_text.o: relocation R_ARM_MOVW_=
ABS_NC against `a local symbol' can not be used when making a shared object=
; recompile with -fPIC

I opened a new thread for this [2].

Anyways compiling the plugins for VDR in `do_install` [3]

        do_install () {
              oe_runmake 'DESTDIR=3D${D}' \
                         'PREFIX=3D${prefix}' \
                         'CONFDIR=3D${sysconfdir}/vdr' \
                         'VIDEODIR=3D/var/lib/vdr/video' \
                         'PLUGINLIBDIR=3D${PLUGINDIR}' \
                         'LOCDIR=3D${datadir}/locale' \
                         install
        }

I also get the same error which I did not get before with GCC 4.1.1.

        $ more log.do_install.28829
        NOTE: make -e MAKEFLAGS=3D DESTDIR=3D/oe/tangstrom-dev/work/armv7a-=
angstrom-linux-gnueabi/vdr-1.7.10-r3/image PREFIX=3D/usr CONFDIR=3D/etc/vdr=
 VIDEODIR=3D/var/lib/vdr/video PLUGINLIBDIR=3D/usr/lib/vdr/plugins LOCDIR=
=3D/usr/share/locale install
        Plugin hello:
        make[1]: Entering directory `/oe/tangstrom-dev/work/armv7a-angstrom=
-linux-gnueabi/vdr-1.7.10-r3/vdr-1.7.10/PLUGINS/src/hello'
        make[1]: Leaving directory `/oe/tangstrom-dev/work/armv7a-angstrom-=
linux-gnueabi/vdr-1.7.10-r3/vdr-1.7.10/PLUGINS/src/hello'
        make[1]: Entering directory `/oe/tangstrom-dev/work/armv7a-angstrom=
-linux-gnueabi/vdr-1.7.10-r3/vdr-1.7.10/PLUGINS/src/hello'
        arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 =
-mfpu=3Dneon -mfloat-abi=3Dsoftfp -isystem/oe/tangstrom-dev/staging/armv7a-=
angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-regis=
ters -fomit-frame-pointer -O2 -ggdb3 -fpermissive -fvisibility-inlines-hidd=
en -c -D_GNU_SOURCE -DPLUGIN_NAME_I18N=3D'"hello"' -I../../../include hello=
.c
        arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 =
-mfpu=3Dneon -mfloat-abi=3Dsoftfp -isystem/oe/tangstrom-dev/staging/armv7a-=
angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-regis=
ters -fomit-frame-pointer -O2 -ggdb3 -fpermissive -fvisibility-inlines-hidd=
en -shared hello.o -o libvdr-hello.so -L/oe/tangstrom-dev/staging/armv7a-an=
gstrom-linux-gnueabi/usr/lib -Wl,-rpath-link,/oe/tangstrom-dev/staging/armv=
7a-angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu
        /oe/tangstrom-dev/cross/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4=
.4.2/../../../../arm-angstrom-linux-gnueabi/bin/ld: hello.o: relocation R_A=
RM_MOVW_ABS_NC against `a local symbol' can not be used when making a share=
d object; recompile with -fPIC
        hello.o: could not read symbols: Bad value
        collect2: ld returned 1 exit status
        make[1]: *** [libvdr-hello.so] Error 1
        make[1]: Leaving directory `/oe/tangstrom-dev/work/armv7a-angstrom-=
linux-gnueabi/vdr-1.7.10-r3/vdr-1.7.10/PLUGINS/src/hello'
       =20
        [=E2=80=A6 same for all other plugins]

The thing that puzzles me is, that in the plugin=E2=80=99s Makefile [4] `-f=
PIC`
is specified

        CXX      ?=3D g++
        CXXFLAGS ?=3D -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parenthe=
ses
        LIBS     ?=3D ${LDFLAGS}

but in the above command it is not included.

        arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 =
-mfpu=3Dneon -mfloat-abi=3Dsoftfp -isystem/oe/tangstrom-dev/staging/armv7a-=
angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-regis=
ters -fomit-frame-pointer -O2 -ggdb3 -fpermissive -fvisibility-inlines-hidd=
en -c -D_GNU_SOURCE -DPLUGIN_NAME_I18N=3D'"hello"' -I../../../include hello=
.c

Looking at `run.do_install.28829` I cannot see find the `-fPIC` in
there. So my question is, why is it not included. Is it because of =C2=BB?=
=3D=C2=AB?
How do I get it included?

        $ grep -i cxxflags run.do_install.28829
        export TARGET_CXXFLAGS=3D"-isystem/oe/tangstrom-dev/staging/armv7a-=
angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-regis=
ters -fomit-frame-pointer -O2 -ggdb3 -fpermissive"
        export CXXFLAGS=3D"-isystem/oe/tangstrom-dev/staging/armv7a-angstro=
m-linux-gnueabi/usr/include -fexpensive-optimizations -frename-registers -f=
omit-frame-pointer -O2 -ggdb3 -fpermissive -fvisibility-inlines-hidden"
        export SDK_CXXFLAGS=3D"-isystem/oe/tangstrom-dev/staging/i686-linux=
/usr/include -isystem/oe/tangstrom-dev/staging/armv7a-angstrom-linux-gnueab=
i/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-poi=
nter -O2 -ggdb3 -fpermissive"
        export BUILD_CXXFLAGS=3D"-isystem/oe/tangstrom-dev/staging/i686-lin=
ux/usr/include -O2 -g -fpermissive"

`conf/bitbake.conf` [5] seems to be the place where those environment
variables are set.

        $ grep -i cxxflags conf/bitbake.conf=20
        export BUILD_CXXFLAGS =3D "${BUILD_CFLAGS} -fpermissive"
        export CXXFLAGS =3D "${TARGET_CXXFLAGS}"
        export TARGET_CXXFLAGS =3D "${TARGET_CFLAGS} -fpermissive"
        export SDK_CXXFLAGS =3D "${SDK_CFLAGS} -fpermissive"

So to summarize it looks like `CXXFLAGS` gets set to `TARGET_CXXFLAGS` =E2=
=80=93
which just gets exported afterward? =E2=80=93 by BitBake. Because in
`oe_runmake` `make` is run with `-e` these variables take precedence
over the one in the Makefile of the program which are additionally just
declared with =C2=BB?=3D=C2=AB. Is this correct?

How do I get this fixed? Do I need to use `TARGET_CXXFLAGS_append +=3D` or
`--extra-cxxflags` as found by `git grep "target_cxxflags"`?


Thanks a lot,

Paul


[1] http://www.angstrom-distribution.org/building-angstrom
[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-January/01=
6153.html
[3] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/vdr/vdr=
_1.7.10.bb
[4] http://git.gekrumbel.de/vdr.git?p=3Dvdr.git;a=3Dblob;f=3DPLUGINS/src/he=
llo/Makefile;h=3Dea5b8063be9768b5097eedfc0bf210128e5d4043;hb=3DHEAD
[5] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/conf/bitbake.co=
nf

--=-4bxXV73h3EIdhVitGnYb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktMXp8ACgkQPX1aK2wOHVg9qACeIzGodd0LzFwAfudHhdKx3R8c
u8kAnjh57aUV2PLMnQIUpJVeGejeFF69
=66Yd
-----END PGP SIGNATURE-----

--=-4bxXV73h3EIdhVitGnYb--
