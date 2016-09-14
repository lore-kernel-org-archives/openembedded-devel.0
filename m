Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C66917002B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 05:49:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8E5nFd6008369
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 22:49:15 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 13 Sep 2016 22:49:14 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 14 Sep 2016 01:49:13 -0400
Message-ID: <1473832153-165988-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] mbedtls: upgrade to 1.3.17
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
X-List-Received-Date: Wed, 14 Sep 2016 05:49:15 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* fix CVE: CVE-2015-8036

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../mbedtls/{mbedtls_1.3.10.bb => mbedtls_1.3.17.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_1.3.10.bb => mbedtls_1.3.17.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.10.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.17.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.10.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.17.bb
index d5c7afe..fcfec69 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.10.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_1.3.17.bb
@@ -25,8 +25,8 @@ SECTION = "libdevel"
 
 SRC_URI = "https://tls.mbed.org/download/mbedtls-${PV}-gpl.tgz"
 
-SRC_URI[md5sum] = "19ebbc96feceb430ad958dfe89cb633f"
-SRC_URI[sha256sum] = "746fd88e0c6623691fc56c4eed52e40a57b2da0ac80f6dd8995094aa6adb407e"
+SRC_URI[md5sum] = "a6ed92fc377ef60f7c24d42b900e0dad"
+SRC_URI[sha256sum] = "f5beb43e850283915e3e0f8d37495eade3bfb5beedfb61e7b8da70d4c68edb82"
 
 DEPENDS = "openssl"
 RDEPENDS_${PN} += "libcrypto"
-- 
2.8.1


