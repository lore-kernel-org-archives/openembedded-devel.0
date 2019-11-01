Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E13197F95C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 10:20:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,254,1569254400"; d="scan'208";a="77792698"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Nov 2019 18:20:05 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 4F11B4CE1511
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 18:12:01 +0800 (CST)
Received: from G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 1 Nov 2019 18:20:03 +0800
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 1 Nov 2019 18:20:02 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Nov 2019 21:59:35 +0800
Message-ID: <1572616775-69362-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202)
X-yoursite-MailScanner-ID: 4F11B4CE1511.A59AC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] glibmm: upgrade 2.62.0 -> 2.63.1
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
X-List-Received-Date: Fri, 01 Nov 2019 10:20:06 -0000
Content-Type: text/plain

1) Update DEPEND from libsigc++-2.0 to libsigc++-3.

2) Update install dir from glibmm-2.4 to glibmm-2.64.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../glib-2.0/{glibmm_2.62.0.bb => glibmm_2.63.1.bb}        | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm_2.62.0.bb => glibmm_2.63.1.bb} (68%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.62.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.63.1.bb
similarity index 68%
rename from meta-oe/recipes-core/glib-2.0/glibmm_2.62.0.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm_2.63.1.bb
index 75eea4e..99f5cf9 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.62.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.63.1.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=42dfffebc56fec7527aac53b7a89d1d8 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "mm-common glib-2.0 libsigc++-2.0 glib-2.0-native"
+DEPENDS = "mm-common glib-2.0 libsigc++-3 glib-2.0-native"
 inherit gnomebase
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
@@ -13,23 +13,23 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI += " \
     file://remove-examples.patch \
 "
-SRC_URI[archive.md5sum] = "7da228e3f0c6a10024b9a7708c53691e"
-SRC_URI[archive.sha256sum] = "36659f13cc73282392d1305858f3bbca46fbd1ce2f078cc9db8b9f79b2e93cfe"
+SRC_URI[archive.md5sum] = "6d00da9e119d3cd1a27caaae4b00114e"
+SRC_URI[archive.sha256sum] = "4f99e29bd0a67afd94c0d6fdad2b86bc5cd944cd5d4ff097520dc58b6c997ada"
 
 do_install_append() {
-    install -d ${D}${datadir}/glibmm-2.4
+    install -d ${D}${datadir}/glibmm-2.64
     install -d ${D}${datadir}/aclocal
 
-    install -m 0644 glib/glibmmconfig.h ${D}${datadir}/glibmm-2.4/
+    install -m 0644 glib/glibmmconfig.h ${D}${datadir}/glibmm-2.64/
     install -m 0644 scripts/glibmm_check_perl.m4 ${D}${datadir}/aclocal/ || true
 
     for i in generate_wrap_init.pl gmmproc; do
-        sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/glibmm-2.4/proc/$i
+        sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/glibmm-2.64/proc/$i
     done
 }
 
 FILES_${PN} = "${libdir}/lib*.so.*"
-FILES_${PN}-dev += "${datadir}/glibmm-* ${libdir}/glibmm-2.4/include/ ${libdir}/glibmm-2.4/proc/ ${libdir}/giomm-2.4/include/"
+FILES_${PN}-dev += "${datadir}/glibmm-* ${libdir}/glibmm-2.64/include/ ${libdir}/glibmm-2.64/proc/ ${libdir}/giomm-2.64/include/"
 
 RDEPENDS_${PN}-dev = "perl"
 SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.7.4




