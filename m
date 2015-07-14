Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 9833375EC8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2015 11:04:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id B0FCE401126;
	Tue, 14 Jul 2015 13:04:14 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Tim Orling <TicoTimo@gmail.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
Date: Tue, 14 Jul 2015 13:03:55 +0200
Message-Id: <1436871835-1144-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.3
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [meta-python][PATCH] python-pyudev: add missing dependency on python-contextlib
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
X-List-Received-Date: Tue, 14 Jul 2015 11:04:23 -0000

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 meta-python/recipes-devtools/python/python-pyudev_0.16.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-pyudev_0.16.1.bb b/meta-python/recipes-devtools/python/python-pyudev_0.16.1.bb
index 964b5f92b59656f5dfdddfafe3506ef7b316083e..9c77f83af9b3e7f0b4b83bbced4e6b80ff108198 100644
--- a/meta-python/recipes-devtools/python/python-pyudev_0.16.1.bb
+++ b/meta-python/recipes-devtools/python/python-pyudev_0.16.1.bb
@@ -22,4 +22,5 @@ RDEPENDS_${PN} = "\
     python-ctypes \
     python-subprocess \
     python-misc \
+    python-contextlib \
 "
-- 
1.9.3


