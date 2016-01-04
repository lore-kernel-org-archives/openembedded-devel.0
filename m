Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A02D9731CB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 02:12:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2172179"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Jan 2016 10:12:31 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 5419341887E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:12:21 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 4 Jan 2016 10:12:20 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 3 Jan 2016 18:12:17 -0800
Message-ID: <1451873537-5456-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: 5419341887E8.AC534
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] openwsman: 2.6.0 -> 2.6.2
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
X-List-Received-Date: Mon, 04 Jan 2016 02:12:31 -0000
Content-Type: text/plain

Upgrade openwsman from 2.6.0 to 2.6.2.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../openwsman/{openwsman_2.6.0.bb => openwsman_2.6.2.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/openwsman/{openwsman_2.6.0.bb => openwsman_2.6.2.bb} (94%)

diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.0.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb
similarity index 94%
rename from meta-oe/recipes-extended/openwsman/openwsman_2.6.0.bb
rename to meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb
index d89f3c0..bdb7ced 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.6.0.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb
@@ -12,10 +12,10 @@ SECTION = "Applications/System"
 
 DEPENDS = "curl libxml2 openssl libpam"
 
-SRCREV = "f523bf1390c7ea23946bb9159978a4d7c198f1ba"
-PV = "2.6.0"
+SRCREV = "ed7a119e036c53078d70fd85936d94dc9b9b98be"
+PV = "2.6.2"
 
-SRC_URI = "git://github.com/Openwsman/openwsman.git \
+SRC_URI = "git://github.com/Openwsman/openwsman.git;protocol=http \
            file://libssl-is-required-if-eventint-supported.patch \
            file://openwsmand.service"
 
-- 
1.9.1




