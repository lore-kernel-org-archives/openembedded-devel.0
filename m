Received: from [208.51.207.131] (helo=mail.2mi.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jader@2mi.com.br>) id 1LrIZV-0000or-FJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 23:13:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.2mi.com.br (Postfix) with ESMTP id D523350277F0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Apr 2009 18:15:18 -0300 (BRT)
X-Virus-Scanned: amavisd-new at 2mi.com.br
Received: from mail.2mi.com.br ([127.0.0.1])
	by localhost (mail.2mi.com.br [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ya5TpcwH0arv
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Apr 2009 18:15:13 -0300 (BRT)
Received: from [192.168.15.105] (unknown [189.102.204.146])
	by mail.2mi.com.br (Postfix) with ESMTP id 5FFFA502762C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Apr 2009 18:15:07 -0300 (BRT)
Message-ID: <49DBC0A7.7040406@2mi.com.br>
Date: Tue, 07 Apr 2009 18:07:51 -0300
From: "Jader H. Silva" <jader@2mi.com.br>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1237835454.6521.9.camel@northpole>
	<grg0jf$sem$1@ger.gmane.org>	<49DB935B.3000907@2mi.com.br>	<20090407183328.GH2195@smtp.west.cox.net>	<49DBA326.4060401@2mi.com.br>
	<20090407195639.GI2195@smtp.west.cox.net>
In-Reply-To: <20090407195639.GI2195@smtp.west.cox.net>
X-SA-Exim-Connect-IP: 208.51.207.131
X-SA-Exim-Mail-From: jader@2mi.com.br
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libxml2-native build against host zlib.h
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
X-List-Received-Date: Tue, 07 Apr 2009 21:13:19 -0000
Content-Type: multipart/mixed; boundary="------------030408070405010303090901"

--------------030408070405010303090901
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Tom Rini escreveu:
> On Tue, Apr 07, 2009 at 04:01:58PM -0300, Jader H. Silva wrote:
>   
>> Tom Rini escreveu:
>>     
>>> On Tue, Apr 07, 2009 at 02:54:35PM -0300, Jader H. Silva wrote:
>>>   
>>>       
>>>> Koen Kooi escreveu:
>>>>     
>>>>         
>>>>> On 23-03-09 20:10, Jader H. Silva wrote:
>>>>>       
>>>>>           
>>>>>>     It seems libxml2-native is built using host zlib.h.
>>>>>>     My host have a symbol redefinition in zlib.h (gzopen ->    
>>>>>> gzopen64), but
>>>>>>     that symbol does not exists in OE compiled library.
>>>>>>     Setting --with-zlib=${STAGING_INCIR}/zlib.h in libxml2-native.inc
>>>>>>     solved it. There's a patch attached.
>>>>>>         
>>>>>>             
>>>>> The patch seems to solve the problem, could you resend a version 
>>>>> that  bumps the PR as well? Once this in .dev we should apply it to 
>>>>>  stable/2008 as well.
>>>>>
>>>>> regards,
>>>>>
>>>>> Koen
>>>>>       
>>>>>           
>>>> Patch with compilation fix and PR update is attached.
>>>>     
>>>>         
>>> As Khem pointed out previously, this is not correct, NACK.  From the
>>> configure script --help:
>>>   --with-zlib[=DIR]       use libz in DIR
>>> So this should be adding '--with-zlib=${STAGING_INCIR}'
>>>
>>>   
>>>       
>> --with-zlib=${STAGING_INCDIR} don't fix it.
>>     
>
> That's odd.  Reading libxml2-native-2.7.2-r2/libxml2-2.7.2/configure I
> don't see how that value being a file and not a dir could work.  In
> fact, moving my system zlib.h out of the way and reading config.log I
> see things like:
> configure:12246: checking zlib.h usability
> configure:12263: gcc -c
> -isystem/home/trini/work/OE-upstream/tmp.4.3.3/staging/x86_64-linux/usr/include
> -O2
> -isystem/home/trini/work/OE-upstream/tmp.4.3.3/staging/x86_64-linux/usr/include
> conftest.c >&5
> configure:12269: $? = 0
> configure:12283: result: yes
> configure:12287: checking zlib.h presence
> configure:12302: gcc -E
> -isystem/home/trini/work/OE-upstream/tmp.4.3.3/staging/x86_64-linux/usr/include
> conftest.c
> configure:12308: $? = 0
> configure:12322: result: yes
> configure:12350: checking for zlib.h
> configure:12358: result: yes
>   
It is indeed really puzzling. It was a simple test check when anything 
else didn't work.
> Can you tell us more about what host system you're using and possibly
> just as importantly what config.log looks like when you use your patch?
> I'm not saying you don't have a failure, I'm just saying it's puzzling
> that your patch works.
>   
I'm using ubuntu 8.04, zlib1g-dev package is installed.
I can compile it without problems in a machine where zlib1g-dev is not 
installed.

Attached there's the log.do_compile and config.log.nok originated from a 
failed compilation and config.log from a successful compilation after my 
patch was applied.
> Also, trying to figure out when zlib-native gets pulled in and I see
> it's coming from file-native, so perhaps we should, while we're in here
> anyhow, add zlib-native to the dep list for libxml2-native?
>
>   
I agree that is most likely to correctly solve this problem. I will try 
it and report back.
This file contains any messages produced by compilers while
running configure, to aid debugging if configure makes a mistake.

It was created by configure, which was
generated by GNU Autoconf 2.61.  Invocation command line was

  $ /home/jader/thinstation/build/tmp/work/i686-linux/libxml2-native-2.7.2-r2/libxml2-2.7.2/configure --build=i686-linux --host=i686-linux --target=i686-linux --prefix=/home/jader/thinstation/build/tmp/staging/i686-linux/usr --exec_prefix=/home/jader/thinstation/build/tmp/staging/i686-linux/usr --bindir=/home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin --sbindir=/home/jader/thinstation/build/tmp/staging/i686-linux/usr/sbin --libexecdir=/home/jader/thinstation/build/tmp/staging/i686-linux/usr/libexec --datadir=/home/jader/thinstation/build/tmp/staging/i686-linux/usr/share --sysconfdir=/home/jader/thinstation/build/tmp/staging/i686-linux/etc --sharedstatedir=/home/jader/thinstation/build/tmp/staging/i686-linux/usr/com --localstatedir=/home/jader/thinstation/build/tmp/staging/i686-linux/var --libdir=/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib --includedir=/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include --oldincludedir=/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include --infodir=/home/jader/thinstation/build/tmp/staging/i686-linux/usr/share/info --mandir=/home/jader/thinstation/build/tmp/staging/i686-linux/usr/share/man --with-python=python2.6 --without-debug --without-legacy --with-catalog --without-docbook --with-c14n

## --------- ##
## Platform. ##
## --------- ##

hostname = developer
uname -m = i686
uname -r = 2.6.24-23-virtual
uname -s = Linux
uname -v = #1 SMP Mon Jan 26 01:36:35 UTC 2009

/usr/bin/uname -p = unknown
/bin/uname -X     = unknown

/bin/arch              = unknown
/usr/bin/arch -k       = unknown
/usr/convex/getsysinfo = unknown
/usr/bin/hostinfo      = unknown
/bin/machine           = unknown
/usr/bin/oslevel       = unknown
/bin/universe          = unknown

PATH: /home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin
PATH: /home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin/i686-linux
PATH: /home/jader/thinstation/build/tmp/staging/i686-linux/usr/sbin
PATH: /home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin
PATH: /home/jader/thinstation/build/tmp/cross/i686/bin
PATH: /home/jader/thinstation/build/tmp/staging/i686-linux/sbin
PATH: /home/jader/thinstation/build/tmp/staging/i686-linux/bin
PATH: /home/jader/thinstation/bitbake-1.8.12/bin
PATH: /home/jader/thinstation/bitbake-1.8.12/bin
PATH: /usr/local/sbin
PATH: /usr/local/bin
PATH: /usr/sbin
PATH: /usr/bin
PATH: /sbin
PATH: /bin
PATH: /usr/games


## ----------- ##
## Core tests. ##
## ----------- ##

configure:2097: checking build system type
configure:2115: result: i686-pc-linux-gnu
configure:2137: checking host system type
configure:2152: result: i686-pc-linux-gnu
configure:2225: checking for a BSD-compatible install
configure:2281: result: /home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin/install -c
configure:2292: checking whether build environment is sane
configure:2335: result: yes
configure:2363: checking for a thread-safe mkdir -p
configure:2402: result: /bin/mkdir -p
configure:2415: checking for gawk
configure:2431: found /usr/bin/gawk
configure:2442: result: gawk
configure:2453: checking whether make sets $(MAKE)
configure:2474: result: yes
configure:2671: checking for i686-linux-gcc
configure:2698: result: ccache gcc
configure:2976: checking for C compiler version
configure:2983: ccache gcc --version >&5
gcc (GCC) 4.2.4 (Ubuntu 4.2.4-1ubuntu3)
Copyright (C) 2007 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

configure:2986: $? = 0
configure:2993: ccache gcc -v >&5
Reading specs from /usr/lib/gcc/i486-linux-gnu/4.2.4/specs
Target: i486-linux-gnu
Configured with: ../src/configure -v --enable-languages=c,c++,fortran,objc,obj-c++,treelang --prefix=/usr --enable-shared --with-system-zlib --libexecdir=/usr/lib --without-included-gettext --enable-threads=posix --enable-nls --with-gxx-include-dir=/usr/include/c++/4.2 --program-suffix=-4.2 --enable-clocale=gnu --enable-libstdcxx-debug --enable-objc-gc --enable-mpfr --enable-targets=all --enable-checking=release --build=i486-linux-gnu --host=i486-linux-gnu --target=i486-linux-gnu
Thread model: posix
gcc version 4.2.4 (Ubuntu 4.2.4-1ubuntu3)
configure:2996: $? = 0
configure:3003: ccache gcc -V >&5
gcc: '-V' option must have argument
configure:3006: $? = 1
configure:3029: checking for C compiler default output file name
configure:3056: ccache gcc -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:3059: $? = 0
configure:3097: result: a.out
configure:3114: checking whether the C compiler works
configure:3124: ./a.out
configure:3127: $? = 0
configure:3144: result: yes
configure:3151: checking whether we are cross compiling
configure:3153: result: no
configure:3156: checking for suffix of executables
configure:3163: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:3166: $? = 0
configure:3190: result: 
configure:3196: checking for suffix of object files
configure:3222: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:3225: $? = 0
configure:3248: result: o
configure:3252: checking whether we are using the GNU C compiler
configure:3281: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:3287: $? = 0
configure:3304: result: yes
configure:3309: checking whether ccache gcc accepts -g
configure:3339: ccache gcc -c -g -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:3345: $? = 0
configure:3444: result: yes
configure:3461: checking for ccache gcc option to accept ISO C89
configure:3535: ccache gcc  -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:3541: $? = 0
configure:3564: result: none needed
configure:3593: checking for style of include used by make
configure:3621: result: GNU
configure:3646: checking dependency style of ccache gcc
configure:3737: result: gcc3
configure:3765: checking for a BSD-compatible install
configure:3821: result: /home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin/install -c
configure:3837: checking how to run the C preprocessor
configure:3953: result: gcc -E
configure:3982: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
configure:3988: $? = 0
configure:4019: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
conftest.c:10:28: error: ac_nonexistent.h: No such file or directory
configure:4025: $? = 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| /* end confdefs.h.  */
| #include <ac_nonexistent.h>
configure:4064: checking for rm
configure:4082: found /bin/rm
configure:4095: result: /bin/rm
configure:4105: checking for mv
configure:4123: found /bin/mv
configure:4136: result: /bin/mv
configure:4146: checking for tar
configure:4164: found /bin/tar
configure:4177: result: /bin/tar
configure:4187: checking for perl
configure:4205: found /home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin/perl
configure:4218: result: /home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin/perl
configure:4228: checking for wget
configure:4246: found /usr/bin/wget
configure:4259: result: /usr/bin/wget
configure:4269: checking for xmllint
configure:4287: found /usr/bin/xmllint
configure:4300: result: /usr/bin/xmllint
configure:4310: checking for xsltproc
configure:4328: found /home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin/xsltproc
configure:4341: result: /home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin/xsltproc
configure:4350: checking for function prototypes
configure:4353: result: yes
configure:4372: checking for grep that handles long lines and -e
configure:4446: result: /bin/grep
configure:4451: checking for egrep
configure:4529: result: /bin/grep -E
configure:4534: checking for ANSI C header files
configure:4564: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:4570: $? = 0
configure:4669: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:4672: $? = 0
configure:4678: ./conftest
configure:4681: $? = 0
configure:4698: result: yes
configure:4722: checking for sys/types.h
configure:4743: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:4749: $? = 0
configure:4765: result: yes
configure:4722: checking for sys/stat.h
configure:4743: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:4749: $? = 0
configure:4765: result: yes
configure:4722: checking for stdlib.h
configure:4743: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:4749: $? = 0
configure:4765: result: yes
configure:4722: checking for string.h
configure:4743: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:4749: $? = 0
configure:4765: result: yes
configure:4722: checking for memory.h
configure:4743: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:4749: $? = 0
configure:4765: result: yes
configure:4722: checking for strings.h
configure:4743: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:4749: $? = 0
configure:4765: result: yes
configure:4722: checking for inttypes.h
configure:4743: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:4749: $? = 0
configure:4765: result: yes
configure:4722: checking for stdint.h
configure:4743: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:4749: $? = 0
configure:4765: result: yes
configure:4722: checking for unistd.h
configure:4743: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:4749: $? = 0
configure:4765: result: yes
configure:4790: checking for string.h
configure:4796: result: yes
configure:5270: checking for a sed that does not truncate output
configure:5349: result: /bin/sed
configure:5367: checking for fgrep
configure:5445: result: /bin/grep -F
configure:5480: checking for ld used by ccache gcc
configure:5547: result: ld
configure:5556: checking if the linker (ld) is GNU ld
configure:5571: result: yes
configure:5583: checking for BSD- or MS-compatible name lister (nm)
configure:5632: result: /usr/bin/nm -B
configure:5754: checking the name lister (/usr/bin/nm -B) interface
configure:5761: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:5764: /usr/bin/nm -B "conftest.o"
configure:5767: output
00000000 B some_variable
configure:5774: result: BSD nm
configure:5777: checking whether ln -s works
configure:5781: result: yes
configure:5789: checking the maximum length of command line arguments
configure:5909: result: 98304
configure:5926: checking whether the shell understands some XSI constructs
configure:5936: result: yes
configure:5940: checking whether the shell understands "+="
configure:5946: result: yes
configure:5981: checking for ld option to reload object files
configure:5988: result: -r
configure:6015: checking how to recognize dependent libraries
configure:6205: result: pass_all
configure:6225: checking for i686-linux-ar
configure:6252: result: ar
configure:6334: checking for i686-linux-strip
configure:6361: result: strip
configure:6437: checking for i686-linux-ranlib
configure:6464: result: ranlib
configure:6598: checking command to parse /usr/bin/nm -B output from ccache gcc object
configure:6716: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:6719: $? = 0
configure:6723: /usr/bin/nm -B conftest.o \| sed -n -e 's/^.*[	 ]\([ABCDGIRSTW][ABCDGIRSTW]*\)[	 ][	 ]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2 \2/p' \> conftest.nm
configure:6726: $? = 0
configure:6780: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c conftstm.o >&5
configure:6783: $? = 0
configure:6821: result: ok
configure:7698: checking for dlfcn.h
configure:7719: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:7725: $? = 0
configure:7741: result: yes
configure:7924: checking for objdir
configure:7939: result: .libs
configure:8231: checking if ccache gcc supports -fno-rtti -fno-exceptions
configure:8249: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -fno-rtti -fno-exceptions conftest.c >&5
cc1: warning: command line option "-fno-rtti" is valid for C++/ObjC++ but not for C
configure:8253: $? = 0
configure:8266: result: no
configure:8286: checking for ccache gcc option to produce PIC
configure:8543: result: -fPIC -DPIC
configure:8555: checking if ccache gcc PIC flag -fPIC -DPIC works
configure:8573: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -fPIC -DPIC -DPIC conftest.c >&5
configure:8577: $? = 0
configure:8590: result: yes
configure:8614: checking if ccache gcc static flag -static works
configure:8642: result: yes
configure:8657: checking if ccache gcc supports -c -o file.o
configure:8678: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -o out/conftest2.o conftest.c >&5
configure:8682: $? = 0
configure:8704: result: yes
configure:8712: checking if ccache gcc supports -c -o file.o
configure:8759: result: yes
configure:8792: checking whether the ccache gcc linker (ld) supports shared libraries
configure:9846: result: yes
configure:9883: checking whether -lc should be explicitly linked in
configure:9888: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:9891: $? = 0
configure:9906: ccache gcc -shared conftest.o  -v -Wl,-soname -Wl,conftest -o conftest 2\>\&1 \| /bin/grep  -lc  \>/dev/null 2\>\&1
configure:9909: $? = 0
configure:9921: result: no
configure:10085: checking dynamic linker characteristics
configure:10528: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 -Wl,-rpath -Wl,/foo conftest.c  >&5
configure:10534: $? = 0
configure:10764: result: GNU/Linux ld.so
configure:10866: checking how to hardcode library paths into programs
configure:10891: result: immediate
configure:11704: checking whether stripping libraries is possible
configure:11709: result: yes
configure:11744: checking if libtool supports shared libraries
configure:11746: result: yes
configure:11749: checking whether to build shared libraries
configure:11770: result: yes
configure:11773: checking whether to build static libraries
configure:11777: result: yes
configure:12246: checking zlib.h usability
configure:12263: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:12269: $? = 0
configure:12283: result: yes
configure:12287: checking zlib.h presence
configure:12302: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
configure:12308: $? = 0
configure:12322: result: yes
configure:12350: checking for zlib.h
configure:12358: result: yes
configure:12366: checking for gzread in -lz
configure:12401: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c -lz   >&5
configure:12407: $? = 0
configure:12425: result: yes
configure:12471: checking for dirent.h that defines DIR
configure:12500: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:12506: $? = 0
configure:12522: result: yes
configure:12535: checking for library containing opendir
configure:12576: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:12582: $? = 0
configure:12610: result: none required
configure:12704: checking for ANSI C header files
configure:12868: result: yes
configure:12893: checking fcntl.h usability
configure:12910: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:12916: $? = 0
configure:12930: result: yes
configure:12934: checking fcntl.h presence
configure:12949: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
configure:12955: $? = 0
configure:12969: result: yes
configure:12997: checking for fcntl.h
configure:13005: result: yes
configure:13023: checking for unistd.h
configure:13029: result: yes
configure:13173: checking ctype.h usability
configure:13190: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:13196: $? = 0
configure:13210: result: yes
configure:13214: checking ctype.h presence
configure:13229: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
configure:13235: $? = 0
configure:13249: result: yes
configure:13277: checking for ctype.h
configure:13285: result: yes
configure:13313: checking dirent.h usability
configure:13330: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:13336: $? = 0
configure:13350: result: yes
configure:13354: checking dirent.h presence
configure:13369: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
configure:13375: $? = 0
configure:13389: result: yes
configure:13417: checking for dirent.h
configure:13425: result: yes
configure:13453: checking errno.h usability
configure:13470: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:13476: $? = 0
configure:13490: result: yes
configure:13494: checking errno.h presence
configure:13509: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
configure:13515: $? = 0
configure:13529: result: yes
configure:13557: checking for errno.h
configure:13565: result: yes
configure:13593: checking malloc.h usability
configure:13610: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:13616: $? = 0
configure:13630: result: yes
configure:13634: checking malloc.h presence
configure:13649: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
configure:13655: $? = 0
configure:13669: result: yes
configure:13697: checking for malloc.h
configure:13705: result: yes
configure:13733: checking stdarg.h usability
configure:13750: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:13756: $? = 0
configure:13770: result: yes
configure:13774: checking stdarg.h presence
configure:13789: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
configure:13795: $? = 0
configure:13809: result: yes
configure:13837: checking for stdarg.h
configure:13845: result: yes
configure:13863: checking for sys/stat.h
configure:13869: result: yes
configure:14003: checking for sys/types.h
configure:14009: result: yes
configure:14143: checking for stdint.h
configure:14149: result: yes
configure:14293: checking inttypes.h.h usability
configure:14310: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
conftest.c:72:24: error: inttypes.h.h: No such file or directory
configure:14316: $? = 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_ZLIB_H 1
| #define HAVE_LIBZ 1
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <inttypes.h.h>
configure:14330: result: no
configure:14334: checking inttypes.h.h presence
configure:14349: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
conftest.c:39:24: error: inttypes.h.h: No such file or directory
configure:14355: $? = 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_ZLIB_H 1
| #define HAVE_LIBZ 1
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| /* end confdefs.h.  */
| #include <inttypes.h.h>
configure:14369: result: no
configure:14397: checking for inttypes.h.h
configure:14405: result: no
configure:14433: checking time.h usability
configure:14450: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:14456: $? = 0
configure:14470: result: yes
configure:14474: checking time.h presence
configure:14489: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
configure:14495: $? = 0
configure:14509: result: yes
configure:14537: checking for time.h
configure:14545: result: yes
configure:14573: checking ansidecl.h usability
configure:14590: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:14596: $? = 0
configure:14610: result: yes
configure:14614: checking ansidecl.h presence
configure:14629: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
configure:14635: $? = 0
configure:14649: result: yes
configure:14677: checking for ansidecl.h
configure:14685: result: yes
configure:14713: checking ieeefp.h usability
configure:14730: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
conftest.c:74:20: error: ieeefp.h: No such file or directory
configure:14736: $? = 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_ZLIB_H 1
| #define HAVE_LIBZ 1
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <ieeefp.h>
configure:14750: result: no
configure:14754: checking ieeefp.h presence
configure:14769: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
conftest.c:41:20: error: ieeefp.h: No such file or directory
configure:14775: $? = 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_ZLIB_H 1
| #define HAVE_LIBZ 1
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| /* end confdefs.h.  */
| #include <ieeefp.h>
configure:14789: result: no
configure:14817: checking for ieeefp.h
configure:14825: result: no
configure:14853: checking nan.h usability
configure:14870: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
conftest.c:74:17: error: nan.h: No such file or directory
configure:14876: $? = 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_ZLIB_H 1
| #define HAVE_LIBZ 1
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <nan.h>
configure:14890: result: no
configure:14894: checking nan.h presence
configure:14909: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
conftest.c:41:17: error: nan.h: No such file or directory
configure:14915: $? = 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_ZLIB_H 1
| #define HAVE_LIBZ 1
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| /* end confdefs.h.  */
| #include <nan.h>
configure:14929: result: no
configure:14957: checking for nan.h
configure:14965: result: no
configure:14993: checking math.h usability
configure:15010: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:15016: $? = 0
configure:15030: result: yes
configure:15034: checking math.h presence
configure:15049: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
configure:15055: $? = 0
configure:15069: result: yes
configure:15097: checking for math.h
configure:15105: result: yes
configure:15133: checking limits.h usability
configure:15150: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:15156: $? = 0
configure:15170: result: yes
configure:15174: checking limits.h presence
configure:15189: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
configure:15195: $? = 0
configure:15209: result: yes
configure:15237: checking for limits.h
configure:15245: result: yes
configure:15273: checking fp_class.h usability
configure:15290: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
conftest.c:76:22: error: fp_class.h: No such file or directory
configure:15296: $? = 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_ZLIB_H 1
| #define HAVE_LIBZ 1
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <fp_class.h>
configure:15310: result: no
configure:15314: checking fp_class.h presence
configure:15329: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
conftest.c:43:22: error: fp_class.h: No such file or directory
configure:15335: $? = 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_ZLIB_H 1
| #define HAVE_LIBZ 1
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| /* end confdefs.h.  */
| #include <fp_class.h>
configure:15349: result: no
configure:15377: checking for fp_class.h
configure:15385: result: no
configure:15413: checking float.h usability
configure:15430: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:15436: $? = 0
configure:15450: result: yes
configure:15454: checking float.h presence
configure:15469: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
configure:15475: $? = 0
configure:15489: result: yes
configure:15517: checking for float.h
configure:15525: result: yes
configure:15543: checking for stdlib.h
configure:15549: result: yes
configure:15682: checking for sys/socket.h
configure:15706: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:15712: $? = 0
configure:15728: result: yes
configure:15743: checking for netinet/in.h
configure:15767: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:15773: $? = 0
configure:15789: result: yes
configure:15804: checking for arpa/inet.h
configure:15831: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:15837: $? = 0
configure:15853: result: yes
configure:15879: checking netdb.h usability
configure:15896: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:15902: $? = 0
configure:15916: result: yes
configure:15920: checking netdb.h presence
configure:15935: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
configure:15941: $? = 0
configure:15955: result: yes
configure:15983: checking for netdb.h
configure:15991: result: yes
configure:16019: checking sys/time.h usability
configure:16036: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:16042: $? = 0
configure:16056: result: yes
configure:16060: checking sys/time.h presence
configure:16075: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
configure:16081: $? = 0
configure:16095: result: yes
configure:16123: checking for sys/time.h
configure:16131: result: yes
configure:16159: checking sys/select.h usability
configure:16176: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:16182: $? = 0
configure:16196: result: yes
configure:16200: checking sys/select.h presence
configure:16215: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
configure:16221: $? = 0
configure:16235: result: yes
configure:16263: checking for sys/select.h
configure:16271: result: yes
configure:16299: checking sys/mman.h usability
configure:16316: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:16322: $? = 0
configure:16336: result: yes
configure:16340: checking sys/mman.h presence
configure:16355: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
configure:16361: $? = 0
configure:16375: result: yes
configure:16403: checking for sys/mman.h
configure:16411: result: yes
configure:16439: checking sys/timeb.h usability
configure:16456: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:16462: $? = 0
configure:16476: result: yes
configure:16480: checking sys/timeb.h presence
configure:16495: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
configure:16501: $? = 0
configure:16515: result: yes
configure:16543: checking for sys/timeb.h
configure:16551: result: yes
configure:16579: checking signal.h usability
configure:16596: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:16602: $? = 0
configure:16616: result: yes
configure:16620: checking signal.h presence
configure:16635: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
configure:16641: $? = 0
configure:16655: result: yes
configure:16683: checking for signal.h
configure:16691: result: yes
configure:16708: checking for arpa/nameser.h
configure:16732: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:16738: $? = 0
configure:16754: result: yes
configure:16769: checking for resolv.h
configure:16799: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:16805: $? = 0
configure:16821: result: yes
configure:16847: checking dl.h usability
configure:16864: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
conftest.c:89:16: error: dl.h: No such file or directory
configure:16870: $? = 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_ZLIB_H 1
| #define HAVE_LIBZ 1
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| #define HAVE_FLOAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_SYS_SOCKET_H 1
| #define HAVE_NETINET_IN_H 1
| #define HAVE_ARPA_INET_H 1
| #define HAVE_NETDB_H 1
| #define HAVE_SYS_TIME_H 1
| #define HAVE_SYS_SELECT_H 1
| #define HAVE_SYS_MMAN_H 1
| #define HAVE_SYS_TIMEB_H 1
| #define HAVE_SIGNAL_H 1
| #define HAVE_ARPA_NAMESER_H 1
| #define HAVE_RESOLV_H 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <dl.h>
configure:16884: result: no
configure:16888: checking dl.h presence
configure:16903: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
conftest.c:56:16: error: dl.h: No such file or directory
configure:16909: $? = 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_ZLIB_H 1
| #define HAVE_LIBZ 1
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| #define HAVE_FLOAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_SYS_SOCKET_H 1
| #define HAVE_NETINET_IN_H 1
| #define HAVE_ARPA_INET_H 1
| #define HAVE_NETDB_H 1
| #define HAVE_SYS_TIME_H 1
| #define HAVE_SYS_SELECT_H 1
| #define HAVE_SYS_MMAN_H 1
| #define HAVE_SYS_TIMEB_H 1
| #define HAVE_SIGNAL_H 1
| #define HAVE_ARPA_NAMESER_H 1
| #define HAVE_RESOLV_H 1
| /* end confdefs.h.  */
| #include <dl.h>
configure:16923: result: no
configure:16951: checking for dl.h
configure:16959: result: no
configure:16977: checking for dlfcn.h
configure:16983: result: yes
configure:17120: checking for strftime
configure:17176: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:80: warning: conflicting types for built-in function 'strftime'
configure:17182: $? = 0
configure:17200: result: yes
configure:17287: checking for strdup
configure:17343: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:81: warning: conflicting types for built-in function 'strdup'
configure:17349: $? = 0
configure:17367: result: yes
configure:17287: checking for strndup
configure:17343: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:82: warning: conflicting types for built-in function 'strndup'
configure:17349: $? = 0
configure:17367: result: yes
configure:17287: checking for strerror
configure:17343: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:17349: $? = 0
configure:17367: result: yes
configure:17385: checking for finite
configure:17441: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:84: warning: conflicting types for built-in function 'finite'
configure:17447: $? = 0
configure:17465: result: yes
configure:17385: checking for isnand
configure:17441: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
/tmp/ccqqJK1H.o: In function `main':
conftest.c:(.text+0x12): undefined reference to `isnand'
collect2: ld returned 1 exit status
configure:17447: $? = 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_ZLIB_H 1
| #define HAVE_LIBZ 1
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| #define HAVE_FLOAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_SYS_SOCKET_H 1
| #define HAVE_NETINET_IN_H 1
| #define HAVE_ARPA_INET_H 1
| #define HAVE_NETDB_H 1
| #define HAVE_SYS_TIME_H 1
| #define HAVE_SYS_SELECT_H 1
| #define HAVE_SYS_MMAN_H 1
| #define HAVE_SYS_TIMEB_H 1
| #define HAVE_SIGNAL_H 1
| #define HAVE_ARPA_NAMESER_H 1
| #define HAVE_RESOLV_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STRFTIME 1
| #define HAVE_STRDUP 1
| #define HAVE_STRNDUP 1
| #define HAVE_STRERROR 1
| #define HAVE_FINITE 1
| /* end confdefs.h.  */
| /* Define isnand to an innocuous variant, in case <limits.h> declares isnand.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define isnand innocuous_isnand
| 
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char isnand (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
| 
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
| 
| #undef isnand
| 
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char isnand ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_isnand || defined __stub___isnand
| choke me
| #endif
| 
| int
| main ()
| {
| return isnand ();
|   ;
|   return 0;
| }
configure:17465: result: no
configure:17385: checking for fp_class
configure:17441: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
/tmp/cckAlu4W.o: In function `main':
conftest.c:(.text+0x12): undefined reference to `fp_class'
collect2: ld returned 1 exit status
configure:17447: $? = 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_ZLIB_H 1
| #define HAVE_LIBZ 1
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| #define HAVE_FLOAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_SYS_SOCKET_H 1
| #define HAVE_NETINET_IN_H 1
| #define HAVE_ARPA_INET_H 1
| #define HAVE_NETDB_H 1
| #define HAVE_SYS_TIME_H 1
| #define HAVE_SYS_SELECT_H 1
| #define HAVE_SYS_MMAN_H 1
| #define HAVE_SYS_TIMEB_H 1
| #define HAVE_SIGNAL_H 1
| #define HAVE_ARPA_NAMESER_H 1
| #define HAVE_RESOLV_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STRFTIME 1
| #define HAVE_STRDUP 1
| #define HAVE_STRNDUP 1
| #define HAVE_STRERROR 1
| #define HAVE_FINITE 1
| /* end confdefs.h.  */
| /* Define fp_class to an innocuous variant, in case <limits.h> declares fp_class.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define fp_class innocuous_fp_class
| 
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char fp_class (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
| 
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
| 
| #undef fp_class
| 
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char fp_class ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_fp_class || defined __stub___fp_class
| choke me
| #endif
| 
| int
| main ()
| {
| return fp_class ();
|   ;
|   return 0;
| }
configure:17465: result: no
configure:17385: checking for class
configure:17441: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
/tmp/cciWAyUc.o: In function `main':
conftest.c:(.text+0x12): undefined reference to `class'
collect2: ld returned 1 exit status
configure:17447: $? = 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_ZLIB_H 1
| #define HAVE_LIBZ 1
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| #define HAVE_FLOAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_SYS_SOCKET_H 1
| #define HAVE_NETINET_IN_H 1
| #define HAVE_ARPA_INET_H 1
| #define HAVE_NETDB_H 1
| #define HAVE_SYS_TIME_H 1
| #define HAVE_SYS_SELECT_H 1
| #define HAVE_SYS_MMAN_H 1
| #define HAVE_SYS_TIMEB_H 1
| #define HAVE_SIGNAL_H 1
| #define HAVE_ARPA_NAMESER_H 1
| #define HAVE_RESOLV_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STRFTIME 1
| #define HAVE_STRDUP 1
| #define HAVE_STRNDUP 1
| #define HAVE_STRERROR 1
| #define HAVE_FINITE 1
| /* end confdefs.h.  */
| /* Define class to an innocuous variant, in case <limits.h> declares class.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define class innocuous_class
| 
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char class (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
| 
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
| 
| #undef class
| 
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char class ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_class || defined __stub___class
| choke me
| #endif
| 
| int
| main ()
| {
| return class ();
|   ;
|   return 0;
| }
configure:17465: result: no
configure:17385: checking for fpclass
configure:17441: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
/tmp/ccWt5xRF.o: In function `main':
conftest.c:(.text+0x12): undefined reference to `fpclass'
collect2: ld returned 1 exit status
configure:17447: $? = 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_ZLIB_H 1
| #define HAVE_LIBZ 1
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| #define HAVE_FLOAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_SYS_SOCKET_H 1
| #define HAVE_NETINET_IN_H 1
| #define HAVE_ARPA_INET_H 1
| #define HAVE_NETDB_H 1
| #define HAVE_SYS_TIME_H 1
| #define HAVE_SYS_SELECT_H 1
| #define HAVE_SYS_MMAN_H 1
| #define HAVE_SYS_TIMEB_H 1
| #define HAVE_SIGNAL_H 1
| #define HAVE_ARPA_NAMESER_H 1
| #define HAVE_RESOLV_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STRFTIME 1
| #define HAVE_STRDUP 1
| #define HAVE_STRNDUP 1
| #define HAVE_STRERROR 1
| #define HAVE_FINITE 1
| /* end confdefs.h.  */
| /* Define fpclass to an innocuous variant, in case <limits.h> declares fpclass.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define fpclass innocuous_fpclass
| 
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char fpclass (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
| 
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
| 
| #undef fpclass
| 
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char fpclass ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_fpclass || defined __stub___fpclass
| choke me
| #endif
| 
| int
| main ()
| {
| return fpclass ();
|   ;
|   return 0;
| }
configure:17465: result: no
configure:17482: checking for strftime
configure:17562: result: yes
configure:17482: checking for localtime
configure:17538: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:17544: $? = 0
configure:17562: result: yes
configure:17482: checking for gettimeofday
configure:17538: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:17544: $? = 0
configure:17562: result: yes
configure:17482: checking for ftime
configure:17538: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:17544: $? = 0
configure:17562: result: yes
configure:17578: checking for stat
configure:17634: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:17640: $? = 0
configure:17658: result: yes
configure:17578: checking for _stat
configure:17634: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
/tmp/ccYQ8TQT.o: In function `main':
conftest.c:(.text+0x12): undefined reference to `_stat'
collect2: ld returned 1 exit status
configure:17640: $? = 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_ZLIB_H 1
| #define HAVE_LIBZ 1
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| #define HAVE_FLOAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_SYS_SOCKET_H 1
| #define HAVE_NETINET_IN_H 1
| #define HAVE_ARPA_INET_H 1
| #define HAVE_NETDB_H 1
| #define HAVE_SYS_TIME_H 1
| #define HAVE_SYS_SELECT_H 1
| #define HAVE_SYS_MMAN_H 1
| #define HAVE_SYS_TIMEB_H 1
| #define HAVE_SIGNAL_H 1
| #define HAVE_ARPA_NAMESER_H 1
| #define HAVE_RESOLV_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STRFTIME 1
| #define HAVE_STRDUP 1
| #define HAVE_STRNDUP 1
| #define HAVE_STRERROR 1
| #define HAVE_FINITE 1
| #define HAVE_STRFTIME 1
| #define HAVE_LOCALTIME 1
| #define HAVE_GETTIMEOFDAY 1
| #define HAVE_FTIME 1
| #define HAVE_STAT 1
| /* end confdefs.h.  */
| /* Define _stat to an innocuous variant, in case <limits.h> declares _stat.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define _stat innocuous__stat
| 
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char _stat (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
| 
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
| 
| #undef _stat
| 
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char _stat ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub__stat || defined __stub____stat
| choke me
| #endif
| 
| int
| main ()
| {
| return _stat ();
|   ;
|   return 0;
| }
configure:17658: result: no
configure:17578: checking for signal
configure:17634: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:17640: $? = 0
configure:17658: result: yes
configure:17680: checking for printf
configure:17736: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:91: warning: conflicting types for built-in function 'printf'
configure:17742: $? = 0
configure:17760: result: yes
configure:17680: checking for sprintf
configure:17736: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:92: warning: conflicting types for built-in function 'sprintf'
configure:17742: $? = 0
configure:17760: result: yes
configure:17680: checking for fprintf
configure:17736: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:93: warning: conflicting types for built-in function 'fprintf'
configure:17742: $? = 0
configure:17760: result: yes
configure:17680: checking for snprintf
configure:17736: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:94: warning: conflicting types for built-in function 'snprintf'
configure:17742: $? = 0
configure:17760: result: yes
configure:17680: checking for vfprintf
configure:17736: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:95: warning: conflicting types for built-in function 'vfprintf'
configure:17742: $? = 0
configure:17760: result: yes
configure:17680: checking for vsprintf
configure:17736: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:96: warning: conflicting types for built-in function 'vsprintf'
configure:17742: $? = 0
configure:17760: result: yes
configure:17680: checking for vsnprintf
configure:17736: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:97: warning: conflicting types for built-in function 'vsnprintf'
configure:17742: $? = 0
configure:17760: result: yes
configure:17680: checking for sscanf
configure:17736: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:98: warning: conflicting types for built-in function 'sscanf'
configure:17742: $? = 0
configure:17760: result: yes
configure:17773: checking for va_copy
configure:17797: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:17803: $? = 0
configure:17819: result: yes
configure:17885: checking for library containing gethostent
configure:17926: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:17932: $? = 0
configure:17960: result: none required
configure:17968: checking for library containing setsockopt
configure:18009: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:18015: $? = 0
configure:18043: result: none required
configure:18051: checking for library containing connect
configure:18092: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:18098: $? = 0
configure:18126: result: none required
configure:18135: checking for type of socket length (socklen_t)
configure:18149: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:18152: result: socklen_t *
configure:18222: checking whether to enable IPv6
configure:18264: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:18270: $? = 0
configure:18285: result: yes
configure:18296: checking struct sockaddr::ss_family
configure:18325: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:18331: $? = 0
configure:18346: result: yes
configure:18419: checking for getaddrinfo
configure:18475: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:18481: $? = 0
configure:18498: result: yes
configure:18587: checking for isnan
configure:18643: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:103: warning: conflicting types for built-in function 'isnan'
configure:18649: $? = 0
configure:18666: result: yes
configure:18747: checking for isinf
configure:18803: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:104: warning: conflicting types for built-in function 'isinf'
configure:18809: $? = 0
configure:18826: result: yes
configure:18990: checking for python
configure:19008: found /home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin/python
configure:19020: result: /home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin/python
configure:19171: checking for shl_load
configure:19227: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -pedantic -W -Wformat -Wunused -Wimplicit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar-subscripts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline -Wredundant-decls -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:105: warning: function declaration isn't a prototype
conftest.c:115: warning: function declaration isn't a prototype
/tmp/cccD4i8A.o: In function `main':
conftest.c:(.text+0x12): undefined reference to `shl_load'
collect2: ld returned 1 exit status
configure:19233: $? = 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_ZLIB_H 1
| #define HAVE_LIBZ 1
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| #define HAVE_FLOAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_SYS_SOCKET_H 1
| #define HAVE_NETINET_IN_H 1
| #define HAVE_ARPA_INET_H 1
| #define HAVE_NETDB_H 1
| #define HAVE_SYS_TIME_H 1
| #define HAVE_SYS_SELECT_H 1
| #define HAVE_SYS_MMAN_H 1
| #define HAVE_SYS_TIMEB_H 1
| #define HAVE_SIGNAL_H 1
| #define HAVE_ARPA_NAMESER_H 1
| #define HAVE_RESOLV_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STRFTIME 1
| #define HAVE_STRDUP 1
| #define HAVE_STRNDUP 1
| #define HAVE_STRERROR 1
| #define HAVE_FINITE 1
| #define HAVE_STRFTIME 1
| #define HAVE_LOCALTIME 1
| #define HAVE_GETTIMEOFDAY 1
| #define HAVE_FTIME 1
| #define HAVE_STAT 1
| #define HAVE_SIGNAL 1
| #define HAVE_PRINTF 1
| #define HAVE_SPRINTF 1
| #define HAVE_FPRINTF 1
| #define HAVE_SNPRINTF 1
| #define HAVE_VFPRINTF 1
| #define HAVE_VSPRINTF 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_SSCANF 1
| #define HAVE_VA_COPY 1
| #define XML_SOCKLEN_T socklen_t
| #define SUPPORT_IP6
| #define HAVE_GETADDRINFO
| #define HAVE_ISNAN
| #define HAVE_ISINF
| /* end confdefs.h.  */
| /* Define shl_load to an innocuous variant, in case <limits.h> declares shl_load.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define shl_load innocuous_shl_load
| 
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char shl_load (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
| 
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
| 
| #undef shl_load
| 
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char shl_load ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_shl_load || defined __stub___shl_load
| choke me
| #endif
| 
| int
| main ()
| {
| return shl_load ();
|   ;
|   return 0;
| }
configure:19250: result: no
configure:19256: checking for shl_load in -ldld
configure:19291: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -pedantic -W -Wformat -Wunused -Wimplicit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar-subscripts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline -Wredundant-decls -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c -ldld   >&5
conftest.c:89: warning: function declaration isn't a prototype
conftest.c:92: warning: function declaration isn't a prototype
/usr/bin/ld: cannot find -ldld
collect2: ld returned 1 exit status
configure:19297: $? = 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_ZLIB_H 1
| #define HAVE_LIBZ 1
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| #define HAVE_FLOAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_SYS_SOCKET_H 1
| #define HAVE_NETINET_IN_H 1
| #define HAVE_ARPA_INET_H 1
| #define HAVE_NETDB_H 1
| #define HAVE_SYS_TIME_H 1
| #define HAVE_SYS_SELECT_H 1
| #define HAVE_SYS_MMAN_H 1
| #define HAVE_SYS_TIMEB_H 1
| #define HAVE_SIGNAL_H 1
| #define HAVE_ARPA_NAMESER_H 1
| #define HAVE_RESOLV_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STRFTIME 1
| #define HAVE_STRDUP 1
| #define HAVE_STRNDUP 1
| #define HAVE_STRERROR 1
| #define HAVE_FINITE 1
| #define HAVE_STRFTIME 1
| #define HAVE_LOCALTIME 1
| #define HAVE_GETTIMEOFDAY 1
| #define HAVE_FTIME 1
| #define HAVE_STAT 1
| #define HAVE_SIGNAL 1
| #define HAVE_PRINTF 1
| #define HAVE_SPRINTF 1
| #define HAVE_FPRINTF 1
| #define HAVE_SNPRINTF 1
| #define HAVE_VFPRINTF 1
| #define HAVE_VSPRINTF 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_SSCANF 1
| #define HAVE_VA_COPY 1
| #define XML_SOCKLEN_T socklen_t
| #define SUPPORT_IP6
| #define HAVE_GETADDRINFO
| #define HAVE_ISNAN
| #define HAVE_ISINF
| /* end confdefs.h.  */
| 
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char shl_load ();
| int
| main ()
| {
| return shl_load ();
|   ;
|   return 0;
| }
configure:19315: result: no
configure:19323: checking for dlopen
configure:19379: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -pedantic -W -Wformat -Wunused -Wimplicit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar-subscripts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline -Wredundant-decls -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:105: warning: function declaration isn't a prototype
conftest.c:115: warning: function declaration isn't a prototype
/tmp/cci0jLR3.o: In function `main':
conftest.c:(.text+0x12): undefined reference to `dlopen'
collect2: ld returned 1 exit status
configure:19385: $? = 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_ZLIB_H 1
| #define HAVE_LIBZ 1
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| #define HAVE_FLOAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_SYS_SOCKET_H 1
| #define HAVE_NETINET_IN_H 1
| #define HAVE_ARPA_INET_H 1
| #define HAVE_NETDB_H 1
| #define HAVE_SYS_TIME_H 1
| #define HAVE_SYS_SELECT_H 1
| #define HAVE_SYS_MMAN_H 1
| #define HAVE_SYS_TIMEB_H 1
| #define HAVE_SIGNAL_H 1
| #define HAVE_ARPA_NAMESER_H 1
| #define HAVE_RESOLV_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STRFTIME 1
| #define HAVE_STRDUP 1
| #define HAVE_STRNDUP 1
| #define HAVE_STRERROR 1
| #define HAVE_FINITE 1
| #define HAVE_STRFTIME 1
| #define HAVE_LOCALTIME 1
| #define HAVE_GETTIMEOFDAY 1
| #define HAVE_FTIME 1
| #define HAVE_STAT 1
| #define HAVE_SIGNAL 1
| #define HAVE_PRINTF 1
| #define HAVE_SPRINTF 1
| #define HAVE_FPRINTF 1
| #define HAVE_SNPRINTF 1
| #define HAVE_VFPRINTF 1
| #define HAVE_VSPRINTF 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_SSCANF 1
| #define HAVE_VA_COPY 1
| #define XML_SOCKLEN_T socklen_t
| #define SUPPORT_IP6
| #define HAVE_GETADDRINFO
| #define HAVE_ISNAN
| #define HAVE_ISINF
| /* end confdefs.h.  */
| /* Define dlopen to an innocuous variant, in case <limits.h> declares dlopen.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define dlopen innocuous_dlopen
| 
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char dlopen (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
| 
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
| 
| #undef dlopen
| 
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char dlopen ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_dlopen || defined __stub___dlopen
| choke me
| #endif
| 
| int
| main ()
| {
| return dlopen ();
|   ;
|   return 0;
| }
configure:19402: result: no
configure:19408: checking for dlopen in -ldl
configure:19443: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -pedantic -W -Wformat -Wunused -Wimplicit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar-subscripts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline -Wredundant-decls -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c -ldl   >&5
conftest.c:89: warning: function declaration isn't a prototype
conftest.c:92: warning: function declaration isn't a prototype
configure:19449: $? = 0
configure:19467: result: yes
configure:19588: checking pthread.h usability
configure:19605: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -pedantic -W -Wformat -Wunused -Wimplicit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar-subscripts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline -Wredundant-decls -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:19611: $? = 0
configure:19625: result: yes
configure:19629: checking pthread.h presence
configure:19644: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
configure:19650: $? = 0
configure:19664: result: yes
configure:19692: checking for pthread.h
configure:19699: result: yes
configure:19704: checking for pthread_join in -lpthread
configure:19739: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -pedantic -W -Wformat -Wunused -Wimplicit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar-subscripts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline -Wredundant-decls -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c -lpthread   >&5
conftest.c:90: warning: function declaration isn't a prototype
conftest.c:93: warning: function declaration isn't a prototype
configure:19745: $? = 0
configure:19763: result: yes
configure:20576: checking iconv.h usability
configure:20593: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -pedantic -W -Wformat -Wunused -Wimplicit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar-subscripts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline -Wredundant-decls -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:20599: $? = 0
configure:20613: result: yes
configure:20617: checking iconv.h presence
configure:20632: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c
configure:20638: $? = 0
configure:20652: result: yes
configure:20680: checking for iconv.h
configure:20687: result: yes
configure:20692: checking for iconv
configure:20718: ccache gcc -o conftest -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -pedantic -W -Wformat -Wunused -Wimplicit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar-subscripts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline -Wredundant-decls -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:89: warning: function declaration isn't a prototype
configure:20724: $? = 0
configure:20731: result: yes
configure:20814: checking for iconv declaration
configure:20852: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -pedantic -W -Wformat -Wunused -Wimplicit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar-subscripts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline -Wredundant-decls -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include conftest.c >&5
conftest.c:92: warning: redundant redeclaration of 'iconv'
/usr/include/iconv.h:46: warning: previous declaration of 'iconv' was here
conftest.c:99: warning: function declaration isn't a prototype
configure:20858: $? = 0
configure:20877: result: 
	extern size_t iconv (iconv_t cd,  char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);
configure:21190: creating ./config.status

## ---------------------- ##
## Running config.status. ##
## ---------------------- ##

This file was extended by config.status, which was
generated by GNU Autoconf 2.61.  Invocation command line was

  CONFIG_FILES    = 
  CONFIG_HEADERS  = 
  CONFIG_LINKS    = 
  CONFIG_COMMANDS = 
  $ ./config.status 

on developer

config.status:981: creating libxml2.spec
config.status:981: creating Makefile
config.status:981: creating include/Makefile
config.status:981: creating include/libxml/Makefile
config.status:981: creating doc/Makefile
config.status:981: creating doc/examples/Makefile
config.status:981: creating doc/devhelp/Makefile
config.status:981: creating example/Makefile
config.status:981: creating python/Makefile
config.status:981: creating python/tests/Makefile
config.status:981: creating xstc/Makefile
config.status:981: creating include/libxml/xmlversion.h
config.status:981: creating xml2-config
config.status:981: creating libxml-2.0.pc
config.status:981: creating libxml-2.0-uninstalled.pc
config.status:981: creating python/setup.py
config.status:981: creating config.h
config.status:1328: executing depfiles commands
config.status:1328: executing libtool commands

## ---------------- ##
## Cache variables. ##
## ---------------- ##

ac_cv_build=i686-pc-linux-gnu
ac_cv_c_compiler_gnu=yes
ac_cv_env_CC_set=set
ac_cv_env_CC_value='ccache gcc'
ac_cv_env_CFLAGS_set=set
ac_cv_env_CFLAGS_value='-isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2'
ac_cv_env_CPPFLAGS_set=set
ac_cv_env_CPPFLAGS_value=-isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include
ac_cv_env_CPP_set=set
ac_cv_env_CPP_value='gcc -E'
ac_cv_env_LDFLAGS_set=set
ac_cv_env_LDFLAGS_value='-L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1'
ac_cv_env_LIBS_set=
ac_cv_env_LIBS_value=
ac_cv_env_build_alias_set=set
ac_cv_env_build_alias_value=i686-linux
ac_cv_env_host_alias_set=set
ac_cv_env_host_alias_value=i686-linux
ac_cv_env_target_alias_set=set
ac_cv_env_target_alias_value=i686-linux
ac_cv_func__stat=no
ac_cv_func_class=no
ac_cv_func_dlopen=no
ac_cv_func_finite=yes
ac_cv_func_fp_class=no
ac_cv_func_fpclass=no
ac_cv_func_fprintf=yes
ac_cv_func_ftime=yes
ac_cv_func_getaddrinfo=yes
ac_cv_func_gettimeofday=yes
ac_cv_func_isinf=yes
ac_cv_func_isnan=yes
ac_cv_func_isnand=no
ac_cv_func_localtime=yes
ac_cv_func_printf=yes
ac_cv_func_shl_load=no
ac_cv_func_signal=yes
ac_cv_func_snprintf=yes
ac_cv_func_sprintf=yes
ac_cv_func_sscanf=yes
ac_cv_func_stat=yes
ac_cv_func_strdup=yes
ac_cv_func_strerror=yes
ac_cv_func_strftime=yes
ac_cv_func_strndup=yes
ac_cv_func_vfprintf=yes
ac_cv_func_vsnprintf=yes
ac_cv_func_vsprintf=yes
ac_cv_header_ansidecl_h=yes
ac_cv_header_arpa_inet_h=yes
ac_cv_header_arpa_nameser_h=yes
ac_cv_header_ctype_h=yes
ac_cv_header_dirent_dirent_h=yes
ac_cv_header_dirent_h=yes
ac_cv_header_dl_h=no
ac_cv_header_dlfcn_h=yes
ac_cv_header_errno_h=yes
ac_cv_header_fcntl_h=yes
ac_cv_header_float_h=yes
ac_cv_header_fp_class_h=no
ac_cv_header_iconv_h=yes
ac_cv_header_ieeefp_h=no
ac_cv_header_inttypes_h=yes
ac_cv_header_inttypes_h_h=no
ac_cv_header_limits_h=yes
ac_cv_header_malloc_h=yes
ac_cv_header_math_h=yes
ac_cv_header_memory_h=yes
ac_cv_header_nan_h=no
ac_cv_header_netdb_h=yes
ac_cv_header_netinet_in_h=yes
ac_cv_header_pthread_h=yes
ac_cv_header_resolv_h=yes
ac_cv_header_signal_h=yes
ac_cv_header_stdarg_h=yes
ac_cv_header_stdc=yes
ac_cv_header_stdint_h=yes
ac_cv_header_stdlib_h=yes
ac_cv_header_string_h=yes
ac_cv_header_strings_h=yes
ac_cv_header_sys_mman_h=yes
ac_cv_header_sys_select_h=yes
ac_cv_header_sys_socket_h=yes
ac_cv_header_sys_stat_h=yes
ac_cv_header_sys_time_h=yes
ac_cv_header_sys_timeb_h=yes
ac_cv_header_sys_types_h=yes
ac_cv_header_time_h=yes
ac_cv_header_unistd_h=yes
ac_cv_header_zlib_h=yes
ac_cv_host=i686-pc-linux-gnu
ac_cv_lib_dl_dlopen=yes
ac_cv_lib_dld_shl_load=no
ac_cv_lib_pthread_pthread_join=yes
ac_cv_lib_z_gzread=yes
ac_cv_objext=o
ac_cv_path_EGREP='/bin/grep -E'
ac_cv_path_FGREP='/bin/grep -F'
ac_cv_path_GREP=/bin/grep
ac_cv_path_MV=/bin/mv
ac_cv_path_PERL=/home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin/perl
ac_cv_path_PYTHON=/home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin/python
ac_cv_path_RM=/bin/rm
ac_cv_path_SED=/bin/sed
ac_cv_path_TAR=/bin/tar
ac_cv_path_WGET=/usr/bin/wget
ac_cv_path_XMLLINT=/usr/bin/xmllint
ac_cv_path_XSLTPROC=/home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin/xsltproc
ac_cv_path_install='/home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin/install -c'
ac_cv_path_mkdir=/bin/mkdir
ac_cv_prog_AR=ar
ac_cv_prog_AWK=gawk
ac_cv_prog_CC='ccache gcc'
ac_cv_prog_CPP='gcc -E'
ac_cv_prog_RANLIB=ranlib
ac_cv_prog_STRIP=strip
ac_cv_prog_cc_c89=
ac_cv_prog_cc_g=yes
ac_cv_prog_make_make_set=yes
ac_cv_search_connect='none required'
ac_cv_search_gethostent='none required'
ac_cv_search_opendir='none required'
ac_cv_search_setsockopt='none required'
am_cv_CC_dependencies_compiler_type=gcc3
lt_cv_deplibs_check_method=pass_all
lt_cv_file_magic_cmd='$MAGIC_CMD'
lt_cv_file_magic_test_file=
lt_cv_ld_reload_flag=-r
lt_cv_nm_interface='BSD nm'
lt_cv_objdir=.libs
lt_cv_path_LD=ld
lt_cv_path_NM='/usr/bin/nm -B'
lt_cv_prog_compiler_c_o=yes
lt_cv_prog_compiler_pic_works=yes
lt_cv_prog_compiler_rtti_exceptions=no
lt_cv_prog_compiler_static_works=yes
lt_cv_prog_gnu_ld=yes
lt_cv_sys_global_symbol_pipe='sed -n -e '\''s/^.*[	 ]\([ABCDGIRSTW][ABCDGIRSTW]*\)[	 ][	 ]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2 \2/p'\'''
lt_cv_sys_global_symbol_to_c_name_address='sed -n -e '\''s/^: \([^ ]*\) $/  {\"\1\", (void *) 0},/p'\'' -e '\''s/^[ABCDGIRSTW]* \([^ ]*\) \([^ ]*\)$/  {"\2", (void *) \&\2},/p'\'''
lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='sed -n -e '\''s/^: \([^ ]*\) $/  {\"\1\", (void *) 0},/p'\'' -e '\''s/^[ABCDGIRSTW]* \([^ ]*\) \(lib[^ ]*\)$/  {"\2", (void *) \&\2},/p'\'' -e '\''s/^[ABCDGIRSTW]* \([^ ]*\) \([^ ]*\)$/  {"lib\2", (void *) \&\2},/p'\'''
lt_cv_sys_global_symbol_to_cdecl='sed -n -e '\''s/^T .* \(.*\)$/extern int \1();/p'\'' -e '\''s/^[ABCDGIRSTW]* .* \(.*\)$/extern char \1;/p'\'''
lt_cv_sys_max_cmd_len=98304
xml_cv_iconv_arg2=
xml_cv_iconv_decl='extern size_t iconv (iconv_t cd,  char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);'

## ----------------- ##
## Output variables. ##
## ----------------- ##

ACLOCAL='${SHELL} /home/jader/thinstation/build/tmp/work/i686-linux/libxml2-native-2.7.2-r2/libxml2-2.7.2/missing --run aclocal-1.10'
AMDEPBACKSLASH='\'
AMDEP_FALSE='#'
AMDEP_TRUE=''
AMTAR='${SHELL} /home/jader/thinstation/build/tmp/work/i686-linux/libxml2-native-2.7.2-r2/libxml2-2.7.2/missing --run tar'
ANSI2KNR=''
AR='ar'
AS='as'
AUTOCONF='${SHELL} /home/jader/thinstation/build/tmp/work/i686-linux/libxml2-native-2.7.2-r2/libxml2-2.7.2/missing --run autoconf'
AUTOHEADER='${SHELL} /home/jader/thinstation/build/tmp/work/i686-linux/libxml2-native-2.7.2-r2/libxml2-2.7.2/missing --run autoheader'
AUTOMAKE='${SHELL} /home/jader/thinstation/build/tmp/work/i686-linux/libxml2-native-2.7.2-r2/libxml2-2.7.2/missing --run automake-1.10'
AWK='gawk'
BASE_THREAD_LIBS='-lpthread'
C14N_OBJ='c14n.c'
CATALOG_OBJ='catalog.o'
CC='ccache gcc'
CCDEPMODE='depmode=gcc3'
CFLAGS='-isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -pedantic -W -Wformat -Wunused -Wimplicit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar-subscripts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline -Wredundant-decls'
CPP='gcc -E'
CPPFLAGS='-isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include'
CYGPATH_W='echo'
CYGWIN_EXTRA_LDFLAGS=''
CYGWIN_EXTRA_PYTHON_LIBADD=''
DEBUG_OBJ=''
DEFS='-DHAVE_CONFIG_H'
DEPDIR='.deps'
DLLTOOL='dlltool'
DOCB_OBJ=''
DSYMUTIL=''
DUMPBIN=''
ECHO_C=''
ECHO_N='-n'
ECHO_T=''
EGREP='/bin/grep -E'
EXEEXT=''
FGREP='/bin/grep -F'
FTP_OBJ='nanoftp.o'
GREP='/bin/grep'
HAVE_ISINF=''
HAVE_ISNAN=''
HTML_DIR='$(datadir)/doc/$(PACKAGE)-$(VERSION)/html'
HTML_OBJ='HTMLparser.o HTMLtree.o'
HTTP_OBJ='nanohttp.o'
ICONV_LIBS=''
INSTALL_DATA='${INSTALL} -m 644'
INSTALL_PROGRAM='${INSTALL}'
INSTALL_SCRIPT='${INSTALL}'
INSTALL_STRIP_PROGRAM='$(install_sh) -c -s'
LD='ld'
LDFLAGS='-L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1'
LIBOBJS=''
LIBS=''
LIBTOOL='$(SHELL) $(top_builddir)/i686-linux-libtool'
LIBXML_MAJOR_VERSION='2'
LIBXML_MICRO_VERSION='2'
LIBXML_MINOR_VERSION='7'
LIBXML_VERSION='2.7.2'
LIBXML_VERSION_EXTRA=''
LIBXML_VERSION_INFO='9:2:7'
LIBXML_VERSION_NUMBER='20702'
LIPO=''
LN_S='ln -s'
LTLIBOBJS=''
MAKEINFO='${SHELL} /home/jader/thinstation/build/tmp/work/i686-linux/libxml2-native-2.7.2-r2/libxml2-2.7.2/missing --run makeinfo'
MODULE_EXTENSION='.so'
MODULE_PLATFORM_LIBS='-ldl'
MV='/bin/mv'
M_LIBS='-lm'
NM='/usr/bin/nm -B'
NMEDIT=''
OBJDUMP='objdump'
OBJEXT='o'
OTOOL64=''
OTOOL=''
PACKAGE='libxml2'
PACKAGE_BUGREPORT=''
PACKAGE_NAME=''
PACKAGE_STRING=''
PACKAGE_TARNAME=''
PACKAGE_VERSION=''
PATH_SEPARATOR=':'
PERL='/home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin/perl'
PYTHON='/home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin/python'
PYTHON_INCLUDES='/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include/python2.6'
PYTHON_SITE_PACKAGES='/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib/python2.6/site-packages'
PYTHON_SUBDIR='python'
PYTHON_TESTS=' RelaxNGPythonTests SchemasPythonTests'
PYTHON_VERSION='2.6'
RANLIB='ranlib'
RDL_LIBS=''
READER_TEST='Readertests'
RELDATE='Mon Apr  6 2009'
RM='/bin/rm'
SED='/bin/sed'
SET_MAKE=''
SHELL='/bin/sh'
STATIC_BINARIES=''
STRIP='strip'
TAR='/bin/tar'
TEST_C14N='C14Ntests'
TEST_CATALOG='Catatests'
TEST_DEBUG=''
TEST_HTML='HTMLtests'
TEST_MODULES='ModuleTests'
TEST_PATTERN='Patterntests'
TEST_PHTML='HTMLPushtests'
TEST_PUSH='XMLPushtests'
TEST_REGEXPS='Regexptests Automatatests'
TEST_SAX='SAXtests'
TEST_SCHEMAS='Schemastests Relaxtests'
TEST_SCHEMATRON='Schematrontests'
TEST_THREADS='Threadtests'
TEST_VALID='Validtests'
TEST_VTIME='VTimingtests'
TEST_XINCLUDE='XIncludetests'
TEST_XPATH='XPathtests'
TEST_XPTR='XPtrtests'
THREADS_W32=''
THREAD_CFLAGS=' -D_REENTRANT'
THREAD_LIBS=''
U=''
VERSION='2.7.2'
WGET='/usr/bin/wget'
WIN32_EXTRA_LDFLAGS=''
WIN32_EXTRA_LIBADD=''
WITH_C14N='1'
WITH_CATALOG='1'
WITH_DEBUG='0'
WITH_DOCB='0'
WITH_FTP='1'
WITH_HTML='1'
WITH_HTTP='1'
WITH_ICONV='1'
WITH_ISO8859X='1'
WITH_LEGACY='0'
WITH_MEM_DEBUG='0'
WITH_MODULES='1'
WITH_OUTPUT='1'
WITH_PATTERN='1'
WITH_PUSH='1'
WITH_PYTHON_FALSE='#'
WITH_PYTHON_TRUE=''
WITH_READER='1'
WITH_REGEXPS='1'
WITH_RUN_DEBUG='0'
WITH_SAX1='1'
WITH_SCHEMAS='1'
WITH_SCHEMATRON='1'
WITH_THREADS='1'
WITH_TREE='1'
WITH_TRIO='0'
WITH_TRIO_SOURCES_FALSE=''
WITH_TRIO_SOURCES_TRUE='#'
WITH_VALID='1'
WITH_WRITER='1'
WITH_XINCLUDE='1'
WITH_XPATH='1'
WITH_XPTR='1'
WITH_ZLIB='1'
XINCLUDE_OBJ='xinclude.o'
XMLLINT='/usr/bin/xmllint'
XML_CFLAGS=''
XML_INCLUDEDIR='-I${includedir}/libxml2'
XML_LIBDIR='-L${libdir}'
XML_LIBS='-lxml2 -lz   -lm '
XML_LIBTOOLLIBS='libxml2.la'
XPATH_OBJ='xpath.o'
XPTR_OBJ='xpointer.o'
XSLTPROC='/home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin/xsltproc'
Z_CFLAGS=''
Z_LIBS='-lz'
ac_ct_CC=''
ac_ct_DUMPBIN=''
am__fastdepCC_FALSE='#'
am__fastdepCC_TRUE=''
am__include='include'
am__isrc=''
am__leading_dot='.'
am__quote=''
am__tar='${AMTAR} chof - "$$tardir"'
am__untar='${AMTAR} xf -'
bindir='/home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin'
build='i686-pc-linux-gnu'
build_alias='i686-linux'
build_cpu='i686'
build_os='linux-gnu'
build_vendor='pc'
datadir='/home/jader/thinstation/build/tmp/staging/i686-linux/usr/share'
datarootdir='${prefix}/share'
docdir='${datarootdir}/doc/${PACKAGE}'
dvidir='${docdir}'
exec_prefix='/home/jader/thinstation/build/tmp/staging/i686-linux/usr'
host='i686-pc-linux-gnu'
host_alias='i686-linux'
host_cpu='i686'
host_os='linux-gnu'
host_vendor='pc'
htmldir='${docdir}'
includedir='/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include'
infodir='/home/jader/thinstation/build/tmp/staging/i686-linux/usr/share/info'
install_sh='$(SHELL) /home/jader/thinstation/build/tmp/work/i686-linux/libxml2-native-2.7.2-r2/libxml2-2.7.2/install-sh'
libdir='/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib'
libexecdir='/home/jader/thinstation/build/tmp/staging/i686-linux/usr/libexec'
localedir='${datarootdir}/locale'
localstatedir='/home/jader/thinstation/build/tmp/staging/i686-linux/var'
lt_ECHO='echo'
mandir='/home/jader/thinstation/build/tmp/staging/i686-linux/usr/share/man'
mkdir_p='/bin/mkdir -p'
oldincludedir='/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include'
pdfdir='${docdir}'
prefix='/home/jader/thinstation/build/tmp/staging/i686-linux/usr'
program_transform_name='s,x,x,'
psdir='${docdir}'
pythondir='$(PYTHON_SITE_PACKAGES)'
sbindir='/home/jader/thinstation/build/tmp/staging/i686-linux/usr/sbin'
sharedstatedir='/home/jader/thinstation/build/tmp/staging/i686-linux/usr/com'
sysconfdir='/home/jader/thinstation/build/tmp/staging/i686-linux/etc'
target_alias='i686-linux'

## ----------- ##
## confdefs.h. ##
## ----------- ##

#define PACKAGE_NAME ""
#define PACKAGE_TARNAME ""
#define PACKAGE_VERSION ""
#define PACKAGE_STRING ""
#define PACKAGE_BUGREPORT ""
#define PACKAGE "libxml2"
#define VERSION "2.7.2"
#define PROTOTYPES 1
#define __PROTOTYPES 1
#define STDC_HEADERS 1
#define HAVE_SYS_TYPES_H 1
#define HAVE_SYS_STAT_H 1
#define HAVE_STDLIB_H 1
#define HAVE_STRING_H 1
#define HAVE_MEMORY_H 1
#define HAVE_STRINGS_H 1
#define HAVE_INTTYPES_H 1
#define HAVE_STDINT_H 1
#define HAVE_UNISTD_H 1
#define HAVE_STRING_H 1
#define HAVE_DLFCN_H 1
#define LT_OBJDIR ".libs/"
#define HAVE_ZLIB_H 1
#define HAVE_LIBZ 1
#define HAVE_DIRENT_H 1
#define STDC_HEADERS 1
#define HAVE_FCNTL_H 1
#define HAVE_UNISTD_H 1
#define HAVE_CTYPE_H 1
#define HAVE_DIRENT_H 1
#define HAVE_ERRNO_H 1
#define HAVE_MALLOC_H 1
#define HAVE_STDARG_H 1
#define HAVE_SYS_STAT_H 1
#define HAVE_SYS_TYPES_H 1
#define HAVE_STDINT_H 1
#define HAVE_TIME_H 1
#define HAVE_ANSIDECL_H 1
#define HAVE_MATH_H 1
#define HAVE_LIMITS_H 1
#define HAVE_FLOAT_H 1
#define HAVE_STDLIB_H 1
#define HAVE_SYS_SOCKET_H 1
#define HAVE_NETINET_IN_H 1
#define HAVE_ARPA_INET_H 1
#define HAVE_NETDB_H 1
#define HAVE_SYS_TIME_H 1
#define HAVE_SYS_SELECT_H 1
#define HAVE_SYS_MMAN_H 1
#define HAVE_SYS_TIMEB_H 1
#define HAVE_SIGNAL_H 1
#define HAVE_ARPA_NAMESER_H 1
#define HAVE_RESOLV_H 1
#define HAVE_DLFCN_H 1
#define HAVE_STRFTIME 1
#define HAVE_STRDUP 1
#define HAVE_STRNDUP 1
#define HAVE_STRERROR 1
#define HAVE_FINITE 1
#define HAVE_STRFTIME 1
#define HAVE_LOCALTIME 1
#define HAVE_GETTIMEOFDAY 1
#define HAVE_FTIME 1
#define HAVE_STAT 1
#define HAVE_SIGNAL 1
#define HAVE_PRINTF 1
#define HAVE_SPRINTF 1
#define HAVE_FPRINTF 1
#define HAVE_SNPRINTF 1
#define HAVE_VFPRINTF 1
#define HAVE_VSPRINTF 1
#define HAVE_VSNPRINTF 1
#define HAVE_SSCANF 1
#define HAVE_VA_COPY 1
#define XML_SOCKLEN_T socklen_t
#define SUPPORT_IP6
#define HAVE_GETADDRINFO
#define HAVE_ISNAN
#define HAVE_ISINF
#define HAVE_DLOPEN
#define HAVE_LIBPTHREAD
#define HAVE_PTHREAD_H
#define ICONV_CONST 

configure: exit 0
NOTE: make
make  all-recursive
make[1]: Entering directory `/home/jader/thinstation/build/tmp/work/i686-linux/libxml2-native-2.7.2-r2/libxml2-2.7.2'
Making all in include
make[2]: Entering directory `/home/jader/thinstation/build/tmp/work/i686-linux/libxml2-native-2.7.2-r2/libxml2-2.7.2/include'
Making all in libxml
make[3]: Entering directory `/home/jader/thinstation/build/tmp/work/i686-linux/libxml2-native-2.7.2-r2/libxml2-2.7.2/include/libxml'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/jader/thinstation/build/tmp/work/i686-linux/libxml2-native-2.7.2-r2/libxml2-2.7.2/include/libxml'
make[3]: Entering directory `/home/jader/thinstation/build/tmp/work/i686-linux/libxml2-native-2.7.2-r2/libxml2-2.7.2/include'
make[3]: Nothing to be done for `all-am'.
make[3]: Leaving directory `/home/jader/thinstation/build/tmp/work/i686-linux/libxml2-native-2.7.2-r2/libxml2-2.7.2/include'
make[2]: Leaving directory `/home/jader/thinstation/build/tmp/work/i686-linux/libxml2-native-2.7.2-r2/libxml2-2.7.2/include'
Making all in .
make[2]: Entering directory `/home/jader/thinstation/build/tmp/work/i686-linux/libxml2-native-2.7.2-r2/libxml2-2.7.2'
/bin/sh ./i686-linux-libtool --tag=CC   --mode=link ccache gcc  -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -pedantic -W -Wformat -Wunused -Wimplicit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar-subscripts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline -Wredundant-decls  -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 -o xmllint xmllint.o ./libxml2.la  -lz  -lm  
i686-linux-libtool: link: ccache gcc -isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include -O2 -pedantic -W -Wformat -Wunused -Wimplicit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar-subscripts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline -Wredundant-decls -Wl,-rpath-link -Wl,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath -Wl,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 -o .libs/xmllint xmllint.o  -L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib ./.libs/libxml2.so -ldl /home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib/libz.so -lm -Wl,-rpath -Wl,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib
./.libs/libxml2.so: undefined reference to `gzopen64'
collect2: ld returned 1 exit status
make[2]: *** [xmllint] Error 1
make[2]: Leaving directory `/home/jader/thinstation/build/tmp/work/i686-linux/libxml2-native-2.7.2-r2/libxml2-2.7.2'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/jader/thinstation/build/tmp/work/i686-linux/libxml2-native-2.7.2-r2/libxml2-2.7.2'
make: *** [all] Error 2
FATAL: oe_runmake failed

--------------030408070405010303090901
Content-Type: text/x-log;
 name="config.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
 filename="config.log"

This file contains any messages produced by compilers while
running configure, to aid debugging if configure makes a mistake.

It was created by configure, which was
generated by GNU Autoconf 2.61.  Invocation command line was

  $ /home/jader/thinstation/build/tmp/work/i686-linux/libxml2-native-2.7.=
2-r3/libxml2-2.7.2/configure --build=3Di686-linux --host=3Di686-linux --t=
arget=3Di686-linux --prefix=3D/home/jader/thinstation/build/tmp/staging/i=
686-linux/usr --exec_prefix=3D/home/jader/thinstation/build/tmp/staging/i=
686-linux/usr --bindir=3D/home/jader/thinstation/build/tmp/staging/i686-l=
inux/usr/bin --sbindir=3D/home/jader/thinstation/build/tmp/staging/i686-l=
inux/usr/sbin --libexecdir=3D/home/jader/thinstation/build/tmp/staging/i6=
86-linux/usr/libexec --datadir=3D/home/jader/thinstation/build/tmp/stagin=
g/i686-linux/usr/share --sysconfdir=3D/home/jader/thinstation/build/tmp/s=
taging/i686-linux/etc --sharedstatedir=3D/home/jader/thinstation/build/tm=
p/staging/i686-linux/usr/com --localstatedir=3D/home/jader/thinstation/bu=
ild/tmp/staging/i686-linux/var --libdir=3D/home/jader/thinstation/build/t=
mp/staging/i686-linux/usr/lib --includedir=3D/home/jader/thinstation/buil=
d/tmp/staging/i686-linux/usr/include --oldincludedir=3D/home/jader/thinst=
ation/build/tmp/staging/i686-linux/usr/include --infodir=3D/home/jader/th=
instation/build/tmp/staging/i686-linux/usr/share/info --mandir=3D/home/ja=
der/thinstation/build/tmp/staging/i686-linux/usr/share/man --with-python=3D=
python2.6 --without-debug --without-legacy --with-catalog --without-docbo=
ok --with-c14n --with-zlib=3D/home/jader/thinstation/build/tmp/staging/i6=
86-linux/usr/include/zlib.h

## --------- ##
## Platform. ##
## --------- ##

hostname =3D developer
uname -m =3D i686
uname -r =3D 2.6.24-23-virtual
uname -s =3D Linux
uname -v =3D #1 SMP Mon Jan 26 01:36:35 UTC 2009

/usr/bin/uname -p =3D unknown
/bin/uname -X     =3D unknown

/bin/arch              =3D unknown
/usr/bin/arch -k       =3D unknown
/usr/convex/getsysinfo =3D unknown
/usr/bin/hostinfo      =3D unknown
/bin/machine           =3D unknown
/usr/bin/oslevel       =3D unknown
/bin/universe          =3D unknown

PATH: /home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin
PATH: /home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin/i686-l=
inux
PATH: /home/jader/thinstation/build/tmp/staging/i686-linux/usr/sbin
PATH: /home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin
PATH: /home/jader/thinstation/build/tmp/cross/i686/bin
PATH: /home/jader/thinstation/build/tmp/staging/i686-linux/sbin
PATH: /home/jader/thinstation/build/tmp/staging/i686-linux/bin
PATH: /home/jader/thinstation/bitbake-1.8.12/bin
PATH: /usr/local/sbin
PATH: /usr/local/bin
PATH: /usr/sbin
PATH: /usr/bin
PATH: /sbin
PATH: /bin
PATH: /usr/games


## ----------- ##
## Core tests. ##
## ----------- ##

configure:2097: checking build system type
configure:2115: result: i686-pc-linux-gnu
configure:2137: checking host system type
configure:2152: result: i686-pc-linux-gnu
configure:2225: checking for a BSD-compatible install
configure:2281: result: /home/jader/thinstation/build/tmp/staging/i686-li=
nux/usr/bin/install -c
configure:2292: checking whether build environment is sane
configure:2335: result: yes
configure:2363: checking for a thread-safe mkdir -p
configure:2402: result: /bin/mkdir -p
configure:2415: checking for gawk
configure:2431: found /usr/bin/gawk
configure:2442: result: gawk
configure:2453: checking whether make sets $(MAKE)
configure:2474: result: yes
configure:2671: checking for i686-linux-gcc
configure:2698: result: ccache gcc
configure:2976: checking for C compiler version
configure:2983: ccache gcc --version >&5
gcc (GCC) 4.2.4 (Ubuntu 4.2.4-1ubuntu3)
Copyright (C) 2007 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is N=
O
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOS=
E.

configure:2986: $? =3D 0
configure:2993: ccache gcc -v >&5
Reading specs from /usr/lib/gcc/i486-linux-gnu/4.2.4/specs
Target: i486-linux-gnu
Configured with: ../src/configure -v --enable-languages=3Dc,c++,fortran,o=
bjc,obj-c++,treelang --prefix=3D/usr --enable-shared --with-system-zlib -=
-libexecdir=3D/usr/lib --without-included-gettext --enable-threads=3Dposi=
x --enable-nls --with-gxx-include-dir=3D/usr/include/c++/4.2 --program-su=
ffix=3D-4.2 --enable-clocale=3Dgnu --enable-libstdcxx-debug --enable-objc=
-gc --enable-mpfr --enable-targets=3Dall --enable-checking=3Drelease --bu=
ild=3Di486-linux-gnu --host=3Di486-linux-gnu --target=3Di486-linux-gnu
Thread model: posix
gcc version 4.2.4 (Ubuntu 4.2.4-1ubuntu3)
configure:2996: $? =3D 0
configure:3003: ccache gcc -V >&5
gcc: '-V' option must have argument
configure:3006: $? =3D 1
configure:3029: checking for C compiler default output file name
configure:3056: ccache gcc -isystem/home/jader/thinstation/build/tmp/stag=
ing/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -L/home/jader/thinstation/build/tmp/stagin=
g/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/st=
aging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/sta=
ging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:3059: $? =3D 0
configure:3097: result: a.out
configure:3114: checking whether the C compiler works
configure:3124: ./a.out
configure:3127: $? =3D 0
configure:3144: result: yes
configure:3151: checking whether we are cross compiling
configure:3153: result: no
configure:3156: checking for suffix of executables
configure:3163: ccache gcc -o conftest -isystem/home/jader/thinstation/bu=
ild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstatio=
n/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/buil=
d/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:3166: $? =3D 0
configure:3190: result:=20
configure:3196: checking for suffix of object files
configure:3222: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/s=
taging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/t=
mp/staging/i686-linux/usr/include conftest.c >&5
configure:3225: $? =3D 0
configure:3248: result: o
configure:3252: checking whether we are using the GNU C compiler
configure:3281: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/s=
taging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/t=
mp/staging/i686-linux/usr/include conftest.c >&5
configure:3287: $? =3D 0
configure:3304: result: yes
configure:3309: checking whether ccache gcc accepts -g
configure:3339: ccache gcc -c -g -isystem/home/jader/thinstation/build/tm=
p/staging/i686-linux/usr/include conftest.c >&5
configure:3345: $? =3D 0
configure:3444: result: yes
configure:3461: checking for ccache gcc option to accept ISO C89
configure:3535: ccache gcc  -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:3541: $? =3D 0
configure:3564: result: none needed
configure:3593: checking for style of include used by make
configure:3621: result: GNU
configure:3646: checking dependency style of ccache gcc
configure:3737: result: gcc3
configure:3765: checking for a BSD-compatible install
configure:3821: result: /home/jader/thinstation/build/tmp/staging/i686-li=
nux/usr/bin/install -c
configure:3837: checking how to run the C preprocessor
configure:3953: result: gcc -E
configure:3982: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/=
i686-linux/usr/include conftest.c
configure:3988: $? =3D 0
configure:4019: gcc -E -isystem/home/jader/thinstation/build/tmp/staging/=
i686-linux/usr/include conftest.c
conftest.c:10:28: error: ac_nonexistent.h: No such file or directory
configure:4025: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| /* end confdefs.h.  */
| #include <ac_nonexistent.h>
configure:4064: checking for rm
configure:4082: found /bin/rm
configure:4095: result: /bin/rm
configure:4105: checking for mv
configure:4123: found /bin/mv
configure:4136: result: /bin/mv
configure:4146: checking for tar
configure:4164: found /bin/tar
configure:4177: result: /bin/tar
configure:4187: checking for perl
configure:4205: found /home/jader/thinstation/build/tmp/staging/i686-linu=
x/usr/bin/perl
configure:4218: result: /home/jader/thinstation/build/tmp/staging/i686-li=
nux/usr/bin/perl
configure:4228: checking for wget
configure:4246: found /usr/bin/wget
configure:4259: result: /usr/bin/wget
configure:4269: checking for xmllint
configure:4287: found /usr/bin/xmllint
configure:4300: result: /usr/bin/xmllint
configure:4310: checking for xsltproc
configure:4328: found /home/jader/thinstation/build/tmp/staging/i686-linu=
x/usr/bin/xsltproc
configure:4341: result: /home/jader/thinstation/build/tmp/staging/i686-li=
nux/usr/bin/xsltproc
configure:4350: checking for function prototypes
configure:4353: result: yes
configure:4372: checking for grep that handles long lines and -e
configure:4446: result: /bin/grep
configure:4451: checking for egrep
configure:4529: result: /bin/grep -E
configure:4534: checking for ANSI C header files
configure:4564: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/s=
taging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/t=
mp/staging/i686-linux/usr/include conftest.c >&5
configure:4570: $? =3D 0
configure:4669: ccache gcc -o conftest -isystem/home/jader/thinstation/bu=
ild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstatio=
n/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/buil=
d/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:4672: $? =3D 0
configure:4678: ./conftest
configure:4681: $? =3D 0
configure:4698: result: yes
configure:4722: checking for sys/types.h
configure:4743: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/s=
taging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/t=
mp/staging/i686-linux/usr/include conftest.c >&5
configure:4749: $? =3D 0
configure:4765: result: yes
configure:4722: checking for sys/stat.h
configure:4743: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/s=
taging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/t=
mp/staging/i686-linux/usr/include conftest.c >&5
configure:4749: $? =3D 0
configure:4765: result: yes
configure:4722: checking for stdlib.h
configure:4743: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/s=
taging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/t=
mp/staging/i686-linux/usr/include conftest.c >&5
configure:4749: $? =3D 0
configure:4765: result: yes
configure:4722: checking for string.h
configure:4743: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/s=
taging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/t=
mp/staging/i686-linux/usr/include conftest.c >&5
configure:4749: $? =3D 0
configure:4765: result: yes
configure:4722: checking for memory.h
configure:4743: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/s=
taging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/t=
mp/staging/i686-linux/usr/include conftest.c >&5
configure:4749: $? =3D 0
configure:4765: result: yes
configure:4722: checking for strings.h
configure:4743: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/s=
taging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/t=
mp/staging/i686-linux/usr/include conftest.c >&5
configure:4749: $? =3D 0
configure:4765: result: yes
configure:4722: checking for inttypes.h
configure:4743: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/s=
taging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/t=
mp/staging/i686-linux/usr/include conftest.c >&5
configure:4749: $? =3D 0
configure:4765: result: yes
configure:4722: checking for stdint.h
configure:4743: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/s=
taging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/t=
mp/staging/i686-linux/usr/include conftest.c >&5
configure:4749: $? =3D 0
configure:4765: result: yes
configure:4722: checking for unistd.h
configure:4743: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/s=
taging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/t=
mp/staging/i686-linux/usr/include conftest.c >&5
configure:4749: $? =3D 0
configure:4765: result: yes
configure:4790: checking for string.h
configure:4796: result: yes
configure:5270: checking for a sed that does not truncate output
configure:5349: result: /bin/sed
configure:5367: checking for fgrep
configure:5445: result: /bin/grep -F
configure:5480: checking for ld used by ccache gcc
configure:5547: result: ld
configure:5556: checking if the linker (ld) is GNU ld
configure:5571: result: yes
configure:5583: checking for BSD- or MS-compatible name lister (nm)
configure:5632: result: /usr/bin/nm -B
configure:5754: checking the name lister (/usr/bin/nm -B) interface
configure:5761: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/s=
taging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/t=
mp/staging/i686-linux/usr/include conftest.c >&5
configure:5764: /usr/bin/nm -B "conftest.o"
configure:5767: output
00000000 B some_variable
configure:5774: result: BSD nm
configure:5777: checking whether ln -s works
configure:5781: result: yes
configure:5789: checking the maximum length of command line arguments
configure:5909: result: 98304
configure:5926: checking whether the shell understands some XSI construct=
s
configure:5936: result: yes
configure:5940: checking whether the shell understands "+=3D"
configure:5946: result: yes
configure:5981: checking for ld option to reload object files
configure:5988: result: -r
configure:6015: checking how to recognize dependent libraries
configure:6205: result: pass_all
configure:6225: checking for i686-linux-ar
configure:6252: result: ar
configure:6334: checking for i686-linux-strip
configure:6361: result: strip
configure:6437: checking for i686-linux-ranlib
configure:6464: result: ranlib
configure:6598: checking command to parse /usr/bin/nm -B output from ccac=
he gcc object
configure:6716: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/s=
taging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/t=
mp/staging/i686-linux/usr/include conftest.c >&5
configure:6719: $? =3D 0
configure:6723: /usr/bin/nm -B conftest.o \| sed -n -e 's/^.*[	 ]\([ABCDG=
IRSTW][ABCDGIRSTW]*\)[	 ][	 ]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2 \2/p' \> =
conftest.nm
configure:6726: $? =3D 0
configure:6780: ccache gcc -o conftest -isystem/home/jader/thinstation/bu=
ild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstatio=
n/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/buil=
d/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c conftstm.o >&5
configure:6783: $? =3D 0
configure:6821: result: ok
configure:7698: checking for dlfcn.h
configure:7719: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/s=
taging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/t=
mp/staging/i686-linux/usr/include conftest.c >&5
configure:7725: $? =3D 0
configure:7741: result: yes
configure:7924: checking for objdir
configure:7939: result: .libs
configure:8231: checking if ccache gcc supports -fno-rtti -fno-exceptions=

