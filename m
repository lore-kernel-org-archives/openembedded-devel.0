Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7469360291
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2019 22:02:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2TM2VR8016057
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2019 15:02:31 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 29 Mar 2019 15:02:31 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Mar 2019 15:02:30 -0700
Message-ID: <20190329220230.101196-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] libssh2: move to version 1.8.2
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
X-List-Received-Date: Fri, 29 Mar 2019 22:02:31 -0000
Content-Type: text/plain

Includes fixes for CVE-2019-3858, -3859, -3860, -3861, and -3862.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../recipes-support/libssh2/{libssh2_1.8.0.bb => libssh2_1.8.2.bb}   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libssh2/{libssh2_1.8.0.bb => libssh2_1.8.2.bb} (84%)

diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.8.0.bb b/meta-oe/recipes-support/libssh2/libssh2_1.8.2.bb
similarity index 84%
rename from meta-oe/recipes-support/libssh2/libssh2_1.8.0.bb
rename to meta-oe/recipes-support/libssh2/libssh2_1.8.2.bb
index 94bfb8f..fe853cd 100644
--- a/meta-oe/recipes-support/libssh2/libssh2_1.8.0.bb
+++ b/meta-oe/recipes-support/libssh2/libssh2_1.8.2.bb
@@ -8,8 +8,9 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca"
 
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz"
-SRC_URI[md5sum] = "3d1147cae66e2959ea5441b183de1b1c"
-SRC_URI[sha256sum] = "39f34e2f6835f4b992cafe8625073a88e5a28ba78f83e8099610a7b3af4676d4"
+
+SRC_URI[md5sum] = "616efd99af3d9ef731a26bed6cee9593"
+SRC_URI[sha256sum] = "088307d9f6b6c4b8c13f34602e8ff65d21c2dc4d55284dfe15d502c4ee190d67"
 
 inherit autotools pkgconfig
 
-- 
2.7.4


