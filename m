Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1N7cTo-0007xz-BE
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Nov 2009 23:12:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 4E54352CB75;
	Mon,  9 Nov 2009 17:11:41 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05488-07; Mon,  9 Nov 2009 17:11:41 -0500 (EST)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 2F2FF539B71; Mon,  9 Nov 2009 17:11:41 -0500 (EST)
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 6CC45522724;
	Mon,  9 Nov 2009 17:11:40 -0500 (EST)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 548BF40FCC; Mon,  9 Nov 2009 17:11:40 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Nov 2009 17:11:36 -0500
Message-Id: <1257804696-7728-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.ott.cti.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] kernel.bbclass: pass ${KERNEL_VERSION} to depmod -a
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
X-List-Received-Date: Mon, 09 Nov 2009 22:12:59 -0000

The postinsts for kernel-image and modules run "depmod -a" on the
target, but this only updates the old kernel's modules.dep.

"depmod -a ${KERNEL_VERSION}" updates the files in
/lib/modules/${KERNEL_VERSION}.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---

module.bbclass could probably use the same thing, but I don't have a
test for it atm.

 classes/kernel.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 9c1f637..f6f1180 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -266,7 +266,7 @@ fi
 if [ -n "$D" ]; then
 	${HOST_PREFIX}depmod-${KERNEL_MAJOR_VERSION} -A -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
 else
-	depmod -a
+	depmod -a ${KERNEL_VERSION}
 fi
 }
 
@@ -274,7 +274,7 @@ pkg_postinst_modules () {
 if [ -n "$D" ]; then
 	${HOST_PREFIX}depmod-${KERNEL_MAJOR_VERSION} -A -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
 else
-	depmod -a
+	depmod -a ${KERNEL_VERSION}
 	update-modules || true
 fi
 }
-- 
1.6.3



