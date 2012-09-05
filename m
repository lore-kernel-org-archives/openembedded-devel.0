Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9Drp-00047G-PT
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 13:33:57 +0200
Received: from localhost ([127.0.0.1]:59909 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9Dfq-00015c-6C
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 11:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:content-type
	:content-transfer-encoding; s=default; bh=FH2iXQ/r08kSNfeYIe+i9Y
	CiiaU=; b=C6FiF5WYlAWJ5eCgK5cE61mTXi2UNSX7MTuygsP2Fcnz4LneMVJWHB
	cWHQ9Bzr4I3xAY2MLVT7O87SIQNB2GUUsPg95jt91c1UQ61Cu/xcQm8zJOoypeo4
	/YPsv9DmS0ks396fX7qfSAfFe6xGAyRCvps0VtpA/jeudqyq2/OUM=
Received: from [195.171.99.130] (port=35314 helo=[192.168.0.33])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9Dfq-00015Q-2P
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 11:21:34 +0000
Message-ID: <50473603.4030708@communistcode.co.uk>
Date: Wed, 05 Sep 2012 12:22:43 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Struggling with creating recipe liblockdev
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
X-List-Received-Date: Wed, 05 Sep 2012 11:33:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I am really struggling with making a new recipe for a library called 
lockdev. It is fairly old and fairly basic but I am failling at the 
initial hurdles!

So far I have:

DESCRIPTION = "Manage character and block device lockfiles."
HOMEPAGE = 
"http://anonscm.debian.org/gitweb/?p=lockdev/lockdev.git;a=summary"

LICENSE = "LGPLv2.1"
LIC_FILES_CHKSUM = "file://LICENSE;md5=d8045f3b8f929c1cb29a1e3fd737b499"

PR = "r1.4"
PV = "1.0.3"

SRC_URI = 
"http://ftp.de.debian.org/debian/pool/main/l/lockdev/lockdev_${PV}.orig.tar.gz 
\
            file://lockdev_1.0.3-1.4.patch \
"

SRC_URI[md5sum] = "64b9c1b87b125fc348e892e24625524a"
SRC_URI[sha256sum] = 
"ccae635d7ac3fdd50897eceb250872b3d9a191d298f213e7f0c836910d869f82"

Which gives me the error:NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: liblockdev: LIC_FILES_CHKSUM points to an 
invalid file: 
/home/jack/Projects/poky-rasp/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/liblockdev-1.0.3-r1.4/liblockdev-1.0.3/LICENSE
ERROR: Logfile of failure stored in: 
/home/jack/Projects/poky-rasp/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/liblockdev-1.0.3-r1.4/temp/log.do_configure.29246
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: Executing shell function do_configure
| DEBUG: Shell function do_configure finished
| DEBUG: Executing python function do_qa_configure
| NOTE: Checking autotools environment for common misconfiguration
| DEBUG: Python function do_qa_configure finished
| ERROR: Function failed: liblockdev: LIC_FILES_CHKSUM points to an 
invalid file: 
/home/jack/Projects/poky-rasp/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/liblockdev-1.0.3-r1.4/liblockdev-1.0.3/LICENSE
ERROR: Task 5 
(/home/jack/Projects/poky-rasp/meta-oe/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb, 
do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 798 tasks of which 797 didn't need to be 
rerun and 1 failed.

Summary: 1 task failed:
/home/jack/Projects/poky-rasp/meta-oe/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb, 
do_configure
Summary: There was 1 WARNING message shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

When I enter a devshell, the LICENSE file is there but in the directory 
../liblockdev-1.0.3 not the directory I am dropped in. Where am I going 
wrong?

[jack@archHP liblockdev-1.0.3]$ pwd

/home/jack/Projects/poky-rasp/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/liblockdev-1.0.3-r1.4/liblockdev-1.0.3

[jack@archHP liblockdev-1.0.3]$ cd ..

[jack@archHP liblockdev-1.0.3-r1.4]$ tree
.
|-- liblockdev-1.0.3
|   |-- debian
|   |   |-- NEWS
|   |   |-- changelog
|   |   |-- compat
|   |   |-- control
|   |   |-- copyright
|   |   |-- liblockdev1-dbg.dirs
|   |   |-- liblockdev1-dbg.docs
|   |   |-- liblockdev1-dev.dirs
|   |   |-- liblockdev1-dev.manpages
|   |   |-- liblockdev1-perl.dirs
|   |   |-- liblockdev1.postinst
|   |   `-- rules
|   `-- patches
|       |-- lockdev_1.0.3-1.4.patch -> 
/home/jack/Projects/poky-rasp/meta-oe/meta-oe/recipes-extended/liblockdev/files/lockdev_1.0.3-1.4.patch
|       `-- series
|-- license-destdir
|   `-- liblockdev
|       `-- generic_LGPLv2.1
|-- lockdev-1.0.3
|   |-- AUTHORS
|   |-- ChangeLog
|   |-- ChangeLog.old
|   |-- LICENSE
|   |-- LockDev
|   |   |-- Changes
|   |   |-- LockDev.pm
|   |   |-- LockDev.xs
|   |   |-- MANIFEST
|   |   |-- Makefile.PL
|   |   |-- test.pl
|   |   `-- typemap
|   |-- Makefile
|   |-- README.debug
|   |-- Rules.mk
|   |-- debian
|   |   `-- foo
|   |-- docs
|   |   |-- LSB.991201
|   |   `-- lockdev.3
|   `-- src
|       |-- lockdev.c
|       |-- lockdev.h
|       |-- sample.c
|       `-- ttylock.h
|-- lockdev_1.0.3-1.4.patch
`-- temp
     |-- log.do_configure -> log.do_configure.29246
     |-- log.do_configure.29088
     |-- log.do_configure.29246
     |-- log.do_devshell -> log.do_devshell.29318
     |-- log.do_devshell.29150
     |-- log.do_devshell.29318
     |-- log.do_fetch -> log.do_fetch.29023
     |-- log.do_fetch.29023
     |-- log.do_patch -> log.do_patch.29028
     |-- log.do_patch.29028
     |-- log.do_populate_lic_setscene -> log.do_populate_lic_setscene.29015
     |-- log.do_populate_lic_setscene.29015
     |-- log.do_unpack -> log.do_unpack.29024
     |-- log.do_unpack.29024
     |-- log.task_order
     |-- run.base_do_fetch.29023
     |-- run.base_do_patch.29028
     |-- run.base_do_unpack.29024
     |-- run.do_configure.29088
     |-- run.do_configure.29246
     |-- run.do_devshell.29150
     |-- run.do_devshell.29318
     |-- run.do_fetch.29023
     |-- run.do_patch.29028
     |-- run.do_populate_lic_setscene.29015
     |-- run.do_qa_configure.29088
     |-- run.do_qa_configure.29246
     |-- run.do_unpack.29024
     |-- run.patch_do_patch.29028
     |-- run.sstate_unpack_package.29015
     |-- run.sysroot_cleansstate.29088
     `-- run.sysroot_cleansstate.29246

11 directories, 69 files
[jack@archHP liblockdev-1.0.3-r1.4]$


Thanks for any help in advance!

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



