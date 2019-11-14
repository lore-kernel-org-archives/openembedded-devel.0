Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 72C137F841
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 02:15:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,302,1569254400"; d="scan'208";a="78430728"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Nov 2019 10:15:54 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 2A5BC4B6EC71
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 10:07:44 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 14 Nov 2019 10:16:04 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Nov 2019 10:16:27 +0800
Message-ID: <20191114021627.31567-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 2A5BC4B6EC71.AA97E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-psutil: upgrade 5.6.3 -> 5.6.5
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
X-List-Received-Date: Thu, 14 Nov 2019 02:15:54 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-psutil.inc         | 4 ++--
 .../python/{python-psutil_5.6.3.bb => python-psutil_5.6.5.bb} | 0
 .../{python3-psutil_5.6.3.bb => python3-psutil_5.6.5.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-psutil_5.6.3.bb => python-psutil_5.6.5.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-psutil_5.6.3.bb => python3-psutil_5.6.5.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
index 380b9bc92..931226699 100644
--- a/meta-python/recipes-devtools/python/python-psutil.inc
+++ b/meta-python/recipes-devtools/python/python-psutil.inc
@@ -2,8 +2,8 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b"
 
-SRC_URI[md5sum] = "1bbc1788588cc3c2c461cd98a830ba72"
-SRC_URI[sha256sum] = "863a85c1c0a5103a12c05a35e59d336e1d665747e531256e061213e2e90f63f3"
+SRC_URI[md5sum] = "5561dfe61b5888fb1b3f17fbe4eeb15d"
+SRC_URI[sha256sum] = "d051532ac944f1be0179e0506f6889833cf96e466262523e57a871de65a15147"
 
 PACKAGES =+ "${PN}-tests"
 
diff --git a/meta-python/recipes-devtools/python/python-psutil_5.6.3.bb b/meta-python/recipes-devtools/python/python-psutil_5.6.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-psutil_5.6.3.bb
rename to meta-python/recipes-devtools/python/python-psutil_5.6.5.bb
diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.6.3.bb b/meta-python/recipes-devtools/python/python3-psutil_5.6.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-psutil_5.6.3.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.6.5.bb
-- 
2.20.1




