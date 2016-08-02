Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E77366E660
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Aug 2016 06:27:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9416661"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Aug 2016 14:27:23 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id DD602408D270
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Aug 2016 14:27:23 +0800 (CST)
Received: from localhost.localdomain (10.167.226.27) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 2 Aug 2016 14:27:23 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 2 Aug 2016 07:26:41 -0700
Message-ID: <1470148001-61634-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.27]
X-yoursite-MailScanner-ID: DD602408D270.A3E50
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: huangqy <huangqy.fnst@cn.fujitsu.com>
Subject: [PATCH] cronie: 1.5.0 -> 1.5.1
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
X-List-Received-Date: Tue, 02 Aug 2016 06:27:32 -0000
Content-Type: text/plain

From: huangqy <huangqy.fnst@cn.fujitsu.com>

Update cronie from 1.5.0 to 1.5.1

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/cronie/{cronie_1.5.0.bb => cronie_1.5.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cronie/{cronie_1.5.0.bb => cronie_1.5.1.bb} (95%)

diff --git a/meta/recipes-extended/cronie/cronie_1.5.0.bb b/meta/recipes-extended/cronie/cronie_1.5.1.bb
similarity index 95%
rename from meta/recipes-extended/cronie/cronie_1.5.0.bb
rename to meta/recipes-extended/cronie/cronie_1.5.1.bb
index 697501a..99b2bb5 100644
--- a/meta/recipes-extended/cronie/cronie_1.5.0.bb
+++ b/meta/recipes-extended/cronie/cronie_1.5.1.bb
@@ -23,8 +23,8 @@ SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
 PAM_SRC_URI = "file://crond_pam_config.patch"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-SRC_URI[md5sum] = "9db75e1884d83a45e002d145c6c54d45"
-SRC_URI[sha256sum] = "9cf0e3f4f5042a9c09413d62c8e0c055e12401f70b112465f0f81f2c84ebfb3f"
+SRC_URI[md5sum] = "910e6effcc032998b0a49fbd46322e18"
+SRC_URI[sha256sum] = "6c73666102a6b5d35e2eaf1bd06925f2d4b0cef8d3323c37286dda3089a85338"
 
 inherit autotools update-rc.d useradd systemd
 
-- 
2.7.4




