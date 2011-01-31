Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Pjzs0-0005dO-UF
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 20:57:04 +0100
Received: (qmail invoked by alias); 31 Jan 2011 19:55:58 -0000
Received: from p5DE4926E.dip.t-dialin.net (EHLO
	localhost.localdomain.localdomain) [93.228.146.110]
	by mail.gmx.net (mp011) with SMTP; 31 Jan 2011 20:55:58 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19mJAFqhXBmKAoy/7ABLk2mtK/PTagXeREd3P3EeX
	eRe3aIjONSs6Or
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Jan 2011 20:52:55 +0100
Message-Id: <1296503575-9149-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.2.3
X-Y-GMX-Trusted: 0
Subject: [PATCH] gettext-native: force gettextize to terminate automatically
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
X-List-Received-Date: Mon, 31 Jan 2011 19:57:05 -0000

* Running gettextize lead to non terminating situation:
*
* | You might also want to copy the convenience header file gettext.h
* | from the /home/Superandi/tmp/sysroots/i686-linux/usr/share/gettext directory into your package.
* | It is a wrapper around <libintl.h> that implements the configure --disable-nls
* | option.
* |
* | Press Return to acknowledge the previous two paragraphs.
*
* The necessity to use gettextize came up during creating a new recipe for
* clutter 1.4.2. The clutter sources come with po/Makefile.in.in compatible
* with gettext 0.17. OE supports version 0.18 of gettext. This caused the
* following error during compile:
*
* | Making all in po
* | make[2]: Entering directory `/home/Superandi/tmp/work/overo-angstrom-linux-gnueabi/clutter-1.4.2-r3.0/clutter-1.4.2/po'
* | *** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.17 but the autoconf macros are from gettext version 0.18
* | make[2]: *** [check-macro-version] Error 1
*
* This error could be fixed by this patch and adding
*
* do_configure_prepend() {
*        gettextize --force || true
*
* in the clutter recipe. For more details see
* http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-January/029235.html
*
* This patch was build-tested (with clutter 1.4.2) by:
*
* bitbake xfce46-image clutter
*
* in the following environment:
*
* BB_VERSION        = "1.10.2"
* MACHINE           = "overo"
* DISTRO            = "angstrom"
* DISTRO_VERSION    = "2010.7-test-20110131"

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 recipes/gettext/gettext-0.18/gettextize-auto.patch |   13 +++++++++++++
 recipes/gettext/gettext_0.18.bb                    |    4 +++-
 2 files changed, 16 insertions(+), 1 deletions(-)
 create mode 100644 recipes/gettext/gettext-0.18/gettextize-auto.patch

diff --git a/recipes/gettext/gettext-0.18/gettextize-auto.patch b/recipes/gettext/gettext-0.18/gettextize-auto.patch
new file mode 100644
index 0000000..3cb3c28
--- /dev/null
+++ b/recipes/gettext/gettext-0.18/gettextize-auto.patch
@@ -0,0 +1,13 @@
+Index: gettext-0.18/gettext-tools/misc/gettextize.in
+===================================================================
+--- gettext-0.18.orig/gettext-tools/misc/gettextize.in	2011-01-21 03:21:48.000000000 +0100
++++ gettext-0.18/gettext-tools/misc/gettextize.in	2011-01-28 21:48:26.000000000 +0100
+@@ -1275,7 +1275,7 @@
+   echo "Press Return to acknowledge the previous $count."
+   # Read from /dev/tty, not stdin, so that gettextize cannot be abused by
+   # non-interactive tools.
+-  read dummy < /dev/tty
++  # read dummy < /dev/tty
+ fi
+ 
+ exit 0
diff --git a/recipes/gettext/gettext_0.18.bb b/recipes/gettext/gettext_0.18.bb
index e9e613e..b534e13 100644
--- a/recipes/gettext/gettext_0.18.bb
+++ b/recipes/gettext/gettext_0.18.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The GNU internationalization library."
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SECTION = "libs"
 LICENSE = "GPLv3"
-PR = "r4"
+PR = "r5"
 DEPENDS = "gettext-native virtual/libiconv ncurses expat"
 DEPENDS_virtclass-native = "libxml2-native"
 PROVIDES = "virtual/libintl"
@@ -17,6 +17,8 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
 	   file://gnulib-uclibc-sched_param-def.patch \
 	  "
 
+SRC_URI_append_virtclass-native = "file://gettextize-auto.patch"
+
 SRC_URI_append_libc-uclibc = " file://gettext-error_print_progname.patch"
 
 nolargefile = "${@base_contains('DISTRO_FEATURES', 'largefile', '', '-DNO_LARGEFILE_SOURCE', d)}"
-- 
1.7.2.3



