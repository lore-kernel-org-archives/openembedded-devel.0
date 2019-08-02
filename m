Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 28EC57D6C5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 06:39:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,337,1559491200"; d="scan'208";a="72733924"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Aug 2019 14:39:05 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6411B4CDFAAD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 14:39:03 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 14:39:05 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 2 Aug 2019 14:38:21 +0800
Message-ID: <20190802063821.22273-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 6411B4CDFAAD.AACC0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pyasn1-modules: upgrade 0.2.2 -> 0.2.6
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
X-List-Received-Date: Fri, 02 Aug 2019 06:39:05 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Copyright year updated to 2019.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pyasn1-modules.inc       | 6 +++---
 ...ython-pyasn1-modules_0.2.2.bb => python-pyasn1-modules_0.2.6.bb} | 0
 ...hon3-pyasn1-modules_0.2.2.bb => python3-pyasn1-modules_0.2.6.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyasn1-modules_0.2.2.bb => python-pyasn1-modules_0.2.6.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyasn1-modules_0.2.2.bb => python3-pyasn1-modules_0.2.6.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyasn1-modules.inc b/meta-python/recipes-devtools/python/python-pyasn1-modules.inc
index 87dbd1d..a9e4bbe 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1-modules.inc
+++ b/meta-python/recipes-devtools/python/python-pyasn1-modules.inc
@@ -4,10 +4,10 @@ DESCRIPTION = "A collection of ASN.1 modules expressed in form of pyasn1\
  data structures (X.509, PKCS etc.)."
 HOMEPAGE = "https://github.com/etingof/pyasn1-modules"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=815ac3f9ca693006349094b358ab3155"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a14482d15c2249de3b6f0e8a47e021fd"
 
-SRC_URI[md5sum] = "65ce1ea1021679bffe96065baab232de"
-SRC_URI[sha256sum] = "a0cf3e1842e7c60fde97cb22d275eb6f9524f5c5250489e292529de841417547"
+SRC_URI[md5sum] = "c0bbe9820c971a97f156ff343ae67911"
+SRC_URI[sha256sum] = "43c17a83c155229839cc5c6b868e8d0c6041dba149789b6d6e28801c64821722"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pyasn1-modules_0.2.2.bb b/meta-python/recipes-devtools/python/python-pyasn1-modules_0.2.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyasn1-modules_0.2.2.bb
rename to meta-python/recipes-devtools/python/python-pyasn1-modules_0.2.6.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.2.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.2.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.6.bb
-- 
2.7.4




