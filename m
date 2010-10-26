Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <Alexander.Stohr@gmx.de>) id 1PAj4q-0007d3-LD
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 14:56:36 +0200
Received: (qmail 20261 invoked by uid 0); 26 Oct 2010 12:55:50 -0000
Received: from 193.8.40.126 by www008.gmx.net with HTTP;
	Tue, 26 Oct 2010 14:55:49 +0200 (CEST)
Date: Tue, 26 Oct 2010 14:55:49 +0200
From: "Alexander Stohr" <Alexander.Stohr@gmx.de>
Message-ID: <20101026125549.205470@gmx.net>
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Authenticated: #15156664
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX18233R7eIU264uXvRDkxyfU2ObfwWjvAnigQHoY5/
	fayiuiCXPXcmcNYuaAIf/sg1w9/sN70XL3ZQ== 
X-GMX-UID: 7f3/eXgdeWUoctAklHVzwOgxU3U4Nw8v
X-FuHaFi: 0.68000000000000005
X-SA-Exim-Connect-IP: 213.165.64.22
X-SA-Exim-Mail-From: Alexander.Stohr@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] fix for older glib-2.0 versions to build with recent autotools
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
X-List-Received-Date: Tue, 26 Oct 2010 12:56:50 -0000
X-Groupsio-MsgNum: 25514
Content-Type: multipart/mixed; boundary="========GMX205471288097749389905"

--========GMX205471288097749389905
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

the attached patch bundles a single fix for glib-2.0
for recipes built upon glib tarballs 2.6.4 to 2.20.4.
later versions have the problem fixed in tarball (e.g. 2.22.1 and newer).

the problem happens when you need to update autotools
for some other reason (e.g. building some newer package)
whilst not wanting to update glib at the very same time.
it manifests by a badly clobbered "fi" in configure step
and thus a still open nesting level when the script ends.
the auto tools generated script exposes "fiAC_..." that
originates from a too extensive use of the "dnl" statemnt.
that construct is only critical with newer auto tools.

the fix removes those problematic extra keyword.

regards, Alex.

see for reference:
http://bugs.gentoo.org/show_bug.cgi?id=307775
http://git.gnome.org/browse/glib/commit/?id=c24f6e55276fac68b08df34b0d350f65afe994d9


-- 
GRATIS! Movie-FLAT mit über 300 Videos. 
Jetzt freischalten unter http://portal.gmx.net/de/go/maxdome

--========GMX205471288097749389905
Content-Type: text/x-patch; charset="iso-8859-15"; name="glib-2.0-fiac.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="glib-2.0-fiac.patch"

diff -Nru glib-2.0.orig/files/glib-2.6.4-fix-autotools-fiac.patch glib-2.0/files/glib-2.6.4-fix-autotools-fiac.patch
--- glib-2.0.orig/files/glib-2.6.4-fix-autotools-fiac.patch	1970-01-01 01:00:00.000000000 +0100
+++ glib-2.0/files/glib-2.6.4-fix-autotools-fiac.patch	2010-10-26 14:09:14.000000000 +0200
@@ -0,0 +1,12 @@
+diff -Nru glib-2.6.4.orig/acglib.m4 glib-2.6.4/acglib.m4
+--- glib-2.6.4.orig/acglib.m4	2004-02-27 01:57:25.000000000 +0100
++++ glib-2.6.4/acglib.m4	2010-10-26 14:06:54.000000000 +0200
+@@ -117,7 +117,7 @@
+       [$2],
+       [echo "$as_me: failed program was:" >&AS_MESSAGE_LOG_FD
+ cat conftest.$ac_ext >&AS_MESSAGE_LOG_FD
+-m4_ifvaln([$3],[$3])dnl])dnl
++m4_ifvaln([$3],[$3])dnl])
+ ac_compile="$glib_ac_compile_save"
+ rm -f conftest.$ac_objext conftest.err m4_ifval([$1], [conftest.$ac_ext])[]dnl
+ ])# GLIB_CHECK_COMPILE_WARNINGS
diff -Nru glib-2.0.orig/glib-2.0_2.12.12.bb glib-2.0/glib-2.0_2.12.12.bb
--- glib-2.0.orig/glib-2.0_2.12.12.bb	2010-10-26 14:25:13.000000000 +0200
+++ glib-2.0/glib-2.0_2.12.12.bb	2010-10-26 14:27:52.000000000 +0200
@@ -3,7 +3,8 @@
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glib/2.12/glib-${PV}.tar.bz2 \
            file://glibconfig-sysdefs.h \
