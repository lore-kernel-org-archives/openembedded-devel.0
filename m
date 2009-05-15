Received: from [199.44.250.2] (helo=courier.syntech-fuelmaster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mbutsch@syntech-fuelmaster.com>) id 1M50Oc-0003Qf-Mn
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 18:36:37 +0200
Received: from Courier.syntech.org ([fe80::f891:ea5e:fd2e:c375]) by
	Courier.syntech.org ([fe80::f891:ea5e:fd2e:c375%13]) with mapi;
	Fri, 15 May 2009 12:28:49 -0400
From: Mark Butsch <mbutsch@syntech-fuelmaster.com>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 15 May 2009 12:28:48 -0400
Thread-Topic: minimo: task do_configure failed
Thread-Index: AcnVek+3sTJR/kUdTF63OzYaYW6BtQ==
Message-ID: <6C2434209962DC46B88345CA85C334A240C119E053@Courier.syntech.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: minimo: task do_configure failed
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
X-List-Received-Date: Fri, 15 May 2009 16:36:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I asked this question back in March but never saw a response.

I am trying to build minimo (angstrom distro) and it is failing in do_confi=
gure.

OE Build Configuration:
BB_VERSION        =3D "1.8.13"
METADATA_BRANCH   =3D "stable/2009"
METADATA_REVISION =3D "481398457bcc88395b07c4c724c4def42be36fd2"
TARGET_ARCH       =3D "i686"
TARGET_OS         =3D "linux"
MACHINE           =3D "4g-i686"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "2009.X-test-20090515"

I am building on an x86 64 bit OS for a x86 32 bit target.

The log file is:

-----------
NOTE: make -f client.mk CONFIGURE_ARGS=3D --build=3Dx86_64-linux --host=3Dx=
86_64-linux --target=3Di686-angstrom-linux  configure
cd /home/ad/mbutsch/4G/tmp/angstrom/work/i686-angstrom-linux/minimo-1_0.02+=
cvs20070626-r1/mozilla
./configure --build=3Dx86_64-linux --host=3Dx86_64-linux --target=3Di686-an=
gstrom-linux
Adding configure options from /home/ad/mbutsch/4G/tmp/angstrom/work/i686-an=
gstrom-linux/minimo-1_0.02+cvs20070626-r1/mozconfig:
  --enable-application=3Dminimo
  --enable-default-toolkit=3Dgtk2
  --disable-freetype2
  --enable-xft
  --disable-postscript
  --disable-xprint
  --disable-gnomevfs
  --disable-gnomeui
  --disable-jsd
  --disable-plugins
  --disable-view-source
  --disable-accessibility
  --disable-xpinstall
  --enable-single-profile
  --disable-jsloader
  --disable-printing
  --enable-native-uconv
  --enable-plaintext-editor-only
  --disable-xpcom-obsolete
  --disable-pref-extensions
  --disable-extensions
  --enable-image-decoders=3Dpng,gif,jpeg
  --disable-mathml
  --disable-installer
  --disable-updater
  --disable-tests
  --enable-optimize=3D-Os
  --disable-logging
  --enable-strip
  --enable-elf-dynstr-gc
  --disable-shared
  --enable-static
  --disable-profilesharing
  --disable-profilelocking
loading site script /home/oe/openembedded/site/endian-little
loading site script /home/oe/openembedded/site/common-linux
loading site script /home/oe/openembedded/site/common-glibc
loading site script /home/oe/openembedded/site/ix86-common
loading site script /home/oe/openembedded/site/common
loading site script /home/oe/openembedded/site/common
creating cache ./config.cache
checking host system type... x86_64-pc-linux-gnu
checking target system type... i686-angstrom-linux-gnu
checking build system type... x86_64-pc-linux-gnu
checking for gawk... gawk
checking for nsinstall... no
cross compiling from x86_64-pc-linux-gnu to i686-angstrom-linux-gnu
checking for host c compiler... checking for gcc... (cached) gcc
gcc
checking for host c++ compiler... checking for c++... (cached) g++
g++
checking for ranlib... no
checking for ar... no
checking whether the host c compiler (gcc -isystem/home/ad/mbutsch/4G/tmp/a=
ngstrom/staging/i686-angstrom-linux/usr/include -fexpensive-optimizations -=
frename-registers -fomit-frame-pointer -O2 -march=3Di486 -L/home/ad/mbutsch=
/4G/tmp/angstrom/staging/i686-angstrom-linux/usr/lib -Wl,-rpath-link,/home/=
ad/mbutsch/4G/tmp/angstrom/staging/i686-angstrom-linux/usr/lib -Wl,-O1 -Wl,=
--hash-style=3Dgnu) works... configure: error: installation or configuratio=
n problem: host compiler gcc cannot create executables.
*** Fix above errors and then restart with               "make -f client.mk=
 build"
make: *** [configure] Error 1
FATAL: oe_runmake failed
-----------


In looking at the log.do_configure file, the invocation for the configure i=
s:



NOTE: make -f client.mk CONFIGURE_ARGS=3D --build=3Dx86_64-linux --host=3Dx=
86_64-linux  --target=3Di686-linux  configure



It looks strange to me that the 'build' and 'host' are the same. The recipe=
 for minimo_cvs has the line:



EXTRA_OECONF +=3D "--build=3D${BUILD_SYS} --host=3D${BUILD_SYS} --target=3D=
${TARGET_SYS} "



And uses EXTRA_OECONF when invoking oe_runmake. It seems to me that '--host=
' should specify ${HOST_SYS} and if I make that edit, it does successfully =
build.





For my education, what are 'build', 'host' and 'target' referring to in thi=
s case?



-     'target' should be the target that is being built for

-     'build' should be the machine that is doing the building

-     'host' not sure?


Mark

