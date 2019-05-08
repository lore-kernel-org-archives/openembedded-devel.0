Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E94677D67C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 09:46:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,445,1549900800"; d="scan'208";a="62111860"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 May 2019 17:46:08 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 11A394CDB300
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 17:46:08 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 8 May 2019 17:46:08 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 8 May 2019 17:47:04 +0800
Message-ID: <20190508094704.2467-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 11A394CDB300.AC7C3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-alembic: upgrade 1.0.9 -> 1.0.10
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
X-List-Received-Date: Wed, 08 May 2019 09:46:09 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-alembic_1.0.9.bb to python-alembic_1.0.10.bb.

-Upgrade from python3-alembic_1.0.9.bb to python3-alembic_1.0.10.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-alembic.inc        | 4 ++--
 .../{python-alembic_1.0.9.bb => python-alembic_1.0.10.bb}     | 0
 .../{python3-alembic_1.0.9.bb => python3-alembic_1.0.10.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-alembic_1.0.9.bb => python-alembic_1.0.10.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.0.9.bb => python3-alembic_1.0.10.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-alembic.inc b/meta-python/recipes-devtools/python/python-alembic.inc
index a7701a3bc..9d556e7ef 100644
--- a/meta-python/recipes-devtools/python/python-alembic.inc
+++ b/meta-python/recipes-devtools/python/python-alembic.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "A database migration tool for SQLAlchemy"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a5befaf254582f10aadd62d83cd20322"
 
-SRC_URI[md5sum] = "d1ebe49c7f71dfbd0daa8905df95668b"
-SRC_URI[sha256sum] = "40b9a619aa5f25ea1e1508adcda88b33704ef28e02c9cfa6471e5c772ecf0829"
+SRC_URI[md5sum] = "9969c707786f41f1b95c09c54f8970e9"
+SRC_URI[sha256sum] = "828dcaa922155a2b7166c4f36ec45268944e4055c86499bd14319b4c8c0094b7"
 
 PYPI_PACKAGE = "alembic"
 
diff --git a/meta-python/recipes-devtools/python/python-alembic_1.0.9.bb b/meta-python/recipes-devtools/python/python-alembic_1.0.10.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-alembic_1.0.9.bb
rename to meta-python/recipes-devtools/python/python-alembic_1.0.10.bb
diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.0.9.bb b/meta-python/recipes-devtools/python/python3-alembic_1.0.10.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-alembic_1.0.9.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.0.10.bb
-- 
2.20.1




