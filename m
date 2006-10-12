Received: from [64.233.162.193] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <axel.lin@gmail.com>) id 1GY1a6-0004f1-8g
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Oct 2006 16:30:42 +0200
Received: by nz-out-0102.google.com with SMTP id m22so210742nzf
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Oct 2006 07:24:19 -0700 (PDT)
Received: by 10.35.99.6 with SMTP id b6mr3339608pym;
	Thu, 12 Oct 2006 07:24:18 -0700 (PDT)
Received: by 10.35.15.3 with HTTP; Thu, 12 Oct 2006 07:24:16 -0700 (PDT)
Message-ID: <427d64720610120724q5c533520y1afeafdd2bc8f462@mail.gmail.com>
Date: Thu, 12 Oct 2006 22:24:18 +0800
From: "axel lin" <axel.lin@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: package strace-4.5.14-r3: task do_compile: failed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Oct 2006 14:30:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

hi list,
   I got below compile error when compile strace.
   I also tried to compile strace-4.5.12, but it shows the same error messages.
   Could someone give me some suggestions to fix this.
   thanks,
Axel

axel@kdc:/opt/oe/build$ bitbake bootstrap-image
NOTE: Using cache in '/opt/oe/build/tmp/cache'
NOTE: Handling BitBake files: - (4052/4052) [100 %]
NOTE: Parsing finished. 3923 cached, 0 parsed, 129 skipped, 0 masked.

NOTE: build 200610122212: started

OE Build Configuration:
BB_VERSION     = "1.6.1"
OE_REVISION    = "format_version "1"

new_manifest [0000000000000000000000000000000000000004]

old_revision [e9d250facb6ebff3bad1043f7e81fb2ce892c899]"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux-gnueabi"
MACHINE        = "mainstone"
DISTRO         = "angstrom"
DISTRO_VERSION = "test-20061012"
TARGET_FPU     = "soft"

NOTE: preferred version 2.5 of glibc not available
NOTE: package strace-4.5.14: started
NOTE: package strace-4.5.14-r3: task do_compile: started
ERROR: function do_compile failed
ERROR: log data follows (/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/s
trace-4.5.14-r3/temp/log.do_compile.20013)
| NOTE: make
| make  all-am
| make[1]: Entering directory `/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnu
eabi/strace-4.5.14-r3/strace-4.5.14'
| if ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DHAVE_C
ONFIG_H -I. -I/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/strace-4.5.1
4-r3/strace-4.5.14 -I. -Ilinux/arm -I/opt/oe/build/tmp/work/armv5te-angstrom-lin
ux-gnueabi/strace-4.5.14-r3/strace-4.5.14/linux/arm -Ilinux -I/opt/oe/build/tmp/
work/armv5te-angstrom-linux-gnueabi/strace-4.5.14-r3/strace-4.5.14/linux  -isyst
em/opt/oe/build/tmp/staging/arm-angstrom-linux-gnueabi/include -Wall -isystem/op
t/oe/build/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizati
ons -fomit-frame-pointer -frename-registers -Os -MT strace.o -MD -MP -MF ".deps/
strace.Tpo" -c -o strace.o strace.c; \
|       then mv -f ".deps/strace.Tpo" ".deps/strace.Po"; else rm -f ".deps/strac
e.Tpo"; exit 1; fi
| strace.c: In function 'trace':
| strace.c: In function 'trace':
| strace.c:2259: error: 'PT_CR_IPSR' undeclared (first use in this function)
| strace.c:2259: error: (Each undeclared identifier is reported only once
| strace.c:2259: error: for each function it appears in.)
| strace.c:2259: warning: pointer targets in passing argument 3 of 'upeek' diffe
r in signednesstrace-4.5.14: failed
| strace.c:2260: error: 'PT_CR_IIP' undeclared (first use in this function)
| strace.c:2260: warning: pointer targets in passing argument 3 of 'upeek' diffe
r in signedness
| strace.c:2262: warning: right shift count >= width of type
| make[1]: *** [strace.o] Error 1
| make[1]: Leaving directory `/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnue
abi/strace-4.5.14-r3/strace-4.5.14'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed: /opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/strace-
4.5.14-r3/temp/log.do_compile.20013
NOTE: package strace-4.5.14-r3: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package strace-4.5.14: failed
ERROR: Build of bootstrap-image failed


