Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OJZNl-0006gW-8X
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 23:52:23 +0200
Received: by fxm9 with SMTP id 9so535343fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jun 2010 14:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=bAYhka3MPY2LSilIbIMZkDHQq0GiJcqiuEAKXuG9TM4=;
	b=YkugdsYoX0bqpKdEfr7qKYCrUhOYZgTdLTAjcVUcaTMLSL9zNFM7No+vesMSiQhBlk
	hPmboj4fcnElPJa7yEtO4rs3JHzEXFFSx6FXNQZxJK+Wmj4Z8EjQB+cjnc8ryI0HHuEL
	ClICS5fBWQQU9tE3Jdbk+Zt5AiPO2wLyzrYyo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=OqgsxGNgevzaBoreHpsdul+nOu0udGhjTCt/zp0sF/hbdzkFcNw1/1bPMb3G3m7T6Z
	0Q/O7UuovKz5PtfBY2emGnMLBuGErdSX6E9YrU1VGQ9QcNrRIxQ3/RwfeQP/0Fbkvhdk
	eGF04xahnFDkRLQkDDnG7DWpeeDk2GjQOcwVM=
Received: by 10.223.23.67 with SMTP id q3mr7732243fab.59.1275428887257;
	Tue, 01 Jun 2010 14:48:07 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 2sm48981830faf.15.2010.06.01.14.48.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 01 Jun 2010 14:48:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Jun 2010 23:47:55 +0200
Message-Id: <1275428876-1406-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <20100601195258.GF5446@jama>
References: <20100601195258.GF5446@jama>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] Revert "klibc: fix packaging"
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
X-List-Received-Date: Tue, 01 Jun 2010 21:52:23 -0000

This reverts commit e020cd9b2c61fd19bb55ec3fd38abcfdbd3f651c.
---
 recipes/klibc/klibc-common.inc |    2 +-
 recipes/klibc/klibc-utils.inc  |   18 +++++++++++++++++-
 recipes/klibc/klibc.inc        |    4 ++--
 recipes/klibc/klibc_1.5.18.bb  |    2 +-
 recipes/klibc/klibc_1.5.18.inc |    8 --------
 recipes/klibc/klibc_1.5.bb     |    2 +-
 recipes/klibc/klibc_1.5.inc    |    3 ---
 7 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/recipes/klibc/klibc-common.inc b/recipes/klibc/klibc-common.inc
