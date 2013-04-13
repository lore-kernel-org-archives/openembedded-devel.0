Received: from mail-ee0-f49.google.com ([74.125.83.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0o0-0007Y3-4D
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:48:52 +0200
Received: by mail-ee0-f49.google.com with SMTP id l10so1586510eei.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=28a6clB5KLe+yXCylSEl63y5fnrxBML5UajKzGh512s=;
	b=M/9a16TQq8pG3cb5wp4kDNLaOjKh88s1qQ45DG/d0mZthgB95nYCnCtfbPGge2oVhs
	7X7CHHpkQdUqSV1H9TjQXW8FNCbdTZqKAYJLoWGSfKM0coOjOuV+HQBf/k+0zaMnlmBQ
	dHuUl6PwW85LLF954rOZIg7Es36f8WzjJBUxLb5nDsBxh6KglOyB/Xlf/wbXOvpUe6Fd
	yuAse4nAI/OehlN4bP108VSRpGKfKVprK3WFj7M3la6AY9RJuEGA4JGiWCcjlaCqPf6L
	BVSwngfsFVyUvi41nWB39pnrQs82dD0ZYwK8AuoWnhPOT/sh2zl+B/cErM3Q9LArdAds
	wohg==
X-Received: by 10.15.36.2 with SMTP id h2mr39940180eev.2.1365859822294;
	Sat, 13 Apr 2013 06:30:22 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d47sm16436604eem.9.2013.04.13.06.30.21
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:41 +0200
Message-Id: <1365859790-20947-24-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 24/33] zram: move systemd support from meta-systemd back to meta-oe
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
X-List-Received-Date: Sat, 13 Apr 2013 13:49:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-extended/zram/zram/zram.service          |  0
 meta-oe/recipes-extended/zram/zram_0.1.bb            | 13 +++++++++++--
 .../meta-oe/recipes-extended/zram/zram_0.1.bbappend  | 20 --------------------
 3 files changed, 11 insertions(+), 22 deletions(-)
 rename {meta-systemd/meta-oe => meta-oe}/recipes-extended/zram/zram/zram.service (100%)
 delete mode 100644 meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend

diff --git a/meta-systemd/meta-oe/recipes-extended/zram/zram/zram.service b/meta-oe/recipes-extended/zram/zram/zram.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-extended/zram/zram/zram.service
rename to meta-oe/recipes-extended/zram/zram/zram.service
diff --git a/meta-oe/recipes-extended/zram/zram_0.1.bb b/meta-oe/recipes-extended/zram/zram_0.1.bb
index 8526264..115e643 100644
--- a/meta-oe/recipes-extended/zram/zram_0.1.bb
+++ b/meta-oe/recipes-extended/zram/zram_0.1.bb
@@ -2,22 +2,31 @@ DESCRIPTION = "Linux zram compressed in-memory swap"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-inherit allarch update-rc.d
+inherit allarch update-rc.d systemd
 
 RDEPENDS_${PN} = "util-linux-swaponoff kmod kernel-module-zram"
 
-PR = "r0"
+PR = "r3"
 
 SRC_URI = " \
            file://init \
+           file://zram.service \
           "
 
 do_install () {
 	# Sysvinit
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/zram
+
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/zram.service ${D}${systemd_unitdir}/system
 }
 
 FILES_${PN} = "${sysconfdir}/init.d"
 INITSCRIPT_NAME = "zram"
 INITSCRIPT_PARAMS = "start 05 2 3 4 5 . stop 22 0 1 6 ."
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "zram.service"
diff --git a/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend b/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend
deleted file mode 100644
index 227c1c7..0000000
--- a/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend
+++ /dev/null
@@ -1,20 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PRINC := "${@int(PRINC) + 2}"
-
-inherit systemd
-
-SRC_URI += " \
-        file://zram.service \
-"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "zram.service"
-
-do_install_append() {
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/zram.service ${D}${systemd_unitdir}/system
-}
-
-- 
1.8.1.5



