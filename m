Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 299EC7F823
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 05:54:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,223,1569254400"; d="scan'208";a="77396303"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Oct 2019 13:54:21 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 123024CE1508
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 13:46:28 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 24 Oct 2019 13:54:23 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Oct 2019 13:54:35 +0800
Message-ID: <20191024055435.2042-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 123024CE1508.AA873
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-backports-ssl: upgrade 3.5.0.1 -> 3.7.0.1
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
X-List-Received-Date: Thu, 24 Oct 2019 05:54:22 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...hon-backports-ssl_3.5.0.1.bb => python-backports-ssl_3.7.0.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-backports-ssl_3.5.0.1.bb => python-backports-ssl_3.7.0.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb b/meta-python/recipes-devtools/python/python-backports-ssl_3.7.0.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb
rename to meta-python/recipes-devtools/python/python-backports-ssl_3.7.0.1.bb
index 45492da..9032a7c 100644
--- a/meta-python/recipes-devtools/python/python-backports-ssl_3.5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python-backports-ssl_3.7.0.1.bb
@@ -7,10 +7,10 @@ match_hostname() function for performing this check instead of requiring every a
 implement the check separately. This backport brings match_hostname() to users of earlier versions of Python"
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=95a5ee8fd779fbeca8b4cbca64433c87"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=b2adbe8bfdeb625c9a01afd9aaa66619"
 
-SRC_URI[md5sum] = "c03fc5e2c7b3da46b81acf5cbacfe1e6"
-SRC_URI[sha256sum] = "502ad98707319f4a51fa2ca1c677bd659008d27ded9f6380c79e8932e38dcdf2"
+SRC_URI[md5sum] = "32d2f593af01a046bec3d2f5181a420a"
+SRC_URI[sha256sum] = "bb82e60f9fbf4c080eabd957c39f0641f0fc247d9a16e31e26d594d8f42b9fd2"
 
 PYPI_PACKAGE = "backports.ssl_match_hostname"
 inherit pypi setuptools
-- 
2.7.4




