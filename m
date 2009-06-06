Received: from [17.148.16.93] (helo=asmtpout018.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MCqRC-0008Pk-7j
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Jun 2009 09:35:34 +0200
MIME-version: 1.0
Received: from [87.201.169.139] by asmtp018.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KKT00BPG3BI1270@asmtp018.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	06 Jun 2009 00:26:17 -0700 (PDT)
Message-id: <046B8D02-FF75-4D9E-BBB9-2D2DF22E37BC@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Date: Sat, 06 Jun 2009 11:26:12 +0400
X-Mailer: Apple Mail (2.935.3)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Where do the extra #include <mach/board-overo.h> come from in linux-omap3-2.6.29.bb recipe?
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
X-List-Received-Date: Sat, 06 Jun 2009 07:35:34 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi,
	I am using the overo-oe repository.

I have a linux-omap3-2.6.29.bb recipe that pulls in the sources from  
the master branch of the linux-omap-2.6 repository, as follows:

SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux- 
omap-2.6.git;branch=master;protocol=git \
	   file://defconfig \

If I run the bitbake linux-omap3-2.6.29 command in the /tool/overo-oe/ 
tmp/work/overo-angstrom-linux-gnueabi/linux-omap3-2.6.29-r41/git/arch/ 
arm/mach-omap2/board-overo.c file,

on line 41, there is a #include <mach/board-overo.h> entry as shown  
below.

39 #include <asm/mach/map.h>
40
41 #include <mach/board-overo.h>
42 #include <mach/board.h>


Now, I have in a separate folder, cloned the same repository using the  
following command:

$ git clone git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux- 
omap-2.6.git

However, when I look at arch/arm/mach-omap2/board-overo.c file, the  
#include <mach/board-overo.h> entry is missing

39 #include <asm/mach/map.h>
40
41 #include <mach/board.h>

What task is contributing to this extra code, when I run the bitbake  
recipe, compared to the original linux-omap-2.6 master branch?

I'm trying to patch in Tomi's DSS2 and Kevin's PM patches, for the  
Overo by modifying the linux-omap3-2.6.29.bb recipe. I'm getting stuck  
because of this apparent difference, and cannot make modifications to  
Tomi's patch files without first being able to manually fast forward  
to the appropriate state.

Best regards,

Elvis


# Linux OMAP3 2.6.29 recipie
DEFAULT_PREFERENCE = 1

# Required packages
require linux.inc

# Package information
DESCRIPTION = "Linux kernel for OMAP3 processors"
KERNEL_IMAGETYPE = "uImage"

COMPATIBLE_MACHINE = "beagleboard|omap3evm|overo"

SRCREV = "90e758af52ba803cba233fabee81176d99589f09"

PN = "linux-omap3"
PV = "2.6.29"
PR = "r41"

SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux- 
omap-2.6.git;branch=master;protocol=git \
	   file://defconfig \
           "

SRC_URI_append = " \
            "


SRC_URI_append_beagleboard = " \
            file://beagle-ehci.patch;patch=1 \
           "

SRC_URI_append_omap3evm = " \
           "

SRC_URI_append_overo = " \
           "


S = "${WORKDIR}/git"



