Return-Path: <huangqy.fnst@cn.fujitsu.com>
X-Greylist: delayed 634 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 31 Jul 2017 09:10:13 UTC
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 8C5277840A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jul 2017 09:10:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,367,1444665600"; 
   d="scan'208";a="1499706"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by song.cn.fujitsu.com with ESMTP; 31 Jul 2017 16:59:36 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id CBB0E402BB71
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jul 2017 16:59:31 +0800 (CST)
Received: from localhost.localdomain (10.167.235.93) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 31 Jul 2017 16:59:33 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 31 Jul 2017 16:59:11 +0800
Message-ID: <1501491551-1414-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.235.93]
X-yoursite-MailScanner-ID: CBB0E402BB71.A7861
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libqb: update 1.0.1 -> 1.0.2
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
X-List-Received-Date: Mon, 31 Jul 2017 09:10:14 -0000
Content-Type: text/plain

Upgrade libqb from 1.0.1 to 1.0.2

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-extended/libqb/{libqb_1.0.1.bb => libqb_1.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libqb/{libqb_1.0.1.bb => libqb_1.0.2.bb} (92%)

diff --git a/meta-oe/recipes-extended/libqb/libqb_1.0.1.bb b/meta-oe/recipes-extended/libqb/libqb_1.0.2.bb
similarity index 92%
rename from meta-oe/recipes-extended/libqb/libqb_1.0.1.bb
rename to meta-oe/recipes-extended/libqb/libqb_1.0.2.bb
index e26bb7c..574f660 100644
--- a/meta-oe/recipes-extended/libqb/libqb_1.0.1.bb
+++ b/meta-oe/recipes-extended/libqb/libqb_1.0.2.bb
@@ -11,7 +11,7 @@ inherit autotools pkgconfig
 
 PV .= "+git${SRCPV}"
 
-SRCREV = "0a329683a76bc6aeb36f20f2bf6b43ba0440c4dc"
+SRCREV = "608de6d59a3de0eef0fbcbd8f284acbc018daa9a"
 SRC_URI = "git://github.com/ClusterLabs/${BPN}.git \
            file://0001-Remove-runtime-check-for-CLOCK_MONOTONIC.patch \
           "
-- 
2.7.4




