Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SpzKC-0001JK-Nd
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Jul 2012 12:11:45 +0200
Received: by eaal1 with SMTP id l1so1121579eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jul 2012 03:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=lqSnPBvg2xdH5KNc2jbhF99fnqVr603qZSA5Vkxi9Mg=;
	b=L3Giyd7D52oP1cgRiURN+G9vfC9+wxmmbxKjEqk2/WEbbOvK0TIiUX/TP7/rvKue4O
	bEMrUSpJ+0atfOkNRxtsfwOFMqBMFF8kqhgPWzaphusaAX6VX+xHqmxt+ClCu4AGBsEZ
	DSnoTB02SgtpKRyZQWLF14A4kDrit7b+3SiMUxtL9EA4PU4IgFbx3RmUiaL1VornN91H
	PydT6m1Y13jxMf+IEqrY3zlqaoqY3xS8GRl4p+gf+PR1sD2LEqg+s04BTWr6FkQy8qUc
	/+yNevT6MgpiyzOQmDcPfBmsMibarzBp19trcGy/pCj8kvEWG7g42TwRIxJhVUVdS6mH
	P90g==
Received: by 10.14.177.3 with SMTP id c3mr1546414eem.30.1342260029289;
	Sat, 14 Jul 2012 03:00:29 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id f45sm2838101eep.12.2012.07.14.03.00.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 14 Jul 2012 03:00:28 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Jul 2012 12:00:12 +0200
Message-Id: <1342260012-9444-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342260012-9444-1-git-send-email-koen@dominion.thruhere.net>
References: <1342260012-9444-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQl3Dkg5GbJI65JcdDulE15iF42GGbYpLkW6fXNmztEwvVZopgGvKFvTdhz7dLVojirZ3pNp
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>, eric@eukrea.com
Subject: [for-denzil][meta-oe 2/2] libnl: upgrade to 3.2.9 and fix upgrade path
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
X-List-Received-Date: Sat, 14 Jul 2012 10:11:46 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* COPYING change is only formal from
  http://git.infradead.org/users/tgr/libnl.git/commitdiff/c857625be074a7b9ef6adbcdde986a0b23aae901

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-support/libnl/libnl_3.2.3.bb |   48 ------------------------
 meta-oe/recipes-support/libnl/libnl_3.2.9.bb |   52 ++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 48 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libnl/libnl_3.2.3.bb
 create mode 100644 meta-oe/recipes-support/libnl/libnl_3.2.9.bb

