Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MATDW-0006uu-Tr
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 20:23:39 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MAT5D-0002aC-03
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 18:15:03 +0000
Received: from r63h48.res.gatech.edu ([128.61.63.48])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 30 May 2009 18:15:02 +0000
Received: from dank2340 by r63h48.res.gatech.edu with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 30 May 2009 18:15:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Dan <dank2340@gmail.com>
Date: Sat, 30 May 2009 18:04:50 +0000 (UTC)
Message-ID: <loom.20090530T180147-530@post.gmane.org>
References: <4A213D52.8050802@gmail.com> <gvrh09$88g$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 128.61.63.48 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.0.10) Gecko/2009042523 Ubuntu/9.04 (jaunty) Firefox/3.0.10)
Sender: news <news@ger.gmane.org>
Subject: Re: Trying to build cmake in OE for BeagleBoard (errors)
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
X-List-Received-Date: Sat, 30 May 2009 18:23:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi <k.kooi <at> student.utwente.nl> writes:

> 
> On 30-05-09 16:06, Dan wrote:
> > Hi all,
> >
> > I'm trying to build cmake in OE for the Beagle Board from Angstrom
> > stable/2009. I can build
> > cmake-native correctly, but that's for my host. When I try $bitbake
> > cmake, I get errors. The recipe that comes in the OE repository is for
> > version 2.4.8. I tried copying and pasting the .bb and renaming to the
> > latest version 2.6.4 and get the same exact errors. I am able to build
> > other packages like console-image correctly.
> >
> > Here's my errors from cmake-2.6.4:
> >
> >
> > The cmake_bootstrap.log says this:
> >
> > Try: ccache
> > Line: ccache -isystem/oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/
> > include -fexpensive-optimizations -frename-registers -fomit-frame-
> > pointer -O2 cmake_bootstrap_31053.test.c -o cmake_bootstrap_31053.test
> 
> It seems cmake treats $CC was a single word instead of the string it is. 
> So instead of it doing 'ccache arm-angstrom-linux-gnueabi-gcc <stuff>' 
> it is doing 'ccache <stuff>'.
> 
> I think you can get around it by disabling ccache (CCACHE=""), but it 
> means cmake will also ignore $TARGET_CC_ARCH, which is a bit more severe.
> 
> regards,
> 
> Koen
> 


Thanks for replying Koen. I tried that. Same errors except the
cmake_bootstrap.log no longer complains about the ccache, but it still complains
about everything else. Any other ideas?

On a side note, can OE autotools work with cmake files instead of ./configure?
Then I could just avoid this mess entirely!


cmake_bootstrap.log:


Try: arm-angstrom-linux-gnueabi-gcc
Line: arm-angstrom-linux-gnueabi-gcc
-isystem/oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
cmake_bootstrap_1657.test.c -o cmake_bootstrap_1657.test
----------  file   -----------------------
#ifdef __cplusplus
# error "The CMAKE_C_COMPILER is set to a C++ compiler"
#endif

#include<stdio.h>

#if defined(__CLASSIC_C__)
int main(argc, argv)
  int argc;
  char* argv[];
#else
int main(int argc, char* argv[])
#endif
{
  printf("%d\n", (argv != 0));
  return argc-1;
}
------------------------------------------
/oe/tmp/work/armv7a-angstrom-linux-gnueabi/cmake-2.6.4-r1/cmake-2.6.4/bootstrap:
line 439: ./cmake_bootstrap_1657.test: cannot execute binary file
Test produced non-zero return code
Try: -march=armv7-a
Line: -march=armv7-a
-isystem/oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
cmake_bootstrap_1657.test.c -o cmake_bootstrap_1657.test
----------  file   -----------------------
#ifdef __cplusplus
# error "The CMAKE_C_COMPILER is set to a C++ compiler"
#endif

#include<stdio.h>

#if defined(__CLASSIC_C__)
int main(argc, argv)
  int argc;
  char* argv[];
#else
int main(int argc, char* argv[])
#endif
{
  printf("%d\n", (argv != 0));
  return argc-1;
}
------------------------------------------
/oe/tmp/work/armv7a-angstrom-linux-gnueabi/cmake-2.6.4-r1/cmake-2.6.4/bootstrap:
line 429: -march=armv7-a: command not found
Test failed to compile
Try: -mtune=cortex-a8
Line: -mtune=cortex-a8
-isystem/oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
cmake_bootstrap_1657.test.c -o cmake_bootstrap_1657.test
----------  file   -----------------------
#ifdef __cplusplus
# error "The CMAKE_C_COMPILER is set to a C++ compiler"
#endif

#include<stdio.h>

#if defined(__CLASSIC_C__)
int main(argc, argv)
  int argc;
  char* argv[];
#else
int main(int argc, char* argv[])
#endif
{
  printf("%d\n", (argv != 0));
  return argc-1;
}
------------------------------------------
/oe/tmp/work/armv7a-angstrom-linux-gnueabi/cmake-2.6.4-r1/cmake-2.6.4/bootstrap:
line 429: -mtune=cortex-a8: command not found
Test failed to compile
Try: -mfpu=neon
Line: -mfpu=neon
-isystem/oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
cmake_bootstrap_1657.test.c -o cmake_bootstrap_1657.test
----------  file   -----------------------
#ifdef __cplusplus
# error "The CMAKE_C_COMPILER is set to a C++ compiler"
#endif

#include<stdio.h>

#if defined(__CLASSIC_C__)
int main(argc, argv)
  int argc;
  char* argv[];
#else
int main(int argc, char* argv[])
#endif
{
  printf("%d\n", (argv != 0));
  return argc-1;
}
------------------------------------------
/oe/tmp/work/armv7a-angstrom-linux-gnueabi/cmake-2.6.4-r1/cmake-2.6.4/bootstrap:
line 429: -mfpu=neon: command not found
Test failed to compile
Try: -mfloat-abi=softfp
Line: -mfloat-abi=softfp
-isystem/oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
cmake_bootstrap_1657.test.c -o cmake_bootstrap_1657.test
----------  file   -----------------------
#ifdef __cplusplus
# error "The CMAKE_C_COMPILER is set to a C++ compiler"
#endif

#include<stdio.h>

#if defined(__CLASSIC_C__)
int main(argc, argv)
  int argc;
  char* argv[];
#else
int main(int argc, char* argv[])
#endif
{
  printf("%d\n", (argv != 0));
  return argc-1;
}
------------------------------------------
/oe/tmp/work/armv7a-angstrom-linux-gnueabi/cmake-2.6.4-r1/cmake-2.6.4/bootstrap:
line 429: -mfloat-abi=softfp: command not found
Test failed to compile



Thanks.

-Dan



