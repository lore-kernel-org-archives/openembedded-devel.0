Received: from [64.233.166.180] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <loudawgucr@gmail.com>) id 1JYE7Y-0006lT-IS
	for Openembedded-devel@lists.openembedded.org;
	Sun, 09 Mar 2008 06:30:59 +0100
Received: by py-out-1112.google.com with SMTP id y77so1333853pyg.28
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 08 Mar 2008 21:29:08 -0800 (PST)
Received: by 10.64.142.10 with SMTP id p10mr5772226qbd.69.1205040548154;
	Sat, 08 Mar 2008 21:29:08 -0800 (PST)
Received: by 10.64.156.3 with HTTP; Sat, 8 Mar 2008 21:29:08 -0800 (PST)
Message-ID: <5e50ac960803082129k8f520ax4a1b773b579e1f3d@mail.gmail.com>
Date: Sat, 8 Mar 2008 21:29:08 -0800
From: "Louie Ilievski" <loudawgucr@gmail.com>
To: Openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.233.166.180
X-SA-Exim-Mail-From: loudawgucr@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=HTML_MESSAGE,RDNS_NONE
	autolearn=no version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: aximx50v build failing
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
X-List-Received-Date: Sun, 09 Mar 2008 05:31:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi everyone,

I'm very new to OE and am trying to get my first image created for my Axim
x51v.  I've followed the getting started guide and all that, and the build
goes for quite a while until it hits the kernel.  I have MACHINE set to
"aximx50v" and DISTRO to "angstrom-2008.1".  There may be multiple problems
here so I'll paste the entire output:

loudawg@loudawg-mac:~/openembedded/build$ bitbake gpe-image
NOTE: Handling BitBake files: \ (5252/5252) [100 %]
NOTE: Parsing finished. 5025 cached, 0 parsed, 227 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: build 200803082105: started

OE Build Configuration:
BB_VERSION     = "1.8.11"
OE_REVISION    = "ba724a0becdb79c011648d06fc0906fa6368511f"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux-gnueabi"
MACHINE        = "aximx50v"
DISTRO         = "angstrom"
DISTRO_VERSION = "2008.1-test-20080309"
TARGET_FPU     = "soft"

NOTE: Resolving any missing task queue dependencies
NOTE: preferred version 1.4 of xserver-xorg not available (for item
virtual/xserver)
NOTE: preferred version 1.18.1 of pango not available (for item
pango-module-basic-x)
NOTE: preferred version 1.18.1 of pango not available (for item
pango-module-basic-fc)
NOTE: preferred version 1.4 of xserver-xorg not available (for item
xserver-xorg)
NOTE: preferred version 2.6.1 of glibc not available (for item
virtual/arm-angstrom-linux-gnueabi-libc-for-gcc)
NOTE: preferred version 1.1.4 of dbus not available (for item dbus)
NOTE: preferred version 1.18.1 of pango not available (for item pango)
ERROR:
'['/home/loudawg/openembedded/org.openembedded.dev/packages/gtk+/gtk+-directfb_2.10.14.bb']'
RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity
'gtk+-directfb' but it wasn't found in any PACKAGE or RPROVIDES variables of
any buildable targets.
Enable debugging and see earlier logs to find unbuildable targets.
NOTE: Runtime target 'gtk+-directfb' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gtk+-directfb']
NOTE: preferred version 1.18.1 of pango not available (for item pango)
NOTE: preferred version 1.1.4 of dbus not available (for item dbus)
NOTE: multiple providers are available for virtual/libqte2 (qte-mt-static,
qte, qte-mt);
NOTE: consider defining PREFERRED_PROVIDER_virtual/libqte2
NOTE: Preparing runqueue
ERROR: Multiple .bb files are due to be built which each provide
bluez-utils-dbus
(/home/loudawg/openembedded/org.openembedded.dev/packages/bluez/bluez-utils_3.24.bb
/home/loudawg/openembedded/org.openembedded.dev/packages/bluez/bluez-cups-backend_3.24.bb).
 This usually means one provides something the other doesn't and should.
NOTE: Executing runqueue
NOTE: Running task 976 of 3754 (ID: 658,
/home/loudawg/openembedded/org.openembedded.dev/packages/linux/linux-
handhelds-2.6_2.6.21-hh20.bb, do_compile)
NOTE: package linux-handhelds-2.6-2.6.21-hh20: started
NOTE: package linux-handhelds-2.6-2.6.21-hh20-r14: task do_compile: started
ERROR: function do_compile failed
ERROR: log data follows
(/home/loudawg/openembedded/build/tmp/work/aximx50v-angstrom-linux-gnueabi/linux-
handhelds-2.6-2.6.21-hh20-r14/temp/log.do_compile.26760)
|
/home/loudawg/openembedded/build/tmp/deploy/uclibc/images/aximx50v/initramfs-
bootmenu-image-aximx50v.cpio.gz does not exist, you may need to bitbake it
separately
NOTE: Task failed:
/home/loudawg/openembedded/build/tmp/work/aximx50v-angstrom-linux-gnueabi/linux-
handhelds-2.6-2.6.21-hh20-r14/temp/log.do_compile.26760
NOTE: package linux-handhelds-2.6-2.6.21-hh20-r14: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package linux-handhelds-2.6-2.6.21-hh20: failed
ERROR: Build of
/home/loudawg/openembedded/org.openembedded.dev/packages/linux/linux-
handhelds-2.6_2.6.21-hh20.bb do_compile failed
ERROR: Task 658
(/home/loudawg/openembedded/org.openembedded.dev/packages/linux/linux-
handhelds-2.6_2.6.21-hh20.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 975 tasks of which 975 didn't need to be
rerun and 1 failed.
ERROR:
'/home/loudawg/openembedded/org.openembedded.dev/packages/linux/linux-
handhelds-2.6_2.6.21-hh20.bb' failed

Any ideas on what I need to do?

Thanks,

Lou

