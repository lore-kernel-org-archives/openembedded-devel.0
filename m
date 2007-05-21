Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <nils.faerber@kernelconcepts.de>) id 1HqGxw-0002Y5-0L
	for openembedded-devel@openembedded.org; Tue, 22 May 2007 01:07:04 +0200
Received: from [80.131.157.211] (helo=[192.168.178.29])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <nils.faerber@kernelconcepts.de>) id 1HqGwl-0005AI-Cg
	for openembedded-devel@openembedded.org; Tue, 22 May 2007 01:05:48 +0200
Message-ID: <465225B7.50900@kernelconcepts.de>
Date: Tue, 22 May 2007 01:05:27 +0200
From: Nils Faerber <nils.faerber@kernelconcepts.de>
User-Agent: Thunderbird 1.5.0.10 (X11/20070403)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
X-Enigmail-Version: 0.94.2.0
Subject: Problem wt. perl-native building for PXA
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
X-List-Received-Date: Mon, 21 May 2007 23:07:25 -0000
Content-Type: multipart/mixed; boundary="------------000905010102010803030003"

--------------000905010102010803030003
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi!
I am encountering a strange problem while trying to build Angstrom for
PXA (for LinuxTag demo purposes). While we have some other machines
building it with the same version of OE and Bitbake just fine it fails
on my notebook (but I would like to be able to rebuild it directly at
LinuxTag, thus the question).
My machine has Ubuntu feisty installed. I am using Bitbake 1.8 from SVN
and an OE checkout from today.

What happens is that the build works quite well until it comes to
perl-native-5.8.8-r7. There it fails with the following error:

