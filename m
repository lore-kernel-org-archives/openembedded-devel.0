Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 91F3E600EB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jun 2017 03:17:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="19646491"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jun 2017 11:17:00 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id BFBAB47C6D36
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jun 2017 11:16:58 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 5 Jun 2017 11:17:03 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 5 Jun 2017 11:17:04 +0800
Message-ID: <1496632624-16009-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: BFBAB47C6D36.AAE09
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: susanbian <bianyq@cn.fujitsu.com>
Subject: [meta-oe] [PATCH] xterm: 325 -> 327
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
X-List-Received-Date: Mon, 05 Jun 2017 03:17:03 -0000
Content-Type: text/plain

From: susanbian <bianyq@cn.fujitsu.com>

Upgrade xterm from 325 to 327.

Signed-off-by: susanbian <bianyq@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-app/{xterm_325.bb => xterm_327.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_325.bb => xterm_327.bb} (86%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_325.bb b/meta-oe/recipes-graphics/xorg-app/xterm_327.bb
similarity index 86%
rename from meta-oe/recipes-graphics/xorg-app/xterm_325.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_327.bb
index a627af0..0e11662 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_327.bb
@@ -6,9 +6,8 @@ LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=842e945c46c43e05c4
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
 
-SRC_URI[md5sum] = "e78a0bbc4d5fa3780917e447ae8ebc6b"
-SRC_URI[sha256sum] = "3b31b07a0c40427e9330ec3be9d1a748c72808f945953cea9e526e48be315f1b"
-
+SRC_URI[md5sum] = "3c32e931adcad44e64e57892e75d9e02"
+SRC_URI[sha256sum] = "66fb2f6c35b342148f549c276b12a3aa3fb408e27ab6360ddec513e14376150b"
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
 
-- 
2.7.4




