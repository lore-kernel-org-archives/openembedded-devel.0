Received: from afflict.kos.to ([92.243.29.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <riku.voipio@linaro.org>) id 1TxIeU-0003jl-8t
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jan 2013 15:47:11 +0100
Received: from aimless.elisa-laajakaista.fi
	(a91-156-58-157.elisa-laajakaista.fi [91.156.58.157])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by afflict.kos.to (Postfix) with ESMTPSA id 67D81264BE;
	Mon, 21 Jan 2013 15:31:42 +0100 (CET)
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jan 2013 16:31:38 +0200
Message-Id: <1358778699-30412-1-git-send-email-riku.voipio@linaro.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] fuse: add aarch64 support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2013 14:47:17 -0000

u64/u32 is not defined in sys/types.h, include linux/types.h like
the kernel version of fuse.h does. Patch sent to upstream mailing list.

Upstream-Status: Submitted

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 .../recipes-support/fuse/fuse-2.9.2/aarch64.patch  |   20 ++++++++++++++++++++
 meta-oe/recipes-support/fuse/fuse_2.9.2.bb         |    1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/fuse/fuse-2.9.2/aarch64.patch

diff --git a/meta-oe/recipes-support/fuse/fuse-2.9.2/aarch64.patch b/meta-oe/recipes-support/fuse/fuse-2.9.2/aarch64.patch
new file mode 100644
index 0000000..180f544
--- /dev/null
+++ b/meta-oe/recipes-support/fuse/fuse-2.9.2/aarch64.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Submitted
+
+Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
+
+--- a/include/fuse_kernel.h
++++ b/include/fuse_kernel.h
+@@ -88,12 +88,7 @@
+ #ifndef _LINUX_FUSE_H
+ #define _LINUX_FUSE_H
+ 
+-#include <sys/types.h>
+-#define __u64 uint64_t
+-#define __s64 int64_t
+-#define __u32 uint32_t
+-#define __s32 int32_t
+-#define __u16 uint16_t
++#include <linux/types.h>
+ 
+ /*
+  * Version negotiation:
diff --git a/meta-oe/recipes-support/fuse/fuse_2.9.2.bb b/meta-oe/recipes-support/fuse/fuse_2.9.2.bb
index 23b9447..b558c4d 100644
--- a/meta-oe/recipes-support/fuse/fuse_2.9.2.bb
+++ b/meta-oe/recipes-support/fuse/fuse_2.9.2.bb
@@ -9,6 +9,7 @@ PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz \
            file://gold-unversioned-symbol.patch \
+           file://aarch64.patch \
           "
 SRC_URI[md5sum] = "7d80d0dc9cc2b9199a0c53787c151205"
 SRC_URI[sha256sum] = "81a728fb3f87da33063068735e2fb7e2cd89df207d32687d3d3278385279cefc"
-- 
1.7.10.4