diff --git a/meta-oe/recipes-support/libnl/libnl_3.2.3.bb b/meta-oe/recipes-support/libnl/libnl_3.2.3.bb
deleted file mode 100644
index 38d34bf..0000000
--- a/meta-oe/recipes-support/libnl/libnl_3.2.3.bb
+++ /dev/null
@@ -1,48 +0,0 @@
-DESCRIPTION = "libnl is a library for applications dealing with netlink sockets."
-HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
-SECTION = "libs/network"
-
-PE = "1"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2b41e13261a330ee784153ecbb6a82bc"
-
-DEPENDS = "flex-native bison-native"
-
-SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz"
-
-SRC_URI[md5sum] = "dbbb44801e833cf9ca4fdc943f2a58ee"
-SRC_URI[sha256sum] = "69f4a360350ea61f2c988f947c251995c04093c74743eae9eeffba85846ef007"
-
-inherit autotools pkgconfig
-
-do_install_append() {
-    # make wpa-supplicant happy
-    # TODO: when moving to oe-core fix at wpa-supplicant
-    # (e.g src/drivers/drivers.mak)
-    cd ${D}${includedir}
-    ln -sf libnl3/netlink netlink
-    cd ${D}${libdir}
-    ln -sf libnl-3.so.200 libnl.so
-    ln -sf libnl-3.so.200 libnl.so.3
-    ln -sf libnl-genl-3.so.200 libnl-genl.so
-    ln -sf libnl-genl-3.so.200 libnl-genl.so.3
-}
-
-FILES_${PN} = "${libdir}/libnl-3.so.* \
-               ${libdir}/libnl.so.* \
-               ${sysconfdir}"
-FILES_${PN}-dbg += "${libdir}/libnl/cli/*/.debug"
-FILES_${PN}-dev += "${libdir}/libnl/cli/*/*.so \
-                    ${libdir}/libnl/cli/*/*.la"
-FILES_${PN}-staticdev += "${libdir}/libnl/cli/*/*.a"
-
-PACKAGES += "${PN}-cli ${PN}-route ${PN}-nf ${PN}-genl"
-FILES_${PN}-cli   = "${libdir}/libnl-cli-3.so.* \
-                     ${libdir}/libnl/cli/*/*.so.* \
-                     ${sbindir}/nl-*"
-FILES_${PN}-route = "${libdir}/libnl-route-3.so.*"
-FILES_${PN}-nf    = "${libdir}/libnl-nf-3.so.*"
-FILES_${PN}-genl  = "${libdir}/libnl-genl-3.so.* \
-                     ${libdir}/libnl-genl.so.*"
-
diff --git a/meta-oe/recipes-support/libnl/libnl_3.2.9.bb b/meta-oe/recipes-support/libnl/libnl_3.2.9.bb
new file mode 100644
index 0000000..11b901c
--- /dev/null
+++ b/meta-oe/recipes-support/libnl/libnl_3.2.9.bb
@@ -0,0 +1,52 @@
+DESCRIPTION = "libnl is a library for applications dealing with netlink sockets."
+HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
+SECTION = "libs/network"
+
+PE = "1"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = "flex-native bison-native"
+
+SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "c13adec0239b266207fff07d79e5ce9e"
+SRC_URI[sha256sum] = "9f23e9460bd9bb7fbe09af5eb281e4a43a26fa245ea864ed5e28fe4e8118af63"
+
+inherit autotools pkgconfig
+
+do_install_append() {
+    # make wpa-supplicant happy
+    # TODO: when moving to oe-core fix at wpa-supplicant
+    # (e.g src/drivers/drivers.mak)
+    cd ${D}${includedir}
+    ln -sf libnl3/netlink netlink
+    cd ${D}${libdir}
+    ln -sf libnl-3.so.200 libnl.so
+    ln -sf libnl-3.so.200 libnl.so.3
+    ln -sf libnl-genl-3.so.200 libnl-genl.so
+    ln -sf libnl-genl-3.so.200 libnl-genl.so.3
+}
+
+FILES_${PN} = "${libdir}/libnl-3.so.* \
+               ${libdir}/libnl.so.* \
+               ${sysconfdir}"
+RREPLACES_${PN} = "libnl2"
+RCONFLICTS_${PN} = "libnl2"
+FILES_${PN}-dbg += "${libdir}/libnl/cli/*/.debug"
+FILES_${PN}-dev += "${libdir}/libnl/cli/*/*.so \
+                    ${libdir}/libnl/cli/*/*.la"
+FILES_${PN}-staticdev += "${libdir}/libnl/cli/*/*.a"
+
+PACKAGES += "${PN}-cli ${PN}-route ${PN}-nf ${PN}-genl"
+FILES_${PN}-cli   = "${libdir}/libnl-cli-3.so.* \
+                     ${libdir}/libnl/cli/*/*.so.* \
+                     ${sbindir}/nl-*"
+FILES_${PN}-route = "${libdir}/libnl-route-3.so.*"
+FILES_${PN}-nf    = "${libdir}/libnl-nf-3.so.*"
+FILES_${PN}-genl  = "${libdir}/libnl-genl-3.so.* \
+                     ${libdir}/libnl-genl.so.* \
+                     ${sbindir}/genl-ctrl-list"
+RREPLACES_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
+RCONFLICTS_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
-- 
1.7.10



