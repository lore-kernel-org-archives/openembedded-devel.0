Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6A7CC6612C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Aug 2016 03:28:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10308908"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Aug 2016 11:28:16 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id BCC064334C88
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Aug 2016 11:28:14 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 26 Aug 2016 11:28:14 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 Aug 2016 23:28:10 -0400
Message-ID: <1472182090-2031-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: BCC064334C88.A5C00
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] openwsman: 2.6.2 -> 2.6.3
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
X-List-Received-Date: Fri, 26 Aug 2016 03:28:17 -0000
Content-Type: text/plain

Upgrade openwsman from 2.6.2 to 2.6.3.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../openwsman/{openwsman_2.6.2.bb => openwsman_2.6.3.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/openwsman/{openwsman_2.6.2.bb => openwsman_2.6.3.bb} (97%)

diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.6.3.bb
similarity index 97%
rename from meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb
rename to meta-oe/recipes-extended/openwsman/openwsman_2.6.3.bb
index af9633d..cf32351 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.6.3.bb
@@ -12,8 +12,8 @@ SECTION = "Applications/System"
 
 DEPENDS = "curl libxml2 openssl libpam"
 
-SRCREV = "ed7a119e036c53078d70fd85936d94dc9b9b98be"
-PV = "2.6.2"
+SRCREV = "feb7ec9b004fcaea0dbe65ce8a1a79cc29dd994c"
+PV = "2.6.3"
 
 SRC_URI = "git://github.com/Openwsman/openwsman.git;protocol=http \
            file://libssl-is-required-if-eventint-supported.patch \
-- 
2.7.4




