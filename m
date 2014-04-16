Return-Path: <changhyeok.bae@lge.com>
Received: from lgeamrelo04.lge.com (lgeamrelo04.lge.com [156.147.1.127])
	by mail.openembedded.org (Postfix) with ESMTP id 42153601A9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 04:41:39 +0000 (UTC)
Received: from unknown (HELO changhyeok.bae) (10.177.232.191)
	by 156.147.1.127 with ESMTP; 16 Apr 2014 13:41:40 +0900
X-Original-SENDERIP: 10.177.232.191
X-Original-MAILFROM: changhyeok.bae@lge.com
From: Changhyeok Bae <changhyeok.bae@lge.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Apr 2014 13:41:43 +0900
Message-Id: <1397623303-8512-1-git-send-email-changhyeok.bae@lge.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] libunwind: Add mirror site
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Apr 2014 04:41:40 -0000

The SRC_URI is not accessible.
So need to add mirror site referred by the original site.

Signed-off-by: Changhyeok Bae <changhyeok.bae@lge.com>
---
 meta-oe/recipes-support/libunwind/libunwind.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libunwind/libunwind.inc b/meta-oe/recipes-support/libunwind/libunwind.inc
index a5b7482..a70ec2e 100644
--- a/meta-oe/recipes-support/libunwind/libunwind.inc
+++ b/meta-oe/recipes-support/libunwind/libunwind.inc
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3fced11d6df719b47505837a51c16ae5"
 
 SRC_URI = "http://download.savannah.nongnu.org/releases/${BPN}/${BPN}-${PV}.tar.gz"
 
+MIRRORS += "http://download.savannah.nongnu.org/releases/ http://download-mirror.savannah.gnu.org/releases/ \n"
+
 inherit autotools
 
 PACKAGECONFIG ??= ""
-- 
1.7.9.5


