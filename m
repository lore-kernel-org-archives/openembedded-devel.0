Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 2B149754C8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2018 18:35:09 +0000 (UTC)
Received: from hundeboll.local (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id EE41E1C0974;
	Thu, 12 Jul 2018 20:35:09 +0200 (CEST)
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jul 2018 20:35:08 +0200
Message-Id: <20180712183508.7978-1-martin@geanix.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] ell: update patch status to backport
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
X-List-Received-Date: Thu, 12 Jul 2018 18:35:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 ...1-dhcp-include-if_arp.h-from-libc-instead-of-linux-hea.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/ell/ell/0001-dhcp-include-if_arp.h-from-libc-instead-of-linux-hea.patch b/meta-oe/recipes-core/ell/ell/0001-dhcp-include-if_arp.h-from-libc-instead-of-linux-hea.patch
index df3c055d3..ada65401a 100644
--- a/meta-oe/recipes-core/ell/ell/0001-dhcp-include-if_arp.h-from-libc-instead-of-linux-hea.patch
+++ b/meta-oe/recipes-core/ell/ell/0001-dhcp-include-if_arp.h-from-libc-instead-of-linux-hea.patch
@@ -15,7 +15,7 @@ The only symbols used from if_arp.h is ARPHRD_ETHER, so it should be
 safe to avoid the compile error by including the if_arp.h header from
 the c-library instead.
 
-Upstream-Status: Submitted [https://lists.01.org/pipermail/ell/2018-July/001242.html]
+Upstream-Status: Backport [https://lists.01.org/pipermail/ell/2018-July/001244.html]
 Signed-off-by: Martin Hundebøll <martin@geanix.com>
 ---
  ell/dhcp.c | 2 +-
-- 
2.18.0


