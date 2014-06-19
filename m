Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 3F43870234
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 21:22:30 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7F003A4Q0I49A0@vms173025.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	19 Jun 2014 16:21:56 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 18B202009B; Thu,
	19 Jun 2014 17:21:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 17:21:52 -0400
Message-id: <1403212912-30843-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] fbset: the package doesn't use autotools at all
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
X-List-Received-Date: Thu, 19 Jun 2014 21:22:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Previous attempt at fixing it (3649e6b52f0fad88847fb9d4780c02249b147f5f) was
to replace inherit autotools with autotools-brokensep. But since the package
doesn't use autotools at all, there's no need to inherit either of those
classes.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-oe/recipes-support/fbset/fbset_2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/fbset/fbset_2.1.bb b/meta-oe/recipes-support/fbset/fbset_2.1.bb
index 84ea50c..1855932 100644
--- a/meta-oe/recipes-support/fbset/fbset_2.1.bb
+++ b/meta-oe/recipes-support/fbset/fbset_2.1.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://ftp.debian.org/debian/pool/main/f/fbset/fbset_2.1.orig.tar.gz
            file://fbset-2.1-fix-makefile-dep.patch \
 "
 
-inherit autotools-brokensep update-alternatives
+inherit update-alternatives
 
 do_install() {
     install -d ${D}${sbindir} ${D}${datadir}/man/man8 ${D}${datadir}/man/man5
-- 
2.0.0


