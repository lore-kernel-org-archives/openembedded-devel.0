Received: from rrcs-24-227-36-211.se.biz.rr.com ([24.227.36.211]
	helo=mail.eoimaging.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nharris@eoimaging.com>) id 1PuVUr-0007cB-FS
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 20:44:38 +0100
Received: from [192.168.0.194] ([::ffff:192.168.0.194]) (AUTH: LOGIN nharris)
	by mail.eoimaging.com with esmtp; Tue, 01 Mar 2011 14:43:09 -0500
	id 0020864D.4D6D4C4D.000015D4
Message-ID: <4D6D4C4D.4080005@eoimaging.com>
Date: Tue, 01 Mar 2011 14:43:09 -0500
From: Nathan Harris <nharris@eoimaging.com>
Organization: Electro-Optical Imaging, Inc.
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <4D6BAE92.1080409@eoimaging.com> <4D6BEEDA.3000203@mentor.com>
	<4D6C0A15.1040406@eoimaging.com>
	<AANLkTi=m78MJ2OLV-pQLyr7LiVTLSdHNrA4aKLXAVg6M@mail.gmail.com>
	<4D6CF9D5.3040208@eoimaging.com>
	<AANLkTimaBPnuvU9Wer1Fz2gBmS03_EOO4DqfSgvSM_9Y@mail.gmail.com>
In-Reply-To: <AANLkTimaBPnuvU9Wer1Fz2gBmS03_EOO4DqfSgvSM_9Y@mail.gmail.com>
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
X-List-Received-Date: Tue, 01 Mar 2011 19:44:38 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/1/2011 1:59 PM, Khem Raj wrote:
> On Tue, Mar 1, 2011 at 5:51 AM, Nathan Harris<nharris@eoimaging.com>  wrote:
>> On 2/28/2011 5:24 PM, Khem Raj wrote:
>>> On Mon, Feb 28, 2011 at 12:48 PM, Nathan Harris<nharris@eoimaging.com>
>>>   wrote:
>>>> Unfortunately, when I added pkgconfg to my inherit list, cleaned the
>>>> package
>>>> and then re-bitbaked, I still get the same error message.  I verified
>>>> that
>>>> vmime.pc is removed during the clean process (along with the other temp
>>>> files).
>>> Is it also removed from sysroot ?
>> Yes it's removed from sysroot too.  I tried to build again.  Did a updatedb
>> and locate on vmime.pc.  I can see it in a few places (including the sysroot
>> directory).  I do the "bitbake -c clean libvmime", updatedb, and locate does
>> not find anything.  I searched manually and can not find vmime.pc.  The
>> recipe still fails.  It's frustrating since it seems like the pkgconfig
>> should have fixed it.  At one point, I was trying to build with autotools
>> and gave up that route.  Maybe there is another file out there confusing the
>> issue?  Here's the entire output of bitbake and my new recipe.
>>
>>
>> The recipe:
>>
>> DESCRIPTION = "VMime is a free mail library for C++"
>> HOMEPAGE = "http://www.vmime.org/"
>> DEPENDS = "libgsasl gnutls"
>> PR = "r1"
>>
>> SRC_URI = "${SOURCEFORGE_MIRROR}/vmime/${PN}-${PV}.tar.bz2"
>> SRC_URI[md5sum] = "d5b6de44f7f9ca0e4cefe597d1905605"
>> SRC_URI[sha256sum] =
>> "3b66cb76d9bc7da80ef1f271cc29d3a183b5ff8b560ef60e85ff006bffb4d1ae"
>>
>> SRC_URI += "file://sendmail_disable.patch"
>>
>> inherit scons pkgconfig
> I looked into the sources of this library and it uses autotools so you
> need to inherit autotools as well.
VMime can be compiled with either scons or autotools (at least under 
x86).  I gave up trying to get autotools to work, since I got much 
further with scons.  I could not get past the configure step with 
autotools.  I didn't know you could inherit both scons and autotools.  
Here's the output with "inherit scons pkgconfig autotools":

NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it 
to increase performance.
NOTE: Handling BitBake files: - (7293/7293) [100 %]
Parsing of 7293 .bb files complete (6862 cached, 431 parsed). 7687 
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
NOTE: Running task 1 of 1 (ID: 0, 
/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb, 
do_clean)
NOTE: package libvmime-0.9.1-r1: task do_clean: Started
NOTE: removing 
../../../tmp/work/armv7a-angstrom-linux-gnueabi/libvmime-0.9.1-r1
NOTE: removing 
../../../tmp/stamps/armv7a-angstrom-linux-gnueabi/libvmime-0.9.1-r1.*
NOTE: package libvmime-0.9.1-r1: task do_clean: Succeeded
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be 
rerun and 0 failed.
ppeimany@Dell-T3400:~/overo-oe/org.openembedded.dev/recipes/libvmime$ 
bitbake libvmime
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
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb 
do_configure failed
ERROR: Task 11 
(/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb, 
do_configure) failed with 256
ERROR: 
'/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb' 
failed
ERROR: Function do_configure failed
NOTE: Task failed: ('function do_configure failed', 
'/home/ppeimany/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libvmime-0.9.1-r1/temp/log.do_configure.29165')
ERROR: Logfile of failure stored in: 
/home/ppeimany/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libvmime-0.9.1-r1/temp/log.do_configure.29165
Log data follows:
| automake (GNU automake) 1.11.1
| Copyright (C) 2009 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later 
<http://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.11
| NOTE: Executing autoreconf --verbose --install --force 
--exclude=autopoint -I 
/home/ppeimany/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libvmime-0.9.1-r1/libvmime-0.9.1/m4/ 
-I/home/ppeimany/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal-1.11 
-I 
/home/ppeimany/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal
| autoreconf: Entering directory `.'
| autoreconf: configure.in: not using Gettext
| autoreconf: running: aclocal -I 
/home/ppeimany/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libvmime-0.9.1-r1/libvmime-0.9.1/m4/ 
-I 
/home/ppeimany/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal-1.11 
-I 
/home/ppeimany/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal 
-I 
/home/ppeimany/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libvmime-0.9.1-r1/libvmime-0.9.1/m4/ 
-I 
/home/ppeimany/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal-1.11 
-I 
/home/ppeimany/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal 
--force
| 
/home/ppeimany/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:40: 
warning: underquoted definition of AC_LBL_C_INIT_BEFORE_CC
| 
/home/ppeimany/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:40:   
run info '(automake)Extending aclocal'
| 
/home/ppeimany/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:40:   
or see http://sources.redhat.com/automake/automake.html#Extending-aclocal
| autoreconf: configure.in: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, `autotools'.
| libtoolize: copying file `autotools/ltmain.sh'
| libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to 
configure.in and
| libtoolize: rerunning libtoolize, to keep the correct libtool macros 
in-tree.
| libtoolize: Consider adding `-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
| 
/home/ppeimany/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:40: 
warning: underquoted definition of AC_LBL_C_INIT_BEFORE_CC
| 
/home/ppeimany/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:40:   
run info '(automake)Extending aclocal'
| 
/home/ppeimany/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:40:   
or see http://sources.redhat.com/automake/automake.html#Extending-aclocal
| autoreconf: running: 
/home/ppeimany/overo-oe/tmp/sysroots/i686-linux/usr/bin/autoconf 
--include=/home/ppeimany/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libvmime-0.9.1-r1/libvmime-0.9.1/m4/ 
--include=/home/ppeimany/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal-1.11 
--include=/home/ppeimany/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal 
--force --warnings=cross
| autoreconf: running: 
/home/ppeimany/overo-oe/tmp/sysroots/i686-linux/usr/bin/autoheader 
--include=/home/ppeimany/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libvmime-0.9.1-r1/libvmime-0.9.1/m4/ 
--include=/home/ppeimany/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal-1.11 
--include=/home/ppeimany/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal 
--force --warnings=cross
| autoreconf: running: automake --foreign --add-missing --copy 
--force-missing --warnings=cross
| automake: unknown warning category `cross'
| configure.in:75: installing `autotools/compile'
| configure.in:77: required file `autotools/config.rpath' not found
| autoreconf: automake failed with exit status: 1
| FATAL: autoreconf execution failed.
| ERROR: Function do_configure failed
NOTE: package libvmime-0.9.1-r1: task do_configure: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb 
do_configure failed
ERROR: Task 11 
(/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb, 
do_configure) failed with 256
ERROR: 
'/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb' 
failed
ERROR: 
'/home/ppeimany/overo-oe/org.openembedded.dev/recipes/libvmime/libvmime_0.9.1.bb' 
failed



