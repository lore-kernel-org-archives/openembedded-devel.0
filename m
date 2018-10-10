Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8600974A25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 01:30:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9A1UMuq011383
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Oct 2018 18:30:33 -0700
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 9 Oct 2018 18:30:11 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Oct 2018 21:30:10 -0400
Message-ID: <20181010013010.15777-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] crash: Update from 7.2.3 to to 7.2.4
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
X-List-Received-Date: Wed, 10 Oct 2018 01:30:42 -0000
Content-Type: text/plain

Change log: http://people.redhat.com/anderson/crash.changelog.html

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../recipes-kernel/crash/{crash_7.2.3.bb => crash_7.2.4.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-kernel/crash/{crash_7.2.3.bb => crash_7.2.4.bb} (97%)

diff --git a/meta-oe/recipes-kernel/crash/crash_7.2.3.bb b/meta-oe/recipes-kernel/crash/crash_7.2.4.bb
similarity index 97%
rename from meta-oe/recipes-kernel/crash/crash_7.2.3.bb
rename to meta-oe/recipes-kernel/crash/crash_7.2.4.bb
index 45a26545d..c72b1a321 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.2.3.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.2.4.bb
@@ -25,8 +25,8 @@ SRC_URI = "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.gz;download
            file://0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch \
            file://0003-crash-detect-the-sysroot-s-glibc-header-file.patch \
            "
-SRC_URI[md5sum] = "4026bc71c8c8c49477f4f551e25ee9fb"
-SRC_URI[sha256sum] = "4c861b6fc05ab5048e8d3552445c1a08860d238e83f17ff6b51493cc17bcaa75"
+SRC_URI[md5sum] = "4f66eb0e9a82ff83de06ac2b37501f5c"
+SRC_URI[sha256sum] = "85ca2e93f1ee628ef2499ab9c78623f8b04500bdf7378c09de19283f6a7a698f"
 
 SRC_URI[gdb.md5sum] = "a9836707337e5f7bf76a009a8904f470"
 SRC_URI[gdb.sha256sum] = "8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5d2502faa36"
-- 
2.17.0


