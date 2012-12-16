Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkIhy-0005nB-Hn
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:13:10 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2705890eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 09:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=7aSsLoyJ1qxu7eHHNyleCLyWiC69Ba6RNSYCf366NxY=;
	b=aiyhEmZKpqNOaYAVu++lK0J8MO4Aec0+6zgXDJY0JsAVW666Oe5146s+O2xlD+z85Z
	HEa5509bYohnPr9cGXz1JrrGqo22g6EbR/zp9QKlBfy7ih/DbZo9ka2qU3XM5id2p0X8
	QC99zhkXU95RNDACp7n0ixnZpi2ZQXKcn5HllMV87lAuP3Pr3MILUO9UrsK7KdGteWTl
	wKucwGM5Rm+zVJL5jcHiQFvx/H4iNN3eRHGbSAhML/ZPIJnLHo4DdTQFyVHXAAakUqtt
	kTRr3Zl4rsLNPdoA+vikdjYNxGUnlfh10IxqsdIXGakUQ/6x5cN4cH/FPQinIubET0gL
	ntOw==
Received: by 10.14.223.200 with SMTP id v48mr33892185eep.24.1355680703562;
	Sun, 16 Dec 2012 09:58:23 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id l3sm23870082eem.14.2012.12.16.09.58.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:58:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 18:57:52 +0100
Message-Id: <4e1c862c9ef567459bddb2486600acbf1df68e7d.1355680285.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 09/26] libnl: remove
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
X-List-Received-Date: Sun, 16 Dec 2012 18:13:11 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Version 3.2.14 is now in OE-Core.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libnl/libnl_3.2.9.bb | 52 ----------------------------
 1 file changed, 52 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libnl/libnl_3.2.9.bb

diff --git a/meta-oe/recipes-support/libnl/libnl_3.2.9.bb b/meta-oe/recipes-support/libnl/libnl_3.2.9.bb
deleted file mode 100644
index 11b901c..0000000
--- a/meta-oe/recipes-support/libnl/libnl_3.2.9.bb
+++ /dev/null
@@ -1,52 +0,0 @@
-DESCRIPTION = "libnl is a library for applications dealing with netlink sockets."
-HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
-SECTION = "libs/network"
-
-PE = "1"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-DEPENDS = "flex-native bison-native"
-
-SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz"
-
-SRC_URI[md5sum] = "c13adec0239b266207fff07d79e5ce9e"
-SRC_URI[sha256sum] = "9f23e9460bd9bb7fbe09af5eb281e4a43a26fa245ea864ed5e28fe4e8118af63"
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
-RREPLACES_${PN} = "libnl2"
-RCONFLICTS_${PN} = "libnl2"
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
-                     ${libdir}/libnl-genl.so.* \
-                     ${sbindir}/genl-ctrl-list"
-RREPLACES_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
-RCONFLICTS_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
-- 
1.8.0.2



