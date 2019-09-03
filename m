Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 850E57F2FD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 03:34:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,461,1559491200"; d="scan'208";a="74740797"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Sep 2019 11:34:12 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id DE5A04CE14E6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 11:34:07 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 3 Sep 2019 11:34:10 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Sep 2019 12:33:48 +0900
Message-ID: <20190903033348.32395-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: DE5A04CE14E6.A15DF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH] strongswan: upgrade 5.8.0 -> 5.8.1
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
X-List-Received-Date: Tue, 03 Sep 2019 03:34:13 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../strongswan/{strongswan_5.8.0.bb => strongswan_5.8.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.8.0.bb => strongswan_5.8.1.bb} (97%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.8.0.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb
similarity index 97%
rename from meta-networking/recipes-support/strongswan/strongswan_5.8.0.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb
index fa1bd975c..9310a93fe 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.8.0.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://0001-memory.h-Include-stdint.h-for-uintptr_t.patch \
            "
 
-SRC_URI[md5sum] = "e05f2d16a7479a2a9591609c256d523a"
-SRC_URI[sha256sum] = "15b1e10c7dd6253ab5d791fe9b9cb84624e24c118aecd9b90251b4e60daa0933"
+SRC_URI[md5sum] = "5a6b9980cd1ac4fad3c24b55ed960ac9"
+SRC_URI[sha256sum] = "d9af70acea5c054952ad1584916c1bf231b064eb6c8a9791dcb6ae90a769990c"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.17.1




