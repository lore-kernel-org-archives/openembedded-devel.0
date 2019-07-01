Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 395CD7E807
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 08:43:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,437,1557158400"; d="scan'208";a="70361692"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Jul 2019 16:43:06 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id E963B4CDE914
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 16:33:38 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 1 Jul 2019 16:33:54 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Jul 2019 16:35:15 +0800
Message-ID: <20190701083515.16430-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: E963B4CDE914.A837D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] sessreg: upgrade 1.1.1 -> 1.1.2
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
X-List-Received-Date: Mon, 01 Jul 2019 08:43:11 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from sessreg_1.1.1.bb to sessreg_1.1.2.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../xorg-app/{sessreg_1.1.1.bb => sessreg_1.1.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{sessreg_1.1.1.bb => sessreg_1.1.2.bb} (73%)

diff --git a/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.1.bb b/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.2.bb
similarity index 73%
rename from meta-oe/recipes-graphics/xorg-app/sessreg_1.1.1.bb
rename to meta-oe/recipes-graphics/xorg-app/sessreg_1.1.2.bb
index d2afa78f9..ad6bd17ad 100644
--- a/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.1.bb
+++ b/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.2.bb
@@ -4,8 +4,8 @@ SUMMARY = "a simple program for managing utmp/wtmp entries"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d938a70c8280c265a1ccd2954365d185"
 SRC_URI += "file://0001-Makefile.am-Error-Fix.patch"
-SRC_URI[md5sum] = "e475167a892b589da23edf8edf8c942d"
-SRC_URI[sha256sum] = "78a76ae3f3f6a26547a34630d1b740f42344848b5fb6d7c9c7f7da255e35a6e1"
+SRC_URI[md5sum] = "92be564d4be7d8aa7b5024057b715210"
+SRC_URI[sha256sum] = "dfcb9e954273ace63879aec053c7880466f8755752a35aa9ced3fa5f04fd2c33"
 
 CFLAGS_append_libc-musl = " -D_WTMPX_FILE=WTMP_FILE -D_PATH_WTMPX=_PATH_WTMP -D_UTMPX_FILE=UTMP_FILE -D_PATH_UTMPX=_PATH_UTMP "
 
-- 
2.20.1




