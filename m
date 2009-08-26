Received: from [209.85.222.185] (helo=mail-pz0-f185.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mg88t-0007fS-GW
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 04:21:43 +0200
Received: by pzk15 with SMTP id 15so1920078pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 19:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=xiEO77yIKOM4xs0X3xrPMnt+dElxNVDnk/AF2BASxUU=;
	b=gL8xLd8IPAL9d1Ugu1NN73VlZRHk+PJVFFduF0ySqIN0ZxAhXnf0+UmX+2lL79uxw+
	3wr/5+9+ZIHQN0JYg22t5T4vBvhpN5zs9p4EhpZWAWkMtxjGvIXL9Nk3bQoMQ9c3CNNT
	X9RLWA5Vx9Yt6aUEDBQXOTev0189djYIEyVXk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=vZXXq8KMvNgt6yH0eHqeZ3xFSTXQJm4wUEsjFsTjj59NmhNZEJ/8T+jX+NEf7YCQOd
	iRl0PZVP4B1Hlj+p8Txq9AuMtVO/1CbSDz9NdPjuQZXX0iGv+Fo69I0TBoc1SEm5dFFx
	DYlpK26hv5gu9GHYQ/N0lBJKVVqzTRT8KiWx0=
Received: by 10.114.69.13 with SMTP id r13mr9987936waa.16.1251252227043;
	Tue, 25 Aug 2009 19:03:47 -0700 (PDT)
Received: from gmail.com (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id d20sm1295756waa.12.2009.08.25.19.03.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 Aug 2009 19:03:46 -0700 (PDT)
Date: Tue, 25 Aug 2009 19:03:42 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090826020342.GB5705@gmail.com>
References: <f96d234e0908251411s5ac89a67v223cb2240b81fe39@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <f96d234e0908251411s5ac89a67v223cb2240b81fe39@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: problem building uclibc + udev
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
X-List-Received-Date: Wed, 26 Aug 2009 02:21:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (25/08/09 17:11), Cliff Brake wrote:
> I'm running into the following issue building udev:
> 
> NOTE: Running task 606 of 631 (ID: 8,
> /build/oe/oe-testing/openembedded/recipes/udev/udev_141.bb,
> do_compile)
> ERROR: function do_compile failed
> ERROR: log data follows
> (/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-uclibcgnueabi/udev-141-r11/temp/log.do_compile.14745)
> | NOTE: make -j 5
> | make  all-recursive
> | make[1]: Entering directory
> `/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-uclibcgnueabi/udev-141-r11/udev-141'
> | Making all in udev
> | make[2]: Entering directory
> `/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-uclibcgnueabi/udev-141-r11/udev-141/udev'
> | Making all in lib
> | make[3]: Entering directory
> `/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-uclibcgnueabi/udev-141-r11/udev-141/udev/lib'
> | make[3]: Nothing to be done for `all'.
> | make[3]: Leaving directory
> `/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-uclibcgnueabi/udev-141-r11/udev-141/udev/lib'
> | make[3]: Entering directory
> `/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-uclibcgnueabi/udev-141-r11/udev-141/udev'
> | /bin/sh ../arm-angstrom-linux-uclibcgnueabi-libtool --tag=CC
> --mode=link arm-angstrom-linux-uclibcgnueabi-gcc -march=armv7-a
> -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
> -isystem/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/armv7a-angstrom-linux-uclibcgnueabi/usr/include
> -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2
> -ggdb3 -Wl,--as-needed
> -L/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/armv7a-angstrom-linux-uclibcgnueabi/usr/lib
> -Wl,-rpath-link,/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/armv7a-angstrom-linux-uclibcgnueabi/usr/lib
> -Wl,-O1 -Wl,--hash-style=gnu -o udevd udev-event.o udev-watch.o
> udev-node.o udev-rules.o udev-util.o libudev.o libudev-list.o
> libudev-util.o libudev-device.o libudev-device-db-write.o
> libudev-monitor.o libudev-enumerate.o libudev-queue.o libudev-ctrl.o
> udevd.o
> | arm-angstrom-linux-uclibcgnueabi-libtool: link:
> arm-angstrom-linux-uclibcgnueabi-gcc -march=armv7-a -mtune=cortex-a8
> -mfpu=neon -mfloat-abi=softfp
> -isystem/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/armv7a-angstrom-linux-uclibcgnueabi/usr/include
> -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2
> -ggdb3 -Wl,--as-needed -Wl,-rpath-link
> -Wl,/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/armv7a-angstrom-linux-uclibcgnueabi/usr/lib
> -Wl,-O1 -Wl,--hash-style=gnu -o udevd udev-event.o udev-watch.o
> udev-node.o udev-rules.o udev-util.o libudev.o libudev-list.o
> libudev-util.o libudev-device.o libudev-device-db-write.o
> libudev-monitor.o libudev-enumerate.o libudev-queue.o libudev-ctrl.o
> udevd.o  -L/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/armv7a-angstrom-linux-uclibcgnueabi/usr/lib
> | udevd.o: In function `main':
> | /build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-uclibcgnueabi/udev-141-r11/udev-141/udev/udevd.c:978:
> undefined reference to `ppoll'
> | collect2: ld returned 1 exit status
> | make[3]: *** [udevd] Error 1
> | make[3]: Leaving directory
> `/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-uclibcgnueabi/udev-141-r11/udev-141/udev'
> | make[2]: *** [all-recursive] Error 1
> | make[2]: Leaving directory
> `/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-uclibcgnueabi/udev-141-r11/udev-141/udev'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory
> `/build/oe/oe-testing/build/angstrom-2008.1/tmp/work/armv7a-angstrom-linux-uclibcgnueabi/udev-141-r11/udev-141'
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
> 
> It appears that uclibc is being built without ppoll as the headers
> don't have it.  The beagleboard kernel is patched
> (http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=1f0d91e152f16fbd40bb2fb3c44a30d774d4dede)
> to include ppoll, and the headers are modified as such:
> 
> cbrake@happy:/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging$
> searchc ppoll
> ./armv7a-angstrom-linux-uclibcgnueabi/usr/include/asm/unistd.h:
>                          /* 336 for ppoll */
> ./beagleboard-angstrom-linux-gnueabi/kernel/arch/arm/include/asm/unistd.h:#define
> __NR_ppoll                    (__NR_SYSCALL_BASE+336)
> ./beagleboard-angstrom-linux-gnueabi/kernel/include/linux/syscalls.h:asmlinkage
> long sys_ppoll(struct pollfd __user *, unsigned int,
> ./beagleboard-angstrom-linux-gnueabi/kernel/include/asm-arm/unistd.h:#define
> __NR_ppoll                 (__NR_SYSCALL_BASE+336)
> ./armv7a-angstrom-linux-gnueabi/usr/include/asm/unistd.h:
>                          /* 336 for ppoll */
> ./armv7a-angstrom-linux-gnueabi/usr/include/sys/poll.h:extern int
> ppoll (struct pollfd *__fds, nfds_t __nfds,
> 
> However, the headers are only modified in the kernel include
> directory.  I suspect uclibc is getting unistd.h from the usr/include
> directory which does not have __NR_ppoll defined.  What is the best
> way to fix this.  I suspect we need to tell uclibc to look at the
> kernel headers?

it already does look into kernel headers to configure its system calls.
All you need is to wireup this syscall in kernel and also in
linux-libc-headers. IOW Port
http://www.spinics.net/lists/arm-kernel/msg38114.html to both above
places.

Thx

-Khem

> 
> Thanks,
> Cliff
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


