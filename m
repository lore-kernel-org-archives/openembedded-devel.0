Received: from [17.148.16.96] (helo=asmtpout021.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MI6jw-0002sr-Ma
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 22:00:41 +0200
MIME-version: 1.0
Received: from [87.201.169.152] by asmtp021.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLJ0034SZ2SQE20@asmtp021.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	20 Jun 2009 12:49:52 -0700 (PDT)
Message-id: <AF709BE6-F426-426D-81FF-372ACDC18729@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <h1jc1p$lum$1@ger.gmane.org>
Date: Sat, 20 Jun 2009 23:49:24 +0400
References: <B7B72D38-62FD-4B6B-9856-DF4F470F832F@mac.com>
	<h1jc1p$lum$1@ger.gmane.org>
X-Mailer: Apple Mail (2.935.3)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Recipe for libserial_0.6.0rc1
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
X-List-Received-Date: Sat, 20 Jun 2009 20:00:42 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi Koen,
			About the rc1 tag, that was the only version on source forge that  
compiled correctly. the existing 1.5.2 recipe doesnt even compile.
On Jun 20, 2009, at 11:07 PM, Koen Kooi wrote:

> use autotools_stage and AUTOTOOLS_STAGE_PKGCONFIG = 1
>

I tried that, however, the resulting failure is identical. Could you  
please help?

DESCRIPTION = "C++ library for serial port support."
SECTION = "libs"
LICENSE = "GPL"
HOMEPAGE = "http://libserial.sourceforge.net/mediawiki/index.php/Main_Page 
"
DEPENDS = ""

SRC_URI = "${SOURCEFORGE_MIRROR}/libserial/libserial-${PV}.tar.gz"

S = "${WORKDIR}/${PN}-${PV}"

inherit autotools_stage
AUTOTOOLS_STAGE_PKGCONFIG = 1

do_compile() {
	oe_runmake SUBDIRS="src doc examples"
}

do_stage() {
	autotools_stage_all
}


NOTE: Running task 426 of 436 (ID: 8, /tool/overo-oe/user.collection/ 
recipes/libserial/libserial_0.6.0rc1.bb, do_compile)
ERROR: function do_compile failed
ERROR: log data follows (/tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/libserial-0.6.0rc1-r0/temp/log.do_compile.14419)
| NOTE: make -j 4 SUBDIRS=src doc examples
| make  all-recursive
| make[1]: Entering directory `/tool/overo-oe/tmp/work/armv7a-angstrom- 
linux-gnueabi/libserial-0.6.0rc1-r0/libserial-0.6.0rc1'
| Making all in src
| make[2]: Entering directory `/tool/overo-oe/tmp/work/armv7a-angstrom- 
linux-gnueabi/libserial-0.6.0rc1-r0/libserial-0.6.0rc1/src'
| /bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=CXX   -- 
mode=compile ccache arm-angstrom-linux-gnueabi-g++ -march=armv7-a - 
mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -DHAVE_CONFIG_H -I. - 
I..   -isystem/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/ 
usr/include -Weffc++ -isystem/tool/overo-oe/tmp/staging/armv7a- 
angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename- 
registers -fomit-frame-pointer -O2 -ggdb3 -fpermissive -fvisibility- 
inlines-hidden -MT SerialStreamBuf.lo -MD -MP -MF .deps/ 
SerialStreamBuf.Tpo -c -o SerialStreamBuf.lo SerialStreamBuf.cc

<snip>

| arm-angstrom-linux-gnueabi-libtool: link: ccache arm-angstrom-linux- 
gnueabi-g++ -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat- 
abi=softfp -shared -nostdlib /tool/overo-oe/tmp/staging/armv7a- 
angstrom-linux-gnueabi/usr/lib/crti.o /tool/overo-oe/tmp/cross/armv7a/ 
lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/crtbeginS.o  .libs/ 
SerialStreamBuf.o .libs/SerialStream.o .libs/SerialPort.o .libs/ 
PosixSignalDispatcher.o   -Wl,-rpath -Wl,/tool/overo-oe/tmp/cross/ 
armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm- 
angstrom-linux-gnueabi/lib -Wl,-rpath -Wl,/tool/overo-oe/tmp/cross/ 
armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm- 
angstrom-linux-gnueabi/lib -L/tool/overo-oe/tmp/staging/armv7a- 
angstrom-linux-gnueabi/usr/lib -L/tool/overo-oe/tmp/cross/armv7a/lib/ 
gcc/arm-angstrom-linux-gnueabi/4.3.3 -L/tool/overo-oe/tmp/cross/armv7a/ 
lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom- 
linux-gnueabi/lib -L/tool/overo-oe/tmp/staging/armv7a-angstrom-linux- 
gnueabi/lib /tool/overo-oe/tmp/cross/armv7a/lib/gcc/arm-angstrom-linux- 
gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/lib/libstdc++.so - 
L/tool/overo-oe/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/lib -lm - 
lc -lgcc_s /tool/overo-oe/tmp/cross/armv7a/lib/gcc/arm-angstrom-linux- 
gnueabi/4.3.3/crtendS.o /tool/overo-oe/tmp/staging/armv7a-angstrom- 
linux-gnueabi/usr/lib/crtn.o  -march=armv7-a -mtune=cortex-a8 - 
mfpu=neon -mfloat-abi=softfp -Wl,-rpath-link -Wl,/tool/overo-oe/tmp/ 
staging/armv7a-angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash- 
style=gnu   -Wl,-soname -Wl,libserial.so.0 -o .libs/libserial.so.0.0.0
| arm-angstrom-linux-gnueabi-libtool: link: (cd ".libs" && rm -f  
"libserial.so.0" && ln -s "libserial.so.0.0.0" "libserial.so.0")
| arm-angstrom-linux-gnueabi-libtool: link: (cd ".libs" && rm -f  
"libserial.so" && ln -s "libserial.so.0.0.0" "libserial.so")
| arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi- 
ar cru .libs/libserial.a  SerialStreamBuf.o SerialStream.o  
SerialPort.o PosixSignalDispatcher.o
| arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi- 
ranlib .libs/libserial.a
| arm-angstrom-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f  
"libserial.la" && ln -s "../libserial.la" "libserial.la" )
| make[2]: Leaving directory `/tool/overo-oe/tmp/work/armv7a-angstrom- 
linux-gnueabi/libserial-0.6.0rc1-r0/libserial-0.6.0rc1/src'
| Making all in doc
| make[2]: Entering directory `/tool/overo-oe/tmp/work/armv7a-angstrom- 
linux-gnueabi/libserial-0.6.0rc1-r0/libserial-0.6.0rc1/doc'
| Making all in src
| /bin/sh: line 17: cd: src: No such file or directory
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory `/tool/overo-oe/tmp/work/armv7a-angstrom- 
linux-gnueabi/libserial-0.6.0rc1-r0/libserial-0.6.0rc1/doc'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/tool/overo-oe/tmp/work/armv7a-angstrom- 
linux-gnueabi/libserial-0.6.0rc1-r0/libserial-0.6.0rc1'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed: /tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/libserial-0.6.0rc1-r0/temp/log.do_compile.14419
ERROR: TaskFailed event exception, aborting
ERROR: Build of /tool/overo-oe/user.collection/recipes/libserial/ 
libserial_0.6.0rc1.bb do_compile failed
ERROR: Task 8 (/tool/overo-oe/user.collection/recipes/libserial/ 
libserial_0.6.0rc1.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 425 tasks of which 418 didn't need to  
be rerun and 1 failed.
ERROR: '/tool/overo-oe/user.collection/recipes/libserial/ 
libserial_0.6.0rc1.bb' failed
[elvis@zeus overo-oe]$



Best regards,

Elvis

