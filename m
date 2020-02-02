Return-Path: <alistair@alistair23.me>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 9D1A860C06
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Feb 2020 02:17:39 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id B9231216DB;
	Sat,  1 Feb 2020 21:17:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute7.internal (MEProxy); Sat, 01 Feb 2020 21:17:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=OIidhKXPSvWKeX/7JbB4oYtGF5
	HE8E1QAHDfQJidasA=; b=FJKVAqO9kIy7jmpgdXvVdli+F9nJGBqYpc0kDr3ByT
	VpPpRhc1PlwSepRPYhUllKdYNfTrHS5YoXlDQdB1a0wWG8lO1O8r8Eww1vjCnf4v
	/LPdIk1l5yQiX5PFV4cYo+6kZPEhfDgSPvHQi0xvukcymBZo50EKUrrWXbgP9Up6
	17VtfNAy0DI9xd8QLpf6hTFOox2iHJmB0O9D9Ds+nJ+jbxfyIHC5jkWOKtESWNJF
	p0oVjQUAxODzHFcEfxIb0pYvThqM0SCBb5EHh5vd34iXG+yn++1aTg1c5rQCtgcF
	DiSqkVyYCaMlTF3b/vD/Y+OcJpexTWW7rVCvKaSQcjCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=OIidhKXPSvWKeX/7J
	bB4oYtGF5HE8E1QAHDfQJidasA=; b=lnc8L4sUcXYKjntS/QYd3CCu09frKCri7
	3D4QpderxVAHvzIzapBPLU01drvsJQgjlKb4vyQbXewK/k0TvmNGl01vWPruWrmK
	oupfx2j2RdaZXtlVwnJtQBmFTtKoen5j+Ashlp+qoQvVO6pC7ax6G7ymsa/E1agP
	gxkPHxABpXK+BY/lz9DRGcceed11e4CAp8B0GFWe9qw2KjQXXcMiDBSO8tv/yIwp
	ycxLmS3hmMRWSUWV93X1IN8NCp7sffULivnxZk81gvH24xtRjYKZD64j8AvZ6x9q
	jRn9rXRr9AN+DQSs8ihQHI+oxoL6gaCOMF6LjN/hkkDUgQoTY62GA==
X-ME-Sender: <xms:RDE2Xml6mngHPGxlkK_8NcvxisubliLFCcfef0EaK0tygqt_lfW_cQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrgeefgdeggecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
	dtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghirhes
	rghlihhsthgrihhrvdefrdhmvgeqnecukfhppeejfedrleefrdekgedrvddtkeenucevlh
	hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghi
	rhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:RDE2Xj0UIONd0C3KFK7x4fmyNXDZCnhw0CbwGMKxlCZqfBk7quuz7A>
	<xmx:RDE2XiRiXElJXKswUjrE4haDKkkM5sjglgtdTkYWxWOuwMQLDegbdg>
	<xmx:RDE2XltqjBUq-9yCejZyfZgT3L9qn2HII7E7ywSXD7tNf0JcBLhvJg>
	<xmx:RDE2Xoj4msNxu3sy9rk0sMl7mXYYZxU9pS80H9BC3_v4immbn0GMwg>
Received: from alistair-xps-14z.alistair23.me
	(c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
	by mail.messagingengine.com (Postfix) with ESMTPA id 08BF83060840;
	Sat,  1 Feb 2020 21:17:39 -0500 (EST)
From: Alistair Francis <alistair@alistair23.me>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2020 18:17:38 -0800
Message-Id: <20200202021738.7440-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH v2] gpsd: Only require and build for Python3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Feb 2020 02:17:39 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
v2:
 - Actually rename everything

 meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb | 24 ++++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
index dbbc7140f..f74ebda5f 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
@@ -2,7 +2,7 @@ SUMMARY = "A TCP/IP Daemon simplifying the communication with GPS devices"
 SECTION = "console/network"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=01764c35ae34d9521944bb6ab312af53"
-DEPENDS = "dbus ncurses python python3 pps-tools"
+DEPENDS = "dbus ncurses python3 pps-tools"
 PROVIDES = "virtual/gpsd"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
@@ -84,7 +84,7 @@ do_install_append() {
     install -m 0644 ${S}/systemd/${BPN}.socket ${D}${systemd_unitdir}/system/${BPN}.socket
 }
 
-PACKAGES =+ "libgps libgpsd python-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils"
+PACKAGES =+ "libgps libgpsd python3-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils"
 
 RPROVIDES_${PN}-dbg += "python-pygps-dbg"
 
@@ -114,17 +114,17 @@ FILES_gpsd-gpsctl = "${bindir}/gpsctl"
 SUMMARY_gps-utils = "Utils used for simulating, monitoring,... a GPS"
 # Python files are required for gps/fake, required for gpsfake.
 FILES_gps-utils = "${bindir}/* ${libdir}/gps/*.py ${libdir}/gps/*.so"
-RDEPENDS_gps-utils = "python-pygps"
-
-SUMMARY_python-pygps = "Python bindings to gpsd"
-FILES_python-pygps = "${PYTHON_SITEPACKAGES_DIR}/* ${libdir}/gps/*.py ${libdir}/*.egg-info"
-RDEPENDS_python-pygps = " \
-    python-core \
-    python-io \
-    python-threading \
-    python-terminal \
+RDEPENDS_gps-utils = "python3-pygps"
+
+SUMMARY_python3-pygps = "Python bindings to gpsd"
+FILES_python3-pygps = "${PYTHON_SITEPACKAGES_DIR}/* ${libdir}/gps/*.py ${libdir}/*.egg-info"
+RDEPENDS_python3-pygps = " \
+    python3-core \
+    python3-io \
+    python3-threading \
+    python3-terminal \
     gpsd \
-    python-json"
+    python3-json"
 
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
-- 
2.25.0


