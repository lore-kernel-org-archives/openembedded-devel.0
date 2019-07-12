Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CF37B7ECFA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 05:37:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,481,1557158400"; d="scan'208";a="71239557"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jul 2019 13:37:35 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id B6E7A4CDD99E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 13:37:29 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 12 Jul 2019 13:37:35 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 Jul 2019 13:36:45 +0800
Message-ID: <20190712053645.22201-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: B6E7A4CDD99E.AE6F2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH v3] adcli: added new recipe.
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
X-List-Received-Date: Fri, 12 Jul 2019 05:37:37 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-radiusclient-ng is too old. So, added a substitute.

-Has fixed the build on musl.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-connectivity/adcli/adcli_0.8.2.bb | 27 +++++++++++++++++++
 .../files/Fixed-build-error-on-musl.patch     | 26 ++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/adcli/adcli_0.8.2.bb
 create mode 100644 meta-networking/recipes-connectivity/adcli/files/Fixed-build-error-on-musl.patch

diff --git a/meta-networking/recipes-connectivity/adcli/adcli_0.8.2.bb b/meta-networking/recipes-connectivity/adcli/adcli_0.8.2.bb
new file mode 100644
index 000000000..75f303068
--- /dev/null
+++ b/meta-networking/recipes-connectivity/adcli/adcli_0.8.2.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Active Directory enrollment"
+DESCRIPTION = "A helper library and tools for Active Directory client operations."
+
+HOMEPAGE = "http://cgit.freedesktop.org/realmd/adcli"
+SECTION = "net"
+
+SRCREV = "cc3ef52884a48863a81acbfc741735fe09cd85f7"
+
+SRC_URI = "git://gitlab.freedesktop.org/realmd/adcli;branch=master \
+           file://Fixed-build-error-on-musl.patch \
+	   "
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
diff --git a/meta-networking/recipes-connectivity/adcli/files/Fixed-build-error-on-musl.patch b/meta-networking/recipes-connectivity/adcli/files/Fixed-build-error-on-musl.patch
new file mode 100644
index 000000000..87bcdfebd
--- /dev/null
+++ b/meta-networking/recipes-connectivity/adcli/files/Fixed-build-error-on-musl.patch
@@ -0,0 +1,26 @@
+From 0e64782a45cba9753d1210ee7d7c9dbd42f74ceb Mon Sep 17 00:00:00 2001
+From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+Date: Fri, 12 Jul 2019 12:46:54 +0800
+Subject: [PATCH] Fixed build error on musl.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+---
+ library/adutil.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/library/adutil.c b/library/adutil.c
+index 9b0c47f..b673edd 100644
+--- a/library/adutil.c
++++ b/library/adutil.c
+@@ -30,6 +30,7 @@
+ #include <assert.h>
+ #include <ctype.h>
+ #include <errno.h>
++#include <endian.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-- 
+2.20.1
+
-- 
2.20.1




