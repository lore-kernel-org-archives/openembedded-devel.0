Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SpmgU-0000Gy-PP
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 22:41:55 +0200
Received: by ghbz2 with SMTP id z2so3729067ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 13:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:cc:to:mime-version
	:x-mailer; bh=twc+2mhSVdHRAE/cQRsKbztfEmvxf2Oihriy05z9AsE=;
	b=C+CTsjviD+mBaV2fPw6JUmXNY0QmLX1MNZDUZ81x0ubYu9yyotJBwys7z3//lPAjqA
	zAGKBO5LiUXH/5OsmjHOpzeYscpW0kODpfQTUXgFLJ3StxJdjJ7dnHgnqnUJWnJXHkyR
	elQnLcxUxJFn6p/Oh8rnlsK5yopE539yQKbCNCV8kKAzmKP+zDmsKC9uNoXGom0TlO92
	lK8gM1fnDReITHRXfe+1EMEwoR8Ou4XIZhYbxMY596T17nxJCVdzn0zZO33Cp3c81VHO
	odrIpmt/ccjOpwufKGEveMzjEmbetf8Ab87JC8sND5HuSansjZsIWHJuX/a8vDaroMdk
	8chg==
Received: by 10.66.89.170 with SMTP id bp10mr4767276pab.12.1342211439190;
	Fri, 13 Jul 2012 13:30:39 -0700 (PDT)
Received: from [192.168.1.101] ([94.205.108.162])
	by mx.google.com with ESMTPS id rd7sm6620816pbc.70.2012.07.13.13.30.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 13:30:38 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Sat, 14 Jul 2012 00:30:33 +0400
Message-Id: <B6EAD6B8-1E73-484C-AF55-B1B07DB91944@gmail.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: meta-xilinx: zImage build error: "mkimage" command not found - U-Boot images will not be built
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
X-List-Received-Date: Fri, 13 Jul 2012 20:41:55 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
       I'm try to build a zImage. I have been successful at building and =
running the kernel, outside of yocto, and running it on the Xilinx ML507 =
development board.

I'm in the process of creating a linux-xilinx-2.6.38 recipe, and I'm =
stuck at the following error:

NOTE: package linux-xilinx-2.6.38-r00: task do_compile: Started
ERROR: Function failed: do_compile (see =
/tool/yocto/poky/build/tmp/work/virtex5-poky-linux/linux-xilinx-2.6.38-r00=
/temp/log.do_compile.4655 for further information)
ERROR: Logfile of failure stored in: =
/tool/yocto/poky/build/tmp/work/virtex5-poky-linux/linux-xilinx-2.6.38-r00=
/temp/log.do_compile.4655
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 6 include/linux/version.h CC=3Dpowerpc-poky-linux-gcc  =
--sysroot=3D/tool/yocto/poky/build/tmp/sysroots/virtex5 =
LD=3Dpowerpc-poky-linux-ld  =
--sysroot=3D/tool/yocto/poky/build/tmp/sysroots/virtex5
|   CHK     include/linux/version.h
| NOTE: make -j 6 zImage CC=3Dpowerpc-poky-linux-gcc  =
--sysroot=3D/tool/yocto/poky/build/tmp/sysroots/virtex5 =
LD=3Dpowerpc-poky-linux-ld  =
--sysroot=3D/tool/yocto/poky/build/tmp/sysroots/virtex5
|   CHK     include/linux/version.h
|   CHK     include/generated/utsrelease.h
|   CALL    scripts/checksyscalls.sh
|   CHK     include/generated/compile.h
|   CALL    arch/powerpc/kernel/systbl_chk.sh
|   DTC     arch/powerpc/boot/virtex440-ml507.dtb
| DTC: dts->dtb  on file "arch/powerpc/boot/dts/virtex440-ml507.dts"
|   WRAP    arch/powerpc/boot/uImage
|   WRAP    arch/powerpc/boot/simpleImage.virtex440-ml507
|   WRAP    arch/powerpc/boot/simpleImage.initrd.virtex440-ml507
| "mkimage" command not found - U-Boot images will not be built
| make[1]: *** [arch/powerpc/boot/uImage] Error 1
| make[1]: *** Waiting for unfinished jobs....
| rm arch/powerpc/boot/virtex440-ml507.dtb
| make: *** [zImage] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see =
/tool/yocto/poky/build/tmp/work/virtex5-poky-linux/linux-xilinx-2.6.38-r00=
/temp/log.do_compile.4655 for further information)
NOTE: package linux-xilinx-2.6.38-r00: task do_compile: Failed
ERROR: Task 6 =
(/tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_2.6.38.bb, =
do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 990 tasks of which 989 didn't need to be =
rerun and 1 failed.

Summary: 1 task failed:
  /tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xilinx_2.6.38.bb, =
do_compile
Summary: There was 1 ERROR message shown, returning a non-zero exit =
code.

My virtex.conf file looks like this at the moment:

KERNEL_IMAGETYPE =3D "zImage"

Best regards,

Elvis Dowson=

