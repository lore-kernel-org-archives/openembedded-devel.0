Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1TdILk-0001X0-AQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 11:25:08 +0100
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Tue, 27 Nov 2012
	11:10:54 +0100
X-TM-IMSS-Message-ID: <2a55a65d0022869f@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 2a55a65d0022869f ;
	Tue, 27 Nov 2012 11:10:58 +0100
Message-ID: <50B491AE.2090702@nedap.com>
Date: Tue, 27 Nov 2012 11:10:54 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <50AF4E08.7010402@nedap.com>
	<20121123143109.GA31470@mi.fu-berlin.de>
In-Reply-To: <20121123143109.GA31470@mi.fu-berlin.de>
Subject: Re: libftdi
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
X-List-Received-Date: Tue, 27 Nov 2012 10:25:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 11/23/2012 03:31 PM, Henning Heinold wrote:
> On Fri, Nov 23, 2012 at 11:20:56AM +0100, Jaap de Jong wrote:
>> Hi All,
>> on my buildserver under debian, libftdi does not compile.
>> Looks like some library issue.
>> Anyone an idea how to solve?
>> Thanks in advance!
>> Jaap
>>
>>
>> NOTE: package libftdi-0.19-r0: task do_compile: Started
>> ERROR: Function failed: do_compile (see /var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/work/armv5te-angstrom-linux-gnueabi/libftdi-0.19-r0/temp/log.do_compile.21748
>> for further information)
>> ERROR: Logfile of failure stored in: /var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/work/armv5te-angstrom-linux-gnueabi/libftdi-0.19-r0/temp/log.do_compile.21748
>> Log data follows:
>> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
>> 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
>> 'common']
>> | ERROR: Function failed: do_compile (see /var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/work/armv5te-angstrom-linux-gnueabi/libftdi-0.19-r0/temp/log.do_compile.21748
>> for further information)
>> | NOTE: make -j2
>> | make  all-recursive
>> | make[1]: Entering directory `/data/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/work/armv5te-angstrom-linux-gnueabi/libftdi-0.19-r0/libftdi-0.19'
>> | Making all in src
>> | make[2]: Entering directory `/data/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/work/armv5te-angstrom-linux-gnueabi/libftdi-0.19-r0/libftdi-0.19/src'
>> | ../arm-angstrom-linux-gnueabi-libtool --tag=CC   --mode=compile
>> arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -marm
>> -mthumb-interwork  -mtune=arm926ej-s --sysroot=/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45
>> -DHAVE_CONFIG_H -I. -I..     -O2 -pipe -g
>> -feliminate-unused-debug-types -I/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45/usr/include
>> -c -o ftdi.lo ftdi.c
>> | arm-angstrom-linux-gnueabi-libtool: compile:
>> arm-angstrom-linux-gnueabi-gcc -march=armv5te -marm
>> -mthumb-interwork -mtune=arm926ej-s --sysroot=/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45
>> -DHAVE_CONFIG_H -I. -I.. -O2 -pipe -g -feliminate-unused-debug-types -I/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45/usr/include
>> -c ftdi.c  -fPIC -DPIC -o .libs/ftdi.o
>> | arm-angstrom-linux-gnueabi-libtool: compile:
>> arm-angstrom-linux-gnueabi-gcc -march=armv5te -marm
>> -mthumb-interwork -mtune=arm926ej-s --sysroot=/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45
>> -DHAVE_CONFIG_H -I. -I.. -O2 -pipe -g -feliminate-unused-debug-types -I/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45/usr/include
>> -c ftdi.c -o ftdi.o >/dev/null 2>&1
>> | ../arm-angstrom-linux-gnueabi-libtool --tag=CC   --mode=link
>> arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -marm
>> -mthumb-interwork  -mtune=arm926ej-s --sysroot=/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45
>> -O2 -pipe -g -feliminate-unused-debug-types -I/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45/usr/include
>> -version-info 20:0:19 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
>> -o libftdi.la -rpath /usr/lib ftdi.lo  -L/lib -lusb
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> Fix the Makefile to not use this.
>
> Bye Henning
>
>
Fixed it.
Probably not this best way to do it, but it works.
Added a patch:

diff -urN a/configure.in b/configure.in
--- a/configure.in    2012-11-26 14:59:05.084788496 +0100
+++ b/configure.in    2012-11-26 14:59:21.665316347 +0100
@@ -19,6 +19,7 @@
  else
     AC_MSG_ERROR([*** libusb-config not found. You need a working 
libusb installation.])
  fi
+LIBS=""

  dnl check for version of libusb
  AC_MSG_CHECKING([if libusb version is >= 0.1.7])




