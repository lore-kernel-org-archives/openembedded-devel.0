Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4C6D97F4FE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 09:00:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,268,1571673600"; d="scan'208";a="79439211"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Dec 2019 17:00:30 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 39F324CE1BED
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 16:51:59 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 2 Dec 2019 17:00:28 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Dec 2019 07:28:14 -0800
Message-ID: <1575300494-101612-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575300494-101612-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1575300494-101612-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 39F324CE1BED.A86BA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-pbr: upgrade 5.4.3 -> 5.4.4
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
X-List-Received-Date: Mon, 02 Dec 2019 09:00:30 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/{python-pbr_5.4.3.bb => python-pbr_5.4.4.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pbr_5.4.3.bb => python-pbr_5.4.4.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python-pbr_5.4.3.bb b/meta-python/recipes-devtools/python/python-pbr_5.4.4.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python-pbr_5.4.3.bb
rename to meta-python/recipes-devtools/python/python-pbr_5.4.4.bb
index b21722f..9d7d8d7 100644
--- a/meta-python/recipes-devtools/python/python-pbr_5.4.3.bb
+++ b/meta-python/recipes-devtools/python/python-pbr_5.4.4.bb
@@ -2,8 +2,8 @@ inherit setuptools
 # The inc file is in oe-core
 require recipes-devtools/python/python-pbr.inc
 
-SRC_URI[md5sum] = "477d2aa285ad97250a172b199f4060b7"
-SRC_URI[sha256sum] = "2c8e420cd4ed4cec4e7999ee47409e876af575d4c35a45840d59e8b5f3155ab8"
+SRC_URI[md5sum] = "65cdc32e1a1ff56d481fc15aa8caf988"
+SRC_URI[sha256sum] = "139d2625547dbfa5fb0b81daebb39601c478c21956dc57e2e07b74450a8c506b"
 
 do_install_append() {
         if [ -f ${D}${bindir}/pbr ]; then
-- 
2.7.4




