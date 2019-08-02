Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 80A947F2A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 07:15:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,337,1559491200"; d="scan'208";a="72735850"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Aug 2019 15:15:19 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 95D2A4CDFAC8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 15:15:20 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 15:15:23 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 2 Aug 2019 15:14:39 +0800
Message-ID: <20190802071439.23033-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 95D2A4CDFAC8.A99C0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pytz: upgrade 2019.1 -> 2019.2
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
X-List-Received-Date: Fri, 02 Aug 2019 07:15:25 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pytz.inc                   | 4 ++--
 .../python/{python-pytz_2019.1.bb => python-pytz_2019.2.bb}           | 0
 .../python/{python3-pytz_2019.1.bb => python3-pytz_2019.2.bb}         | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytz_2019.1.bb => python-pytz_2019.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytz_2019.1.bb => python3-pytz_2019.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytz.inc b/meta-python/recipes-devtools/python/python-pytz.inc
index 928dbc0..ddeedc6 100644
--- a/meta-python/recipes-devtools/python/python-pytz.inc
+++ b/meta-python/recipes-devtools/python/python-pytz.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4878a915709225bceab739bdc2a18e8d"
 
 inherit pypi
 
-SRC_URI[md5sum] = "8b2860a161bfb0a6165798b1a2d8c40c"
-SRC_URI[sha256sum] = "d747dd3d23d77ef44c6a3526e274af6efeb0a6f1afd5a69ba4d5be4098c8e141"
+SRC_URI[md5sum] = "8c21963449c3a793aa61ef122e171516"
+SRC_URI[sha256sum] = "26c0b32e437e54a18161324a2fca3c4b9846b74a8dccddd843113109e1116b32"
 
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python-pytz_2019.1.bb b/meta-python/recipes-devtools/python/python-pytz_2019.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytz_2019.1.bb
rename to meta-python/recipes-devtools/python/python-pytz_2019.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytz_2019.1.bb b/meta-python/recipes-devtools/python/python3-pytz_2019.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytz_2019.1.bb
rename to meta-python/recipes-devtools/python/python3-pytz_2019.2.bb
-- 
2.7.4




