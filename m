Received: from exchsrvr.syntech-fuelmaster.com ([199.44.250.2]
	helo=courier.syntech-fuelmaster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mbutsch@syntech-fuelmaster.com>) id 1Njcir-0000xZ-SY
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 19:09:37 +0100
Received: from Courier.syntech.org ([fe80::f1e9:ec58:2caf:f234]) by
	Courier.syntech.org ([fe80::f1e9:ec58:2caf:f234%14]) with mapi;
	Mon, 22 Feb 2010 13:06:17 -0500
From: Mark Butsch <mbutsch@syntech-fuelmaster.com>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 22 Feb 2010 13:06:14 -0500
Thread-Topic: linux 2.6.33-rc8 do_stage failed
Thread-Index: Acqz6cmz3/fsHrY3RNq++D7eeMxL+g==
Message-ID: <6C2434209962DC46B88345CA85C334A285D6439A81@Courier.syntech.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 199.44.250.2
X-SA-Exim-Mail-From: mbutsch@syntech-fuelmaster.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: linux 2.6.33-rc8 do_stage failed
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
X-List-Received-Date: Mon, 22 Feb 2010 18:09:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I am trying to build the 2.6.33-rc8 linux kernel and keep getting a failure=
 in do_stage. The log file that it says to look in is empty (zero bytes).=20

Any suggestions for troubleshooting/resolving this?

I am using the stable/2009 branch, Angstrom distro and building for an i.MX=
27 board (phytec PCA100). I copied the recipe for linux_2.6.32+2.6.33-rc8.b=
b from the dev branch.

Here is the output from bitbaking:

[mbutsch@tuxoe phytec-mx27]$ bitbake minimal-image
NOTE: Handling BitBake files: | (6709/6709) [100 %]
NOTE: Parsing finished. 6405 cached, 1 parsed, 303 skipped, 0 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 399 of 989 (ID: 539, /home/ad/mbutsch/phytec-mx27/recipe=
s/linux/linux_2.6.32+2.6.33-rc8.bb, do_setscene)
NOTE: Running task 400 of 989 (ID: 540, /home/ad/mbutsch/phytec-mx27/recipe=
s/linux/linux_2.6.32+2.6.33-rc8.bb, do_fetch)
NOTE: Missing checksum
NOTE: linux-2.6.32+2.6.33-rc8: http://kernel.org/pub/linux/kernel/v2.6/linu=
x-2.6.32.tar.bz2 has no entry in conf/checksums.ini, not checking URI
NOTE: Missing checksum
NOTE: linux-2.6.32+2.6.33-rc8: http://kernel.org/pub/linux/kernel/v2.6/test=
ing/patch-2.6.33-rc8.bz2 has no entry in conf/checksums.ini, not checking U=
RI
NOTE: Running task 401 of 989 (ID: 541, /home/ad/mbutsch/phytec-mx27/recipe=
s/linux/linux_2.6.32+2.6.33-rc8.bb, do_unpack)
NOTE: Unpacking /home/oe/sources/linux-2.6.32.tar.bz2 to tmp/angstrom/work/=
phytecmx27-angstrom-linux-gnueabi/linux-2.6.32+2.6.33-rc8-r2/
NOTE: Unpacking /home/oe/sources/patch-2.6.33-rc8.bz2 to tmp/angstrom/work/=
phytecmx27-angstrom-linux-gnueabi/linux-2.6.32+2.6.33-rc8-r2/
NOTE: Unpacking recipes/linux/linux-2.6.32+2.6.33-rc8/defconfig to tmp/angs=
trom/work/phytecmx27-angstrom-linux-gnueabi/linux-2.6.32+2.6.33-rc8-r2/
NOTE: Running task 424 of 989 (ID: 542, /home/ad/mbutsch/phytec-mx27/recipe=
s/linux/linux_2.6.32+2.6.33-rc8.bb, do_patch)
NOTE: Applying patch 'patch-2.6.33-rc8' (tmp/angstrom/work/phytecmx27-angst=
rom-linux-gnueabi/linux-2.6.32+2.6.33-rc8-r2/patch-2.6.33-rc8)
NOTE: Running task 425 of 989 (ID: 543, /home/ad/mbutsch/phytec-mx27/recipe=
s/linux/linux_2.6.32+2.6.33-rc8.bb, do_configure)
NOTE: Running task 438 of 989 (ID: 544, /home/ad/mbutsch/phytec-mx27/recipe=
s/linux/linux_2.6.32+2.6.33-rc8.bb, do_qa_configure)
NOTE: Running task 439 of 989 (ID: 545, /home/ad/mbutsch/phytec-mx27/recipe=
s/linux/linux_2.6.32+2.6.33-rc8.bb, do_compile)
NOTE: Running task 479 of 989 (ID: 549, /home/ad/mbutsch/phytec-mx27/recipe=
s/linux/linux_2.6.32+2.6.33-rc8.bb, do_sizecheck)
NOTE: Running task 480 of 989 (ID: 548, /home/ad/mbutsch/phytec-mx27/recipe=
s/linux/linux_2.6.32+2.6.33-rc8.bb, do_uboot_mkimage)
NOTE: Running task 481 of 989 (ID: 546, /home/ad/mbutsch/phytec-mx27/recipe=
s/linux/linux_2.6.32+2.6.33-rc8.bb, do_install)
NOTE: Running task 554 of 989 (ID: 554, /home/ad/mbutsch/phytec-mx27/recipe=
s/linux/linux_2.6.32+2.6.33-rc8.bb, do_deploy)
NOTE: Running task 570 of 989 (ID: 547, /home/ad/mbutsch/phytec-mx27/recipe=
s/linux/linux_2.6.32+2.6.33-rc8.bb, do_populate_staging)
ERROR: function do_stage failed
ERROR: see log in /home/ad/mbutsch/phytec-mx27/tmp/angstrom/work/phytecmx27=
-angstrom-linux-gnueabi/linux-2.6.32+2.6.33-rc8-r2/temp/log.do_stage.29054
NOTE: Task failed: /home/ad/mbutsch/phytec-mx27/tmp/angstrom/work/phytecmx2=
7-angstrom-linux-gnueabi/linux-2.6.32+2.6.33-rc8-r2/temp/log.do_stage.29054
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/ad/mbutsch/phytec-mx27/recipes/linux/linux_2.6.32+2.6=
.33-rc8.bb do_populate_staging failed
ERROR: Task 547 (/home/ad/mbutsch/phytec-mx27/recipes/linux/linux_2.6.32+2.=
6.33-rc8.bb, do_populate_staging) failed
NOTE: Tasks Summary: Attempted 569 tasks of which 558 didn't need to be rer=
un and 1 failed.
ERROR: '/home/ad/mbutsch/phytec-mx27/recipes/linux/linux_2.6.32+2.6.33-rc8.=
bb' failed
[mbutsch@tuxoe phytec-mx27]$


