Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A50C6C3A9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2019 20:47:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2TKlBnd025013
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2019 13:47:12 -0700 (PDT)
Received: from fidler.wrs.com (172.25.44.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 29 Mar 2019 13:47:11 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Mar 2019 16:47:10 -0400
Message-ID: <20190329204710.22747-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH] wolfssl: update to 3.15.8 and use github SRC_URI
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
X-List-Received-Date: Fri, 29 Mar 2019 20:47:12 -0000
Content-Type: text/plain

The previous SRC_URI did not work for the new version and
when looking at the site, users are required to navigate
through a click-through license agreement.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../wolfssl/{wolfssl_3.15.7.bb => wolfssl_3.15.8.bb}         | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_3.15.7.bb => wolfssl_3.15.8.bb} (78%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
similarity index 78%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
index 0a0a6075d..7690925f8 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.7.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.15.8.bb
@@ -13,8 +13,9 @@ PROVIDES += "cyassl"
 RPROVIDES_${PN} = "cyassl"
 
 SRC_URI = "https://www.wolfssl.com/wolfssl-${PV}.zip"
-SRC_URI[md5sum] = "6ec08c09e3f51cccbb1686b4fd45f92f"
-SRC_URI[sha256sum] = "4cc318c49580d3b9c361fe258fac6106624aa744f1d34e03977b587766a753ee"
+SRC_URI = "https://github.com/wolfSSL/wolfssl/archive/v${PV}.zip"
+SRC_URI[md5sum] = "5ba7af2bae27716a3d90e55565a08784"
+SRC_URI[sha256sum] = "34605bb540ed091b1e4b2f14a1f6c7e3f26302f7c65f46378a27a6f0aa944881"
 
 inherit autotools
 
-- 
2.17.0


