Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2F36065CC1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 16:38:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Jul 2014 09:38:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,702,1400050800"; d="scan'208";a="546715904"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga001.jf.intel.com with ESMTP; 21 Jul 2014 09:38:11 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jul 2014 16:37:46 +0000
Message-Id: <492ad9c90e5dec4c274d2eda8a71ceced3cea4f2.1405960666.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH] i2c-tools: Remove i2c-tools, it's now in oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jul 2014 16:38:57 -0000

i2c-tools was added to oe-core in commit:
32ac58819580d359e22161be1abf62215d202250

Remove it from meta-openembedded.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 .../i2c-tools/i2c-tools-3.1.0/Module.mk            | 72 ----------------------
 .../recipes-support/i2c-tools/i2c-tools_3.1.0.bb   | 26 --------
 2 files changed, 98 deletions(-)
 delete mode 100644 meta-oe/recipes-support/i2c-tools/i2c-tools-3.1.0/Module.mk
 delete mode 100644 meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb

diff --git a/meta-oe/recipes-support/i2c-tools/i2c-tools-3.1.0/Module.mk b/meta-oe/recipes-support/i2c-tools/i2c-tools-3.1.0/Module.mk
deleted file mode 100644
index fcaf72f..0000000
--- a/meta-oe/recipes-support/i2c-tools/i2c-tools-3.1.0/Module.mk
+++ /dev/null
@@ -1,72 +0,0 @@
-# EEPROMER
-#
-# Licensed under the GNU General Public License.
-
-EEPROMER_DIR	:= eepromer
-
-EEPROMER_CFLAGS	:= -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast-qual \
-		   -Wcast-align -Wwrite-strings -Wnested-externs -Winline \
-		   -W -Wundef -Wmissing-prototypes -Iinclude
-
-EEPROMER_TARGETS	:= eepromer eeprom eeprog
-
-#
-# Programs
-#
-
-$(EEPROMER_DIR)/eepromer: $(EEPROMER_DIR)/eepromer.o
-	$(CC) $(LDFLAGS) -o $@ $^
-
-$(EEPROMER_DIR)/eeprom: $(EEPROMER_DIR)/eeprom.o
-	$(CC) $(LDFLAGS) -o $@ $^
-
-$(EEPROMER_DIR)/eeprog: $(EEPROMER_DIR)/eeprog.o $(EEPROMER_DIR)/24cXX.o 
-	$(CC) $(LDFLAGS) -o $@ $^
-
-#
-# Objects
-#
-
-$(EEPROMER_DIR)/eepromer.o: $(EEPROMER_DIR)/eepromer.c
-	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@
-
-$(EEPROMER_DIR)/eeprom.o: $(EEPROMER_DIR)/eeprom.c
-	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@
-
-$(EEPROMER_DIR)/eeprog.o: $(EEPROMER_DIR)/eeprog.c
-	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@
-
-$(EEPROMER_DIR)/24cXX.o: $(EEPROMER_DIR)/24cXX.c
-	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@
-
-#
-# Commands
-#
-
-all-eepromer: $(addprefix $(EEPROMER_DIR)/,$(EEPROMER_TARGETS))
-
-strip-eepromer: $(addprefix $(EEPROMER_DIR)/,$(EEPROMER_TARGETS))
-	strip $(addprefix $(EEPROMER_DIR)/,$(EEPROMER_TARGETS))
-
-clean-eepromer:
-	$(RM) $(addprefix $(EEPROMER_DIR)/,*.o $(EEPROMER_TARGETS))
-
-install-eepromer: $(addprefix $(EEPROMER_DIR)/,$(EEPROMER_TARGETS))
-	$(INSTALL_DIR) $(DESTDIR)$(sbindir) $(DESTDIR)$(man8dir)
-	for program in $(EEPROMER_TARGETS) ; do \
-	$(INSTALL_PROGRAM) $(EEPROMER_DIR)/$$program $(DESTDIR)$(sbindir) ; done
-
-uninstall-eepromer:
-	for program in $(EEPROMER_TARGETS) ; do \
-	$(RM) $(DESTDIR)$(sbindir)/$$program ; \
-	$(RM) $(DESTDIR)$(man8dir)/$$program.8 ; done
-
-all: all-eepromer
-
-strip: strip-eepromer
-
-clean: clean-eepromer
-
-install: install-eepromer
-
-uninstall: uninstall-eepromer
diff --git a/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb b/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb
deleted file mode 100644
index b8be9ed..0000000
--- a/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "Set of i2c tools for linux"
-SECTION = "base"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-RDEPENDS_${PN} += "perl"
-
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/i2c-tools/i2c-tools-3.1.0.tar.bz2/f15019e559e378c6e9d5d6299a00df21/i2c-tools-${PV}.tar.bz2 \
-           file://Module.mk \
-"
-SRC_URI[md5sum] = "f15019e559e378c6e9d5d6299a00df21"
-SRC_URI[sha256sum] = "960023f61de292c6dd757fcedec4bffa7dd036e8594e24b26a706094ca4c142a"
-
-inherit autotools-brokensep
-
-do_compile_prepend() {
-    cp ${WORKDIR}/Module.mk ${S}/eepromer/
-    sed -i 's#/usr/local#/usr#' ${S}/Makefile
-    echo "include eepromer/Module.mk" >> ${S}/Makefile
-}
-
-do_install_append() {
-    install -d ${D}${includedir}/linux
-    install -m 0644 include/linux/i2c-dev.h ${D}${includedir}/linux/i2c-dev-user.h
-    rm -f ${D}${includedir}/linux/i2c-dev.h
-}
-- 
2.0.0


