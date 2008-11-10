Received: from [82.182.55.65] (helo=pcjr2.rosbacke.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mikael@rosbacke.org>) id 1KzZtH-0002pi-CH
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Nov 2008 17:45:27 +0100
Received: from [192.168.0.195] by pcjr2.rosbacke.org with esmtp (Exim 4.63)
	(envelope-from <mikael@rosbacke.org>) id 1KzZrR-0001Av-Up
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Nov 2008 17:43:34 +0100
From: Mikael Rosbacke <mikael@rosbacke.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Nov 2008 17:43:33 +0100
Message-Id: <1226335413.6685.13.camel@akaza1>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1 
X-SA-Exim-Connect-IP: 192.168.0.195
X-SA-Exim-Mail-From: mikael@rosbacke.org
X-SA-Exim-Scanned: No (on pcjr2.rosbacke.org); SAEximRunCond expanded to false
Subject: Building x86 on Ubuntu 8.10/x86_64 host with bugreport.
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
X-List-Received-Date: Mon, 10 Nov 2008 16:45:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks for the suggestion of image and machine settings. :-)


I tried again with a clean checkout and building of an image.
I used distribution 'angstrom-2008.1', machine 'x86' and target
'minimal-image'. I'm still on my Ubuntu 8.10 x86_64 host.

I managed to create an image, but there where 1 compile error:
Build of/home/mikaelr/stuff/openembedded/packages/linux/linux_2.6.21.bb
do_compile failed.

From the log message:
...
Entering directory
`/home/mikaelr/stuff/tmp/work/x86-angstrom-linux/linux-2.6.21-r12/linux-2.6.21'
  CC      scripts/mod/empty.o
  HOSTCC  scripts/mod/mk_elfconfig
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/file2alias.o
  HOSTCC  scripts/mod/modpost.o
  HOSTCC  scripts/mod/sumversion.o
scripts/mod/sumversion.c: In function 'get_src_version':
scripts/mod/sumversion.c:384: error: 'PATH_MAX' undeclared (first use in
this function)
scripts/mod/sumversion.c:384: error: (Each undeclared identifier is
reported only once
scripts/mod/sumversion.c:384: error: for each function it appears in.)
scripts/mod/sumversion.c:384: warning: unused variable 'filelist'
make[2]: *** [scripts/mod/sumversion.o] Error 1
make[2]: Leaving directory
`/home/mikaelr/stuff/tmp/work/x86-angstrom-linux/linux-2.6.21-r12/linux-2.6.21'
make[1]: *** [scripts/mod] Error 2
make[1]: Leaving directory
`/home/mikaelr/stuff/tmp/work/x86-angstrom-linux/linux-2.6.21-r12/linux-2.6.21'
make: *** [scripts] Error 2
FATAL: oe_runmake failed

By inserting: '#include <limits.h>' in 
tmp/work/x86-angstrom-linux/linux-2.6.21-r12/linux-2.6.21/scripts/mod/sumversion.c
the compilation could be restarted without a problem.

Google will give you that this is a known problem and it has been fixed
in recent kernels. 
I'm not to familiar with oe patching policies but this description
should be enough to create a patch for the kernel if needed.

--- Mikael R