configure:8249: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/s=
taging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/t=
mp/staging/i686-linux/usr/include -fno-rtti -fno-exceptions conftest.c >&=
5
cc1: warning: command line option "-fno-rtti" is valid for C++/ObjC++ but=
 not for C
configure:8253: $? =3D 0
configure:8266: result: no
configure:8286: checking for ccache gcc option to produce PIC
configure:8543: result: -fPIC -DPIC
configure:8555: checking if ccache gcc PIC flag -fPIC -DPIC works
configure:8573: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/s=
taging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/t=
mp/staging/i686-linux/usr/include -fPIC -DPIC -DPIC conftest.c >&5
configure:8577: $? =3D 0
configure:8590: result: yes
configure:8614: checking if ccache gcc static flag -static works
configure:8642: result: yes
configure:8657: checking if ccache gcc supports -c -o file.o
configure:8678: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/s=
taging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/t=
mp/staging/i686-linux/usr/include -o out/conftest2.o conftest.c >&5
configure:8682: $? =3D 0
configure:8704: result: yes
configure:8712: checking if ccache gcc supports -c -o file.o
configure:8759: result: yes
configure:8792: checking whether the ccache gcc linker (ld) supports shar=
ed libraries
configure:9846: result: yes
configure:9883: checking whether -lc should be explicitly linked in
configure:9888: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/s=
taging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/t=
mp/staging/i686-linux/usr/include conftest.c >&5
configure:9891: $? =3D 0
configure:9906: ccache gcc -shared conftest.o  -v -Wl,-soname -Wl,conftes=
t -o conftest 2\>\&1 \| /bin/grep  -lc  \>/dev/null 2\>\&1
configure:9909: $? =3D 0
configure:9921: result: no
configure:10085: checking dynamic linker characteristics
configure:10528: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 -Wl,-rpath -Wl,/foo conftest=
=2Ec  >&5
configure:10534: $? =3D 0
configure:10764: result: GNU/Linux ld.so
configure:10866: checking how to hardcode library paths into programs
configure:10891: result: immediate
configure:11704: checking whether stripping libraries is possible
configure:11709: result: yes
configure:11744: checking if libtool supports shared libraries
configure:11746: result: yes
configure:11749: checking whether to build shared libraries
configure:11770: result: yes
configure:11773: checking whether to build static libraries
configure:11777: result: yes
configure:12246: checking zlib.h usability
configure:12263: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include -I/home/jader/thinstation/build/tmp/st=
aging/i686-linux/usr/include/zlib.h/include conftest.c >&5
cc1: error: /home/jader/thinstation/build/tmp/staging/i686-linux/usr/incl=
ude/zlib.h/include: Not a directory
configure:12269: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <zlib.h>
configure:12283: result: no
configure:12287: checking zlib.h presence
configure:12302: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include -I/home/jader/thinstation/build/tmp/staging/i686-=
linux/usr/include/zlib.h/include conftest.c
cc1: error: /home/jader/thinstation/build/tmp/staging/i686-linux/usr/incl=
ude/zlib.h/include: Not a directory
configure:12308: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| /* end confdefs.h.  */
| #include <zlib.h>
configure:12322: result: no
configure:12350: checking for zlib.h
configure:12358: result: no
configure:12471: checking for dirent.h that defines DIR
configure:12500: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:12506: $? =3D 0
configure:12522: result: yes
configure:12535: checking for library containing opendir
configure:12576: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:12582: $? =3D 0
configure:12610: result: none required
configure:12704: checking for ANSI C header files
configure:12868: result: yes
configure:12893: checking fcntl.h usability
configure:12910: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:12916: $? =3D 0
configure:12930: result: yes
configure:12934: checking fcntl.h presence
configure:12949: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
configure:12955: $? =3D 0
configure:12969: result: yes
configure:12997: checking for fcntl.h
configure:13005: result: yes
configure:13023: checking for unistd.h
configure:13029: result: yes
configure:13173: checking ctype.h usability
configure:13190: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:13196: $? =3D 0
configure:13210: result: yes
configure:13214: checking ctype.h presence
configure:13229: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
configure:13235: $? =3D 0
configure:13249: result: yes
configure:13277: checking for ctype.h
configure:13285: result: yes
configure:13313: checking dirent.h usability
configure:13330: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:13336: $? =3D 0
configure:13350: result: yes
configure:13354: checking dirent.h presence
configure:13369: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
configure:13375: $? =3D 0
configure:13389: result: yes
configure:13417: checking for dirent.h
configure:13425: result: yes
configure:13453: checking errno.h usability
configure:13470: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:13476: $? =3D 0
configure:13490: result: yes
configure:13494: checking errno.h presence
configure:13509: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
configure:13515: $? =3D 0
configure:13529: result: yes
configure:13557: checking for errno.h
configure:13565: result: yes
configure:13593: checking malloc.h usability
configure:13610: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:13616: $? =3D 0
configure:13630: result: yes
configure:13634: checking malloc.h presence
configure:13649: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
configure:13655: $? =3D 0
configure:13669: result: yes
configure:13697: checking for malloc.h
configure:13705: result: yes
configure:13733: checking stdarg.h usability
configure:13750: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:13756: $? =3D 0
configure:13770: result: yes
configure:13774: checking stdarg.h presence
configure:13789: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
configure:13795: $? =3D 0
configure:13809: result: yes
configure:13837: checking for stdarg.h
configure:13845: result: yes
configure:13863: checking for sys/stat.h
configure:13869: result: yes
configure:14003: checking for sys/types.h
configure:14009: result: yes
configure:14143: checking for stdint.h
configure:14149: result: yes
configure:14293: checking inttypes.h.h usability
configure:14310: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
conftest.c:70:24: error: inttypes.h.h: No such file or directory
configure:14316: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <inttypes.h.h>
configure:14330: result: no
configure:14334: checking inttypes.h.h presence
configure:14349: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
conftest.c:37:24: error: inttypes.h.h: No such file or directory
configure:14355: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| /* end confdefs.h.  */
| #include <inttypes.h.h>
configure:14369: result: no
configure:14397: checking for inttypes.h.h
configure:14405: result: no
configure:14433: checking time.h usability
configure:14450: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:14456: $? =3D 0
configure:14470: result: yes
configure:14474: checking time.h presence
configure:14489: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
configure:14495: $? =3D 0
configure:14509: result: yes
configure:14537: checking for time.h
configure:14545: result: yes
configure:14573: checking ansidecl.h usability
configure:14590: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:14596: $? =3D 0
configure:14610: result: yes
configure:14614: checking ansidecl.h presence
configure:14629: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
configure:14635: $? =3D 0
configure:14649: result: yes
configure:14677: checking for ansidecl.h
configure:14685: result: yes
configure:14713: checking ieeefp.h usability
configure:14730: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
conftest.c:72:20: error: ieeefp.h: No such file or directory
configure:14736: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <ieeefp.h>
configure:14750: result: no
configure:14754: checking ieeefp.h presence
configure:14769: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
conftest.c:39:20: error: ieeefp.h: No such file or directory
configure:14775: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| /* end confdefs.h.  */
| #include <ieeefp.h>
configure:14789: result: no
configure:14817: checking for ieeefp.h
configure:14825: result: no
configure:14853: checking nan.h usability
configure:14870: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
conftest.c:72:17: error: nan.h: No such file or directory
configure:14876: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <nan.h>
configure:14890: result: no
configure:14894: checking nan.h presence
configure:14909: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
conftest.c:39:17: error: nan.h: No such file or directory
configure:14915: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| /* end confdefs.h.  */
| #include <nan.h>
configure:14929: result: no
configure:14957: checking for nan.h
configure:14965: result: no
configure:14993: checking math.h usability
configure:15010: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:15016: $? =3D 0
configure:15030: result: yes
configure:15034: checking math.h presence
configure:15049: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
configure:15055: $? =3D 0
configure:15069: result: yes
configure:15097: checking for math.h
configure:15105: result: yes
configure:15133: checking limits.h usability
configure:15150: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:15156: $? =3D 0
configure:15170: result: yes
configure:15174: checking limits.h presence
configure:15189: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
configure:15195: $? =3D 0
configure:15209: result: yes
configure:15237: checking for limits.h
configure:15245: result: yes
configure:15273: checking fp_class.h usability
configure:15290: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
conftest.c:74:22: error: fp_class.h: No such file or directory
configure:15296: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <fp_class.h>
configure:15310: result: no
configure:15314: checking fp_class.h presence
configure:15329: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
conftest.c:41:22: error: fp_class.h: No such file or directory
configure:15335: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| /* end confdefs.h.  */
| #include <fp_class.h>
configure:15349: result: no
configure:15377: checking for fp_class.h
configure:15385: result: no
configure:15413: checking float.h usability
configure:15430: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:15436: $? =3D 0
configure:15450: result: yes
configure:15454: checking float.h presence
configure:15469: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
configure:15475: $? =3D 0
configure:15489: result: yes
configure:15517: checking for float.h
configure:15525: result: yes
configure:15543: checking for stdlib.h
configure:15549: result: yes
configure:15682: checking for sys/socket.h
configure:15706: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:15712: $? =3D 0
configure:15728: result: yes
configure:15743: checking for netinet/in.h
configure:15767: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:15773: $? =3D 0
configure:15789: result: yes
configure:15804: checking for arpa/inet.h
configure:15831: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:15837: $? =3D 0
configure:15853: result: yes
configure:15879: checking netdb.h usability
configure:15896: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:15902: $? =3D 0
configure:15916: result: yes
configure:15920: checking netdb.h presence
configure:15935: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
configure:15941: $? =3D 0
configure:15955: result: yes
configure:15983: checking for netdb.h
configure:15991: result: yes
configure:16019: checking sys/time.h usability
configure:16036: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:16042: $? =3D 0
configure:16056: result: yes
configure:16060: checking sys/time.h presence
configure:16075: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
configure:16081: $? =3D 0
configure:16095: result: yes
configure:16123: checking for sys/time.h
configure:16131: result: yes
configure:16159: checking sys/select.h usability
configure:16176: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:16182: $? =3D 0
configure:16196: result: yes
configure:16200: checking sys/select.h presence
configure:16215: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
configure:16221: $? =3D 0
configure:16235: result: yes
configure:16263: checking for sys/select.h
configure:16271: result: yes
configure:16299: checking sys/mman.h usability
configure:16316: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:16322: $? =3D 0
configure:16336: result: yes
configure:16340: checking sys/mman.h presence
configure:16355: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
configure:16361: $? =3D 0
configure:16375: result: yes
configure:16403: checking for sys/mman.h
configure:16411: result: yes
configure:16439: checking sys/timeb.h usability
configure:16456: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:16462: $? =3D 0
configure:16476: result: yes
configure:16480: checking sys/timeb.h presence
configure:16495: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
configure:16501: $? =3D 0
configure:16515: result: yes
configure:16543: checking for sys/timeb.h
configure:16551: result: yes
configure:16579: checking signal.h usability
configure:16596: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:16602: $? =3D 0
configure:16616: result: yes
configure:16620: checking signal.h presence
configure:16635: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
configure:16641: $? =3D 0
configure:16655: result: yes
configure:16683: checking for signal.h
configure:16691: result: yes
configure:16708: checking for arpa/nameser.h
configure:16732: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:16738: $? =3D 0
configure:16754: result: yes
configure:16769: checking for resolv.h
configure:16799: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:16805: $? =3D 0
configure:16821: result: yes
configure:16847: checking dl.h usability
configure:16864: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
conftest.c:87:16: error: dl.h: No such file or directory
configure:16870: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| #define HAVE_FLOAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_SYS_SOCKET_H 1
| #define HAVE_NETINET_IN_H 1
| #define HAVE_ARPA_INET_H 1
| #define HAVE_NETDB_H 1
| #define HAVE_SYS_TIME_H 1
| #define HAVE_SYS_SELECT_H 1
| #define HAVE_SYS_MMAN_H 1
| #define HAVE_SYS_TIMEB_H 1
| #define HAVE_SIGNAL_H 1
| #define HAVE_ARPA_NAMESER_H 1
| #define HAVE_RESOLV_H 1
| /* end confdefs.h.  */
| #include <stdio.h>
| #ifdef HAVE_SYS_TYPES_H
| # include <sys/types.h>
| #endif
| #ifdef HAVE_SYS_STAT_H
| # include <sys/stat.h>
| #endif
| #ifdef STDC_HEADERS
| # include <stdlib.h>
| # include <stddef.h>
| #else
| # ifdef HAVE_STDLIB_H
| #  include <stdlib.h>
| # endif
| #endif
| #ifdef HAVE_STRING_H
| # if !defined STDC_HEADERS && defined HAVE_MEMORY_H
| #  include <memory.h>
| # endif
| # include <string.h>
| #endif
| #ifdef HAVE_STRINGS_H
| # include <strings.h>
| #endif
| #ifdef HAVE_INTTYPES_H
| # include <inttypes.h>
| #endif
| #ifdef HAVE_STDINT_H
| # include <stdint.h>
| #endif
| #ifdef HAVE_UNISTD_H
| # include <unistd.h>
| #endif
| #include <dl.h>
configure:16884: result: no
configure:16888: checking dl.h presence
configure:16903: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
conftest.c:54:16: error: dl.h: No such file or directory
configure:16909: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| #define HAVE_FLOAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_SYS_SOCKET_H 1
| #define HAVE_NETINET_IN_H 1
| #define HAVE_ARPA_INET_H 1
| #define HAVE_NETDB_H 1
| #define HAVE_SYS_TIME_H 1
| #define HAVE_SYS_SELECT_H 1
| #define HAVE_SYS_MMAN_H 1
| #define HAVE_SYS_TIMEB_H 1
| #define HAVE_SIGNAL_H 1
| #define HAVE_ARPA_NAMESER_H 1
| #define HAVE_RESOLV_H 1
| /* end confdefs.h.  */
| #include <dl.h>
configure:16923: result: no
configure:16951: checking for dl.h
configure:16959: result: no
configure:16977: checking for dlfcn.h
configure:16983: result: yes
configure:17120: checking for strftime
configure:17176: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:78: warning: conflicting types for built-in function 'strftime=
'
configure:17182: $? =3D 0
configure:17200: result: yes
configure:17287: checking for strdup
configure:17343: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:79: warning: conflicting types for built-in function 'strdup'
configure:17349: $? =3D 0
configure:17367: result: yes
configure:17287: checking for strndup
configure:17343: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:80: warning: conflicting types for built-in function 'strndup'=

