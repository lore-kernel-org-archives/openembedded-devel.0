Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RYzIz-0007Qs-9t
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 13:11:57 +0100
Received: by ggnh1 with SMTP id h1so3129706ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2011 04:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=M1JGF+xl4WRNEgy9ZFI/qhNutHW32x+Sq/A+K67u+9M=;
	b=wl0gM8kmvZmKEUMUvI1n3icYP50dCH3MCYoe1XCmuhkMJntQ58Hk3G15Zgq7nj82H6
	jO25597Ji6ijCdEhxfAq9YzaacKd1uImLzEMqbkwRwTQ9f+sCTGPqwy0IVLAQciNPkIg
	DxZB0Fn7Zh/2qGj6wJLLIEXtA0j+8+BaibtWE=
Received: by 10.101.9.3 with SMTP id m3mr1683674ani.130.1323432302969;
	Fri, 09 Dec 2011 04:05:02 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l27sm23409063ani.21.2011.12.09.04.05.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 04:05:02 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Dec 2011 12:04:50 +0000
Message-Id: <0ecbf0fff82e8b143c6f415a01424b58735bba68.1323432272.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <9641b1aa618783af7dd82f10d4c1a6ae4d693d15.1323432272.git.otavio@ossystems.com.br>
References: <9641b1aa618783af7dd82f10d4c1a6ae4d693d15.1323432272.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323432272.git.otavio@ossystems.com.br>
References: <cover.1323432272.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/2] dropbear: move dropbear-systemd to a bbappend
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
X-List-Received-Date: Fri, 09 Dec 2011 12:11:57 -0000

While on it, the recipe has been updated to use systemd.bbclass and
cleaned up.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-core/dropbear/dropbear-systemd_v1.bb   |   40 --------------------
 .../{dropbear-systemd => dropbear}/dropbear.socket |    0
 .../dropbear@.service                              |    0
 .../dropbearkey.service                            |    0
 .../dropbear/dropbear_2011.54.bbappend             |   33 ++++++++++++++++
 5 files changed, 33 insertions(+), 40 deletions(-)
 delete mode 100644 meta-oe/recipes-core/dropbear/dropbear-systemd_v1.bb
 rename meta-oe/recipes-core/dropbear/{dropbear-systemd => dropbear}/dropbear.socket (100%)
 rename meta-oe/recipes-core/dropbear/{dropbear-systemd => dropbear}/dropbear@.service (100%)
 rename meta-oe/recipes-core/dropbear/{dropbear-systemd => dropbear}/dropbearkey.service (100%)
 create mode 100644 meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend

diff --git a/meta-oe/recipes-core/dropbear/dropbear-systemd_v1.bb b/meta-oe/recipes-core/dropbear/dropbear-systemd_v1.bb
deleted file mode 100644
index b46c0e2..0000000
--- a/meta-oe/recipes-core/dropbear/dropbear-systemd_v1.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-DESCRIPTION = "Socket based activation for dropbear ssh server"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
-
-inherit allarch
-
-SRC_URI = "file://dropbearkey.service \
-           file://dropbear@.service \
-           file://dropbear.socket \
-          "
-
-do_configure() {
-	:
-}
-
-do_compile() {
-	:
-}
-
-do_install() {
-	install -d ${D}${base_libdir}/systemd/system
-	install -m 0644 ${WORKDIR}/dropbear*.* ${D}${base_libdir}/systemd/system/
-}
-
-pkg_postinst_${PN} () {
-if test "x$D" != "x"; then
-	exit 1
-fi
-systemctl enable dropbear.socket
-ln -sf /dev/null ${base_libdir}/systemd/system/dropbear.service
-}
-
-pkg_postrm_${PN} () {
-systemctl disable dropbear.socket
-rm -f ${base_libdir}/systemd/system/dropbear.service
-}
-
-RDEPENDS_${PN} = "systemd dropbear"
-FILES_${PN} = "${base_libdir}/systemd/system"
-
diff --git a/meta-oe/recipes-core/dropbear/dropbear-systemd/dropbear.socket b/meta-oe/recipes-core/dropbear/dropbear/dropbear.socket
similarity index 100%
rename from meta-oe/recipes-core/dropbear/dropbear-systemd/dropbear.socket
rename to meta-oe/recipes-core/dropbear/dropbear/dropbear.socket
diff --git a/meta-oe/recipes-core/dropbear/dropbear-systemd/dropbear@.service b/meta-oe/recipes-core/dropbear/dropbear/dropbear@.service
similarity index 100%
rename from meta-oe/recipes-core/dropbear/dropbear-systemd/dropbear@.service
rename to meta-oe/recipes-core/dropbear/dropbear/dropbear@.service
diff --git a/meta-oe/recipes-core/dropbear/dropbear-systemd/dropbearkey.service b/meta-oe/recipes-core/dropbear/dropbear/dropbearkey.service
similarity index 100%
rename from meta-oe/recipes-core/dropbear/dropbear-systemd/dropbearkey.service
rename to meta-oe/recipes-core/dropbear/dropbear/dropbearkey.service
diff --git a/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend b/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
new file mode 100644
index 0000000..664b6de
--- /dev/null
+++ b/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
@@ -0,0 +1,33 @@
+inherit systemd
+
+PR .= ".meta-oe.1"
+
+# look for files in the layer first
+FILESEXTRAPATHS := "${THISDIR}/${PN}"
+
+SRC_URI += "file://dropbearkey.service \
+            file://dropbear@.service \
+            file://dropbear.socket"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE_${PN}-systemd = "dropbear.socket"
+
+do_install_append() {
+	install -d ${D}${base_libdir}/systemd/system
+	install -m 0644 ${WORKDIR}/dropbearkey.service ${D}${base_libdir}/systemd/system/
+	install -m 0644 ${WORKDIR}/dropbear@.service ${D}${base_libdir}/systemd/system/
+	install -m 0644 ${WORKDIR}/dropbear.socket ${D}${base_libdir}/systemd/system/
+}
+
+PACKAGES += "${PN}-systemd"
+
+RDEPENDS_${PN}-systemd += "dropbear"
+FILES_${PN}-systemd = "${base_libdir}/systemd"
+
+pkg_postinst_${PN}-systemd_append() {
+ln -sf /dev/null $D${base_libdir}/systemd/system/dropbear.service
+}
+
+pkg_postrm_${PN}-systemd_append() {
+rm -f ${base_libdir}/systemd/system/dropbear.service
+}
-- 
1.7.2.5



