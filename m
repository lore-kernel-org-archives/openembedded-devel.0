Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6620F6C138
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Nov 2018 06:44:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="48074279"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Nov 2018 14:43:57 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id C3D084B5CBFA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Nov 2018 14:43:52 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 14 Nov 2018 14:43:58 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <1535752888-53778-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: C3D084B5CBFA.AEE0C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] makedumpfile: Add aarch64 into COMPATIBLE_HOST.
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
Date: Wed, 14 Nov 2018 06:44:03 -0000
X-Original-Date: Sat, 1 Sep 2018 06:01:28 +0800
X-List-Received-Date: Wed, 14 Nov 2018 06:44:03 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.4.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.4.bb
index 629e251..33194b8 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.4.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.4.bb
@@ -13,9 +13,9 @@ LICENSE = "GPLv2.0"
 DEPENDS = "bzip2 zlib elfutils"
 RDEPENDS_${PN}-tools = "perl ${PN}"
 
-# arm would compile but has never been tested upstream.  mips would not compile.
+# arm and aarch64 would compile but has never been tested upstream.  mips would not compile.
 #
-COMPATIBLE_HOST = "(x86_64|i.86|powerpc|arm).*-linux"
+COMPATIBLE_HOST = "(x86_64|i.86|powerpc|arm|aarch64).*-linux"
 
 PACKAGES =+ "${PN}-tools"
 FILES_${PN}-tools = "${bindir}/*.pl"
-- 
2.7.4