...
|       Making x2p stuff
| make[1]: Entering directory
`/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8/x2p'
| You haven't done a "make depend" yet!
| make[1]: *** [hash.o] Error 1
...
[ full log attached ]

I have the feeling that it has something to do with my host setup but I
have no clue what!? If I comment out the dependency check from the
source directory (outch, hack!) it compiles fine and continues. Most
other packages work to compile then until
libxml-parser-perl-native_2.34.bb which again fails because of a
misinstallation of the per utils in the staging directory.

I am really quite clueless what might be the reason.
If anyone encoutered this before I would be glad to share hints to
resolve the situation ;)

Thanks!

Cheers
  nils faerber

-- 
kernel concepts GbR      Tel: +49-271-771091-12
Sieghuetter Hauptweg 48  Fax: +49-271-771091-19
D-57072 Siegen           Mob: +49-176-21024535
--
NOTE: make -e MAKEFLAGS=
`sh  cflags "optimize='-O2'" miniperlmain.o` -fpic miniperlmain.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20378] 15:39:54: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" perl.o` -fpic perl.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[6397] 00:43:04: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" gv.o` -fpic gv.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20409] 15:39:56: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" toke.o` -fpic toke.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20424] 15:39:58: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" perly.o` -fpic perly.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20441] 15:40:08: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" op.o` -fpic op.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20456] 15:40:09: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" pad.o` -fpic pad.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20472] 15:40:14: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" regcomp.o` -fpic regcomp.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20488] 15:40:15: $ICECC_VERSION has to point to an existing file to be installed NONE
regcomp.c: In function 'S_study_chunk':
regcomp.c:723: warning: comparison is always false due to limited range of data type
`sh  cflags "optimize='-O2'" dump.o` -fpic dump.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20503] 15:40:19: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" util.o` -fpic util.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20519] 15:40:21: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" mg.o` -fpic mg.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20534] 15:40:23: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" reentr.o` -fpic reentr.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20550] 15:40:26: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" hv.o` -fpic hv.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20565] 15:40:27: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" av.o` -fpic av.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20580] 15:40:28: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" run.o` -fpic run.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20595] 15:40:29: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" pp_hot.o` -fpic pp_hot.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20611] 15:40:30: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" sv.o` -fpic sv.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20626] 15:40:33: $ICECC_VERSION has to point to an existing file to be installed NONE
sv.c: In function 'Perl_sv_clear':
sv.c:5222: warning: ignoring return value of 'Perl_io_close', declared with attribute warn_unused_result
`sh  cflags "optimize='-O2'" pp.o` -fpic pp.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20643] 15:40:40: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" scope.o` -fpic scope.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20659] 15:40:45: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" pp_ctl.o` -fpic pp_ctl.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20674] 15:40:47: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" pp_sys.o` -fpic pp_sys.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20690] 15:40:51: $ICECC_VERSION has to point to an existing file to be installed NONE
proto.h:1732: warning: 'S_emulate_eaccess' declared 'static' but never defined
`sh  cflags "optimize='-O2'" doop.o` -fpic doop.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20706] 15:40:55: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" doio.o` -fpic doio.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20721] 15:40:57: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" regexec.o` -fpic regexec.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20736] 15:40:59: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" utf8.o` -fpic utf8.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20754] 15:41:03: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" taint.o` -fpic taint.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20770] 15:41:05: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" deb.o` -fpic deb.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20785] 15:41:05: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" universal.o` -fpic universal.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20800] 15:41:06: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" xsutils.o` -fpic xsutils.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20819] 15:41:10: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" globals.o` -fpic globals.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20835] 15:41:10: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" perlio.o` -fpic perlio.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20850] 15:41:11: $ICECC_VERSION has to point to an existing file to be installed NONE
perlio.c: In function 'PerlIO_clone':
perlio.c:649: warning: ignoring return value of 'Perl_fp_dup', declared with attribute warn_unused_result
`sh  cflags "optimize='-O2'" perlapi.o` -fpic perlapi.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20865] 15:41:13: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" numeric.o` -fpic numeric.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20880] 15:41:14: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" locale.o` -fpic locale.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20896] 15:41:15: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" pp_pack.o` -fpic pp_pack.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20911] 15:41:16: $ICECC_VERSION has to point to an existing file to be installed NONE
`sh  cflags "optimize='-O2'" pp_sort.o` -fpic pp_sort.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20926] 15:41:18: $ICECC_VERSION has to point to an existing file to be installed NONE
ld -o libperl.so -shared -L/media/disk/oe/build_h5xxx/tmp/staging/i686-linux/lib -L/usr/local/lib perl.o  gv.o toke.o perly.o op.o pad.o regcomp.o dump.o util.o mg.o reentr.o hv.o av.o run.o pp_hot.o sv.o pp.o scope.o pp_ctl.o pp_sys.o doop.o doio.o regexec.o utf8.o taint.o deb.o universal.o xsutils.o globals.o perlio.o perlapi.o numeric.o locale.o pp_pack.o pp_sort.o  -lnsl -ldl -lm -lcrypt -lutil -lpthread -lc 
`sh  cflags "optimize='-O2'" opmini.o` -fpic -DPERL_EXTERNAL_GLOB opmini.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[20943] 15:41:20: $ICECC_VERSION has to point to an existing file to be installed NONE
LD_LIBRARY_PATH=/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8 ccache gcc -L/media/disk/oe/build_h5xxx/tmp/staging/i686-linux/lib -Wl,-rpath-link,/media/disk/oe/build_h5xxx/tmp/staging/i686-linux/lib -Wl,-rpath,/media/disk/oe/build_h5xxx/tmp/staging/i686-linux/lib -Wl,-O1 -L/usr/local/lib -o miniperl \
	    miniperlmain.o opmini.o libperl.so -lnsl -ldl -lm -lcrypt -lutil -lpthread -lc 
LD_LIBRARY_PATH=/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8 ./miniperl -w -Ilib -MExporter -e '<?>' || make minitest
make: [extra.pods] Error 1 (ignored)
LD_LIBRARY_PATH=/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8 ./miniperl -Ilib configpm --heavy=lib/Config_heavy.pl lib/Config.pm
LD_LIBRARY_PATH=/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8 ./miniperl -Ilib lib/lib_pm.PL
Extracting lib.pm (with variable substitutions)
	AutoSplitting perl library
LD_LIBRARY_PATH=/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8 ./miniperl -Ilib -e 'use AutoSplit; \
		autosplit_lib_modules(@ARGV)' lib/*.pm
LD_LIBRARY_PATH=/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8 ./miniperl -Ilib -e 'use AutoSplit; \
		autosplit_lib_modules(@ARGV)' lib/*/*.pm
make lib/re.pm
make[1]: Entering directory `/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8'
cp ext/re/re.pm lib/re.pm
make[1]: Leaving directory `/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8'
LD_LIBRARY_PATH=/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8 ./miniperl minimod.pl > lib/ExtUtils/Miniperl.pm
cd lib/unicore && LD_LIBRARY_PATH=/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8 ../../miniperl -I../../lib mktables -w
touch uni.data
`sh  cflags "optimize='-O2'" perlmain.o` -fpic perlmain.c
	  CCCMD =  ccache gcc  -DPERL_CORE -c -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2  -Wall
ICECC[21158] 15:41:32: $ICECC_VERSION has to point to an existing file to be installed NONE

	Making DynaLoader (static_pic)
Processing hints file hints/linux.pl
Writing Makefile for DynaLoader
make[1]: Entering directory `/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8/ext/DynaLoader'
make[1]: Leaving directory `/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8/ext/DynaLoader'
make[1]: Entering directory `/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8/ext/DynaLoader'
../../miniperl "-I../../lib" "-I../../lib" DynaLoader_pm.PL DynaLoader.pm
../../miniperl "-I../../lib" "-I../../lib" XSLoader_pm.PL XSLoader.pm
cp XSLoader.pm ../../lib/XSLoader.pm
cp DynaLoader.pm ../../lib/DynaLoader.pm
AutoSplitting ../../lib/DynaLoader.pm (../../lib/auto/DynaLoader)
rm -f DynaLoader.xs
cp dl_dlopen.xs DynaLoader.xs
../../miniperl "-I../../lib" "-I../../lib" ../../lib/ExtUtils/xsubpp -noprototypes -typemap ../../lib/ExtUtils/typemap DynaLoader.xs > DynaLoader.xsc && mv DynaLoader.xsc DynaLoader.c
ccache gcc  -c   -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -Wdeclaration-after-statement -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2   -DVERSION=\"1.05\" -DXS_VERSION=\"1.05\" -fpic "-I../.."  -DPERL_CORE -DLIBC="/lib/libc-2.5.so" DynaLoader.c
ICECC[21236] 15:41:33: $ICECC_VERSION has to point to an existing file to be installed NONE
rm -rf ../../lib/auto/DynaLoader/DynaLoader.a
/usr/bin/ar cr ../../lib/auto/DynaLoader/DynaLoader.a DynaLoader.o && : ../../lib/auto/DynaLoader/DynaLoader.a
chmod 755 ../../lib/auto/DynaLoader/DynaLoader.a
make[1]: Leaving directory `/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8/ext/DynaLoader'
LD_LIBRARY_PATH=/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8 ccache gcc -o perl  -L/media/disk/oe/build_h5xxx/tmp/staging/i686-linux/lib -Wl,-rpath-link,/media/disk/oe/build_h5xxx/tmp/staging/i686-linux/lib -Wl,-rpath,/media/disk/oe/build_h5xxx/tmp/staging/i686-linux/lib -Wl,-O1 -L/usr/local/lib -Wl,-E -Wl,-rpath,/media/disk/oe/build_h5xxx/tmp/staging/lib/perl5/5.8.8/i686-linux-thread-multi/CORE perlmain.o lib/auto/DynaLoader/DynaLoader.a  libperl.so `cat ext.libs` -lnsl -ldl -lm -lcrypt -lutil -lpthread -lc 
cd x2p; LD_LIBRARY_PATH=/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8 make s2p
make[1]: Entering directory `/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8/x2p'
../miniperl -I../lib s2p.PL
Extracting s2p (with variable substitutions)
Linking s2p to psed.
make[1]: Leaving directory `/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8/x2p'
LD_LIBRARY_PATH=/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8 ./miniperl -I`pwd`/lib pod/pod2html.PL
Extracting pod2html (with variable substitutions)
LD_LIBRARY_PATH=/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8 ./miniperl -I`pwd`/lib pod/pod2latex.PL
Extracting pod2latex (with variable substitutions)
LD_LIBRARY_PATH=/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8 ./miniperl -I`pwd`/lib pod/pod2man.PL
Extracting pod2man (with variable substitutions)
LD_LIBRARY_PATH=/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8 ./miniperl -I`pwd`/lib pod/pod2text.PL
Extracting pod2text (with variable substitutions)
LD_LIBRARY_PATH=/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8 ./miniperl -I`pwd`/lib pod/pod2usage.PL
Extracting pod2usage (with variable substitutions)
LD_LIBRARY_PATH=/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8 ./miniperl -I`pwd`/lib pod/podchecker.PL
Extracting podchecker (with variable substitutions)
LD_LIBRARY_PATH=/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8 ./miniperl -I`pwd`/lib pod/podselect.PL
Extracting podselect (with variable substitutions)
 
	Making utilities
make[1]: Entering directory `/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8/utils'
../miniperl -I../lib c2ph.PL
Extracting c2ph (with variable substitutions)
Linking c2ph to pstruct.
../miniperl -I../lib cpan.PL
Extracting cpan (with variable substitutions)
../miniperl -I../lib h2ph.PL
Extracting h2ph (with variable substitutions)
../miniperl -I../lib h2xs.PL
Extracting h2xs (with variable substitutions)
../miniperl -I../lib instmodsh.PL
Extracting instmodsh (with variable substitutions)
../miniperl -I../lib perlbug.PL
Extracting perlbug (with variable substitutions)
../miniperl -I../lib perldoc.PL
Extracting "perldoc" (with variable substitutions)
../miniperl -I../lib perlivp.PL
Extracting perlivp (with variable substitutions)
../miniperl -I../lib pl2pm.PL
Extracting pl2pm (with variable substitutions)
../miniperl -I../lib prove.PL
Extracting prove (with variable substitutions)
../miniperl -I../lib splain.PL
Extracting splain (with variable substitutions)
../miniperl -I../lib perlcc.PL
Extracting perlcc (with variable substitutions)
../miniperl -I../lib dprofpp.PL
Extracting dprofpp (with variable substitutions)
../miniperl -I../lib libnetcfg.PL
Extracting libnetcfg (with variable substitutions)
../miniperl -I../lib piconv.PL
Extracting piconv (with variable substitutions)
../miniperl -I../lib enc2xs.PL
Extracting enc2xs (with variable substitutions)
../miniperl -I../lib xsubpp.PL
Extracting xsubpp (with variable substitutions)
make[1]: Leaving directory `/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8/utils'
 
	Making x2p stuff
make[1]: Entering directory `/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8/x2p'
You haven't done a "make depend" yet!
make[1]: *** [hash.o] Error 1
make[1]: Leaving directory `/media/disk/oe/build_h5xxx/tmp/work/i686-linux/perl-native-5.8.8-r7/perl-5.8.8/x2p'
make: *** [translators] Error 2
FATAL: oe_runmake failed

--------------000905010102010803030003--
