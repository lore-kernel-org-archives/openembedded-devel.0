Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 0116F7320D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 09:59:50 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Z9sKS-0000RX-4E for openembedded-devel@lists.openembedded.org;
	Tue, 30 Jun 2015 11:59:48 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 11:59:48 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 11:59:48 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 30 Jun 2015 11:59:32 +0200
Message-ID: <mmtpa9$67d$1@ger.gmane.org>
References: <5591E548.8090706@gmail.com>
	<CAJTo0LbVgo+rn3rPPbj=ho-aDc6WuHTq83UcR8Y=HNAique81w@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
In-Reply-To: <CAJTo0LbVgo+rn3rPPbj=ho-aDc6WuHTq83UcR8Y=HNAique81w@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] cmake update broke mariadb
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Jun 2015 09:59:51 -0000
X-Groupsio-MsgNum: 56081
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="nfB9Kkdc2STH8SOgLHNQtHwQp09AuQrWf"

--nfB9Kkdc2STH8SOgLHNQtHwQp09AuQrWf
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Burton, Ross schreef op 30-06-15 om 11:44:
> On 30 June 2015 at 01:39, akuster808 <akuster808@gmail.com> wrote:
>=20
>> eo-core commit f8661aa "cmake: Upgrade 2.8.12.2 -> 3.2.2" broke mariad=
b
>> in meta-oe.
>>=20
>> DOes  the person who updated cmake need to fix this or the person who
>> is feeling the pain will be fixing it ?
>>=20
>=20
> Depends on what the breakage is really.  Can you provide build logs?

