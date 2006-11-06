Received: from [128.178.50.133] (helo=smtp2.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1Gh2Yv-00034N-Mw
	for openembedded-devel@openembedded.org; Mon, 06 Nov 2006 12:22:45 +0100
Received: (qmail 17049 invoked by uid 107); 6 Nov 2006 11:21:28 -0000
Received: from mailav3.epfl.ch (128.178.50.11)
	by smtp2.epfl.ch with SMTP; 6 Nov 2006 11:21:28 -0000
Received: from (smtp0.epfl.ch [128.178.50.19]) by MAILAV3.epfl.ch with smtp
	id 627d_f243c072_6d88_11db_97fa_0014221528b0;
	Mon, 06 Nov 2006 12:21:27 +0100
Received: from mailbox2.epfl.ch (128.178.50.104)
	by smtp0.epfl.ch (AngelmatoPhylax SMTP proxy);
	Mon, 06 Nov 2006 12:21:28 +0100
Received: from lsa1pc7.epfl.ch (lsa1pc7.epfl.ch [128.178.145.53])
	(authenticated bits=0)
	by mailbox2.epfl.ch (8.12.11/8.12.11) with ESMTP id kA6BLSDd003092
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Nov 2006 12:21:28 +0100 (MET)
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
Organization: EPFL STI-IPR-LSRO1
To: openembedded-devel@openembedded.org
Date: Mon, 6 Nov 2006 12:21:28 +0100
User-Agent: KMail/1.9.5
References: <200611061111.13491.valentin.longchamp@epfl.ch>
	<454F0DCA.7040202@dominion.kabel.utwente.nl>
In-Reply-To: <454F0DCA.7040202@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Message-Id: <200611061221.28202.valentin.longchamp@epfl.ch>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: Problem in building compiler
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
X-List-Received-Date: Mon, 06 Nov 2006 11:22:46 -0000
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_4qxTFPx1tyE5w0/"

--Boundary-00=_4qxTFPx1tyE5w0/
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Koen Kooi wrote:

> Does the same error happen with MACHINE=mx31ads and DISTRO=angstrom-2007.1
> ? I recommend using that configuration and adding 'branding' later on when
> it's proven to work.
>

Sorry for the double-post, but it looks like the attached error file didn't 
make it through the mailing-list this time. So I past it here (and attach it 
once more).

So the config file, tells to use glibc-2.5, but the compilation fails on the 
same package (glibc-intermediate).

The error is visible in the attach error log.

> | mawk -f scripts/gen-sorted.awk \
> |              -v subdirs='csu assert ctype locale intl catgets math setjmp
> | signal stdlib stdio-common libio malloc string wcsmbs time dirent grp pwd
> | posix io termios resource misc socket sysvipc gmon gnulib iconv iconvdata
> | wctype manual shadow po argp crypt nss localedata timezone rt conform
> | debug  dlfcn elf' \ -v srcpfx='' \
> |              nptl/sysdeps/pthread/Subdirs sysdeps/unix/inet/Subdirs
> | sysdeps/unix/Subdirs assert/Depend intl/Depend catgets/Depend
> | stdlib/Depend stdio-common/Depend libio/Depend malloc/Depend
> | string/Depend wcsmbs/Depend time/Depend posix/Depend iconvdata/Depend
> | nss/Depend localedata/Depend rt/Depend debug/Depend >
> | /home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wo
> |rk/armv6-angstrom-linux-gnueabi/glibc-intermediate-2.5-r1/build-arm-angstr
> |om-linux-gnueabi/sysd-sorted-tmp mawk: scripts/gen-sorted.awk: line 19:
> | regular expression compile failed (bad class -- [], [^] or [) /[^
> | mawk: scripts/gen-sorted.awk: line 19: syntax error at or near ]
> | mawk: scripts/gen-sorted.awk: line 19: runaway regular expression /, "",
> | subd ... rm -f
> | /home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wo
> |rk/armv6-angstrom-linux-gnueabi/glibc-intermediate-2.5-r1/build-arm-angstr
> |om-linux-gnueabi/stamp.o; >
> | /home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wo
> |rk/armv6-angstrom-linux-gnueabi/glibc-intermediate-2.5-r1/build-arm-angstr
> |om-linux-gnueabi/stamp.o rm -f
> | /home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wo
> |rk/armv6-angstrom-linux-gnueabi/glibc-intermediate-2.5-r1/build-arm-angstr
> |om-linux-gnueabi/stamp.os; >
> | /home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wo
> |rk/armv6-angstrom-linux-gnueabi/glibc-intermediate-2.5-r1/build-arm-angstr
> |om-linux-gnueabi/stamp.os rm -f
> | /home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wo
> |rk/armv6-angstrom-linux-gnueabi/glibc-intermediate-2.5-r1/build-arm-angstr
> |om-linux-gnueabi/stamp.oS; >
> | /home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wo
> |rk/armv6-angstrom-linux-gnueabi/glibc-intermediate-2.5-r1/build-arm-angstr
> |om-linux-gnueabi/stamp.oS cd
> | /home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wo
> |rk/armv6-angstrom-linux-gnueabi/glibc-intermediate-2.5-r1/build-arm-angstr
> |om-linux-gnueabi &&
> | /home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/cr
> |oss/lib/gcc/arm-angstrom-linux-gnueabi/4.1.1/../../../../arm-angstrom-linu
> |x-gnueabi/bin/ar cruv libc.a `cat stamp.o`
> |
> | : /home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/
> | :work/armv6-angstrom-linux-gnueabi/glibc-intermediate-2.5-r1/build-arm-an
> | :gstrom-linux-gnueabi/libc.a
> |
> | cd
> | /home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wo
> |rk/armv6-angstrom-linux-gnueabi/glibc-intermediate-2.5-r1/build-arm-angstr
> |om-linux-gnueabi &&
> | /home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/cr
> |oss/lib/gcc/arm-angstrom-linux-gnueabi/4.1.1/../../../../arm-angstrom-linu
> |x-gnueabi/bin/ar cruv libc_pic.a `cat stamp.os`
> |
> | : /home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/
> | :work/armv6-angstrom-linux-gnueabi/glibc-intermediate-2.5-r1/build-arm-an
> | :gstrom-linux-gnueabi/libc_pic.a
> |
> | cd
> | /home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wo
> |rk/armv6-angstrom-linux-gnueabi/glibc-intermediate-2.5-r1/build-arm-angstr
> |om-linux-gnueabi &&
> | /home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/cr
> |oss/lib/gcc/arm-angstrom-linux-gnueabi/4.1.1/../../../../arm-angstrom-linu
> |x-gnueabi/bin/ar cruv libc_nonshared.a `cat stamp.oS`
> |
> | : /home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/
> | :work/armv6-angstrom-linux-gnueabi/glibc-intermediate-2.5-r1/build-arm-an
> | :gstrom-linux-gnueabi/libc_nonshared.a
> |
> | make[1]: *** No rule to make target
> | `/home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/w
> |ork/armv6-angstrom-linux-gnueabi/glibc-intermediate-2.5-r1/build-arm-angst
> |rom-linux-gnueabi/Versions.all', needed by
> | `/home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/w
> |ork/armv6-angstrom-linux-gnueabi/glibc-intermediate-2.5-r1/build-arm-angst
> |rom-linux-gnueabi/abi-versions.h'.  Stop. make[1]: Leaving directory
> | `/home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/w
> |ork/armv6-angstrom-linux-gnueabi/glibc-intermediate-2.5-r1/glibc-2.5'
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
>
> NOTE: Task failed:
> /home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/work
>/armv6-angstrom-linux-gnueabi/glibc-intermediate-2.5-r1/temp/log.do_compile.
>7466 NOTE: package glibc-intermediate-2.5-r1: task do_compile: failed
> ERROR: TaskFailed event exception, aborting
> NOTE: package glibc-intermediate-2.5: failed

Looks like the glibc doesn't compile well for iMX31 processor options proposed 
by oe. Or is it something else ?

Regards,

Valentin

--Boundary-00=_4qxTFPx1tyE5w0/--
