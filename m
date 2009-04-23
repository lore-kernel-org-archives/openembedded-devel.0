Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Lwxhz-0006zZ-JA
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 14:07:15 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id 4EEC2683CC;
	Thu, 23 Apr 2009 16:02:18 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Apr 2009 16:02:18 +0400
Message-Id: <1240488138-32232-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.3
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-Spam-Status: No
Subject: [PATCH] bitbake.conf: use rootfs.${PN} for IMAGE_ROOTFS
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
X-List-Received-Date: Thu, 23 Apr 2009 12:07:15 -0000

Allows parallel build for different images.
---
 conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index f53f7d6..15bdf56 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -329,7 +329,7 @@ STAGING_KERNEL_DIR = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}/kernel"
 # Specific image creation and rootfs population info.
 ##################################################################
 
-IMAGE_ROOTFS = "${TMPDIR}/rootfs"
+IMAGE_ROOTFS = "${TMPDIR}/rootfs.${PN}"
 IMAGE_BASENAME = "${PN}"
 IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
 IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
-- 
1.6.2.3


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



