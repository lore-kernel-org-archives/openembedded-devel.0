Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SMk1P-0006fT-7O
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Apr 2012 19:59:27 +0200
Received: by wera1 with SMTP id a1so676904wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Apr 2012 10:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=i2lchzpxQtwhLqCd3MUfBIo+vV5c+eKlqZ0kbAopE8E=;
	b=ldiBsRCczgRwNSM6KO4icuLGTMMVQOx+Zx2Mz94PppPjz+SpVBCYzG9N5vi1VuQa0V
	9tPDiL4L4j6VIkWcWSjoeAKiDtwLYe6DOK1G3gc2P3upBxa7TGQIUITR6vVabhmkl7eB
	wBSOSXpo88ebA61u58CW6mzXh7YiCWb5A5HGBofDV9EJz/Slv38nW5pxkPUM3vp3ieCH
	D43W3GflzgLyZKBtnnhecDFq5V9lw/jqmxhxHQRsftU7L19gRiwkmEkLqQ19ILv5wssS
	C85Y4gQTdkr6UVV5mCVI3lfB6qT5CsCXsv5Zr1FxmVyYrU27RaDl2oZ/WI6JrPGDgdcA
	TXGQ==
Received: by 10.180.75.241 with SMTP id f17mr31928409wiw.11.1335289792265;
	Tue, 24 Apr 2012 10:49:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n20sm48864564wiw.5.2012.04.24.10.49.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Apr 2012 10:49:49 -0700 (PDT)
Date: Tue, 24 Apr 2012 19:49:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120424174951.GD3687@jama.jama.net>
References: <CAFZPMobAtbxhHfAae1eY6ykB=z=uU36SCn5zsxcWbJMAmrTxVg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFZPMobAtbxhHfAae1eY6ykB=z=uU36SCn5zsxcWbJMAmrTxVg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: trying to compile recent gpsd (one with scons) with OE
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
X-List-Received-Date: Tue, 24 Apr 2012 17:59:27 -0000
X-Groupsio-MsgNum: 38392
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ylS2wUBXLOxYXZFQ"
Content-Disposition: inline

--ylS2wUBXLOxYXZFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 11, 2011 at 04:14:04PM +0300, Sergey Lapin wrote:
> Hi, all!
>=20
> I try to fight scons with OE (actually OE-core, but I think this stuff
> is unrelated).

check 3.4, 3.5 and git recipes here:
http://git.openembedded.org/meta-openembedded-contrib/log/?h=3Djansa/gpsd

they have fixed style issues, host contamination, wrong prefix, wrong
and redundant RPATHs and python paths.

Cheers,

