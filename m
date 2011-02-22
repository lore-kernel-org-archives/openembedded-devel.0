Received: from mrqout3.tiscali.it ([195.130.225.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <l.bolognini@tiscali.it>) id 1ProNC-0008Mc-1P
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 10:17:34 +0100
Received: from [10.39.115.22] by mrq-3 with esmtp (Exim)
	id 1ProLn-0007Gg-7s; Tue, 22 Feb 2011 10:16:07 +0100
Received: from ps-wm6 (10.39.75.206) by mail-2.mail.tiscali.sys (8.5.134)
	id 4D3EB05B00B4DAAE for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 10:16:03 +0100
Message-ID: <12689458.696811298366163560.JavaMail.defaultUser@defaultHost>
Date: Tue, 22 Feb 2011 10:16:03 +0100 (CET)
From: Luca Bolognini <l.bolognini@tiscali.it>
To: Open Embedded Mailing List <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
xOriginalSenderIP: 78.6.111.196
Subject: External toolchain
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
X-List-Received-Date: Tue, 22 Feb 2011 09:17:34 -0000
Content-Type: text/plain;charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
I would like to use an external toolchain (CodeSourcery2009q1) to=20
cross-compile some packages for my beagleboard (more or less the same=20
that happens in Arago) and then I expect not to download glibc package=20
and cross-compile again libc, libpthread and so on. I would like to use=20
the libraries inside my external CodeSourcery SDK.
I followed some=20
hints by Denys and Tom ( http://lists.linuxtogo.
org/pipermail/openembedded-devel/2010-April/019521.html ) and I put=20

#=20
LUCA
TARGET_VENDOR =3D "-none"
TOOLCHAIN_TYPE ?=3D "external"

TOOLCHAIN_BRAND ?=3D "csl"
TOOLCHAIN_PATH =3D "/opt/ti/codesourcery"

TOOLCHAIN_SYSPATH =3D "${TOOLCHAIN_PATH}/arm-none-linux-gnueabi"

PATH_prepend =3D "${TOOLCHAIN_PATH}/bin:"
require=20
conf/distro/include/toolchain-external.inc

inside my=20
openembedded/conf/distro/angstrom-2008.1.conf

As you know, cross-
compiler provided by CodeSoucery is arm-none-linux-gnueabi-gcc but I=20
get the following error with libtool-cross_2.2.6b.bb:
Build=20
Configuration:
BB_VERSION        =3D "1.8.19"
METADATA_BRANCH   =3D=20
"release-2010.12"
METADATA_REVISION =3D "dec3967"
TARGET_ARCH       =3D=20
"arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D=20
"beagleboard"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D=20
"2010.7-test-20110221"
TARGET_FPU        =3D "hard"
[...]
| checking for=20
arm-angstrom-linux-gnueabi-gcc... arm-angstrom-linux-gnueabi-gcc -
march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthum=
b-
interwork -mno-thumb
| checking whether the C compiler works... no
|=20
configure: error: in `/home/bolognini/diskp2/diskp2.4/pure-
oe/build/tmp/work/armv7a-angstrom-linux-gnueabi/libtool-cross-2.2.6b-
r27.1/libtool-2.2.6b':
| configure: error: C compiler cannot create=20
executables

Obviously OE doesn't have to find arm-angstrom-linux-
gnueabi-gcc, but why does it search for arm-angstrom-linux-gnueabi-gcc=20
instead of arm-none-linux-gnueabi-gcc ?
What's wrong inside angstrom-
2008.1.conf or what am I missing?

Thank you for your support
Luca


Supera i limiti: raddoppia la velocit=C3=A0 da 10 a 20 Mega!   Risparmia co=
n Tutto Incluso: telefono + adsl 20 mega a soli 29,95 =E2=82=AC al mese per=
 due anni!  SCONTO DI 240 EURO!  http://abbonati.tiscali.it/telefono-adsl/p=
rodotti/tc/tuttoincluso/?WT.mc_id=3D01fw 


