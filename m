Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1905678CF6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 01:25:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w711PlUD004488
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 18:25:49 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 31 Jul 2018 18:25:40 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 31 Jul 2018 18:25:39 -0700
Message-ID: <20180801012540.11856-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH 1/2] crash: Upgrade to 7.2.3
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
X-List-Received-Date: Wed, 01 Aug 2018 01:25:49 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../recipes-kernel/crash/{crash_7.2.0.bb => crash_7.2.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-kernel/crash/{crash_7.2.0.bb => crash_7.2.3.bb} (97%)

diff --git a/meta-oe/recipes-kernel/crash/crash_7.2.0.bb b/meta-oe/recipes-kernel/crash/crash_7.2.3.bb
similarity index 97%
rename from meta-oe/recipes-kernel/crash/crash_7.2.0.bb
rename to meta-oe/recipes-kernel/crash/crash_7.2.3.bb
index 440a69d60..66d740af9 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.2.0.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.2.3.bb
@@ -25,8 +25,8 @@ SRC_URI = "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.gz;download
            file://0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch \
            file://0003-crash-detect-the-sysroot-s-glibc-header-file.patch \
            "
-SRC_URI[md5sum] = "48899de3118e04cfa40a2364f5618193"
-SRC_URI[sha256sum] = "5d076e1fefb41aa178ad3e1cef6511670efc47de5cb04d4af9bdd4e8f2f18cbc"
+SRC_URI[md5sum] = "4026bc71c8c8c49477f4f551e25ee9fb"
+SRC_URI[sha256sum] = "4c861b6fc05ab5048e8d3552445c1a08860d238e83f17ff6b51493cc17bcaa75"
 
 SRC_URI[gdb.md5sum] = "a9836707337e5f7bf76a009a8904f470"
 SRC_URI[gdb.sha256sum] = "8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5d2502faa36"
-- 
2.17.1


