Received: from [209.85.211.181] (helo=mail-yw0-f181.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Mg3aF-0007Eh-L2
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 23:29:43 +0200
Received: by ywh11 with SMTP id 11so4970264ywh.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 14:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=Yqs8QIklYi/wuw0yyIeSvGshSc41DMrisQzQnEZhgDY=;
	b=dFPasjKv2d1cs8FgPNx83MYec20hxPJcQIegPVQ5sbK4dMqyo6JOaCz1i4cF40zugx
	kEE1b6n6RrrJEiIs6wRXA6CqEsviN7gPyAX07mDeJ9dLFrjxfZ1i7uFc+kpERhYgnRWS
	YLwTzhggkdUfnXTeHAoXtoMUKqeXGSLlTvWg4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=m085n6oDLrBIlAZSwhg4lbrepHpslOa7EunhnPOZfeGuxMc5YmIBjayBfT9QgMpDzh
	cvYWZsKm0Iu+FAl3biaw9xhlQ+K3e7fZTbdTfu4VLPTtKqMN4K0/iSa3DxY9XO4TsSgo
	4GGt9bnQDfPhTjb7dfB8GgUOGlFZUVMwlFt4M=
MIME-Version: 1.0
Received: by 10.150.63.2 with SMTP id l2mr11262227yba.207.1251234705060; Tue, 
	25 Aug 2009 14:11:45 -0700 (PDT)
Date: Tue, 25 Aug 2009 17:11:45 -0400
Message-ID: <f96d234e0908251411s5ac89a67v223cb2240b81fe39@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: problem building uclibc + udev
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
X-List-Received-Date: Tue, 25 Aug 2009 21:29:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I'm running into the following issue building udev:

NOTE: Running task 606 of 631 (ID: 8,
/build/oe/oe-testing/openembedded/recipes/udev/udev_141.bb,
do_compile)
ERROR: function do_compile failed
ERROR: log data follows
(/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-uclibcgnueabi/udev-141-r11/temp/log.do_compile.14745)
| NOTE: make -j 5
| make  all-recursive
| make[1]: Entering directory
`/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-uclibcgnueabi/udev-141-r11/udev-141'
| Making all in udev
| make[2]: Entering directory
`/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-uclibcgnueabi/udev-141-r11/udev-141/udev'
| Making all in lib
| make[3]: Entering directory
`/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-uclibcgnueabi/udev-141-r11/udev-141/udev/lib'
| make[3]: Nothing to be done for `all'.
| make[3]: Leaving directory
`/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-uclibcgnueabi/udev-141-r11/udev-141/udev/lib'
| make[3]: Entering directory
`/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-uclibcgnueabi/udev-141-r11/udev-141/udev'
| /bin/sh ../arm-angstrom-linux-uclibcgnueabi-libtool --tag=CC
--mode=link arm-angstrom-linux-uclibcgnueabi-gcc -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
-isystem/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/armv7a-angstrom-linux-uclibcgnueabi/usr/include
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2
-ggdb3 -Wl,--as-needed
-L/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/armv7a-angstrom-linux-uclibcgnueabi/usr/lib
-Wl,-rpath-link,/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/armv7a-angstrom-linux-uclibcgnueabi/usr/lib
-Wl,-O1 -Wl,--hash-style=gnu -o udevd udev-event.o udev-watch.o
udev-node.o udev-rules.o udev-util.o libudev.o libudev-list.o
libudev-util.o libudev-device.o libudev-device-db-write.o
libudev-monitor.o libudev-enumerate.o libudev-queue.o libudev-ctrl.o
udevd.o
| arm-angstrom-linux-uclibcgnueabi-libtool: link:
arm-angstrom-linux-uclibcgnueabi-gcc -march=armv7-a -mtune=cortex-a8
-mfpu=neon -mfloat-abi=softfp
-isystem/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/armv7a-angstrom-linux-uclibcgnueabi/usr/include
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2
-ggdb3 -Wl,--as-needed -Wl,-rpath-link
-Wl,/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/armv7a-angstrom-linux-uclibcgnueabi/usr/lib
-Wl,-O1 -Wl,--hash-style=gnu -o udevd udev-event.o udev-watch.o
udev-node.o udev-rules.o udev-util.o libudev.o libudev-list.o
libudev-util.o libudev-device.o libudev-device-db-write.o
libudev-monitor.o libudev-enumerate.o libudev-queue.o libudev-ctrl.o
udevd.o  -L/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/armv7a-angstrom-linux-uclibcgnueabi/usr/lib
| udevd.o: In function `main':
| /build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-uclibcgnueabi/udev-141-r11/udev-141/udev/udevd.c:978:
undefined reference to `ppoll'
| collect2: ld returned 1 exit status
| make[3]: *** [udevd] Error 1
| make[3]: Leaving directory
`/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-uclibcgnueabi/udev-141-r11/udev-141/udev'
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory
`/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-uclibcgnueabi/udev-141-r11/udev-141/udev'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-uclibcgnueabi/udev-141-r11/udev-141'
| make: *** [all] Error 2
| FATAL: oe_runmake failed

It appears that uclibc is being built without ppoll as the headers
don't have it.  The beagleboard kernel is patched
(http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=1f0d91e152f16fbd40bb2fb3c44a30d774d4dede)
to include ppoll, and the headers are modified as such:

cbrake@happy:/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging$
searchc ppoll
./armv7a-angstrom-linux-uclibcgnueabi/usr/include/asm/unistd.h:
                         /* 336 for ppoll */
./beagleboard-angstrom-linux-gnueabi/kernel/arch/arm/include/asm/unistd.h:#define
__NR_ppoll                    (__NR_SYSCALL_BASE+336)
./beagleboard-angstrom-linux-gnueabi/kernel/include/linux/syscalls.h:asmlinkage
long sys_ppoll(struct pollfd __user *, unsigned int,
./beagleboard-angstrom-linux-gnueabi/kernel/include/asm-arm/unistd.h:#define
__NR_ppoll                 (__NR_SYSCALL_BASE+336)
./armv7a-angstrom-linux-gnueabi/usr/include/asm/unistd.h:
                         /* 336 for ppoll */
./armv7a-angstrom-linux-gnueabi/usr/include/sys/poll.h:extern int
ppoll (struct pollfd *__fds, nfds_t __nfds,

However, the headers are only modified in the kernel include
directory.  I suspect uclibc is getting unistd.h from the usr/include
directory which does not have __NR_ppoll defined.  What is the best
way to fix this.  I suspect we need to tell uclibc to look at the
kernel headers?

Thanks,
Cliff


