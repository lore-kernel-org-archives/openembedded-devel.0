Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 535BC7FA9C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 12:31:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,228,1569254400"; d="scan'208";a="77477962"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Oct 2019 20:31:37 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id EC2F84B6EC86
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 20:23:41 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 25 Oct 2019 20:31:37 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 26 Oct 2019 04:25:51 +0800
Message-ID: <1572035151-73961-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: EC2F84B6EC86.A7ACA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-filesystems][PATCH] xorriso: upgrade 1.4.0 -> 1.5.0
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
X-List-Received-Date: Fri, 25 Oct 2019 12:31:39 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-utils/xorriso/{xorriso_1.4.0.bb => xorriso_1.5.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-utils/xorriso/{xorriso_1.4.0.bb => xorriso_1.5.0.bb} (86%)

diff --git a/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb b/meta-filesystems/recipes-utils/xorriso/xorriso_1.5.0.bb
similarity index 86%
rename from meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
rename to meta-filesystems/recipes-utils/xorriso/xorriso_1.5.0.bb
index b26709e..1c743ef 100644
--- a/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
+++ b/meta-filesystems/recipes-utils/xorriso/xorriso_1.5.0.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "http://www.gnu.org/software/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "ec79fd2736b8da76e7a870e27cadf6fa"
-SRC_URI[sha256sum] = "0bd1e085015b28c24f57697d6def2fe84517967dc417554c0c3ccf1685ed0e56"
+SRC_URI[md5sum] = "e5fbae9ada52730fbe248ab9a88e7127"
+SRC_URI[sha256sum] = "a93fa7ae5bb1902198cddfec25201388156932f36f2f5da829bf4fcae9a6062b"
 
 PACKAGECONFIG ??= "acl attr zlib bzip2 readline"
 PACKAGECONFIG[acl] = "--enable-libacl,--disable-libacl,acl,"
-- 
2.7.4