configure:17349: $? =3D 0
configure:17367: result: yes
configure:17287: checking for strerror
configure:17343: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:17349: $? =3D 0
configure:17367: result: yes
configure:17385: checking for finite
configure:17441: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:82: warning: conflicting types for built-in function 'finite'
configure:17447: $? =3D 0
configure:17465: result: yes
configure:17385: checking for isnand
configure:17441: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
/tmp/ccyL41Wa.o: In function `main':
conftest.c:(.text+0x12): undefined reference to `isnand'
collect2: ld returned 1 exit status
configure:17447: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| #define HAVE_FLOAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_SYS_SOCKET_H 1
| #define HAVE_NETINET_IN_H 1
| #define HAVE_ARPA_INET_H 1
| #define HAVE_NETDB_H 1
| #define HAVE_SYS_TIME_H 1
| #define HAVE_SYS_SELECT_H 1
| #define HAVE_SYS_MMAN_H 1
| #define HAVE_SYS_TIMEB_H 1
| #define HAVE_SIGNAL_H 1
| #define HAVE_ARPA_NAMESER_H 1
| #define HAVE_RESOLV_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STRFTIME 1
| #define HAVE_STRDUP 1
| #define HAVE_STRNDUP 1
| #define HAVE_STRERROR 1
| #define HAVE_FINITE 1
| /* end confdefs.h.  */
| /* Define isnand to an innocuous variant, in case <limits.h> declares i=
snand.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define isnand innocuous_isnand
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char isnand (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef isnand
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char isnand ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_isnand || defined __stub___isnand
| choke me
| #endif
|=20
| int
| main ()
| {
| return isnand ();
|   ;
|   return 0;
| }
configure:17465: result: no
configure:17385: checking for fp_class
configure:17441: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
/tmp/ccAz0lns.o: In function `main':
conftest.c:(.text+0x12): undefined reference to `fp_class'
collect2: ld returned 1 exit status
configure:17447: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| #define HAVE_FLOAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_SYS_SOCKET_H 1
| #define HAVE_NETINET_IN_H 1
| #define HAVE_ARPA_INET_H 1
| #define HAVE_NETDB_H 1
| #define HAVE_SYS_TIME_H 1
| #define HAVE_SYS_SELECT_H 1
| #define HAVE_SYS_MMAN_H 1
| #define HAVE_SYS_TIMEB_H 1
| #define HAVE_SIGNAL_H 1
| #define HAVE_ARPA_NAMESER_H 1
| #define HAVE_RESOLV_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STRFTIME 1
| #define HAVE_STRDUP 1
| #define HAVE_STRNDUP 1
| #define HAVE_STRERROR 1
| #define HAVE_FINITE 1
| /* end confdefs.h.  */
| /* Define fp_class to an innocuous variant, in case <limits.h> declares=
 fp_class.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define fp_class innocuous_fp_class
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char fp_class (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef fp_class
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char fp_class ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_fp_class || defined __stub___fp_class
| choke me
| #endif
|=20
| int
| main ()
| {
| return fp_class ();
|   ;
|   return 0;
| }
configure:17465: result: no
configure:17385: checking for class
configure:17441: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
/tmp/ccyDbOuI.o: In function `main':
conftest.c:(.text+0x12): undefined reference to `class'
collect2: ld returned 1 exit status
configure:17447: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| #define HAVE_FLOAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_SYS_SOCKET_H 1
| #define HAVE_NETINET_IN_H 1
| #define HAVE_ARPA_INET_H 1
| #define HAVE_NETDB_H 1
| #define HAVE_SYS_TIME_H 1
| #define HAVE_SYS_SELECT_H 1
| #define HAVE_SYS_MMAN_H 1
| #define HAVE_SYS_TIMEB_H 1
| #define HAVE_SIGNAL_H 1
| #define HAVE_ARPA_NAMESER_H 1
| #define HAVE_RESOLV_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STRFTIME 1
| #define HAVE_STRDUP 1
| #define HAVE_STRNDUP 1
| #define HAVE_STRERROR 1
| #define HAVE_FINITE 1
| /* end confdefs.h.  */
| /* Define class to an innocuous variant, in case <limits.h> declares cl=
ass.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define class innocuous_class
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char class (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef class
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char class ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_class || defined __stub___class
| choke me
| #endif
|=20
| int
| main ()
| {
| return class ();
|   ;
|   return 0;
| }
configure:17465: result: no
configure:17385: checking for fpclass
configure:17441: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
/tmp/ccWSNZgZ.o: In function `main':
conftest.c:(.text+0x12): undefined reference to `fpclass'
collect2: ld returned 1 exit status
configure:17447: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| #define HAVE_FLOAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_SYS_SOCKET_H 1
| #define HAVE_NETINET_IN_H 1
| #define HAVE_ARPA_INET_H 1
| #define HAVE_NETDB_H 1
| #define HAVE_SYS_TIME_H 1
| #define HAVE_SYS_SELECT_H 1
| #define HAVE_SYS_MMAN_H 1
| #define HAVE_SYS_TIMEB_H 1
| #define HAVE_SIGNAL_H 1
| #define HAVE_ARPA_NAMESER_H 1
| #define HAVE_RESOLV_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STRFTIME 1
| #define HAVE_STRDUP 1
| #define HAVE_STRNDUP 1
| #define HAVE_STRERROR 1
| #define HAVE_FINITE 1
| /* end confdefs.h.  */
| /* Define fpclass to an innocuous variant, in case <limits.h> declares =
fpclass.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define fpclass innocuous_fpclass
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char fpclass (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef fpclass
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char fpclass ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_fpclass || defined __stub___fpclass
| choke me
| #endif
|=20
| int
| main ()
| {
| return fpclass ();
|   ;
|   return 0;
| }
configure:17465: result: no
configure:17482: checking for strftime
configure:17562: result: yes
configure:17482: checking for localtime
configure:17538: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:17544: $? =3D 0
configure:17562: result: yes
configure:17482: checking for gettimeofday
configure:17538: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:17544: $? =3D 0
configure:17562: result: yes
configure:17482: checking for ftime
configure:17538: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:17544: $? =3D 0
configure:17562: result: yes
configure:17578: checking for stat
configure:17634: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:17640: $? =3D 0
configure:17658: result: yes
configure:17578: checking for _stat
configure:17634: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
/tmp/cc8zf0rc.o: In function `main':
conftest.c:(.text+0x12): undefined reference to `_stat'
collect2: ld returned 1 exit status
configure:17640: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| #define HAVE_FLOAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_SYS_SOCKET_H 1
| #define HAVE_NETINET_IN_H 1
| #define HAVE_ARPA_INET_H 1
| #define HAVE_NETDB_H 1
| #define HAVE_SYS_TIME_H 1
| #define HAVE_SYS_SELECT_H 1
| #define HAVE_SYS_MMAN_H 1
| #define HAVE_SYS_TIMEB_H 1
| #define HAVE_SIGNAL_H 1
| #define HAVE_ARPA_NAMESER_H 1
| #define HAVE_RESOLV_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STRFTIME 1
| #define HAVE_STRDUP 1
| #define HAVE_STRNDUP 1
| #define HAVE_STRERROR 1
| #define HAVE_FINITE 1
| #define HAVE_STRFTIME 1
| #define HAVE_LOCALTIME 1
| #define HAVE_GETTIMEOFDAY 1
| #define HAVE_FTIME 1
| #define HAVE_STAT 1
| /* end confdefs.h.  */
| /* Define _stat to an innocuous variant, in case <limits.h> declares _s=
tat.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define _stat innocuous__stat
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char _stat (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef _stat
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char _stat ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub__stat || defined __stub____stat
| choke me
| #endif
|=20
| int
| main ()
| {
| return _stat ();
|   ;
|   return 0;
| }
configure:17658: result: no
configure:17578: checking for signal
configure:17634: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:17640: $? =3D 0
configure:17658: result: yes
configure:17680: checking for printf
configure:17736: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:89: warning: conflicting types for built-in function 'printf'
configure:17742: $? =3D 0
configure:17760: result: yes
configure:17680: checking for sprintf
configure:17736: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:90: warning: conflicting types for built-in function 'sprintf'=

configure:17742: $? =3D 0
configure:17760: result: yes
configure:17680: checking for fprintf
configure:17736: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:91: warning: conflicting types for built-in function 'fprintf'=

configure:17742: $? =3D 0
configure:17760: result: yes
configure:17680: checking for snprintf
configure:17736: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:92: warning: conflicting types for built-in function 'snprintf=
'
configure:17742: $? =3D 0
configure:17760: result: yes
configure:17680: checking for vfprintf
configure:17736: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:93: warning: conflicting types for built-in function 'vfprintf=
'
configure:17742: $? =3D 0
configure:17760: result: yes
configure:17680: checking for vsprintf
configure:17736: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:94: warning: conflicting types for built-in function 'vsprintf=
'
configure:17742: $? =3D 0
configure:17760: result: yes
configure:17680: checking for vsnprintf
configure:17736: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:95: warning: conflicting types for built-in function 'vsnprint=
f'
configure:17742: $? =3D 0
configure:17760: result: yes
configure:17680: checking for sscanf
configure:17736: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:96: warning: conflicting types for built-in function 'sscanf'
configure:17742: $? =3D 0
configure:17760: result: yes
configure:17773: checking for va_copy
configure:17797: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:17803: $? =3D 0
configure:17819: result: yes
configure:17885: checking for library containing gethostent
configure:17926: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:17932: $? =3D 0
configure:17960: result: none required
configure:17968: checking for library containing setsockopt
configure:18009: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:18015: $? =3D 0
configure:18043: result: none required
configure:18051: checking for library containing connect
configure:18092: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:18098: $? =3D 0
configure:18126: result: none required
configure:18135: checking for type of socket length (socklen_t)
configure:18149: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:18152: result: socklen_t *
configure:18222: checking whether to enable IPv6
configure:18264: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:18270: $? =3D 0
configure:18285: result: yes
configure:18296: checking struct sockaddr::ss_family
configure:18325: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstation/build/=
tmp/staging/i686-linux/usr/include conftest.c >&5
configure:18331: $? =3D 0
configure:18346: result: yes
configure:18419: checking for getaddrinfo
configure:18475: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:18481: $? =3D 0
configure:18498: result: yes
configure:18587: checking for isnan
configure:18643: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:101: warning: conflicting types for built-in function 'isnan'
configure:18649: $? =3D 0
configure:18666: result: yes
configure:18747: checking for isinf
configure:18803: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -isystem/home/jader/thinstati=
on/build/tmp/staging/i686-linux/usr/include -L/home/jader/thinstation/bui=
ld/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation=
/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/=
build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:102: warning: conflicting types for built-in function 'isinf'
configure:18809: $? =3D 0
configure:18826: result: yes
configure:18990: checking for python
configure:19008: found /home/jader/thinstation/build/tmp/staging/i686-lin=
ux/usr/bin/python
configure:19020: result: /home/jader/thinstation/build/tmp/staging/i686-l=
inux/usr/bin/python
configure:19171: checking for shl_load
configure:19227: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -pedantic -W -Wformat -Wunuse=
d -Wimplicit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar=
-subscripts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast=
-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-p=
rototypes -Wnested-externs -Winline -Wredundant-decls -isystem/home/jader=
/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thins=
tation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/t=
hinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/th=
instation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:103: warning: function declaration isn't a prototype
conftest.c:113: warning: function declaration isn't a prototype
/tmp/ccG12lLk.o: In function `main':
conftest.c:(.text+0x12): undefined reference to `shl_load'
collect2: ld returned 1 exit status
configure:19233: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| #define HAVE_FLOAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_SYS_SOCKET_H 1
| #define HAVE_NETINET_IN_H 1
| #define HAVE_ARPA_INET_H 1
| #define HAVE_NETDB_H 1
| #define HAVE_SYS_TIME_H 1
| #define HAVE_SYS_SELECT_H 1
| #define HAVE_SYS_MMAN_H 1
| #define HAVE_SYS_TIMEB_H 1
| #define HAVE_SIGNAL_H 1
| #define HAVE_ARPA_NAMESER_H 1
| #define HAVE_RESOLV_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STRFTIME 1
| #define HAVE_STRDUP 1
| #define HAVE_STRNDUP 1
| #define HAVE_STRERROR 1
| #define HAVE_FINITE 1
| #define HAVE_STRFTIME 1
| #define HAVE_LOCALTIME 1
| #define HAVE_GETTIMEOFDAY 1
| #define HAVE_FTIME 1
| #define HAVE_STAT 1
| #define HAVE_SIGNAL 1
| #define HAVE_PRINTF 1
| #define HAVE_SPRINTF 1
| #define HAVE_FPRINTF 1
| #define HAVE_SNPRINTF 1
| #define HAVE_VFPRINTF 1
| #define HAVE_VSPRINTF 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_SSCANF 1
| #define HAVE_VA_COPY 1
| #define XML_SOCKLEN_T socklen_t
| #define SUPPORT_IP6
| #define HAVE_GETADDRINFO
| #define HAVE_ISNAN
| #define HAVE_ISINF
| /* end confdefs.h.  */
| /* Define shl_load to an innocuous variant, in case <limits.h> declares=
 shl_load.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define shl_load innocuous_shl_load
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char shl_load (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef shl_load
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char shl_load ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_shl_load || defined __stub___shl_load
| choke me
| #endif
|=20
| int
| main ()
| {
| return shl_load ();
|   ;
|   return 0;
| }
configure:19250: result: no
configure:19256: checking for shl_load in -ldld
configure:19291: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -pedantic -W -Wformat -Wunuse=
d -Wimplicit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar=
-subscripts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast=
-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-p=
rototypes -Wnested-externs -Winline -Wredundant-decls -isystem/home/jader=
/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thins=
tation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/t=
hinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/th=
instation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c -ldld  =
 >&5
conftest.c:87: warning: function declaration isn't a prototype
conftest.c:90: warning: function declaration isn't a prototype
/usr/bin/ld: cannot find -ldld
collect2: ld returned 1 exit status
configure:19297: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| #define HAVE_FLOAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_SYS_SOCKET_H 1
| #define HAVE_NETINET_IN_H 1
| #define HAVE_ARPA_INET_H 1
| #define HAVE_NETDB_H 1
| #define HAVE_SYS_TIME_H 1
| #define HAVE_SYS_SELECT_H 1
| #define HAVE_SYS_MMAN_H 1
| #define HAVE_SYS_TIMEB_H 1
| #define HAVE_SIGNAL_H 1
| #define HAVE_ARPA_NAMESER_H 1
| #define HAVE_RESOLV_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STRFTIME 1
| #define HAVE_STRDUP 1
| #define HAVE_STRNDUP 1
| #define HAVE_STRERROR 1
| #define HAVE_FINITE 1
| #define HAVE_STRFTIME 1
| #define HAVE_LOCALTIME 1
| #define HAVE_GETTIMEOFDAY 1
| #define HAVE_FTIME 1
| #define HAVE_STAT 1
| #define HAVE_SIGNAL 1
| #define HAVE_PRINTF 1
| #define HAVE_SPRINTF 1
| #define HAVE_FPRINTF 1
| #define HAVE_SNPRINTF 1
| #define HAVE_VFPRINTF 1
| #define HAVE_VSPRINTF 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_SSCANF 1
| #define HAVE_VA_COPY 1
| #define XML_SOCKLEN_T socklen_t
| #define SUPPORT_IP6
| #define HAVE_GETADDRINFO
| #define HAVE_ISNAN
| #define HAVE_ISINF
| /* end confdefs.h.  */
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char shl_load ();
| int
| main ()
| {
| return shl_load ();
|   ;
|   return 0;
| }
configure:19315: result: no
configure:19323: checking for dlopen
configure:19379: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -pedantic -W -Wformat -Wunuse=
d -Wimplicit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar=
-subscripts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast=
-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-p=
rototypes -Wnested-externs -Winline -Wredundant-decls -isystem/home/jader=
/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thins=
tation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/t=
hinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/th=
instation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:103: warning: function declaration isn't a prototype
conftest.c:113: warning: function declaration isn't a prototype
/tmp/cc2SZ2tN.o: In function `main':
conftest.c:(.text+0x12): undefined reference to `dlopen'
collect2: ld returned 1 exit status
configure:19385: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libxml2"
| #define VERSION "2.7.2"
| #define PROTOTYPES 1
| #define __PROTOTYPES 1
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_STRING_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| #define HAVE_DIRENT_H 1
| #define STDC_HEADERS 1
| #define HAVE_FCNTL_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_CTYPE_H 1
| #define HAVE_DIRENT_H 1
| #define HAVE_ERRNO_H 1
| #define HAVE_MALLOC_H 1
| #define HAVE_STDARG_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_TIME_H 1
| #define HAVE_ANSIDECL_H 1
| #define HAVE_MATH_H 1
| #define HAVE_LIMITS_H 1
| #define HAVE_FLOAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_SYS_SOCKET_H 1
| #define HAVE_NETINET_IN_H 1
| #define HAVE_ARPA_INET_H 1
| #define HAVE_NETDB_H 1
| #define HAVE_SYS_TIME_H 1
| #define HAVE_SYS_SELECT_H 1
| #define HAVE_SYS_MMAN_H 1
| #define HAVE_SYS_TIMEB_H 1
| #define HAVE_SIGNAL_H 1
| #define HAVE_ARPA_NAMESER_H 1
| #define HAVE_RESOLV_H 1
| #define HAVE_DLFCN_H 1
| #define HAVE_STRFTIME 1
| #define HAVE_STRDUP 1
| #define HAVE_STRNDUP 1
| #define HAVE_STRERROR 1
| #define HAVE_FINITE 1
| #define HAVE_STRFTIME 1
| #define HAVE_LOCALTIME 1
| #define HAVE_GETTIMEOFDAY 1
| #define HAVE_FTIME 1
| #define HAVE_STAT 1
| #define HAVE_SIGNAL 1
| #define HAVE_PRINTF 1
| #define HAVE_SPRINTF 1
| #define HAVE_FPRINTF 1
| #define HAVE_SNPRINTF 1
| #define HAVE_VFPRINTF 1
| #define HAVE_VSPRINTF 1
| #define HAVE_VSNPRINTF 1
| #define HAVE_SSCANF 1
| #define HAVE_VA_COPY 1
| #define XML_SOCKLEN_T socklen_t
| #define SUPPORT_IP6
| #define HAVE_GETADDRINFO
| #define HAVE_ISNAN
| #define HAVE_ISINF
| /* end confdefs.h.  */
| /* Define dlopen to an innocuous variant, in case <limits.h> declares d=
lopen.
|    For example, HP-UX 11i <limits.h> declares gettimeofday.  */
| #define dlopen innocuous_dlopen
|=20
| /* System header to define __stub macros and hopefully few prototypes,
|     which can conflict with char dlopen (); below.
|     Prefer <limits.h> to <assert.h> if __STDC__ is defined, since
|     <limits.h> exists even on freestanding compilers.  */
|=20
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|=20
| #undef dlopen
|=20
| /* Override any GCC internal prototype to avoid an error.
|    Use char because int might match the return type of a GCC
|    builtin and then its argument prototype would still apply.  */
| #ifdef __cplusplus
| extern "C"
| #endif
| char dlopen ();
| /* The GNU C library defines this for functions which it implements
|     to always fail with ENOSYS.  Some functions are actually named
|     something starting with __ and the normal name is an alias.  */
| #if defined __stub_dlopen || defined __stub___dlopen
| choke me
| #endif
|=20
| int
| main ()
| {
| return dlopen ();
|   ;
|   return 0;
| }
configure:19402: result: no
configure:19408: checking for dlopen in -ldl
configure:19443: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -pedantic -W -Wformat -Wunuse=
d -Wimplicit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar=
-subscripts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast=
-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-p=
rototypes -Wnested-externs -Winline -Wredundant-decls -isystem/home/jader=
/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thins=
tation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/t=
hinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/th=
instation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c -ldl   =
>&5
conftest.c:87: warning: function declaration isn't a prototype
conftest.c:90: warning: function declaration isn't a prototype
configure:19449: $? =3D 0
configure:19467: result: yes
configure:19588: checking pthread.h usability
configure:19605: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -pedantic -W -Wformat -Wunused -Wimpli=
cit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar-subscrip=
ts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast-align -W=
write-strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes=
 -Wnested-externs -Winline -Wredundant-decls -isystem/home/jader/thinstat=
