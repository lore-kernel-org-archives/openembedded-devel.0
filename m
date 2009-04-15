Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Lu4PX-0008Ge-BN
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 14:40:29 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id A1E05683CC;
	Wed, 15 Apr 2009 16:36:00 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@openembedded.org
Date: Wed, 15 Apr 2009 16:35:52 +0400
Message-Id: <1239798960-3586-3-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.1
In-Reply-To: <1239798960-3586-2-git-send-email-khimov@altell.ru>
References: <200904151633.49146.khimov@altell.ru>
	<1239798960-3586-1-git-send-email-khimov@altell.ru>
	<1239798960-3586-2-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 03/11] linux-libc-headers 2.6.23: fix amd64 headers
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
X-List-Received-Date: Wed, 15 Apr 2009 12:40:54 -0000

Taken from http://bugs.openembedded.net/show_bug.cgi?id=1728
---
 .../linux-libc-headers_2.6.23.bb                   |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
index 13579f9..db13a45 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
@@ -63,4 +63,16 @@ do_stage () {
 	cp -pfLR ${STAGE_TEMP}${includedir}/linux ${STAGING_INCDIR}/
 	cp -pfLR ${STAGE_TEMP}${includedir}/asm ${STAGING_INCDIR}/
 	cp -pfLR ${STAGE_TEMP}${includedir}/asm-generic ${STAGING_INCDIR}/
+        if [ "${ARCH}" == "x86_64" ]; then
+		cp -pfLR ${STAGE_TEMP}${includedir}/asm-x86_64 ${STAGING_INCDIR}/
+		cp -pfLR ${STAGE_TEMP}${includedir}/asm-i386 ${STAGING_INCDIR}/
+	fi
+}
+
+do_stage_append_multilib () {
+	mkdir ${STAGING_INCDIR}/${TARGET_SYS_MULTILIB}
+	ln -s ../linux ${STAGING_INCDIR}/${TARGET_SYS_MULTILIB}/linux
+	ln -s ../asm ${STAGING_INCDIR}/${TARGET_SYS_MULTILIB}/asm
+	ln -s ../asm-generic ${STAGING_INCDIR}/${TARGET_SYS_MULTILIB}/asm-generic
+	ln -s ../asm-i386 ${STAGING_INCDIR}/${TARGET_SYS_MULTILIB}/asm-i386
 }
-- 
1.6.2.1


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



