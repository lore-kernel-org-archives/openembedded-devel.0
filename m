Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 31ECD7E726
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2019 08:31:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,391,1557158400"; d="scan'208";a="68025225"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jun 2019 16:31:04 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id C75F84CDD988
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2019 16:30:59 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 19 Jun 2019 16:31:12 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 19 Jun 2019 16:32:22 +0800
Message-ID: <20190619083222.13309-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: C75F84CDD988.AB293
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-certifi: upgrade 2019.3.9 -> 2019.6.16
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
X-List-Received-Date: Wed, 19 Jun 2019 08:31:04 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-certifi_2019.3.9.bb to python-certifi_2019.6.16.bb.

-Upgrade from python3-certifi_2019.3.9.bb to python3-certifi_2019.6.16.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-certifi.inc        | 4 ++--
 ...python-certifi_2019.3.9.bb => python-certifi_2019.6.16.bb} | 0
 ...thon3-certifi_2019.3.9.bb => python3-certifi_2019.6.16.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-certifi_2019.3.9.bb => python-certifi_2019.6.16.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-certifi_2019.3.9.bb => python3-certifi_2019.6.16.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-certifi.inc b/meta-python/recipes-devtools/python/python-certifi.inc
index 9d99b3475..23e18563a 100644
--- a/meta-python/recipes-devtools/python/python-certifi.inc
+++ b/meta-python/recipes-devtools/python/python-certifi.inc
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
 
-SRC_URI[md5sum] = "76381d19d0a1171fecb2d1002b81424e"
-SRC_URI[sha256sum] = "b26104d6835d1f5e49452a26eb2ff87fe7090b89dfcaee5ea2212697e1e1d7ae"
+SRC_URI[md5sum] = "af8fea5f3df6f7f81e9c6cbc6dd7c1e8"
+SRC_URI[sha256sum] = "945e3ba63a0b9f577b1395204e13c3a231f9bc0223888be653286534e5873695"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-certifi_2019.3.9.bb b/meta-python/recipes-devtools/python/python-certifi_2019.6.16.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-certifi_2019.3.9.bb
rename to meta-python/recipes-devtools/python/python-certifi_2019.6.16.bb
diff --git a/meta-python/recipes-devtools/python/python3-certifi_2019.3.9.bb b/meta-python/recipes-devtools/python/python3-certifi_2019.6.16.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-certifi_2019.3.9.bb
rename to meta-python/recipes-devtools/python/python3-certifi_2019.6.16.bb
-- 
2.20.1




