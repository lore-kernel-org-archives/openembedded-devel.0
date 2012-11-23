Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1TbuVI-0005JU-PI
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Nov 2012 15:45:16 +0100
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1TbuHf-001FsL-7J>; Fri, 23 Nov 2012 15:31:11 +0100
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1TbuHf-001Xgp-1i>; Fri, 23 Nov 2012 15:31:11 +0100
Received: from heinold by andorra.imp.fu-berlin.de with local (internal_ws
	Exim 4.72) id 1TbuHd-0000fS-VI
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2012 15:31:09 +0100
Date: Fri, 23 Nov 2012 15:31:09 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121123143109.GA31470@mi.fu-berlin.de>
References: <50AF4E08.7010402@nedap.com>
MIME-Version: 1.0
In-Reply-To: <50AF4E08.7010402@nedap.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
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
X-List-Received-Date: Fri, 23 Nov 2012 14:45:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 23, 2012 at 11:20:56AM +0100, Jaap de Jong wrote:
> Hi All,
> on my buildserver under debian, libftdi does not compile.
> Looks like some library issue.
> Anyone an idea how to solve?
> Thanks in advance!
> Jaap
> 
> 
> NOTE: package libftdi-0.19-r0: task do_compile: Started
> ERROR: Function failed: do_compile (see /var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/work/armv5te-angstrom-linux-gnueabi/libftdi-0.19-r0/temp/log.do_compile.21748
> for further information)
> ERROR: Logfile of failure stored in: /var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/work/armv5te-angstrom-linux-gnueabi/libftdi-0.19-r0/temp/log.do_compile.21748
> Log data follows:
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
> 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
> 'common']
> | ERROR: Function failed: do_compile (see /var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/work/armv5te-angstrom-linux-gnueabi/libftdi-0.19-r0/temp/log.do_compile.21748
> for further information)
> | NOTE: make -j2
> | make  all-recursive
> | make[1]: Entering directory `/data/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/work/armv5te-angstrom-linux-gnueabi/libftdi-0.19-r0/libftdi-0.19'
> | Making all in src
> | make[2]: Entering directory `/data/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/work/armv5te-angstrom-linux-gnueabi/libftdi-0.19-r0/libftdi-0.19/src'
> | ../arm-angstrom-linux-gnueabi-libtool --tag=CC   --mode=compile
> arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -marm
> -mthumb-interwork  -mtune=arm926ej-s --sysroot=/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45
> -DHAVE_CONFIG_H -I. -I..     -O2 -pipe -g
> -feliminate-unused-debug-types -I/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45/usr/include
> -c -o ftdi.lo ftdi.c
> | arm-angstrom-linux-gnueabi-libtool: compile:
> arm-angstrom-linux-gnueabi-gcc -march=armv5te -marm
> -mthumb-interwork -mtune=arm926ej-s --sysroot=/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45
> -DHAVE_CONFIG_H -I. -I.. -O2 -pipe -g -feliminate-unused-debug-types -I/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45/usr/include
> -c ftdi.c  -fPIC -DPIC -o .libs/ftdi.o
> | arm-angstrom-linux-gnueabi-libtool: compile:
> arm-angstrom-linux-gnueabi-gcc -march=armv5te -marm
> -mthumb-interwork -mtune=arm926ej-s --sysroot=/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45
> -DHAVE_CONFIG_H -I. -I.. -O2 -pipe -g -feliminate-unused-debug-types -I/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45/usr/include
> -c ftdi.c -o ftdi.o >/dev/null 2>&1
> | ../arm-angstrom-linux-gnueabi-libtool --tag=CC   --mode=link
> arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -marm
> -mthumb-interwork  -mtune=arm926ej-s --sysroot=/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45
> -O2 -pipe -g -feliminate-unused-debug-types -I/var/lib/jenkins/jobs/oe-core/develop/build/tmp-angstrom_v2012_05-eglibc/sysroots/nedap9g45/usr/include
> -version-info 20:0:19 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
> -o libftdi.la -rpath /usr/lib ftdi.lo  -L/lib -lusb
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Fix the Makefile to not use this.

Bye Henning