ion/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:19611: $? =3D 0
configure:19625: result: yes
configure:19629: checking pthread.h presence
configure:19644: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
configure:19650: $? =3D 0
configure:19664: result: yes
configure:19692: checking for pthread.h
configure:19699: result: yes
configure:19704: checking for pthread_join in -lpthread
configure:19739: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -pedantic -W -Wformat -Wunuse=
d -Wimplicit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar=
-subscripts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast=
-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-p=
rototypes -Wnested-externs -Winline -Wredundant-decls -isystem/home/jader=
/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thins=
tation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/t=
hinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/th=
instation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c -lpthre=
ad   >&5
conftest.c:88: warning: function declaration isn't a prototype
conftest.c:91: warning: function declaration isn't a prototype
configure:19745: $? =3D 0
configure:19763: result: yes
configure:20576: checking iconv.h usability
configure:20593: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -pedantic -W -Wformat -Wunused -Wimpli=
cit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar-subscrip=
ts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast-align -W=
write-strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes=
 -Wnested-externs -Winline -Wredundant-decls -isystem/home/jader/thinstat=
ion/build/tmp/staging/i686-linux/usr/include conftest.c >&5
configure:20599: $? =3D 0
configure:20613: result: yes
configure:20617: checking iconv.h presence
configure:20632: gcc -E -isystem/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/include conftest.c
configure:20638: $? =3D 0
configure:20652: result: yes
configure:20680: checking for iconv.h
configure:20687: result: yes
configure:20692: checking for iconv
configure:20718: ccache gcc -o conftest -isystem/home/jader/thinstation/b=
uild/tmp/staging/i686-linux/usr/include -O2 -pedantic -W -Wformat -Wunuse=
d -Wimplicit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar=
-subscripts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast=
-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes -Wmissing-p=
rototypes -Wnested-externs -Winline -Wredundant-decls -isystem/home/jader=
/thinstation/build/tmp/staging/i686-linux/usr/include -L/home/jader/thins=
tation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/home/jader/t=
hinstation/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/home/jader/th=
instation/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c:87: warning: function declaration isn't a prototype
configure:20724: $? =3D 0
configure:20731: result: yes
configure:20814: checking for iconv declaration
configure:20852: ccache gcc -c -isystem/home/jader/thinstation/build/tmp/=
staging/i686-linux/usr/include -O2 -pedantic -W -Wformat -Wunused -Wimpli=
cit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar-subscrip=
ts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast-align -W=
write-strings -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes=
 -Wnested-externs -Winline -Wredundant-decls -isystem/home/jader/thinstat=
