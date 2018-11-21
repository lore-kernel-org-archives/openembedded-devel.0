Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 7E4416BF3F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2018 08:18:41 +0000 (UTC)
Received: from zen.localdomain (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 281421C0812;
	Wed, 21 Nov 2018 09:10:19 +0100 (CET)
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Nov 2018 09:10:10 +0100
Message-Id: <20181121081012.118414-1-martin@geanix.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] ell: remove unused patch
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
X-List-Received-Date: Wed, 21 Nov 2018 08:18:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit cc7bce67b ('ell: update to 0.8') removed the patch from SRC_URI
but forgot to delete it from the git tree.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 ...arp.h-from-libc-instead-of-linux-hea.patch | 39 -------------------
 1 file changed, 39 deletions(-)
 delete mode 100644 meta-oe/recipes-core/ell/ell/0001-dhcp-include-if_arp.h-from-libc-instead-of-linux-hea.patch

diff --git a/meta-oe/recipes-core/ell/ell/0001-dhcp-include-if_arp.h-from-libc-instead-of-linux-hea.patch b/meta-oe/recipes-core/ell/ell/0001-dhcp-include-if_arp.h-from-libc-instead-of-linux-hea.patch
deleted file mode 100644
index ada65401a..000000000
--- a/meta-oe/recipes-core/ell/ell/0001-dhcp-include-if_arp.h-from-libc-instead-of-linux-hea.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From d8236d1d789f496a193dae5d2a15d706b81f6482 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
-Date: Thu, 12 Jul 2018 10:19:50 +0200
-Subject: [PATCH] dhcp: include if_arp.h from libc instead of linux headers
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-To: ell@lists.01.org
-
-Compilation with musl libc fails due to redefinition of 'struct
-arp{req,req_old,hdr}' in linux/if_arp.h, since it is already defined and
-included in net/if_arp.h (through net/ethernet.h -> net/if_ether.h).
-
-The only symbols used from if_arp.h is ARPHRD_ETHER, so it should be
-safe to avoid the compile error by including the if_arp.h header from
-the c-library instead.
-
-Upstream-Status: Backport [https://lists.01.org/pipermail/ell/2018-July/001244.html]
-Signed-off-by: Martin Hundebøll <martin@geanix.com>
----
- ell/dhcp.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ell/dhcp.c b/ell/dhcp.c
-index 6c90370..0d99f74 100644
---- a/ell/dhcp.c
-+++ b/ell/dhcp.c
-@@ -27,7 +27,7 @@
- #include <netinet/ip.h>
- #include <net/ethernet.h>
- #include <linux/types.h>
--#include <linux/if_arp.h>
-+#include <net/if_arp.h>
- #include <errno.h>
- #include <time.h>
- 
--- 
-2.18.0
-
-- 
2.19.1


