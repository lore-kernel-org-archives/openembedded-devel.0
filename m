Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.6379.1618823440097631003
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Apr 2021 02:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13J9AaRS022677
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Apr 2021 02:10:37 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 19 Apr 2021 02:10:36 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Mon, 19 Apr 2021 02:10:35 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] debootstrap: explicitly add virtual/fakeroot-native to depends
Date: Mon, 19 Apr 2021 17:10:34 +0800
Message-ID: <20210419091034.3797259-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The oe-core does not add virtual/fakeroot-native to do_install of native
recipe, explicitly add it for fakeroot do_install

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb
index bb4345687..c7e28534d 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.123.bb
@@ -15,6 +15,10 @@ SRC_URI[sha256sum] = "5e5a8147ecdd6be0eea5ac4d6ed8192cc653e93f744dd3306c9b1cc51d
 
 S = "${WORKDIR}/debootstrap"
 
+DEPENDS = " \
+    virtual/fakeroot-native \
+"
+
 fakeroot do_install() {
     oe_runmake 'DESTDIR=${D}' install
     chown -R root:root ${D}${datadir}/debootstrap
-- 
2.27.0

