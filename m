Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8867B789A3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 19:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id DDD7C18497
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 21:03:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id NdRWUlBvvYz0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 21:03:37 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 58C4E184CE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 21:03:37 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 432C81A07B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 21:03:37 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37D611A06D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 21:03:37 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 21:03:37 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 2B5692E32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 21:03:37 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w5CJ3RB9020065
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 21:03:27 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w5CJ3Run020064
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jun 2018 21:03:27 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jun 2018 21:03:26 +0200
Message-Id: <20180612190326.20023-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [meta-oe][PATCH] ne10: Use `cp -d ...` instead of `cp -a ...` to install a symbolic link
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
X-List-Received-Date: Tue, 12 Jun 2018 19:03:38 -0000

Using `cp -a ...` to install the link will preserv the owner of the
original link, which will be the user who ran the do_compile task,
rather than root.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/ne10/ne10_1.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
index 76e0741b1..3afdff778 100644
--- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
+++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
@@ -38,7 +38,7 @@ do_install() {
     install -m 0644 ${S}/inc/NE10*.h ${D}${includedir}/
     install -m 0644 ${B}/modules/libNE10.a ${D}${libdir}/
     install -m 0755 ${B}/modules/libNE10.so.* ${D}${libdir}/
-    cp -a ${B}/modules/libNE10.so ${D}${libdir}/
+    cp -d ${B}/modules/libNE10.so ${D}${libdir}/
 }
 
 # ERROR: QA Issue: ELF binary 'ne10/1.2.1-r0/packages-split/ne10/usr/lib/libNE10.so.10' has relocations in .text [textrel]
-- 
2.12.0


