Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7BF6479659
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 15:58:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8HFwIhn014430
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Sep 2018 08:58:18 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Sep 2018 08:58:17 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 18 Sep 2018 00:05:24 +0800
Message-ID: <5a5440be0c6569e9c24a7c45debbe159efec7820.1537199591.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1537199591.git.hongxu.jia@windriver.com>
References: <cover.1537199591.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 15/19] dbench: split one dpg package
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
X-List-Received-Date: Mon, 17 Sep 2018 15:58:17 -0000
Content-Type: text/plain

Multiple -dbg packages per recipe is not encouraged, and only one is
recommended and the code only works properly in some cases for one.

Add RPROVIDES_${PN}-dbg to be compatiable with previous dbg packages
requiring.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-benchmark/dbench/dbench_4.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb b/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb
index 1915e4c..fb6a96e 100644
--- a/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb
+++ b/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb
@@ -14,12 +14,13 @@ SRC_URI = "\
 
 inherit autotools
 
-PACKAGES =+ "tbench tbench-dbg"
+PACKAGES =+ "tbench"
+
+RPROVIDES_${PN}-dbg += "tbench-dbg"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 FILES_tbench = "${bindir}/tbench* ${prefix}/share/client.txt"
-FILES_tbench-dbg += "${bindir}/.debug/tbench*"
 
 SRC_URI[md5sum] = "1fe56ff71b9a416f8889d7150ac54da4"
 SRC_URI[sha256sum] = "6001893f34e68a3cfeb5d424e1f2bfef005df96a22d86f35dc770c5bccf3aa8a"
-- 
2.7.4


