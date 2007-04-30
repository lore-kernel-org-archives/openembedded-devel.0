Received: from [64.233.162.229] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <xjqian@gmail.com>) id 1HiQ2B-0006Ci-G9
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2007 09:10:59 +0200
Received: by nz-out-0506.google.com with SMTP id m22so1670698nzf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Apr 2007 00:01:44 -0700 (PDT)
Received: by 10.65.248.19 with SMTP id a19mr11205262qbs.1177916503657;
	Mon, 30 Apr 2007 00:01:43 -0700 (PDT)
Received: from ?192.168.10.106? ( [71.85.151.212])
	by mx.google.com with ESMTP id 23sm7123799nzn.2007.04.30.00.01.38;
	Mon, 30 Apr 2007 00:01:39 -0700 (PDT)
Message-ID: <46359408.9060800@gmail.com>
Date: Mon, 30 Apr 2007 02:00:24 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Icedove 1.5.0.10 (X11/20070329)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
References: <20070427105722.GA4340@twibble.org>
In-Reply-To: <20070427105722.GA4340@twibble.org>
Subject: Re: perl 5.8.8 is ready
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Apr 2007 07:11:01 -0000
Content-Type: multipart/mixed; boundary="------------040003030207010607060003"

--------------040003030207010607060003
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Jamie Lenehan wrote:
> Hi,
>
> I think I've got perl 5.8.8 to the stage where it is ready for use.
> As this is a pretty big and complex system and I've made some rather
> large changes to the way the build happens I'd like to get some
> reports from other people that it works for them before removing the
> DEFAULT_PREFERENCE = "-1".
>
> You need to build perl-native 5.8.8 and then perl 5.8.8. (You always
> have to build the matching -native version of perl first.)

perl-native-5.8.8 builds fine but with the following error

ERROR: QA issue: libgettextsrc.la failed sanity test (reference to 
workdir or installed)
ERROR: QA issue: libdb-4.3.la failed sanity test (reference to workdir 
or installed)
ERROR: QA issue: libgettextpo.la failed sanity test (reference to 
workdir or installed)
ERROR: QA issue: libltdl.la failed sanity test (reference to workdir or 
installed)
ERROR: QA issue: libgdbm.la failed sanity test (reference to workdir or 
installed)
ERROR: QA issue: libfakeroot.la failed sanity test (reference to workdir 
or installed)


perl-5.8.8 build failed. Detail in the attached log file.


Gordon


--------------040003030207010607060003
Content-Type: text/x-log;
 name="perl-5.8.8.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="perl-5.8.8.log"

Parsing .bb files, please wait...done.
NOTE: Parsing finished. 4307 cached, 0 parsed, 191 skipped, 0 masked.
NOTE: build 200704300151: started

OE Build Configuration:
BB_VERSION     = "1.8.3"
OE_REVISION    = "9b429ab96d552dc260bce3cf9b5f6a938f04d5b1"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux-gnueabi"
MACHINE        = "tosa"
DISTRO         = "angstrom"
DISTRO_VERSION = "test-20070430"
TARGET_FPU     = "soft"

