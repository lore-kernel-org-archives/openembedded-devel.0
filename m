Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2DBD37FA45
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:33:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,242,1569254400"; d="scan'208";a="77612011"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Oct 2019 10:33:41 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 6451F4CE1511
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 10:25:41 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 29 Oct 2019 10:33:37 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 Oct 2019 10:33:54 +0800
Message-ID: <20191029023354.20174-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 6451F4CE1511.A4351
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] gmime: upgrade 3.2.3 -> 3.2.4
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
X-List-Received-Date: Tue, 29 Oct 2019 02:33:41 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-support/pidgin/{gmime_3.2.3.bb => gmime_3.2.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/pidgin/{gmime_3.2.3.bb => gmime_3.2.4.bb} (78%)

diff --git a/meta-oe/recipes-support/pidgin/gmime_3.2.3.bb b/meta-oe/recipes-support/pidgin/gmime_3.2.4.bb
similarity index 78%
rename from meta-oe/recipes-support/pidgin/gmime_3.2.3.bb
rename to meta-oe/recipes-support/pidgin/gmime_3.2.4.bb
index bce89bec8..dcdaed5a2 100644
--- a/meta-oe/recipes-support/pidgin/gmime_3.2.3.bb
+++ b/meta-oe/recipes-support/pidgin/gmime_3.2.4.bb
@@ -9,8 +9,8 @@ inherit gnomebase autotools gobject-introspection
 SRC_URI += "file://iconv-detect.h \
             file://nodolt.patch"
 
-SRC_URI[archive.md5sum] = "69ae21a0b1df966a7d39a9431856ac81"
-SRC_URI[archive.sha256sum] = "6a0875eeb552ab447dd54853a68ced62217d863631048737dd97eaa2713e7311"
+SRC_URI[archive.md5sum] = "b6b4e9fdc8f3336551d23872c83b539a"
+SRC_URI[archive.sha256sum] = "249ea7c0e080b067aa9669162c36b181b402f6cf6cebc4999d838c6f1e81d024"
 
 EXTRA_OECONF_remove = "--disable-schemas-install"
 
-- 
2.20.1




