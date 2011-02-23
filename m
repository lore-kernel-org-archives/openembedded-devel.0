Received: from mrqout1-sorbs.tiscali.it ([195.130.225.22]
	helo=mrqout1.tiscali.it) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <l.bolognini@tiscali.it>) id 1PsDtl-0008Gw-GR
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 13:32:53 +0100
Received: from [10.39.115.23] by mrq-1 with esmtp (Exim)
	id 1PsDsU-0006Wz-CW; Wed, 23 Feb 2011 13:31:34 +0100
Received: from ps-wm5 (10.39.75.205) by mail-3-it.mail.tiscali.sys (8.5.134)
	id 4D3EB05B00BE34C1 for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 12:49:54 +0100
Message-ID: <27863997.429871298461794177.JavaMail.defaultUser@defaultHost>
Date: Wed, 23 Feb 2011 12:49:54 +0100 (CET)
From: Luca Bolognini <l.bolognini@tiscali.it>
To: <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
xOriginalSenderIP: 78.6.111.196
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: External toolchain
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
X-List-Received-Date: Wed, 23 Feb 2011 12:32:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,thank you Ahsan for you reply.I solved my issue and I succeed in using e=
xternal toolchain CodeSourcery2009q1 to cross-compile some packages in my O=
E 2010.12 release.However I didn't create any symlink of arm-angstrom-linux=
-gnueabi-gcc to arm-none-linux-gnueabi-gcc.I added an instantiation of TARG=
ET_SYS variable to the hints of Denys and Tom (se reference link in my prev=
ious email).It's important to do so in order not to have errors in the do_i=
nstall task of external-toolchain-csl.bb recipe.Then, as a resume, my opene=
mbedded/conf/distro/angstrom-2008.1.conf file changed in this way:
# Set the toolchain type (internal, external) and brand (generic, csl etc.)=
# LUCATARGET_VENDOR =3D "-none"TOOLCHAIN_TYPE ?=3D "external"TOOLCHAIN_BRAN=
D ?=3D "csl"TOOLCHAIN_PATH =3D "/opt/ti/codesourcery"TARGET_SYS =3D "arm-no=
ne-linux-gnueabi"TOOLCHAIN_SYSPATH =3D "${TOOLCHAIN_PATH}/arm-none-linux-gn=
ueabi"PATH_prepend =3D "${TOOLCHAIN_PATH}/bin:"require conf/distro/include/=
toolchain-external.inc
instead of
# Set the toolchain type (internal, external) and brand (generic, csl etc.)=
TOOLCHAIN_TYPE ?=3D "internal"TOOLCHAIN_BRAND ?=3D ""
Then it worked.Bye,Luca



----Messaggio originale----
Da: Noor_Ahsan@mentor.com
Data: 22/02/2011 10.47
A: <openembedded-devel@lists.openembedded.org>
Ogg: Re: [oe] External toolchain

Hello Luca,

Probably you need to create symbolic links of arm-angstrom-linux-
gnueabi-gcc to arm-none-linux-gnueabi-gcc. OE assumes that the compiler nam=
e is arm-angstrom-linux-gnueabi-gcc. You can see the "CC" variable value by=
 take environment of libtool-cross (using -e options) that how OE is creati=
ng the name of compiler.

Regards,
Noor

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Luca Bolognini
Sent: Tuesday, February 22, 2011 2:16 PM
To: Open Embedded Mailing List
Subject: [oe] External toolchain

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
rodotti/tc/tuttoincluso/?WT.mc_id=3D01fw=20

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel





Supera i limiti: raddoppia la velocit=C3=A0 da 10 a 20 Mega!=20
Risparmia con Tutto Incluso: telefono + adsl 20 mega a soli 29,95 =E2=82=AC=
 al mese per due anni!
SCONTO DI 240 EURO!
http://abbonati.tiscali.it/telefono-adsl/prodotti/tc/tuttoincluso/?WT.mc_id=
=3D01fw


