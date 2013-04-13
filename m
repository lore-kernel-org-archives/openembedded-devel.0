Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0ny-0007Y1-KX
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:48:45 +0200
Received: by mail-ea0-f174.google.com with SMTP id m14so1565061eaj.19
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=SicKi9L4lmUiT7lKZOUpQhUiCBT57t7JPwWnlUBxcfo=;
	b=W3zzqsRUYx3n3oFFAiSieOE/nJ3ZgozlYeBwYvYuYepesDYfCAhSLHqySDOugcZFwP
	HgugKfyh4ys0N2Rfng4qofbV3Ek8buGgfViJDv1heaZxTtUeLtWP13YE6Ay1dGxsqJnS
	qfBhMEM4M2XPxVDXXMFVTz7r0YfUJSyuPehcjKpG1KVJlMpjvGJrI9bXChqXqcGnjrsf
	f+A/RV2RxBYFTQtfhsPOdEiHwucPHxmpLygAgDfTdgZQnXDU2tnoJSDr2kAHJbY2gAqy
	nOEuQH8zLZa89ayiTNusmU3m6f9FlrXN9X6v71877cIv1jehlWXxDmpXBE5pLWibiBX4
	RqjQ==
X-Received: by 10.14.107.69 with SMTP id n45mr39526105eeg.23.1365859820401;
	Sat, 13 Apr 2013 06:30:20 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d47sm16436476eem.9.2013.04.13.06.30.19
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:40 +0200
Message-Id: <1365859790-20947-23-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 23/33] atftp: move systemd support from meta-systemd back to meta-oe
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
X-List-Received-Date: Sat, 13 Apr 2013 13:48:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-extended/atftp/atftp/atftpd.service       |  0
 meta-oe/recipes-extended/atftp/atftp_git.bb           | 19 +++++++++++++++++--
 .../meta-oe/recipes-extended/atftp/atftp_git.bbappend | 19 -------------------
 3 files changed, 17 insertions(+), 21 deletions(-)
 rename {meta-systemd/meta-oe => meta-oe}/recipes-extended/atftp/atftp/atftpd.service (100%)
 delete mode 100644 meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend

diff --git a/meta-systemd/meta-oe/recipes-extended/atftp/atftp/atftpd.service b/meta-oe/recipes-extended/atftp/atftp/atftpd.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-extended/atftp/atftp/atftpd.service
rename to meta-oe/recipes-extended/atftp/atftp/atftpd.service
diff --git a/meta-oe/recipes-extended/atftp/atftp_git.bb b/meta-oe/recipes-extended/atftp/atftp_git.bb
index 774dd68..67a2c1b 100644
--- a/meta-oe/recipes-extended/atftp/atftp_git.bb
+++ b/meta-oe/recipes-extended/atftp/atftp_git.bb
@@ -4,6 +4,7 @@ HOMEPAGE = "http://packages.debian.org/atftp"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
 PV = "0.7.1+git${SRCPV}"
+PR = "r3"
 
 SRCREV = "be3291a18c069ae23a124ffdc56d64a5ff0bbec7"
 
@@ -11,10 +12,11 @@ SRC_URI = "git://atftp.git.sourceforge.net/gitroot/atftp/atftp;protocol=git \
            file://atftpd-0.7_circumvent_tftp_size_restrictions.patch \
            file://atftpd-0.7_unprotected_assignments_crash.patch \
            file://atftpd.init \
+           file://atftpd.service \   
           "
 S = "${WORKDIR}/git"
 
-inherit autotools update-rc.d useradd
+inherit autotools update-rc.d useradd systemd
 
 INITSCRIPT_PACKAGES = "${PN}d"
 INITSCRIPT_NAME_${PN}d = "atftpd"
@@ -31,10 +33,23 @@ do_install_append() {
     install -d ${D}/srv/tftp
 
     rm ${D}${sbindir}/in.tftpd
+    
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/atftpd.service ${D}${systemd_unitdir}/system
 }
 
 PACKAGES =+ "atftpd"
 
 FILES_${PN} = "${bindir}/*"
 
-FILES_${PN}d = "${sbindir}/* ${sysconfdir}/init.d/* /srv/tftp"
+FILES_${PN}d = "${sbindir}/* \
+  ${sysconfdir}/init.d/* \
+  /srv/tftp \
+  ${systemd_unitdir}/system/atftpd.service \
+"
+
+SYSTEMD_PACKAGES = "${PN}d"
+SYSTEMD_SERVICE_${PN}d = "atftpd.service"
+RPROVIDES_${PN}d += "${PN}d-systemd"
+RREPLACES_${PN}d += "${PN}d-systemd"
+RCONFLICTS_${PN}d += "${PN}d-systemd"
diff --git a/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend b/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend
deleted file mode 100644
index ed9cf9d..0000000
--- a/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend
+++ /dev/null
@@ -1,19 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PRINC := "${@int(PRINC) + 2}"
-
-inherit systemd
-
-SRC_URI += "file://atftpd.service"
-
-SYSTEMD_PACKAGES = "${PN}d"
-SYSTEMD_SERVICE_${PN}d = "atftpd.service"
-FILES_${PN}d += "${systemd_unitdir}/system/atftpd.service"
-RPROVIDES_${PN}d += "${PN}d-systemd"
-RREPLACES_${PN}d += "${PN}d-systemd"
-RCONFLICTS_${PN}d += "${PN}d-systemd"
-do_install_append() {
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/atftpd.service ${D}${systemd_unitdir}/system
-}
-
-- 
1.8.1.5



