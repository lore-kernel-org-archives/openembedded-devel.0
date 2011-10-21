Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1RHHvp-0000pN-9K
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 18:26:53 +0200
Received: from server ([unknown] [173.74.34.213]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LTF008W59ANQ080@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	21 Oct 2011 10:20:47 -0500 (CDT)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 18CE54; Fri, 21 Oct 2011 10:20:44 -0500
Received: from [192.168.254.252] by rkmorris.us with HTTP; Fri,
	21 Oct 2011 10:20:43 -0500
From: Russell Morris <openembedded@rkmorris.us>
Date: Fri, 21 Oct 2011 10:20:43 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1319210443657408500@rkmorris.us>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 2
Subject: Build Failure - signgp
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
X-List-Received-Date: Fri, 21 Oct 2011 16:26:53 -0000
Content-type: text/plain
Content-transfer-encoding: quoted-printable
Content-disposition: inline

Hi,

I am trying to build console-image for an am3517-evm (machine), but x-load =
fails due to issues with signgp. Has anyone else been able to build this su=
ccessfully?

Thanks!

... Russell


PS: Here is the failure log,

OE Build Configuration:
BB_VERSION        =3D "1.13.3"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "am3517-evm"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "v2011.10-core"
TUNE_FEATURES     =3D "armv7a vfp neon cortexa8"
TARGET_FPU        =3D "vfp-neon"
meta-angstrom     =3D "master:3dc02ecc7ee7d9e03b03025ddf4436f9ee8029fb"
meta-oe          =20
meta-efl         =20
meta-gpe         =20
meta-gnome       =20
meta-xfce         =3D "master:0368dfd5d8285fe31c853097846e8a6822c7cda0"
meta-ti           =3D "master:fa296c64e42de57ac8df8fb7b9c30e393ed71ce9"
meta-ettus        =3D "master:617506b5cfd2b8325d85f0dcba0232c3f796d044"
meta-efikamx      =3D "master:2ef47fdd4e8232d766c0c63d9427253ee56e31d0"
meta-nslu2        =3D "master:9080394ae0a040dd7b05ac49f9480e4d71631b55"
meta-htc         =20
meta-nokia       =20
meta-openmoko    =20
meta-palm         =3D "master:fbd6e9e8517e7ec58ad36474bd7fa01275e159f1"
meta-sugarbay    =20
meta-crownbay    =20
meta-emenlow     =20
meta-fishriver   =20
meta-jasperforest=20
meta-n450         =3D "master:42fcbb128c5fe812068bb86934ab31ac92fd9f83"
meta              =3D "master:99da9a4e65f9dffb04efc3ad60125194c476d6b3"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Running task 944 of 957 (ID: 4, /mnt/oe/setup-scripts/sources/meta-ti=
/recipes-bsp/x-load/signgp.bb, do_fetch)
NOTE: package signgp-1.0-r0: task do_fetch: Started
NOTE: package signgp-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 945 of 957 (ID: 0, /mnt/oe/setup-scripts/sources/meta-ti=
/recipes-bsp/x-load/signgp.bb, do_unpack)
NOTE: package signgp-1.0-r0: task do_unpack: Started
NOTE: package signgp-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 946 of 957 (ID: 1, /mnt/oe/setup-scripts/sources/meta-ti=
/recipes-bsp/x-load/signgp.bb, do_patch)
NOTE: package signgp-1.0-r0: task do_patch: Started
NOTE: package signgp-1.0-r0: task do_patch: Succeeded
NOTE: Running task 947 of 957 (ID: 6, /mnt/oe/setup-scripts/sources/meta-ti=
/recipes-bsp/x-load/signgp.bb, do_configure)
NOTE: Running task 948 of 957 (ID: 12, /mnt/oe/setup-scripts/sources/meta-t=
i/recipes-bsp/x-load/signgp.bb, do_populate_lic)
NOTE: package signgp-1.0-r0: task do_configure: Started
ERROR: Function 'signgp: LIC_FILES_CHKSUM points to an invalid file: /mnt/o=
e/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux=
-gnueabi/signgp-1.0-r0/signgp-1.0/signGP.c' failed
ERROR: Logfile of failure stored in: /mnt/oe/setup-scripts/build/tmp-angstr=
om_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/signgp-1.0-r0/temp/log.=
do_configure.28702
Log data follows:
| + cd /mnt/oe/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-a=
ngstrom-linux-gnueabi/signgp-1.0-r0/signgp-1.0
| + do_configure
| + base_do_configure
| + :
| NOTE: Checking autotools environment for common misconfiguration
| ERROR: Function 'signgp: LIC_FILES_CHKSUM points to an invalid file: /mnt=
/oe/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-lin=
ux-gnueabi/signgp-1.0-r0/signgp-1.0/signGP.c' failed
NOTE: package signgp-1.0-r0: task do_configure: Failed
NOTE: package signgp-1.0-r0: task do_populate_lic: Started
ERROR: Task 6 (/mnt/oe/setup-scripts/sources/meta-ti/recipes-bsp/x-load/sig=
ngp.bb, do_configure) failed with exit code '1'
Waiting for 1 active tasks to finish:
0: signgp-1.0-r0 do_populate_lic (pid 28703)
WARNING: /mnt/oe/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/armv7a=
-angstrom-linux-gnueabi/signgp-1.0-r0/signgp-1.0/signGP.c could not be copi=
ed for some reason. It may not exist. WARN for now.
WARNING: signgp: No generic license file exists for: NewBSD at /mnt/oe/setu=
p-scripts/sources/openembedded-core/meta/files/common-licenses
WARNING: signgp: There is also no SPDXLICENSEMAP for this license type: New=
BSD at /mnt/oe/setup-scripts/sources/openembedded-core/meta/files/common-licenses
NOTE: package signgp-1.0-r0: task do_populate_lic: Succeeded
ERROR: '/mnt/oe/setup-scripts/sources/meta-ti/recipes-bsp/x-load/signgp.bb'=
 failed


