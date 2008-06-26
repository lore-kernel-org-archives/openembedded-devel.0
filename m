Received: from [63.80.53.70] (helo=smtp-relay1.palm.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rich.pixley@palm.com>) id 1KByVO-0004EI-Fi
	for openembedded-devel@openembedded.org; Thu, 26 Jun 2008 22:55:47 +0200
X-IronPort-AV: E=Sophos;i="4.27,710,1204531200"; 
   d="scan'208";a="5859372"
Received: from unknown (HELO mailhost02.palm.com) ([148.92.223.90])
	by smtp-relay1.palm.com with ESMTP; 26 Jun 2008 13:53:24 -0700
Received: from flamingo.palm1.palmone.com (flamingo.palm1.palmone.com
	[148.92.248.64])
	by mailhost02.palm.com (8.13.6+Sun/8.12.10) with ESMTP id
	m5QKrNf1022444; Thu, 26 Jun 2008 13:53:24 -0700 (PDT)
Message-ID: <486401C3.5070509@palm.com>
Date: Thu, 26 Jun 2008 13:53:23 -0700
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Thunderbird 2.0.0.14 (Macintosh/20080421)
MIME-Version: 1.0
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
References: <48598ECE.9030604@palm.com> <1213862302.5018.2.camel@dax.rpnet.com>
	<4862C697.1010500@palm.com>
In-Reply-To: <4862C697.1010500@palm.com>
Subject: rebuild confusion
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 26 Jun 2008 20:55:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Previously, (ie, before I took the top of tree bitbake), I expected 
"bitbake -c rebuild foo" to be akin to "bitbake -c clean foo && bitbake 
foo".

But I'm seeing different results now.  What am I missing?

--rich

Eg, on apmd with:

MACHINE = "qemux86"
DISTRO = "angstrom-2007.1"

I see:

rich@duck.palm1.palmone.com> time bitbake -c rebuild apmd
NOTE: Handling BitBake files: \ (4969/4969) [100 %]
NOTE: Parsing finished. 4749 cached, 0 parsed, 220 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: build 200806261350: started

OE Build Configuration:
BB_VERSION     = "1.8.11"
OE_REVISION    = "7214a86e8f520136c9e40ffd988ac8d19c92b96c"
TARGET_ARCH    = "i586"
TARGET_OS      = "linux"
MACHINE        = "qemux86"
DISTRO         = "angstrom"
DISTRO_VERSION = "2007.12-r18"
TARGET_FPU     = ""

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1 of 1 (ID: 0, 
/home/rich/projects/oe/org.openembedded.stable/packages/apmd/apmd_3.2.2.bb, 
do_rebuild)
NOTE: package apmd-3.2.2: started
NOTE: package apmd-3.2.2-r8: task do_rebuild: started
NOTE: package apmd-3.2.2-r8: task do_clean: started
NOTE: removing 
/home/rich/projects/oe/org.openembedded.stable/tmp/work/i586-angstrom-linux/apmd-3.2.2-r8
NOTE: removing 
/home/rich/projects/oe/org.openembedded.stable/tmp/stamps/i586-angstrom-linux/apmd-3.2.2-r8.*
NOTE: package apmd-3.2.2-r8: task do_clean: completed
NOTE: package apmd-3.2.2-r8: task do_build: started
NOTE: package apmd-3.2.2-r8: task do_build: completed
NOTE: package apmd-3.2.2-r8: task do_rebuild: completed
NOTE: package apmd-3.2.2: completed
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be 
rerun and 0 failed.
NOTE: build 200806261350: completed

real    0m2.928s
user    0m2.620s
sys     0m0.296s

compared to...

rich@duck.palm1.palmone.com> time bitbake -c clean apmd && time bitbake apmd
NOTE: Handling BitBake files: \ (4969/4969) [100 %]
NOTE: Parsing finished. 4749 cached, 0 parsed, 220 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: build 200806261351: started

