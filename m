Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8FA36606BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 09:10:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6Q9AI1n026678
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 02:10:18 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 26 Jul 2016 02:10:17 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jul 2016 05:10:16 -0400
Message-ID: <1469524216-176941-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] Revert "postgresql: blacklist because tcl in oe-core is broken for last month"
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
X-List-Received-Date: Tue, 26 Jul 2016 09:10:20 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

This reverts commit 44ea80d3a3652741cefbbe02b29ed7be4696d914.

The tcl issue is fixed by:
"69dfc58 tcl: fix sed command in do_install"

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb b/meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb
index 4a0296d..54b660e 100644
--- a/meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb
+++ b/meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb
@@ -12,5 +12,3 @@ SRC_URI += "\
 SRC_URI[md5sum] = "8b2e3472a8dc786649b4d02d02e039a0"
 SRC_URI[sha256sum] = "b87c50c66b6ea42a9712b5f6284794fabad0616e6ae420cf0f10523be6d94a39"
 
-# http://lists.openembedded.org/pipermail/openembedded-core/2016-May/122095.html
-PNBLACKLIST[postgresql] ?= "Depends on broken tcl"
-- 
2.8.1


