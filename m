Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2B4477F9BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 09:29:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,322,1574092800"; d="scan'208";a="81889305"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jan 2020 17:29:37 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 789D64CE1C86
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 17:20:28 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 15 Jan 2020 17:29:33 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 15 Jan 2020 17:29:43 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 15 Jan 2020 05:12:31 -0800
Message-ID: <1579093951-77460-16-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1579093951-77460-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 789D64CE1C86.A38B4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pyrsistent: upgrade 0.15.5 -> 0.15.7
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
X-List-Received-Date: Wed, 15 Jan 2020 09:29:36 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pyrsistent.inc     | 4 ++--
 ...ython-pyrsistent_0.15.5.bb => python-pyrsistent_0.15.7.bb} | 0
 ...hon3-pyrsistent_0.15.5.bb => python3-pyrsistent_0.15.7.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyrsistent_0.15.5.bb => python-pyrsistent_0.15.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyrsistent_0.15.5.bb => python3-pyrsistent_0.15.7.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyrsistent.inc b/meta-python/recipes-devtools/python/python-pyrsistent.inc
index fad488dd9..ae4f21af4 100644
--- a/meta-python/recipes-devtools/python/python-pyrsistent.inc
+++ b/meta-python/recipes-devtools/python/python-pyrsistent.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/tobgu/pyrsistent"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.mit;md5=ca574f2891cf528b3e7a2ee570337e7c"
 
-SRC_URI[md5sum] = "903c518c8829de4ee255cff68ff8da45"
-SRC_URI[sha256sum] = "eb6545dbeb1aa69ab1fb4809bfbf5a8705e44d92ef8fc7c2361682a47c46c778"
+SRC_URI[md5sum] = "da9486d00ef5b213f40d5cf3c5bca82d"
+SRC_URI[sha256sum] = "cdc7b5e3ed77bed61270a47d35434a30617b9becdf2478af76ad2c6ade307280"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-six \
diff --git a/meta-python/recipes-devtools/python/python-pyrsistent_0.15.5.bb b/meta-python/recipes-devtools/python/python-pyrsistent_0.15.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyrsistent_0.15.5.bb
rename to meta-python/recipes-devtools/python/python-pyrsistent_0.15.7.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.5.bb b/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyrsistent_0.15.5.bb
rename to meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb
-- 
2.17.1




