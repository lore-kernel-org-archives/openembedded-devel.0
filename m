Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <bernhard.kaindl@gmx.net>) id 1NBtCa-0004fv-A8
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Nov 2009 17:52:51 +0100
Received: (qmail invoked by alias); 21 Nov 2009 16:44:41 -0000
Received: from 188-23-190-101.adsl.highway.telekom.at (EHLO
	localhost.localdomain) [188.23.190.101]
	by mail.gmx.net (mp029) with SMTP; 21 Nov 2009 17:44:41 +0100
X-Authenticated: #154622
X-Provags-ID: V01U2FsdGVkX1+pG0M67KupV7vGH3UUbTX84jW+sox8DKCLI6h/3v
	17VRQAXivr/Z9P
From: Bernhard Kaindl <bernhard.kaindl@gmx.net>
To: openembedded-devel@lists.openembedded.org,
	Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	Michael Lauer <mickey@vanille-media.de>
Date: Sat, 21 Nov 2009 17:44:34 +0100
Message-Id: <1258821874-4024-1-git-send-email-bernhard.kaindl@gmx.net>
X-Mailer: git-send-email 1.6.5.2
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.42
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: bernhard.kaindl@gmx.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] ltrace cleanup (was: Michael 'Mickey' Lauer : ltrace: fix wrong path to coreutils-native and add actual dependency)
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
X-List-Received-Date: Sat, 21 Nov 2009 16:52:51 -0000

This is a reply to 
http://lists.linuxtogo.org/pipermail/openembedded-devel/2009-November/014861.html
(Mikey: [oe] Michael 'Mickey' Lauer : ltrace: fix wrong path to coreutils-native and add actual dependency)
but I was not subscribed to the list yet, so I cannot do a real reply.
-------------------------------------------------------------------------

(The patch is at the very end of this far too detailed mail, but I wanted
 to tell everything, so skip to the end for the quick summary of the patch
 in the commit message)

Hi Mickey, Hi Dmitry,

About me: I am new to this list but worked with OE since some months
already. I worked nearly 10 years as package developer at SuSE, quite
some time of that also with with non-i386 architectures. I did lots
of (GNU/)Linux software building and packaging work in that time.

I also created the ltrace package for SUSE in 1999 and maintained
it until 2005:
http://www.filewatcher.com/p/ltrace-0.3.31-31.src.rpm.129939/ltrace.spec.html

Mickey: I met you once on the ICE to FOSDEM 2008 (when emdete showed 'Dinge')

Dmitry Eremin-Solenikov reported on 15 Nov 2009 here:
| 
| git version control wrote:
| 
| > Module: openembedded.git
| > Branch: org.openembedded.dev
| > Commit: 7df40b3378412f4700224e44042656159bc8f86c URL:   
| > http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=7df40b3378412f4700224e44042656159bc8f86c
| > 
| > Author: Michael 'Mickey' Lauer
| > <mickey at vanille-media.de> Date:   Sun Nov 15
| > 11:08:43 2009 +0100
| > 
| > ltrace: fix wrong path to coreutils-native and add actual dependency
| 
| Hmmm. This broke ltrace for me (install.coreutils-native not found).
| Do you have any pending patches on coreutils-native?

For the reader, the described changes to ltrace/ltrace_0.5.3.bb were:

-DEPENDS = "libelf"
+DEPENDS = "coreutils-native libelf"

- oe_runmake install ${EXTRA_OEMAKE} ARCH=${LTRACE_ARCH} INSTALL=${STAGING_BINDIR_NATIVE}/install DESTDIR=${D}
+ oe_runmake install ${EXTRA_OEMAKE} ARCH=${LTRACE_ARCH} INSTALL=${STAGING_BINDIR_NATIVE}/install.coreutils-native DESTDIR=${D}

Mickey responded with:
| Sorry, for some reason coreutils installs its install exactly with  
| this path here - guess that's why it broke for me without my patch.
| 
| Which version are you building?

coreutils installs using update-alternatives, thus install gets installed
as install.coreutils-native, and this is inheried by coreutils-native.

I assume that Dmitry has just 'ASSUME_PROVIDED += "coreutils-native"'
in his local.conf, causing coreutils-native to not be built.

I used this well and is perfectly legal with (AFAICS) all other packages
as long as GNU install is provided by the host and in the PATH.

If it's not, the first package which tries to use install would fail,
install problems are not limited to to ltrace but will occur at any
package.

The change to call coreutil-native's install.coreutils-native was also
the trigger for the recorded build fail of ltrace on 15 Nov 2009:

http://tinderbox.openembedded.net/packages/?status=Failed&name=ltrace

