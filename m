Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0C43F78520
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 05:23:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="35998928"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jan 2018 13:23:30 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 523C049F19B1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 13:23:27 +0800 (CST)
Received: from localhost.localdomain (10.167.225.156) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 26 Jan 2018 13:23:26 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Jan 2018 22:23:11 +0800
Message-ID: <1516976591-2793-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.156]
X-yoursite-MailScanner-ID: 523C049F19B1.A4E91
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] dnfdragora: fix PV
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
X-List-Received-Date: Fri, 26 Jan 2018 05:23:32 -0000
Content-Type: text/plain

Include SRCPV in PV.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
index 5678f73..9cd1efb 100644
--- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/manatools/dnfdragora.git \
            file://0001-Run-python-scripts-using-env.patch \
            "
 
-PV = "1.0.1+git"
+PV = "1.0.1+git${SRCPV}"
 SRCREV = "4fef4ce889b8e4fa03191d414f63bfd50796152a"
 
 S = "${WORKDIR}/git"
-- 
2.7.4




