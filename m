Received: from [65.170.132.200] (helo=EXCHANGEVS1.comtechtel.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <vladislav.grinchenko@comtechmobile.com>)
	id 1H4OB1-0004wj-2U for openembedded-devel@lists.openembedded.org;
	Tue, 09 Jan 2007 22:06:35 +0100
Received: from 10.5.0.222 ([10.5.0.222]) by EXCHANGEVS1.comtechtel.com
	([10.10.0.15]) via Exchange Front-End Server
	mail.comtechtel.com ([10.10.0.168]) with Microsoft Exchange
	Server HTTP-DAV ; Tue,  9 Jan 2007 21:04:49 +0000
Received: from zorro.comtechtel.com by mail.comtechtel.com;
	09 Jan 2007 16:05:19 -0500
From: Vladislav Grinchenko <vladislav.grinchenko@comtechmobile.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1562609309.20070109175743@vanille-media.de>
References: <1168361761.23671.36.camel@zorro>
	<1562609309.20070109175743@vanille-media.de>
Date: Tue, 09 Jan 2007 16:05:18 -0500
Message-Id: <1168376718.23671.54.camel@zorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 (2.6.3-1.fc5.5) 
Subject: Re: Q: build/install gpe-image from dev branch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jan 2007 21:06:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Michael,

thanks for the reply.

In doing so, my build process aborts in attempt to build
'collie-kernel-24-8-2.4.18-rmk7-pxa3-embedix-r23' kernel (which I don't
need) with following:
---------------------------------
NOTE: package collie-kernel-24-8-2.4.18-rmk7-pxa3-embedix-r23: task
do_configure: completed
NOTE: package collie-kernel-24-8-2.4.18-rmk7-pxa3-embedix-r23: task
do_compile: started
ERROR: function do_compile failed
ERROR: log data follows
(/stuff/tmp.dev/work/collie-linux/collie-kernel-24-8-2.4.18-rmk7-pxa3-embedix-r23/temp/log.do_compile.6906)
| NOTE: make EMBEDIXRELEASE=-.dev-snapshot-20070109
include/linux/version.h CC=ccache arm-linux-gcc-2.95
LD=arm-linux-ld-2.11.2
| NOTE: make EMBEDIXRELEASE=-.dev-snapshot-20070109 dep CC=ccache
arm-linux-gcc-2.95  LD=arm-linux-ld-2.11.2
| gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -o
scripts/mkdep scripts/mkdep.c
| rm -f include/asm-arm/arch include/asm-arm/proc
| (cd include/asm-arm; ln -sf arch-sa1100 arch; ln -sf proc-armv proc)
| make[1]: Entering directory
`/stuff/tmp.dev/work/collie-linux/collie-kernel-24-8-2.4.18-rmk7-pxa3-embedix-r23/linux/arch/arm/tools'
| /stuff/tmp.dev/work/collie-linux/collie-kernel-24-8-2.4.18-rmk7-pxa3-embedix-r23/linux/scripts/mkdep -D__KERNEL__ -I/stuff/tmp.dev/work/collie-linux/collie-kernel-24-8-2.4.18-rmk7-pxa3-embedix-r23/linux/include -Wall -Wstrict-prototypes -Wno-trigraphs -Os -mapcs -fno-strict-aliasing -fno-common -fno-common -pipe -mapcs-32 -march=armv4 -mtune=strongarm1100 -mshort-load-bytes -msoft-float  -- getconstants.c |\
|  sed s,getconstants.o,constants.h, > .depend
| make all
| make[2]: Entering directory
`/stuff/tmp.dev/work/collie-linux/collie-kernel-24-8-2.4.18-rmk7-pxa3-embedix-r23/linux/arch/arm/tools'
| awk -f gen-mach-types mach-types
> /stuff/tmp.dev/work/collie-linux/collie-kernel-24-8-2.4.18-rmk7-pxa3-embedix-r23/linux/include/asm-arm/mach-types.h
| ccache arm-linux-gcc-2.95  -D__KERNEL__
-I/stuff/tmp.dev/work/collie-linux/collie-kernel-24-8-2.4.18-rmk7-pxa3-embedix-r23/linux/include -Wall -Wstrict-prototypes -Wno-trigraphs -Os -mapcs -fno-strict-aliasing -fno-common -fno-common -pipe -mapcs-32 -march=armv4 -mtune=strongarm1100 -mshort-load-bytes -msoft-float -S -o constants.h.tmp.1 getconstants.c
| arm-linux-gcc-2.95: No such file or directory
| make[2]: *** [constants.h] Error 1
| make[2]: Leaving directory
`/stuff/tmp.dev/work/collie-linux/collie-kernel-24-8-2.4.18-rmk7-pxa3-embedix-r23/linux/arch/arm/tools'
| make[1]: *** [dep] Error 2
| make[1]: Leaving directory
`/stuff/tmp.dev/work/collie-linux/collie-kernel-24-8-2.4.18-rmk7-pxa3-embedix-r23/linux/arch/arm/tools'
| make: *** [archdep] Error 2
| FATAL: oe_runmake failed
NOTE: Task
failed: /stuff/tmp.dev/work/collie-linux/collie-kernel-24-8-2.4.18-rmk7-pxa3-embedix-r23/temp/log.do_compile.6906
NOTE: package collie-kernel-24-8-2.4.18-rmk7-pxa3-embedix-r23: task
do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package collie-kernel-24-8-2.4.18-rmk7-pxa3-embedix: failed
ERROR: Build of gpe-image failed
---------------------------------

The thingy depends on  arm-linux-gcc-2.95 which it couldn't find?

But all I wanted was a gpe-image! I didn't ask for the kernel. And if I
did, I would have asked only for collie-kernel-64-0.

So, the question is how do I tell bitbake to build only a gpe-image? If
it absolutely must build the kernel, then how do I select a specific
kernel to build (rather then all of them)?

thanks,
--Vlad

On Tue, 2007-01-09 at 17:57 +0100, Michael 'Mickey' Lauer wrote:
> Vladislav Grinchenko wrote:
> > Hi,
> 
> > I successfully built 'gpe-image' target against development branch,
> > 'org.openembedded.dev'. The $builddir/tmp/deploy/images holds the
> > following files:
> 
> > gpe-image-collie-20070108224738.rootfs.jffs2
> > gpe-image-collie-20070108224738.rootfs.tar.bz2
> > modules-2.6.18-collie.tgz
> > zImage-2.6.18-collie-20070108224738.bin
> 
> I don't think you'll have much fun with the 2.6 kernel on collie.
> 
> I suggest bitbake collie-kernels, that should build all memory /
> storage variants in one run.
> 
> Regards,
> 
> :M:


