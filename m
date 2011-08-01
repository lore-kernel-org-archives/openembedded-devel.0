Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1QnpLt-0002qt-4e
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 12:04:01 +0200
Received: from nvs0066 ([10.91.8.1]) by smtp.nedap.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 1 Aug 2011 11:59:38 +0200
X-TM-IMSS-Message-ID: <61b72c75000290a3@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 61b72c75000290a3 ;
	Mon, 1 Aug 2011 11:58:38 +0200
Message-ID: <4E36790A.4020406@nedap.com>
Date: Mon, 01 Aug 2011 11:59:38 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 01 Aug 2011 09:59:38.0106 (UTC)
	FILETIME=[B9670DA0:01CC5031]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: bblayers and PRINC
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
X-List-Received-Date: Mon, 01 Aug 2011 10:04:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

if created my own udev_151.bbappend to change some of the files in the 
original package:

    THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
    FILESPATHBASE_prepend := "${THISDIR}/${PN}-${PV}:"

    #PRINC = 1
    PR .= ".1"

PRINC doesn't seem to work.
So I tried to fool around with PR and PR_append; It works ok with my 
other bbappend recipes.
bitbake base-image fails!
If I look at the udev files/directories created I see ipk's without '.1' 
and 2 directories: 1 with and 1 without '.1'
(I removed everything before)

    build/tmp-angstrom_2008_1/deploy/glibc/ipk/armv5te/udev-dbg_151-r21.6_armv5te.ipk
    build/tmp-angstrom_2008_1/deploy/glibc/ipk/armv5te/udev-dev_151-r21.6_armv5te.ipk

    build/tmp-angstrom_2008_1/work/armv5te-angstrom-linux-gnueabi/udev-151-r21
    build/tmp-angstrom_2008_1/work/armv5te-angstrom-linux-gnueabi/udev-151-r21.1

Without "PR .= .1" I get more files:

    build/tmp-angstrom_2008_1/deploy/glibc/ipk/armv5te/udev_151-r21.6_armv5te.ipk
    build/tmp-angstrom_2008_1/deploy/glibc/ipk/armv5te/udev-dbg_151-r21.6_armv5te.ipk
    build/tmp-angstrom_2008_1/deploy/glibc/ipk/armv5te/udev-dev_151-r21.6_armv5te.ipk
    build/tmp-angstrom_2008_1/deploy/glibc/ipk/armv5te/udev-doc_151-r21.6_armv5te.ipk
    build/tmp-angstrom_2008_1/deploy/glibc/ipk/armv5te/udev-utils_151-r21.6_armv5te.ipk

    build/tmp-angstrom_2008_1/work/armv5te-angstrom-linux-gnueabi/udev-151-r21

Any ideas?

Jaap


