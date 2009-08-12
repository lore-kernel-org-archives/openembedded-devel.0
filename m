Received: from [81.228.11.98] (helo=pne-smtpout1-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Mb9rl-00035W-Q9
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 11:11:29 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout1-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A683C78001984FA for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 10:55:04 +0200
Message-ID: <4A828368.5030100@atmel.com>
Date: Wed, 12 Aug 2009 10:55:04 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: U-Boot not copied into tmp/deploy/glibc/<board>
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
X-List-Received-Date: Wed, 12 Aug 2009 09:11:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Right now, u-boot is built in my private git tree,
when I do bitbake x11-gpe-image,

It is not copied to tmp/deploy/glibc/<board>

If I do
bitbake u-boot, the stuff IS copied.

Anyone can think of a reason for this problem?

I have modified the git tree since the first build
to fix some problems. Can old junk be the trouble?

Result of latest bitbake x11-gpe-image

Start building x11-gpe-image at 10:41:27
/home/ulf/projects/OE_atmel/bitbake/lib/bb/COW.py:29:
DeprecationWarning: the sets module is deprecated
  import types, sets
/home/ulf/projects/OE_atmel/bitbake/lib/bb/COW.py:29:
DeprecationWarning: the sets module is deprecated
  import types, sets
NOTE: Out of date cache found, rebuilding...
NOTE: Handling BitBake files: - (4956/7055) [70 %]NOTE: Angstrom DOES
NOT support bluez-utils because bluez-utils 3.x has been replaced by bluez4
NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x has
been replaced by bluez4
NOTE: Handling BitBake files: \ (4960/7055) [70 %]NOTE: Angstrom DOES
NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
NOTE: Handling BitBake files: - (4969/7055) [70 %]NOTE: Angstrom DOES
NOT support bluez-libs because bluez-libs 3.x has been replaced by bluez4
NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has
been replaced by bluez4
NOTE: Handling BitBake files: | (7055/7055) [100 %]
NOTE: Parsing finished. 0 cached, 6766 parsed, 289 skipped, 0 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 2549 of 5150 (ID: 414,
/home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-version.bb,
do_setscene)
staging-angstrom-version-at91sam9263ek-angstrom-linux-gnueabi -
2009.X-test-20090811-r2 -
NOTE: Running task 3032 of 5150 (ID: 110,
/home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc2.bb,
do_setscene)
Removing package
staging-angstrom-version-at91sam9263ek-angstrom-linux-gnueabi from root...
staging-u-boot-at91sam9263ek-angstrom-linux-gnueabi - 2009.08-rc2-r0 -
Removing package staging-u-boot-at91sam9263ek-angstrom-linux-gnueabi
from root...
NOTE: Running task 5117 of 5150 (ID: 415,
/home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-version.bb,
do_fetch)
NOTE: Running task 5118 of 5150 (ID: 111,
/home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc2.bb,
do_fetch)
NOTE: Running task 5119 of 5150 (ID: 416,
/home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-version.bb,
do_unpack)
NOTE: Unpacking ../openembedded/recipes/angstrom/angstrom-version.bb to
tmp/work/at91sam9263ek-angstrom-linux-gnueabi/angstrom-version-1_2009.X-test-20090812-r2/
NOTE: Running task 5120 of 5150 (ID: 112,
/home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc2.bb,
do_unpack)
NOTE: Unpacking /home/downloads/u-boot-2009.08-rc2.tar.bz2 to
tmp/work/at91sam9263ek-angstrom-linux-gnueabi/u-boot-2009.08-rc2-r1/
NOTE: Running task 5121 of 5150 (ID: 417,
/home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-version.bb,
do_patch)
NOTE: Running task 5122 of 5150 (ID: 418,
/home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-version.bb,
do_configure)
NOTE: Running task 5123 of 5150 (ID: 419,
/home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-version.bb,
do_qa_configure)
NOTE: Running task 5124 of 5150 (ID: 420,
/home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-version.bb,
do_compile)
NOTE: Running task 5125 of 5150 (ID: 421,
/home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-version.bb,
do_install)
NOTE: Running task 5126 of 5150 (ID: 424,
/home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-version.bb,
do_package)
NOTE: Running task 5127 of 5150 (ID: 422,
/home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-version.bb,
do_populate_staging)
NOTE: Running task 5128 of 5150 (ID: 113,
/home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc2.bb,
do_patch)
NOTE: Applying patch 'u-boot-2009.08-rc1-001-nosoftfloat.patch'
(../openembedded/recipes/u-boot/u-boot-2009.08-rc2/u-boot-2009.08-rc1-001-nosoftfloat.patch)
NOTE: Applying patch 'u-boot-2009.08-rc1-007-tools.patch'
(../openembedded/recipes/u-boot/u-boot-2009.08-rc2/u-boot-2009.08-rc1-007-tools.patch)
NOTE: Applying patch 'u-boot-2009.08-rc1-008-Makefile.patch'
(../openembedded/recipes/u-boot/u-boot-2009.08-rc2/u-boot-2009.08-rc1-008-Makefile.patch)
NOTE: Applying patch 'u-boot-2009.08-rc1-009-factory.patch'
(../openembedded/recipes/u-boot/u-boot-2009.08-rc2/u-boot-2009.08-rc1-009-factory.patch)
NOTE: Applying patch 'u-boot-2009.08-rc1-010-coloured_led.patch'
(../openembedded/recipes/u-boot/u-boot-2009.08-rc2/u-boot-2009.08-rc1-010-coloured_led.patch)
NOTE: Applying patch 'u-boot-2009.08-rc1-012-ethinit.patch'
(../openembedded/recipes/u-boot/u-boot-2009.08-rc2/u-boot-2009.08-rc1-012-ethinit.patch)
NOTE: Applying patch 'u-boot-2009.08-rc1-013-configs.patch'
(../openembedded/recipes/u-boot/u-boot-2009.08-rc2/u-boot-2009.08-rc1-013-configs.patch)
NOTE: Applying patch 'u-boot-2009.08-rc1-014-no-weak-inlines.patch'
(../openembedded/recipes/u-boot/u-boot-2009.08-rc2/u-boot-2009.08-rc1-014-no-weak-inlines.patch)
NOTE: Applying patch 'u-boot-2009.08-rc1-015-large-u-boot.patch'
(../openembedded/recipes/u-boot/u-boot-2009.08-rc2/u-boot-2009.08-rc1-015-large-u-boot.patch)
NOTE: Applying patch 'u-boot-2009.08-rc1-add-raise.patch'
(../openembedded/recipes/u-boot/u-boot-2009.08-rc2/u-boot-2009.08-rc1-add-raise.patch)
NOTE: Applying patch 'u-boot-2009.08-rc1-eabi.patch'
(../openembedded/recipes/u-boot/u-boot-2009.08-rc2/u-boot-2009.08-rc1-eabi.patch)
NOTE: Running task 5129 of 5150 (ID: 114,
/home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc2.bb,
do_configure)
NOTE: Running task 5130 of 5150 (ID: 115,
/home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc2.bb,
do_qa_configure)
NOTE: Running task 5131 of 5150 (ID: 116,
/home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc2.bb,
do_compile)
NOTE: Running task 5134 of 5150 (ID: 426,
/home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-version.bb,
do_package_write_ipk)
Packaged contents of angstrom-version into
/home/ulf/projects/OE_atmel/build-sam9263ek/tmp/deploy/glibc/ipk/at91sam9263ek/angstrom-version_2009.X-test-20090812-r2.3_at91sam9263ek.ipk
NOTE: Running task 5139 of 5150 (ID: 423,
/home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-version.bb,
do_package_write)
NOTE: Running task 5140 of 5150 (ID: 425,
/home/ulf/projects/OE_atmel/openembedded/recipes/angstrom/angstrom-version.bb,
do_package_stage)
NOTE: Running task 5141 of 5150 (ID: 117,
/home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc2.bb,
do_install)
NOTE: Running task 5142 of 5150 (ID: 120,
/home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc2.bb,
do_package)
NOTE: Running task 5143 of 5150 (ID: 118,
/home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc2.bb,
do_populate_staging)
NOTE: Running task 5144 of 5150 (ID: 122,
/home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc2.bb,
do_package_write_ipk)
Packaged contents of u-boot-dbg into
/home/ulf/projects/OE_atmel/build-sam9263ek/tmp/deploy/glibc/ipk/at91sam9263ek/u-boot-dbg_2009.08-rc2-r1.3_at91sam9263ek.ipk
NOTE: Not creating empty archive for u-boot-2009.08-rc2-r1.3
NOTE: Not creating empty archive for u-boot-doc-2009.08-rc2-r1.3
Packaged contents of u-boot-dev into
/home/ulf/projects/OE_atmel/build-sam9263ek/tmp/deploy/glibc/ipk/at91sam9263ek/u-boot-dev_2009.08-rc2-r1.3_at91sam9263ek.ipk
NOTE: Not creating empty archive for u-boot-locale-2009.08-rc2-r1.3
NOTE: Running task 5145 of 5150 (ID: 119,
/home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc2.bb,
do_package_write)
NOTE: Running task 5146 of 5150 (ID: 18,
/home/ulf/projects/OE_atmel/openembedded/recipes/images/x11-gpe-image.bb,
do_package_update_index_ipk)
NOTE: Running task 5147 of 5150 (ID: 121,
/home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc2.bb,
do_package_stage)
NOTE: Running task 5149 of 5150 (ID: 10,
/home/ulf/projects/OE_atmel/openembedded/recipes/images/x11-gpe-image.bb,
do_rootfs)
NOTE: Running task 5150 of 5150 (ID: 0,
/home/ulf/projects/OE_atmel/openembedded/recipes/images/x11-gpe-image.bb,
do_build)
NOTE: Tasks Summary: Attempted 5150 tasks of which 5121 didn't need to
be rerun and 0 failed.
.............................................





ulf@grond:~/projects/OE_atmel/build-sam9263ek> bitbake u-boot
/home/ulf/projects/OE_atmel/bitbake/lib/bb/COW.py:29:
DeprecationWarning: the sets module is deprecated
  import types, sets
/home/ulf/projects/OE_atmel/bitbake/lib/bb/COW.py:29:
DeprecationWarning: the sets module is deprecated
  import types, sets
NOTE: Handling BitBake files: | (7055/7055) [100 %]
NOTE: Parsing finished. 6766 cached, 0 parsed, 289 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 445 of 449 (ID: 15,
/home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc2.bb,
do_package_stage_all)
NOTE: Running task 446 of 449 (ID: 14,
/home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc2.bb,
do_distribute_sources)
NOTE: Running task 447 of 449 (ID: 11,
/home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc2.bb,
do_qa_staging)
NOTE: Running task 448 of 449 (ID: 10,
/home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc2.bb,
do_deploy)
NOTE: Running task 449 of 449 (ID: 0,
/home/ulf/projects/OE_atmel/openembedded/recipes/u-boot/u-boot_2009.08-rc2.bb,
do_build)
NOTE: Tasks Summary: Attempted 449 tasks of which 444 didn't need to be
rerun and 0 failed.


-- 
Best Regards
Ulf Samuelsson



