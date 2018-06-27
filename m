Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2810560248
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 09:50:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5R9nZSG021411
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 02:49:50 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 27 Jun 2018 02:49:24 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Jun 2018 02:49:13 -0700
Message-ID: <20180627094922.109996-3-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627094922.109996-1-mingli.yu@windriver.com>
References: <20180627094922.109996-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 03/13] libndp: Upgrade to 1.7
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
X-List-Received-Date: Wed, 27 Jun 2018 09:50:00 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Upgrade libndp to 1.7 and remove the backported
patch 0001-include-sys-select.h-for-fd_-definitions.patch

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ude-sys-select.h-for-fd_-definitions.patch | 25 -------------------
 .../libndp/{libndp_1.6.bb => libndp_1.7.bb}   |  3 +--
 2 files changed, 1 insertion(+), 27 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libndp/libndp/0001-include-sys-select.h-for-fd_-definitions.patch
 rename meta-oe/recipes-connectivity/libndp/{libndp_1.6.bb => libndp_1.7.bb} (70%)

diff --git a/meta-oe/recipes-connectivity/libndp/libndp/0001-include-sys-select.h-for-fd_-definitions.patch b/meta-oe/recipes-connectivity/libndp/libndp/0001-include-sys-select.h-for-fd_-definitions.patch
deleted file mode 100644
index 15aa94e2c..000000000
--- a/meta-oe/recipes-connectivity/libndp/libndp/0001-include-sys-select.h-for-fd_-definitions.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 94e9a082d76414f82794b0c9817d0c24e3868275 Mon Sep 17 00:00:00 2001
-From: Kylie McClain <somasis@exherbo.org>
-Date: Sat, 21 May 2016 21:24:36 -0400
-Subject: [PATCH] ndptool: Fix compilation on musl libc
-
-FD_ZERO, fd_set, etc are defined within sys/select.h on musl.
-
-Signed-off-by: Kylie McClain <somasis@exherbo.org>
-Signed-off-by: Jiri Pirko <jiri@mellanox.com>
----
- utils/ndptool.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/utils/ndptool.c b/utils/ndptool.c
-index 1d96f4c..96479fa 100644
---- a/utils/ndptool.c
-+++ b/utils/ndptool.c
-@@ -28,6 +28,7 @@
- #include <arpa/inet.h>
- #include <errno.h>
- #include <ndp.h>
-+#include <sys/select.h>
- 
- enum verbosity_level {
- 	VERB1,
diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb b/meta-oe/recipes-connectivity/libndp/libndp_1.7.bb
similarity index 70%
rename from meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
rename to meta-oe/recipes-connectivity/libndp/libndp_1.7.bb
index 5148798ab..07a7a1d23 100644
--- a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
+++ b/meta-oe/recipes-connectivity/libndp/libndp_1.7.bb
@@ -4,10 +4,9 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/jpirko/libndp \
-           file://0001-include-sys-select.h-for-fd_-definitions.patch \
            "
 # tag for v1.6
-SRCREV = "2f721c4ff519f38f46695a60d9f9d88f35bf3c1d"
+SRCREV = "96674e7d4f4d569c2c961e865cc16152dfab5f09"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.17.1


