Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 74CEF7C749
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2019 02:29:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,364,1549900800"; d="scan'208";a="59580260"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Apr 2019 10:29:44 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 0704E4CD84D6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2019 10:29:44 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 18 Apr 2019 10:29:43 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Apr 2019 10:30:33 +0800
Message-ID: <20190418023033.18559-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 0704E4CD84D6.AD690
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pytz: upgrade 2018.5 -> 2019.1
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
X-List-Received-Date: Thu, 18 Apr 2019 02:29:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-pytz_2018.5.bb to python-pytz_2019.1.bb.

-Upgrade from python3-pytz_2018.5.bb to python3-pytz_2019.1.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pytz.inc           | 4 ++--
 .../python/{python-pytz_2018.5.bb => python-pytz_2019.1.bb}   | 0
 .../python/{python3-pytz_2018.5.bb => python3-pytz_2019.1.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytz_2018.5.bb => python-pytz_2019.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytz_2018.5.bb => python3-pytz_2019.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytz.inc b/meta-python/recipes-devtools/python/python-pytz.inc
index aedffe15f..928dbc00c 100644
--- a/meta-python/recipes-devtools/python/python-pytz.inc
+++ b/meta-python/recipes-devtools/python/python-pytz.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4878a915709225bceab739bdc2a18e8d"
 
 inherit pypi
 
-SRC_URI[md5sum] = "45409cbfa3927bdd2f3ee914dd5b1060"
-SRC_URI[sha256sum] = "ffb9ef1de172603304d9d2819af6f5ece76f2e85ec10692a524dd876e72bf277"
+SRC_URI[md5sum] = "8b2860a161bfb0a6165798b1a2d8c40c"
+SRC_URI[sha256sum] = "d747dd3d23d77ef44c6a3526e274af6efeb0a6f1afd5a69ba4d5be4098c8e141"
 
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python-pytz_2018.5.bb b/meta-python/recipes-devtools/python/python-pytz_2019.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytz_2018.5.bb
rename to meta-python/recipes-devtools/python/python-pytz_2019.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytz_2018.5.bb b/meta-python/recipes-devtools/python/python3-pytz_2019.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytz_2018.5.bb
rename to meta-python/recipes-devtools/python/python3-pytz_2019.1.bb
-- 
2.20.1




