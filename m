Received: from smtp.tibbo.com ([81.171.42.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvorkin@tibbo.com>) id 1QE0bZ-0003DZ-8D
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Apr 2011 16:48:09 +0200
Received: (qmail 17688 invoked by uid 508); 24 Apr 2011 18:51:28 +0400
Received: from dvhome.kansstel.ru (HELO localhost.localdomain) (79.171.10.83)
	by smtp.tibbo.com with SMTP; 24 Apr 2011 18:51:28 +0400
From: Dvorkin Dmitry <dvorkin@tibbo.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Apr 2011 18:46:33 +0400
Message-Id: <1303656393-27182-1-git-send-email-dvorkin@tibbo.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] crda with wireless-regdb separated
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
X-List-Received-Date: Sun, 24 Apr 2011 14:48:09 -0000

Signed-off-by: Dvorkin Dmitry <dvorkin@tibbo.com>
---
 recipes/crda/crda_1.1.1.bb                         |   24 ++++++--------
 recipes/crda/files/Makefile.0.patch                |   19 +++++++++++
 recipes/crda/files/Makefile.1.patch                |   33 ++++++++++++++++++++
 recipes/crda/files/key2pub.py.patch                |   10 ++++++
 .../wireless-regdb/wireless-regdb_2010.11.24.bb    |   19 +++++++++++
 5 files changed, 91 insertions(+), 14 deletions(-)
 create mode 100644 recipes/crda/files/Makefile.0.patch
 create mode 100644 recipes/crda/files/Makefile.1.patch
 create mode 100644 recipes/crda/files/key2pub.py.patch
 create mode 100644 recipes/wireless-regdb/wireless-regdb_2010.11.24.bb

diff --git a/recipes/crda/crda_1.1.1.bb b/recipes/crda/crda_1.1.1.bb
index cc19b90..7d32d8b 100644
--- a/recipes/crda/crda_1.1.1.bb
+++ b/recipes/crda/crda_1.1.1.bb
@@ -6,28 +6,24 @@ LICENSE = "ISC"
 PR = "r1"
 
 DEPENDS = "libgcrypt libnl python-native python-m2crypto-native"
-RDEPENDS_${PN} = "udev"
+RDEPENDS_${PN} = "udev wireless-regdb"
 
-SRC_URI = "http://wireless.kernel.org/download/crda/${P}.tar.bz2;name=crda \
-	http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2009.11.25-regulatory.bin;name=reg \
+SRC_URI = "http://wireless.kernel.org/download/crda/${P}.tar.bz2;name=crda"
+
+SRC_URI_append = " \
+	file://${FILE_DIRNAME}/files/Makefile.0.patch;apply=yes \
+	file://${FILE_DIRNAME}/files/Makefile.1.patch;apply=yes \
+	file://${FILE_DIRNAME}/files/key2pub.py.patch;apply=yes \
 	"
 
-do_compile() {
-	oe_runmake all_noverify
-}
+CFLAGS =+ " -DCONFIG_LIBNL20"
 
 do_install() {
 	oe_runmake DESTDIR=${D} install
-	install -d ${D}/usr/lib/crda/
-	install -m 0644 ${WORKDIR}/2009.11.25-regulatory.bin ${D}/usr/lib/crda/regulatory.bin
 }
 
 SRC_URI[crda.md5sum] = "5fc77af68b3e21736b8ef2f8b061c810"
 SRC_URI[crda.sha256sum] = "59b4760da44a8f803caeaaa7fb97e0c6bd3f35f40445b28258e7f14c2fbe13b5"
-SRC_URI[reg.md5sum] = "873b5c55a26c8ba7674e083f51cb10aa"
-SRC_URI[reg.sha256sum] = "3ac77fa4d8034e4f5bc484adc4b073c3636dea26803e5e695cc54c15b629154a"
 
