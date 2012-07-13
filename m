Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SpmVS-0008Jn-Nu
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 22:30:31 +0200
Received: by pbbrq2 with SMTP id rq2so5567658pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 13:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:cc:to:mime-version
	:x-mailer; bh=qBhzT+NBRmVr8/Ks9VC2t5AAXbKJOdcQQw2BSl1aEL0=;
	b=v0/sfAR4H1BAOhndNekfMC/BzqFh1stmXsxfmxma81NCg68FdgA9N4GWH1hC5HAkCJ
	Bza06uVnAubCEplnvHbH0Z9Mc9hKf66OiiEbHmDprVqUXZAEfLqyuClqZI0JVmTZZ1I4
	XgW7Om6VB/UgjnC5TemUUwCpsp3Ks19FCgnRaW1CMyaMH8BfFFUcECPc7Zai3988v2Hz
	yBwopkV7UzTlWMgmD9f8tOO18og1FzTgY01OIv3J+euOp1ch/vP3DQlIUy0O/lIRYQAe
	AoRSsjZCQqOGxkncfWiACoN17I1xyr/dFkeNw+rwAX4DImRQQgoomRGy1g1Aw2caHbn8
	Fe2Q==
Received: by 10.68.194.201 with SMTP id hy9mr6214665pbc.69.1342210754851;
	Fri, 13 Jul 2012 13:19:14 -0700 (PDT)
Received: from [192.168.1.101] ([94.205.108.162])
	by mx.google.com with ESMTPS id gh9sm6615320pbc.20.2012.07.13.13.19.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 13:19:14 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Sat, 14 Jul 2012 00:19:07 +0400
Message-Id: <C7BE51C8-1205-425D-A7CA-0E1B7059CC9D@gmail.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: linux-xilinx: How to download a ramdisk image and copy it to arch/powerpc/boot folder
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
X-List-Received-Date: Fri, 13 Jul 2012 20:30:31 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
     I'm trying to create a linux-xilinx-2.6.38 recipe, that will =
download a ramdisk image from =
http://wiki.xilinx.com/local--files/powerpc-linux/ramdisk.image.gz
and copy it to the arch/powerpc/boot folder.

How can I modify the following recipe to execute these commands?

inherit kernel xilinx-kernel xilinx-utils
require recipes-kernel/linux/linux-xilinx.inc

DEFAULT_PREFERENCE =3D "1"

KBRANCH =3D "master"

LINUX_VERSION ?=3D "2.6.38"
SRCREV_pn-${PN} =3D "c965eb91f22d1ca04b141957bccd1c02abc5c6f7"
KTAG_virtex5 =3D "xilinx_v2.6.38"

PR =3D "r00"
PV =3D "${LINUX_VERSION}"

SRC_URI =3D =
"git://git.xilinx.com/linux-xlnx.git;protocol=3Dgit;tag=3D${KTAG} \
           =
file://0001-virtex-ml507-Update-device-tree-to-version-generated-by-Xilinx=
-EDK-13.1.patch \
           =
file://0002-Makefile-Disable-warnings-being-treated-as-errors.patch \
           file://defconfig"

XILINX_BOARD ?=3D "${@find_board(bb.data.getVar('XILINX_BSP_PATH', d, =
1), d)}"
KERNEL_DEVICETREE =3D "${@device_tree(bb.data.getVar('TARGET_ARCH', d, =
1), d)}"
KERNEL_DEVICETREE_microblazeel =3D =
"${@device_tree(bb.data.getVar('TARGET_CPU', d, 1), d)}"

#KERNEL_DEVICETREE =3D "virtex440-ml507.dts"

COMPATIBLE_MACHINE =3D =
"(virtex4|virtex5|virtex5mb|spartan6-sp605|spartan6-lx9mb)"

Best regards,

Elvis