-           file://configure-libtool.patch"
+           file://configure-libtool.patch \
+           file://glib-2.6.4-fix-autotools-fiac.patch"
 
 
 SRC_URI[md5sum] = "0b3a42098243d054475ff6eb51ed2be1"
diff -Nru glib-2.0.orig/glib-2.0_2.20.3.bb glib-2.0/glib-2.0_2.20.3.bb
--- glib-2.0.orig/glib-2.0_2.20.3.bb	2010-10-26 14:25:22.000000000 +0200
+++ glib-2.0/glib-2.0_2.20.3.bb	2010-10-26 14:28:03.000000000 +0200
@@ -5,6 +5,7 @@
   http://ftp.gnome.org/pub/GNOME/sources/glib/2.20/glib-${PV}.tar.bz2;name=tarball \
   file://glibconfig-sysdefs.h \
   file://configure-libtool.patch \
+  file://glib-2.6.4-fix-autotools-fiac.patch \
 "
 SRC_URI_append_arm = " file://atomic-thumb.patch"
 
diff -Nru glib-2.0.orig/glib-2.0_2.20.4.bb glib-2.0/glib-2.0_2.20.4.bb
--- glib-2.0.orig/glib-2.0_2.20.4.bb	2010-10-26 14:25:31.000000000 +0200
+++ glib-2.0/glib-2.0_2.20.4.bb	2010-10-26 14:28:18.000000000 +0200
@@ -5,6 +5,7 @@
   http://ftp.gnome.org/pub/GNOME/sources/glib/2.20/glib-${PV}.tar.bz2 \
   file://glibconfig-sysdefs.h \
   file://configure-libtool.patch \
+  file://glib-2.6.4-fix-autotools-fiac.patch \
 "
 SRC_URI_append_arm = " file://atomic-thumb.patch"
 
diff -Nru glib-2.0.orig/glib-2.0_2.6.4.bb glib-2.0/glib-2.0_2.6.4.bb
--- glib-2.0.orig/glib-2.0_2.6.4.bb	2010-10-26 14:28:45.000000000 +0200
+++ glib-2.0/glib-2.0_2.6.4.bb	2010-10-26 14:29:02.000000000 +0200
@@ -24,7 +24,8 @@
 SRC_URI = "ftp://ftp.gtk.org/pub/gtk/v2.6/glib-${PV}.tar.bz2 \
            file://glibinclude.patch;striplevel=2 \
            file://glibconfig-sysdefs.h \
-           file://configure-libtool.patch"
+           file://configure-libtool.patch \
+           file://glib-2.6.4-fix-autotools-fiac.patch"
 
 S = "${WORKDIR}/glib-${PV}"
 
diff -Nru glib-2.0.orig/glib-2.0_2.8.6.bb glib-2.0/glib-2.0_2.8.6.bb
--- glib-2.0.orig/glib-2.0_2.8.6.bb	2010-10-26 14:29:25.000000000 +0200
+++ glib-2.0/glib-2.0_2.8.6.bb	2010-10-26 14:29:44.000000000 +0200
@@ -20,7 +20,8 @@
 
 SRC_URI = "ftp://ftp.gtk.org/pub/gtk/v2.8/glib-${PV}.tar.bz2 \
            file://glibconfig-sysdefs.h \
-           file://configure-libtool.patch"
+           file://configure-libtool.patch \
+           file://glib-2.6.4-fix-autotools-fiac.patch"
 
 S = "${WORKDIR}/glib-${PV}"
 

--========GMX205471288097749389905--
