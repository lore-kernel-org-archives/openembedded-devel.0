Received: from [128.210.5.246] (helo=mailhub246.itcs.purdue.edu)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <cndougla@purdue.edu>) id 1Gs7s8-0003sn-Su
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Dec 2006 02:16:25 +0100
Received: from [192.168.1.103] ([74.140.123.144]) (authenticated bits=0)
	by mailhub246.itcs.purdue.edu (8.13.7/8.13.7/external-auth-smtp) with
	ESMTP id kB71FLRK030033
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Dec 2006 20:15:22 -0500
Mime-Version: 1.0 (Apple Message framework v752.3)
Message-Id: <C45FD47D-6063-4EA5-888D-80ACBBD641D9@purdue.edu>
To: openembedded-devel@lists.openembedded.org
From: Chase Douglas <cndougla@purdue.edu>
Date: Wed, 6 Dec 2006 20:14:40 -0500
X-Mailer: Apple Mail (2.752.3)
X-PMX-Version: 5.2.1.279297
X-PerlMx-Virus-Scanned: Yes
X-Mailman-Approved-At: Fri, 08 Dec 2006 10:05:50 +0100
Subject: Staging does not include all packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Dec 2006 01:16:25 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed

I'm trying to create an image, yet the resulting tarball is missing  
many things such as busybox and alsamixer. The image bb file is:

IMAGE_BASENAME="9XM"
IMAGE_LINGUAS=""
LICENSE="GPL"
IPKG_INSTALL="task-9xm"
RDEPENDS="${IPKG_INSTALL}"

inherit image_ipk

The task file is:

DESCRIPTION = "9XM Root Filesystem"
PR = "r1"

PACKAGES = "task-9xm"

ALLOW_EMPTY = "1"

PACKAGE_ARCH = "${MACHINE_ARCH}"

MACHINE_FEATURES ?= "kernel26"
DISTRO_FEATURES ?= ""
DISTRO_CORE_PACKAGE ?= "task-base-core-default"

DISTRO_EXTRA_RDEPENDS ?= ""
DISTRO_EXTRA_RRECOMMENDS ?= ""
MACHINE_EXTRA_RDEPENDS ?= ""
MACHINE_EXTRA_RRECOMMENDS ?= ""
MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""

RDEPENDS = "\
     ${DISTRO_CORE_PACKAGE} \
     kernel \
     udev \
     sysfsutils \
     module-init-tools \
     apm \
     apmd \
     hdparm \
     e2fsprogs \
     e2fsprogs-e2fsck \
     e2fsprogs-mke2fs \
     alsa-utils-alsactl \
     alsa-utils-alsamixer \
     alsa-conf \
     irda-utils \
     usbutils \
     dropbear \
     base-files \
     base-passwd \
     busybox \
     initscripts \
     netbase \
     sysvinit \
     sysvinit-pidof \
     tinylogin \
     modutils-initscripts \
     fuser \
     setserial \
     wireless-tools \
     wpa-supplicant \
     portmap \
     lrzsz \
     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS} \
     ${MACHINE_EXTRA_RDEPENDS} \
     ${DISTRO_EXTRA_RDEPENDS}"

RRECOMMENDS = "\
     ${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS} \
     ${MACHINE_EXTRA_RRECOMMENDS} \
     ${DISTRO_EXTRA_RRECOMMENDS}"

The bitbake version is 1.62. What could be going wrong?

Thanks,
Chase Douglas


