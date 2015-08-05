Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id BEF6E60089
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2015 10:43:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99293883"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Aug 2015 18:46:42 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t75AfJXS023859
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Aug 2015 18:41:19 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 5 Aug 2015 18:43:13 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Aug 2015 18:43:13 +0800
Message-ID: <1438771393-4782-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-python][PATCH v3] python-requests: upgrade 2.5.1->2.7.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Aug 2015 10:43:15 -0000
Content-Type: text/plain

License COPYRIGHT year changed.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../python/{python-requests_2.5.1.bb => python-requests_2.7.0.bb}  | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-requests_2.5.1.bb => python-requests_2.7.0.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python-requests_2.5.1.bb b/meta-python/recipes-devtools/python/python-requests_2.7.0.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python-requests_2.5.1.bb
rename to meta-python/recipes-devtools/python/python-requests_2.7.0.bb
index b719dca..1564d50 100644
--- a/meta-python/recipes-devtools/python/python-requests_2.5.1.bb
+++ b/meta-python/recipes-devtools/python/python-requests_2.7.0.bb
@@ -2,15 +2,14 @@ DESCRIPTION = "Python HTTP for Humans."
 HOMEPAGE = "http://python-requests.org"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c7869e52c8275537186de35e3cd5f9ec"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=58c7e163c9f8ee037246da101c6afd1e"
 
-PR = "r0"
 SRCNAME = "requests"
 
 SRC_URI = "http://pypi.python.org/packages/source/r/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "c270eb5551a02e8ab7a4cbb83e22af2e"
-SRC_URI[sha256sum] = "7b7735efd3b1e2323dc9fcef060b380d05f5f18bd0f247f5e9e74a628279de66"
+SRC_URI[md5sum] = "29b173fd5fa572ec0764d1fd7b527260"
+SRC_URI[sha256sum] = "398a3db6d61899d25fd4a06c6ca12051b0ce171d705decd7ed5511517b4bb93d"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.8.4.2


