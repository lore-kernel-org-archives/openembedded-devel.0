Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 32C627842D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Feb 2018 06:17:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="36706075"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Feb 2018 14:17:43 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 5FE4B486A78B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Feb 2018 14:17:45 +0800 (CST)
Received: from localhost.localdomain (10.167.225.156) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Sun, 4 Feb 2018 14:17:44 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 4 Feb 2018 23:17:01 +0800
Message-ID: <1517757421-106450-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.156]
X-yoursite-MailScanner-ID: 5FE4B486A78B.A8862
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] xorgxrdp: change value of PV
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
X-List-Received-Date: Sun, 04 Feb 2018 06:17:45 -0000
Content-Type: text/plain

Modify value of PV.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
index 20cf45f..0c779b5 100644
--- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
+++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git \
 
 SRCREV = "c122544f184d4031bbae1ad80fbab554c34a9427"
 
-PV = "0.2.5+git${SRCPV}"
+PV = "0.2.5"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4




