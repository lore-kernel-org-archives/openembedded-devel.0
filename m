Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9671E71C8D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 06:32:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13941434"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Dec 2016 14:32:37 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 60BEC46704BE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 14:32:34 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.109) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 15 Dec 2016 14:32:34 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 15 Dec 2016 14:31:27 +0800
Message-ID: <1481783488-31329-2-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1481783488-31329-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1481783488-31329-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.109]
X-yoursite-MailScanner-ID: 60BEC46704BE.A8E46
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH 1/2] libtdb 1.3.10 -> 1.3.12
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
X-List-Received-Date: Thu, 15 Dec 2016 06:32:54 -0000
Content-Type: text/plain

Upgrade libtdb from 1.3.10 to 1.3.12

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-support/libtdb/{libtdb_1.3.10.bb => libtdb_1.3.12.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libtdb/{libtdb_1.3.10.bb => libtdb_1.3.12.bb} (91%)

diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.3.10.bb b/meta-networking/recipes-support/libtdb/libtdb_1.3.12.bb
similarity index 91%
rename from meta-networking/recipes-support/libtdb/libtdb_1.3.10.bb
rename to meta-networking/recipes-support/libtdb/libtdb_1.3.12.bb
index 1d65d39..86f931c 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.3.10.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.3.12.bb
@@ -10,8 +10,8 @@ SRC_URI = "http://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
            file://tdb-Add-configure-options-for-packages.patch \
 "
 
-SRC_URI[md5sum] = "c98f24eb469022b0f1741d3a504cfda5"
-SRC_URI[sha256sum] = "5578fb726bd04835f250bea11fe7d1398fe0bb3a7c9390404241c83cd6b50c1c"
+SRC_URI[md5sum] = "d9627e7aacd535a8251401f914bb6924"
+SRC_URI[sha256sum] = "60134e32253cac8e2efe5e0185d20123c208bcf6ad15edf2f50d80daadf8c348"
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
-- 
2.7.4