As explained, I see no reason to install ltrace using a different than
all others (please find a recipes grep which demonstrates that quite
some recipes define 'INSTALL=install -c' and propose to align ltrace
to all the other packages here.

I wanted to propose that since a while but did not get along to
actually submit a patch, but now I'm finally at it.

The reason why forcing the value of INSTALL for the make install
the first place may have been that the configure of ltrace assumes
INSTALL to be at /usr/bin/install and the oe ltrace-compile.patch 
changes this in a completely strange way, breaking the 'make install'
unless INSTALL= is specified on the make install command line:

ltrace/files/ltrace-compile.patch:-INSTALL='/usr/bin/install -c'
ltrace/files/ltrace-compile.patch:+INSTALL='$/usr/bin/install -c'

So...:

I'd propose to clean things up finally by defining things at only
one place by means of fixing the ltrace-compile.patch to correct
the INSTALL define to 'INSTALL=install -c' like other recipes do it:

recipes$ grep -r '[^#]INSTALL=install' *

genext2fs/genext2fs-1.3/misc.patch:+INSTALL=install
linux-hotplug/linux-hotplug_20040920.bb:                   mandir=${D}${oldmandir} INSTALL=install install
mgetty/mgetty-1.1.30/37-Makefile:-INSTALL=install -c -o bin -g bin
mgetty/mgetty-1.1.30/37-Makefile:+INSTALL=install -c
mgetty/mgetty-1.1.30/install.patch: INSTALL=install -c
mgetty/mgetty-1.1.30/09-doc_Makefile:+INSTALL=install
openswan/openswan-2.2.0/installflags.patch:@@ -170,7 +170,7 @@ INSTALL=install
sysvinit/sysvinit_2.86.bb:EXTRA_OEMAKE += "'INSTALL=install' \
udev/udev_124.bb:       oe_runmake 'DESTDIR=${D}' INSTALL=install install
udev/udev_100.bb:       oe_runmake 'DESTDIR=${D}' INSTALL=install install
udev/udev_092.bb:       oe_runmake 'DESTDIR=${D}' INSTALL=install install
udev/udev_097.bb:       oe_runmake 'DESTDIR=${D}' INSTALL=install install
udev/udev_141.bb:       oe_runmake 'DESTDIR=${D}' INSTALL=install install
udev/udev_118.bb:       oe_runmake 'DESTDIR=${D}' INSTALL=install install
udev/udev.inc:  oe_runmake 'DESTDIR=${D}' INSTALL=install install
zip/zip.inc:            'CFLAGS=-I. -DUNIX ${CFLAGS} ${LDFLAGS}' 'LFLAGS1=${LDFLAGS}' 'INSTALL=install' \

So ltrace-compile.patch will be grepped like this:

ltrace/files/ltrace-compile.patch:-INSTALL='/usr/bin/install -c'
ltrace/files/ltrace-compile.patch:+INSTALL='install -c'

In addition, I checked that the EXTRA_OEMAKE settings for install are do
not have any effect with ltrace-0.5.3, because it's Makefile.in defines
these values aready in the way they need to be. This was likely an attempt
to get the INSTALL issue fixed, which of course did not work because it
was hardcoded in the custom configure script of ltrace.

I also tested that ltrace-0.5.3 can be built with make -j successfully,
so I propose to remove the PARALLEL_MAKE = "" from ltrace_0.5.3.bb. I
assume that this got copied from older versions and was not checked
if still needed with ltrace-0.5.3.

So here is my proposed patch:
==============================================================================

Fix ltrace to build with ASSUME_PROVIDED += "coreutils-native"

* recipes/ltrace/files/ltrace-compile.patch:
  - Change INSTALL to not use an absolute path but find it in PATH

* recipes/ltrace/ltrace_0.5.3.bb
  - Remove coreutils-native from DEPENDS
  - Remove PARALLEL_MAKE = "" (parallel build works now)
  - Remove obsolete EXTRA_OEMAKE settings for INSTALL
  - do_install(): Do not override INSTALL=, depend on
    ltrace-compile.patch to define INSTALL='install -c'

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@gmx.net>

--

 files/ltrace-compile.patch |    2 +-
 ltrace_0.5.3.bb            |   10 ++--------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/recipes/ltrace/files/ltrace-compile.patch b/recipes/ltrace/files/ltrace-compile.patch
index 8323a5c..4784deb 100644
--- a/recipes/ltrace/files/ltrace-compile.patch
+++ b/recipes/ltrace/files/ltrace-compile.patch
@@ -54,7 +54,7 @@ Index: ltrace-0.5.3/configure
  CFLAGS='-g -O2'
  LIBS='-lelf -lsupc++ -liberty '
 -INSTALL='/usr/bin/install -c'
-+INSTALL='$/usr/bin/install -c'
++INSTALL='install -c'
  iquote='-iquote '
  iquoteend=''
  
diff --git a/recipes/ltrace/ltrace_0.5.3.bb b/recipes/ltrace/ltrace_0.5.3.bb
index 9296510..4130c29 100644
--- a/recipes/ltrace/ltrace_0.5.3.bb
+++ b/recipes/ltrace/ltrace_0.5.3.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "ltrace shows runtime library call information for dynamically linked executables."
 HOMEPAGE = "http://ltrace.alioth.debian.org"
 SECTION = "devel"
-DEPENDS = "coreutils-native libelf"
+DEPENDS = "libelf"
 LICENSE = "GPLv2"
 
 SRC_URI = "\
@@ -15,12 +15,6 @@ SRC_URI = "\
 "
 inherit autotools
 
-PARALLEL_MAKE = ""
-EXTRA_OEMAKE = "INSTALL_FILE='$(INSTALL) -p -m 0644' \
-		INSTALL_PROGRAM='$(INSTALL) -p -m 0755' \
-		INSTALL_SCRIPT='$(INSTALL) -p -m 0755' \
-		INSTALL_DIR='$(INSTALL) -p -d -m 0755' "
-
 export TARGET_CFLAGS = "${SELECTED_OPTIMIZATION} -isystem ${STAGING_INCDIR}"
 TARGET_CC_ARCH += "${LDFLAGS}"
 
@@ -71,5 +65,5 @@ do_install() {
 		sparc*)   LTRACE_ARCH=sparc ;;
 		x86_64*)  LTRACE_ARCH=x86_64 ;;
 	esac
-	oe_runmake install ${EXTRA_OEMAKE} ARCH=${LTRACE_ARCH} INSTALL=${STAGING_BINDIR_NATIVE}/install.coreutils-native DESTDIR=${D}
+	oe_runmake install ${EXTRA_OEMAKE} ARCH=${LTRACE_ARCH} DESTDIR=${D}
 }


