Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CD35B7FAA7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 08:28:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,390,1571673600"; d="scan'208";a="81266630"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Jan 2020 16:28:38 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 6E3C4406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 16:19:42 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 3 Jan 2020 16:28:36 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 3 Jan 2020 16:28:40 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 3 Jan 2020 04:57:29 -0800
Message-ID: <1578056252-94410-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 6E3C4406AB15.A304A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] strongswan: upgrade 5.8.1 -> 5.8.2
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
X-List-Received-Date: Fri, 03 Jan 2020 08:28:40 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../strongswan/{strongswan_5.8.1.bb => strongswan_5.8.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.8.1.bb => strongswan_5.8.2.bb} (97%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.2.bb
similarity index 97%
rename from meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.8.2.bb
index b521633ff..f05d69669 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.2.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://0001-memory.h-Include-stdint.h-for-uintptr_t.patch \
            "
 
-SRC_URI[md5sum] = "5a6b9980cd1ac4fad3c24b55ed960ac9"
-SRC_URI[sha256sum] = "d9af70acea5c054952ad1584916c1bf231b064eb6c8a9791dcb6ae90a769990c"
+SRC_URI[md5sum] = "d94eac2caed51b0cc776e5887b10bace"
+SRC_URI[sha256sum] = "86900ddbe7337c923dadf2c8339ae8ed2b9158e3691745884d08ae534677430e"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.17.1




