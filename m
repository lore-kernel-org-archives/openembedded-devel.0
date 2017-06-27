Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id DDA4C77E57
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 06:13:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="20528019"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Jun 2017 14:13:16 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 0B80847E64D5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 14:13:16 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 27 Jun 2017 14:13:15 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Jun 2017 14:13:12 +0800
Message-ID: <1498543992-6666-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 0B80847E64D5.A6B73
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: susanbian <bianyq@cn.fujitsu.com>
Subject: [meta-filesystems] [PATCH] xfsprogs:4.10.0 -> 4.11.0
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
X-List-Received-Date: Tue, 27 Jun 2017 06:13:17 -0000
Content-Type: text/plain

From: susanbian <bianyq@cn.fujitsu.com>

Upgrade xfsprogs from 4.10.0 to 4.11.0

Signed-off-by: susanbian <bianyq@cn.fujitsu.com>
---
 .../recipes-utils/xfsprogs/{xfsprogs_4.10.0.bb => xfsprogs_4.11.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_4.10.0.bb => xfsprogs_4.11.0.bb} (92%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.10.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.11.0.bb
similarity index 92%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.10.0.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.11.0.bb
index 50ab987..3637909 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.10.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.11.0.bb
@@ -9,8 +9,8 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://link_needed_libs.patch \
            file://0001-define-__-prefixed-version-of-intXY_t-types.patch \
            "
-SRC_URI[md5sum] = "ddbb04493addf014db07a7e2b96b2804"
-SRC_URI[sha256sum] = "d8cb9ab2c686699d37914354ce3992b4aff3677093cbce06ad18bf798da8a8a7"
+SRC_URI[md5sum] = "f1f9b8c752347eefdb56483dafa0cefb"
+SRC_URI[sha256sum] = "c3a6d87b564d7738243c507df82276bed982265e345363a95f2c764e8a5f5bb2"
 
 inherit autotools-brokensep
 
-- 
2.7.4




