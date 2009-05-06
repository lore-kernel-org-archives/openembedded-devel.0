Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1M1hQL-0006MT-T8
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 May 2009 15:44:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id DDBCC10D169
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2009 09:38:37 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06141-04 for <openembedded-devel@lists.openembedded.org>; 
	Wed,  6 May 2009 09:38:37 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 2DAE022DAD; Wed,  6 May 2009 09:38:37 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id AE3532FA042
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2009 09:38:35 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id A27FE41732; Wed,  6 May 2009 09:38:35 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 May 2009 09:38:35 -0400
Message-Id: <1241617115-21929-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.5.6.5
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH] kernel.bbclass: stage more include files for x86 in 2.6.27+
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
X-List-Received-Date: Wed, 06 May 2009 13:44:38 -0000

Some packages include <linux/types.h>, which requires <asm/types.h>.
Supplement b6220af33a70d96345dea130005ce842eeadfdf5 to copy files
from arch/x86/include/asm to include/asm-x86.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 classes/kernel.bbclass |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 954c407..2153424 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -102,8 +102,15 @@ kernel_do_stage() {
 		cp -fR arch/${ARCH}/include/asm/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
 		install -d ${STAGING_KERNEL_DIR}/arch/${ARCH}/include
 		cp -fR arch/${ARCH}/* ${STAGING_KERNEL_DIR}/arch/${ARCH}/	
+
+	# Check for arch/x86 on i386
+	elif [ -d arch/x86/include/asm/ ]; then
+		cp -fR arch/x86/include/asm/* ${STAGING_KERNEL_DIR}/include/asm-x86/
+		install -d ${STAGING_KERNEL_DIR}/arch/x86/include
+		cp -fR arch/x86/* ${STAGING_KERNEL_DIR}/arch/x86/
 	fi
-	rm -f $ASMDIR ${STAGING_KERNEL_DIR}/include/asm
+
+	rm -f ${STAGING_KERNEL_DIR}/include/asm
 	ln -sf $ASMDIR ${STAGING_KERNEL_DIR}/include/asm
 
 	mkdir -p ${STAGING_KERNEL_DIR}/include/asm-generic
-- 
1.5.6.5



