Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M9NEu-0002DB-Be
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 May 2009 19:48:33 +0200
Received: by ewy20 with SMTP id 20so4656146ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2009 10:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=+LP0ECGLuvzFvgcM59VmEwIixHxKpIWGIr6FdsdZFI4=;
	b=MT6UH/qC+M5btJlJIxNBJenxsi25UdovYA8Z9VQhXLJSZQbhpVUYaiySep7N79FOGO
	aTkvq111CjgYakcbmSNF6EFGUdv9lMz3a8baaP4N4I9OTc1MUBosJxoiFbfplX4alZNB
	L66MM2TNVbDelmDpYvXG4HW/G76blvzix94aI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=GFEtwp+3FZSNtYqfX61sOcHRWgnorGJrACDsPyiUgQnLnO6wwunh2b7Lna6bh2qig0
	hXn6YjanSt1SyYr8AItZQXZWw5kMmgcsFnz8wDwvNOqjZuIx+jE+OQgpm8a1Bg5ACFmP
	v9yBHxzzGp2ltm/nYL4aNTODsUz+z1PWJUuek=
Received: by 10.216.53.199 with SMTP id g49mr119697wec.49.1243446016662;
	Wed, 27 May 2009 10:40:16 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id j8sm4845845gvb.11.2009.05.27.10.40.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 27 May 2009 10:40:15 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 May 2009 19:40:12 +0200
Message-Id: <1243446012-9317-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] omap3sgx-modules: sync with .dev * update to build against newer kernels * switch to MACHINE_KERNEL_PR
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
X-List-Received-Date: Wed, 27 May 2009 17:48:35 -0000

From: Koen Kooi <koen@openembedded.org>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 .../omap3-sgx-modules_1.3.13.1397.bb               |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1397.bb b/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1397.bb
index 985a0c0..3f9a3cd 100644
--- a/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1397.bb
+++ b/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1397.bb
@@ -1,8 +1,6 @@
 DESCRIPTION = "Kernel drivers for the PowerVR SGX chipset found in the omap3 SoCs"
 LICENSE = "GPLv2"
 
-PR = "r6"
-
 inherit module
 
 SRC_URI = "http://dominion.thruhere.net/koen/OE/omap3-sgx-modules-${PV}.tar.bz2 \
@@ -16,7 +14,10 @@ PVRBUILD = "release"
 MAKE_TARGETS = " BUILD=${PVRBUILD}"
 
 do_compile_prepend() {
-	find ${S} -name "*.*o" | xargs rm
+	find ${S} -name "*.*o" | xargs rm || true
+	if [ $(echo ${KERNEL_VERSION} | cut -c5,6) -gt 28 ] ; then
+		sed -i -e 's:omap_dispc_unregister_isr(OMAPLFBVSyncISR):omap_dispc_unregister_isr(OMAPLFBVSyncISR, psSwapChain, DISPC_IRQ_VSYNC):g' services4/3rdparty/dc_omap3430_linux/omaplfb_linux.c
+	fi
 }
 
 do_install() {
-- 
1.6.1



