Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NV1vQ-000395-1d
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 13:02:15 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NV1tK-0007cg-7z for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 07:00:02 -0500
Date: Wed, 13 Jan 2010 06:59:20 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.1001130657110.487@localhost>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: dev branch, bitbake of "mplayer" fails
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
X-List-Received-Date: Wed, 13 Jan 2010 12:02:15 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i'm starting to think these build errors only ever happen to me.
:-( once again, on fedora 12, dev branch:


ERROR: function do_compile failed
ERROR: see log in
/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/mplayer-0.0+1.0rc2+svnr30247-r15/temp/log.do_compile.26510
NOTE: Task failed:
/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/mplayer-0.0+1.0rc2+svnr30247-r15/temp/log.do_compile.26510
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/rpjday/oe/openembedded/recipes/mplayer/mplayer_svn.bb do_compile
failed

  log file:

NOTE: make
ccache arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8
-mfpu=neon -mfloat-abi=softfp -Wundef -Wdisabled-optimization
-Wno-pointer-sign -Wdeclaration-after-statement -std=gnu99
-isystem/home/rpjday/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations  -ftree-vectorize -fomit-frame-pointer -O4
-ffast-math
-I/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/mplayer-0.0+1.0rc2+svnr30247-r15/trunk/libdvdread4
-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -I.
-isystem/home/rpjday/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include
-D_REENTRANT
-I/home/rpjday/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/freetype2
-I/home/rpjday/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include
-I/home/rpjday/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/schroedinger-1.0
-I/home/rpjday/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/liboil-0.3
-isystem/home/rpjday/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include
-c -o libmpcodecs/vf_fspp.o libmpcodecs/vf_fspp.c
In file included from libmpcodecs/vf_fspp.c:50:
./libavutil/internal.h:266:6: warning: "HAVE_EXP2" is not defined
./libavutil/internal.h:273:6: warning: "HAVE_EXP2F" is not defined
./libavutil/internal.h:294:6: warning: "HAVE_LOG2F" is not defined
In file included from libmpcodecs/vf_fspp.c:51:
./libavutil/internal.h:267: error: static declaration of 'exp2'
follows non-static declaration
./libavutil/internal.h:274: error: static declaration of 'exp2f'
follows non-static declaration
./libavutil/internal.h:295: error: static declaration of 'log2f'
follows non-static declaration
make: *** [libmpcodecs/vf_fspp.o] Error 1
FATAL: oe_runmake failed


rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


