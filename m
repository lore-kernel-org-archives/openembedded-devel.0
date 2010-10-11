Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1P5BAe-0003jz-Id
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 07:43:38 +0200
Received: from localhost.localdomain (c-76-105-143-140.hsd1.or.comcast.net
	[76.105.143.140])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id CAF5E3045A;
	Mon, 11 Oct 2010 01:43:04 -0400 (EDT)
From: Scott Garman <sgarman@zenlinux.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Oct 2010 22:42:58 -0700
Message-Id: <1286775778-1446-1-git-send-email-sgarman@zenlinux.com>
X-Mailer: git-send-email 1.6.3.3
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: CAF5E3045A.B47E4
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: sgarman@zenlinux.com
X-SA-Exim-Connect-IP: 207.192.74.254
X-SA-Exim-Mail-From: sgarman@zenlinux.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Scott Garman <sgarman@zenlinux.com>
Subject: [PATCH] cpio: update 2.5 to 2.11
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
X-List-Received-Date: Mon, 11 Oct 2010 05:43:38 -0000

Signed-off-by: Scott Garman <sgarman@zenlinux.com>
---
 recipes/cpio/cpio-2.11/statdef.patch |   15 ++++++++
 recipes/cpio/cpio_2.11.bb            |   42 +++++++++++++++++++++++
 recipes/cpio/cpio_2.5.bb             |   42 -----------------------
 recipes/cpio/files/install.patch     |   61 ----------------------------------
 4 files changed, 57 insertions(+), 103 deletions(-)
 create mode 100644 recipes/cpio/cpio-2.11/statdef.patch
 create mode 100644 recipes/cpio/cpio_2.11.bb
 delete mode 100644 recipes/cpio/cpio_2.5.bb
 delete mode 100644 recipes/cpio/files/install.patch

