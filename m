Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4AE497C426
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Mar 2019 08:34:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2C8YFZo012367
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Mar 2019 01:34:15 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 12 Mar 2019 01:34:15 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Tue, 12 Mar 2019 01:34:13 -0700
Message-ID: <20190312083415.87524-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] crash: Upgrade to 7.2.5
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
X-List-Received-Date: Tue, 12 Mar 2019 08:34:16 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../recipes-kernel/crash/{crash_7.2.4.bb => crash_7.2.5.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-kernel/crash/{crash_7.2.4.bb => crash_7.2.5.bb} (97%)

diff --git a/meta-oe/recipes-kernel/crash/crash_7.2.4.bb b/meta-oe/recipes-kernel/crash/crash_7.2.5.bb
similarity index 97%
rename from meta-oe/recipes-kernel/crash/crash_7.2.4.bb
rename to meta-oe/recipes-kernel/crash/crash_7.2.5.bb
index c72b1a321..0b2335682 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.2.4.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.2.5.bb
@@ -25,8 +25,8 @@ SRC_URI = "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.gz;download
            file://0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch \
            file://0003-crash-detect-the-sysroot-s-glibc-header-file.patch \
            "
-SRC_URI[md5sum] = "4f66eb0e9a82ff83de06ac2b37501f5c"
-SRC_URI[sha256sum] = "85ca2e93f1ee628ef2499ab9c78623f8b04500bdf7378c09de19283f6a7a698f"
+SRC_URI[md5sum] = "3f6e18d38821bb326700f1d6d43bcaec"
+SRC_URI[sha256sum] = "114a83ca27c91e4321f6399d637a9d2270f72b9327e56d687c5fb139e903069b"
 
 SRC_URI[gdb.md5sum] = "a9836707337e5f7bf76a009a8904f470"
 SRC_URI[gdb.sha256sum] = "8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5d2502faa36"
-- 
2.17.1


