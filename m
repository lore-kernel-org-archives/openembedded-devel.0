Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Gh7oI-0001Si-1B
	for openembedded-devel@openembedded.org; Mon, 06 Nov 2006 17:58:58 +0100
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kA6GvaLr012226 for <openembedded-devel@openembedded.org>;
	Mon, 6 Nov 2006 17:57:36 +0100
Message-ID: <454F697F.7060006@dominion.kabel.utwente.nl>
Date: Mon, 06 Nov 2006 17:57:35 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200611061111.13491.valentin.longchamp@epfl.ch>	<200611061221.28202.valentin.longchamp@epfl.ch>	<454F1F41.7060501@dominion.kabel.utwente.nl>
	<200611061653.05316.valentin.longchamp@epfl.ch>
In-Reply-To: <200611061653.05316.valentin.longchamp@epfl.ch>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
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
X-List-Received-Date: Mon, 06 Nov 2006 16:58:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Valentin Longchamp schreef:
> Koen Kooi wrote:
>> For some reason glibc needs 'gawk' and breaks with 'mawk' (which is the
>> default on debian). Could you try installing gawk? A recent .dev tree
>> should warn you about that[1].
>>
> 
> Ok, I've updated my openembedded tree and installed gawk. However, I now 
> cannot go any further than package gcc-cross-4.1.1 (which used to work with 
> my last week org.openembedded.dev):
> 
>>         gcc -c  
>> -isystem/home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/
>> tmp/staging/i686-linux/include -Os -DIN_GCC -DCROSS_COMPILE  -W -Wall
>> -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -pedantic
>> -Wno-long-long -Wno-variadic-macros -Wold-style-definition
>> -Wmissing-format-attribute    -DHAVE_CONFIG_H -I. -I.
>> -I/home/valentin/EPFL/iMXBoard/linux/openembedded/bu
>> ild/mx31ADS/conf/tmp/work/armv6-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/g
>> cc-4.1.1/gcc
>> -I/home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wo
>> rk/armv6-angstrom-linux-gnueabi/gc c-cross-4.1.1-r7/gcc-4.1.1/gcc/.
>> -I/home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wo
>> rk/armv6-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/../include
>> -I/home/valen
>> tin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/work/armv6-angs
>> trom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/../libcpp/include
>> -I/home/valentin/EPFL/iMXBoard/linux/openembedded/bu
>> ild/mx31ADS/conf/tmp/staging/i686-linux/include
>> -isystem/home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/
>> tmp/staging/i686-linux/include   -DSTANDARD_STARTFILE_PREFIX=\"../../../\"
>> -DSTANDARD_EXEC_PREFIX=\"/home/valentin/EPFL/iMXBoard/linux/openembedded/bu
>> ild/mx31ADS/conf/tmp/cross/lib/gcc/\"
>> -DSTANDARD_LIBEXEC_PREFIX=\"/home/valentin/EPFL/iMXBoard/linux/openembedded
>> /build/m x31ADS/conf/tmp/cross/libexec/gcc/\"
>> -DDEFAULT_TARGET_VERSION=\"4.1.1\"
>> -DDEFAULT_TARGET_MACHINE=\"arm-angstrom-linux-gnueabi\"
>> -DSTANDARD_BINDIR_PREFIX=\"/home/valentin/EPFL/iMXBoard/linux/openemb
>> edded/build/mx31ADS/conf/tmp/cross/bin/\"
>> -DTOOLDIR_BASE_PREFIX=\"../../../../\"  `test "X${SHLIB_LINK}" = "X" ||
>> test "yes" != "yes" || echo "-DENABLE_SHARED_LIBGCC"` `test
>> "X${SHLIB_MULTILIB}" = "X" || echo "-DNO_SHARED_LIBGCC_MULTILIB"` \
>>                 -I. -I.
>> -I/home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wo
>> rk/armv6-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc
>> -I/home/valentin/EPFL/iMXBoard/li
>> nux/openembedded/build/mx31ADS/conf/tmp/work/armv6-angstrom-linux-gnueabi/g
>> cc-cross-4.1.1-r7/gcc-4.1.1/gcc/.
>> -I/home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wo
>> rk/armv6-angs trom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/../include
>> -I/home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wo
>> rk/armv6-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.
>> 1/gcc/../libcpp/include
>> -I/home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/st
>> aging/i686-linux/include
>> /home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wo
>> rk/armv6-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/gcc/cp/g++spec
>> .c)
>> /home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/cros
>> s/bin/arm-angstrom-linux-gnueabi-as: unrecognized option `-Qy' make[2]: ***
>> [g++spec.o] Error 1
>> make[2]: Leaving directory
>> `/home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wor
>> k/armv6-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/build.i686-linux
>> .arm-angstrom-linux -gnueabi/gcc'
>> make[1]: *** [all-gcc] Error 2
>> make[1]: Leaving directory
>> `/home/valentin/EPFL/iMXBoard/linux/openembedded/build/mx31ADS/conf/tmp/wor
>> k/armv6-angstrom-linux-gnueabi/gcc-cross-4.1.1-r7/gcc-4.1.1/build.i686-linux
>> .arm-angstrom-linux -gnueabi'
>> make: *** [all] Error 2
>> FATAL: oe_runmake failed
> 
> Any idea of what is wrong here ? maybe because of armv6 (I see there is no 
> armv6 profile on angstrom, only armv4 and armv5te) ?

I think you can get around that with a rebuild from scratch.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFT2l/MkyGM64RGpERAjGjAKCc27+4KT1eAo8J10LxlxWwTmUmKwCfdTY1
IfCurslLm/bg1LH/BkGIftM=
=f1jL
-----END PGP SIGNATURE-----


