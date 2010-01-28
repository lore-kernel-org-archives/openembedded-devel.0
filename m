Received: from mail-ew0-f213.google.com ([209.85.219.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NacfQ-0006Yt-Cs
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jan 2010 23:16:51 +0100
Received: by ewy5 with SMTP id 5so756679ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2010 14:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=Dp2NZQINOCghYDthcMuqjl4HM55uKqeOkmMK/XEf9SQ=;
	b=RKCbYNT+/ydOjbHdTsw69t1ugQmOwPbsqSjoEvoJ5VW36M3I7T0IQ+aq82Ee64L68G
	RsHdk7avyBXHwOkt2uKVTrKy0DMavPpzygRqafCigAjEJQ38JxCHxR1qhrZJJyvWKpad
	gk25Ee95+2KHZEx7NUMMhqrll6qEmbHvAedK8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=rkg4/NtxKwhZtq8vrBrVC1RbQf7aRxEsiWskeJQY58zHpt1KqoD/R501MgeDgWO7MU
	kFOk/UAHvx7mNumGfCK9QvyGsGRPULsr6Toa8Mb2tpbuOw5kP140QDwJi4pInASNO+p0
	lNOlB59mJ9zANT81g1WF7zUbC8auZNxqbnAss=
Received: by 10.213.1.130 with SMTP id 2mr448825ebf.85.1264716865425;
	Thu, 28 Jan 2010 14:14:25 -0800 (PST)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id 7sm2727713eyg.9.2010.01.28.14.14.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 28 Jan 2010 14:14:24 -0800 (PST)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jan 2010 23:14:07 +0100
Message-Id: <1264716847-1311-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.219.213
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] kernel.bbclass only install image in do_deploy if not installing from packaged staging
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
X-List-Received-Date: Thu, 28 Jan 2010 22:16:51 -0000

install -m 0644 ${KERNEL_OUTPUT} ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
expands to
install -m 0644 arch/arm/boot/uImage .../deploy/glibc/images/beagleboard/uImage-2.6.29-r51-beagleboard.bin
but of course arch/arm/boot/uImage does not exist since we are using packaged staging so we get
the error:
install: cannot stat `arch/arm/boot/uImage': No such file or directory
This patch only installs if not using packaged staging
---
 classes/kernel.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 53ea252..fa48a43 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -537,7 +537,9 @@ MODULES_IMAGE_BASE_NAME ?= modules-${PV}-${PR}-${MACHINE}
 
 do_deploy() {
 	install -d ${DEPLOY_DIR_IMAGE}
-	install -m 0644 ${KERNEL_OUTPUT} ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
+	if [ "$PSTAGING_ACTIVE" = "0" ]; then
+	    install -m 0644 ${KERNEL_OUTPUT} ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
+	fi
 	package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
 
 	if [ -d "${PKGD}/lib" ]; then
-- 
1.6.4.2



