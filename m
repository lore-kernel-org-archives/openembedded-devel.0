Received: from mail-pb0-f46.google.com ([209.85.160.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TyzlE-0002kJ-Gl
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jan 2013 08:01:08 +0100
Received: by mail-pb0-f46.google.com with SMTP id uo15so601600pbc.19
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2013 22:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=WKe1xnj/UKVgOl+kx7aanq8qryvWWbwgn0pHSn6GBR0=;
	b=XxOrY+7+fgoiRAPvFs5dEFAm0IPbbH3BqoIYL05nfcWepMaYjsc4YhNlpDbCiW4Zce
	GSNBXdpZ7QJfxoJX0nd/WwVYqCXLmNMwrrsJ2LButoUq+pW1zIfzEZ5dJUP2sxQbZ7mH
	y8fBXndPXJAakwk7GHrcx9kRxSvLhCvfm5PC9tGIkWsv/WcsuPPU/Ptf7hXxysKBLniC
	XKi8iPvmdGj/9iiWwtFva32T9WysfBEfxcwks0Pf7oCm9G/7O/Up98qsdvEVGJ1f04ex
	n1oJlFqYy3zLUZrKo86fJR8BQ7R+JdfOB39dRUwVfbhXLGQ/9HypUoe/AN+nckvxVULw
	3qjw==
X-Received: by 10.68.204.103 with SMTP id kx7mr20495463pbc.33.1359182731970;
	Fri, 25 Jan 2013 22:45:31 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id ux4sm2086673pbc.25.2013.01.25.22.45.30
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 22:45:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jan 2013 22:45:14 -0800
Message-Id: <1359182715-3063-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH 1/2] i2c-tools: Upgrade to 3.0.3 -> 3.1.0
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
X-List-Received-Date: Sat, 26 Jan 2013 07:01:17 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../i2c-tools/i2c-tools-3.0.3/Module.mk            |   72 --------------------
 .../i2c-tools/i2c-tools-3.1.0/Module.mk            |   72 ++++++++++++++++++++
 .../recipes-support/i2c-tools/i2c-tools_3.0.3.bb   |   24 -------
 .../recipes-support/i2c-tools/i2c-tools_3.1.0.bb   |   26 +++++++
 4 files changed, 98 insertions(+), 96 deletions(-)
 delete mode 100644 meta-oe/recipes-support/i2c-tools/i2c-tools-3.0.3/Module.mk
 create mode 100644 meta-oe/recipes-support/i2c-tools/i2c-tools-3.1.0/Module.mk
 delete mode 100644 meta-oe/recipes-support/i2c-tools/i2c-tools_3.0.3.bb
 create mode 100644 meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb

diff --git a/meta-oe/recipes-support/i2c-tools/i2c-tools-3.0.3/Module.mk b/meta-oe/recipes-support/i2c-tools/i2c-tools-3.0.3/Module.mk
deleted file mode 100644
index fcaf72f..0000000
--- a/meta-oe/recipes-support/i2c-tools/i2c-tools-3.0.3/Module.mk
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
diff --git a/meta-oe/recipes-support/i2c-tools/i2c-tools-3.1.0/Module.mk b/meta-oe/recipes-support/i2c-tools/i2c-tools-3.1.0/Module.mk
new file mode 100644
index 0000000..fcaf72f
--- /dev/null
+++ b/meta-oe/recipes-support/i2c-tools/i2c-tools-3.1.0/Module.mk
@@ -0,0 +1,72 @@
+# EEPROMER
+#
+# Licensed under the GNU General Public License.
+
+EEPROMER_DIR	:= eepromer
+
+EEPROMER_CFLAGS	:= -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast-qual \
+		   -Wcast-align -Wwrite-strings -Wnested-externs -Winline \
+		   -W -Wundef -Wmissing-prototypes -Iinclude
+
+EEPROMER_TARGETS	:= eepromer eeprom eeprog
+
+#
+# Programs
+#
+
+$(EEPROMER_DIR)/eepromer: $(EEPROMER_DIR)/eepromer.o
+	$(CC) $(LDFLAGS) -o $@ $^
+
+$(EEPROMER_DIR)/eeprom: $(EEPROMER_DIR)/eeprom.o
+	$(CC) $(LDFLAGS) -o $@ $^
+
+$(EEPROMER_DIR)/eeprog: $(EEPROMER_DIR)/eeprog.o $(EEPROMER_DIR)/24cXX.o 
+	$(CC) $(LDFLAGS) -o $@ $^
+
+#
+# Objects
+#
+
+$(EEPROMER_DIR)/eepromer.o: $(EEPROMER_DIR)/eepromer.c
+	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@
+
+$(EEPROMER_DIR)/eeprom.o: $(EEPROMER_DIR)/eeprom.c
+	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@
+
+$(EEPROMER_DIR)/eeprog.o: $(EEPROMER_DIR)/eeprog.c
+	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@
+
+$(EEPROMER_DIR)/24cXX.o: $(EEPROMER_DIR)/24cXX.c
+	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@
+
+#
+# Commands
+#
+
+all-eepromer: $(addprefix $(EEPROMER_DIR)/,$(EEPROMER_TARGETS))
+
+strip-eepromer: $(addprefix $(EEPROMER_DIR)/,$(EEPROMER_TARGETS))
+	strip $(addprefix $(EEPROMER_DIR)/,$(EEPROMER_TARGETS))
+
+clean-eepromer:
+	$(RM) $(addprefix $(EEPROMER_DIR)/,*.o $(EEPROMER_TARGETS))
+
+install-eepromer: $(addprefix $(EEPROMER_DIR)/,$(EEPROMER_TARGETS))
+	$(INSTALL_DIR) $(DESTDIR)$(sbindir) $(DESTDIR)$(man8dir)
+	for program in $(EEPROMER_TARGETS) ; do \
+	$(INSTALL_PROGRAM) $(EEPROMER_DIR)/$$program $(DESTDIR)$(sbindir) ; done
+
+uninstall-eepromer:
+	for program in $(EEPROMER_TARGETS) ; do \
+	$(RM) $(DESTDIR)$(sbindir)/$$program ; \
+	$(RM) $(DESTDIR)$(man8dir)/$$program.8 ; done
+
+all: all-eepromer
+
+strip: strip-eepromer
+
+clean: clean-eepromer
+
+install: install-eepromer
+
+uninstall: uninstall-eepromer
diff --git a/meta-oe/recipes-support/i2c-tools/i2c-tools_3.0.3.bb b/meta-oe/recipes-support/i2c-tools/i2c-tools_3.0.3.bb
deleted file mode 100644
index 021090c..0000000
--- a/meta-oe/recipes-support/i2c-tools/i2c-tools_3.0.3.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "Set of i2c tools for linux"
-SECTION = "base"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-SRC_URI = "http://dl.lm-sensors.org/i2c-tools/releases/i2c-tools-${PV}.tar.bz2 \
-           file://Module.mk \
-          "
-SRC_URI[md5sum] = "511376eed04455cdb277ef19c5f73bb4"
-SRC_URI[sha256sum] = "23b28e474741834e3f1b35b0686528769a13adc92d2ff5603cbda1d6bd5e5629"
-
-inherit autotools
-
-do_compile_prepend() {
-        cp ${WORKDIR}/Module.mk ${S}/eepromer/
-        sed -i 's#/usr/local#/usr#' Makefile
-        echo "include eepromer/Module.mk" >> Makefile
-}
-
-do_install_append() {
-        install -d ${D}${includedir}/linux
-        install -m 0644 include/linux/i2c-dev.h ${D}${includedir}/linux/i2c-dev-user.h
-	rm -f ${D}${includedir}/linux/i2c-dev.h
-}
diff --git a/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb b/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb
new file mode 100644
index 0000000..7589537
--- /dev/null
+++ b/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Set of i2c tools for linux"
+SECTION = "base"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+RDEPENDS += "perl"
+
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/i2c-tools/i2c-tools-3.1.0.tar.bz2/f15019e559e378c6e9d5d6299a00df21/i2c-tools-${PV}.tar.bz2 \
+           file://Module.mk \
+          "
+SRC_URI[md5sum] = "f15019e559e378c6e9d5d6299a00df21"
+SRC_URI[sha256sum] = "960023f61de292c6dd757fcedec4bffa7dd036e8594e24b26a706094ca4c142a"
+
+inherit autotools
+
+do_compile_prepend() {
+        cp ${WORKDIR}/Module.mk ${S}/eepromer/
+        sed -i 's#/usr/local#/usr#' Makefile
+        echo "include eepromer/Module.mk" >> Makefile
+}
+
+do_install_append() {
+        install -d ${D}${includedir}/linux
+        install -m 0644 include/linux/i2c-dev.h ${D}${includedir}/linux/i2c-dev-user.h
+	rm -f ${D}${includedir}/linux/i2c-dev.h
+}
-- 
1.7.9.5



