Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 100BE731C6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 02:20:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9954080"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Aug 2016 10:20:33 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 723A542BC505
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 10:20:33 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 16 Aug 2016 10:20:31 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Aug 2016 22:20:29 -0400
Message-ID: <1471314029-1442-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 723A542BC505.A44AB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] ctapi-common: 1.1-11 -> 1.1-14
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
X-List-Received-Date: Tue, 16 Aug 2016 02:20:37 -0000
Content-Type: text/plain

Upgrade ctapi-common from 1.1-11 to 1.1-14.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../{ctapi-common_1.1-11.bb => ctapi-common_1.1-14.bb}            | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/ctapi-common/{ctapi-common_1.1-11.bb => ctapi-common_1.1-14.bb} (59%)

diff --git a/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-11.bb b/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
similarity index 59%
rename from meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-11.bb
rename to meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
index a3b67f7..3a049e7 100644
--- a/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-11.bb
+++ b/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
@@ -4,10 +4,10 @@ SECTION = "System Environment/Libraries"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://../ctapi-common.LICENSE;md5=8744cd52545ecb45befebd0da6f70f0a"
 
-SRC_URI = "http://ftp.riken.jp/Linux/fedora/releases/20/Fedora/source/SRPMS/c/${BPN}-${PV}.fc20.src.rpm;extract=ctapi-common.LICENSE \
-           http://ftp.riken.jp/Linux/fedora/releases/20/Fedora/source/SRPMS/c/${BPN}-${PV}.fc20.src.rpm;extract=ctapi-common.README"
-SRC_URI[md5sum] = "f02e67487c48319376800563a2659502"
-SRC_URI[sha256sum] = "32399819b0a1cac1abb2b8f0f180c572c93809faad36c46825dd536e4844c7cf"
+SRC_URI = "http://ftp.riken.jp/Linux/fedora/releases/23/Everything/source/SRPMS/c/${BPN}-${PV}.fc23.src.rpm;extract=ctapi-common.LICENSE \
+           http://ftp.riken.jp/Linux/fedora/releases/23/Everything/source/SRPMS/c/${BPN}-${PV}.fc23.src.rpm;extract=ctapi-common.README"
+SRC_URI[md5sum] = "5b7259ef1c8cd9ae801fca7a5cb548c1"
+SRC_URI[sha256sum] = "87a74eb0a66055c34ba2c5c919e74f3211c5950ae1c2cbab967fdf4137f5de91"
 
 do_compile() {
     install -pm 644 ${WORKDIR}/ctapi-common.LICENSE LICENSE
-- 
2.7.4




