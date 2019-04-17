Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA057D35D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2019 05:08:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,360,1549900800"; d="scan'208";a="59501200"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Apr 2019 13:08:02 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id D61684CD8477
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2019 13:07:57 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 17 Apr 2019 13:07:58 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Apr 2019 13:08:47 +0800
Message-ID: <20190417050847.14540-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: D61684CD8477.AA35B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-mako: upgrade 1.0.7 -> 1.0.9
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
X-List-Received-Date: Wed, 17 Apr 2019 05:08:02 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-mako_1.0.7.bb to python-mako_1.0.9.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-mako.inc           | 4 ++--
 .../python/{python-mako_1.0.7.bb => python-mako_1.0.9.bb}     | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-mako_1.0.7.bb => python-mako_1.0.9.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-mako.inc b/meta-python/recipes-devtools/python/python-mako.inc
index a9fa55639..724d0ce5c 100644
--- a/meta-python/recipes-devtools/python/python-mako.inc
+++ b/meta-python/recipes-devtools/python/python-mako.inc
@@ -8,8 +8,8 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi
 
-SRC_URI[md5sum] = "5836cc997b1b773ef389bf6629c30e65"
-SRC_URI[sha256sum] = "4e02fde57bd4abb5ec400181e4c314f56ac3e49ba4fb8b0d50bba18cb27d25ae"
+SRC_URI[md5sum] = "d739720f3f0d6a1cb6a96ea7a4760c3e"
+SRC_URI[sha256sum] = "0728c404877cd4ca72c409c0ea372dc5f3b53fa1ad2bb434e1d216c0444ff1fd"
 
 RDEPENDS_${PN} = " \
     ${PYTHON_PN}-html \
diff --git a/meta-python/recipes-devtools/python/python-mako_1.0.7.bb b/meta-python/recipes-devtools/python/python-mako_1.0.9.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-mako_1.0.7.bb
rename to meta-python/recipes-devtools/python/python-mako_1.0.9.bb
-- 
2.20.1




