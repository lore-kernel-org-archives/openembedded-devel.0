Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C1C837FEB5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 07:58:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,328,1571673600"; d="scan'208";a="80458759"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Dec 2019 15:58:32 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 454754CE1C97
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 15:49:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 18 Dec 2019 15:58:28 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Dec 2019 05:27:35 -0800
Message-ID: <1576675656-32410-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 454754CE1C97.A71B8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] fuse3: upgrade 3.8.0 -> 3.9.0
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
X-List-Received-Date: Wed, 18 Dec 2019 07:58:35 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-support/fuse/{fuse3_3.8.0.bb => fuse3_3.9.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-support/fuse/{fuse3_3.8.0.bb => fuse3_3.9.0.bb} (91%)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.8.0.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.9.0.bb
similarity index 91%
rename from meta-filesystems/recipes-support/fuse/fuse3_3.8.0.bb
rename to meta-filesystems/recipes-support/fuse/fuse3_3.9.0.bb
index b5bbe042a..19a3499a1 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.8.0.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.9.0.bb
@@ -13,8 +13,8 @@ LIC_FILES_CHKSUM = "file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.xz \
 "
-SRC_URI[md5sum] = "f184004cd3724f579cd602fa5232681b"
-SRC_URI[sha256sum] = "4a464f6df782a1dca1f7e85bf64ff6ece9547b389557aae4160371cb1c898d61"
+SRC_URI[md5sum] = "5dc2be21c0d06c7eace340996e8a37e2"
+SRC_URI[sha256sum] = "fcb7079a1bb4e510377b427d1c5c37c349281d498e249ae0c2379b4cf50059c2"
 
 S = "${WORKDIR}/fuse-${PV}"
 
-- 
2.17.1




