Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3U-0001fg-HX
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:16 +0200
Received: by mail-we0-f175.google.com with SMTP id g55so1679484wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=n1DLpjxzWYstew+kynfskEe67aWDfKpJQFlnCJUFKgI=;
	b=rdNNJXEVJj4WqF+Op2IWH08tzL+vcIvv5gfOn0SgzPc14BDSDi/w/w8GEcW5kWZ7Vo
	Mbbp5VgFVW2DxqmXMru9l2lIcWwy37ks+esS4IpJY+B74vtjp5FEOJvMZJs7RT/sztvI
	sr8urbuqa0YP2agUt/3Y/na6UrCzQ3kr1IF+/pcVfchsMUgKw0++TjzTaQar4XgGZXEb
	RP9+U6iQWrb3ZUTLhzU/iLyAyk2qECtMLHJg/tODcYyw/v0S3bnO1Hjclq8r5vwbVH3h
	jgBSrnTTN0Craevb9gKYX+pr9Pb7yHqma0zZ2+uEe+NijMCpFp3Gw8JU6Ycbb0yg2sF8
	yAsg==
Received: by 10.216.138.130 with SMTP id a2mr5458636wej.35.1339364506035;
	Sun, 10 Jun 2012 14:41:46 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.41.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:41:45 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:42 +0200
Message-Id: <1339364820-2880-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 09/27] udisks: move systemd support to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:16 -0000
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
1.7.4.4