-FILES_${PN} += "\
-	/lib/udev/rules.d/85-regulatory.rules \
-	/usr/lib/crda/regulatory.bin \
-	"
+FILES_${PN} += "/etc/udev/rules.d/85-regulatory.rules"
+
diff --git a/recipes/crda/files/Makefile.0.patch b/recipes/crda/files/Makefile.0.patch
new file mode 100644
index 0000000..c684251
--- /dev/null
+++ b/recipes/crda/files/Makefile.0.patch
@@ -0,0 +1,19 @@
+--- a/Makefile	2010-01-25 20:43:20.000000000 +0300
++++ a/Makefile	2010-10-11 21:29:25.803864675 +0400
+@@ -14,7 +14,7 @@
+ UDEV_LEVEL=$(CRDA_UDEV_LEVEL)-
+ # You can customize this if your distributions uses
+ # a different location.
+-UDEV_RULE_DIR?=/lib/udev/rules.d/
++UDEV_RULE_DIR?=/etc/udev/rules.d/
+ 
+ # If your distribution requires a custom pubkeys dir
+ # you must update this variable to reflect where the
+@@ -109,7 +109,6 @@
+ 
+ verify: $(REG_BIN) regdbdump
+ 	$(NQ) '  CHK  $(REG_BIN)'
+-	$(Q)./regdbdump $(REG_BIN) >/dev/null
+ 
+ %.gz: %
+ 	@$(NQ) ' GZIP' $<
diff --git a/recipes/crda/files/Makefile.1.patch b/recipes/crda/files/Makefile.1.patch
new file mode 100644
index 0000000..08126ec
--- /dev/null
+++ b/recipes/crda/files/Makefile.1.patch
@@ -0,0 +1,33 @@
+--- a/Makefile	2011-02-20 12:54:40.000000000 +0300
++++ a/Makefile	2011-02-20 22:59:18.055756409 +0300
+@@ -117,9 +117,9 @@
+ install: crda crda.8.gz regdbdump.8.gz
+ 	$(NQ) '  INSTALL  crda'
+ 	$(Q)$(MKDIR) $(DESTDIR)/$(SBINDIR)
+-	$(Q)$(INSTALL) -m 755 -t $(DESTDIR)/$(SBINDIR) crda
++	$(Q)$(INSTALL) -m 755 crda $(DESTDIR)/$(SBINDIR)
+ 	$(NQ) '  INSTALL  regdbdump'
+-	$(Q)$(INSTALL) -m 755 -t $(DESTDIR)/$(SBINDIR) regdbdump
++	$(Q)$(INSTALL) -m 755 regdbdump $(DESTDIR)/$(SBINDIR)
+ 	$(NQ) '  INSTALL  $(UDEV_LEVEL)regulatory.rules'
+ 	$(Q)$(MKDIR) $(DESTDIR)/$(UDEV_RULE_DIR)/
+ 	@# This removes the old rule you may have, we were not
+@@ -127,14 +127,13 @@
+ 	$(Q)rm -f $(DESTDIR)/etc/udev/rules.d/regulatory.rules
+ 	$(Q)sed 's:$$(SBINDIR):$(SBINDIR):' udev/regulatory.rules > udev/regulatory.rules.parsed
+ 	$(Q)ln -sf regulatory.rules.parsed udev/$(UDEV_LEVEL)regulatory.rules
+-	$(Q)$(INSTALL) -m 644 -t \
+-		$(DESTDIR)/$(UDEV_RULE_DIR)/ \
+-		udev/$(UDEV_LEVEL)regulatory.rules
++	$(Q)$(INSTALL) -m 644 udev/$(UDEV_LEVEL)regulatory.rules \
++		$(DESTDIR)/$(UDEV_RULE_DIR)/
+ 	$(NQ) '  INSTALL  crda.8.gz'
+ 	$(Q)$(MKDIR) $(DESTDIR)$(MANDIR)/man8/
+-	$(Q)$(INSTALL) -m 644 -t $(DESTDIR)/$(MANDIR)/man8/ crda.8.gz
++	$(Q)$(INSTALL) -m 644 crda.8.gz $(DESTDIR)/$(MANDIR)/man8/
+ 	$(NQ) '  INSTALL  regdbdump.8.gz'
+-	$(Q)$(INSTALL) -m 644 -t $(DESTDIR)/$(MANDIR)/man8/ regdbdump.8.gz
++	$(Q)$(INSTALL) -m 644 regdbdump.8.gz $(DESTDIR)/$(MANDIR)/man8/
+ 
+ clean:
+ 	$(Q)rm -f crda regdbdump intersect *.o *~ *.pyc keys-*.c *.gz \
diff --git a/recipes/crda/files/key2pub.py.patch b/recipes/crda/files/key2pub.py.patch
new file mode 100644
index 0000000..fd293b6
--- /dev/null
+++ b/recipes/crda/files/key2pub.py.patch
@@ -0,0 +1,10 @@
+--- a/utils/key2pub.py	2010-01-25 20:43:20.000000000 +0300
++++ a/utils/key2pub.py	2010-10-11 21:27:38.122615099 +0400
+@@ -1,6 +1,7 @@
+ #!/usr/bin/env python
+ 
+ import sys
++sys.path.append('/usr/lib/python2.6/site-packages/')
+ try:
+        from M2Crypto import RSA
+ except ImportError, e:
diff --git a/recipes/wireless-regdb/wireless-regdb_2010.11.24.bb b/recipes/wireless-regdb/wireless-regdb_2010.11.24.bb
new file mode 100644
index 0000000..22e4067
--- /dev/null
+++ b/recipes/wireless-regdb/wireless-regdb_2010.11.24.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Wireless Central Regulatory Domain Agent Database"
+HOMEPAGE = "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
+SECTION = "base"
+PRIORITY = "optional"
+LICENSE = "ISC"
+PR = "r1"
+
+SRC_URI = "http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/${PV}-regulatory.bin;name=reg"
+
+do_install() {
+	install -d ${D}/usr/lib/crda/
+	install -m 0644 ${WORKDIR}/${PV}-regulatory.bin ${D}/usr/lib/crda/regulatory.bin
+}
+
+SRC_URI[reg.md5sum] = "001b69bba19486439031377e09229f9c"
+SRC_URI[reg.sha256sum] = "80630bba74ca22d335befedc607fcc36a1f33a488869b12ff3084535be746096"
+
+FILES_${PN} = "/usr/lib/crda/regulatory.bin"
+
-- 
1.7.3.4



