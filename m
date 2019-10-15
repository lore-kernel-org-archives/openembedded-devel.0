Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CEB487F352
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 07:47:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,298,1566835200"; d="scan'208";a="76986765"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Oct 2019 15:47:24 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 2CFE04CE14FF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 15:47:06 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 15 Oct 2019 15:47:24 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Oct 2019 15:47:30 +0800
Message-ID: <20191015074730.459-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 2CFE04CE14FF.A9A62
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pytz: upgrade 2019.2 -> 2019.3
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
X-List-Received-Date: Tue, 15 Oct 2019 07:47:24 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pytz.inc           | 4 ++--
 .../python/{python-pytz_2019.2.bb => python-pytz_2019.3.bb}   | 0
 .../python/{python3-pytz_2019.2.bb => python3-pytz_2019.3.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytz_2019.2.bb => python-pytz_2019.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytz_2019.2.bb => python3-pytz_2019.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytz.inc b/meta-python/recipes-devtools/python/python-pytz.inc
index ddeedc6c8..b4edea002 100644
--- a/meta-python/recipes-devtools/python/python-pytz.inc
+++ b/meta-python/recipes-devtools/python/python-pytz.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4878a915709225bceab739bdc2a18e8d"
 
 inherit pypi
 
-SRC_URI[md5sum] = "8c21963449c3a793aa61ef122e171516"
-SRC_URI[sha256sum] = "26c0b32e437e54a18161324a2fca3c4b9846b74a8dccddd843113109e1116b32"
+SRC_URI[md5sum] = "c3d84a465fc56a4edd52cca8873ac0df"
+SRC_URI[sha256sum] = "b02c06db6cf09c12dd25137e563b31700d3b80fcc4ad23abb7a315f2789819be"
 
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python-pytz_2019.2.bb b/meta-python/recipes-devtools/python/python-pytz_2019.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytz_2019.2.bb
rename to meta-python/recipes-devtools/python/python-pytz_2019.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytz_2019.2.bb b/meta-python/recipes-devtools/python/python3-pytz_2019.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytz_2019.2.bb
rename to meta-python/recipes-devtools/python/python3-pytz_2019.3.bb
-- 
2.20.1




