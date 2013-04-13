Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0nv-0007XQ-Do
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:47:44 +0200
Received: by mail-ee0-f42.google.com with SMTP id d4so1672180eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=/eeFMeDnunZpZ0g+WpCW84m0mDQ7R0WrmP8WXt80QaY=;
	b=v25wxVr3l0HS9xYa6gNn2jN/kDjsvDugz8u59oWN8Cb/pva1+p671djguPtxailkqU
	H9NsGm2TliMUi7OaVjhK9Q0APm9sMLQcKBLvNf2hqANjAJG/wtihLtjtlnBKIVF7QOGQ
	SDRIoIVYxSmhZtHe52Ubbu+KSYtOcVVWFu4AmyvsVX3Tdb6L2Ke0+QdTpb2L8mOCly2B
	EbY3Aeud8BZMUyzdE9eFB56QBB+kALndm+HRNuO2ySMDDVnAQ6YJABdY/xAGikd6FxOW
	wm6SpWYL86kZ+FIrQT9yLzZw7/JwVdSnBskCeq379Z6r8z1wmzNS/P9Hab8RH0he4+3O
	MN/A==
X-Received: by 10.15.22.76 with SMTP id e52mr39964801eeu.7.1365859817721;
	Sat, 13 Apr 2013 06:30:17 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t4sm16526684eel.0.2013.04.13.06.30.16
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:38 +0200
Message-Id: <1365859790-20947-21-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 21/33] cherokee: move systemd support from meta-systemd back to meta-oe
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
X-List-Received-Date: Sat, 13 Apr 2013 13:48:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../cherokee/cherokee/cherokee.service                 |  0
 .../recipes-connectivity/cherokee/cherokee_1.2.98.bb   | 16 +++++++++++++---
 .../cherokee/cherokee_1.2.98.bbappend                  | 18 ------------------
 3 files changed, 13 insertions(+), 21 deletions(-)
 rename {meta-systemd/meta-oe => meta-oe}/recipes-connectivity/cherokee/cherokee/cherokee.service (100%)
 delete mode 100644 meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend

diff --git a/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee/cherokee.service b/meta-oe/recipes-connectivity/cherokee/cherokee/cherokee.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee/cherokee.service
rename to meta-oe/recipes-connectivity/cherokee/cherokee/cherokee.service
diff --git a/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb b/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
index 84d6dce..422ebda 100644
--- a/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
+++ b/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
@@ -5,16 +5,18 @@ SECTION = "network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PR = "r6"
+PR = "r9"
 
 DEPENDS = "libpcre openssl mysql5 ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://www.cherokee-project.com/download/1.2/${PV}/cherokee-${PV}.tar.gz \
-           file://cherokee.init"
+           file://cherokee.init \
+           file://cherokee.service \
+"
 SRC_URI[md5sum] = "21b01e7d45c0e82ecc0c4257a9c27feb"
 SRC_URI[sha256sum] = "042b5687b1a3db3ca818167548ce5d32c35e227c6640732dcb622a6f4a078b7d"
 
-inherit autotools pkgconfig binconfig update-rc.d
+inherit autotools pkgconfig binconfig update-rc.d systemd
 
 EXTRA_OECONF = "--disable-static \
                 --disable-nls \
@@ -27,6 +29,9 @@ do_install_append () {
 
 	# clean up .la files for plugins
 	rm -f ${D}${libdir}/cherokee/*.la
+
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/cherokee.service ${D}${systemd_unitdir}/system
 }
 
 # Put -dev near the front so we can move the .la files into it with a wildcard
@@ -44,3 +49,8 @@ CONFFILES_${PN} = " \
 
 INITSCRIPT_NAME = "cherokee"
 INITSCRIPT_PARAMS = "defaults 91 91"
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "cherokee.service"
diff --git a/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend b/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend
deleted file mode 100644
index b792c62..0000000
--- a/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bbappend
+++ /dev/null
@@ -1,18 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PRINC := "${@int(PRINC) + 2}"
-
-inherit systemd
-
-SRC_URI += "file://cherokee.service"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "cherokee.service"
-
-do_install_append() {
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/cherokee.service ${D}${systemd_unitdir}/system
-}
-
-- 
1.8.1.5



