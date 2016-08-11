Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1027977223
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 21:03:00 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i5so1496201wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 14:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jxOzEhe8c1idhE7otVzq6wi0TzLlhnnlJpz9q+9hvMY=;
	b=gtGP7tsqQpaZHuxU8XlDk1Q4jTs94dXYi5n6jY8tayuibm+DtumjWht+9taUYvPDVn
	t8btZc0cPrJ2QBoik+TLeBUCjw2FtVsK1fsl420QGOs3jRzz7wi417SWqzXunZJ08o9I
	fJLYYFD9KMIt8nU0dAYk46Z1GKq33LA7tUBtYVBG37SrYIpgauxYR9DgzJ0k84tDah0x
	73tFBXPQtyWQUTseX+b2ORGJW0EftoML+p3Xpv59EFR8E6QZqgfbt3mYgofkqviipadh
	9Si97w4p4VBZ3qvENmGe8OM4mCZ5fA9CRoqOCc/C5BMHO0AFEkHJ7orzlTo2xpe81A09
	13lA==
X-Gm-Message-State: AEkoousJl2bQKXlLavhorQOfq0LZBcwLbK17yxBGaqF+ephkse8+w7mDXx1Y3N/JoyLe0w==
X-Received: by 10.28.139.144 with SMTP id n138mr11770538wmd.71.1470949380400; 
	Thu, 11 Aug 2016 14:03:00 -0700 (PDT)
Received: from tfsielt31850.fritz.box (31-187-15-27.dynamic.upc.ie.
	[31.187.15.27])
	by smtp.gmail.com with ESMTPSA id 3sm1532052wms.1.2016.08.11.14.02.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Aug 2016 14:02:59 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Aug 2016 22:03:09 +0100
Message-Id: <1470949390-21988-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] crda: split wireless-regdb out into own recipe
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
X-List-Received-Date: Thu, 11 Aug 2016 21:03:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This allows for independent updates of the regulatory database.

Signed-off-by: André Draszik <git@andred.net>
---
 .../recipes-connectivity/crda/crda_3.18.bb         | 25 ++++++----------------
 .../wireless-regdb/wireless-regdb_2014.11.18.bb    | 18 ++++++++++++++++
 2 files changed, 24 insertions(+), 19 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2014.11.18.bb

diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
index 7e13d7b..4a93930 100644
--- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
@@ -1,23 +1,18 @@
 SUMMARY = "Wireless Central Regulatory Domain Agent"
 HOMEPAGE = "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
 SECTION = "net"
-LICENSE = "copyleft-next-0.3.0 & ISC"
-LIC_FILES_CHKSUM = "file://copyleft-next-0.3.0;md5=8743a2c359037d4d329a31e79eabeffe \
-                    file://${WORKDIR}/wireless-regdb-2014.11.18/LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
+LICENSE = "copyleft-next-0.3.0"
+LIC_FILES_CHKSUM = "file://copyleft-next-0.3.0;md5=8743a2c359037d4d329a31e79eabeffe"
 
 DEPENDS = "python-m2crypto-native python-native libgcrypt libnl"
 
-SRC_URI = "https://www.kernel.org/pub/software/network/crda/${BP}.tar.xz;name=crda \
-           https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2014.11.18.tar.xz;name=bin \
+SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz \
            file://do-not-run-ldconfig-if-destdir-is-set.patch \
            file://fix-linking-of-libraries-used-by-reglib.patch \
            file://fix-gcc-6-unused-variables.patch \
 "
-SRC_URI[crda.md5sum] = "0431fef3067bf503dfb464069f06163a"
-SRC_URI[crda.sha256sum] = "43fcb9679f8b75ed87ad10944a506292def13e4afb194afa7aa921b01e8ecdbf"
-
-SRC_URI[bin.md5sum] = "d750c402c5510add7380edcb1d9b75b2"
-SRC_URI[bin.sha256sum] = "eab6b50f30748a8b0065ba38cf3df05aac161a5861ae0a6c3cfd01d38a71c9dd"
+SRC_URI[md5sum] = "0431fef3067bf503dfb464069f06163a"
+SRC_URI[sha256sum] = "43fcb9679f8b75ed87ad10944a506292def13e4afb194afa7aa921b01e8ecdbf"
 
 inherit python-dir pythonnative
 # Recursive make problem
@@ -29,14 +24,6 @@ do_compile() {
 
 do_install() {
     oe_runmake SBINDIR=${sbindir}/ install
-
-    install -d ${D}${libdir}/crda/
-
-    install -m 0644 ${WORKDIR}/wireless-regdb-2014.11.18/regulatory.bin ${D}${libdir}/crda/regulatory.bin
 }
 
-
-RDEPENDS_${PN} = "udev"
-FILES_${PN} += "${libdir}crda/regulatory.bin \
-                ${base_libdir}/udev/rules.d/85-regulatory.rules \
-"
+RDEPENDS_${PN} = "udev wireless-regdb"
diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2014.11.18.bb b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2014.11.18.bb
new file mode 100644
index 0000000..b3d82ba
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2014.11.18.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Wireless Central Regulatory Domain Database"
+HOMEPAGE = "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
+SECTION = "net"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
+
+SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
+SRC_URI[md5sum] = "d750c402c5510add7380edcb1d9b75b2"
+SRC_URI[sha256sum] = "eab6b50f30748a8b0065ba38cf3df05aac161a5861ae0a6c3cfd01d38a71c9dd"
+
+inherit bin_package
+
+do_install() {
+    install -d -m0755 ${D}${libdir}/crda
+    install -m 0644 regulatory.bin ${D}${libdir}/crda/regulatory.bin
+}
+
+RSUGGESTS_${PN} = "crda"
-- 
2.8.1