OE Build Configuration:
BB_VERSION     = "1.8.11"
OE_REVISION    = "7214a86e8f520136c9e40ffd988ac8d19c92b96c"
TARGET_ARCH    = "i586"
TARGET_OS      = "linux"
MACHINE        = "qemux86"
DISTRO         = "angstrom"
DISTRO_VERSION = "2007.12-r18"
TARGET_FPU     = ""

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1 of 1 (ID: 0, 
/home/rich/projects/oe/org.openembedded.stable/packages/apmd/apmd_3.2.2.bb, 
do_clean)
NOTE: package apmd-3.2.2: started
NOTE: package apmd-3.2.2-r8: task do_clean: started
NOTE: removing 
/home/rich/projects/oe/org.openembedded.stable/tmp/work/i586-angstrom-linux/apmd-3.2.2-r8
NOTE: removing 
/home/rich/projects/oe/org.openembedded.stable/tmp/stamps/i586-angstrom-linux/apmd-3.2.2-r8.*
NOTE: package apmd-3.2.2-r8: task do_clean: completed
NOTE: package apmd-3.2.2: completed
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be 
rerun and 0 failed.
NOTE: build 200806261351: completed

real    0m2.902s
user    0m2.596s
sys     0m0.296s
NOTE: Handling BitBake files: \ (4969/4969) [100 %]
NOTE: Parsing finished. 4749 cached, 0 parsed, 220 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: build 200806261351: started

