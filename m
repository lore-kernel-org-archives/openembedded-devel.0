Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3BA477F9BD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 13:01:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,247,1569254400"; d="scan'208";a="77687971"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Oct 2019 21:01:56 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id CE87F4B6AE15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 20:53:52 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 30 Oct 2019 21:01:50 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 04:56:17 +0800
Message-ID: <1572468977-36763-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: CE87F4B6AE15.A78D7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] unbound: upgrade 1.9.2 -> 1.9.4
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
X-List-Received-Date: Wed, 30 Oct 2019 13:01:55 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-support/unbound/{unbound_1.9.2.bb => unbound_1.9.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.9.2.bb => unbound_1.9.4.bb} (96%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.9.2.bb b/meta-networking/recipes-support/unbound/unbound_1.9.4.bb
similarity index 96%
rename from meta-networking/recipes-support/unbound/unbound_1.9.2.bb
rename to meta-networking/recipes-support/unbound/unbound_1.9.4.bb
index 0607c9d..03eb2fa 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.9.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.9.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master \
 	file://0001-contrib-add-yocto-compatible-startup-scripts.patch \
 "
-SRCREV="ee06aaaad99dc4d6b73f915d98f05c506885b98a"
+SRCREV="b60c4a472c856f0a98120b7259e991b3a6507eb5"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-- 
2.7.4




