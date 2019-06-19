Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6D1657DD6E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2019 08:16:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,391,1557158400"; d="scan'208";a="68023580"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jun 2019 16:16:49 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id D95024CDDAEB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2019 16:16:49 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 19 Jun 2019 16:16:57 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 19 Jun 2019 16:18:12 +0800
Message-ID: <20190619081812.11918-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: D95024CDDAEB.AAB81
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-wrapt: upgrade 1.11.1 -> 1.11.2
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
X-List-Received-Date: Wed, 19 Jun 2019 08:16:53 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-wrapt_1.11.1.bb to python-wrapt_1.11.2.bb.

-Upgrade from python3-wrapt_1.11.1.bb to python3-wrapt_1.11.2.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-wrapt.inc          | 4 ++--
 .../python/{python-wrapt_1.11.1.bb => python-wrapt_1.11.2.bb} | 0
 .../{python3-wrapt_1.11.1.bb => python3-wrapt_1.11.2.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-wrapt_1.11.1.bb => python-wrapt_1.11.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-wrapt_1.11.1.bb => python3-wrapt_1.11.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-wrapt.inc b/meta-python/recipes-devtools/python/python-wrapt.inc
index 4de09d2fd..ed49811fe 100644
--- a/meta-python/recipes-devtools/python/python-wrapt.inc
+++ b/meta-python/recipes-devtools/python/python-wrapt.inc
@@ -4,8 +4,8 @@ LICENSE = "BSD"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fdfc019b57affbe1d7a32e3d34e83db4"
 
-SRC_URI[md5sum] = "9f21acd7c0a57bf3057715c4665db3c7"
-SRC_URI[sha256sum] = "4aea003270831cceb8a90ff27c4031da6ead7ec1886023b80ce0dfe0adf61533"
+SRC_URI[md5sum] = "cc15c001b129f81eb2f79b15eb99ffe5"
+SRC_URI[sha256sum] = "565a021fd19419476b9362b05eeaa094178de64f8361e44468f9e9d7843901e1"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-wrapt_1.11.1.bb b/meta-python/recipes-devtools/python/python-wrapt_1.11.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-wrapt_1.11.1.bb
rename to meta-python/recipes-devtools/python/python-wrapt_1.11.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.11.1.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.11.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-wrapt_1.11.1.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_1.11.2.bb
-- 
2.20.1




