Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 325287E457
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 01:51:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,325,1566835200"; d="scan'208";a="77296815"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Oct 2019 09:51:56 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id D180B4CE14E4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 09:44:05 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 22 Oct 2019 09:52:00 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Oct 2019 09:52:10 +0800
Message-ID: <20191022015210.16047-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: D180B4CE14E4.A9E4C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-cryptography: upgrade 2.7 -> 2.8
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
X-List-Received-Date: Tue, 22 Oct 2019 01:51:57 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cryptography.inc           | 4 ++--
 .../python/{python-cryptography_2.7.bb => python-cryptography_2.8.bb} | 0
 .../{python3-cryptography_2.7.bb => python3-cryptography_2.8.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography_2.7.bb => python-cryptography_2.8.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography_2.7.bb => python3-cryptography_2.8.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
index 876fcc2..5acd02d 100644
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -12,8 +12,8 @@ DEPENDS += " \
     ${PYTHON_PN}-six \
 "
 
-SRC_URI[md5sum] = "7dfe1035cae43569e571318f000462a4"
-SRC_URI[sha256sum] = "e6347742ac8f35ded4a46ff835c60e68c22a536a8ae5c4422966d06946b6d4c6"
+SRC_URI[md5sum] = "77730058b556c6d9838679a94c6229ce"
+SRC_URI[sha256sum] = "3cda1f0ed8747339bbdf71b9f38ca74c7b592f24f65cdb3ab3765e4b02871651"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-cffi \
diff --git a/meta-python/recipes-devtools/python/python-cryptography_2.7.bb b/meta-python/recipes-devtools/python/python-cryptography_2.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography_2.7.bb
rename to meta-python/recipes-devtools/python/python-cryptography_2.8.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.7.bb b/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography_2.7.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
-- 
2.7.4




