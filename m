Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DCEC07D3A6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 09:21:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,438,1557158400"; d="scan'208";a="70366435"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Jul 2019 17:21:13 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 2C5034CDE647
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 17:21:14 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 1 Jul 2019 17:21:16 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Jul 2019 17:22:49 +0800
Message-ID: <20190701092249.18839-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 2C5034CDE647.A84DA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH] strongswan: upgrade 5.7.1 -> 5.8.0
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
X-List-Received-Date: Mon, 01 Jul 2019 09:21:18 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from strongswan_5.7.1.bb to strongswan_5.8.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../strongswan/{strongswan_5.7.1.bb => strongswan_5.8.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.7.1.bb => strongswan_5.8.0.bb} (97%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.7.1.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.0.bb
similarity index 97%
rename from meta-networking/recipes-support/strongswan/strongswan_5.7.1.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.8.0.bb
index 5a4e2d36f..082061725 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.7.1.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.0.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://0001-memory.h-Include-stdint.h-for-uintptr_t.patch \
            "
 
-SRC_URI[md5sum] = "86b7e9321cde075cf382268fd282e0b0"
-SRC_URI[sha256sum] = "006f9c9126e2a2f4e7a874b5e1bd2abec1bbbb193c8b3b3a4c6ccd8c2d454bec"
+SRC_URI[md5sum] = "e05f2d16a7479a2a9591609c256d523a"
+SRC_URI[sha256sum] = "15b1e10c7dd6253ab5d791fe9b9cb84624e24c118aecd9b90251b4e60daa0933"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.20.1




