Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5DA5D7E794
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2019 21:22:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45TdFf1s3kz2M
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2019 23:22:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560979350;
	bh=xOor1og7R0SD3Xw7b2zz7GBPsPNGeoiR3BmBve9p+/Q=;
	h=From:To:Subject:Date:From;
	b=XBpBmsEGAA0bYiKoi7paTnLRuLP/4bDOCm3tf9O8YJshOScPOEJlFUVLZCZo+HU1f
	H612ugPUklAvs5sS1WrrgZNJHWmsIQPByg7HSKtZMBAiF9KjHsC/LmF/a1r7gb/fEK
	4hBdngs4aQJJagrBxE5ffvT8ZFw+m8ejFB7QyjIu13xLeBRxkXVLDA3itTDlGfV8AC
	bMyc6o4AJ34xwqQKv8FY9vDx1IV71sx63MQkJByNIQ/sxCD/vgfdqpN7ZPdFHm3hVA
	GyIw8fAo0VfsvZJEh+DEWLhoHU1o6PkjOZhmghykR9IlYyKrWKfe//JGg/Vo3XX52m
	bDFqa83b4TioAwDpFlCZ1ccaMhuQWfnIqxXb+zrN5fcSFuzNilYp4O90jIaaI5IOLi
	uFwMg8LF3CsFou/KzV1dZDMCzTq4bl33qTSw26HeJI70BAj5cxB0sWEFtK4/yq8hhr
	j4fntkmaCU71hDLDbYAzsH1yl7xfB0a39BZ3jJuTo/YOBeUWSO8ozdYj8lrUjFOa7Y
	OkaXmEjEfdbl5IL8kJ21vkUNYuDGpovVFqQ+ihJaOvx0ymb4Gv7xCe+YPYjBIrjyGj
	fsqMYVf4IJkmAVbxM0gNkHSfFoWU/DkEciricJQbUGARWS4k85KmGsA7thdJumKaYJ
	rFjpQ38o0XZGYGl1Fy1fifOY=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Jun 2019 00:22:29 +0300
Message-Id: <20190619212229.31177-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] wireless-regdb: Remove, was moved to oe-core
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
X-List-Received-Date: Wed, 19 Jun 2019 21:22:30 -0000

kernel_wireless_regdb.bbclass stays here since it is only
required for kernels <= 4.14.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../wireless-regdb_2019.06.03.bb              | 42 -------------------
 .../packagegroup-meta-networking.bb           |  1 -
 2 files changed, 43 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2019.06.03.bb

diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2019.06.03.bb b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2019.06.03.bb
deleted file mode 100644
index ded44b3d4..000000000
--- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2019.06.03.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-SUMMARY = "Wireless Central Regulatory Domain Database"
-HOMEPAGE = "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
-SECTION = "net"
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
-
-SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "4b5ba3f089db7fdb7b9daae6a7c1f2cb"
-SRC_URI[sha256sum] = "cd917ed86b63ce8d93947979f1f18948f03a4ac0ad89ec25227b36ac00dc54bf"
-
-inherit bin_package allarch
-
-do_install() {
-    install -d -m0755 ${D}${nonarch_libdir}/crda
-    install -d -m0755 ${D}${sysconfdir}/wireless-regdb/pubkeys
-    install -m 0644 regulatory.bin ${D}${nonarch_libdir}/crda/regulatory.bin
-    install -m 0644 sforshee.key.pub.pem ${D}${sysconfdir}/wireless-regdb/pubkeys/sforshee.key.pub.pem
-
-    install -m 0644 -D regulatory.db ${D}${nonarch_base_libdir}/firmware/regulatory.db
-    install -m 0644 regulatory.db.p7s ${D}${nonarch_base_libdir}/firmware/regulatory.db.p7s
-}
-
-# Install static regulatory DB in /lib/firmware for kernel to load.
-# This requires Linux kernel >= v4.15.
-# For kernel <= v4.14, inherit the kernel_wireless_regdb.bbclass in kernel's recipe.
-PACKAGES =+ "${PN}-static"
-RCONFLICTS_${PN} = "${PN}-static"
-
-FILES_${PN}-static = " \
-    ${nonarch_base_libdir}/firmware/regulatory.db \
-    ${nonarch_base_libdir}/firmware/regulatory.db.p7s \
-"
-
-# Native users might want to use the source of regulatory DB.
-# This is for example used by Linux kernel <= v4.14 and kernel_wireless_regdb.bbclass.
-do_install_append_class-native() {
-    install -m 0644 -D db.txt ${D}${libdir}/crda/db.txt
-}
-
-RSUGGESTS_${PN} = "crda"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index 3770601a4..bbc5e1299 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -37,7 +37,6 @@ RDEPENDS_packagegroup-meta-networking-connectivity = "\
     mbedtls relayd snort dhcpcd rdate vlan vpnc \
     inetutils wolfssl lftp miniupnpd networkmanager \
     networkmanager-openvpn rdist nanomsg python-networkmanager \
-    wireless-regdb \
     ${@bb.utils.contains("DISTRO_FEATURES", "bluez5 x11", "blueman", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "samba", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "samba", "", d)} \
-- 
2.17.1


