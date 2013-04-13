Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0nw-0007Xg-M8
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:47:46 +0200
Received: by mail-ea0-f172.google.com with SMTP id z7so1572141eaf.17
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=THdjMmTtAe01MfL0BGXzhALAQa2NIeQxnk24whYoZyI=;
	b=cf4DeRHoV1H0cVxxGeVdJ9PhZnB1kVTFt2gUNHqxPuFZkJ1Rjo8OKLx3rfslrfDD6f
	KGpBJy7dnIbyeC7JREvMPSYnhEh7vPcv78+3gkyK65uzuTtftG+/lO6Bt6+uTwTJiEP7
	mtQgNkxTlcSHxusMkm9Tq55LlEKZiLjWMa7Woz9pJWobZQcb9Ac1idAN7rgi46yStUlc
	Y81AOh722xmp1tepXrO/hxLp4BXVKRSfMGHFD3N74qWqfY35FiFE5xvX8EcF+FuklmMY
	myfWRhCRzUkCWfynD+BOwv5P/maXLxt11c7TEQn774wUeFBhcLCR5bdoKW37TY4LGVlQ
	wosA==
X-Received: by 10.15.32.67 with SMTP id z43mr39514296eeu.24.1365859819071;
	Sat, 13 Apr 2013 06:30:19 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d47sm16436384eem.9.2013.04.13.06.30.18
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:39 +0200
Message-Id: <1365859790-20947-22-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 22/33] gateone: move systemd support from meta-systemd back to meta-oe
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
 .../recipes-connectivity/gateone/gateone/gateone.service |  0
 meta-oe/recipes-connectivity/gateone/gateone_git.bb      | 10 ++++++++--
 .../recipes-connectivity/gateone/gateone_git.bbappend    | 16 ----------------
 3 files changed, 8 insertions(+), 18 deletions(-)
 rename {meta-systemd/meta-oe => meta-oe}/recipes-connectivity/gateone/gateone/gateone.service (100%)
 delete mode 100644 meta-systemd/meta-oe/recipes-connectivity/gateone/gateone_git.bbappend

diff --git a/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone/gateone.service b/meta-oe/recipes-connectivity/gateone/gateone/gateone.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-connectivity/gateone/gateone/gateone.service
rename to meta-oe/recipes-connectivity/gateone/gateone/gateone.service
diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
index e9c182d..3552009 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
@@ -2,18 +2,19 @@ DESCRIPTION = "HTML5 (plugin-free) web-based terminal emulator and SSH client"
 LICENSE = "AGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ee5b168fc7de89a0cadc49e27830aa2c"
 
-PR = "r10"
+PR = "r13"
 
 PV = "1.1"
 SRCREV = "ea5db3dcb3bbbe445ae6d1a5611c1f8d547c57b9"
 SRC_URI = "git://github.com/liftoff/GateOne.git \
            file://gateone-avahi.service \
            file://server.conf \
+           file://gateone.service \
           "
 
 S = "${WORKDIR}/git"
 
-inherit distutils allarch python-dir
+inherit distutils allarch python-dir systemd
 
 export prefix = "${localstatedir}/lib"
 
@@ -24,6 +25,9 @@ do_install_append() {
 	install -m 0644 ${WORKDIR}/gateone-avahi.service ${D}${sysconfdir}/avahi/services/
 
 	install -m 0644 ${WORKDIR}/server.conf ${D}/var/lib/gateone/server.conf
+	
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/gateone.service ${D}${systemd_unitdir}/system
 }
 
 FILES_${PN} = "${localstatedir}/lib ${localstatedir}/log ${localstatedir}/volatile/log ${base_libdir} ${sysconfdir} ${PYTHON_SITEPACKAGES_DIR}"
@@ -57,3 +61,5 @@ RDEPENDS_${PN} = "file \
                   python-unixadmin \
                   python-xml \
                  "
+
+SYSTEMD_SERVICE_${PN} = "gateone.service"
diff --git a/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone_git.bbappend b/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone_git.bbappend
deleted file mode 100644
index 8ec9dfa..0000000
--- a/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone_git.bbappend
+++ /dev/null
@@ -1,16 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PRINC := "${@int(PRINC) + 2}"
-
-inherit systemd
-
-SRC_URI += "file://gateone.service"
-
-NATIVE_SYSTEMD_SUPPORT = "1"
-SYSTEMD_SERVICE_${PN} = "gateone.service"
-
-do_install_append() {
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/gateone.service ${D}${systemd_unitdir}/system
-}
-
-- 
1.8.1.5