Build Configuration:
BB_VERSION        = "1.12.0"
METADATA_BRANCH   = "release-2010.12"
METADATA_REVISION = "dec3967"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "at91sam9263ek"
DISTRO            = "angstrom"
DISTRO_VERSION    = "2010.12"
TARGET_FPU        = "soft"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing RunQueue Tasks
NOTE: Running task 540 of 4063 (ID: 497, 
/oe/sources/openembedded/recipes/udev/udev_151.bb, do_setscene)
NOTE: package udev-151-r21.1: task do_setscene: Started
NOTE: package udev-151-r21.1: task do_setscene: Succeeded
NOTE: Running task 3807 of 4063 (ID: 496, 
/oe/sources/openembedded/recipes/udev/udev_151.bb, do_fetch)
NOTE: package udev-151-r21.1: task do_fetch: Started
NOTE: package udev-151-r21.1: task do_fetch: Succeeded
NOTE: Running task 3808 of 4063 (ID: 489, 
/oe/sources/openembedded/recipes/udev/udev_151.bb, do_unpack)
NOTE: package udev-151-r21.1: task do_unpack: Started
NOTE: package udev-151-r21.1: task do_unpack: Succeeded
NOTE: Running task 3809 of 4063 (ID: 490, 
/oe/sources/openembedded/recipes/udev/udev_151.bb, do_patch)
NOTE: package udev-151-r21.1: task do_patch: Started
NOTE: package udev-151-r21.1: task do_patch: Succeeded
NOTE: Running task 3810 of 4063 (ID: 498, 
/oe/sources/openembedded/recipes/udev/udev_151.bb, do_configure)
NOTE: package udev-151-r21.1: task do_configure: Started
NOTE: package udev-151-r21.1: task do_configure: Succeeded
NOTE: Running task 3811 of 4063 (ID: 499, 
/oe/sources/openembedded/recipes/udev/udev_151.bb, do_qa_configure)
NOTE: package udev-151-r21.1: task do_qa_configure: Started
NOTE: package udev-151-r21.1: task do_qa_configure: Succeeded
NOTE: Running task 3812 of 4063 (ID: 500, 
/oe/sources/openembedded/recipes/udev/udev_151.bb, do_compile)
NOTE: package udev-151-r21.1: task do_compile: Started
NOTE: package udev-151-r21.1: task do_compile: Succeeded
NOTE: Running task 3813 of 4063 (ID: 491, 
/oe/sources/openembedded/recipes/udev/udev_151.bb, do_install)
NOTE: package udev-151-r21.1: task do_install: Started
NOTE: package udev-151-r21.1: task do_install: Succeeded
NOTE: Running task 3814 of 4063 (ID: 492, 
/oe/sources/openembedded/recipes/udev/udev_151.bb, do_populate_sysroot)
NOTE: Running task 3815 of 4063 (ID: 501, 
/oe/sources/openembedded/recipes/udev/udev_151.bb, do_package)
NOTE: package udev-151-r21.1: task do_populate_sysroot: Started
NOTE: package udev-151-r21.1: task do_package: Started
NOTE: package udev-151-r21.1: task do_populate_sysroot: Succeeded
NOTE: Running task 3952 of 4063 (ID: 493, 
/oe/sources/openembedded/recipes/udev/udev_151.bb, do_qa_staging)
NOTE: package udev-151-r21.1: task do_qa_staging: Started
NOTE: package udev-151-r21.1: task do_qa_staging: Succeeded
NOTE: package udev-151-r21.1: task do_package: Succeeded
NOTE: Running task 4002 of 4063 (ID: 502, 
/oe/sources/openembedded/recipes/udev/udev_151.bb, do_package_write_ipk)
NOTE: package udev-151-r21.1: task do_package_write_ipk: Started
Packaged contents of udev-dbg into 
/oe/build/tmp-angstrom_2008_1/deploy/glibc/ipk/armv5te/udev-dbg_151-r21.6_armv5te.ipk
Packaged contents of udev-dev into 
/oe/build/tmp-angstrom_2008_1/deploy/glibc/ipk/armv5te/udev-dev_151-r21.6_armv5te.ipk
NOTE: package udev-151-r21: task do_package_write_ipk: Succeeded
NOTE: Running task 4058 of 4063 (ID: 494, 
/oe/sources/openembedded/recipes/udev/udev_151.bb, do_package_write)
NOTE: Running task 4059 of 4063 (ID: 18, 
/oe/sources/mylayer/recipes/my-tweaks/base-image.bb, 
do_package_update_index_ipk)
NOTE: package base-image-1.0-r0: task do_package_update_index_ipk: Started
NOTE: package udev-151-r21.1: task do_package_write: Started
NOTE: package udev-151-r21.1: task do_package_write: Succeeded
NOTE: Running task 4060 of 4063 (ID: 495, 
/oe/sources/openembedded/recipes/udev/udev_151.bb, do_package_stage)
NOTE: package udev-151-r21.1: task do_package_stage: Started
NOTE: package udev-151-r21: task do_package_stage: Succeeded


