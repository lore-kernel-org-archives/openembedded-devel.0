Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 61F907F402
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2019 03:18:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,273,1566835200"; d="scan'208";a="76679470"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Oct 2019 11:18:51 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 09F274CE14F9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2019 11:18:46 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 9 Oct 2019 11:18:48 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Oct 2019 11:18:49 +0800
Message-ID: <20191009031849.21196-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 09F274CE14F9.AA87F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH] firewalld: upgrade 0.7.1 -> 0.7.2
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
X-List-Received-Date: Wed, 09 Oct 2019 03:18:52 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../firewalld/{firewalld_0.7.1.bb => firewalld_0.7.2.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/firewalld/{firewalld_0.7.1.bb => firewalld_0.7.2.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.1.bb b/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.2.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/firewalld/firewalld_0.7.1.bb
rename to meta-networking/recipes-connectivity/firewalld/firewalld_0.7.2.bb
index fab27f1..7d80a63 100644
--- a/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.1.bb
+++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.2.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
            file://firewalld.init \
 "
-SRC_URI[md5sum] = "32c16df3f6cc859d0df627baf5ee8401"
-SRC_URI[sha256sum] = "88bc63a011209ac046fb5d7bfc73ddcc0bc616ddf3013bbb6bf1a421cb497f76"
+SRC_URI[md5sum] = "2549c2006def07a19b4c77ec960e5aab"
+SRC_URI[sha256sum] = "fbd1b72b3c4b4d0c20659f664b2ba36175364ffbb9cebf3bdfaf9b5e6983be77"
 
 # glib-2.0-native is needed for GSETTINGS_RULES autoconf macro from gsettings.m4
 DEPENDS = "intltool-native glib-2.0-native libxslt-native docbook-xsl-stylesheets-native"
-- 
2.7.4




