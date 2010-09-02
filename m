Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OrFmY-00024z-Ag
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 21:49:11 +0200
Received: by eyb7 with SMTP id 7so609244eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Sep 2010 12:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=75JOyBYglRFIPkvNs09D+gqvsvso0UX8iB501f4yFmE=;
	b=QeK3sqNWu0Vj+xMaUvIm8YUTeBnsyEXWWNhBkIKD6XqbxG3gz5rMI4ifms4QuoYk9a
	IrLJfQwaRYaUfTyOxwIK8/wuXWX2Yx0SVwPN0gRDjqHWq12TyCctt8KWQLpFq3sAIRSM
	hXyHDKtKrUeM64pH+rg2vc3N184j/8uVBRRR0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=jpgIsEoAEs+jCNFlObgaqW7c289gI+5Q1Sa1u3c5EJycfEesuG7vqv5VUN4wi0mmZP
	erzftGHiJ5GHlmO9pwAWyXV9w/6h2uTvqboCpVt04fakaZUH8II9s3GxWUvchzGAgv+Q
	aMQbVR84yAkd+wizHs0Jgc+MVIyR7arKCxooQ=
MIME-Version: 1.0
Received: by 10.216.150.219 with SMTP id z69mr2162209wej.75.1283456917024;
	Thu, 02 Sep 2010 12:48:37 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Thu, 2 Sep 2010 12:48:36 -0700 (PDT)
Date: Thu, 2 Sep 2010 12:48:36 -0700
Message-ID: <AANLkTinU39HjKWb9=VMiSa=R2YA_9BxPDctiW1ire48C@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	"General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Perl modules I can not get to build, libdbd-sqlite-perl libversion-perl
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
X-List-Received-Date: Thu, 02 Sep 2010 19:49:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

I have cleaned and rebuilt these a few times now while trying to do
what its saying or assuming it should be saying in the errors, the
commands i have run are bitbake -c package then I run bitbake package
again after I try a fix. Build machine is ubuntu9.10, and I am on the
overo branch. I know I really need to learn to grasp the recipes and
patching more but I am slowly working on that while working through
the errors as it sticks better for me this way. I broke up each
failing recipe down so easier to see info for each package.

libdbd-sqlite-perl:
I have read the error and installed what it says is missing as well as
upgraded CPAN and yet still can not build this package for some reason
and I am not sure what to try next. I have installed I think every DBi
related module on the build machine through perl as well as through
apt-get on Ubuntu. I am sure this could be another simple beginner
error but I can not seem to get how to get through the error. Any
chance anyone has seen this or knows what I need to do for a work
around for the time being? Error below:

NOTE: Handling BitBake files: | (7445/7448) [99 %]
NOTE: Parsing finished. 6460 cached, 471 parsed, 517 skipped, 2 masked.
NOTE: oestats: build 85643
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 923 of 979 (ID: 45,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/perl/libdbd-sqlite-perl_1.29.bb,
do_setscene)
NOTE: Running task 924 of 979 (ID: 43,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/perl/libdbd-sqlite-perl_1.29.bb,
do_fetch)
NOTE: Running task 925 of 979 (ID: 38,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/perl/libdbd-sqlite-perl_1.29.bb,
do_unpack)
NOTE: Unpacking sources/DBD-SQLite-1.29.tar.gz to
tmp/work/armv7a-angstrom-linux-gnueabi/libdbd-sqlite-perl-1.29-r0/
NOTE: Running task 926 of 979 (ID: 39,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/perl/libdbd-sqlite-perl_1.29.bb,
do_patch)
NOTE: Running task 927 of 979 (ID: 46,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/perl/libdbd-sqlite-perl_1.29.bb,
do_configure)
ERROR: function do_configure failed
ERROR: log data follows
(/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libdbd-sqlite-perl-1.29-r0/temp/log.do_configure.31416)
| DBI 1.57 is required to configure this module, please install it or
upgrade your CPAN/CPANPLUS shell
| yes: standard output: Broken pipe
| yes: write error
| sed: can't read Makefile: No such file or directory
NOTE: Task failed:
/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libdbd-sqlite-perl-1.29-r0/temp/log.do_configure.31416
NOTE: oestats: task failed, see
http://tinderbox.openembedded.net/public/logs/task/7549847.txt
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/perl/libdbd-sqlite-perl_1.29.bb
do_configure failed
ERROR: Task 46 (/home/vdubhack/overo-oe/org.openembedded.dev/recipes/perl/libdbd-sqlite-perl_1.29.bb,
do_configure) failed
NOTE: Tasks Summary: Attempted 926 tasks of which 922 didn't need to
be rerun and 1 failed.
ERROR: '/home/vdubhack/overo-oe/org.openembedded.dev/recipes/perl/libdbd-sqlite-perl_1.29.bb'
failed
NOTE: oestats: build failed, see http://tinderbox.openembedded.net/builds/85643/


