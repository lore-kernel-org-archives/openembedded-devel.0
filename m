Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 45C3771A92
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2017 02:36:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14823144"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jan 2017 10:36:47 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3CCE147B0CB6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2017 10:36:47 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 17 Jan 2017 10:36:46 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Jan 2017 10:36:37 +0800
Message-ID: <1484620597-26212-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 3CCE147B0CB6.A7517
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-lxml: 3.7.0 -> 3.7.2
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
X-List-Received-Date: Tue, 17 Jan 2017 02:36:57 -0000
Content-Type: text/plain

Upgrade python-lxml from 3.7.0 to 3.7.2.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-lxml.inc                   | 4 ++--
 .../python/{python-lxml_3.7.0.bb => python-lxml_3.7.2.bb}             | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_3.7.0.bb => python-lxml_3.7.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 8319799..6299385 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=f9f1dc24f720c143c2240df41fe5073b \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "b78e6f7e859c2ff57add7f63a5e387b7"
-SRC_URI[sha256sum] = "9c62eb2a1862e1ae285d7e7e3b7dc8772d387b19258086afcec143c6b7b8a5c9"
+SRC_URI[md5sum] = "8dcf8d6c692b7aed9370f7462ff09935"
+SRC_URI[sha256sum] = "59d9176360dbc3919e9d4bfca85c1ca64ab4f4ee00e6f119d7150ba887e3410a"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_3.7.0.bb b/meta-python/recipes-devtools/python/python-lxml_3.7.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_3.7.0.bb
rename to meta-python/recipes-devtools/python/python-lxml_3.7.2.bb
-- 
2.7.4




