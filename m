Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0nn-0007Ww-1h
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:47:43 +0200
Received: by mail-ea0-f181.google.com with SMTP id z10so1626457ead.40
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=EUugG23NIpwxCKNSYdqTSogvcdYlbqAOvIEuKS3dEbI=;
	b=vyfMUXLcXO6FHz/VqCHXuMk9HHw58EH/yKIswfGT+NNiOTleaG9785+vQQsTwIAw1J
	TbPnAbdXMZgswrxTcqm6ann7Y0DwKienvTyGv9v6FYvOZWiA4TKyn4JgIkIyW6iGTi74
	Bi5NTUNPOx46jJvjh/8xa4Xhpi/dtfEWieqr3NvPtnzClG8cUJ8nqeWEAxpJIaldwbgW
	ds6xAAtKSG+OgqBARaoQDcvl4lziDp0+OLxg+uEWfS6VCEAryoFjLifJKLQ8zoTofmXI
	MUktTqtO3Gm2tiOMkTS3RZthrx3rN2x4bBpPjpuBBBxyQBtkDxJj/+cn29uPcx6z2YXh
	EkCQ==
X-Received: by 10.14.5.137 with SMTP id 9mr35062331eel.30.1365859809419;
	Sat, 13 Apr 2013 06:30:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id f47sm16394638eep.13.2013.04.13.06.30.08
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:32 +0200
Message-Id: <1365859790-20947-15-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 15/33] udisks: move systemd support from meta-systemd back to meta-oe
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
X-List-Received-Date: Sat, 13 Apr 2013 13:47:46 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../udisks/udisks/add-systemd-support.patch              |  0
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb           | 14 ++++++++++++--
 .../meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend | 16 ----------------
 3 files changed, 12 insertions(+), 18 deletions(-)
 rename {meta-systemd/meta-oe => meta-oe}/recipes-support/udisks/udisks/add-systemd-support.patch (100%)
 delete mode 100644 meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend

diff --git a/meta-systemd/meta-oe/recipes-support/udisks/udisks/add-systemd-support.patch b/meta-oe/recipes-support/udisks/udisks/add-systemd-support.patch
similarity index 100%
rename from meta-systemd/meta-oe/recipes-support/udisks/udisks/add-systemd-support.patch
rename to meta-oe/recipes-support/udisks/udisks/add-systemd-support.patch
diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
index b6448ef..fc5d95b 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
@@ -5,15 +5,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73d83aebe7e4b62346afde80e0e94273"
 DEPENDS = "libatasmart sg3-utils polkit udev dbus-glib glib-2.0"
 # optional dependencies: device-mapper parted
 
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+
 SRC_URI = "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
            file://optional-depends.patch"
 
+SRC_URI += "${@base_contains('DISTRO_FEATURES', 'systemd', 'file://add-systemd-support.patch', '', d)}"
+
 SRC_URI[udisks.md5sum] = "86c63b2b5484f2060499a052b5b6256b"
 SRC_URI[udisks.sha256sum] = "854b89368733b9c3a577101b761ad5397ae75a05110c8698ac5b29de9a8bf8f5"
 
-PR = "r5"
+PR = "r9"
 
-inherit autotools
+inherit autotools systemd
 
 EXTRA_OECONF = "--disable-man-pages"
 
@@ -24,3 +28,9 @@ FILES_${PN} += "${libdir}/polkit-1/extensions/*.so \
 "
 
 FILES_${PN}-dbg += "${base_libdir}/udev/.debug"
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "udisks-daemon.service"
+SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend b/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend
deleted file mode 100644
index 5f30216..0000000
--- a/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend
+++ /dev/null
@@ -1,16 +0,0 @@
-inherit systemd
-
-PRINC := "${@int(PRINC) + 3}"
-
-# look for files in the layer first
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-DEPENDS += "systemd"
-
-SRC_URI += "file://add-systemd-support.patch"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "udisks-daemon.service"
-SYSTEMD_AUTO_ENABLE = "disable"
-- 
1.8.1.5