ion/build/tmp/staging/i686-linux/usr/include conftest.c >&5
conftest.c:90: warning: redundant redeclaration of 'iconv'
/usr/include/iconv.h:46: warning: previous declaration of 'iconv' was her=
e
conftest.c:97: warning: function declaration isn't a prototype
configure:20858: $? =3D 0
configure:20877: result:=20
	extern size_t iconv (iconv_t cd,  char * *inbuf, size_t *inbytesleft, ch=
ar * *outbuf, size_t *outbytesleft);
configure:21190: creating ./config.status

## ---------------------- ##
## Running config.status. ##
## ---------------------- ##

This file was extended by config.status, which was
generated by GNU Autoconf 2.61.  Invocation command line was

  CONFIG_FILES    =3D=20
  CONFIG_HEADERS  =3D=20
  CONFIG_LINKS    =3D=20
  CONFIG_COMMANDS =3D=20
  $ ./config.status=20

on developer

config.status:981: creating libxml2.spec
config.status:981: creating Makefile
config.status:981: creating include/Makefile
config.status:981: creating include/libxml/Makefile
config.status:981: creating doc/Makefile
config.status:981: creating doc/examples/Makefile
config.status:981: creating doc/devhelp/Makefile
config.status:981: creating example/Makefile
config.status:981: creating python/Makefile
config.status:981: creating python/tests/Makefile
config.status:981: creating xstc/Makefile
config.status:981: creating include/libxml/xmlversion.h
config.status:981: creating xml2-config
config.status:981: creating libxml-2.0.pc
config.status:981: creating libxml-2.0-uninstalled.pc
config.status:981: creating python/setup.py
config.status:981: creating config.h
config.status:1326: executing depfiles commands
config.status:1326: executing libtool commands

