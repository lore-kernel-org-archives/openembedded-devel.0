Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C72EA77158
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 02:11:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9953722"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Aug 2016 10:11:22 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 6A39D42CD11D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 10:11:22 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 16 Aug 2016 10:11:20 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Aug 2016 22:11:19 -0400
Message-ID: <1471313479-1366-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 6A39D42CD11D.A6210
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] corosync: 2.3.5 -> 2.4.0
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
X-List-Received-Date: Tue, 16 Aug 2016 02:11:26 -0000
Content-Type: text/plain

Upgrade corosync from 2.3.5 to 2.4.0.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../corosync/{corosync_2.3.5.bb => corosync_2.4.0.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/corosync/{corosync_2.3.5.bb => corosync_2.4.0.bb} (94%)

diff --git a/meta-oe/recipes-extended/corosync/corosync_2.3.5.bb b/meta-oe/recipes-extended/corosync/corosync_2.4.0.bb
similarity index 94%
rename from meta-oe/recipes-extended/corosync/corosync_2.3.5.bb
rename to meta-oe/recipes-extended/corosync/corosync_2.4.0.bb
index 508277e..50897f0 100644
--- a/meta-oe/recipes-extended/corosync/corosync_2.3.5.bb
+++ b/meta-oe/recipes-extended/corosync/corosync_2.4.0.bb
@@ -8,8 +8,8 @@ SECTION = "base"
 inherit autotools pkgconfig systemd
 
 SRC_URI = "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "8894f00d499e0755467b381e6346f9ff"
-SRC_URI[sha256sum] = "1d48cdfa224b0ceb02e27fe9d56b738fb2a92262b04b15bb3a67e1c4248da8e2"
+SRC_URI[md5sum] = "11bdd5ee2aed5eb2443dd6d6acd6a1ab"
+SRC_URI[sha256sum] = "6fe9523852a892701c4c28c1cd32e067e44cf0e696d5ecf3790afdef1fc309cb"
 
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a85eb4ce24033adb6088dd1d6ffc5e5d"
-- 
2.7.4




