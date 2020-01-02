Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 46FF47FC7D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 07:03:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,385,1571673600"; d="scan'208";a="81231960"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Jan 2020 15:03:20 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id C0BDD406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 14:54:21 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 2 Jan 2020 15:03:16 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 2 Jan 2020 15:03:14 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Jan 2020 15:04:29 +0800
Message-ID: <20200102070429.26514-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: C0BDD406AB15.AA79E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pymisp: upgrade 2.4.117.2 -> 2.4.119.1
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
X-List-Received-Date: Thu, 02 Jan 2020 07:03:21 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pymisp.inc         | 4 ++--
 ...{python-pymisp_2.4.117.2.bb => python-pymisp_2.4.119.1.bb} | 0
 ...ython3-pymisp_2.4.117.2.bb => python3-pymisp_2.4.119.1.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.4.117.2.bb => python-pymisp_2.4.119.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.117.2.bb => python3-pymisp_2.4.119.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index 4c61d9fff..6c474920e 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[md5sum] = "77aef367e57ba7dcc6f9b3d445a960ed"
-SRC_URI[sha256sum] = "de67196f6a8916b9c52a84a1c45ea967c53fa9d2b3795b070ad2c1cbc28d79d7"
+SRC_URI[md5sum] = "57184785340e25469e4a80ff9ddce09e"
+SRC_URI[sha256sum] = "594ea0a9e150052232425009eac6dd104a80f494d0e273cc48dd114d7ea8482b"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-dateutil \
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.117.2.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.119.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymisp_2.4.117.2.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.4.119.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.117.2.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.119.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.117.2.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.119.1.bb
-- 
2.20.1