libversion-perl:
This one I can not really make any sense of the error so not sure what
to try but what I have done is install the module through cpan and
apt-get on the build machine and still failing.Other than that I am
out of ideas as to what to try. Error below:

NOTE: Handling BitBake files: | (7445/7448) [99 %]
NOTE: Parsing finished. 6460 cached, 471 parsed, 517 skipped, 2 masked.
NOTE: oestats: build 85644
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 923 of 960 (ID: 26,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/perl/libversion-perl_0.6701.bb,
do_setscene)
NOTE: Running task 924 of 960 (ID: 24,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/perl/libversion-perl_0.6701.bb,
do_fetch)
NOTE: Running task 925 of 960 (ID: 19,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/perl/libversion-perl_0.6701.bb,
do_unpack)
NOTE: Unpacking sources/version-0.6701.tar.gz to
tmp/work/armv7a-angstrom-linux-gnueabi/libversion-perl-0.6701-r9/
NOTE: Running task 926 of 960 (ID: 20,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/perl/libversion-perl_0.6701.bb,
do_patch)
NOTE: Running task 927 of 960 (ID: 27,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/perl/libversion-perl_0.6701.bb,
do_configure)
NOTE: Running task 928 of 960 (ID: 28,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/perl/libversion-perl_0.6701.bb,
do_qa_configure)
NOTE: Running task 929 of 960 (ID: 29,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/perl/libversion-perl_0.6701.bb,
do_compile)
ERROR: function do_compile failed
ERROR: log data follows
(/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libversion-perl-0.6701-r9/temp/log.do_compile.31460)
| NOTE: make -e MAKEFLAGS=
PASTHRU_INC=-isystem/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
-ggdb3 CCFLAGS=-isystem/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
-ggdb3 LD=arm-angstrom-linux-gnueabi-gcc -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb
| cp lib/version.pm blib/lib/version.pm
| make[1]: Entering directory
`/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libversion-perl-0.6701-r9/version-0.6701/vutil'
| cp lib/version/vxs.pm ../blib/lib/version/vxs.pm
| arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8
-mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb -c
-isystem/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
-ggdb3  -isystem/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1
-DDEBIAN -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS
-fno-strict-aliasing -pipe -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
-O2   -DVERSION=\"0.6701\" -DXS_VERSION=\"0.6701\" -fPIC
"-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/perl/5.10.1/CORE"
  vutil.c
| In file included from vutil.c:9:
| vutil.h:5: error: conflicting types for 'Perl_upg_version'
| /home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/perl/5.10.1/CORE/proto.h:2295:
error: previous declaration of 'Perl_upg_version' was here
| In file included from vutil.c:9:
| vutil.h:14:1: warning: "upg_version" redefined
| In file included from
/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/perl/5.10.1/CORE/perl.h:976,
|                  from vutil.c:2:
| /home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/perl/5.10.1/CORE/embed.h:2924:1:
warning: this is the location of the previous definition
| vutil.c:278: error: conflicting types for 'Perl_upg_version'
| /home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/perl/5.10.1/CORE/proto.h:2295:
error: previous declaration of 'Perl_upg_version' was here
| make[1]: *** [vutil.o] Error 1
| make[1]: Leaving directory
`/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libversion-perl-0.6701-r9/version-0.6701/vutil'
| make: *** [subdirs] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libversion-perl-0.6701-r9/temp/log.do_compile.31460
NOTE: oestats: task failed, see
http://tinderbox.openembedded.net/public/logs/task/7549881.txt
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/perl/libversion-perl_0.6701.bb
do_compile failed
ERROR: Task 29 (/home/vdubhack/overo-oe/org.openembedded.dev/recipes/perl/libversion-perl_0.6701.bb,
do_compile) failed
NOTE: Tasks Summary: Attempted 928 tasks of which 922 didn't need to
be rerun and 1 failed.
ERROR: '/home/vdubhack/overo-oe/org.openembedded.dev/recipes/perl/libversion-perl_0.6701.bb'
failed
NOTE: oestats: build failed, see http://tinderbox.openembedded.net/builds/85644/




Thanks as always for any help on these or pointing out anything to me.


