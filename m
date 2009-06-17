Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1MH1ML-0006On-04
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 22:03:49 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=localhost.localdomain)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1MH1C9-000JLS-Nu; Wed, 17 Jun 2009 23:53:20 +0400
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jun 2009 23:53:13 +0400
Message-Id: <1245268393-14247-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.3.1
X-SpamTest-Envelope-From: khimov@altell.ru
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 8770 [Jun 17 2009]
X-SpamTest-Info: helo_type=3
X-SpamTest-Info: {UDS BL}
X-SpamTest-Info: {DNSBL Rate: low}
X-SpamTest-Method: none
X-SpamTest-Rate: 30
X-SpamTest-Status: Not detected
X-SpamTest-Status-Extended: not_detected
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0284], KAS30/Release
Subject: [PATCH] kernel.bbclass: fix staging for x86 kernels
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
X-List-Received-Date: Wed, 17 Jun 2009 20:03:49 -0000

---
 classes/kernel.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index ef16669..e3bb890 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -103,6 +103,10 @@ kernel_do_stage() {
 		cp -fR arch/${ARCH}/include/asm/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
 		install -d ${STAGING_KERNEL_DIR}/arch/${ARCH}/include
 		cp -fR arch/${ARCH}/* ${STAGING_KERNEL_DIR}/arch/${ARCH}/	
+	elif [ -e arch/x86/include/asm/ ]; then
+		cp -fR arch/x86/include/asm/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
+		install -d ${STAGING_KERNEL_DIR}/arch/x86/include
+		cp -fR arch/x86/* ${STAGING_KERNEL_DIR}/arch/x86/
 	fi
 	rm -f $ASMDIR ${STAGING_KERNEL_DIR}/include/asm
 	ln -sf $ASMDIR ${STAGING_KERNEL_DIR}/include/asm
-- 
1.6.3.1



