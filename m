Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8BCD67FC14
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 05:12:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,253,1569254400"; d="scan'208";a="77779125"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Nov 2019 13:12:29 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id B32AD4CE1514
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 13:04:27 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 1 Nov 2019 13:12:28 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Nov 2019 13:12:44 +0800
Message-ID: <20191101051244.28406-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: B32AD4CE1514.AA62F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-progress: upgrade 1.4 -> 1.5
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
X-List-Received-Date: Fri, 01 Nov 2019 05:12:47 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-progress.inc       | 4 ++--
 .../python/{python-progress_1.4.bb => python-progress_1.5.bb} | 0
 .../{python3-progress_1.4.bb => python3-progress_1.5.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-progress_1.4.bb => python-progress_1.5.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-progress_1.4.bb => python3-progress_1.5.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-progress.inc b/meta-python/recipes-devtools/python/python-progress.inc
index 9f00615c4..d59ba2cc5 100644
--- a/meta-python/recipes-devtools/python/python-progress.inc
+++ b/meta-python/recipes-devtools/python/python-progress.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://github.com/verigak/progress/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aef5566ac4fede9815eccf124c281317"
 
-SRC_URI[md5sum] = "057981e2f09029288f5255b1ea3ab64d"
-SRC_URI[sha256sum] = "5e2f9da88ed8236a76fffbee3ceefd259589cf42dfbc2cec2877102189fae58a"
+SRC_URI[md5sum] = "408df0e3db0ad4b74f19f6beec814ae4"
+SRC_URI[sha256sum] = "69ecedd1d1bbe71bf6313d88d1e6c4d2957b7f1d4f71312c211257f7dae64372"
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python-progress_1.4.bb b/meta-python/recipes-devtools/python/python-progress_1.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-progress_1.4.bb
rename to meta-python/recipes-devtools/python/python-progress_1.5.bb
diff --git a/meta-python/recipes-devtools/python/python3-progress_1.4.bb b/meta-python/recipes-devtools/python/python3-progress_1.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-progress_1.4.bb
rename to meta-python/recipes-devtools/python/python3-progress_1.5.bb
-- 
2.20.1




