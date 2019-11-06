Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3934C7F8AF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 08:30:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,274,1569254400"; d="scan'208";a="77943142"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Nov 2019 16:30:25 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 2AB294CE1A01
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 16:22:21 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 6 Nov 2019 16:30:24 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Nov 2019 20:10:09 +0800
Message-ID: <1573042209-43148-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2AB294CE1A01.A56D5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] ccid: upgrade 1.4.30 -> 1.4.31
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
X-List-Received-Date: Wed, 06 Nov 2019 08:30:25 -0000
Content-Type: text/plain

1) Add 0001-Add-build-rule-for-README.patch to fix do_configure error:
   Makefile.am: required file `./README' not found

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../ccid/ccid/0001-Add-build-rule-for-README.patch | 22 ++++++++++++++++++++++
 .../ccid/{ccid_1.4.30.bb => ccid_1.4.31.bb}        |  5 +++--
 2 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-README.patch
 rename meta-oe/recipes-support/ccid/{ccid_1.4.30.bb => ccid_1.4.31.bb} (71%)

diff --git a/meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-README.patch b/meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-README.patch
new file mode 100644
index 0000000..586ff18
--- /dev/null
+++ b/meta-oe/recipes-support/ccid/ccid/0001-Add-build-rule-for-README.patch
@@ -0,0 +1,22 @@
+Subject: [PATCH] Add build rule for README.
+
+fix do_configure error:
+Makefile.am: required file `./README' not found
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 49574a3..a5a7c2a 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -26,3 +26,4 @@ libtool: $(LIBTOOL_DEPS)
+ ChangeLog:
+ 	git log --stat --decorate=short > $@
+ 
++README: README.md
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/ccid/ccid_1.4.30.bb b/meta-oe/recipes-support/ccid/ccid_1.4.31.bb
similarity index 71%
rename from meta-oe/recipes-support/ccid/ccid_1.4.30.bb
rename to meta-oe/recipes-support/ccid/ccid_1.4.31.bb
index 95a41d2..de07bfd 100644
--- a/meta-oe/recipes-support/ccid/ccid_1.4.30.bb
+++ b/meta-oe/recipes-support/ccid/ccid_1.4.31.bb
@@ -8,10 +8,11 @@ RDEPENDS_${PN} = "pcsc-lite"
 
 SRC_URI = "https://ccid.apdu.fr/files/ccid-${PV}.tar.bz2 \
     file://no-dep-on-libfl.patch \
+    file://0001-Add-build-rule-for-README.patch \
 "
 
-SRC_URI[md5sum] = "817abceef715e02cb47617621fe192e0"
-SRC_URI[sha256sum] = "ac17087be08880a0cdf99a8a2799a4ef004dc6ffa08b4d9b0ad995f39a53ff7c"
+SRC_URI[md5sum] = "e4690f3362f95adb2332fd47a2b08212"
+SRC_URI[sha256sum] = "6b48d7b6e4390e038d25630f8664fe81618ab00f232d6efbe0e3cc6df28ce8f7"
 
 inherit autotools pkgconfig
 
-- 
2.7.4