## ---------------- ##
## Cache variables. ##
## ---------------- ##

ac_cv_build=3Di686-pc-linux-gnu
ac_cv_c_compiler_gnu=3Dyes
ac_cv_env_CC_set=3Dset
ac_cv_env_CC_value=3D'ccache gcc'
ac_cv_env_CFLAGS_set=3Dset
ac_cv_env_CFLAGS_value=3D'-isystem/home/jader/thinstation/build/tmp/stagi=
ng/i686-linux/usr/include -O2'
ac_cv_env_CPPFLAGS_set=3Dset
ac_cv_env_CPPFLAGS_value=3D-isystem/home/jader/thinstation/build/tmp/stag=
ing/i686-linux/usr/include
ac_cv_env_CPP_set=3Dset
ac_cv_env_CPP_value=3D'gcc -E'
ac_cv_env_LDFLAGS_set=3Dset
ac_cv_env_LDFLAGS_value=3D'-L/home/jader/thinstation/build/tmp/staging/i6=
86-linux/usr/lib -Wl,-rpath-link,/home/jader/thinstation/build/tmp/stagin=
g/i686-linux/usr/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging=
/i686-linux/usr/lib -Wl,-O1'
ac_cv_env_LIBS_set=3D
ac_cv_env_LIBS_value=3D
ac_cv_env_build_alias_set=3Dset
ac_cv_env_build_alias_value=3Di686-linux
ac_cv_env_host_alias_set=3Dset
ac_cv_env_host_alias_value=3Di686-linux
ac_cv_env_target_alias_set=3Dset
ac_cv_env_target_alias_value=3Di686-linux
ac_cv_func__stat=3Dno
ac_cv_func_class=3Dno
ac_cv_func_dlopen=3Dno
ac_cv_func_finite=3Dyes
ac_cv_func_fp_class=3Dno
ac_cv_func_fpclass=3Dno
ac_cv_func_fprintf=3Dyes
ac_cv_func_ftime=3Dyes
ac_cv_func_getaddrinfo=3Dyes
ac_cv_func_gettimeofday=3Dyes
ac_cv_func_isinf=3Dyes
ac_cv_func_isnan=3Dyes
ac_cv_func_isnand=3Dno
ac_cv_func_localtime=3Dyes
ac_cv_func_printf=3Dyes
ac_cv_func_shl_load=3Dno
ac_cv_func_signal=3Dyes
ac_cv_func_snprintf=3Dyes
ac_cv_func_sprintf=3Dyes
ac_cv_func_sscanf=3Dyes
ac_cv_func_stat=3Dyes
ac_cv_func_strdup=3Dyes
ac_cv_func_strerror=3Dyes
ac_cv_func_strftime=3Dyes
ac_cv_func_strndup=3Dyes
ac_cv_func_vfprintf=3Dyes
ac_cv_func_vsnprintf=3Dyes
ac_cv_func_vsprintf=3Dyes
ac_cv_header_ansidecl_h=3Dyes
ac_cv_header_arpa_inet_h=3Dyes
ac_cv_header_arpa_nameser_h=3Dyes
ac_cv_header_ctype_h=3Dyes
ac_cv_header_dirent_dirent_h=3Dyes
ac_cv_header_dirent_h=3Dyes
ac_cv_header_dl_h=3Dno
ac_cv_header_dlfcn_h=3Dyes
ac_cv_header_errno_h=3Dyes
ac_cv_header_fcntl_h=3Dyes
ac_cv_header_float_h=3Dyes
ac_cv_header_fp_class_h=3Dno
ac_cv_header_iconv_h=3Dyes
ac_cv_header_ieeefp_h=3Dno
ac_cv_header_inttypes_h=3Dyes
ac_cv_header_inttypes_h_h=3Dno
ac_cv_header_limits_h=3Dyes
ac_cv_header_malloc_h=3Dyes
ac_cv_header_math_h=3Dyes
ac_cv_header_memory_h=3Dyes
ac_cv_header_nan_h=3Dno
ac_cv_header_netdb_h=3Dyes
ac_cv_header_netinet_in_h=3Dyes
ac_cv_header_pthread_h=3Dyes
ac_cv_header_resolv_h=3Dyes
ac_cv_header_signal_h=3Dyes
ac_cv_header_stdarg_h=3Dyes
ac_cv_header_stdc=3Dyes
ac_cv_header_stdint_h=3Dyes
ac_cv_header_stdlib_h=3Dyes
ac_cv_header_string_h=3Dyes
ac_cv_header_strings_h=3Dyes
ac_cv_header_sys_mman_h=3Dyes
ac_cv_header_sys_select_h=3Dyes
ac_cv_header_sys_socket_h=3Dyes
ac_cv_header_sys_stat_h=3Dyes
ac_cv_header_sys_time_h=3Dyes
ac_cv_header_sys_timeb_h=3Dyes
ac_cv_header_sys_types_h=3Dyes
ac_cv_header_time_h=3Dyes
ac_cv_header_unistd_h=3Dyes
ac_cv_header_zlib_h=3Dno
ac_cv_host=3Di686-pc-linux-gnu
ac_cv_lib_dl_dlopen=3Dyes
ac_cv_lib_dld_shl_load=3Dno
ac_cv_lib_pthread_pthread_join=3Dyes
ac_cv_objext=3Do
ac_cv_path_EGREP=3D'/bin/grep -E'
ac_cv_path_FGREP=3D'/bin/grep -F'
ac_cv_path_GREP=3D/bin/grep
ac_cv_path_MV=3D/bin/mv
ac_cv_path_PERL=3D/home/jader/thinstation/build/tmp/staging/i686-linux/us=
r/bin/perl
ac_cv_path_PYTHON=3D/home/jader/thinstation/build/tmp/staging/i686-linux/=
usr/bin/python
ac_cv_path_RM=3D/bin/rm
ac_cv_path_SED=3D/bin/sed
ac_cv_path_TAR=3D/bin/tar
ac_cv_path_WGET=3D/usr/bin/wget
ac_cv_path_XMLLINT=3D/usr/bin/xmllint
ac_cv_path_XSLTPROC=3D/home/jader/thinstation/build/tmp/staging/i686-linu=
x/usr/bin/xsltproc
ac_cv_path_install=3D'/home/jader/thinstation/build/tmp/staging/i686-linu=
x/usr/bin/install -c'
ac_cv_path_mkdir=3D/bin/mkdir
ac_cv_prog_AR=3Dar
ac_cv_prog_AWK=3Dgawk
ac_cv_prog_CC=3D'ccache gcc'
ac_cv_prog_CPP=3D'gcc -E'
ac_cv_prog_RANLIB=3Dranlib
ac_cv_prog_STRIP=3Dstrip
ac_cv_prog_cc_c89=3D
ac_cv_prog_cc_g=3Dyes
ac_cv_prog_make_make_set=3Dyes
ac_cv_search_connect=3D'none required'
ac_cv_search_gethostent=3D'none required'
ac_cv_search_opendir=3D'none required'
ac_cv_search_setsockopt=3D'none required'
am_cv_CC_dependencies_compiler_type=3Dgcc3
lt_cv_deplibs_check_method=3Dpass_all
lt_cv_file_magic_cmd=3D'$MAGIC_CMD'
lt_cv_file_magic_test_file=3D
lt_cv_ld_reload_flag=3D-r
lt_cv_nm_interface=3D'BSD nm'
lt_cv_objdir=3D.libs
lt_cv_path_LD=3Dld
lt_cv_path_NM=3D'/usr/bin/nm -B'
lt_cv_prog_compiler_c_o=3Dyes
lt_cv_prog_compiler_pic_works=3Dyes
lt_cv_prog_compiler_rtti_exceptions=3Dno
lt_cv_prog_compiler_static_works=3Dyes
lt_cv_prog_gnu_ld=3Dyes
lt_cv_sys_global_symbol_pipe=3D'sed -n -e '\''s/^.*[	 ]\([ABCDGIRSTW][ABC=
DGIRSTW]*\)[	 ][	 ]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2 \2/p'\'''
lt_cv_sys_global_symbol_to_c_name_address=3D'sed -n -e '\''s/^: \([^ ]*\)=
 $/  {\"\1\", (void *) 0},/p'\'' -e '\''s/^[ABCDGIRSTW]* \([^ ]*\) \([^ ]=
*\)$/  {"\2", (void *) \&\2},/p'\'''
lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'sed -n -e '\''s/^=
: \([^ ]*\) $/  {\"\1\", (void *) 0},/p'\'' -e '\''s/^[ABCDGIRSTW]* \([^ =
]*\) \(lib[^ ]*\)$/  {"\2", (void *) \&\2},/p'\'' -e '\''s/^[ABCDGIRSTW]*=
 \([^ ]*\) \([^ ]*\)$/  {"lib\2", (void *) \&\2},/p'\'''
