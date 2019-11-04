Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 115627C346
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 05:21:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,266,1569254400"; d="scan'208";a="77878002"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Nov 2019 13:21:57 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 6573E41B7076
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 13:13:51 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 4 Nov 2019 13:21:54 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Nov 2019 13:22:11 +0800
Message-ID: <20191104052211.27547-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 6573E41B7076.A67FD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pymisp: upgrade 2.4.93 -> 2.4.117.2
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
X-List-Received-Date: Mon, 04 Nov 2019 05:21:59 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pymisp.inc         | 4 ++--
 .../{python-pymisp_2.4.93.bb => python-pymisp_2.4.117.2.bb}   | 0
 .../{python3-pymisp_2.4.93.bb => python3-pymisp_2.4.117.2.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.4.93.bb => python-pymisp_2.4.117.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.93.bb => python3-pymisp_2.4.117.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index 468a80122..4c61d9fff 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[md5sum] = "6d549b36cbfa8c1a3323c5d6e299789e"
-SRC_URI[sha256sum] = "f4ed2000cbe1a314f1f88fd8a8eba4ad05974b351b96f1235c6e532158a39fe0"
+SRC_URI[md5sum] = "77aef367e57ba7dcc6f9b3d445a960ed"
+SRC_URI[sha256sum] = "de67196f6a8916b9c52a84a1c45ea967c53fa9d2b3795b070ad2c1cbc28d79d7"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-dateutil \
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.93.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.117.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymisp_2.4.93.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.4.117.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.93.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.117.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.93.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.117.2.bb
-- 
2.20.1




