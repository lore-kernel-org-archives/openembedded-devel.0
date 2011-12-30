Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rgbsp-00067B-8F
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Dec 2011 13:48:27 +0100
Received: by ggnh1 with SMTP id h1so8885709ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2011 04:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=DzVsPezzC21tmjoSqidelF0WqRee18SIRmUEQfbt/8M=;
	b=RCcyg9SGelKqxzSqa8GUmA2PTxklmDsTUhW+Sz58E1AV4H8J3SI93P2q0mHdSoWk77
	h+U+kJiHTzfIpOIz+XLX8s0R4XxWhC5s9RstWc9JBhbzYr27jL1SSrY8KFdtEgabBrQc
	WtkDdDFQdNe2/P0p7iMqR2MCULScnhl4T/hLg=
Received: by 10.101.176.6 with SMTP id d6mr15708572anp.26.1325248869328;
	Fri, 30 Dec 2011 04:41:09 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id j21sm92455611ann.0.2011.12.30.04.41.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Dec 2011 04:41:08 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Dec 2011 12:40:54 +0000
Message-Id: <2eaa23a3419bfd9b5aea6c1f059242a38eb03608.1325248824.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325248824.git.otavio@ossystems.com.br>
References: <cover.1325248824.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325248824.git.otavio@ossystems.com.br>
References: <cover.1325248824.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/3] xserver-nodm-init: move systemd service to xserver-nodm-init-systemd
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
X-List-Received-Date: Fri, 30 Dec 2011 12:48:27 -0000

Move systemd service to xserver-nodm-init-systemd to be consistent
with other packages.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   30 +++++++++----------
 1 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
index 496b342..4d4ae4c 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
 
-PR = "r11"
+PR = "r12"
 
 SRC_URI = "file://xserver-nodm \
            file://xserver-nodm.service \
@@ -13,6 +13,15 @@ S = ${WORKDIR}
 
 inherit allarch
 
+inherit update-rc.d systemd
+
+INITSCRIPT_NAME = "xserver-nodm"
+INITSCRIPT_PARAMS = "start 01 5 2 . stop 01 0 1 6 ."
+INITSCRIPT_PARAMS_shr = "start 90 5 2 . stop 90 0 1 6 ."
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE_${PN}-systemd = "xserver-nodm.service"
+
 do_install() {
 	install -d ${D}${sysconfdir}/init.d
 	install xserver-nodm ${D}${sysconfdir}/init.d
@@ -21,20 +30,9 @@ do_install() {
 	install -m 0644 xserver-nodm.service ${D}${base_libdir}/systemd/system/
 }
 
-RDEPENDS_${PN} = "xserver-common (>= 1.30) xinit"
-FILES_${PN} += "${base_libdir}/systemd/system/"
-
-inherit update-rc.d
+PACKAGES += "${PN}-systemd"
 
-INITSCRIPT_NAME = "xserver-nodm"
-INITSCRIPT_PARAMS = "start 01 5 2 . stop 01 0 1 6 ."
-INITSCRIPT_PARAMS_shr = "start 90 5 2 . stop 90 0 1 6 ."
-
-pkg_postinst_${PN}_append () {
-    if [ -e ${base_bindir}/systemctl ] ; then
-        # can't do this offline
-        [ "x$D" != "x" ] && exit 1
+RDEPENDS_${PN} = "xserver-common (>= 1.30) xinit"
 
-        systemctl enable xserver-nodm.service
-    fi
-}
+FILES_${PN}-systemd += "${base_libdir}/systemd/system/"
+RDEPENDS_${PN}-systemd = "xserver-common (>= 1.30) xinit"
-- 
1.7.2.5



