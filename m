Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <t.fromm@DResearch.de>) id 1P0xyP-0005ng-Bz
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 16:50:04 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 49474491278
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 16:49:14 +0200 (CEST)
Received: from localhost.localdomain ([10.32.10.1]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 29 Sep 2010 16:49:14 +0200
From: Thilo Fromm <t.fromm@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 16:48:45 +0200
Message-Id: <1285771725-32231-1-git-send-email-t.fromm@dresearch.de>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 29 Sep 2010 14:49:14.0174 (UTC)
	FILETIME=[7BF11DE0:01CB5FE5]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: t.fromm@DResearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] qemu-0.12.5: add ncurses, gnutls dependencies
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
X-List-Received-Date: Wed, 29 Sep 2010 14:50:09 -0000

QEmu build breaks occassionally because some of the libraries required
have not been built at the time qemu is being built. I ran into problems
with the "qemu-native" build which tried to link against host libraries
and subsequently failed:

....

|   LINK  sh4eb-softmmu/qemu-system-sh4eb
|   LINK  sh4-softmmu/qemu-system-sh4
|   LINK  mips-softmmu/qemu-system-mips
|   CC    mips64el-softmmu/fpu/softfloat.o
|   CC    sparc-softmmu/i386-dis.o
| /usr/lib/gcc/x86_64-linux-gnu/4.4.3/../../../../lib/libgnutls.so: undefined reference to `gcry_cipher_setkey@GCRYPT_1.2'
| /usr/lib/gcc/x86_64-linux-gnu/4.4.3/../../../../lib/libgnutls.so: undefined reference to `gcry_cipher_setiv@GCRYPT_1.2'
| collect2: ld returned 1 exit status
| make[1]: *** [qemu-system-mips] Error 1
| make: *** [subdir-mips-softmmu] Error 2

....

This patch adds gnutls and ncurses dependencies to the recipe.

Signed-off-by: Thilo Fromm <t.fromm@dresearch.de>
---
 recipes/qemu/qemu_0.12.5.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/qemu/qemu_0.12.5.bb b/recipes/qemu/qemu_0.12.5.bb
index c823fbd..a8d67f1 100644
--- a/recipes/qemu/qemu_0.12.5.bb
+++ b/recipes/qemu/qemu_0.12.5.bb
@@ -1,7 +1,7 @@
 LICENSE = "GPL"
-DEPENDS = "zlib"
+DEPENDS = "zlib ncurses gnutls"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "\
     http://download.savannah.gnu.org/releases/qemu/qemu-${PV}.tar.gz \
-- 
1.7.0.4



