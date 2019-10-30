Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E8D997FAAA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 02:17:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,245,1569254400"; d="scan'208";a="77659926"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Oct 2019 10:17:04 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 7B98E4B6EC6E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 10:09:02 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 30 Oct 2019 10:17:00 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 Oct 2019 18:11:25 +0800
Message-ID: <1572430285-27815-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7B98E4B6EC6E.A73BD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] znc: upgrade 1.7.4 -> 1.7.5
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
X-List-Received-Date: Wed, 30 Oct 2019 02:17:05 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-irc/znc/{znc_1.7.4.bb => znc_1.7.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/znc/{znc_1.7.4.bb => znc_1.7.5.bb} (94%)

diff --git a/meta-networking/recipes-irc/znc/znc_1.7.4.bb b/meta-networking/recipes-irc/znc/znc_1.7.5.bb
similarity index 94%
rename from meta-networking/recipes-irc/znc/znc_1.7.4.bb
rename to meta-networking/recipes-irc/znc/znc_1.7.5.bb
index 7586007..a3d4b7c 100644
--- a/meta-networking/recipes-irc/znc/znc_1.7.4.bb
+++ b/meta-networking/recipes-irc/znc/znc_1.7.5.bb
@@ -8,7 +8,7 @@ DEPENDS = "openssl zlib icu"
 SRC_URI = "git://github.com/znc/znc.git;name=znc \
            git://github.com/jimloco/Csocket.git;destsuffix=git/third_party/Csocket;name=Csocket \
           "
-SRCREV_znc = "e661cdf9a394e2afd1b97517efa21fa2fa757e22"
+SRCREV_znc = "c7f72f8bc800115ac985e7e13eace78031cb1b50"
 SRCREV_Csocket = "e8d9e0bb248c521c2c7fa01e1c6a116d929c41b4"
 
 # This constructs a composite revision based on multiple SRCREV's.
-- 
2.7.4