index 1f3aab1..7b7a3cb 100644
--- a/recipes/klibc/klibc-common.inc
+++ b/recipes/klibc/klibc-common.inc
@@ -9,7 +9,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/libs/klibc/${KLIBC_FETCHDIR}/klibc-${PV
 
 S = "${WORKDIR}/klibc-${PV}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-INC_PR = "r15"
+INC_PR = "r14"
 
 KLIBC_ARCH = '${TARGET_ARCH}'
 KLIBC_ARCH_armeb = 'arm'
diff --git a/recipes/klibc/klibc-utils.inc b/recipes/klibc/klibc-utils.inc
index 930eb60..7bbcee3 100644
--- a/recipes/klibc/klibc-utils.inc
+++ b/recipes/klibc/klibc-utils.inc
@@ -40,6 +40,16 @@ do_install_append() {
         ln -s gzip ${D}${base_bindir}/zcat
 }
 
+# only in 1.5
+# install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/insmod ${D}${base_bindir}
+
+# only in >= 1.5.15
+# install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/dmesg ${D}${base_bindir}
+# install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/sync ${D}${base_bindir}
+
+# only in >= 1.5.15+1.5.16
+# install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/ls ${D}${base_bindir}
+
 PACKAGES += "${KLIBC_UTILS_PKGNAME}-sh \
              ${KLIBC_UTILS_PKGNAME}-gzip \
              ${KLIBC_UTILS_PKGNAME}-kinit \
@@ -52,6 +62,7 @@ PACKAGES += "${KLIBC_UTILS_PKGNAME}-sh \
              ${KLIBC_UTILS_PKGNAME}-chroot \
              ${KLIBC_UTILS_PKGNAME}-cpio \
              ${KLIBC_UTILS_PKGNAME}-dd \
+             ${KLIBC_UTILS_PKGNAME}-dmesg \
              ${KLIBC_UTILS_PKGNAME}-false \
              ${KLIBC_UTILS_PKGNAME}-halt \
              ${KLIBC_UTILS_PKGNAME}-kill \
@@ -67,12 +78,14 @@ PACKAGES += "${KLIBC_UTILS_PKGNAME}-sh \
              ${KLIBC_UTILS_PKGNAME}-readlink \
              ${KLIBC_UTILS_PKGNAME}-reboot \
              ${KLIBC_UTILS_PKGNAME}-sleep \
+             ${KLIBC_UTILS_PKGNAME}-sync \
              ${KLIBC_UTILS_PKGNAME}-true \
              ${KLIBC_UTILS_PKGNAME}-umount \
              ${KLIBC_UTILS_PKGNAME}-uname \
              ${KLIBC_UTILS_PKGNAME}-modprobe \
              ${KLIBC_UTILS_PKGNAME}-losetup \
-             ${KLIBC_UTILS_PKGNAME}-wc"
+             ${KLIBC_UTILS_PKGNAME}-wc \
+             ${KLIBC_UTILS_PKGNAME}-ls"
 
 FILES_${KLIBC_UTILS_PKGNAME}-sh = "${base_bindir}/sh"
 FILES_${KLIBC_UTILS_PKGNAME}-gzip = "${base_bindir}/gzip ${base_bindir}/gunzip ${base_bindir}/zcat"
@@ -86,6 +99,7 @@ FILES_${KLIBC_UTILS_PKGNAME}-cat = "${base_bindir}/cat"
 FILES_${KLIBC_UTILS_PKGNAME}-chroot = "${base_bindir}/chroot"
 FILES_${KLIBC_UTILS_PKGNAME}-cpio = "${base_bindir}/cpio"
 FILES_${KLIBC_UTILS_PKGNAME}-dd = "${base_bindir}/dd"
+FILES_${KLIBC_UTILS_PKGNAME}-dmesg = "${base_bindir}/dmesg"
 FILES_${KLIBC_UTILS_PKGNAME}-false = "${base_bindir}/false"
 FILES_${KLIBC_UTILS_PKGNAME}-halt = "${base_bindir}/halt"
 FILES_${KLIBC_UTILS_PKGNAME}-kill = "${base_bindir}/kill"
@@ -101,9 +115,11 @@ FILES_${KLIBC_UTILS_PKGNAME}-poweroff = "${base_bindir}/poweroff"
 FILES_${KLIBC_UTILS_PKGNAME}-readlink = "${base_bindir}/readlink"
 FILES_${KLIBC_UTILS_PKGNAME}-reboot = "${base_bindir}/reboot"
 FILES_${KLIBC_UTILS_PKGNAME}-sleep = "${base_bindir}/sleep"
+FILES_${KLIBC_UTILS_PKGNAME}-sync = "${base_bindir}/sync"
 FILES_${KLIBC_UTILS_PKGNAME}-true = "${base_bindir}/true"
 FILES_${KLIBC_UTILS_PKGNAME}-umount = "${base_bindir}/umount"
 FILES_${KLIBC_UTILS_PKGNAME}-uname = "${base_bindir}/uname"
 FILES_${KLIBC_UTILS_PKGNAME}-modprobe = "${base_sbindir}/modprobe"
 FILES_${KLIBC_UTILS_PKGNAME}-losetup = "${base_bindir}/losetup"
 FILES_${KLIBC_UTILS_PKGNAME}-wc = "${base_bindir}/wc"
+FILES_${KLIBC_UTILS_PKGNAME}-ls = "${base_bindir}/ls"
diff --git a/recipes/klibc/klibc.inc b/recipes/klibc/klibc.inc
index 8ed976a..9ae6c5b 100644
--- a/recipes/klibc/klibc.inc
+++ b/recipes/klibc/klibc.inc
@@ -37,10 +37,9 @@ RDEPENDS_${KLIBC_UTILS_PKGNAME}-dd = "${PN} (=${PV}-${PR})"
 RDEPENDS_${KLIBC_UTILS_PKGNAME}-dmesg = "${PN} (=${PV}-${PR})"
 RDEPENDS_${KLIBC_UTILS_PKGNAME}-false = "${PN} (=${PV}-${PR})"
 RDEPENDS_${KLIBC_UTILS_PKGNAME}-halt = "${PN} (=${PV}-${PR})"
-RDEPENDS_${KLIBC_UTILS_PKGNAME}-kill = "${PN} (=${PV}-${PR})"
 RDEPENDS_${KLIBC_UTILS_PKGNAME}-insmod = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-kill = "${PN} (=${PV}-${PR})"
 RDEPENDS_${KLIBC_UTILS_PKGNAME}-ln = "${PN} (=${PV}-${PR})"
-RDEPENDS_${KLIBC_UTILS_PKGNAME}-ls = "${PN} (=${PV}-${PR})"
 RDEPENDS_${KLIBC_UTILS_PKGNAME}-minips = "${PN} (=${PV}-${PR})"
 RDEPENDS_${KLIBC_UTILS_PKGNAME}-mkdir = "${PN} (=${PV}-${PR})"
 RDEPENDS_${KLIBC_UTILS_PKGNAME}-mkfifo = "${PN} (=${PV}-${PR})"
@@ -59,3 +58,4 @@ RDEPENDS_${KLIBC_UTILS_PKGNAME}-uname = "${PN} (=${PV}-${PR})"
 RDEPENDS_${KLIBC_UTILS_PKGNAME}-modprobe = "${PN} (=${PV}-${PR})"
 RDEPENDS_${KLIBC_UTILS_PKGNAME}-losetup = "${PN} (=${PV}-${PR})"
 RDEPENDS_${KLIBC_UTILS_PKGNAME}-wc = "${PN} (=${PV}-${PR})"
+RDEPENDS_${KLIBC_UTILS_PKGNAME}-ls = "${PN} (=${PV}-${PR})"
diff --git a/recipes/klibc/klibc_1.5.18.bb b/recipes/klibc/klibc_1.5.18.bb
index 7520cad..694bf58 100644
--- a/recipes/klibc/klibc_1.5.18.bb
+++ b/recipes/klibc/klibc_1.5.18.bb
@@ -1,3 +1,3 @@
 require klibc.inc
 require klibc_${PV}.inc
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.1"
diff --git a/recipes/klibc/klibc_1.5.18.inc b/recipes/klibc/klibc_1.5.18.inc
index cad3bdb..2175643 100644
--- a/recipes/klibc/klibc_1.5.18.inc
+++ b/recipes/klibc/klibc_1.5.18.inc
@@ -42,11 +42,3 @@ do_install_append() {
         install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/sync ${D}${base_bindir}
         install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/ls ${D}${base_bindir}
 }
-
-PACKAGES += "${KLIBC_UTILS_PKGNAME}-dmesg \
-             ${KLIBC_UTILS_PKGNAME}-sync \
-             ${KLIBC_UTILS_PKGNAME}-ls"
-
-FILES_${KLIBC_UTILS_PKGNAME}-dmesg = "${base_bindir}/dmesg"
-FILES_${KLIBC_UTILS_PKGNAME}-sync = "${base_bindir}/sync"
-FILES_${KLIBC_UTILS_PKGNAME}-ls = "${base_bindir}/ls"
diff --git a/recipes/klibc/klibc_1.5.bb b/recipes/klibc/klibc_1.5.bb
index 694bf58..4b299f2 100644
--- a/recipes/klibc/klibc_1.5.bb
+++ b/recipes/klibc/klibc_1.5.bb
@@ -1,3 +1,3 @@
 require klibc.inc
 require klibc_${PV}.inc
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
diff --git a/recipes/klibc/klibc_1.5.inc b/recipes/klibc/klibc_1.5.inc
index c8ed5f6..b00f02c 100644
--- a/recipes/klibc/klibc_1.5.inc
+++ b/recipes/klibc/klibc_1.5.inc
@@ -17,6 +17,3 @@ SRC_URI[sha256sum] = "27000ba4bc73a5977502b27d7036df24dd6ab94a1c33b8f5d6d54ba627
 do_install_append() {
         install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/insmod ${D}${base_bindir}
 }
-
-PACKAGES += "${KLIBC_UTILS_PKGNAME}-insmod"
-FILES_${KLIBC_UTILS_PKGNAME}-insmod = "${base_bindir}/insmod"
-- 
1.7.1



