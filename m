Received: from rrcs-24-227-36-211.se.biz.rr.com ([24.227.36.211]
	helo=mail.eoimaging.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nharris@eoimaging.com>) id 1PuQ0J-0005al-EA
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 14:52:43 +0100
Received: from [192.168.0.194] ([::ffff:192.168.0.194]) (AUTH: LOGIN nharris)
	by mail.eoimaging.com with esmtp; Tue, 01 Mar 2011 08:51:18 -0500
	id 00208648.4D6CF9D6.00007F1E
Message-ID: <4D6CF9D5.3040208@eoimaging.com>
Date: Tue, 01 Mar 2011 08:51:17 -0500
From: Nathan Harris <nharris@eoimaging.com>
Organization: Electro-Optical Imaging, Inc.
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <4D6BAE92.1080409@eoimaging.com> <4D6BEEDA.3000203@mentor.com>
	<4D6C0A15.1040406@eoimaging.com>
	<AANLkTi=m78MJ2OLV-pQLyr7LiVTLSdHNrA4aKLXAVg6M@mail.gmail.com>
In-Reply-To: <AANLkTi=m78MJ2OLV-pQLyr7LiVTLSdHNrA4aKLXAVg6M@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: QA issues with libvmime
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
X-List-Received-Date: Tue, 01 Mar 2011 13:52:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/28/2011 5:24 PM, Khem Raj wrote:
> On Mon, Feb 28, 2011 at 12:48 PM, Nathan Harris<nharris@eoimaging.com>  wrote:
>> Unfortunately, when I added pkgconfg to my inherit list, cleaned the package
>> and then re-bitbaked, I still get the same error message.  I verified that
>> vmime.pc is removed during the clean process (along with the other temp
>> files).
> Is it also removed from sysroot ?
Yes it's removed from sysroot too.  I tried to build again.  Did a 
updatedb and locate on vmime.pc.  I can see it in a few places 
(including the sysroot directory).  I do the "bitbake -c clean 
libvmime", updatedb, and locate does not find anything.  I searched 
manually and can not find vmime.pc.  The recipe still fails.  It's 
frustrating since it seems like the pkgconfig should have fixed it.  At 
one point, I was trying to build with autotools and gave up that route.  
Maybe there is another file out there confusing the issue?  Here's the 
entire output of bitbake and my new recipe.


The recipe:

DESCRIPTION = "VMime is a free mail library for C++"
HOMEPAGE = "http://www.vmime.org/"
DEPENDS = "libgsasl gnutls"
PR = "r1"

SRC_URI = "${SOURCEFORGE_MIRROR}/vmime/${PN}-${PV}.tar.bz2"
SRC_URI[md5sum] = "d5b6de44f7f9ca0e4cefe597d1905605"
SRC_URI[sha256sum] = 
"3b66cb76d9bc7da80ef1f271cc29d3a183b5ff8b560ef60e85ff006bffb4d1ae"

SRC_URI += "file://sendmail_disable.patch"

inherit scons pkgconfig


The bitbake output:

NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it 
to increase performance.
NOTE: Handling BitBake files: - (7293/7293) [100 %]
Parsing of 7293 .bb files complete (6863 cached, 430 parsed). 7687 
targets, 312 skipped, 2 masked, 0 errors.