NOTE: Resolving missing task queue dependencies
NOTE: preferred version 2.5 of glibc not available (for item virtual/arm-angstrom-linux-gnueabi-libc-for-gcc)
NOTE: Preparing Runqueue
NOTE: Executing runqueue
NOTE: Running task 282 of 292 (ID: 0, /home/OE/org.openembedded.dev/packages/perl/perl_5.8.8.bb, do_compile)
NOTE: package perl-5.8.8: started
NOTE: package perl-5.8.8-r7: task do_compile: started
ERROR: function do_compile failed
ERROR: log data follows (/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/temp/log.do_compile.19919)
| NOTE: make -e MAKEFLAGS= perl LD=arm-angstrom-linux-gnueabi-gcc
| Perl cross-build directory is /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/Cross
| Target arch is arm-linux-gnueabi
| toolchain: ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale, ccache arm-angstrom-linux-gnueabi-g++ -march=armv5te -mtune=xscale, arm-angstrom-linux-gnueabi-gcc, arm-angstrom-linux-gnueabi-strip, arm-angstrom-linux-gnueabi-ar, arm-angstrom-linux-gnueabi-ranlib
| Optimizations: -fexpensive-optimizations -fomit-frame-pointer -O2
| /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/Cross/generate_config_sh config.sh-arm-linux-gnueabi > /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/Cross/../config.sh
| cd /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/Cross/.. ; ./Configure -S ; make depend ; make ; make more
| 
| Fetching answers from config.sh...
| 
| Doing variable substitutions on .SH files...
| Extracting cflags (with variable substitutions)
| Extracting config.h (with variable substitutions)
| Extracting makeaperl (with variable substitutions)
| Extracting makedepend (with variable substitutions)
| Extracting makedir (with variable substitutions)
| linux libraries overwritten by cross-compile patches
| Extracting Makefile (with variable substitutions)
| Extracting myconfig (with variable substitutions)
| Extracting pod/Makefile (with variable substitutions)
| Extracting Policy.sh (with variable substitutions)
| Extracting writemain (with variable substitutions)
| Extracting x2p/cflags (with variable substitutions)
| Extracting x2p/Makefile (with variable substitutions)
| Extraction done.
| make[1]: Entering directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8'
| sh ./makedepend MAKE=make
| make[2]: Entering directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8'
| sh writemain lib/auto/DynaLoader/DynaLoader.a  > perlmain.c
| echo  av.c scope.c op.c doop.c doio.c dump.c hv.c mg.c reentr.c perl.c perly.c pp.c pp_hot.c pp_ctl.c pp_sys.c regcomp.c regexec.c utf8.c gv.c sv.c taint.c toke.c util.c deb.c run.c universal.c xsutils.c pad.c globals.c perlio.c perlapi.c numeric.c locale.c pp_pack.c pp_sort.c miniperlmain.c perlmain.c opmini.c | tr ' ' '\n' >.clist
| make[2]: Leaving directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8'
| Finding dependencies for av.o.
| Finding dependencies for scope.o.
| Finding dependencies for op.o.
| Finding dependencies for doop.o.
| Finding dependencies for doio.o.
| Finding dependencies for dump.o.
| Finding dependencies for hv.o.
| Finding dependencies for mg.o.
| Finding dependencies for reentr.o.
| Finding dependencies for perl.o.
| Finding dependencies for perly.o.
| Finding dependencies for pp.o.
| Finding dependencies for pp_hot.o.
| Finding dependencies for pp_ctl.o.
| Finding dependencies for pp_sys.o.
| Finding dependencies for regcomp.o.
| Finding dependencies for regexec.o.
| Finding dependencies for utf8.o.
| Finding dependencies for gv.o.
| Finding dependencies for sv.o.
| Finding dependencies for taint.o.
| Finding dependencies for toke.o.
| Finding dependencies for util.o.
| Finding dependencies for deb.o.
| Finding dependencies for run.o.
| Finding dependencies for universal.o.
| Finding dependencies for xsutils.o.
| Finding dependencies for pad.o.
| Finding dependencies for globals.o.
| Finding dependencies for perlio.o.
| Finding dependencies for perlapi.o.
| Finding dependencies for numeric.o.
| Finding dependencies for locale.o.
| Finding dependencies for pp_pack.o.
| Finding dependencies for pp_sort.o.
| Finding dependencies for miniperlmain.o.
| Finding dependencies for perlmain.o.
| Finding dependencies for opmini.o.
| make[2]: Entering directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8'
| echo Makefile.SH cflags.SH config_h.SH makeaperl.SH makedepend.SH makedir.SH myconfig.SH writemain.SH pod/Makefile.SH | tr ' ' '\n' >.shlist
| make[2]: Leaving directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8'
| Updating makefile...
| test -s perlmain.c && touch perlmain.c
| cd x2p; make depend
| make[2]: Entering directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/x2p'
| sh ../makedepend MAKE=make
| make[3]: Entering directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/x2p'
| echo hash.c  str.c util.c walk.c | tr ' ' '\n' >.clist
| make[3]: Leaving directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/x2p'
| Finding dependencies for hash.o.
| Finding dependencies for str.o.
| Finding dependencies for util.o.
| Finding dependencies for walk.o.
| make[3]: Entering directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/x2p'
| echo Makefile.SH cflags.SH | tr ' ' '\n' >.shlist
| make[3]: Leaving directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/x2p'
| Updating makefile...
| make[2]: Leaving directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/x2p'
| make[1]: Leaving directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8'
| make[1]: Entering directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8'
| `sh  cflags "optimize='-O2'" miniperlmain.o` -fPIC miniperlmain.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| `sh  cflags "optimize='-O2'" perl.o` -fPIC perl.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| perl.c: In function 'perl_destruct':
| perl.c:1188: warning: dereferencing type-punned pointer will break strict-aliasing rules
| perl.c: In function 'Perl_call_sv':
| perl.c:2570: warning: dereferencing type-punned pointer will break strict-aliasing rules
| perl.c:2620: warning: dereferencing type-punned pointer will break strict-aliasing rules
| perl.c: In function 'Perl_eval_sv':
| perl.c:2759: warning: dereferencing type-punned pointer will break strict-aliasing rules
| `sh  cflags "optimize='-O2'" gv.o` -fPIC gv.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| gv.c: In function 'Perl_gv_fetchmeth':
| gv.c:280: warning: dereferencing type-punned pointer will break strict-aliasing rules
| gv.c:292: warning: dereferencing type-punned pointer will break strict-aliasing rules
| gv.c: In function 'Perl_gv_fetchmethod_autoload':
| gv.c:493: warning: dereferencing type-punned pointer will break strict-aliasing rules
| gv.c: In function 'Perl_gv_fetchpv':
| gv.c:739: warning: dereferencing type-punned pointer will break strict-aliasing rules
| gv.c:747: warning: dereferencing type-punned pointer will break strict-aliasing rules
| gv.c:813: warning: dereferencing type-punned pointer will break strict-aliasing rules
| gv.c:862: warning: dereferencing type-punned pointer will break strict-aliasing rules
| gv.c: In function 'Perl_newIO':
| gv.c:1221: warning: dereferencing type-punned pointer will break strict-aliasing rules
| gv.c: In function 'Perl_gv_check':
| gv.c:1232: warning: dereferencing type-punned pointer will break strict-aliasing rules
| gv.c:1236: warning: dereferencing type-punned pointer will break strict-aliasing rules
| `sh  cflags "optimize='-O2'" toke.o` -fPIC toke.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| toke.c: In function 'Perl_yylex':
| toke.c:4069: warning: dereferencing type-punned pointer will break strict-aliasing rules
| toke.c:4415: warning: dereferencing type-punned pointer will break strict-aliasing rules
| toke.c: In function 'S_new_constant':
| toke.c:9011: warning: dereferencing type-punned pointer will break strict-aliasing rules
| toke.c: In function 'S_scan_inputsymbol':
| toke.c:9724: warning: dereferencing type-punned pointer will break strict-aliasing rules
| toke.c: In function 'Perl_start_subparse':
| toke.c:10634: warning: dereferencing type-punned pointer will break strict-aliasing rules
| `sh  cflags "optimize='-O2'" perly.o` -fPIC perly.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| `sh  cflags "optimize='-O2'" op.o` -fPIC op.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| op.c: In function 'Perl_newCONSTSUB':
| op.c:4585: warning: dereferencing type-punned pointer will break strict-aliasing rules
| `sh  cflags "optimize='-O2'" pad.o` -fPIC pad.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| pad.c: In function 'Perl_pad_new':
| pad.c:141: warning: dereferencing type-punned pointer will break strict-aliasing rules
| pad.c: In function 'S_cv_clone2':
| pad.c:1343: warning: dereferencing type-punned pointer will break strict-aliasing rules
| `sh  cflags "optimize='-O2'" regcomp.o` -fPIC regcomp.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| regcomp.c: In function 'S_study_chunk':
| regcomp.c:723: warning: comparison is always false due to limited range of data type
| regcomp.c: In function 'Perl_save_re_context':
| regcomp.c:5046: warning: dereferencing type-punned pointer will break strict-aliasing rules
| regcomp.c:5068: warning: dereferencing type-punned pointer will break strict-aliasing rules
| regcomp.c:5076: warning: dereferencing type-punned pointer will break strict-aliasing rules
| `sh  cflags "optimize='-O2'" dump.o` -fPIC dump.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| dump.c: In function 'Perl_dump_packsubs':
| dump.c:58: warning: dereferencing type-punned pointer will break strict-aliasing rules
| dump.c:62: warning: dereferencing type-punned pointer will break strict-aliasing rules
| dump.c: In function 'Perl_do_sv_dump':
| dump.c:1240: warning: dereferencing type-punned pointer will break strict-aliasing rules
| dump.c:1241: warning: dereferencing type-punned pointer will break strict-aliasing rules
| dump.c:1254: warning: dereferencing type-punned pointer will break strict-aliasing rules
| `sh  cflags "optimize='-O2'" util.o` -fPIC util.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| util.c: In function 'Perl_write_to_stderr':
| util.c:1034: warning: dereferencing type-punned pointer will break strict-aliasing rules
| util.c:1037: warning: dereferencing type-punned pointer will break strict-aliasing rules
| util.c: In function 'Perl_get_ppaddr':
| util.c:3405: warning: type-punning to incomplete type might break strict-aliasing rules
| `sh  cflags "optimize='-O2'" mg.o` -fPIC mg.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| mg.c: In function 'S_magic_methpack':
| mg.c:1501: warning: dereferencing type-punned pointer will break strict-aliasing rules
| mg.c: In function 'Perl_magic_sizepack':
| mg.c:1549: warning: dereferencing type-punned pointer will break strict-aliasing rules
| mg.c: In function 'Perl_magic_nextpack':
| mg.c:1585: warning: dereferencing type-punned pointer will break strict-aliasing rules
| mg.c: In function 'Perl_magic_set':
| mg.c:2237: warning: dereferencing type-punned pointer will break strict-aliasing rules
| `sh  cflags "optimize='-O2'" reentr.o` -fPIC reentr.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| `sh  cflags "optimize='-O2'" hv.o` -fPIC hv.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| hv.c: In function 'S_hv_fetch_common':
| hv.c:579: warning: dereferencing type-punned pointer will break strict-aliasing rules
| hv.c:758: warning: dereferencing type-punned pointer will break strict-aliasing rules
| hv.c: In function 'Perl_newHVhv':
| hv.c:1350: warning: dereferencing type-punned pointer will break strict-aliasing rules
| hv.c:1389: warning: dereferencing type-punned pointer will break strict-aliasing rules
| hv.c: In function 'Perl_hv_clear_placeholders':
| hv.c:1532: warning: dereferencing type-punned pointer will break strict-aliasing rules
| hv.c: In function 'S_hfreeentries':
| hv.c:1576: warning: dereferencing type-punned pointer will break strict-aliasing rules
| hv.c:1581: warning: dereferencing type-punned pointer will break strict-aliasing rules
| hv.c:1584: warning: dereferencing type-punned pointer will break strict-aliasing rules
| hv.c:1601: warning: dereferencing type-punned pointer will break strict-aliasing rules
| `sh  cflags "optimize='-O2'" av.o` -fPIC av.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| av.c: In function 'Perl_av_extend':
| av.c:67: warning: dereferencing type-punned pointer will break strict-aliasing rules
| av.c: In function 'Perl_av_fill':
| av.c:756: warning: dereferencing type-punned pointer will break strict-aliasing rules
| `sh  cflags "optimize='-O2'" run.o` -fPIC run.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| `sh  cflags "optimize='-O2'" pp_hot.o` -fPIC pp_hot.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| pp_hot.c: In function 'Perl_pp_enter':
| pp_hot.c:1696: warning: dereferencing type-punned pointer will break strict-aliasing rules
| pp_hot.c: In function 'Perl_pp_entersub':
| pp_hot.c:2642: warning: dereferencing type-punned pointer will break strict-aliasing rules
| pp_hot.c:2649: warning: dereferencing type-punned pointer will break strict-aliasing rules
| `sh  cflags "optimize='-O2'" sv.o` -fPIC sv.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| sv.c: In function 'Perl_sv_setsv_flags':
| sv.c:3893: warning: dereferencing type-punned pointer will break strict-aliasing rules
| sv.c:3905: warning: dereferencing type-punned pointer will break strict-aliasing rules
| sv.c:3923: warning: dereferencing type-punned pointer will break strict-aliasing rules
| sv.c:3975: warning: dereferencing type-punned pointer will break strict-aliasing rules
| sv.c:3982: warning: dereferencing type-punned pointer will break strict-aliasing rules
| sv.c: In function 'Perl_sv_clear':
| sv.c:5222: warning: ignoring return value of 'Perl_io_close', declared with attribute warn_unused_result
| sv.c: In function 'Perl_sv_reset':
| sv.c:7204: warning: dereferencing type-punned pointer will break strict-aliasing rules
| sv.c:7220: warning: dereferencing type-punned pointer will break strict-aliasing rules
| sv.c: In function 'Perl_sv_dup':
| sv.c:10272: warning: dereferencing type-punned pointer will break strict-aliasing rules
| sv.c:10280: warning: dereferencing type-punned pointer will break strict-aliasing rules
| sv.c:10281: warning: dereferencing type-punned pointer will break strict-aliasing rules
| sv.c: In function 'do_mark_cloneable_stash':
| sv.c:10802: warning: dereferencing type-punned pointer will break strict-aliasing rules
| sv.c: In function 'perl_clone':
| sv.c:11693: warning: dereferencing type-punned pointer will break strict-aliasing rules
| sv.c: In function 'Perl_sv_recode_to_utf8':
| sv.c:11743: warning: dereferencing type-punned pointer will break strict-aliasing rules
| sv.c: In function 'Perl_sv_cat_decode':
| sv.c:11802: warning: dereferencing type-punned pointer will break strict-aliasing rules
| `sh  cflags "optimize='-O2'" pp.o` -fPIC pp.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| pp.c: In function 'Perl_pp_rv2cv':
| pp.c:369: warning: dereferencing type-punned pointer will break strict-aliasing rules
| pp.c: In function 'Perl_pp_defined':
| pp.c:754: warning: dereferencing type-punned pointer will break strict-aliasing rules
| `sh  cflags "optimize='-O2'" scope.o` -fPIC scope.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| `sh  cflags "optimize='-O2'" pp_ctl.o` -fPIC pp_ctl.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| pp_ctl.c: In function 'Perl_pp_grepstart':
| pp_ctl.c:868: warning: dereferencing type-punned pointer will break strict-aliasing rules
| pp_ctl.c: In function 'Perl_pp_dbstate':
| pp_ctl.c:1661: warning: dereferencing type-punned pointer will break strict-aliasing rules
| pp_ctl.c: In function 'Perl_pp_enteriter':
| pp_ctl.c:1709: warning: dereferencing type-punned pointer will break strict-aliasing rules
| pp_ctl.c: In function 'Perl_pp_enterloop':
| pp_ctl.c:1799: warning: dereferencing type-punned pointer will break strict-aliasing rules
| pp_ctl.c: In function 'Perl_pp_goto':
| pp_ctl.c:2262: warning: dereferencing type-punned pointer will break strict-aliasing rules
| pp_ctl.c: In function 'Perl_sv_compile_2op':
| pp_ctl.c:2721: warning: dereferencing type-punned pointer will break strict-aliasing rules
| pp_ctl.c: In function 'S_doeval':
| pp_ctl.c:2850: warning: dereferencing type-punned pointer will break strict-aliasing rules
| pp_ctl.c:2876: warning: dereferencing type-punned pointer will break strict-aliasing rules
| pp_ctl.c:2879: warning: dereferencing type-punned pointer will break strict-aliasing rules
| pp_ctl.c: In function 'Perl_pp_require':
| pp_ctl.c:3177: warning: dereferencing type-punned pointer will break strict-aliasing rules
| pp_ctl.c:3379: warning: dereferencing type-punned pointer will break strict-aliasing rules
| pp_ctl.c:3381: warning: dereferencing type-punned pointer will break strict-aliasing rules
| pp_ctl.c: In function 'Perl_pp_entereval':
| pp_ctl.c:3463: warning: dereferencing type-punned pointer will break strict-aliasing rules
| pp_ctl.c: In function 'Perl_pp_entertry':
| pp_ctl.c:3610: warning: dereferencing type-punned pointer will break strict-aliasing rules
| pp_ctl.c: In function 'run_user_filter':
| pp_ctl.c:3941: warning: dereferencing type-punned pointer will break strict-aliasing rules
| `sh  cflags "optimize='-O2'" pp_sys.o` -fPIC pp_sys.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| pp_sys.c: In function 'Perl_pp_glob':
| pp_sys.c:415: warning: dereferencing type-punned pointer will break strict-aliasing rules
| pp_sys.c: In function 'S_doform':
| pp_sys.c:1273: warning: dereferencing type-punned pointer will break strict-aliasing rules
| `sh  cflags "optimize='-O2'" doop.o` -fPIC doop.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| `sh  cflags "optimize='-O2'" doio.o` -fPIC doio.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| `sh  cflags "optimize='-O2'" regexec.o` -fPIC regexec.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| regexec.c: In function 'S_regtry':
| regexec.c:2105: warning: dereferencing type-punned pointer will break strict-aliasing rules
| regexec.c: In function 'S_reginclass':
| regexec.c:4415: warning: dereferencing type-punned pointer will break strict-aliasing rules
| `sh  cflags "optimize='-O2'" utf8.o` -fPIC utf8.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| utf8.c: In function 'Perl_swash_fetch':
| utf8.c:1775: warning: dereferencing type-punned pointer will break strict-aliasing rules
| `sh  cflags "optimize='-O2'" taint.o` -fPIC taint.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| `sh  cflags "optimize='-O2'" deb.o` -fPIC deb.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| `sh  cflags "optimize='-O2'" universal.o` -fPIC universal.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| universal.c: In function 'S_isa_lookup':
| universal.c:64: warning: dereferencing type-punned pointer will break strict-aliasing rules
| universal.c:86: warning: dereferencing type-punned pointer will break strict-aliasing rules
| `sh  cflags "optimize='-O2'" xsutils.o` -fPIC xsutils.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| `sh  cflags "optimize='-O2'" globals.o` -fPIC globals.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| `sh  cflags "optimize='-O2'" perlio.o` -fPIC perlio.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| perlio.c: In function 'PerlIO_clone':
| perlio.c:649: warning: ignoring return value of 'Perl_fp_dup', declared with attribute warn_unused_result
| `sh  cflags "optimize='-O2'" perlapi.o` -fPIC perlapi.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| `sh  cflags "optimize='-O2'" numeric.o` -fPIC numeric.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| `sh  cflags "optimize='-O2'" locale.o` -fPIC locale.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| `sh  cflags "optimize='-O2'" pp_pack.o` -fPIC pp_pack.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| `sh  cflags "optimize='-O2'" pp_sort.o` -fPIC pp_sort.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| pp_sort.c: In function 'Perl_pp_sort':
| pp_sort.c:1643: warning: dereferencing type-punned pointer will break strict-aliasing rules
| pp_sort.c:1650: warning: dereferencing type-punned pointer will break strict-aliasing rules
| pp_sort.c:1651: warning: dereferencing type-punned pointer will break strict-aliasing rules
| arm-angstrom-linux-gnueabi-gcc -o libperl.so -shared -L/usr/local/lib perl.o  gv.o toke.o perly.o op.o pad.o regcomp.o dump.o util.o mg.o reentr.o hv.o av.o run.o pp_hot.o sv.o pp.o scope.o pp_ctl.o pp_sys.o doop.o doio.o regexec.o utf8.o taint.o deb.o universal.o xsutils.o globals.o perlio.o perlapi.o numeric.o locale.o pp_pack.o pp_sort.o  -lnsl -ldl -lm -lcrypt -lutil -lpthread -lc  -Wl,-soname,libperl.so.5
| `sh  cflags "optimize='-O2'" opmini.o` -fPIC -DPERL_EXTERNAL_GLOB opmini.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| opmini.c: In function 'Perl_newCONSTSUB':
| opmini.c:4585: warning: dereferencing type-punned pointer will break strict-aliasing rules
| LD_LIBRARY_PATH=/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8 ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -L/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/lib -Wl,-rpath-link,/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/lib -Wl,-O1 -o miniperl \
| 	    miniperlmain.o opmini.o libperl.so -lnsl -ldl -lm -lcrypt -lutil -lpthread -lc
| mv -f miniperl miniperl-target
| ln -s hostperl miniperl
| make[1]: Leaving directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8'
| make[1]: Entering directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8'
| LD_LIBRARY_PATH=/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8 ./miniperl -Ilib configpm --heavy=lib/Config_heavy.pl lib/Config.pm
| LD_LIBRARY_PATH=/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8 ./miniperl -Ilib lib/lib_pm.PL
| *** Module name IN: lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/Cwd.pm
| Extracting lib.pm (with variable substitutions)
| 	AutoSplitting perl library
| LD_LIBRARY_PATH=/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8 ./miniperl -Ilib -e 'use AutoSplit; \
| 		autosplit_lib_modules(@ARGV)' lib/*.pm
| LD_LIBRARY_PATH=/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8 ./miniperl -Ilib -e 'use AutoSplit; \
| 		autosplit_lib_modules(@ARGV)' lib/*/*.pm
| make lib/re.pm
| make[2]: Entering directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8'
| make[2]: `lib/re.pm' is up to date.
| make[2]: Leaving directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8'
| LD_LIBRARY_PATH=/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8 ./miniperl minimod.pl > lib/ExtUtils/Miniperl.pm
| `sh  cflags "optimize='-O2'" perlmain.o` -fPIC perlmain.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -DPERL_CORE -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2  -Wall
| 
| 	Making DynaLoader (static_pic)
| make[2]: Entering directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/ext/DynaLoader'
| Makefile out-of-date with respect to ../../lib/Config.pm ../../config.h
| Cleaning current config before rebuilding Makefile...
| make -f Makefile.old clean > /dev/null 2>&1
| ../../hostperl "-I../../lib" "-I../../lib" Makefile.PL "INSTALLDIRS=perl" "PERL_CORE=1" "LIBPERL_A=libperl.so"
| *** Module name IN: ../../lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/Cwd.pm
| Processing hints file hints/linux.pl
| Writing Makefile for DynaLoader
| *** Module name IN: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/POSIX.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/POSIX.pm
| ==> Your Makefile has been rebuilt. <==
| ==> Please rerun the make command.  <==
| false
| make[2]: *** [Makefile] Error 1
| make[2]: Leaving directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/ext/DynaLoader'
| make config failed, continuing anyway...
| make[2]: Entering directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/ext/DynaLoader'
| *** Module name IN: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/File/Glob.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/File/Glob.pm
| *** Module name IN: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/File/Glob.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/File/Glob.pm
| *** Module name IN: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/File/Glob.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/File/Glob.pm
| *** Module name IN: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/File/Glob.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/File/Glob.pm
| ../../hostperl "-I../../lib" "-I../../lib" DynaLoader_pm.PL DynaLoader.pm
| ../../hostperl "-I../../lib" "-I../../lib" XSLoader_pm.PL XSLoader.pm
| *** Module name IN: ../../lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/Cwd.pm
| *** Module name IN: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/List/Util.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/List/Util.pm
| Skip ../../lib/XSLoader.pm (unchanged)
| Skip ../../lib/DynaLoader.pm (unchanged)
| rm -f DynaLoader.xs
| cp dl_dlopen.xs DynaLoader.xs
| ../../hostperl "-I../../lib" "-I../../lib" ../../lib/ExtUtils/xsubpp -noprototypes -typemap ../../lib/ExtUtils/typemap DynaLoader.xs > DynaLoader.xsc && mv DynaLoader.xsc DynaLoader.c
| *** Module name IN: ../../lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/Cwd.pm
| ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -c   -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2   -DVERSION=\"1.05\" -DXS_VERSION=\"1.05\" -fPIC "-I../.."  -DPERL_CORE -DLIBC="/lib/libc-2.3.2.so" DynaLoader.c
| rm -rf ../../lib/auto/DynaLoader/DynaLoader.a
| /home/OE/build/tosa_angstrom/tmp/cross/bin/arm-angstrom-linux-gnueabi-ar cr ../../lib/auto/DynaLoader/DynaLoader.a DynaLoader.o && : ../../lib/auto/DynaLoader/DynaLoader.a
| chmod 755 ../../lib/auto/DynaLoader/DynaLoader.a
| make[2]: Leaving directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/ext/DynaLoader'
| LD_LIBRARY_PATH=/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8 ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -o perl  -L/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/lib -Wl,-rpath-link,/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/lib -Wl,-O1 -Wl,-E perlmain.o lib/auto/DynaLoader/DynaLoader.a  libperl.so `cat ext.libs` -lnsl -ldl -lm -lcrypt -lutil -lpthread -lc
| cd x2p; LD_LIBRARY_PATH=/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8 make s2p
| make[2]: Entering directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/x2p'
| make[2]: `s2p' is up to date.
| make[2]: Leaving directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/x2p'
| LD_LIBRARY_PATH=/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8 ./miniperl -I`pwd`/lib pod/pod2html.PL
| *** Module name IN: /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/lib/Cwd.pm
| Extracting pod2html (with variable substitutions)
| LD_LIBRARY_PATH=/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8 ./miniperl -I`pwd`/lib pod/pod2latex.PL
| *** Module name IN: /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/lib/Cwd.pm
| Extracting pod2latex (with variable substitutions)
| LD_LIBRARY_PATH=/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8 ./miniperl -I`pwd`/lib pod/pod2man.PL
| *** Module name IN: /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/lib/Cwd.pm
| Extracting pod2man (with variable substitutions)
| LD_LIBRARY_PATH=/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8 ./miniperl -I`pwd`/lib pod/pod2text.PL
| *** Module name IN: /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/lib/Cwd.pm
| Extracting pod2text (with variable substitutions)
| LD_LIBRARY_PATH=/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8 ./miniperl -I`pwd`/lib pod/pod2usage.PL
| *** Module name IN: /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/lib/Cwd.pm
| Extracting pod2usage (with variable substitutions)
| LD_LIBRARY_PATH=/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8 ./miniperl -I`pwd`/lib pod/podchecker.PL
| *** Module name IN: /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/lib/Cwd.pm
| Extracting podchecker (with variable substitutions)
| LD_LIBRARY_PATH=/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8 ./miniperl -I`pwd`/lib pod/podselect.PL
| *** Module name IN: /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/lib/Cwd.pm
| Extracting podselect (with variable substitutions)
| 
| 	Making utilities
| make[2]: Entering directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/utils'
| ../miniperl -I../lib c2ph.PL
| *** Module name IN: ../lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/Cwd.pm
| Extracting c2ph (with variable substitutions)
| Linking c2ph to pstruct.
| ../miniperl -I../lib cpan.PL
| *** Module name IN: ../lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/Cwd.pm
| Extracting cpan (with variable substitutions)
| ../miniperl -I../lib h2ph.PL
| *** Module name IN: ../lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/Cwd.pm
| Extracting h2ph (with variable substitutions)
| ../miniperl -I../lib h2xs.PL
| *** Module name IN: ../lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/Cwd.pm
| Extracting h2xs (with variable substitutions)
| ../miniperl -I../lib instmodsh.PL
| *** Module name IN: ../lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/Cwd.pm
| Extracting instmodsh (with variable substitutions)
| ../miniperl -I../lib perlbug.PL
| *** Module name IN: ../lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/Cwd.pm
| Extracting perlbug (with variable substitutions)
| ../miniperl -I../lib perldoc.PL
| *** Module name IN: ../lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/Cwd.pm
| Extracting "perldoc" (with variable substitutions)
| ../miniperl -I../lib perlivp.PL
| *** Module name IN: ../lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/Cwd.pm
| Extracting perlivp (with variable substitutions)
| ../miniperl -I../lib pl2pm.PL
| *** Module name IN: ../lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/Cwd.pm
| Extracting pl2pm (with variable substitutions)
| ../miniperl -I../lib prove.PL
| *** Module name IN: ../lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/Cwd.pm
| Extracting prove (with variable substitutions)
| ../miniperl -I../lib splain.PL
| *** Module name IN: ../lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/Cwd.pm
| Extracting splain (with variable substitutions)
| ../miniperl -I../lib perlcc.PL
| *** Module name IN: ../lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/Cwd.pm
| Extracting perlcc (with variable substitutions)
| ../miniperl -I../lib dprofpp.PL
| Extracting dprofpp (with variable substitutions)
| ../miniperl -I../lib libnetcfg.PL
| *** Module name IN: ../lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/Cwd.pm
| Extracting libnetcfg (with variable substitutions)
| ../miniperl -I../lib piconv.PL
| *** Module name IN: ../lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/Cwd.pm
| Extracting piconv (with variable substitutions)
| ../miniperl -I../lib enc2xs.PL
| *** Module name IN: ../lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/Cwd.pm
| Extracting enc2xs (with variable substitutions)
| ../miniperl -I../lib xsubpp.PL
| *** Module name IN: ../lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/Cwd.pm
| Extracting xsubpp (with variable substitutions)
| make[2]: Leaving directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/utils'
| 
| 	Making x2p stuff
| make[2]: Entering directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/x2p'
| `sh  cflags "optimize='-O2'" hash.o` -DPERL_FOR_X2P hash.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2
| `sh  cflags "optimize='-O2'" str.o` -DPERL_FOR_X2P str.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2
| `sh  cflags "optimize='-O2'" util.o` -DPERL_FOR_X2P util.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2
| `sh  cflags "optimize='-O2'" walk.o` -DPERL_FOR_X2P walk.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2
| `sh  cflags "optimize='-O2'" a2p.o` a2p.c
| 	  CCCMD =  ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -c -isystem/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -O2
| ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale -o a2p -L/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/lib -Wl,-rpath-link,/home/OE/build/tosa_angstrom/tmp/staging/arm-angstrom-linux-gnueabi/lib -Wl,-O1 hash.o  str.o util.o walk.o a2p.o -lnsl -ldl -lm -lcrypt -lutil -lpthread -lc
| 
| make[2]: Leaving directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/x2p'
| make[1]: Leaving directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8'
| cd /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/Cross/.. ; mkdir -p fake_config_library ; cp lib/Config.pm fake_config_library
| cd /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/Cross/.. ; make more2 "PERLRUN=hostperl -I/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/Cross/../fake_config_library -MConfig"
| make[1]: Entering directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8'
| 	AutoSplitting perl library
| LD_LIBRARY_PATH=/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8 ./miniperl -Ilib -e 'use AutoSplit; \
| 		autosplit_lib_modules(@ARGV)' lib/*.pm
| LD_LIBRARY_PATH=/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8 ./miniperl -Ilib -e 'use AutoSplit; \
| 		autosplit_lib_modules(@ARGV)' lib/*/*.pm
| make lib/re.pm
| make[2]: Entering directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8'
| make[2]: `lib/re.pm' is up to date.
| make[2]: Leaving directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8'
| 
| 	Making DynaLoader (static_pic)
| make[2]: Entering directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/ext/DynaLoader'
| make[2]: Leaving directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/ext/DynaLoader'
| make[2]: Entering directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/ext/DynaLoader'
| make[2]: Leaving directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/ext/DynaLoader'
| 
| 	Making attrs (dynamic)
| *** Module name IN: ../../lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/Cwd.pm
| Writing Makefile for attrs
| *** Module name IN: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/POSIX.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/POSIX.pm
| make[2]: Entering directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/ext/attrs'
| *** Module name IN: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/File/Glob.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/File/Glob.pm
| *** Module name IN: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/File/Glob.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/File/Glob.pm
| *** Module name IN: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/File/Glob.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/File/Glob.pm
| *** Module name IN: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/File/Glob.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/File/Glob.pm
| make[2]: Leaving directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/ext/attrs'
| make[2]: Entering directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/ext/attrs'
| *** Module name IN: ../../lib/Cwd.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/i686-linux-thread-multi/Cwd.pm
| *** Module name IN: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/List/Util.pm
| *** Module name OUT: /home/OE/build/tosa_angstrom/tmp/staging/i686-linux/lib/perl5/5.8.8/List/Util.pm
| Skip ../../lib/attrs.pm (unchanged)
| hostperl -I/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/Cross/../fake_config_library -MConfig ../../lib/ExtUtils/xsubpp -noprototypes -typemap ../../lib/ExtUtils/typemap  attrs.xs > attrs.xsc && mv attrs.xsc attrs.c
| Perl lib version (v5.8.8) doesn't match executable version (v5.8.7) at /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/Cross/../fake_config_library/Config.pm line 46.
| Compilation failed in require.
| BEGIN failed--compilation aborted.
| make[2]: *** [attrs.c] Error 255
| make[2]: Leaving directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8/ext/attrs'
| make[1]: *** [lib/auto/attrs/attrs.so] Error 2
| make[1]: Leaving directory `/home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/perl-5.8.8'
| make: *** [perl] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed: /home/OE/build/tosa_angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/perl-5.8.8-r7/temp/log.do_compile.19919
NOTE: package perl-5.8.8-r7: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package perl-5.8.8: failed
ERROR: Build of /home/OE/org.openembedded.dev/packages/perl/perl_5.8.8.bb do_compile failed

NOTE: Parsing finished. 4307 cached, 0 parsed, 191 skipped, 0 masked.
NOTE: build 200704300151: started

OE Build Configuration:
BB_VERSION     = "1.8.3"
OE_REVISION    = "9b429ab96d552dc260bce3cf9b5f6a938f04d5b1"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux-gnueabi"
MACHINE        = "tosa"
DISTRO         = "angstrom"
DISTRO_VERSION = "test-20070430"
TARGET_FPU     = "soft"

NOTE: Resolving missing task queue dependencies
NOTE: preferred version 2.5 of glibc not available (for item virtual/arm-angstrom-linux-gnueabi-libc-for-gcc)
NOTE: Preparing Runqueue
NOTE: Executing runqueue
NOTE: Running task 282 of 292 (ID: 0, /home/OE/org.openembedded.dev/packages/perl/perl_5.8.8.bb, do_compile)
ERROR: Task 0 (/home/OE/org.openembedded.dev/packages/perl/perl_5.8.8.bb, do_compile) failed
ERROR: '/home/OE/org.openembedded.dev/packages/perl/perl_5.8.8.bb' failed

--------------040003030207010607060003--
