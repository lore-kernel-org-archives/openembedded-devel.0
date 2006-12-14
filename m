Received: from [204.127.200.84] (helo=sccrmhc14.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <3rdshift@comcast.net>) id 1GuhJh-0006bz-Ek
	for openembedded-devel@openembedded.org; Thu, 14 Dec 2006 04:31:29 +0100
Received: from dollar.3rdshift.com
	(c-69-251-178-175.hsd1.md.comcast.net[69.251.178.175])
	by comcast.net (sccrmhc14) with ESMTP
	id <200612140329450140043ddle>; Thu, 14 Dec 2006 03:29:45 +0000
Received: from dollar.3rdshift.com (localhost.localdomain [127.0.0.1])
	by dollar.3rdshift.com (8.13.7/8.13.6) with ESMTP id kBE3TiQK006439
	for <openembedded-devel@openembedded.org>;
	Wed, 13 Dec 2006 22:29:45 -0500
Received: (from vlg@localhost)
	by dollar.3rdshift.com (8.13.7/8.13.7/Submit) id kBE3Tifc006438
	for openembedded-devel@openembedded.org; Wed, 13 Dec 2006 22:29:44 -0500
From: VLG <3rdshift@comcast.net>
To: openembedded-devel@openembedded.org
Organization: 3rdShift Inc.
Date: Wed, 13 Dec 2006 22:29:44 -0500
Message-Id: <1166066984.2740.21.camel@dollar.3rdshift.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 (2.6.3-1.fc5.5) 
Subject: .bb file syntax question
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
X-List-Received-Date: Thu, 14 Dec 2006 03:31:30 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I am looking for a working example of a .bb file that builds a .ipk
package by pulling project from Sourceforge-hosted CVS. Somehow, what I
tried so far for my project (http://granule.sf.net) simply doesn't work:

granule_cvs.bb
---------------------------------------------------------
DESCRIPTION = "Generic memory training with flash cards.  Automatic
scheduling algorithm."
AUTHOR = "Vladislav Grinchenko <vlg@users.sourceforge.net>"
HOMEPAGE = "http://granule.sf.net"
SECTION = "x11/apps"
PRIORITY = "optional"
LICENSE = "GPLv2"
DEPENDS = "glib-2.0-native intltool-native gtkmm libxml2 libassa"
PR = "r0"
PV = "1.1+cvs"

EXTRA_OECONF += "--enable-pda=yes"

SRC_URI =
"cvs://anonymous@granule.cvs.sourceforge.net/cvsroot/granule;method=pserver;module=granule"

inherit autotools pkgconfig

---------------------------------------------------------

However, if I define SRC_URI to point to a local file, I get my package
built:

SRC_URI =
"file:///extra/stuff/org.openembedded.dev/packages/granule/granule-1.2.4.tar.gz"


Here is the failing output log:
=========================================================
[vlg@dollar]/extra/stuff> bitbake granule
NOTE: Using cache in '/extra/stuff/tmp/cache/collie'
NOTE: Handling BitBake files: \ (4100/4100) [100 %]
NOTE: Parsing finished. 3945 cached, 0 parsed, 155 skipped, 0 masked.

NOTE: build 200612132221: started

OE Build Configuration:
BB_VERSION     = "1.6.3"
OE_REVISION    = "dc5138ded31c9c1aacd6c0bf37d83ec11d95747c"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux"
MACHINE        = "collie"
DISTRO         = "openzaurus"
DISTRO_VERSION = ".dev-snapshot-20061214"
TARGET_FPU     = "soft"

NOTE: multiple providers are available (glibc, glibc-intermediate);
NOTE: consider defining
PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc
NOTE: multiple providers are available (db3-native, db-native);
NOTE: consider defining PREFERRED_PROVIDER_virtual/db-native
NOTE: multiple providers are available (db3, db);
NOTE: consider defining PREFERRED_PROVIDER_virtual/db
NOTE: package granule-1.1+cvs: started
NOTE: package granule-1.1+cvs-r0: task do_fetch: started
NOTE: fetch
http://ewi546.ewi.utwente.nl/mirror/www.openzaurus.org/official/unstable/3.5.4/sources/granule_granule.cvs.sourceforge.net__20061214.tar.gz
--22:21:52--
http://ewi546.ewi.utwente.nl/mirror/www.openzaurus.org/official/unstable/3.5.4/sources/granule_granule.cvs.sourceforge.net__20061214.tar.gz
           =>
`/extra/stuff/sources/granule_granule.cvs.sourceforge.net__20061214.tar.gz'
Resolving ewi546.ewi.utwente.nl... 130.89.145.130
Connecting to ewi546.ewi.utwente.nl|130.89.145.130|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
22:21:52 ERROR 404: Not Found.

NOTE: Update
cvs://anonymous@granule.cvs.sourceforge.net/cvsroot/granule;method=pserver;module=granule
cvs update: Updating .
cvs update: Updating debian
cvs update: Updating debian.hildon
cvs update: Updating docs
cvs update: Updating docs/C
cvs update: Updating hildon
cvs update: Updating hildon/icons
cvs update: Updating hildon/icons/26x26
cvs update: Updating hildon/icons/40x40
cvs update: Updating hildon/icons/scalable
cvs update: Updating pixmaps
cvs update: Updating po
cvs update: Updating src
NOTE: package granule-1.1+cvs-r0: task do_fetch: completed
NOTE: package granule-1.1+cvs-r0: task do_unpack: started
NOTE:
Unpacking /extra/stuff/sources/granule_granule.cvs.sourceforge.net__20061214.tar.gz to /extra/stuff/tmp/work/arm-linux/granule-1.1+cvs-r0/
NOTE: package granule-1.1+cvs-r0: task do_unpack: completed
NOTE: package granule-1.1+cvs-r0: task do_patch: started
NOTE: package granule-1.1+cvs-r0: task do_patch: completed
NOTE: package granule-1.1+cvs-r0: task do_bootstrap: started
NOTE: SITE
files /extra/stuff/org.openembedded.dev/site/endian-little /extra/stuff/org.openembedded.dev/site/arm-linux
NOTE: package granule-1.1+cvs-r0: task do_bootstrap: completed
NOTE: package granule-1.1+cvs-r0: task do_configure: started
NOTE: SITE
files /extra/stuff/org.openembedded.dev/site/endian-little /extra/stuff/org.openembedded.dev/site/arm-linux
NOTE: package granule-1.1+cvs-r0: task do_configure: completed
NOTE: package granule-1.1+cvs-r0: task do_compile: started
NOTE: SITE
files /extra/stuff/org.openembedded.dev/site/endian-little /extra/stuff/org.openembedded.dev/site/arm-linux
NOTE: package granule-1.1+cvs-r0: task do_compile: completed
NOTE: package granule-1.1+cvs-r0: task do_install: started
NOTE: SITE
files /extra/stuff/org.openembedded.dev/site/endian-little /extra/stuff/org.openembedded.dev/site/arm-linux
ERROR: function do_install failed
ERROR: log data follows (/extra/stuff/tmp/work/arm-linux/granule-1.1
+cvs-r0/temp/log.do_install.5506)
| NOTE: make DESTDIR=/extra/stuff/tmp/work/arm-linux/granule-1.1
+cvs-r0/image install
| make: *** No rule to make target `install'.  Stop.
| FATAL: oe_runmake failed
NOTE: Task failed: /extra/stuff/tmp/work/arm-linux/granule-1.1
+cvs-r0/temp/log.do_install.5506
NOTE: package granule-1.1+cvs-r0: task do_install: failed
ERROR: TaskFailed event exception, aborting
NOTE: package granule-1.1+cvs: failed
ERROR: Build of granule failed
===================================================================

Looking further down, 

[vlg@dollar]> ls /extra/stuff/tmp/work/arm-linux/granule-1.1+cvs-r0/

drwxr-xr-x 11 vlg 4.0K Dec 13 22:22 granule/           <- source pulled
from CVS
drwxr-xr-x  3 vlg 4.0K Dec 13 22:21 granule-1.1+cvs/   <- empty  (????)
drwxr-xr-x  2 vlg 4.0K Dec 13 22:22 image/
drwxr-xr-x  2 vlg 4.0K Dec 13 22:22 temp/


Another pecurliar thing I noted was that do_compile stage completes
awfully fast - it takes about 40 seconds on my machine to build the
package on a regular basis whereas in this case it's the blink of an
eye.

[vlg@dollar]/extra/stuff> bitbake --version
BitBake Build Tool Core version 1.6.3, bitbake version 1.6.3

I'm building with the latest unstable collie.

Any ideas will be very welcomed.
thanks,
-Vlad


