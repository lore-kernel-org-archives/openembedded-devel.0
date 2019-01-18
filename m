Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C93847C226
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2019 03:08:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,489,1539619200"; d="scan'208";a="52265990"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jan 2019 11:08:27 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id C46574C47E95
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2019 11:08:28 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Fri, 18 Jan 2019 11:08:28 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Jan 2019 11:09:00 +0800
Message-ID: <20190118030900.11354-2-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190118030900.11354-1-hongl.fnst@cn.fujitsu.com>
References: <20190118030900.11354-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: C46574C47E95.AF838
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH][thud][meta-oe][PATCH]:logwatch:replace mv with cp
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
X-List-Received-Date: Fri, 18 Jan 2019 03:08:27 -0000
Content-Type: text/plain

1.Mv is used in the original code, which may cause "mv: cannot stat 'conf/': No such file or directory".
  So we use cp instead of it.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-extended/logwatch/logwatch_7.4.3.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/logwatch/logwatch_7.4.3.bb b/meta-oe/recipes-extended/logwatch/logwatch_7.4.3.bb
index aea539ef0..275a8f238 100644
--- a/meta-oe/recipes-extended/logwatch/logwatch_7.4.3.bb
+++ b/meta-oe/recipes-extended/logwatch/logwatch_7.4.3.bb
@@ -20,9 +20,9 @@ do_install() {
     install -m 0755 -d ${D}${datadir}/logwatch/dist.conf/logfiles
     install -m 0755 -d ${D}${datadir}/logwatch/dist.conf/services
     install -m 0755 -d ${D}${localstatedir}/cache/logwatch
-    mv conf/ ${D}${datadir}/logwatch/default.conf
-    mv scripts/ ${D}${datadir}/logwatch/scripts
-    mv lib ${D}${datadir}/logwatch/lib
+    cp -r -f conf/ ${D}${datadir}/logwatch/default.conf
+    cp -r -f scripts/ ${D}${datadir}/logwatch/scripts
+    cp -r -f lib ${D}${datadir}/logwatch/lib
     chown -R root:root ${D}${datadir}/logwatch
 
     install -m 0755 -d ${D}${mandir}/man1
-- 
2.17.2




