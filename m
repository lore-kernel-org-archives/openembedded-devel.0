Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LY34c-0004hV-VB
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 19:47:39 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx01.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LY33B-0001N3-Up
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 12:46:10 -0600
Message-ID: <4995BFE1.7090900@dls.net>
Date: Fri, 13 Feb 2009 12:45:53 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.19) Gecko/20081209 Thunderbird/2.0.0.19 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
Subject: boost-1.36.0 fails when compiling; cannot find the compiler
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
X-List-Received-Date: Fri, 13 Feb 2009 18:47:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Boost 1.36.0 fails to build, do_compile log is below.  In a nutshell, it
seems to have lost the PATH variable.  The 1.33.1 version builds just fine.

The compiler is present.  The PATH is set correctly, it appears, from
the run.do_compile file.  So I can only presume that whatever "bjam" is,
its resetting the PATH or something.

Nothing else has changed in the environment; 1.33.1 builds, 1.36.0
doesn't, and I have no idea what the heck this "bjam" stuff is or how to
debug it.

Any suggestions?  Does this work for anyone else?

Mike (mwester)


-----------
+ bjam -sTOOLS=gcc '-sGCC=armeb-linux-gnueabi-gcc -march=armv5te
-mtune=xscale -mno-thumb-interwork -mno-thumb -mno-thumb-interwork
-mno-thumb  -L/u/slug/slugos/tmp/staging/armv5teb-linux-gnueabi/usr/lib
-Wl,-rpath-link,/u/slug/slugos/tmp/staging/armv5teb-linux-gnueabi/usr/lib
-Wl,-O1 ${TARGET_LINK_HASH_STYLE}
'\''-DBOOST_PLATFORM_CONFIG="boost/config/platform/linux-gnueabi.hpp"'\'''
'-sGXX=armeb-linux-gnueabi-g++ -march=armv5te -mtune=xscale
-mno-thumb-interwork -mno-thumb -mno-thumb-interwork -mno-thumb
-L/u/slug/slugos/tmp/staging/armv5teb-linux-gnueabi/usr/lib
-Wl,-rpath-link,/u/slug/slugos/tmp/staging/armv5teb-linux-gnueabi/usr/lib
-Wl,-O1 ${TARGET_LINK_HASH_STYLE}
'\''-DBOOST_PLATFORM_CONFIG="boost/config/platform/linux-gnueabi.hpp"'\'''
-sGCC_INCLUDE_DIRECTORY=/u/slug/slugos/tmp/staging/armv5teb-linux-gnueabi/usr/include
-sGCC_STDLIB_DIRECTORY=/u/slug/slugos/tmp/staging/armv5teb-linux-gnueabi/usr/lib
-sNO_BZIP2=1 -sNO_ZLIB=1 '-sBUILD=release <optimization>space
<inlining>on <debug-symbols>off' '-sPYTHON_VERSION=${PYTHON_VERSION}'
--layout=system
--builddir=/u/slug/slugos/tmp/work/armv5teb-linux-gnueabi/boost-1.36.0-r5/boost_1_36_0/armeb-linux-gnueabi
--prefix=/usr --exec-prefix=/usr --libdir=/usr/lib --includedir=/usr/include
warning: Graph library does not contain optional GraphML reader.
note: to enable GraphML support, set EXPAT_INCLUDE and EXPAT_LIBPATH to the
note: directories containing the Expat headers and libraries, respectively.
warning: skipping optional Message Passing Interface (MPI) library.
note: to enable MPI support, add "using mpi ;" to user-config.jam.
note: to suppress this message, pass "--without-mpi" to bjam.
note: otherwise, you can safely ignore this message.
Building Boost.Regex with the optional Unicode/ICU support disabled.
Please refer to the Boost.Regex documentation for more information
(don't panic: this is a strictly optional feature).
...patience...
...patience...
...patience...
...found 5258 targets...
...updating 765 targets...
MkDir1-quick-fix-for-unix bin.v2
MkDir1-quick-fix-for-unix bin.v2/libs
MkDir1-quick-fix-for-unix bin.v2/libs/math
MkDir1-quick-fix-for-unix bin.v2/libs/math/build
MkDir1-quick-fix-for-unix bin.v2/libs/math/build/gcc-4.3.1
MkDir1-quick-fix-for-unix bin.v2/libs/math/build/gcc-4.3.1/release
MkDir1-quick-fix-for-unix
bin.v2/libs/math/build/gcc-4.3.1/release/threading-multi
gcc.compile.c++
bin.v2/libs/math/build/gcc-4.3.1/release/threading-multi/acosh.o
armeb-linux-gnueabi-g++: : No such file or directory

    "armeb-linux-gnueabi-g++" "-march=armv5te" "-mtune=xscale"
"-mno-thumb-interwork" "-mno-thumb" "-mno-thumb-interwork" "-mno-thumb"
"-L/u/slug/slugos/tmp/staging/armv5teb-linux-gnueabi/usr/lib"
"-Wl,-rpath-link,/u/slug/slugos/tmp/staging/armv5teb-linux-gnueabi/usr/lib"
"-Wl,-O1" "${TARGET_LINK_HASH_STYLE}"  -ftemplate-depth-128 -O3
-finline-functions -Wno-inline -Wall -fPIC -pthread
-DBOOST_ALL_NO_LIB=1 -DBOOST_MATH_TR1_DYN_LINK=1 -DNDEBUG  -I"." -c -o
"bin.v2/libs/math/build/gcc-4.3.1/release/threading-multi/acosh.o"
"libs/math/build/../src/tr1/acosh.cpp"

...failed gcc.compile.c++
bin.v2/libs/math/build/gcc-4.3.1/release/threading-multi/acosh.o...
...removing bin.v2/libs/math/build/gcc-4.3.1/release/threading-multi/acosh.o
gcc.compile.c++
bin.v2/libs/math/build/gcc-4.3.1/release/threading-multi/asinh.o
armeb-linux-gnueabi-g++: : No such file or directory



