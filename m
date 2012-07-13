Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSR-0007zC-OW
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:51 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2247498bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=3pqlXDtpnBV+Ldz1I90IgnfTftrobWbeZpuI931p/vU=;
	b=dPT+2sbAb08B7Fnyh71TPdBNooGYBYrI6/2t2qwsfYpRKwmaNnLRR5nO0H5acGEi4I
	uid75qAOfDD8WLhM8o/hfp417JGzm7qVVdGCJeSCNEIovzsL3R/Nm+yZp4ZKDn3pNY8u
	LXFyguLmvNYCZ5AnVD7p5VXVdLVi6QnouH1jzfBWZRTL0j2B45CmVHNT0Im+JHWj1Yru
	2Cc+A6Z7JA1WnyzzJ3fp895njbZtenJf5gr290ya592nIfwhkp+bMKnTBqpnE6KvyKLs
	bEXLPAcQmnNqHZ2cFzRDQefUUCA7rnt5D+Ms9LPGSOcdHXDjS53lAWsIBCM+kYuEWMP+
	o4oA==
Received: by 10.205.133.11 with SMTP id hw11mr157974bkc.46.1342168287897;
	Fri, 13 Jul 2012 01:31:27 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:27 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:22 +0200
Message-Id: <1342168240-7760-15-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 14/32] udisks: move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:42:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |   10 +++-------
 .../udisks/udisks/add-systemd-support.patch        |    0
 .../recipes-support/udisks/udisks_1.0.4.bbappend   |   13 +++++++++++++
 3 files changed, 16 insertions(+), 7 deletions(-)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-support/udisks/udisks/add-systemd-support.patch (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend

diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
index 0018a5f..b6448ef 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
@@ -2,22 +2,18 @@ DESCRIPTION = "A storage daemon that implements well-defined D-Bus interfaces th
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73d83aebe7e4b62346afde80e0e94273"
 
-DEPENDS = "libatasmart sg3-utils polkit udev dbus-glib glib-2.0 systemd"
+DEPENDS = "libatasmart sg3-utils polkit udev dbus-glib glib-2.0"
 # optional dependencies: device-mapper parted
 
 SRC_URI = "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
-           file://add-systemd-support.patch \
            file://optional-depends.patch"
 
 SRC_URI[udisks.md5sum] = "86c63b2b5484f2060499a052b5b6256b"
 SRC_URI[udisks.sha256sum] = "854b89368733b9c3a577101b761ad5397ae75a05110c8698ac5b29de9a8bf8f5"
 
-PR = "r4"
+PR = "r5"
 
-inherit autotools systemd
-
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE_${PN}-systemd = "udisks-daemon.service"
+inherit autotools
 
 EXTRA_OECONF = "--disable-man-pages"
 
diff --git a/meta-oe/recipes-support/udisks/udisks/add-systemd-support.patch b/meta-systemd/meta-oe/recipes-support/udisks/udisks/add-systemd-support.patch
similarity index 100%
rename from meta-oe/recipes-support/udisks/udisks/add-systemd-support.patch
rename to meta-systemd/meta-oe/recipes-support/udisks/udisks/add-systemd-support.patch
diff --git a/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend b/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend
new file mode 100644
index 0000000..f6470c9
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend
@@ -0,0 +1,13 @@
+inherit systemd
+
+PRINC := "${@int(PRINC) + 1}"
+
+# look for files in the layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+DEPENDS += "systemd"
+
+SRC_URI += "file://add-systemd-support.patch"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE_${PN}-systemd = "udisks-daemon.service"
-- 
1.7.6.5



