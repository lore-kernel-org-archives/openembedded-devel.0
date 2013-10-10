Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 30C5D6CFF0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 21:26:32 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so1420256eak.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 14:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ixEpXQAnZv9HfXjyZOm7aw25isoMpCFAWjjC8E3Y6eo=;
	b=u9fXeLQctvapaW5bJm8m7+pR4yqTgu9RNUzVpmhZKeHPghBmA2TRHxM6PHPgH9tm+r
	afEBc8e6PsDzNPABhkm5QAWCRPCnS9RCS8YDpQtoRSOUXgls8lNY973BNtbjy4JitAmE
	hg3z3A154K2510FxEl/tDe5Zv/NPZnEwMV7hqkPvP2NYlILR4TG4pznDXEbDZME/KQUy
	ciGUQvOPxtUw3YBkMvictHo6czGt1fBEEfowXpkoGUNDmnLPISVSsYZElLzG1wMp3tkj
	vxB1jRpwgJ/BsVuyWFrg5FGEus2Kc5sKXJ/7mhLLH+Zf2rSmdRpd8QC2bWDR9WqCPZGr
	qLow==
X-Received: by 10.15.108.7 with SMTP id cc7mr99468eeb.86.1381440393405;
	Thu, 10 Oct 2013 14:26:33 -0700 (PDT)
Received: from mizar.localdomain
	(host138-252-dynamic.0-87-r.retail.telecomitalia.it. [87.0.252.138])
	by mx.google.com with ESMTPSA id
	l49sm22010765eeo.12.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Oct 2013 14:26:32 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Oct 2013 23:26:25 +0200
Message-Id: <1381440385-14152-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1381440385-14152-1-git-send-email-andrea.adami@gmail.com>
References: <1381440385-14152-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 2/2] kexecboot_cfg: process with oe-stylize.py
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Oct 2013 21:26:32 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb        | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
index af3320f..ff91b20 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
@@ -3,23 +3,13 @@ DESCRIPTION = "Default icon and boot.cfg for kexecboot linux-as-bootloader."
 SECTION = "base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
-
 PR = "r14"
 
-INHIBIT_DEFAULT_DEPS = "1"
-
 SRC_URI = "file://icon.xpm"
 
-CMDLINE ?= ""
-CMDLINE_DEBUG ?= "quiet"
-
-# Note: for qvga the label is currently limited to about 24 chars
-KEXECBOOT_LABEL ?= "${@d.getVar('DISTRO', True) or d.getVar('DISTRO_VERSION', True)}-${MACHINE}"
-
 do_configure_prepend () {
     install -m 0644 ${WORKDIR}/icon.xpm ${S}
 }
-
 do_install_prepend () {
 echo '# /boot/boot.cfg - KEXECBOOT configuration file.
 #
@@ -53,7 +43,6 @@ APPEND=${CMDLINE} ${CMDLINE_DEBUG}
 # APPEND=${CMDLINE}
 #' > ${S}/boot.cfg
 }
-
 do_install () {
     install -d ${D}/boot
     install -m 0644 boot.cfg ${D}/boot/boot.cfg
@@ -63,3 +52,11 @@ do_install () {
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 FILES_${PN} += "/boot/*"
+
+CMDLINE ?= ""
+CMDLINE_DEBUG ?= "quiet"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+# Note: for qvga the label is currently limited to about 24 chars
+KEXECBOOT_LABEL ?= "${@d.getVar('DISTRO', True) or d.getVar('DISTRO_VERSION', True)}-${MACHINE}"
-- 
1.8.1.5


