Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C08C879B57
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 08:06:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,389,1549900800"; d="scan'208";a="60370999"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Apr 2019 16:06:31 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 89CD34CDAACD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 16:06:33 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 24 Apr 2019 16:06:32 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Apr 2019 16:07:21 +0800
Message-ID: <20190424080721.17624-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 89CD34CDAACD.AC6DC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-hyperlink: upgrade 18.0.0 -> 19.0.0
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
X-List-Received-Date: Wed, 24 Apr 2019 08:06:32 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-hyperlink_18.0.0.bb to python-hyperlink_19.0.0.bb.

-Upgrade from python3-hyperlink_18.0.0.bb to python3-hyperlink_19.0.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-hyperlink.inc      | 4 ++--
 ...{python-hyperlink_18.0.0.bb => python-hyperlink_19.0.0.bb} | 0
 ...ython3-hyperlink_18.0.0.bb => python3-hyperlink_19.0.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-hyperlink_18.0.0.bb => python-hyperlink_19.0.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-hyperlink_18.0.0.bb => python3-hyperlink_19.0.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-hyperlink.inc b/meta-python/recipes-devtools/python/python-hyperlink.inc
index 78e3ee830..25398541c 100644
--- a/meta-python/recipes-devtools/python/python-hyperlink.inc
+++ b/meta-python/recipes-devtools/python/python-hyperlink.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/python-hyper/hyperlink"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3893d4ed05dcc823f8ed685a9ea19bcb"
 
-SRC_URI[sha256sum] = "f01b4ff744f14bc5d0a22a6b9f1525ab7d6312cb0ff967f59414bbac52f0a306"
-SRC_URI[md5sum] = "f41a96779b324d824864696a94b24823"
+SRC_URI[sha256sum] = "4288e34705da077fada1111a24a0aa08bb1e76699c9ce49876af722441845654"
+SRC_URI[md5sum] = "4772fb4d87c26a1ab22a6161424e3cba"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-hyperlink_18.0.0.bb b/meta-python/recipes-devtools/python/python-hyperlink_19.0.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-hyperlink_18.0.0.bb
rename to meta-python/recipes-devtools/python/python-hyperlink_19.0.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-hyperlink_18.0.0.bb b/meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-hyperlink_18.0.0.bb
rename to meta-python/recipes-devtools/python/python3-hyperlink_19.0.0.bb
-- 
2.20.1




