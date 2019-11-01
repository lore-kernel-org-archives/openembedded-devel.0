Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3C44D7FC09
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 07:24:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,254,1569254400"; d="scan'208";a="77785460"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Nov 2019 15:24:07 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 238424CE1513
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 15:16:06 +0800 (CST)
Received: from localhost.localdomain (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 1 Nov 2019 15:24:06 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Nov 2019 15:24:03 +0800
Message-ID: <20191101072403.27354-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 238424CE1513.A4FF5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pyfirmata: upgrade 1.0.3 -> 1.1.0
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
X-List-Received-Date: Fri, 01 Nov 2019 07:24:09 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pyfirmata.inc      | 4 ++--
 .../{python-pyfirmata_1.0.3.bb => python-pyfirmata_1.1.0.bb}  | 0
 ...{python3-pyfirmata_1.0.3.bb => python3-pyfirmata_1.1.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyfirmata_1.0.3.bb => python-pyfirmata_1.1.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyfirmata_1.0.3.bb => python3-pyfirmata_1.1.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyfirmata.inc b/meta-python/recipes-devtools/python/python-pyfirmata.inc
index 2365379aa..2a53574e2 100644
--- a/meta-python/recipes-devtools/python/python-pyfirmata.inc
+++ b/meta-python/recipes-devtools/python/python-pyfirmata.inc
@@ -7,7 +7,7 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-pyserial \
 "
 
-SRC_URI[md5sum] = "ee4c23ca5c35d3091d550a63540811a3"
-SRC_URI[sha256sum] = "b54d49d66a9d93c1ef9c72ca01264414cb2de177baac116c12d5cce0c380160c"
+SRC_URI[md5sum] = "159673cfb56c72ceafc30fe91eedd847"
+SRC_URI[sha256sum] = "cc180d1b30c85a2bbca62c15fef1b871db048cdcfa80959968356d97bd3ff08e"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pyfirmata_1.0.3.bb b/meta-python/recipes-devtools/python/python-pyfirmata_1.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyfirmata_1.0.3.bb
rename to meta-python/recipes-devtools/python/python-pyfirmata_1.1.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyfirmata_1.0.3.bb b/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyfirmata_1.0.3.bb
rename to meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb
-- 
2.20.1




