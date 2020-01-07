Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 968CD7FDA2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2020 09:09:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,405,1571673600"; d="scan'208";a="81428998"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Jan 2020 17:09:50 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 78FC949E9334
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2020 17:00:50 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 7 Jan 2020 17:09:48 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 7 Jan 2020 17:09:56 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Jan 2020 05:23:15 -0800
Message-ID: <1578403399-45535-6-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578403399-45535-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578403399-45535-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 78FC949E9334.A4457
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libnfc: upgrade to 1.7.1
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
X-List-Received-Date: Tue, 07 Jan 2020 09:09:50 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-oe/recipes-core/libnfc/libnfc_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/libnfc/libnfc_git.bb b/meta-oe/recipes-core/libnfc/libnfc_git.bb
index 7efd3443d..64c5f5c34 100644
--- a/meta-oe/recipes-core/libnfc/libnfc_git.bb
+++ b/meta-oe/recipes-core/libnfc/libnfc_git.bb
@@ -8,7 +8,7 @@ SECTION = "libs"
 inherit autotools pkgconfig
 
 S = "${WORKDIR}/git"
-SRCREV = "c42e2502d4627d3ea62f83c32677b100bb3cebdc"
+SRCREV = "2d4543673e9b76c02679ca8b89259659f1afd932"
 SRC_URI = "git://github.com/nfc-tools/libnfc.git \
            file://0001-usbbus-Include-stdint.h-for-uintX_t.patch \
           "
-- 
2.17.1




