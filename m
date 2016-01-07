Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id AEF94731D5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 05:24:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2311288"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Jan 2016 13:24:51 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 5765645DEE0E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 13:24:29 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 7 Jan 2016 13:24:29 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Jan 2016 21:23:56 -0800
Message-ID: <1452144236-7978-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: 5765645DEE0E.AD328
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
Subject: [meta-networking][PATCH] stunnel: 5.21 -> 5.28
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
X-List-Received-Date: Thu, 07 Jan 2016 05:24:51 -0000
Content-Type: text/plain

Upgrade stunnel from 5.21 to 5.28.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 .../recipes-support/stunnel/{stunnel_5.21.bb => stunnel_5.28.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.21.bb => stunnel_5.28.bb} (82%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.21.bb b/meta-networking/recipes-support/stunnel/stunnel_5.28.bb
similarity index 82%
rename from meta-networking/recipes-support/stunnel/stunnel_5.21.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.28.bb
index 88e357a..0a8bcd8 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.21.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.28.bb
@@ -9,8 +9,8 @@ RDEPENDS_${PN} += "perl"
 
 SRC_URI = "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "3d0a932ea650c0fa0da1e45547afdbb8"
-SRC_URI[sha256sum] = "2aef568b1955f5e233f6a8e17ebce3d30755f1be44c813f5a48e621f785596e3"
+SRC_URI[md5sum] = "2c39ae0be771f91bf5b0205beafddca6"
+SRC_URI[sha256sum] = "9a25b87b1ef0c08fa3d796edce07b4408e6a8acece23de2eb7ee9285b78852b5"
 
 inherit autotools
 
-- 
1.9.1