OE Build Configuration:
BB_VERSION     = "1.8.11"
OE_REVISION    = "7214a86e8f520136c9e40ffd988ac8d19c92b96c"
TARGET_ARCH    = "i586"
TARGET_OS      = "linux"
MACHINE        = "qemux86"
DISTRO         = "angstrom"
DISTRO_VERSION = "2007.12-r18"
TARGET_FPU     = ""

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 241 of 288 (ID: 0, 
/home/rich/projects/oe/org.openembedded.stable/packages/apmd/apmd_3.2.2.bb, 
do_fetch)
NOTE: package apmd-3.2.2: started
NOTE: package apmd-3.2.2-r8: task do_fetch: started
NOTE: package apmd-3.2.2-r8: task do_fetch: completed
NOTE: package apmd-3.2.2: completed
NOTE: Running task 242 of 288 (ID: 2, 
/home/rich/projects/oe/org.openembedded.stable/packages/apmd/apmd_3.2.2.bb, 
do_unpack)
NOTE: package apmd-3.2.2: started
NOTE: package apmd-3.2.2-r8: task do_unpack: started
NOTE: Unpacking /home/rich/projects/oe/sources/apmd_3.2.2.orig.tar.gz to 
/home/rich/projects/oe/org.openembedded.stable/tmp/work/i586-angstrom-linux/apmd-3.2.2-r8/
NOTE: Unpacking 
/home/rich/projects/oe/org.openembedded.stable/packages/apmd/apmd-3.2.2/init 
to 
/home/rich/projects/oe/org.openembedded.stable/tmp/work/i586-angstrom-linux/apmd-3.2.2-r8/
NOTE: Unpacking 
/home/rich/projects/oe/org.openembedded.stable/packages/apmd/apmd-3.2.2/default 
to 
/home/rich/projects/oe/org.openembedded.stable/tmp/work/i586-angstrom-linux/apmd-3.2.2-r8/
NOTE: Unpacking 
/home/rich/projects/oe/org.openembedded.stable/packages/apmd/apmd-3.2.2/apmd_proxy 
to 
/home/rich/projects/oe/org.openembedded.stable/tmp/work/i586-angstrom-linux/apmd-3.2.2-r8/
NOTE: Unpacking 
/home/rich/projects/oe/org.openembedded.stable/packages/apmd/apmd-3.2.2/apmd_proxy.conf 
to 
/home/rich/projects/oe/org.openembedded.stable/tmp/work/i586-angstrom-linux/apmd-3.2.2-r8/
NOTE: package apmd-3.2.2-r8: task do_unpack: completed
NOTE: package apmd-3.2.2: completed
NOTE: Running task 256 of 288 (ID: 3, 
/home/rich/projects/oe/org.openembedded.stable/packages/apmd/apmd_3.2.2.bb, 
do_patch)
NOTE: package apmd-3.2.2: started
NOTE: package apmd-3.2.2-r8: task do_patch: started
NOTE: Applying patch 'debian.patch' 
(/home/rich/projects/oe/org.openembedded.stable/packages/apmd/apmd-3.2.2/debian.patch)
NOTE: Applying patch 'workaround.patch' 
(/home/rich/projects/oe/org.openembedded.stable/packages/apmd/apmd-3.2.2/workaround.patch)
NOTE: Applying patch 'zaurus24.patch' 
(/home/rich/projects/oe/org.openembedded.stable/packages/apmd/apmd-3.2.2/zaurus24.patch)
NOTE: Applying patch 'unlinux.patch' 
(/home/rich/projects/oe/org.openembedded.stable/packages/apmd/apmd-3.2.2/unlinux.patch)
NOTE: package apmd-3.2.2-r8: task do_patch: completed
NOTE: package apmd-3.2.2: completed
NOTE: Running task 257 of 288 (ID: 4, 
/home/rich/projects/oe/org.openembedded.stable/packages/apmd/apmd_3.2.2.bb, 
do_configure)
NOTE: package apmd-3.2.2: started
NOTE: package apmd-3.2.2-r8: task do_configure: started
NOTE: package apmd-3.2.2-r8: task do_configure: completed
NOTE: package apmd-3.2.2: completed
NOTE: Running task 262 of 288 (ID: 5, 
/home/rich/projects/oe/org.openembedded.stable/packages/apmd/apmd_3.2.2.bb, 
do_qa_configure)
NOTE: package apmd-3.2.2: started
NOTE: package apmd-3.2.2-r8: task do_qa_configure: started
NOTE: Checking sanity of the config.log file
NOTE: package apmd-3.2.2-r8: task do_qa_configure: completed
NOTE: package apmd-3.2.2: completed
NOTE: Running task 263 of 288 (ID: 6, 
/home/rich/projects/oe/org.openembedded.stable/packages/apmd/apmd_3.2.2.bb, 
do_compile)
NOTE: package apmd-3.2.2: started
NOTE: package apmd-3.2.2-r8: task do_compile: started
NOTE: package apmd-3.2.2-r8: task do_compile: completed
NOTE: package apmd-3.2.2: completed
NOTE: Running task 264 of 288 (ID: 7, 
/home/rich/projects/oe/org.openembedded.stable/packages/apmd/apmd_3.2.2.bb, 
do_install)
NOTE: package apmd-3.2.2: started
NOTE: package apmd-3.2.2-r8: task do_install: started
NOTE: package apmd-3.2.2-r8: task do_install: completed
NOTE: package apmd-3.2.2: completed
NOTE: Running task 271 of 288 (ID: 11, 
/home/rich/projects/oe/org.openembedded.stable/packages/apmd/apmd_3.2.2.bb, 
do_package)
NOTE: package apmd-3.2.2: started
NOTE: package apmd-3.2.2-r8: task do_package: started
NOTE: DO PACKAGE QA
NOTE: Checking Package: libapm
NOTE: Checking Package: libapm-dev
NOTE: Checking Package: apm
NOTE: Checking Package: apmd-dbg
NOTE: Checking Package: apmd
NOTE: Checking Package: apmd-doc
NOTE: Checking Package: apmd-dev
NOTE: Checking Package: apmd-locale
NOTE: DONE with PACKAGE QA
NOTE: package apmd-3.2.2-r8: task do_package: completed
NOTE: package apmd-3.2.2: completed
NOTE: Running task 276 of 288 (ID: 8, 
/home/rich/projects/oe/org.openembedded.stable/packages/apmd/apmd_3.2.2.bb, 
do_populate_staging)
NOTE: package apmd-3.2.2: started
NOTE: package apmd-3.2.2-r8: task do_populate_staging: started
NOTE: package apmd-3.2.2-r8: task do_populate_staging: completed
NOTE: package apmd-3.2.2: completed
NOTE: Running task 285 of 288 (ID: 12, 
/home/rich/projects/oe/org.openembedded.stable/packages/apmd/apmd_3.2.2.bb, 
do_package_write_ipk)
NOTE: package apmd-3.2.2: started
NOTE: package apmd-3.2.2-r8: task do_package_write_ipk: started
Packaged contents of libapm into 
/home/rich/projects/oe/org.openembedded.stable/tmp/deploy/glibc/ipk/i586/libapm1_3.2.2-r8_i586.ipk
Packaged contents of libapm-dev into 
/home/rich/projects/oe/org.openembedded.stable/tmp/deploy/glibc/ipk/i586/libapm-dev_3.2.2-r8_i586.ipk
Packaged contents of apm into 
/home/rich/projects/oe/org.openembedded.stable/tmp/deploy/glibc/ipk/i586/apm_3.2.2-r8_i586.ipk
Packaged contents of apmd-dbg into 
/home/rich/projects/oe/org.openembedded.stable/tmp/deploy/glibc/ipk/i586/apmd-dbg_3.2.2-r8_i586.ipk
Packaged contents of apmd into 
/home/rich/projects/oe/org.openembedded.stable/tmp/deploy/glibc/ipk/i586/apmd_3.2.2-r8_i586.ipk
NOTE: Not creating empty archive for apmd-doc-3.2.2-r8
Packaged contents of apmd-dev into 
/home/rich/projects/oe/org.openembedded.stable/tmp/deploy/glibc/ipk/i586/apmd-dev_3.2.2-r8_i586.ipk
NOTE: Not creating empty archive for apmd-locale-3.2.2-r8
NOTE: package apmd-3.2.2-r8: task do_package_write_ipk: completed
NOTE: package apmd-3.2.2: completed
NOTE: Running task 286 of 288 (ID: 10, 
/home/rich/projects/oe/org.openembedded.stable/packages/apmd/apmd_3.2.2.bb, 
do_package_write)
NOTE: package apmd-3.2.2: started
NOTE: package apmd-3.2.2-r8: task do_package_write: started
NOTE: package apmd-3.2.2-r8: task do_package_write: completed
NOTE: package apmd-3.2.2: completed
NOTE: Running task 287 of 288 (ID: 9, 
/home/rich/projects/oe/org.openembedded.stable/packages/apmd/apmd_3.2.2.bb, 
do_qa_staging)
NOTE: package apmd-3.2.2: started
NOTE: package apmd-3.2.2-r8: task do_qa_staging: started
NOTE: QA checking staging
ERROR: QA Issue: libmudflap.la failed sanity test (installed) in path 
/home/rich/projects/oe/org.openembedded.stable/tmp/staging/i586-angstrom-linux/lib
NOTE: a QA error occured but will not be logged because QA_LOG is not set
ERROR: QA Issue: libstdc++.la failed sanity test (installed) in path 
/home/rich/projects/oe/org.openembedded.stable/tmp/staging/i586-angstrom-linux/lib
NOTE: a QA error occured but will not be logged because QA_LOG is not set
ERROR: QA Issue: libmudflapth.la failed sanity test (installed) in path 
/home/rich/projects/oe/org.openembedded.stable/tmp/staging/i586-angstrom-linux/lib
NOTE: a QA error occured but will not be logged because QA_LOG is not set
ERROR: QA Issue: libsupc++.la failed sanity test (installed) in path 
/home/rich/projects/oe/org.openembedded.stable/tmp/staging/i586-angstrom-linux/lib
NOTE: a QA error occured but will not be logged because QA_LOG is not set
NOTE: package apmd-3.2.2-r8: task do_qa_staging: completed
NOTE: package apmd-3.2.2: completed
NOTE: Running task 288 of 288 (ID: 1, 
/home/rich/projects/oe/org.openembedded.stable/packages/apmd/apmd_3.2.2.bb, 
do_build)
NOTE: package apmd-3.2.2: started
NOTE: package apmd-3.2.2-r8: task do_build: started
NOTE: package apmd-3.2.2-r8: task do_build: completed
NOTE: package apmd-3.2.2: completed
NOTE: Tasks Summary: Attempted 288 tasks of which 275 didn't need to be 
rerun and 0 failed.
NOTE: build 200806261351: completed

real    0m8.932s
user    0m6.476s
sys     0m2.396s


