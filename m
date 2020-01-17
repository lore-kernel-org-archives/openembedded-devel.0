Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9F1B379B57
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 04:48:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,328,1574092800"; d="scan'208";a="82092858"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jan 2020 12:48:15 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 219E84CE30EC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 12:39:07 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 17 Jan 2020 12:48:15 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 17 Jan 2020 12:48:19 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Jan 2020 12:49:41 +0800
Message-ID: <20200117044941.19300-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 219E84CE30EC.A9B12
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] pcsc-lite: upgrade 1.8.25 -> 1.8.26
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
X-List-Received-Date: Fri, 17 Jan 2020 04:48:16 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../pcsc-lite/{pcsc-lite_1.8.25.bb => pcsc-lite_1.8.26.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/pcsc-lite/{pcsc-lite_1.8.25.bb => pcsc-lite_1.8.26.bb} (92%)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.25.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
similarity index 92%
rename from meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.25.bb
rename to meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
index 6869e2cf9..5e6084656 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.25.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.26.bb
@@ -11,8 +11,8 @@ LICENSE_${PN}-spy-dev = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=628c01ba985ecfa21677f5ee2d5202f6"
 
 SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
-SRC_URI[md5sum] = "c20650a36062ab1689f37f3302c988f2"
-SRC_URI[sha256sum] = "d76d79edc31cf76e782b9f697420d3defbcc91778c3c650658086a1b748e8792"
+SRC_URI[md5sum] = "9d36882998449daceec267c68a21ff0d"
+SRC_URI[sha256sum] = "3eb7be7d6ef618c0a444316cf5c1f2f9d7227aedba7a192f389fe3e7c0dfbbd9"
 
 inherit autotools systemd pkgconfig
 
-- 
2.20.1




