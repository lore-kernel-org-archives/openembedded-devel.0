Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 527957E417
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 09:15:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6J9Fj0b008363
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 02:15:46 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 19 Jul 2019 02:15:39 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Jul 2019 02:15:36 -0700
Message-ID: <20190719091539.100373-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/4] crash: Upgrade to 7.2.6
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
X-List-Received-Date: Fri, 19 Jul 2019 09:15:45 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-kernel/crash/{crash_7.2.5.bb => crash_7.2.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/crash/{crash_7.2.5.bb => crash_7.2.6.bb} (98%)

diff --git a/meta-oe/recipes-kernel/crash/crash_7.2.5.bb b/meta-oe/recipes-kernel/crash/crash_7.2.6.bb
similarity index 98%
rename from meta-oe/recipes-kernel/crash/crash_7.2.5.bb
rename to meta-oe/recipes-kernel/crash/crash_7.2.6.bb
index e124db19c..a8bfe27da 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.2.5.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.2.6.bb
@@ -26,7 +26,7 @@ SRC_URI = "git://github.com/crash-utility/${BPN}.git \
            file://0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch \
            file://0003-crash-detect-the-sysroot-s-glibc-header-file.patch \
            "
-SRCREV = "c0a2fc9d322cf0c5f569ce54e9201d2f586edb0c"
+SRCREV = "4076ebea6626e3f0a20150602c6ffab999ea5c90"
 
 SRC_URI[gdb.md5sum] = "a9836707337e5f7bf76a009a8904f470"
 SRC_URI[gdb.sha256sum] = "8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5d2502faa36"
-- 
2.21.0


