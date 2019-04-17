Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id EA55A7D354
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2019 05:20:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,360,1549900800"; d="scan'208";a="59502251"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Apr 2019 13:20:36 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 5E0FD4CD84C4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2019 13:20:33 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 17 Apr 2019 13:20:33 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Apr 2019 13:21:23 +0800
Message-ID: <20190417052123.18433-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 5E0FD4CD84C4.AB4F0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-msgpack: upgrade 0.6.0 -> 0.6.1
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
X-List-Received-Date: Wed, 17 Apr 2019 05:20:37 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-msgpack_0.6.0.bb to python-msgpack_0.6.1.bb.

-Upgrade from python3-msgpack_0.6.0.bb to python3-msgpack_0.6.1.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-msgpack.inc        | 4 ++--
 .../{python-msgpack_0.6.0.bb => python-msgpack_0.6.1.bb}      | 0
 .../{python3-msgpack_0.6.0.bb => python3-msgpack_0.6.1.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-msgpack_0.6.0.bb => python-msgpack_0.6.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-msgpack_0.6.0.bb => python3-msgpack_0.6.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-msgpack.inc b/meta-python/recipes-devtools/python/python-msgpack.inc
index 9147c0632..3a97042e0 100644
--- a/meta-python/recipes-devtools/python/python-msgpack.inc
+++ b/meta-python/recipes-devtools/python/python-msgpack.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
 PYPI_PACKAGE = "msgpack"
 inherit pypi
 
-SRC_URI[md5sum] = "be3043cc2c1e3b5ebf08463ffa71cf17"
-SRC_URI[sha256sum] = "64abc6bf3a2ac301702f5760f4e6e227d0fd4d84d9014ef9a40faa9d43365259"
+SRC_URI[md5sum] = "1b96537be6f5186fed0d131aaa59ef26"
+SRC_URI[sha256sum] = "4008c72f5ef2b7936447dcb83db41d97e9791c83221be13d5e19db0796df1972"
 
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-io \
diff --git a/meta-python/recipes-devtools/python/python-msgpack_0.6.0.bb b/meta-python/recipes-devtools/python/python-msgpack_0.6.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-msgpack_0.6.0.bb
rename to meta-python/recipes-devtools/python/python-msgpack_0.6.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-msgpack_0.6.0.bb b/meta-python/recipes-devtools/python/python3-msgpack_0.6.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-msgpack_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_0.6.1.bb
-- 
2.20.1




