Return-Path: <bruce.ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5BF2F77CEF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 03:09:42 +0000 (UTC)
Received: from yow-bashfiel-d4.wrs.com (yow-bashfiel-d4.wrs.com
	[128.224.56.94])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTP id v7T39iHm010820
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 20:09:44 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Aug 2017 23:09:43 -0400
Message-Id: <1503976183-18757-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-oe][PATCH] vboxguestdrivers: update to fix build issues with 4.12+
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
X-List-Received-Date: Tue, 29 Aug 2017 03:09:43 -0000

Bumping the version to 5.1.26 fixes the build issues with
the 4.12+ kernel (and headers).

i.e.:

 tmp/work-shared/qemux86-64/kernel-source/arch/x86/include/asm/atomic.h:
 In function 'atomic_try_cmpxchg':
 |
 tmp/work-shared/qemux86-64/kernel-source/arch/x86/include/asm/atomic.h:192:2:
 error: undefined named operand 'new'
 |   return try_cmpxchg(&v->counter, old, new);
 |   ^~~~~~
 |
 tmp/work-shared/qemux86-64/kernel-source/arch/x86/include/asm/atomic.h:192:2:
 error: undefined named operand 'new'
 |
 tmp/work-shared/qemux86-64/kernel-source/arch/x86/include/asm/atomic.h:192:2:
 error: undefined named operand 'new'
 |
 tmp/work-shared/qemux86-64/kernel-source/arch/x86/include/asm/atomic.h:192:2:
 error: undefined named operand 'new'

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../{vboxguestdrivers_5.1.18.bb => vboxguestdrivers_5.1.26.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_5.1.18.bb => vboxguestdrivers_5.1.26.bb} (93%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.18.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb
similarity index 93%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.18.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb
index 4085b9fc7339..fdefe03172d2 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.18.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb
@@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
            file://Makefile.utils \
 "
-SRC_URI[md5sum] = "1a7db64cd69ba6d39574fb333e031251"
-SRC_URI[sha256sum] = "7ed0959bbbd02826b86b3d5dc8348931ddfab267c31f8ed36ee53c12f5522cd9"
+SRC_URI[md5sum] = "d3aec8190c649d7e0d92ba374779dfe3"
+SRC_URI[sha256sum] = "b5715035e681a11ef1475f83f9503d34a00f0276b89c572eebec363dda80c8a9"
 
 S = "${WORKDIR}/vbox_module"
 
-- 
2.5.0


