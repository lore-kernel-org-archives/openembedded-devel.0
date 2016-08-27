Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 10B086FFCD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Aug 2016 07:12:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10343989"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Aug 2016 15:12:35 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 8B6A842EB275
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Aug 2016 15:12:33 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Sat, 27 Aug 2016 15:12:34 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 27 Aug 2016 03:12:28 -0400
Message-ID: <1472281948-1425-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 8B6A842EB275.A7475
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] mcelog: 1.09 -> 1.40
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
X-List-Received-Date: Sat, 27 Aug 2016 07:12:37 -0000
Content-Type: text/plain

Upgrade mcelog from 1.09 to 1.40.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/mcelog/mce-inject_git.bb                  | 2 +-
 meta-oe/recipes-support/mcelog/{mcelog_1.09.bb => mcelog_1.40.bb} | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_1.09.bb => mcelog_1.40.bb} (88%)

diff --git a/meta-oe/recipes-support/mcelog/mce-inject_git.bb b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
index f876144..d80cc05 100644
--- a/meta-oe/recipes-support/mcelog/mce-inject_git.bb
+++ b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mce-inject.git"
 SRCREV = "4cbe46321b4a81365ff3aafafe63967264dbfec5"
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://README;beginline=30;md5=94c18755082a2da9c9cf97cba3ad47d6"
+LIC_FILES_CHKSUM = "file://README;beginline=30;md5=3d12dd2a10bdd22379cc4c0fc6949a88"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-support/mcelog/mcelog_1.09.bb b/meta-oe/recipes-support/mcelog/mcelog_1.40.bb
similarity index 88%
rename from meta-oe/recipes-support/mcelog/mcelog_1.09.bb
rename to meta-oe/recipes-support/mcelog/mcelog_1.40.bb
index 542b2ba..9aebbd5 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_1.09.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_1.40.bb
@@ -5,15 +5,15 @@ and should run on all Linux systems that need error handling."
 HOMEPAGE = "http://mcelog.org/"
 SECTION = "System Environment/Base"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git \
+SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http; \
     file://mcelog-debash.patch \
     file://run-ptest \
 "
 
-SRCREV = "0fc9f702232cb2d9969916f899c67c3e64deedda"
+SRCREV = "008c73e6de3a4bf969d1627e695d4efc807aed92"
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://README;md5=3eb76ca64fa07ad53ebb0ebb5b4c8ede"
+LIC_FILES_CHKSUM = "file://README;md5=3d12dd2a10bdd22379cc4c0fc6949a88"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4