Also, if I 'bitbake -c clean virtual/kernel' it can't find a couple of file=
s. I don't know if this is related or a clue, but the path for the files lo=
oks wrong to me with the doubled glibc in ".../angstrom/deploy/glibc/glibc/=
images"

[mbutsch@tuxoe phytec-mx27]$ bitbake -c clean virtual/kernel
NOTE: Handling BitBake files: | (6709/6709) [100 %]
NOTE: Parsing finished. 6406 cached, 0 parsed, 303 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1 of 1 (ID: 0, /home/ad/mbutsch/phytec-mx27/recipes/linu=
x/linux_2.6.32+2.6.33-rc8.bb, do_clean)
NOTE: rm /home/ad/mbutsch/phytec-mx27/tmp/angstrom/deploy/glibc/glibc/image=
s/phytecmx27/uImage-phytecmx27.bin
rm: cannot remove `/home/ad/mbutsch/phytec-mx27/tmp/angstrom/deploy/glibc/g=
libc/images/phytecmx27/uImage-phytecmx27.bin': No such file or directory
NOTE: rm /home/ad/mbutsch/phytec-mx27/tmp/angstrom/deploy/glibc/glibc/image=
s/phytecmx27/uImage-2.6.32+2.6.33-rc8-r2-phytecmx27.bin
rm: cannot remove `/home/ad/mbutsch/phytec-mx27/tmp/angstrom/deploy/glibc/g=
libc/images/phytecmx27/uImage-2.6.32+2.6.33-rc8-r2-phytecmx27.bin': No such=
 file or directory
NOTE: Removing staging package tmp/angstrom/deploy/glibc/pstage/angstromgli=
bc/staging-linux-phytecmx27-angstrom-linux-gnueabi_2.6.32+2.6.33-rc8-r2_x86=
_64-linux.ipk
NOTE: removing tmp/angstrom/work/phytecmx27-angstrom-linux-gnueabi/linux-2.=
6.32+2.6.33-rc8-r2
NOTE: removing tmp/angstrom/stamps/phytecmx27-angstrom-linux-gnueabi/linux-=
2.6.32+2.6.33-rc8-r2.*
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be rerun a=
nd 0 failed.

Thanks in advance,

Mark


