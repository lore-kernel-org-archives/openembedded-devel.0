Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1PIRBi-0004uP-Q9
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 20:27:31 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 1144F8F673E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 14:26:27 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22705-09 for <openembedded-devel@lists.openembedded.org>; 
	Tue, 16 Nov 2010 14:26:26 -0500 (EST)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id D36098F6947; Tue, 16 Nov 2010 14:26:26 -0500 (EST)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 1BD598B814C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 14:26:25 -0500 (EST)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 1D4395000E6; Tue, 16 Nov 2010 14:26:25 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Nov 2010 14:26:25 -0500
Message-Id: <1289935585-26798-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3.2
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] linux 2.6.32: update from 2.6.32.9 to 2.6.32.25
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
X-List-Received-Date: Tue, 16 Nov 2010 19:27:31 -0000

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/linux/linux_2.6.32.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/linux/linux_2.6.32.bb b/recipes/linux/linux_2.6.32.bb
index f1f4cc8..0122759 100644
--- a/recipes/linux/linux_2.6.32.bb
+++ b/recipes/linux/linux_2.6.32.bb
@@ -20,13 +20,13 @@ DEFAULT_PREFERENCE_bluepro = "1"
 DEFAULT_PREFERENCE_topas910 = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.9.bz2;apply=yes;name=stablepatch \
+           ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.25.bz2;apply=yes;name=stablepatch \
            file://defconfig"
 
 SRC_URI[kernel.md5sum] = "260551284ac224c3a43c4adac7df4879"
 SRC_URI[kernel.sha256sum] = "5099786d80b8407d98a619df00209c2353517f22d804fdd9533b362adcb4504e"
-SRC_URI[stablepatch.md5sum] = "7f615dd3b4a3b19fb86e479996a2deb5"
-SRC_URI[stablepatch.sha256sum] = "8aeb15c31fb09c769f004c8dc51e29aa26be8e84d70db418af70ecefc463459a"
+SRC_URI[stablepatch.md5sum] = "d8fff54efff6c5f7b07e5370a5e9f119"
+SRC_URI[stablepatch.sha256sum] = "402f740b25c6e69344219164250a1181c74bbc8bb25149b3a0fa8d818706f32f"
 
 SRC_URI_append_at91sam9g45ek = " \
 	file://at91/linux-2.6.32-001-configurable-nand-partitions.patch \
-- 
1.6.3.2