diff --git a/recipes/cpio/cpio-2.11/statdef.patch b/recipes/cpio/cpio-2.11/statdef.patch
new file mode 100644
index 0000000..059976c
--- /dev/null
+++ b/recipes/cpio/cpio-2.11/statdef.patch
@@ -0,0 +1,15 @@
+# Avoid multiple stat definitions
+# Patch taken from cpio mailing list posting 2010-03-19
+#
+# Signed-off-by: Scott Garman <sgarman@zenlinux.com>
+
+diff -urN cpio-2.11.orig/src/filetypes.h cpio-2.11/src/filetypes.h
+--- cpio-2.11.orig/src/filetypes.h	2010-02-12 02:19:23.000000000 -0800
++++ cpio-2.11/src/filetypes.h	2010-07-23 13:17:25.000000000 -0700
+@@ -82,4 +82,6 @@
+ #define lstat stat
+ #endif
+ int lstat ();
++#ifndef stat
+ int stat ();
++#endif
diff --git a/recipes/cpio/cpio_2.11.bb b/recipes/cpio/cpio_2.11.bb
new file mode 100644
index 0000000..42b3676
--- /dev/null
+++ b/recipes/cpio/cpio_2.11.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "GNU cpio is a program to manage archives of files."
+HOMEPAGE = "http://www.gnu.org/software/cpio/"
+SECTION = "console"
+LICENSE = "GPLv3"
+PR = "r0"
+
+DEPENDS = "texinfo-native"
+
+SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
+           file://statdef.patch \
+          "
+
+SRC_URI[md5sum] = "1112bb6c45863468b5496ba128792f6c"
+SRC_URI[sha256sum] = "601b1d774cd6e4cd39416203c91ec59dbd65dd27d79d75e1a9b89497ea643978"
+
+inherit autotools gettext
+
+do_install () {
+    autotools_do_install
+    install -d ${D}${base_bindir}/
+    mv "${D}${bindir}/cpio" "${D}${base_bindir}/cpio.${PN}"
+    case ${TARGET_OS} in
+        *-uclibc*) ;;
+        *) mv "${D}${libexecdir}/rmt" "${D}${libexecdir}/rmt.${PN}" ;;
+    esac
+}
+
+pkg_postinst_${PN} () {
+    update-alternatives --install ${base_bindir}/cpio cpio cpio.${PN} 100
+    if [ -f ${libexecdir}/rmt.${PN} ]
+    then
+        update-alternatives --install ${libexecdir}/rmt rmt rmt.${PN} 50
+    fi
+}
+
+pkg_prerm_${PN} () {
+    update-alternatives --remove cpio cpio.${PN}
+    if [ -f ${libexecdir}/rmt.${PN} ]
+    then
+        update-alternatives --remove rmt rmt.${PN}
+    fi
+}
diff --git a/recipes/cpio/cpio_2.5.bb b/recipes/cpio/cpio_2.5.bb
deleted file mode 100644
index b4504ba..0000000
--- a/recipes/cpio/cpio_2.5.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-DESCRIPTION = "GNU cpio is a program to manage archives of files."
-HOMEPAGE = "http://www.gnu.org/software/cpio/"
-SECTION = "console"
-LICENSE = "GPL"
-PR = "r5"
-
-DEPENDS += " texinfo-native "
-
-SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
-	   file://install.patch"
-S = "${WORKDIR}/cpio-${PV}"
-
-inherit autotools
-
-do_install () {
-	autotools_do_install
-	install -d ${D}${base_bindir}/
-	mv "${D}${bindir}/cpio" "${D}${base_bindir}/cpio.${PN}"
-	case ${TARGET_OS} in
-		*-uclibc*) ;;
-		*) mv "${D}${libexecdir}/rmt" "${D}${libexecdir}/rmt.${PN}" ;;
-	esac
-}
-
-pkg_postinst_${PN} () {
-	update-alternatives --install ${base_bindir}/cpio cpio cpio.${PN} 100
-	if [ -f ${libexecdir}/rmt.${PN} ]
-	then
-		update-alternatives --install ${libexecdir}/rmt rmt rmt.${PN} 50
-	fi
-}
-
-pkg_prerm_${PN} () {
-	update-alternatives --remove cpio cpio.${PN}
-	if [ -f ${libexecdir}/rmt.${PN} ]
-	then
-		update-alternatives --remove rmt rmt.${PN}
-	fi
-}
-
-SRC_URI[md5sum] = "e02859af1bbbbd73fcbf757acb57e0a4"
-SRC_URI[sha256sum] = "dbf79293d0cafa7d7a3a266c2b0b90c00d556e7b3185d4243c74153291da24c8"
diff --git a/recipes/cpio/files/install.patch b/recipes/cpio/files/install.patch
deleted file mode 100644
index 3554156..0000000
--- a/recipes/cpio/files/install.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- cpio-2.5/Makefile.in~install.patch
-+++ cpio-2.5/Makefile.in
-@@ -70,6 +70,7 @@
- # Prefix for each installed man page, normally empty or `g'.
- manprefix = 
- 
-+DESTDIR =
- 
- # Where to install the cpio and mt executables.
- bindir = @bindir@
-@@ -123,19 +124,19 @@
- 	$(CC) -c $(CPPFLAGS) $(DEFS) -I$(srcdir) $(CFLAGS) $<
- 
- install:: installdirs all $(srcdir)/cpio.1 $(srcdir)/mt.1
--	$(INSTALL_PROGRAM) cpio $(bindir)/$(binprefix)cpio
--	test ! -f mt || $(INSTALL_PROGRAM) mt $(bindir)/$(binprefix)mt
--	-test ! -f rmt || $(INSTALL_PROGRAM) rmt $(libexecdir)/rmt
--	-$(INSTALL_DATA) $(srcdir)/cpio.1 $(mandir)/$(manprefix)cpio.$(manext)
--	-test ! -f mt || $(INSTALL_DATA) $(srcdir)/mt.1 $(mandir)/$(manprefix)mt.$(manext)
-+	$(INSTALL_PROGRAM) -D cpio $(DESTDIR)$(bindir)/$(binprefix)cpio
-+	test ! -f mt || $(INSTALL_PROGRAM) -D mt $(DESTDIR)$(bindir)/$(binprefix)mt
-+	-test ! -f rmt || $(INSTALL_PROGRAM) -D rmt $(DESTDIR)$(libexecdir)/rmt
-+	-$(INSTALL_DATA) -D $(srcdir)/cpio.1 $(DESTDIR)$(mandir)/$(manprefix)cpio.$(manext)
-+	-test ! -f mt || $(INSTALL_DATA) -D $(srcdir)/mt.1 $(DESTDIR)$(mandir)/$(manprefix)mt.$(manext)
- 
- installdirs:
--	$(srcdir)/mkinstalldirs $(bindir) $(libexecdir) $(mandir) $(infodir)
-+	$(srcdir)/mkinstalldirs $(DESTDIR)/$(bindir) $(DESTDIR)/$(libexecdir) $(DESTDIR)/$(mandir) $(DESTDIR)/$(infodir)
- 
- uninstall::
--	cd $(bindir); rm -f $(binprefix)cpio $(binprefix)mt
--	-rm -f $(libexecdir)/rmt
--	cd $(mandir); rm -f $(manprefix)cpio.$(manext) $(manprefix)mt.$(manext)
-+	cd $(DESTDIR)$(bindir); rm -f $(binprefix)cpio $(binprefix)mt
-+	-rm -f $(DESTDIR)$(libexecdir)/rmt
-+	cd $(DESTDIR)$(mandir); rm -f $(manprefix)cpio.$(manext) $(manprefix)mt.$(manext)
- 
- check:
- 	@echo No tests are supplied.
-@@ -186,14 +187,14 @@
- 
- install-info: $(INFO_DEPS)
- 	for file in *.info*; do \
--	  $(INSTALL_DATA) $$file $(infodir)/$$file; \
-+	  $(INSTALL_DATA) -D $$file $(DESTDIR)$(infodir)/$$file; \
- 	done
- 
- uninstall:: uninstall-info
- 
- uninstall-info:
- 	for file in *.info*; do \
--	  rm -f $(infodir)/$$file; \
-+	  rm -f $(DESTDIR)$(infodir)/$$file; \
- 	done
- 
- clean:
-- 
1.6.3.3



