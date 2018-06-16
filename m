Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9B07274700
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 07:26:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="41511013"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jun 2018 15:24:01 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 28F1C4818460
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 15:23:54 +0800 (CST)
Received: from localhost.localdomain (10.167.225.27) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 26 Jun 2018 15:23:55 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 16 Jun 2018 10:01:32 -0700
Message-ID: <1529168492-6235-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.27]
X-yoursite-MailScanner-ID: 28F1C4818460.ADBE1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libnih: Fix do_package error when enable mutilib.
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
X-List-Received-Date: Tue, 26 Jun 2018 07:26:03 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta-oe/recipes-support/libnih/libnih_1.0.3.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-support/libnih/libnih_1.0.3.bb b/meta-oe/recipes-support/libnih/libnih_1.0.3.bb
index 3e35f4d..fcb6beb 100644
--- a/meta-oe/recipes-support/libnih/libnih_1.0.3.bb
+++ b/meta-oe/recipes-support/libnih/libnih_1.0.3.bb
@@ -34,5 +34,15 @@ SRC_URI[sha256sum] = "897572df7565c0a90a81532671e23c63f99b4efde2eecbbf11e7857fbc
 inherit autotools
 inherit gettext
 
+do_configure_append () {
+        sed -i -e 's,lib/pkgconfig,${baselib}/pkgconfig,g' ${S}/nih/Makefile.in ${S}/nih-dbus/Makefile.in
+}
+
+FILES_${PN}-dev += "${libdir}/pkgconfig/* \
+        ${includedir}/* \
+        ${libdir}/*.so \
+        ${datadir}/* \
+        "
+
 # target libnih requires native nih-dbus-tool
 BBCLASSEXTEND = "native"
-- 
1.9.1




