Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 87AAA78950
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 03:36:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38026067"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Mar 2018 11:36:20 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 15AD448AE76B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 11:36:20 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 21 Mar 2018 11:36:18 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Mar 2018 11:36:09 +0800
Message-ID: <1521603377-34881-4-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521603377-34881-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1521603377-34881-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 15AD448AE76B.A6E5C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] sessreg: 1.1.0 -> 1.1.1
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
X-List-Received-Date: Wed, 21 Mar 2018 03:36:20 -0000
Content-Type: text/plain

Upgrade sessreg from 1.1.0 to 1.1.1.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../recipes-graphics/xorg-app/{sessreg_1.1.0.bb => sessreg_1.1.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{sessreg_1.1.0.bb => sessreg_1.1.1.bb} (73%)

diff --git a/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb b/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.1.bb
similarity index 73%
rename from meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb
rename to meta-oe/recipes-graphics/xorg-app/sessreg_1.1.1.bb
index 3885d61..d2afa78 100644
--- a/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb
+++ b/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.1.bb
@@ -4,8 +4,8 @@ SUMMARY = "a simple program for managing utmp/wtmp entries"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d938a70c8280c265a1ccd2954365d185"
 SRC_URI += "file://0001-Makefile.am-Error-Fix.patch"
-SRC_URI[md5sum] = "e238c89dabc566e1835e1ecb61b605b9"
-SRC_URI[sha256sum] = "551177657835e0902b5eee7b19713035beaa1581bbd3c6506baa553e751e017c"
+SRC_URI[md5sum] = "e475167a892b589da23edf8edf8c942d"
+SRC_URI[sha256sum] = "78a76ae3f3f6a26547a34630d1b740f42344848b5fb6d7c9c7f7da255e35a6e1"
 
 CFLAGS_append_libc-musl = " -D_WTMPX_FILE=WTMP_FILE -D_PATH_WTMPX=_PATH_WTMP -D_UTMPX_FILE=UTMP_FILE -D_PATH_UTMPX=_PATH_UTMP "
 
-- 
2.7.4




