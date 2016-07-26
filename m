Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6880260721
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 02:12:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9085029"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jul 2016 10:12:35 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 651EB42984C3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 10:12:33 +0800 (CST)
Received: from localhost.localdomain (10.167.226.25) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 26 Jul 2016 10:12:32 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <1461031604-39175-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.25]
X-yoursite-MailScanner-ID: 651EB42984C3.AE9C5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libnih: Modify PR to avoid build errors.
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
Date: Tue, 26 Jul 2016 02:12:42 -0000
X-Original-Date: Tue, 19 Apr 2016 05:06:44 +0300
X-List-Received-Date: Tue, 26 Jul 2016 02:12:42 -0000
Content-Type: text/plain

invalid tag value("^[A-Za-z0-9+._]+$") Release: Release: r2-4ubuntu16
  meta-webos don't have people maintain for two years 

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 recipes-upstreamable/libnih/libnih_1.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-upstreamable/libnih/libnih_1.0.3.bb b/recipes-upstreamable/libnih/libnih_1.0.3.bb
index 5f70ef3..b5e5e12 100644
--- a/recipes-upstreamable/libnih/libnih_1.0.3.bb
+++ b/recipes-upstreamable/libnih/libnih_1.0.3.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "dbus libnih-native"
 DEPENDS_class-native = "dbus-native"
 
-PR = "r2-4ubuntu16"
+PR = "r0"
 
 SRC_URI = "https://launchpad.net/${BPN}/1.0/${PV}/+download/${BP}.tar.gz;name=tarball"
 SRC_URI += "file://libnih_1.0.3-4ubuntu16.patch;name=patch"
-- 
1.8.4.2




