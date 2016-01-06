Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7A26B60797
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2016 02:23:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2262455"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jan 2016 10:23:20 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 22EEF41896D0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2016 10:23:01 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 6 Jan 2016 10:23:01 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Jan 2016 18:22:56 -0800
Message-ID: <1452046976-10053-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: 22EEF41896D0.ADE08
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
Subject: [meta-oe][PATCH] libsmi: 0.4.8 -> 0.5.0
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
X-List-Received-Date: Wed, 06 Jan 2016 02:23:21 -0000
Content-Type: text/plain

Upgrade libsmi from 0.4.8 to 0.5.0.

Fix error: QA Issue: libsmi: Files/directories were installed but not shipped in any package:
    /usr/share/yang/*

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 .../recipes-support/libsmi/{libsmi_0.4.8.bb => libsmi_0.5.0.bb}    | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libsmi/{libsmi_0.4.8.bb => libsmi_0.5.0.bb} (71%)

diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
similarity index 71%
rename from meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb
rename to meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
index 227430d..ecd6dd2 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -8,8 +8,8 @@ SRC_URI = "https://www.ibr.cs.tu-bs.de/projects/${BPN}/download/${BP}.tar.gz \
            file://smi.conf \
           "
 
-SRC_URI[md5sum] = "760b6b1070738158708649ed2c63425e"
-SRC_URI[sha256sum] = "f048a5270f41bc88b0c3b0a8fe70ca4d716a46b531a0ecaaa87c462f49d74849"
+SRC_URI[md5sum] = "4bf47483c06c9f07d1b10fbc74eddf11"
+SRC_URI[sha256sum] = "f21accdadb1bb328ea3f8a13fc34d715baac6e2db66065898346322c725754d3"
 
 inherit autotools
 
@@ -18,9 +18,10 @@ do_install_append () {
     install -m 0644 ${WORKDIR}/smi.conf ${D}${sysconfdir}/smi.conf
 }
 
-PACKAGES += "${PN}-mibs ${PN}-pibs"
+PACKAGES += "${PN}-mibs ${PN}-pibs ${PN}-yang"
 
 FILES_${PN}-mibs += "${datadir}/mibs"
 FILES_${PN}-pibs += "${datadir}/pibs"
+FILES_${PN}-yang += "${datadir}/yang"
 
 RRECOMMENDS_${PN} = "${BPN}-mibs"
-- 
1.9.1




