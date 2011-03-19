Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q0wkQ-0004Z2-LJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Mar 2011 15:03:19 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q0wih-0003JZ-SG from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Mar 2011 07:01:31 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sat, 19 Mar 2011 07:00:55 -0700
Received: from [172.30.80.15] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Sat, 19 Mar 2011 07:01:31 -0700
Message-ID: <4D84B726.5060302@mentor.com>
Date: Sat, 19 Mar 2011 07:01:10 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4D81226B.4060704@gmail.com> <4D81331E.2070604@mentor.com>
	<4D814E28.6080701@gmail.com>
In-Reply-To: <4D814E28.6080701@gmail.com>
X-OriginalArrivalTime: 19 Mar 2011 14:00:55.0974 (UTC)
	FILETIME=[111E2460:01CBE63E]
Subject: Re: perl-native_5.10.1 fails
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
X-List-Received-Date: Sat, 19 Mar 2011 14:03:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/16/2011 04:56 PM, Jan Paesmans wrote:
> On 03/16/11 23:01, Tom Rini wrote:
>> On 03/16/2011 01:49 PM, Jan Paesmans wrote:
>>> Hi all,
>>>
>>> When trying to build an x11-image for pm9263 with angstrom-2010.x,
>>> perl-native fails to build.
>>> The error is listed below. As far as I can tell, the problem is that a
>>> gcc flag is passed to the linker, -fstack-protector. I tried to find out
>>> where this -fstack-protector could come from, but the only trace I could
>>> find was in the Configure of perl-native itself. There is no mention
>>> that it is set when Configure is called in the configure step, nor in
>>> any of the environment variables during the do_configure or
>>> do_compile step.
>>>
>>> I run Ubuntu 10.10 with gold as the linker. I thought that it might be
>>> the gold linker but neither gold nor ld seem to have this option when
>>> reviewing the man-page.
>>
>> Can you edit the recipe and add in:
>> EXTRA_OEMAKE = 'LD="${CCLD}"'
>>
>> And do a bitbake -c clean perl-native then bitbake perl-native
>> Thanks.
>>
> That did the trick. Now perl-native compiles fine. However when I
> checked the output of the log.do_compile I did notice a change a the
> behaviour. I was expecting the -fstack-protector flag to be gone,
> instead it is still there. However, instead of invoking ld for the final
> link, now gcc is invoked. Below you can find the relevent section of the
> log file. Also in attachment is a patch with the change you suggested.

OK, thanks.  I'll put this into a patch this weekend.  What's going on 
is that while I'm not sure where -fstack-protector is coming from (but 
it's a useful flag), as you saw, 'ld' chokes on it.  But for linking you 
shouldn't really ever invoke ld directly but rather via gcc, so passing 
LD=${CCLD} overrides perl's makefiles and we invoke gcc as the linker 
and it handles the flag right in this case.

>
> Thanks for the help.
> Regards,
>
> Jan
>
> Running Makefile.PL in ext/DynaLoader
> ../../miniperl -I../../lib Makefile.PL INSTALLDIRS=perl
> INSTALLMAN1DIR=none INSTALLMAN3DIR=none PERL_CORE=1 LIBPERL_A=libperl.so
> LINKTYPE=static
> Processing hints file hints/linux.pl
> Unrecognized argument in LIBS ignored:
> '-Wl,-rpath-link,/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib'
> Unrecognized argument in LIBS ignored:
> '-Wl,-rpath,/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib'
> Unrecognized argument in LIBS ignored: '-Wl,-O1'
> Unrecognized argument in LIBS ignored: '-fstack-protector'
> Writing Makefile for DynaLoader
> make[1]: Entering directory
> `/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1/ext/DynaLoader'
> make[1]: Leaving directory
> `/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1/ext/DynaLoader'
> Making all in ext/DynaLoader
>   make all PERL_CORE=1 LIBPERL_A=libperl.so LINKTYPE=static
> make[1]: Entering directory
> `/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1/ext/DynaLoader'
> ../../miniperl "-I../../lib" "-I../../lib" DynaLoader_pm.PL DynaLoader.pm
> ../../miniperl "-I../../lib" "-I../../lib" XSLoader_pm.PL XSLoader.pm
> cp XSLoader.pm ../../lib/XSLoader.pm
> cp DynaLoader.pm ../../lib/DynaLoader.pm
> AutoSplitting ../../lib/DynaLoader.pm (../../lib/auto/DynaLoader)
> rm -f DynaLoader.xs
> cp dl_dlopen.xs DynaLoader.xs
> ../../miniperl "-I../../lib" "-I../../lib" ../../lib/ExtUtils/xsubpp
> -noprototypes -typemap ../../lib/ExtUtils/typemap DynaLoader.xs>
> DynaLoader.xsc&&  mv DynaLoader.xsc DynaLoader.c
> gcc  -c   -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe
> -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE
> -D_FILE_OFFSET_BITS=64 -O2   -DVERSION=\"1.10\" -DXS_VERSION=\"1.10\"
> -fPIC "-I../.."  -DLIBC="/lib/libc-2.12.1.so" DynaLoader.c
> rm -rf ../../DynaLoader.o
> cp DynaLoader.o ../../DynaLoader.o
> make[1]: Leaving directory
> `/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1/ext/DynaLoader'
> rm -f libperl.so
> gcc  -o libperl.so -shared -O2
> -L/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib
> -L/usr/local/lib -fstack-protector op.o perl.o   gv.o toke.o perly.o
> pad.o regcomp.o dump.o util.o mg.o reentr.o mro.o hv.o av.o run.o
> pp_hot.o sv.o pp.o scope.o pp_ctl.o pp_sys.o doop.o doio.o regexec.o
> utf8.o taint.o deb.o universal.o xsutils.o globals.o perlio.o perlapi.o
> numeric.o mathoms.o locale.o pp_pack.o pp_sort.o   DynaLoader.o -lnsl
> -ldl -lm -lcrypt -lutil -lpthread -lc
> LD_LIBRARY_PATH=/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1
> gcc  -o perl
> -L/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib
> -Wl,-rpath-link,/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib
> -Wl,-rpath,/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib
> -Wl,-O1 -fstack-protector -L/usr/local/lib -Wl,-E
> -Wl,-rpath,/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/lib/perl/5.10.1/CORE
> perlmain.o  libperl.so `cat ext.libs` -lnsl -ldl -lm -lcrypt -lutil
> -lpthread -lc
> LD_LIBRARY_PATH=/home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1
> ./miniperl -Ilib mkppport
> running
> /home/janp/src/openembedded/build/tmp/work/x86_64-linux/perl-native-5.10.1-r10/perl-5.10.1/miniperl
> -I../../lib PPPort_pm.PL
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Tom Rini
Mentor Graphics Corporation


