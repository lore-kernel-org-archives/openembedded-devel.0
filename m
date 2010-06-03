Received: from smtp7.myhsphere.biz ([204.10.105.69] helo=mail9.myhsphere.biz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <balakrishnan@e-consystems.com>) id 1OK6sP-00032b-Td
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 11:38:15 +0200
Received: (qmail 7714 invoked by uid 399); 3 Jun 2010 09:33:53 -0000
Received: from dsl-tn-dynamic-104.231.164.122.airtelbroadband.in (HELO
	?192.168.6.196?) (balakrishnan@e-consystems.com@122.164.231.104)
	by mail9.myhsphere.biz with ESMTPAM; 3 Jun 2010 09:33:53 -0000
X-Originating-IP: 122.164.231.104
X-Sender: balakrishnan@e-consystems.com
From: balakrishnan <balakrishnan@e-consystems.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 03 Jun 2010 15:03:51 +0530
Message-Id: <1275557631.3916.17.camel@balakrishnan-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-SA-Exim-Connect-IP: 204.10.105.69
X-SA-Exim-Mail-From: balakrishnan@e-consystems.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: linux_2.6.34 staging error
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
X-List-Received-Date: Thu, 03 Jun 2010 09:38:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,
  I am trying to build linux_2.6.34 kernel for my development board on
stable/2009 branch. So that I have added below recipe to accomplish this
stuff. During bitbake I got staging error, can I have solution for
this?.

Error:
/**********************************************************************************************************************/
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it
to increase performance.
NOTE: Handling BitBake files: \ (6707/6707) [100 %]
NOTE: Parsing finished. 6405 cached, 0 parsed, 302 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 296 of 546 (ID:
2, /home/balakrishnan/econsystems/projects/openembedded/recipes/linux/linux_2.6.34.bb, do_fetch)
NOTE: Running task 297 of 546 (ID:
3, /home/balakrishnan/econsystems/projects/openembedded/recipes/linux/linux_2.6.34.bb, do_unpack)
NOTE: Unpacking /media/disk/beagle-oe/tmp/downloads/linux-2.6.34.tar.bz2
to ../tmp/work/alioth-angstrom-linux-gnueabi/linux-2.6.34-r1/
NOTE: Unpacking recipes/linux/linux-2.6.34/alioth/defconfig
to ../tmp/work/alioth-angstrom-linux-gnueabi/linux-2.6.34-r1/
NOTE: Running task 320 of 546 (ID:
4, /home/balakrishnan/econsystems/projects/openembedded/recipes/linux/linux_2.6.34.bb, do_patch)
NOTE: Applying patch
'alioth_linux-2.6.34.patch' (recipes/linux/linux-2.6.34/alioth/alioth_linux-2.6.34.patch)
NOTE: Running task 321 of 546 (ID:
5, /home/balakrishnan/econsystems/projects/openembedded/recipes/linux/linux_2.6.34.bb, do_configure)
NOTE: Running task 339 of 546 (ID:
6, /home/balakrishnan/econsystems/projects/openembedded/recipes/linux/linux_2.6.34.bb, do_qa_configure)
NOTE: Running task 340 of 546 (ID:
7, /home/balakrishnan/econsystems/projects/openembedded/recipes/linux/linux_2.6.34.bb, do_compile)
NOTE: Running task 362 of 546 (ID:
11, /home/balakrishnan/econsystems/projects/openembedded/recipes/linux/linux_2.6.34.bb, do_sizecheck)
NOTE: Running task 363 of 546 (ID:
10, /home/balakrishnan/econsystems/projects/openembedded/recipes/linux/linux_2.6.34.bb, do_uboot_mkimage)
NOTE: Running task 364 of 546 (ID:
8, /home/balakrishnan/econsystems/projects/openembedded/recipes/linux/linux_2.6.34.bb, do_install)
NOTE: Running task 378 of 546 (ID:
19, /home/balakrishnan/econsystems/projects/openembedded/recipes/linux/linux_2.6.34.bb, do_deploy)
NOTE: Running task 390 of 546 (ID:
18, /home/balakrishnan/econsystems/projects/openembedded/recipes/linux/linux_2.6.34.bb, do_devicetree_image)
NOTE: Running task 391 of 546 (ID:
14, /home/balakrishnan/econsystems/projects/openembedded/recipes/linux/linux_2.6.34.bb, do_package)
sh: arm-angstrom-linux-gnueabi-depmod-: command not found
NOTE: the following files were installed but not shipped in any package:
NOTE:   /lib/modules/2.6.34/modules.order
NOTE:   /lib/modules/2.6.34/modules.builtin
NOTE: Running task 396 of 546 (ID:
9, /home/balakrishnan/econsystems/projects/openembedded/recipes/linux/linux_2.6.34.bb, do_populate_staging)
ERROR: function do_stage failed
ERROR: see log
in /home/balakrishnan/econsystems/projects/tmp/work/alioth-angstrom-linux-gnueabi/linux-2.6.34-r1/temp/log.do_stage.4058
NOTE: Task
failed: /home/balakrishnan/econsystems/projects/tmp/work/alioth-angstrom-linux-gnueabi/linux-2.6.34-r1/temp/log.do_stage.4058
ERROR: TaskFailed event exception, aborting
ERROR: Build
of /home/balakrishnan/econsystems/projects/openembedded/recipes/linux/linux_2.6.34.bb do_populate_staging failed
ERROR: Task 9
(/home/balakrishnan/econsystems/projects/openembedded/recipes/linux/linux_2.6.34.bb, do_populate_staging) failed
NOTE: Tasks Summary: Attempted 395 tasks of which 383 didn't need to be
rerun and 1 failed.
ERROR:
'/home/balakrishnan/econsystems/projects/openembedded/recipes/linux/linux_2.6.34.bb' failed
/*******************************************************************************************************************************************/

../openembedded/recipes/linux/linux_2.6.34.bb
/****************************************************************************************/
require linux.inc

PR="r1"

# Mark archs/machines that this kernel supports
DEFAULT_PREFERENCE = "-1"
DEFAULT_PREFERENCE_alioth = "1"

SRC_URI =
"${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/${P}.tar.bz2;name=kernel \
           file://defconfig"

SRC_URI_append_alioth = "\
	file://alioth_linux-2.6.34.patch;patch=1 \
	"
/****************************************************************************************/


With Regards
J.Balakrishnan    