Build Configuration:
BB_VERSION        = "1.10.2"
METADATA_BRANCH   = "<unknown>"
METADATA_REVISION = "12"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "overo"
DISTRO            = "angstrom"
DISTRO_VERSION    = "2010.7-test-20110301"
TARGET_FPU        = "hard"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 509 of 818 (ID: 10, 
/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb, 
do_setscene)
NOTE: package libvmime-0.9.1-r1: task do_setscene: Started
NOTE: package libvmime-0.9.1-r1: task do_setscene: Succeeded
NOTE: Running task 510 of 818 (ID: 8, 
/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb, 
do_fetch)
NOTE: package libvmime-0.9.1-r1: task do_fetch: Started
NOTE: package libvmime-0.9.1-r1: task do_fetch: Succeeded
NOTE: Running task 515 of 818 (ID: 0, 
/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb, 
do_unpack)
NOTE: package libvmime-0.9.1-r1: task do_unpack: Started
NOTE: Unpacking ../../../sources/libvmime-0.9.1.tar.bz2 to 
../../../tmp/work/armv7a-angstrom-linux-gnueabi/libvmime-0.9.1-r1/
NOTE: package libvmime-0.9.1-r1: task do_unpack: Succeeded
NOTE: Running task 539 of 818 (ID: 1, 
/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb, 
do_patch)
NOTE: package libvmime-0.9.1-r1: task do_patch: Started
NOTE: Applying patch 'sendmail_disable.patch' (files/sendmail_disable.patch)
NOTE: package libvmime-0.9.1-r1: task do_patch: Succeeded
NOTE: Running task 540 of 818 (ID: 11, 
/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb, 
do_configure)
NOTE: package libvmime-0.9.1-r1: task do_configure: Started
NOTE: package libvmime-0.9.1-r1: task do_configure: Succeeded
NOTE: Running task 550 of 818 (ID: 12, 
/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb, 
do_qa_configure)
NOTE: package libvmime-0.9.1-r1: task do_qa_configure: Started
NOTE: package libvmime-0.9.1-r1: task do_qa_configure: Succeeded
NOTE: Running task 551 of 818 (ID: 13, 
/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb, 
do_compile)
NOTE: package libvmime-0.9.1-r1: task do_compile: Started
NOTE: package libvmime-0.9.1-r1: task do_compile: Succeeded
NOTE: Running task 552 of 818 (ID: 2, 
/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb, 
do_install)
NOTE: package libvmime-0.9.1-r1: task do_install: Started
NOTE: package libvmime-0.9.1-r1: task do_install: Succeeded
NOTE: Running task 556 of 818 (ID: 14, 
/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb, 
do_package)
NOTE: package libvmime-0.9.1-r1: task do_package: Started
NOTE: package libvmime-0.9.1-r1: task do_package: Succeeded
NOTE: Running task 558 of 818 (ID: 3, 
/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb, 
do_populate_sysroot)
NOTE: package libvmime-0.9.1-r1: task do_populate_sysroot: Started
NOTE: package libvmime-0.9.1-r1: task do_populate_sysroot: Succeeded
Packaged contents of libvmime-dbg into 
/home/ppeimany/overo-oe/tmp/deploy/glibc/ipk/armv7a/libvmime-dbg_0.9.1-r1.6_armv7a.ipk
NOTE: Running task 560 of 818 (ID: 16, 
/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb, 
do_package_write_ipk)
Packaged contents of libvmime-dev into 
/home/ppeimany/overo-oe/tmp/deploy/glibc/ipk/armv7a/libvmime-dev_0.9.1-r1.6_armv7a.ipk
NOTE: package libvmime-0.9.1-r1: task do_package_write_ipk: Started
NOTE: Not creating empty archive for libvmime-0.9.1-r1.6
NOTE: Not creating empty archive for libvmime-doc-0.9.1-r1.6
Packaged contents of libvmime-static into 
/home/ppeimany/overo-oe/tmp/deploy/glibc/ipk/armv7a/libvmime-static_0.9.1-r1.6_armv7a.ipk
NOTE: Not creating empty archive for libvmime-locale-0.9.1-r1.6
NOTE: package libvmime-0.9.1-r1: task do_package_write_ipk: Succeeded
NOTE: Running task 561 of 818 (ID: 5, 
/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb, 
do_package_write)
NOTE: package libvmime-0.9.1-r1: task do_package_write: Started
NOTE: package libvmime-0.9.1-r1: task do_package_write: Succeeded
NOTE: Running task 586 of 818 (ID: 4, 
/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb, 
do_qa_staging)
NOTE: package libvmime-0.9.1-r1: task do_qa_staging: Started
ERROR: QA Issue with staging: vmime.pc failed sanity test (tmpdir) in 
path 
/home/ppeimany/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/pkgconfig
FATAL: QA staging was broken by the package built above
ERROR: Error in executing python function in: 
/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Function do_qa_staging failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb 
do_qa_staging failed
ERROR: Task 4 
(/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb, 
do_qa_staging) failed with 256
ERROR: 
'/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb' 
failed
ERROR: QA Issue with staging: vmime.pc failed sanity test (tmpdir) in 
path 
/home/ppeimany/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/pkgconfig
FATAL: QA staging was broken by the package built above
ERROR: 
'/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb' 
failed



