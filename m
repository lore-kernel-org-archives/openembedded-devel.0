Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8E9547505A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2018 10:15:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="39942892"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 May 2018 18:16:00 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 338A54B3ED60
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2018 18:15:58 +0800 (CST)
Received: from localhost.localdomain (10.167.226.122) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 15 May 2018 18:16:02 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 May 2018 18:15:19 +0800
Message-ID: <20180515101519.5413-2-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180515101519.5413-1-hongl.fnst@cn.fujitsu.com>
References: <20180515101519.5413-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.122]
X-yoursite-MailScanner-ID: 338A54B3ED60.AE2BF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: Hong Liu <hongl.fnst@cn.fujitsu.com>
Subject: [meta-oe][PATCH] openwsman: 2.6.3 -> 2.6.4
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
X-List-Received-Date: Tue, 15 May 2018 10:16:00 -0000
Content-Type: text/plain

Upgrade openwsman from 2.6.3 to 2.6.4

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../openwsman/{openwsman_2.6.3.bb => openwsman_2.6.4.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/openwsman/{openwsman_2.6.3.bb => openwsman_2.6.4.bb} (97%)

diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.3.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.6.4.bb
similarity index 97%
rename from meta-oe/recipes-extended/openwsman/openwsman_2.6.3.bb
rename to meta-oe/recipes-extended/openwsman/openwsman_2.6.4.bb
index f618f02..f46a3bd 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.6.3.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.6.4.bb
@@ -15,8 +15,8 @@ DEPENDS = "curl libxml2 openssl libpam"
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
-SRCREV = "feb7ec9b004fcaea0dbe65ce8a1a79cc29dd994c"
-PV = "2.6.3"
+SRCREV = "4aff7eaf5df948b6ed74cf4f8dd721a397bfb759"
+PV = "2.6.4"
 
 SRC_URI = "git://github.com/Openwsman/openwsman.git \
            file://libssl-is-required-if-eventint-supported.patch \
-- 
2.7.4




