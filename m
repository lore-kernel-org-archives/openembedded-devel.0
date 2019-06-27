Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id ED7966B5C5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 05:57:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,422,1557158400"; d="scan'208";a="69655343"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Jun 2019 13:57:05 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 1B2C84CDDD22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 13:57:06 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 27 Jun 2019 13:57:17 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <1559871393-38760-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: 1B2C84CDDD22.AD165
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH v2] adcli: added new recipe.
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
Date: Thu, 27 Jun 2019 05:57:06 -0000
X-Original-Date: Fri, 7 Jun 2019 09:36:33 +0800
X-List-Received-Date: Thu, 27 Jun 2019 05:57:06 -0000
Content-Type: text/plain

radiusclient-ng is too old. So, added a substitute.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../recipes-connectivity/adcli/adcli_0.8.2.bb      | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/adcli/adcli_0.8.2.bb

diff --git a/meta-networking/recipes-connectivity/adcli/adcli_0.8.2.bb b/meta-networking/recipes-connectivity/adcli/adcli_0.8.2.bb
new file mode 100644
index 0000000..a98a1b3
--- /dev/null
+++ b/meta-networking/recipes-connectivity/adcli/adcli_0.8.2.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Active Directory enrollment"
+DESCRIPTION = "A helper library and tools for Active Directory client operations."
+
+HOMEPAGE = "http://cgit.freedesktop.org/realmd/adcli"
+SECTION = "net"
+
+SRCREV = "cc3ef52884a48863a81acbfc741735fe09cd85f7"
+
+SRC_URI = "git://gitlab.freedesktop.org/realmd/adcli;branch=master \
+          "
+
+S = "${WORKDIR}/git"
+
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
+
+inherit autotools xmlcatalog 
+
+DEPENDS += "virtual/crypt krb5 openldap gettext libxslt xmlto libxml2-native \
+            cyrus-sasl libxslt-native xmlto-native coreutils-native\
+           "
+
+EXTRA_OECONF += "--disable-static \
+                 --disable-silent-rules \
+                 --disable-doc \
+                "
-- 
2.7.4




