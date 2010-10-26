Received: from usps1.crhc.illinois.edu ([130.126.143.230]
	helo=usps.crhc.uiuc.edu) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <johnso87@crhc.illinois.edu>) id 1PApMI-0005Pm-FG
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 21:39:00 +0200
Received: from usps.crhc.uiuc.edu (localhost [127.0.0.1])
	by usps.crhc.uiuc.edu (Postfix) with ESMTP id E5CCA3400463
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 14:29:07 -0500 (CDT)
Received: from webmail.crhc.illinois.edu (newman.crhc.illinois.edu
	[130.126.143.232])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: johnso87)
	by usps.crhc.uiuc.edu (Postfix) with ESMTPSA id CF3BA340009F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 14:29:07 -0500 (CDT)
Received: from 130.126.139.136 (SquirrelMail authenticated user johnso87)
	by webmail.crhc.illinois.edu with HTTP;
	Tue, 26 Oct 2010 14:29:07 -0500 (CDT)
Message-ID: <a6650683ce91ecdc66f223e051f1fbd8.squirrel@webmail.crhc.illinois.edu>
Date: Tue, 26 Oct 2010 14:29:07 -0500 (CDT)
From: johnso87@crhc.illinois.edu
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.15
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 130.126.143.230
X-SA-Exim-Mail-From: johnso87@crhc.illinois.edu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Linker problem with libfreetype.so when cross-compiling for armv7a from x86_64
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
X-List-Received-Date: Tue, 26 Oct 2010 19:39:00 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,
    I tried to build the beagleboard-demo-image recipe from scratch on a
64-bit machine running Ubuntu 10.04.  I already had 32- and 64-bit
libfreetype.so installed (in /usr/lib and /usr/lib32) on the host.  I
get an error when trying to compile clxclient, a child project of
JAAA:

NOTE: Running task 5211 of 9419 (ID: 4930,
/scr/johnso87/beagleboard/oebb/sources/openembedded/recipes/jaaa/clxclien=
t_3.6.1.bb,
do_compile)
NOTE: package clxclient-3.6.1-r1: task do_compile: Started
ERROR: Function do_compile failed
NOTE: Task failed: ('function do_compile failed',
'/scr/johnso87/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-ang=
strom-linux-gnueabi/clxclient-3.6.1-r1/temp/log.do_compile.5368')
NOTE: oestats: task failed, see
http://tinderbox.openembedded.net/public/logs/task/9211313.txt
ERROR: Logfile of failure stored in:
/scr/johnso87/beagleboard/oebb/build/tmp-angstrom_2010_x/work/armv7a-angs=
trom-linux-gnueabi/clxclient-3.6.1-r1/temp/log.do_compile.5368
Log data follows:
| NOTE: make -j16
| arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8
-mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -shared -W=
l,-O1
-Wl,--hash-style=3Dgnu -L/usr/lib -L/usr/X11R6/lib `freetype-config --lib=
s`
-Wl,-soname,libclxclient.so.3 -o libclxclient.so.3.6.1 xdisplay.o
xresman.o xhandler.o xwindow.o xdraw.o button.o textip.o enumip.o
menuwin.o scale.o slider.o scroll.o mclist.o meter.o -lpthread -lXft -lX1=
1
| /usr/lib/libfreetype.so: file not recognized: File format not recognize=
d
| collect2: ld returned 1 exit status
| make: *** [libclxclient.so.3.6.1] Error 1
| FATAL: oe_runmake failed
| ERROR: Function do_compile failed
NOTE: package clxclient-3.6.1-r1: task do_compile: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/scr/johnso87/beagleboard/oebb/sources/openembedded/recipes/jaaa/clxclien=
t_3.6.1.bb
do_compile failed
ERROR: Task 4930
(/scr/johnso87/beagleboard/oebb/sources/openembedded/recipes/jaaa/clxclie=
nt_3.6.1.bb,
do_compile) failed with 256
ERROR:
'/scr/johnso87/beagleboard/oebb/sources/openembedded/recipes/jaaa/clxclie=
nt_3.6.1.bb'
failed
NOTE: oestats: build failed, see
http://tinderbox.openembedded.net/builds/99197/
ERROR:
'/scr/johnso87/beagleboard/oebb/sources/openembedded/recipes/jaaa/clxclie=
nt_3.6.1.bb'
failed


I tried adding /usr/lib32 to the front of my LD_LIBRARY_PATH, and tried
adding -L/usr/lib32 to the compile arguments by hacking my
/usr/bin/freetype-config , but neither seemed to do anything.  It keeps
finding the 64-bit version of libfreetype.so and puking.

Any thoughts?

I'm working from the HEAD of the master OE Git branch.

Thanks,
-Matt






