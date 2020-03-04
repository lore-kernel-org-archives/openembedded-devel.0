Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2BF4961872
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 10:19:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,513,1574092800"; d="scan'208";a="85658022"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Mar 2020 18:19:24 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 1577950A997B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 18:09:31 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 4 Mar 2020 18:19:22 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Mar 2020 18:19:14 +0800
Message-ID: <1583317154-9856-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 1577950A997B.A3FD4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] tcsh: upgrade 6.21.00 -> 6.22.02
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
X-List-Received-Date: Wed, 04 Mar 2020 10:19:25 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-shells/tcsh/{tcsh_6.21.00.bb => tcsh_6.22.02.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-shells/tcsh/{tcsh_6.21.00.bb => tcsh_6.22.02.bb} (91%)

diff --git a/meta-oe/recipes-shells/tcsh/tcsh_6.21.00.bb b/meta-oe/recipes-shells/tcsh/tcsh_6.22.02.bb
similarity index 91%
rename from meta-oe/recipes-shells/tcsh/tcsh_6.21.00.bb
rename to meta-oe/recipes-shells/tcsh/tcsh_6.22.02.bb
index 278ab0458..79ab67ab7 100644
--- a/meta-oe/recipes-shells/tcsh/tcsh_6.21.00.bb
+++ b/meta-oe/recipes-shells/tcsh/tcsh_6.22.02.bb
@@ -13,8 +13,8 @@ SRC_URI = " \
     file://0001-Enable-system-malloc-on-all-linux.patch \
     file://0002-Add-debian-csh-scripts.patch \
 "
-SRC_URI[md5sum] = "5bd5f11515cc5cca927777fa92f9d4b9"
-SRC_URI[sha256sum] = "c438325448371f59b12a4c93bfd3f6982e6f79f8c5aef4bc83aac8f62766e972"
+SRC_URI[md5sum] = "f34909eab33733aecc05d27adc82277b"
+SRC_URI[sha256sum] = "ed287158ca1b00ba477e8ea57bac53609838ebcfd05fcb05ca95021b7ebe885b"
 
 EXTRA_OEMAKE += "CC_FOR_GETHOST='${BUILD_CC}'"
 inherit autotools
-- 
2.17.1




