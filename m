Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1P8W3l-0002mF-Gc
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 12:38:19 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 9FA80166086D; Wed, 20 Oct 2010 04:37:37 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id F0E7A1660853;
	Wed, 20 Oct 2010 04:37:36 -0600 (MDT)
Message-ID: <4CBEC670.90605@mlbassoc.com>
Date: Wed, 20 Oct 2010 04:37:36 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CBEB7E8.5020109@nedap.com>
In-Reply-To: <4CBEB7E8.5020109@nedap.com>
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: failure building gcc-cross-initial for armv5te
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
X-List-Received-Date: Wed, 20 Oct 2010 10:38:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/2010 03:35 AM, Jaap de Jong wrote:
> building gcc-cross-initial for armv5te fails:
>
> ///
> | checking for arm-angstrom-linux-gnueabi-ranlib...
> arm-angstrom-linux-gnueabi-ranlib
> | checking for arm-angstrom-linux-gnueabi-strip...
> arm-angstrom-linux-gnueabi-strip
> | checking whether ln -s works... yes
> | checking for arm-angstrom-linux-gnueabi-gcc...
> /media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r12.0+svnr164562/gcc-4.5/build.i686-linux.arm-angstrom-linux-gnueabi/./gcc/xgcc
>
> -B/media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r12.0+svnr164562/gcc-4.5/build.i686-linux.arm-angstrom-linux-gnueabi/./gcc/
>
> -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb
> -isystem/media/OpenEmbedded/unstable/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/include
>
> -B/media/OpenEmbedded/unstable/tmp/sysroots/i686-linux/usr/armv5te/arm-angstrom-linux-gnueabi/bin/
>
> -B/media/OpenEmbedded/unstable/tmp/sysroots/i686-linux/usr/armv5te/arm-angstrom-linux-gnueabi/lib/
>
> -isystem
> /media/OpenEmbedded/unstable/tmp/sysroots/i686-linux/usr/armv5te/arm-angstrom-linux-gnueabi/include
>
> -isystem
> /media/OpenEmbedded/unstable/tmp/sysroots/i686-linux/usr/armv5te/arm-angstrom-linux-gnueabi/sys-include
>
> --sysroot=/media/OpenEmbedded/unstable/tmp/sysroots/armv5te-angstrom-linux-gnueabi
>
> | checking for suffix of object files... configure: error: in
> `/media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r12.0+svnr164562/gcc-4.5/build.i686-linux.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libgcc':
>
> | configure: error: cannot compute suffix of object files: cannot
> compile
> | See `config.log' for more details.
> | make[1]: *** [configure-target-libgcc] Error 1
> | make[1]: Leaving directory
> `/media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r12.0+svnr164562/gcc-4.5/build.i686-linux.arm-angstrom-linux-gnueabi'
>
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
> NOTE: Task failed:
> /media/OpenEmbedded/unstable/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r12.0+svnr164562/temp/log.do_compile.1864
>
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /media/OpenEmbedded/unstable/org.openembedded.dev/recipes/gcc/gcc-cross-initial_4.5.bb
>
> do_compile failed
> ERROR: Task 6228
> (/media/OpenEmbedded/unstable/org.openembedded.dev/recipes/gcc/gcc-cross-initial_4.5.bb,
>
> do_compile) failed
> NOTE: Waiting for 2 active tasks to finish
> NOTE: 1:
> /media/OpenEmbedded/unstable/org.openembedded.dev/recipes/classpath/classpath-native_0.98.bb,
>
> do_install (1885)
> NOTE: 2:
> virtual:native:/media/OpenEmbedded/unstable/org.openembedded.dev/recipes/xorg-lib/libx11_1.3.99.902.bb,
>
> do_install (1886)
> NOTE: Waiting for 1 active tasks to finish
> NOTE: 1:
> /media/OpenEmbedded/unstable/org.openembedded.dev/recipes/classpath/classpath-native_0.98.bb,
>
> do_install (1885)
> NOTE: Tasks Summary: Attempted 888 tasks of which 888 didn't need to
> be rerun and 1 failed.
> ERROR:
> '/media/OpenEmbedded/unstable/org.openembedded.dev/recipes/gcc/gcc-cross-initial_4.5.bb'
>
> failed
>
>
> Checking
>
> tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r12.0+svnr164562/gcc-4.5/build.i686-linux.arm-angstrom-linux-gnueabi/gcc/config.log
>
>
> reveals:
>
> configure:4791: checking whether compiler driver understands Ada
> configure:4814: result: no
> configure:4851: checking how to run the C preprocessor
> configure:4921: result: gcc -E
> configure:4941: gcc -E conftest.c
> configure:4941: $? = 0
> configure:4955: gcc -E conftest.c
> conftest.c:11: fatal error: ac_nonexistent.h: No such file or directory
> compilation terminated.
>
>
> Not sure if it has anything to do with it.
> I can't find ac_nonexistent.h, but perhaps this is intended looking at
> the filename...
> Any help is appreciated!
> Jaap

What configuration (MACHINE/DISTRO/branch/TARGET) are you trying to build?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


