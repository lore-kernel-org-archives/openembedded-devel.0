Received: from [128.178.50.26] (helo=smtp3.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1Gh6np-0004ah-1q
	for openembedded-devel@openembedded.org; Mon, 06 Nov 2006 16:54:25 +0100
Received: (qmail 6055 invoked by uid 107); 6 Nov 2006 15:53:05 -0000
Received: from mailav3.epfl.ch (128.178.50.11)
	by smtp3.epfl.ch with SMTP; 6 Nov 2006 15:53:05 -0000
Received: from (smtp0.epfl.ch [128.178.50.19]) by MAILAV3.epfl.ch with smtp
	id 6305_e413b568_6dae_11db_96fb_0014221528b0;
	Mon, 06 Nov 2006 16:53:04 +0100
Received: from mailbox2.epfl.ch (128.178.50.104)
	by smtp0.epfl.ch (AngelmatoPhylax SMTP proxy);
	Mon, 06 Nov 2006 16:53:05 +0100
Received: from lsa1pc7.epfl.ch (lsa1pc7.epfl.ch [128.178.145.53])
	(authenticated bits=0)
	by mailbox2.epfl.ch (8.12.11/8.12.11) with ESMTP id kA6Fr5wf003643
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Nov 2006 16:53:05 +0100 (MET)
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
Organization: EPFL STI-IPR-LSRO1
To: openembedded-devel@openembedded.org
Date: Mon, 6 Nov 2006 16:53:05 +0100
User-Agent: KMail/1.9.5
References: <200611061111.13491.valentin.longchamp@epfl.ch>
	<200611061221.28202.valentin.longchamp@epfl.ch>
	<454F1F41.7060501@dominion.kabel.utwente.nl>
In-Reply-To: <454F1F41.7060501@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Message-Id: <200611061653.05316.valentin.longchamp@epfl.ch>
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
X-List-Received-Date: Mon, 06 Nov 2006 15:54:25 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Koen Kooi wrote:
>
> For some reason glibc needs 'gawk' and breaks with 'mawk' (which is the
> default on debian). Could you try installing gawk? A recent .dev tree
> should warn you about that[1].
>

Ok, I've updated my openembedded tree and installed gawk. However, I now 
cannot go any further than package gcc-cross-4.1.1 (which used to work with 
my last week org.openembedded.dev):

>         gcc -c  
> -isystem/home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/
>tmp/staging/i686-linux/include -Os -DIN_GCC -DCROSS_COMPILE  -W -Wall
> -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -pedantic
> -Wno-long-long -Wno-variadic-macros -Wold-style-definition
> -Wmissing-format-attribute    -DHAVE_CONFIG_H -I. -I.
> -I/home/valentin/EPFL/iMXBoard/linux/openembedded/bu
> ild/mx31ADS/conf/tmp/work/armv6-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/g
>cc-4.1.1/gcc
> -I/home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wo
>rk/armv6-angstrom-linux-gnueabi/gc c-cross-4.1.1-r7/gcc-4.1.1/gcc/.
> -I/home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wo
>rk/armv6-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/../include
> -I/home/valen
> tin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/work/armv6-angs
>trom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/../libcpp/include
> -I/home/valentin/EPFL/iMXBoard/linux/openembedded/bu
> ild/mx31ADS/conf/tmp/staging/i686-linux/include
> -isystem/home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/
>tmp/staging/i686-linux/include   -DSTANDARD_STARTFILE_PREFIX=\"../../../\"
> -DSTANDARD_EXEC_PREFIX=\"/home/valentin/EPFL/iMXBoard/linux/openembedded/bu
>ild/mx31ADS/conf/tmp/cross/lib/gcc/\"
> -DSTANDARD_LIBEXEC_PREFIX=\"/home/valentin/EPFL/iMXBoard/linux/openembedded
>/build/m x31ADS/conf/tmp/cross/libexec/gcc/\"
> -DDEFAULT_TARGET_VERSION=\"4.1.1\"
> -DDEFAULT_TARGET_MACHINE=\"arm-angstrom-linux-gnueabi\"
> -DSTANDARD_BINDIR_PREFIX=\"/home/valentin/EPFL/iMXBoard/linux/openemb
> edded/build/mx31ADS/conf/tmp/cross/bin/\"
> -DTOOLDIR_BASE_PREFIX=\"../../../../\"  `test "X${SHLIB_LINK}" = "X" ||
> test "yes" != "yes" || echo "-DENABLE_SHARED_LIBGCC"` `test
> "X${SHLIB_MULTILIB}" = "X" || echo "-DNO_SHARED_LIBGCC_MULTILIB"` \
>                 -I. -I.
> -I/home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wo
>rk/armv6-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc
> -I/home/valentin/EPFL/iMXBoard/li
> nux/openembedded/build/mx31ADS/conf/tmp/work/armv6-angstrom-linux-gnueabi/g
>cc-cross-4.1.1-r7/gcc-4.1.1/gcc/.
> -I/home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wo
>rk/armv6-angs trom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/../include
> -I/home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wo
>rk/armv6-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.
> 1/gcc/../libcpp/include
> -I/home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/st
>aging/i686-linux/include
> /home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wo
> rk/armv6-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/cp/g++spec
>.c)
> /home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/cros
>s/bin/arm-angstrom-linux-gnueabi-as: unrecognized option `-Qy' make[2]: ***
> [g++spec.o] Error 1
> make[2]: Leaving directory
> `/home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wor
>k/armv6-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/build.i686-linux
>.arm-angstrom-linux -gnueabi/gcc'
> make[1]: *** [all-gcc] Error 2
> make[1]: Leaving directory
> `/home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wor
>k/armv6-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/build.i686-linux
>.arm-angstrom-linux -gnueabi'
> make: *** [all] Error 2
> FATAL: oe_runmake failed

Any idea of what is wrong here ? maybe because of armv6 (I see there is no 
armv6 profile on angstrom, only armv4 and armv5te) ?

Regards,

Valentin


