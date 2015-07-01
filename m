Return-Path: <net147@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 085CE60017
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 06:44:41 +0000 (UTC)
Received: by pactm7 with SMTP id tm7so18110722pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 23:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=C9CIq9t+iHpC19kRAMFQehL9M5CXgAAgWbKoIpYC9do=;
	b=0tVXydKdsHx5cg6/v42/tB975XLb9PrGK24fv4T4paA99Tk4Uz6hSt52fFtiXszQeH
	O3KBSpMGnLPLiNSFAPlXfkQ4RweHtMg0fQf0fiD6RNPEJ7LvcqWSneqetKPc4PvpSxyk
	zHdBU+3VMNDVKgdZnlpwkqg+DxfL+ZdWp3wHdwfvkkO38nKSp8D0eq7m9aSQyzOPzs3Y
	qJo7lM/rJexmYMKFjm5H+Kpc5EIFdF0i8UKb9szUPKiVGG4jY3ctMawjzK3pJDYtxxq8
	KAwHn/yLlUs2YUx+milQCd8Ut6bUFwtF8cg+wgF6yRCEtelBUDC0fLnFFs2XB8t8wdjx
	p4FA==
X-Received: by 10.68.241.230 with SMTP id wl6mr51639793pbc.90.1435733082039;
	Tue, 30 Jun 2015 23:44:42 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id fp3sm988073pdb.52.2015.06.30.23.44.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jun 2015 23:44:41 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2015 16:43:30 +1000
Message-Id: <1435733010-23864-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.4.4
Subject: [meta-oe][PATCH] ttf-wqy-zenhei: update to 0.9.45
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jul 2015 06:44:44 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 ...y-zenhei_0.6.26.bb => ttf-wqy-zenhei_0.9.45.bb} | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-graphics/ttf-fonts/{ttf-wqy-zenhei_0.6.26.bb => ttf-wqy-zenhei_0.9.45.bb} (42%)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb
similarity index 42%
rename from meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
rename to meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb
index 30ad91a..1207a61 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.9.45.bb
@@ -2,24 +2,26 @@ require ttf.inc
 
 SUMMARY = "WenQuanYi Zen Hei - A Hei-Ti Style Chinese font"
 AUTHOR = "Qianqian Fang and The WenQuanYi Project Contributors"
-HOMEPAGE = "http://wqy.sourceforge.net/en/"
+HOMEPAGE = "http://wenq.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cf540fc7d35b5777e36051280b3a911c"
-PR = "r4"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/wqy/wqy-zenhei-${PV}-0.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/wqy/wqy-zenhei-${PV}.tar.gz"
+SRC_URI[md5sum] = "4c6c3f4e902dd5ee0a121e8c41d040bd"
+SRC_URI[sha256sum] = "e4b7e306475bf9427d1757578f0e4528930c84c44eaa3f167d4c42f110ee75d6"
+
 S = "${WORKDIR}/wqy-zenhei"
 
-do_install_append () { 
-    install -d ${D}${sysconfdir}/fonts/conf.d/
-    install -m 0644 ${S}/44-wqy-zenhei.conf ${D}${sysconfdir}/fonts/conf.d/
-    install -m 0644 ${S}/66-wqy-zenhei-sharp.conf ${D}${sysconfdir}/fonts/conf.d/
+do_install_append () {
+    sed -i -e '/<string>[^W]/d' ${S}/44-wqy-zenhei.conf
+    install -d ${D}${sysconfdir}/fonts/conf.d
+
+    for x in ${S}/*.conf; do
+        install -m 0644 $x ${D}${sysconfdir}/fonts/conf.d/
+    done
 }
 
 PACKAGES = "${PN}"
 FONT_PACKAGES = "${PN}"
 
 FILES_${PN} = "${datadir}/fonts ${sysconfdir}"
-
-SRC_URI[md5sum] = "bf2c1cb512606d995873bada27c777da"
-SRC_URI[sha256sum] = "47355b6ec84bb309614b6d657ddfda993b96ed0be569264f82e523b254f945b2"
-- 
2.4.4


