Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6A4427D714
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 02:11:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,325,1566835200"; d="scan'208";a="77298271"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Oct 2019 10:11:10 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id B1ED44B6EC92
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 10:03:13 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 22 Oct 2019 10:11:05 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Oct 2019 10:11:18 +0800
Message-ID: <20191022021118.16265-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: B1ED44B6EC92.AAAAC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-cryptography-vectors: upgrade 2.7 -> 2.8
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
X-List-Received-Date: Tue, 22 Oct 2019 02:11:11 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-cryptography-vectors.inc   | 4 ++--
 ...cryptography-vectors_2.7.bb => python-cryptography-vectors_2.8.bb} | 0
 ...ryptography-vectors_2.7.bb => python3-cryptography-vectors_2.8.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography-vectors_2.7.bb => python-cryptography-vectors_2.8.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_2.7.bb => python3-cryptography-vectors_2.8.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
index 887d2d3..10af48c 100644
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
@@ -8,8 +8,8 @@ DEPENDS += " \
     ${PYTHON_PN}-cryptography \
 "
 
-SRC_URI[md5sum] = "1a518a28ed9c924ca6c570aa8ea0c334"
-SRC_URI[sha256sum] = "f12dfb9bd669a68004074cb5b26df6e93ed1a95ebd1a999dff0a840212ff68bc"
+SRC_URI[md5sum] = "a744ed29bb9ef56b3a50317fea3b218e"
+SRC_URI[sha256sum] = "6cd32174c56a3eca72f64af43c1daacaae758cfa5ff9d280dfcf818fa11ef116"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_2.7.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_2.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography-vectors_2.7.bb
rename to meta-python/recipes-devtools/python/python-cryptography-vectors_2.8.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.7.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_2.7.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb
-- 
2.7.4




