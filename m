Return-Path: <alistair@alistair23.me>
X-Greylist: delayed 399 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 02 Feb 2020 02:11:06 UTC
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 2957D60C06
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Feb 2020 02:11:06 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id D37FD21B81;
	Sat,  1 Feb 2020 21:04:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute7.internal (MEProxy); Sat, 01 Feb 2020 21:04:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=GgqZ1zk0L7OBjp1IUxbdoZb5ej
	O3tgMzLs8rW+zOxi0=; b=E0h8gXopG3P/TGzSJoU9N293X2u5BVv6LzouWFCy0Y
	TQDVkJ/4SIrU4ydj7xwOaf3zekWvnCP+GVQcO/TPW3bEOrk+L0SBa9bvEc2h2tmP
	gZFtcCRGWRfUlZq818K89FuP3VKc1nq9nk8XIW2QKKF2PFypDEHQu6cWhuuSuWcB
	DEfmP5ziO9TlxBZA/Va5ctnt9C9KRy7swe9GKotHVHoYcqb61TkMXCKtK1fkGpo5
	a/pqI57esPlNfhvWed4cI5S9Ry9btcCSOSdizGbNp6sVwc34RXoZMHfREr8666rn
	IPiWAtSQODxk6a18Q7JtmKhjpIx8czs8VRenJCZOk/Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=GgqZ1zk0L7OBjp1IU
	xbdoZb5ejO3tgMzLs8rW+zOxi0=; b=BE5HH6Oyixoc7p0WbCmJo1+onD9Y8WXAY
	M8VDGRhIDaGPV3eZgA47AGNJm34F8byn41c3ah3VBWJ/5DMbiihvT9JwQvlOWTaG
	QauMbvfgdhzLNJhNQhgjfBqgRw2oQUk6DatVHsys1nSUL93O9iL9nF1/QnVqYVAr
	j9g6xLSQIsPsGsSWb8jzyE59mm2vncGOg15YyaiQmHoUdzlJCtCDer2WN6NCfBe1
	GZ2/ZqtwZ9VH3HLupmsUKa478STQihe9XWHOcd6WxJv2lhK9VJ0wIR1emPQbTICC
	/aHhk8xDIM/fnVDyzbY8roF4pgiReVHsILv79yjZu8iHv/fJHPEHA==
X-ME-Sender: <xms:LC42Xnr3-cXOFyRj34P4tRw3VsHCFdtY8wcZAqh-ClnLabvXFgbjLQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrgeefgdegudcutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
	dtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghirhes
	rghlihhsthgrihhrvdefrdhmvgeqnecukfhppeejfedrleefrdekgedrvddtkeenucevlh
	hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghi
	rhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:LC42XuB6HhGSWuPmX2xQtaFML05LE96uMdgd0rAPLA-1VqrZ2yz4sw>
	<xmx:LC42Xooim3XMuxcEe_uFf7_mF1PV4De6dujgEXVyE7tdQaus8_J4Ng>
	<xmx:LC42XpDFgn65-o7SFUFgNjI3leEaKiFe69D8tpYacbOfpEaUjb5mPA>
	<xmx:LC42XhSk0OBcMRkOiYuvnKjDt9_jw9c8Mk9lipsMGn1OhcUXFc8NHw>
Received: from alistair-xps-14z.alistair23.me
	(c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2E6293060BB4;
	Sat,  1 Feb 2020 21:04:28 -0500 (EST)
From: Alistair Francis <alistair@alistair23.me>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2020 18:04:26 -0800
Message-Id: <20200202020426.23802-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] gpsd: Only require and build for Python3
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
X-List-Received-Date: Sun, 02 Feb 2020 02:11:07 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
index dbbc7140f..5e91ec5d7 100644
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
+RDEPENDS_gps-utils = "python3-pygps"
 
 SUMMARY_python-pygps = "Python bindings to gpsd"
 FILES_python-pygps = "${PYTHON_SITEPACKAGES_DIR}/* ${libdir}/gps/*.py ${libdir}/*.egg-info"
 RDEPENDS_python-pygps = " \
-    python-core \
-    python-io \
-    python-threading \
-    python-terminal \
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


