Received: from [195.234.128.72] (helo=scotty.chl-informatik.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <christopher.lang@plus.cablesurf.de>)
	id 1GL4rO-00022F-HY
	for openembedded-devel@openembedded.org; Wed, 06 Sep 2006 23:23:02 +0200
Received: from linux64.chl-informatik.de (linux64.chl-informatik.de
	[192.168.10.17])
	by scotty.chl-informatik.de (8.12.3/8.12.3/SuSE Linux 0.6) with ESMTP
	id k86KUQVR004232 for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2006 22:30:26 +0200
From: Christopher Lang <christopher.lang@plus.cablesurf.de>
To: openembedded-devel@openembedded.org
Date: Wed, 6 Sep 2006 23:24:32 +0200
User-Agent: KMail/1.9.1
MIME-Version: 1.0
Message-Id: <200609062324.33029.christopher.lang@plus.cablesurf.de>
Subject: error: #error "TLS support is required." while building glibc-initial-2.4 on x86_64
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Sep 2006 21:23:03 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit


I tried to start a fully renewed oe build system today with bitbake 1.6 and up 
to date oe checkout. I am using minimal distro/machine files. 
While building bootstrap-image/glibc-initial-2.4 on an x86_64 (AMD X2) machine 
for TARGET_ARCH = "i586" I get the following error:

|          
> /home/chris/tmp/OpenEmbedded/build/tmp/work/glibc-initial-2.4-r10/build-i586-oe-linux/Versions.v.iT
| In file included from include/tls.h:6,
|                  from <stdin>:1:
| nptl/sysdeps/i386/tls.h:65:3: error: #error "TLS support is required."
| make[1]: *** 
[/home/chris/tmp/OpenEmbedded/build/tmp/work/glibc-initial-2.4-r10/build-i586-oe-linux/Versions.v.i] 
Fehler 1
| make[1]: Leaving directory 
`/home/chris/tmp/OpenEmbedded/build/tmp/work/glibc-initial-2.4-r10/glibc-2.4'
| make: *** [sysdeps/gnu/errlist.c] Fehler 2
NOTE: Task 
failed: /home/chris/tmp/OpenEmbedded/build/tmp/work/glibc-initial-2.4-r10/temp/log.do_configure.5203
NOTE: package glibc-initial-2.4-r10: task do_configure: failed
ERROR: TaskFailed event exception, aborting
NOTE: package glibc-initial-2.4: failed
ERROR: Build of bootstrap-image failed


I think it is related to the configure script which cannot test TLS support on 
the x86_64 host properly:

| checking for i386 TLS support... no


The full error output is on 

http://pastebin.ca/162754


any hint on how to resolve that problem is appreciated.

many thanks

Chris


OE Build Configuration:
BB_VERSION     = "1.6.0"
OE_REVISION    = "6be0c561dac329e3cd7624dfd7f1133f9af8ae63"
TARGET_ARCH    = "i586"
TARGET_OS      = "linux"
MACHINE        = "i586-OE-MACHINE"
DISTRO         = "i586-OE-DISTRO"
DISTRO_VERSION = "1.0"
TARGET_FPU     = ""



