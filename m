Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB4D7F291
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 05:56:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,385,1571673600"; d="scan'208";a="81230320"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Jan 2020 13:56:19 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 0D86A406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 13:47:22 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 2 Jan 2020 13:56:16 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 2 Jan 2020 13:56:14 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Jan 2020 13:57:32 +0800
Message-ID: <20200102055732.18303-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 0D86A406AB15.AC8CE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-psutil: upgrade 5.6.5 -> 5.6.7
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
X-List-Received-Date: Thu, 02 Jan 2020 05:56:18 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-psutil.inc         | 4 ++--
 .../python/{python-psutil_5.6.5.bb => python-psutil_5.6.7.bb} | 0
 .../{python3-psutil_5.6.5.bb => python3-psutil_5.6.7.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-psutil_5.6.5.bb => python-psutil_5.6.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-psutil_5.6.5.bb => python3-psutil_5.6.7.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
index 931226699..bf49d9863 100644
--- a/meta-python/recipes-devtools/python/python-psutil.inc
+++ b/meta-python/recipes-devtools/python/python-psutil.inc
@@ -2,8 +2,8 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b"
 
-SRC_URI[md5sum] = "5561dfe61b5888fb1b3f17fbe4eeb15d"
-SRC_URI[sha256sum] = "d051532ac944f1be0179e0506f6889833cf96e466262523e57a871de65a15147"
+SRC_URI[md5sum] = "b2c94e0368fc6e6f237a7252f8e85ca2"
+SRC_URI[sha256sum] = "ffad8eb2ac614518bbe3c0b8eb9dffdb3a8d2e3a7d5da51c5b974fb723a5c5aa"
 
 PACKAGES =+ "${PN}-tests"
 
diff --git a/meta-python/recipes-devtools/python/python-psutil_5.6.5.bb b/meta-python/recipes-devtools/python/python-psutil_5.6.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-psutil_5.6.5.bb
rename to meta-python/recipes-devtools/python/python-psutil_5.6.7.bb
diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.6.5.bb b/meta-python/recipes-devtools/python/python3-psutil_5.6.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-psutil_5.6.5.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.6.7.bb
-- 
2.20.1