lt_cv_sys_global_symbol_to_cdecl=3D'sed -n -e '\''s/^T .* \(.*\)$/extern =
int \1();/p'\'' -e '\''s/^[ABCDGIRSTW]* .* \(.*\)$/extern char \1;/p'\'''=

lt_cv_sys_max_cmd_len=3D98304
xml_cv_iconv_arg2=3D
xml_cv_iconv_decl=3D'extern size_t iconv (iconv_t cd,  char * *inbuf, siz=
e_t *inbytesleft, char * *outbuf, size_t *outbytesleft);'

## ----------------- ##
## Output variables. ##
## ----------------- ##

ACLOCAL=3D'${SHELL} /home/jader/thinstation/build/tmp/work/i686-linux/lib=
xml2-native-2.7.2-r3/libxml2-2.7.2/missing --run aclocal-1.10'
AMDEPBACKSLASH=3D'\'
AMDEP_FALSE=3D'#'
AMDEP_TRUE=3D''
AMTAR=3D'${SHELL} /home/jader/thinstation/build/tmp/work/i686-linux/libxm=
l2-native-2.7.2-r3/libxml2-2.7.2/missing --run tar'
ANSI2KNR=3D''
AR=3D'ar'
AS=3D'as'
AUTOCONF=3D'${SHELL} /home/jader/thinstation/build/tmp/work/i686-linux/li=
bxml2-native-2.7.2-r3/libxml2-2.7.2/missing --run autoconf'
AUTOHEADER=3D'${SHELL} /home/jader/thinstation/build/tmp/work/i686-linux/=
libxml2-native-2.7.2-r3/libxml2-2.7.2/missing --run autoheader'
AUTOMAKE=3D'${SHELL} /home/jader/thinstation/build/tmp/work/i686-linux/li=
bxml2-native-2.7.2-r3/libxml2-2.7.2/missing --run automake-1.10'
AWK=3D'gawk'
BASE_THREAD_LIBS=3D'-lpthread'
C14N_OBJ=3D'c14n.c'
CATALOG_OBJ=3D'catalog.o'
CC=3D'ccache gcc'
CCDEPMODE=3D'depmode=3Dgcc3'
CFLAGS=3D'-isystem/home/jader/thinstation/build/tmp/staging/i686-linux/us=
r/include -O2 -pedantic -W -Wformat -Wunused -Wimplicit -Wreturn-type -Ws=
witch -Wcomment -Wtrigraphs -Wformat -Wchar-subscripts -Wuninitialized -W=
parentheses -Wshadow -Wpointer-arith -Wcast-align -Wwrite-strings -Waggre=
gate-return -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Wi=
nline -Wredundant-decls'
CPP=3D'gcc -E'
CPPFLAGS=3D'-isystem/home/jader/thinstation/build/tmp/staging/i686-linux/=
usr/include'
CYGPATH_W=3D'echo'
CYGWIN_EXTRA_LDFLAGS=3D''
CYGWIN_EXTRA_PYTHON_LIBADD=3D''
DEBUG_OBJ=3D''
DEFS=3D'-DHAVE_CONFIG_H'
DEPDIR=3D'.deps'
DLLTOOL=3D'dlltool'
DOCB_OBJ=3D''
DSYMUTIL=3D''
DUMPBIN=3D''
ECHO_C=3D''
ECHO_N=3D'-n'
ECHO_T=3D''
EGREP=3D'/bin/grep -E'
EXEEXT=3D''
FGREP=3D'/bin/grep -F'
FTP_OBJ=3D'nanoftp.o'
GREP=3D'/bin/grep'
HAVE_ISINF=3D''
HAVE_ISNAN=3D''
HTML_DIR=3D'$(datadir)/doc/$(PACKAGE)-$(VERSION)/html'
HTML_OBJ=3D'HTMLparser.o HTMLtree.o'
HTTP_OBJ=3D'nanohttp.o'
ICONV_LIBS=3D''
INSTALL_DATA=3D'${INSTALL} -m 644'
INSTALL_PROGRAM=3D'${INSTALL}'
INSTALL_SCRIPT=3D'${INSTALL}'
INSTALL_STRIP_PROGRAM=3D'$(install_sh) -c -s'
LD=3D'ld'
LDFLAGS=3D'-L/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib=
 -Wl,-rpath-link,/home/jader/thinstation/build/tmp/staging/i686-linux/usr=