ERROR: Function failed: do_configure (log file is located at
/build/linaro/build/build/tmp-glibc/work/x86_64-linux/mariadb-native/5.5.=
44-r0/temp/log.do_configure.25603)
ERROR: Logfile of failure stored in:
/build/linaro/build/build/tmp-glibc/work/x86_64-linux/mariadb-native/5.5.=
44-r0/temp/log.do_configure.25603
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_copy_aclocals
| DEBUG: Python function autotools_copy_aclocals finished
| DEBUG: Executing shell function do_configure
| -- Running cmake version 3.2.2
| -- The C compiler identification is GNU 4.8.3
| -- The CXX compiler identification is GNU 4.8.3
| CMake Error at CMakeLists.txt:86 (PROJECT):
|   The CMAKE_C_COMPILER:
|
|     gcc
|
|   is not a full path and was not found in the PATH.
|
|   Tell CMake where to find the compiler by setting either the environme=
nt
|   variable "CC" or the CMake cache entry CMAKE_C_COMPILER to the full p=
ath to
|   the compiler, or to the compiler name if it is in the PATH.
|
|
| CMake Error at CMakeLists.txt:86 (PROJECT):
|   The CMAKE_CXX_COMPILER:
|
|     g++
|
|   is not a full path and was not found in the PATH.
|
|   Tell CMake where to find the compiler by setting either the environme=
nt
|   variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the ful=
l path
|   to the compiler, or to the compiler name if it is in the PATH.
|
|
| -- Configuring incomplete, errors occurred!
| See also
"/build/linaro/build/build/tmp-glibc/work/x86_64-linux/mariadb-native/5.5=
=2E44-r0/build/CMakeFiles/CMakeOutput.log".
| WARNING:
/build/linaro/build/build/tmp-glibc/work/x86_64-linux/mariadb-native/5.5.=
44-r0/temp/run.do_configure.25603:1
exit 1 from
|   cmake ${OECMAKE_SITEFILE}
/build/linaro/build/build/tmp-glibc/work/x86_64-linux/mariadb-native/5.5.=
44-r0/mariadb-5.5.44
-DCMAKE_INSTALL_PREFIX:PATH=3D/build/linaro/build/build/tmp-glibc/sysroot=
s/x86_64-linux/usr
-DCMAKE_INSTALL_BINDIR:PATH=3D/build/linaro/build/build/tmp-glibc/sysroot=
s/x86_64-linux/usr/bin
-DCMAKE_INSTALL_SBINDIR:PATH=3D/build/linaro/build/build/tmp-glibc/sysroo=
ts/x86_64-linux/usr/sbin
-DCMAKE_INSTALL_LIBEXECDIR:PATH=3D/build/linaro/build/build/tmp-glibc/sys=
roots/x86_64-linux/usr/lib/mariadb
-DCMAKE_INSTALL_SYSCONFDIR:PATH=3D/build/linaro/build/build/tmp-glibc/sys=
roots/x86_64-linux/etc
-DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=3D/build/linaro/build/build/tmp-glibc=
/sysroots/x86_64-linux/com
-DCMAKE_INSTALL_LOCALSTATEDIR:PATH=3D/build/linaro/build/build/tmp-glibc/=
sysroots/x86_64-linux/var
-DCMAKE_INSTALL_LIBDIR:PATH=3D/build/linaro/build/build/tmp-glibc/sysroot=
s/x86_64-linux/usr/lib
-DCMAKE_INSTALL_INCLUDEDIR:PATH=3D/build/linaro/build/build/tmp-glibc/sys=
roots/x86_64-linux/usr/include
-DCMAKE_INSTALL_DATAROOTDIR:PATH=3D/build/linaro/build/build/tmp-glibc/sy=
sroots/x86_64-linux/usr/share
-DCMAKE_INSTALL_SO_NO_EXE=3D0
-DCMAKE_TOOLCHAIN_FILE=3D/build/linaro/build/build/tmp-glibc/work/x86_64-=
linux/mariadb-native/5.5.44-r0/toolchain.cmake
-DCMAKE_VERBOSE_MAKEFILE=3D1 -DWITH_EMBEDDED_SERVER=3DON -DWITH_JEMALLOC=3D=
no
-DWITHOUT_TOKUDB=3DTRUE -DCMAKE_DISABLE_FIND_PACKAGE_Boost=3DTRUE -DGROFF=
=3DFALSE
-DNROFF=3DFALSE -DENABLE_DTRACE=3DFALSE -DWITH_PIC=3DON -DINSTALL_LAYOUT=3D=
RPM
-DINSTALL_DOCDIR:PATH=3D/build/linaro/build/build/tmp-glibc/sysroots/x86_=
64-linux/usr/share/doc/mariadb
-DINSTALL_LIBDIR:PATH=3Dlib -DINSTALL_PLUGINDIR:PATH=3Dlib/plugin
-DINSTALL_SYSCONFDIR:PATH=3D/build/linaro/build/build/tmp-glibc/sysroots/=
x86_64-linux/etc
-DMYSQL_DATADIR:PATH=3D/var/mysql -DCAT_EXECUTABLE=3D`which cat`
-DCMAKE_AR:FILEPATH=3Dar -DLIBEDIT_INTERFACE=3DFALSE -DWITHOUT_AUTH_PAM=3D=
TRUE
-DWITHOUT_VALGRIND=3DTRUE -Wno-dev
| ERROR: Function failed: do_configure (log file is located at
/build/linaro/build/build/tmp-glibc/work/x86_64-linux/mariadb-native/5.5.=
44-r0/temp/log.do_configure.25603)
ERROR: Task 2056
(/build/linaro/build/meta-openembedded/meta-oe/recipes-support/mysql/mari=
adb-native_5.5.44.bb,
do_configure) failed with exit code '1'





--nfB9Kkdc2STH8SOgLHNQtHwQp09AuQrWf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFVkmiJMkyGM64RGpERAr+7AKCRNSBebhjp0g+fb64+BoMQBmFF6wCfRayT
jFJC7nKqAQxPq6ygxq5Otvg=
=kxIY
-----END PGP SIGNATURE-----

--nfB9Kkdc2STH8SOgLHNQtHwQp09AuQrWf--
