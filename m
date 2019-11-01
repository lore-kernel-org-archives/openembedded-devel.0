Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 95E627D27B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 03:39:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,253,1569254400"; d="scan'208";a="77776121"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Nov 2019 11:39:50 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id BC2CC4CE1508
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 11:31:48 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 1 Nov 2019 11:39:51 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Nov 2019 11:40:05 +0800
Message-ID: <20191101034005.26459-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: BC2CC4CE1508.AA46E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pint: upgrade 0.8.1 -> 0.9
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
X-List-Received-Date: Fri, 01 Nov 2019 03:39:50 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pint.inc           | 4 ++--
 .../python/{python-pint_0.8.1.bb => python-pint_0.9.bb}       | 0
 .../python/{python3-pint_0.8.1.bb => python3-pint_0.9.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pint_0.8.1.bb => python-pint_0.9.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pint_0.8.1.bb => python3-pint_0.9.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pint.inc b/meta-python/recipes-devtools/python/python-pint.inc
index 2bc8e4ab6..0900d91d7 100644
--- a/meta-python/recipes-devtools/python/python-pint.inc
+++ b/meta-python/recipes-devtools/python/python-pint.inc
@@ -9,7 +9,7 @@ PYPI_PACKAGE := "Pint"
 
 inherit pypi
 
-SRC_URI[md5sum] = "e1f80f3f8fc4e61f68ad3912db26b3a8"
-SRC_URI[sha256sum] = "afcf31443a478c32bbac4b00337ee9026a13d0e2ac83d30c79151462513bb0d4"
+SRC_URI[md5sum] = "d0681cb7cfaca9fc68ce7edab0d08d88"
+SRC_URI[sha256sum] = "32d8a9a9d63f4f81194c0014b3b742679dce81a26d45127d9810a68a561fe4e2"
 
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-pint_0.8.1.bb b/meta-python/recipes-devtools/python/python-pint_0.9.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pint_0.8.1.bb
rename to meta-python/recipes-devtools/python/python-pint_0.9.bb
diff --git a/meta-python/recipes-devtools/python/python3-pint_0.8.1.bb b/meta-python/recipes-devtools/python/python3-pint_0.9.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pint_0.8.1.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.9.bb
-- 
2.20.1




