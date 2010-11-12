Received: from usps2.crhc.illinois.edu ([130.126.143.231]
	helo=usps.crhc.uiuc.edu) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <johnso87@crhc.illinois.edu>) id 1PH1ix-0001WS-5Z
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Nov 2010 23:04:04 +0100
Received: from usps.crhc.uiuc.edu (localhost [127.0.0.1])
	by usps.crhc.uiuc.edu (Postfix) with ESMTP id 23037340009F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Nov 2010 16:02:59 -0600 (CST)
Received: from [192.168.1.198] (unknown [63.252.64.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: johnso87)
	by usps.crhc.uiuc.edu (Postfix) with ESMTPSA id E8926340008F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Nov 2010 16:02:58 -0600 (CST)
Message-ID: <4CDDB992.7000603@crhc.illinois.edu>
Date: Fri, 12 Nov 2010 16:02:58 -0600
From: Matt Johnson <johnso87@crhc.illinois.edu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9pre) Gecko/20100217 Lightning/1.0b1 Shredder/3.0.3pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 130.126.143.231
X-SA-Exim-Mail-From: johnso87@crhc.illinois.edu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RCVD_IN_BL_SPAMCOP_NET autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: gcc-4.5 r166342 PCHFLAGS problem
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
X-List-Received-Date: Fri, 12 Nov 2010 22:04:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,
     I built gcc-cross from x86_64 host to armv7a target using gcc 4.5 
r166342.  I then tried to bitbake gcc (an armv7a-host, armv7a-target 
native compiler) with the same revision and got build errors on libstdc++:

make[3]: Entering directory 
`/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3'
Making all in include
make[4]: Entering directory 
`/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/include'
mkdir -p ./arm-angstrom-linux-gnueabi/bits/stdc++.h.gch
libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv7-a 
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork 
-mno-thumb 
--sysroot=/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/sysroots/armv7a-angstrom-linux-gnueabi 
-c -I. 
-I/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/libobjc 
-g -Os -W -Wall -Wwrite-strings -Wstrict-prototypes -DIN_GCC 
-DIN_TARGET_LIBS -fno-strict-aliasing -fexceptions 
-I/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/libobjc/objc 
-I/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/libobjc/../gcc 
-I/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/libobjc/../gcc/config 
-I../.././gcc 
-I/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/libobjc/../include 
/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/libobjc/archive.c  
-fPIC -DPIC -o .libs/archive.o
arm-angstrom-linux-gnueabi-g++ -march=armv7-a -mtune=cortex-a8 
-mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb  
--sysroot=/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/sysroots/armv7a-angstrom-linux-gnueabi   
-x c++-header -g -Os 
-I/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/include/arm-angstrom-linux-gnueabi 
-I/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/include 
-I/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/libstdc++-v3/libsupc++ 
-O2 -g -std=gnu++0x 
/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/libstdc++-v3/include/precompiled/stdc++.h 
\
         -o arm-angstrom-linux-gnueabi/bits/stdc++.h.gch/O2ggnu++0x.gch
libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv7-a 
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork 
-mno-thumb 
--sysroot=/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/sysroots/armv7a-angstrom-linux-gnueabi 
-c -I. 
-I/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/libobjc 
-g -Os -W -Wall -Wwrite-strings -Wstrict-prototypes -DIN_GCC 
-DIN_TARGET_LIBS -fno-strict-aliasing -fexceptions 
-I/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/libobjc/objc 
-I/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/libobjc/../gcc 
-I/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/libobjc/../gcc/config 
-I../.././gcc 
-I/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/libobjc/../include 
/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/libobjc/archive.c 
-o archive.o >/dev/null 2>&1
In file included from 
/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/include/fenv.h:50:0,
                  from 
/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/include/cfenv:44,
                  from 
/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/libstdc++-v3/include/precompiled/stdc++.h:54:
/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/include/tr1_impl/cfenv:49:11: 
error: '::fenv_t' has not been declared
/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/include/tr1_impl/cfenv:50:11: 
error: '::fexcept_t' has not been declared
/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/include/tr1_impl/cfenv:53:11: 
error: '::feclearexcept' has not been declared
/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/include/tr1_impl/cfenv:54:11: 
error: '::fegetexceptflag' has not been declared
/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/include/tr1_impl/cfenv:55:11: 
error: '::feraiseexcept' has not been declared
/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/include/tr1_impl/cfenv:56:11: 
error: '::fesetexceptflag' has not been declared
/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/include/tr1_impl/cfenv:57:11: 
error: '::fetestexcept' has not been declared
/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/include/tr1_impl/cfenv:59:11: 
error: '::fegetround' has not been declared
/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/include/tr1_impl/cfenv:60:11: 
error: '::fesetround' has not been declared
/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/include/tr1_impl/cfenv:62:11: 
error: '::fegetenv' has not been declared
/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/include/tr1_impl/cfenv:63:11: 
error: '::feholdexcept' has not been declared
/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/include/tr1_impl/cfenv:64:11: 
error: '::fesetenv' has not been declared
/media/d2/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r19.1+svnr166342/gcc-4.5/build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/include/tr1_impl/cfenv:65:11: 
error: '::feupdateenv' has not been declared

The issue has been discussed here: 
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=40974

I tried the suggested fix by adding -nostdinc++ to PCHFLAGS in 
libstdc++-v3/include/Makefile.am, but this appears not to propagate to 
build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/include/Makefile, 
for OE reasons I don't understand.  I tried "bitbake gcc -c compile" 
once, got it to fail, changed 
build.arm-angstrom-linux-gnueabi.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/include/Makefile 
directly, then reran "bitbake gcc -c compile", and it worked.

Perhaps someone wiser than I can turn this into a patch that works.
Best,
Matt

-- 
Matt Johnson
Graduate Student
University of Illinois at Urbana-Champaign, Dept. of ECE
Coordinated Science Lab, Rm. 213