> Recipe:
> DESCRIPTION =3D "A TCP/IP Daemon simplifying the communication with GPS d=
evices"
> SECTION =3D "console/network"
> PRIORITY =3D "optional"
> LICENSE =3D "GPL"
> DEPENDS =3D "dbus-glib ncurses python"
> PROVIDES =3D "virtual/gpsd"
> INC_PR =3D "r18"
>=20
> CCACHE=3D""
> DEPENDS +=3D "libusb1"
> SRCREV =3D "2867071cd2aba0cdd4722eb5a86647eebad8c517"
>=20
> SRC_URI =3D "\
>=20
> git://git.sv.gnu.org/gpsd.git;protocol=3Dgit;branch=3Dmaster \
>                         file://0001-Fix-geostar-shows-zero-cootdinates.pa=
tch \
>                         file://gpsd-default \
>                         file://gpsd \
>                         file://60-gpsd.rules"
>=20
> S =3D "${WORKDIR}/git"
>=20
> INITSCRIPT_NAME =3D "gpsd"
> INITSCRIPT_PARAMS =3D "defaults 35"
>=20
> EXTRA_OESCONS =3D "\
>         dbus_export=3Dtrue \
>         arch=3D${TARGET_ARCH} \
>         dbus=3Dyes \
>         python=3Dyes \
>         strip=3Dno \
>         "
>=20
> inherit scons2 python-dir
>=20
> PR =3D "${INC_PR}.8"
>=20
> PARALLEL_MAKE =3D ""
>=20
> INITSCRIPT_NAME =3D "gpsd"
> INITSCRIPT_PARAMS =3D "defaults 35"
>=20
> LDFLAGS +=3D "-L${STAGING_LIBDIR} -lm"
> export STAGING_INCDIR
> export STAGING_LIBDIR
> export PATH
>=20
> TARGET_CC_ARCH +=3D "${LDFLAGS}"
>=20
> do_compile_prepend() {
>     export CC=3D${CC}
>     export BUILD_SYS=3D"${BUILD_SYS}"
>     export HOST_SYS=3D"${HOST_SYS}"
>         find ${S} -name "*.so" -exec rm -f {} \;
> }
>=20
> do_install_prepend() {
>     export BUILD_SYS=3D"${BUILD_SYS}"
>     export HOST_SYS=3D"${HOST_SYS}"
> }
>=20
> do_install_append() {
>     install -d ${D}/${sysconfdir}/init.d
>     install -m 0755 ${WORKDIR}/gpsd ${D}/${sysconfdir}/init.d/
>     install -d ${D}/${sysconfdir}/default
>     install -m 0644 ${WORKDIR}/gpsd-default
> ${D}/${sysconfdir}/default/gpsd.default
>=20
>     #support for udev
>     install -d ${D}/${sysconfdir}/udev/rules.d
>     install -m 0644 ${WORKDIR}/60-gpsd.rules ${D}/${sysconfdir}/udev/rule=
s.d
>     install -d ${D}${base_libdir}/udev/
>     install -m 0755 ${S}/gpsd.hotplug ${D}${base_libdir}/udev/
>         sed -i -e 's@^prefix=3D.*@prefix=3D/usr@g'
> ${D}${libdir}/pkgconfdir/libgps.pc
>         sed -i -e 's@^prefix=3D.*@prefix=3D/usr@g'
> ${D}${libdir}/pkgconfdir/libgpsd.pc
>     install -d ${D}${PYTHON_SITEPACKAGES_DIR}/gps
>     install -m 755 ${S}/gps/*.py ${D}${PYTHON_SITEPACKAGES_DIR}/gps
> }
>=20
> pkg_postinst_${PN}-conf() {
>         update-alternatives --install ${sysconfdir}/default/gpsd
> gpsd-defaults ${sysconfdir}/default/gpsd.default 10
> }
>=20
> pkg_postrm_${PN}-conf() {
>         update-alternatives --remove gpsd-defaults
> ${sysconfdir}/default/gpsd.default
> }
>=20
> PACKAGES =3D+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev
> gpsd-conf gpsd-gpsctl gps-utils"
>=20
> FILES_gpsd-dev +=3D "${libdir}/pkgconfdir/libgpsd.pc
> ${libdir}/pkgconfdir/libgps.pc"
>=20
> FILES_python-pygps-dbg +=3D " ${libdir}/python*/site-packages/gps/.debug"
>=20
> RDEPENDS_${PN} =3D "gpsd-gpsctl"
> RRECOMMENDS_${PN} =3D "gpsd-conf gpsd-udev"
>=20
> DESCRIPTION_gpsd-udev =3D "udev relevant files to use gpsd hotplugging"
> FILES_gpsd-udev =3D "${base_libdir}/* ${sysconfdir}/udev/*"
> RDEPENDS_gpsd-udev +=3D "udev gpsd-conf"
>=20
> DESCRIPTION_libgpsd =3D "C service library used for communicating with gp=
sd"
> FILES_libgpsd =3D "${libdir}/libgpsd.so.*"
>=20
> DESCRIPTION_libgps =3D "C service library used for communicating with gps=
d"
> FILES_libgps =3D "${libdir}/libgps.so.*"
>=20
> DESCRIPTION_gpsd-conf =3D "gpsd configuration files and init scripts"
> FILES_gpsd-conf =3D "${sysconfdir}"
>=20
> DESCRIPTION_gpsd-gpsctl =3D "Tool for tweaking GPS modes"
> FILES_gpsd-gpsctl =3D "${bindir}/gpsctl"
>=20
> DESCRIPTION_gps-utils =3D "Utils used for simulating, monitoring,... a GP=
S"
> FILES_gps-utils =3D "${bindir}/*"
> RDEPENDS_gps-utils =3D "python-pygps"
>=20
> DESCRIPTION_python-pygps =3D "Python bindings to gpsd"
> FILES_python-pygps =3D "${PYTHON_SITEPACKAGES_DIR}"
> RDEPENDS_python-pygps =3D "python-core python-curses gpsd python-json"
>=20
> scons2.bbclass:
> DEPENDS +=3D "python-scons-native"
>=20
> EXTRA_OESCONS ?=3D ""
>=20
> export TARGET_LINK_HASH_STYLE
>=20
> scons2_do_compile() {
>     if [ "${SCONS_FIX_ENV}" =3D "1" ] ; then
>         if grep "toolchain-from-env" ${S}/SConstruct ; then
>             echo "Toolchain overrides already applied"
>         else
>            cat ${STAGING_DATADIR_NATIVE}/scons/toolchain-from-env.SConscr=
ipt
> >> ${S}/SConstruct
>         fi
>     fi
>=20
>     ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} CXX=3D"${CXX}"
> PREFIX=3D${prefix} prefix=3D${prefix} ${EXTRA_OESCONS} || \
>     oefatal "scons build execution failed."
> }
>=20
> scons2_do_install() {
>         install -d ${D}${prefix}
>         ${STAGING_BINDIR_NATIVE}/scons PREFIX=3D${D}${prefix}
> prefix=3D${D}${prefix} install ${EXTRA_OESCONS} || \
>         oefatal "scons install execution failed."
> }
>=20
> EXPORT_FUNCTIONS do_compile do_install
>=20
> Outcome:
>=20
> ERROR: Function 'do_compile' failed (see
> /home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/=
work/armv5te-angstrom-linux-gnueabi/gpsd-git-r18.8/temp/log.do_compile.20570
> for further information)
> ERROR: Logfile of failure stored in:
> /home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/=
work/armv5te-angstrom-linux-gnueabi/gpsd-git-r18.8/temp/log.do_compile.20570
> Log data follows:
> | ERROR: Function 'do_compile' failed (see
> /home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/=
work/armv5te-angstrom-linux-gnueabi/gpsd-git-r18.8/temp/log.do_compile.20570
> for further information)
> | + cd /home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-=
eglibc/work/armv5te-angstrom-linux-gnueabi/gpsd-git-r18.8/git
> | + do_compile
> | + export BUILD_SYS=3Di686-linux
> | + BUILD_SYS=3Di686-linux
> | + export HOST_SYS=3Darm-angstrom-linux-gnueabi
> | + HOST_SYS=3Darm-angstrom-linux-gnueabi
> | + export 'CC=3Darm-angstrom-linux-gnueabi-gcc  -march=3Darmv5te
> -mno-thumb -mthumb-interwork  -mtune=3Darm926ej-s -Wl,-O1
> -Wl,--hash-style=3Dgnu -Wl,--as-needed
> -L/home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglib=
c/sysroots/crux/usr/lib
> -lm -mthumb-interwork -mno-thumb
> --sysroot=3D/home/build1/slave/angstrom_build/build/build/tmp-angstrom_20=
10_x-eglibc/sysroots/crux'
> | + CC=3D'arm-angstrom-linux-gnueabi-gcc  -march=3Darmv5te  -mno-thumb
> -mthumb-interwork  -mtune=3Darm926ej-s -Wl,-O1 -Wl,--hash-style=3Dgnu
> -Wl,--as-needed
> -L/home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglib=
c/sysroots/crux/usr/lib
> -lm -mthumb-interwork -mno-thumb
> --sysroot=3D/home/build1/slave/angstrom_build/build/build/tmp-angstrom_20=
10_x-eglibc/sysroots/crux'
> | + find /home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_=
x-eglibc/work/armv5te-angstrom-linux-gnueabi/gpsd-git-r18.8/git
> -name '*.so' -exec rm -f '{}' ';'
> | + scons2_do_compile
> | + '[' '' =3D 1 ']'
> | + /home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-egl=
ibc/sysroots/i686-linux/usr/bin/scons
> 'CXX=3Darm-angstrom-linux-gnueabi-g++  -march=3Darmv5te  -mno-thumb
> -mthumb-interwork  -mtune=3Darm926ej-s -Wl,-O1 -Wl,--hash-style=3Dgnu
> -Wl,--as-needed
> -L/home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglib=
c/sysroots/crux/usr/lib
> -lm -mthumb-interwork -mno-thumb
> --sysroot=3D/home/build1/slave/angstrom_build/build/build/tmp-angstrom_20=
10_x-eglibc/sysroots/crux'
> PREFIX=3D/usr prefix=3D/usr dbus_export=3Dtrue arch=3Darm dbus=3Dyes pyth=
on=3Dyes
> strip=3Dno
> | scons: Reading SConscript files ...
> | Checking for chrpath... (cached) yes
> | Checking whether the C++ compiler works(cached) yes
> | Checking for ncurses... (cached) yes
> | Checking for libusb-1.0... (cached) yes
> | Checking for C library librt... (cached) yes
> | Checking for dbus-1... (cached) yes
> | Checking for bluez... (cached) yes
> | Checking for C header file sys/timepps.h... (cached) no
> | You do not have kernel PPS available.
> | Checking for C function daemon()... (cached) yes
> | Checking for C function strlcpy()... (cached) no
> | Checking for C function strlcat()... (cached) no
> | Checking for C function clock_gettime()... (cached) yes
> | Checking for C library libbluetooth... (cached) yes
> | Checking for C library libdbus-1... (cached) yes
> | Checking that xsltproc can make man pages... (cached) yes
> | Checking for QtNetwork... (cached) no
> | Altered configuration variables:
> | dbus_export =3D True (default False): enable DBUS export support
> | strip =3D False (default True): build with stripping of binaries enabled
> | prefix =3D /usr (default /usr/local): installation directory prefix
> | scons: done reading SConscript files.
> | scons: Building targets ...
> | arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mno-thumb
> -mthumb-interwork -mtune=3Darm926ej-s -Wl,-O1 -Wl,--hash-style=3Dgnu
> -Wl,--as-needed
> -L/home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglib=
c/sysroots/crux/usr/lib
> -lm -mthumb-interwork -mno-thumb
> --sysroot=3D/home/build1/slave/angstrom_build/build/build/tmp-angstrom_20=
10_x-eglibc/sysroots/crux
> -o driver_garmin.os -c -O2 -pipe -g -feliminate-unused-debug-types -O2
> -fPIC -I/usr/include/libusb-1.0 driver_garmin.c
> | driver_garmin.c:95:20: fatal error: libusb.h: No such file or directory
> | compilation terminated.
> | scons: *** [driver_garmin.os] Error 1
> | scons: building terminated because of errors.
> | + oefatal 'scons build execution failed.'
> | /home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglib=
c/work/armv5te-angstrom-linux-gnueabi/gpsd-git-r18.8/temp/run.do_compile.20=
570:
> line 104: oefatal: command not found
> NOTE: package gpsd-git-r18.8: task do_compile: Failed
> ERROR: Task 337
> (/home/build1/slave/angstrom_build/build/sources/crux/recipes/gpsd/gpsd_g=
it.bb,
> do_compile) failed with exit code '1'
> Waiting for 1 active tasks to finish:
> 0: iproute2-3.0.0-r0 do_compile (pid 20703)
> Waiting for 2 active tasks to finish:
> 0: u-boot-crux-1_2011.10+r10+gitrea97184696c7539d51f5fc072124219acc4f937b=
-r10
> do_configure (pid 20706)
> 1: iproute2-3.0.0-r0 do_compile (pid 20703)
> NOTE: package u-boot-crux-1_2011.10+r10+gitrea97184696c7539d51f5fc0721242=
19acc4f937b-r10:
> task do_configure: Started
> WARNING: u-boot-crux: Recipe file does not have license file
> information (LIC_FILES_CHKSUM)
> Waiting for 1 active tasks to finish:
> 0: iproute2-3.0.0-r0 do_compile (pid 20703)
> NOTE: package u-boot-crux-1_2011.10+r10+gitrea97184696c7539d51f5fc0721242=
19acc4f937b-r10:
> task do_configure: Succeeded
> NOTE: package iproute2-3.0.0-r0: task do_compile: Succeeded
> ERROR: '/home/build1/slave/angstrom_build/build/sources/crux/recipes/gpsd=
/gpsd_git.bb'
> failed
> program finished with exit code 2
> elapsedTime=3D174.306691
>=20
>=20
> libusb.h is where it should be, --sysroot is there.
> Other packages build wiithout problems.
> Any ideas?
>=20
> S.
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ylS2wUBXLOxYXZFQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+W578ACgkQN1Ujt2V2gBwZQQCfZuXZJ8ascZadFylt5Mb6EZ+6
8xAAoK2owe99aXCrLS5+kiRM7Nf9EU1H
=J5Uv
-----END PGP SIGNATURE-----

--ylS2wUBXLOxYXZFQ--
