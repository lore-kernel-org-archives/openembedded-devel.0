Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF5C60B33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 02:12:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,569,1574092800"; d="scan'208";a="86569203"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Mar 2020 10:12:38 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id B09C650A9984
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 10:02:33 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Thu, 19 Mar 2020 10:12:36 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 19 Mar 2020 10:12:44 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Mar 2020 00:39:17 -0700
Message-ID: <1584603557-43263-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1584603557-43263-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1584603557-43263-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: B09C650A9984.A3184
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] nss: upgrade 3.50 -> 3.51
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
X-List-Received-Date: Thu, 19 Mar 2020 02:12:37 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-oe/recipes-support/nss/{nss_3.50.bb => nss_3.51.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/nss/{nss_3.50.bb => nss_3.51.bb} (98%)

diff --git a/meta-oe/recipes-support/nss/nss_3.50.bb b/meta-oe/recipes-support/nss/nss_3.51.bb
similarity index 98%
rename from meta-oe/recipes-support/nss/nss_3.50.bb
rename to meta-oe/recipes-support/nss/nss_3.51.bb
index e9855d7a7..889967c03 100644
--- a/meta-oe/recipes-support/nss/nss_3.50.bb
+++ b/meta-oe/recipes-support/nss/nss_3.51.bb
@@ -34,8 +34,8 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
 
-SRC_URI[md5sum] = "e0366615e12b147cebc136c915baea37"
-SRC_URI[sha256sum] = "185df319775243f5f5daa9d49b7f9cc5f2b389435be3247c3376579bee063ba7"
+SRC_URI[md5sum] = "e59dc16965ef7713669c628d2640ebd1"
+SRC_URI[sha256sum] = "75348b3b3229362486c57a880db917da1f96ef4eb639dc9cc2ff17d72268459c"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.17.1




