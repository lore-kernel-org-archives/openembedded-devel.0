Received: from [81.228.11.159] (helo=pne-smtpout2-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MenKW-0003UP-QC
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 11:56:12 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout2-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A2D61FD006581C7 for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 11:38:41 +0200
Message-ID: <4A8FBCA1.9050601@atmel.com>
Date: Sat, 22 Aug 2009 11:38:41 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Cleaning up the "linux" directory
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
X-List-Received-Date: Sat, 22 Aug 2009 09:56:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

As everyone knows, the kernel directory is a mess:
I have been thinking about what to do about this,
and with the ability to include files in subdirectories,
I think I have found a nice solution.

New variables

CPU_FAMILY
KERNEL_MAJOR
KERNEL_MINOR

For future kernels,

Did not try this, yet but this looks promising...

-----------------------------------------------------------------------------
# linux-2.6.30.bb (replacing the old one)
# New style recipe for kernel builds
# Hopefully no need to have custom recipies in the top directory
# Mark archs/machines that this kernel supports
DEFAULT_PREFERENCE = "-1"
require linux-v2.inc
PR = "r0"
# Yes, that's all!

-----------------------------------------------------------------------------
# "linux-v2.inc" Contains
require linux.inc

CPU_FAMILY ?= "dummy-arch"
KERNEL_MAJOR  = "${PV}"
KERNEL_DIR = "${FILE_DIRNAME}/linux-${KERNEL_MAJOR}"
require ${KERNEL_DIR}/version.inc

KERNEL_MINOR_DIR = ${KERNEL_DIR}/${KERNEL_VERSION}
KERNEL_CPU_FAMILY_DIR=${KERNEL_DIR}/${CPU_FAMILY}

S = "${WORKDIR}/linux-${KERNEL_MAJOR}"

KERNEL_SOURCE_DIR="${KERNELORG_MIRROR}/pub/linux/kernel/v2.6"
SRC_URI = "${KERNEL_SOURCE_DIR}/linux-${KERNEL_MAJOR}.tar.bz2 "
MINOR_PATCH=${KERNEL_SOURCE_DIR}/patch-${KERNEL_MAJOR}.${KERNEL_MINOR}.bz2

# Include ${MINOR_PATCH}
# Include any other common patches for this minor version
require	${KERNEL_MINOR_DIR}/patches/SRC_URI_append.inc
# Any customizations for this minor version
require	${KERNEL_MINOR_DIR}/linux-${KERNEL_VERSION}.inc

# Customize for the CPU_FAMILY
# Note that this can contain further includes for minor versions
require	${KERNEL_CPU_FAMILY_DIR}/patches/SRC_URI_append.inc
require	${KERNEL_CPU_FAMILY_DIR}/common/linux-${KERNEL_VERSION}.inc
include
${KERNEL_CPU_FAMILY_DIR}/boards/${MACHINE}/linux-${KERNEL_VERSION}.inc
#
-----------------------------------------------------------------------------
# "${KERNEL_DIR}/version.inc" contains
KERNEL_LATEST_MINOR = "5"
KERNEL_MINOR ?= "${KERNEL_LATEST_MINOR}"
KERNEL_VERSION = "${KERNEL_MAJOR}.${KERNEL_MINOR}"



-----------------------------------------------------------------------------
# Possible contents of ${KERNEL_CPU_FAMILY_DIR}/patches/SRC_URI_append.inc
require {KERNEL_CPU_FAMILY_DIR}/patches/${KERNEL_VERSION}/SRC_URI_append.inc

#
-- 
Best Regards
Ulf Samuelsson



