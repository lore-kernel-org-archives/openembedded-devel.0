Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C7E86773A4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Sep 2016 07:58:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10653716"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Sep 2016 15:58:13 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id B72014042401
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Sep 2016 15:58:10 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 6 Sep 2016 15:58:09 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 6 Sep 2016 03:58:07 -0400
Message-ID: <1473148687-2004-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: B72014042401.A24DF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] stunnel: 5.28 -> 5.35
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
X-List-Received-Date: Tue, 06 Sep 2016 07:58:18 -0000
Content-Type: text/plain

Upgrade stunnel from 5.28 to 5.35.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../recipes-support/stunnel/{stunnel_5.28.bb => stunnel_5.35.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.28.bb => stunnel_5.35.bb} (82%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.28.bb b/meta-networking/recipes-support/stunnel/stunnel_5.35.bb
similarity index 82%
rename from meta-networking/recipes-support/stunnel/stunnel_5.28.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.35.bb
index 61be932..ce32341 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.28.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.35.bb
@@ -9,8 +9,8 @@ RDEPENDS_${PN} += "perl"
 
 SRC_URI = "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "2c39ae0be771f91bf5b0205beafddca6"
-SRC_URI[sha256sum] = "9a25b87b1ef0c08fa3d796edce07b4408e6a8acece23de2eb7ee9285b78852b5"
+SRC_URI[md5sum] = "9079f5fafbccaf88b7d92b227d78249a"
+SRC_URI[sha256sum] = "ffa386ae4c825f35f35157c285e7402a6d58779ad8c3822f74a9d355b54aba1d"
 
 inherit autotools
 
-- 
2.7.4