/lib -Wl,-rpath,/home/jader/thinstation/build/tmp/staging/i686-linux/usr/=
lib -Wl,-O1'
LIBOBJS=3D''
LIBS=3D''
LIBTOOL=3D'$(SHELL) $(top_builddir)/i686-linux-libtool'
LIBXML_MAJOR_VERSION=3D'2'
LIBXML_MICRO_VERSION=3D'2'
LIBXML_MINOR_VERSION=3D'7'
LIBXML_VERSION=3D'2.7.2'
LIBXML_VERSION_EXTRA=3D''
LIBXML_VERSION_INFO=3D'9:2:7'
LIBXML_VERSION_NUMBER=3D'20702'
LIPO=3D''
LN_S=3D'ln -s'
LTLIBOBJS=3D''
MAKEINFO=3D'${SHELL} /home/jader/thinstation/build/tmp/work/i686-linux/li=
bxml2-native-2.7.2-r3/libxml2-2.7.2/missing --run makeinfo'
MODULE_EXTENSION=3D'.so'
MODULE_PLATFORM_LIBS=3D'-ldl'
MV=3D'/bin/mv'
M_LIBS=3D'-lm'
NM=3D'/usr/bin/nm -B'
NMEDIT=3D''
OBJDUMP=3D'objdump'
OBJEXT=3D'o'
OTOOL64=3D''
OTOOL=3D''
PACKAGE=3D'libxml2'
PACKAGE_BUGREPORT=3D''
PACKAGE_NAME=3D''
PACKAGE_STRING=3D''
PACKAGE_TARNAME=3D''
PACKAGE_VERSION=3D''
PATH_SEPARATOR=3D':'
PERL=3D'/home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin/perl=
'
PYTHON=3D'/home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin/py=
thon'
PYTHON_INCLUDES=3D'/home/jader/thinstation/build/tmp/staging/i686-linux/u=
sr/include/python2.6'
PYTHON_SITE_PACKAGES=3D'/home/jader/thinstation/build/tmp/staging/i686-li=
nux/usr/lib/python2.6/site-packages'
PYTHON_SUBDIR=3D'python'
PYTHON_TESTS=3D' RelaxNGPythonTests SchemasPythonTests'
PYTHON_VERSION=3D'2.6'
RANLIB=3D'ranlib'
RDL_LIBS=3D''
READER_TEST=3D'Readertests'
RELDATE=3D'Tue Apr  7 2009'
RM=3D'/bin/rm'
SED=3D'/bin/sed'
SET_MAKE=3D''
SHELL=3D'/bin/sh'
STATIC_BINARIES=3D''
STRIP=3D'strip'
TAR=3D'/bin/tar'
TEST_C14N=3D'C14Ntests'
TEST_CATALOG=3D'Catatests'
TEST_DEBUG=3D''
TEST_HTML=3D'HTMLtests'
TEST_MODULES=3D'ModuleTests'
TEST_PATTERN=3D'Patterntests'
TEST_PHTML=3D'HTMLPushtests'
TEST_PUSH=3D'XMLPushtests'
TEST_REGEXPS=3D'Regexptests Automatatests'
TEST_SAX=3D'SAXtests'
TEST_SCHEMAS=3D'Schemastests Relaxtests'
TEST_SCHEMATRON=3D'Schematrontests'
TEST_THREADS=3D'Threadtests'
TEST_VALID=3D'Validtests'
TEST_VTIME=3D'VTimingtests'
TEST_XINCLUDE=3D'XIncludetests'
TEST_XPATH=3D'XPathtests'
TEST_XPTR=3D'XPtrtests'
THREADS_W32=3D''
THREAD_CFLAGS=3D' -D_REENTRANT'
THREAD_LIBS=3D''
U=3D''
VERSION=3D'2.7.2'
WGET=3D'/usr/bin/wget'
WIN32_EXTRA_LDFLAGS=3D''
WIN32_EXTRA_LIBADD=3D''
WITH_C14N=3D'1'
WITH_CATALOG=3D'1'
WITH_DEBUG=3D'0'
WITH_DOCB=3D'0'
WITH_FTP=3D'1'
WITH_HTML=3D'1'
WITH_HTTP=3D'1'
WITH_ICONV=3D'1'
WITH_ISO8859X=3D'1'
WITH_LEGACY=3D'0'
WITH_MEM_DEBUG=3D'0'
WITH_MODULES=3D'1'
WITH_OUTPUT=3D'1'
WITH_PATTERN=3D'1'
WITH_PUSH=3D'1'
WITH_PYTHON_FALSE=3D'#'
WITH_PYTHON_TRUE=3D''
WITH_READER=3D'1'
WITH_REGEXPS=3D'1'
WITH_RUN_DEBUG=3D'0'
WITH_SAX1=3D'1'
WITH_SCHEMAS=3D'1'
WITH_SCHEMATRON=3D'1'
WITH_THREADS=3D'1'
WITH_TREE=3D'1'
WITH_TRIO=3D'0'
WITH_TRIO_SOURCES_FALSE=3D''
WITH_TRIO_SOURCES_TRUE=3D'#'
WITH_VALID=3D'1'
WITH_WRITER=3D'1'
WITH_XINCLUDE=3D'1'
WITH_XPATH=3D'1'
WITH_XPTR=3D'1'
WITH_ZLIB=3D'0'
XINCLUDE_OBJ=3D'xinclude.o'
XMLLINT=3D'/usr/bin/xmllint'
XML_CFLAGS=3D''
XML_INCLUDEDIR=3D'-I${includedir}/libxml2'
XML_LIBDIR=3D'-L${libdir}'
XML_LIBS=3D'-lxml2    -lm '
XML_LIBTOOLLIBS=3D'libxml2.la'
XPATH_OBJ=3D'xpath.o'
XPTR_OBJ=3D'xpointer.o'
XSLTPROC=3D'/home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin/=
xsltproc'
Z_CFLAGS=3D''
Z_LIBS=3D''
ac_ct_CC=3D''
ac_ct_DUMPBIN=3D''
am__fastdepCC_FALSE=3D'#'
am__fastdepCC_TRUE=3D''
am__include=3D'include'
am__isrc=3D''
am__leading_dot=3D'.'
am__quote=3D''
am__tar=3D'${AMTAR} chof - "$$tardir"'
am__untar=3D'${AMTAR} xf -'
bindir=3D'/home/jader/thinstation/build/tmp/staging/i686-linux/usr/bin'
build=3D'i686-pc-linux-gnu'
build_alias=3D'i686-linux'
build_cpu=3D'i686'
build_os=3D'linux-gnu'
build_vendor=3D'pc'
datadir=3D'/home/jader/thinstation/build/tmp/staging/i686-linux/usr/share=
'
datarootdir=3D'${prefix}/share'
docdir=3D'${datarootdir}/doc/${PACKAGE}'
dvidir=3D'${docdir}'
exec_prefix=3D'/home/jader/thinstation/build/tmp/staging/i686-linux/usr'
host=3D'i686-pc-linux-gnu'
host_alias=3D'i686-linux'
host_cpu=3D'i686'
host_os=3D'linux-gnu'
host_vendor=3D'pc'
htmldir=3D'${docdir}'
includedir=3D'/home/jader/thinstation/build/tmp/staging/i686-linux/usr/in=
clude'
infodir=3D'/home/jader/thinstation/build/tmp/staging/i686-linux/usr/share=
/info'
install_sh=3D'$(SHELL) /home/jader/thinstation/build/tmp/work/i686-linux/=
libxml2-native-2.7.2-r3/libxml2-2.7.2/install-sh'
libdir=3D'/home/jader/thinstation/build/tmp/staging/i686-linux/usr/lib'
libexecdir=3D'/home/jader/thinstation/build/tmp/staging/i686-linux/usr/li=
bexec'
localedir=3D'${datarootdir}/locale'
localstatedir=3D'/home/jader/thinstation/build/tmp/staging/i686-linux/var=
'
lt_ECHO=3D'echo'
mandir=3D'/home/jader/thinstation/build/tmp/staging/i686-linux/usr/share/=
man'
mkdir_p=3D'/bin/mkdir -p'
oldincludedir=3D'/home/jader/thinstation/build/tmp/staging/i686-linux/usr=
/include'
pdfdir=3D'${docdir}'
prefix=3D'/home/jader/thinstation/build/tmp/staging/i686-linux/usr'
program_transform_name=3D's,x,x,'
psdir=3D'${docdir}'
pythondir=3D'$(PYTHON_SITE_PACKAGES)'
sbindir=3D'/home/jader/thinstation/build/tmp/staging/i686-linux/usr/sbin'=

sharedstatedir=3D'/home/jader/thinstation/build/tmp/staging/i686-linux/us=
r/com'
sysconfdir=3D'/home/jader/thinstation/build/tmp/staging/i686-linux/etc'
target_alias=3D'i686-linux'

## ----------- ##
## confdefs.h. ##
## ----------- ##

#define PACKAGE_NAME ""
#define PACKAGE_TARNAME ""
#define PACKAGE_VERSION ""
#define PACKAGE_STRING ""
#define PACKAGE_BUGREPORT ""
#define PACKAGE "libxml2"
#define VERSION "2.7.2"
#define PROTOTYPES 1
#define __PROTOTYPES 1
#define STDC_HEADERS 1
#define HAVE_SYS_TYPES_H 1
#define HAVE_SYS_STAT_H 1
#define HAVE_STDLIB_H 1
#define HAVE_STRING_H 1
#define HAVE_MEMORY_H 1
#define HAVE_STRINGS_H 1
#define HAVE_INTTYPES_H 1
#define HAVE_STDINT_H 1
#define HAVE_UNISTD_H 1
#define HAVE_STRING_H 1
#define HAVE_DLFCN_H 1
#define LT_OBJDIR ".libs/"
#define HAVE_DIRENT_H 1
#define STDC_HEADERS 1
#define HAVE_FCNTL_H 1
#define HAVE_UNISTD_H 1
#define HAVE_CTYPE_H 1
#define HAVE_DIRENT_H 1
#define HAVE_ERRNO_H 1
#define HAVE_MALLOC_H 1
#define HAVE_STDARG_H 1
#define HAVE_SYS_STAT_H 1
#define HAVE_SYS_TYPES_H 1
#define HAVE_STDINT_H 1
#define HAVE_TIME_H 1
#define HAVE_ANSIDECL_H 1
#define HAVE_MATH_H 1
#define HAVE_LIMITS_H 1
#define HAVE_FLOAT_H 1
#define HAVE_STDLIB_H 1
#define HAVE_SYS_SOCKET_H 1
#define HAVE_NETINET_IN_H 1
#define HAVE_ARPA_INET_H 1
#define HAVE_NETDB_H 1
#define HAVE_SYS_TIME_H 1
#define HAVE_SYS_SELECT_H 1
#define HAVE_SYS_MMAN_H 1
#define HAVE_SYS_TIMEB_H 1
#define HAVE_SIGNAL_H 1
#define HAVE_ARPA_NAMESER_H 1
#define HAVE_RESOLV_H 1
#define HAVE_DLFCN_H 1
#define HAVE_STRFTIME 1
#define HAVE_STRDUP 1
#define HAVE_STRNDUP 1
#define HAVE_STRERROR 1
#define HAVE_FINITE 1
#define HAVE_STRFTIME 1
#define HAVE_LOCALTIME 1
#define HAVE_GETTIMEOFDAY 1
#define HAVE_FTIME 1
#define HAVE_STAT 1
#define HAVE_SIGNAL 1
#define HAVE_PRINTF 1
#define HAVE_SPRINTF 1
#define HAVE_FPRINTF 1
#define HAVE_SNPRINTF 1
#define HAVE_VFPRINTF 1
#define HAVE_VSPRINTF 1
#define HAVE_VSNPRINTF 1
#define HAVE_SSCANF 1
#define HAVE_VA_COPY 1
#define XML_SOCKLEN_T socklen_t
#define SUPPORT_IP6
#define HAVE_GETADDRINFO
#define HAVE_ISNAN
#define HAVE_ISINF
#define HAVE_DLOPEN
#define HAVE_LIBPTHREAD
#define HAVE_PTHREAD_H
#define ICONV_CONST=20

configure: exit 0

--------------030408070405010303090901--
