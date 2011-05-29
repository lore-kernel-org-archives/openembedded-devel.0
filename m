Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQo2b-00039A-Ue
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 00:00:57 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2550305fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 14:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=JWveJOxmfn1O1XlczpafbA0uOjeSaibMzkoSy2UQ0PY=;
	b=tHTv+IBCvBETmSWYiTj3Woti2x9WLV2jHibVLDxsW7ATEEtMITEUszOVZv9kv2apHE
	GQo4jVNuuVWJMVwbWnYpoDcTfN3s75D27G5qI08942B/ZEyExx3eYKbjNbAkjzGQkMto
	TTGmEMQBtNJBsmm97CtDnCFlv6ldF6f8a+XP0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=tALzRtWYJ/1i61EvmXD8ADmsuoRI7ieWmd3k2ENN/8T1vrk66EX+xZfcI53qkXP5GA
	woefEi/+lWlRdrVD26dhWohqd5lIsqxpz6e29JR+TlSAV7AfZ/1oJDuUIKrM/xlrbDk3
	iwkVG8wVOUy4XtEljUbdDp4VVnK+JLvSzZOug=
Received: by 10.223.57.142 with SMTP id c14mr32430fah.0.1306706270727;
	Sun, 29 May 2011 14:57:50 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id n15sm527155fag.18.2011.05.29.14.57.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 14:57:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 23:56:38 +0200
Message-Id: <9aa0705eec5314a09f04ead3b510c73a307b76b6.1306706130.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
References: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306706130.git.Martin.Jansa@gmail.com>
References: <cover.1306706130.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 13/14] i2c-tools: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Sun, 29 May 2011 22:01:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../i2c-tools/i2c-tools-3.0.3/Module.mk            |   72 ++++++++++++++++++++
 .../recipes-support/i2c-tools/i2c-tools_3.0.3.bb   |   24 +++++++
 2 files changed, 96 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/i2c-tools/i2c-tools-3.0.3/Module.mk
 create mode 100644 meta-oe/recipes-support/i2c-tools/i2c-tools_3.0.3.bb

diff --git a/meta-oe/recipes-support/i2c-tools/i2c-tools-3.0.3/Module.mk b/meta-oe/recipes-support/i2c-tools/i2c-tools-3.0.3/Module.mk
new file mode 100644
index 0000000..fcaf72f
--- /dev/null
+++ b/meta-oe/recipes-support/i2c-tools/i2c-tools-3.0.3/Module.mk
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
new file mode 100644
index 0000000..021090c
--- /dev/null
+++ b/meta-oe/recipes-support/i2c-tools/i2c-tools_3.0.3.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Set of i2c tools for linux"
+SECTION = "base"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SRC_URI = "http://dl.lm-sensors.org/i2c-tools/releases/i2c-tools-${PV}.tar.bz2 \
+           file://Module.mk \
+          "
+SRC_URI[md5sum] = "511376eed04455cdb277ef19c5f73bb4"
+SRC_URI[sha256sum] = "23b28e474741834e3f1b35b0686528769a13adc92d2ff5603cbda1d6bd5e5629"
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
1.7.5.rc3



