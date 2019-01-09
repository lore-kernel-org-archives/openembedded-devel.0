Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E02786DA25
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jan 2019 06:19:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x096Jj41000122
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Jan 2019 22:19:45 -0800 (PST)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 8 Jan 2019 22:19:44 -0800
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Jan 2019 14:16:10 +0800
Message-ID: <20190109061610.34471-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] pmdk: fix install error
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
X-List-Received-Date: Wed, 09 Jan 2019 06:19:45 -0000
Content-Type: text/plain

.so files are not generated in usr/local/lib/ but in usr/local/lib64.

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
index 3da22a970..af2229f1c 100644
--- a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
+++ b/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
@@ -43,10 +43,10 @@ do_install() {
 	mv ${D}/usr/local/bin/daxio ${D}${bindir}/
 
 	install -d ${D}${libdir}
-	mv ${D}/usr/local/lib/*so* ${D}${libdir}/
+	mv ${D}/usr/local/lib64/*so* ${D}${libdir}/
 
 	install -d ${D}${libdir}/pkgconfig
-	mv ${D}/usr/local/lib/pkgconfig/*.pc ${D}${libdir}/pkgconfig/
+	mv ${D}/usr/local/lib64/pkgconfig/*.pc ${D}${libdir}/pkgconfig/
 
 	install -d ${D}${includedir}
 	mv ${D}/usr/local/include/* ${D}${includedir}/
-- 
2.14.4


