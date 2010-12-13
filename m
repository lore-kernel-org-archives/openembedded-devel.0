Received: from mail-gx0-f179.google.com ([209.85.161.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwatkins.ti@gmail.com>) id 1PSBwG-0002VM-Dx
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 18:11:53 +0100
Received: by gxk21 with SMTP id 21so3994673gxk.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 09:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=NBj2tKtWGl5DRzZGI2dwbOhTPGOQ/0G3I5n7Ifeteq4=;
	b=K957tYRfpiBXvbDmZQIJH1kavPUxbuaYtMMtBMCKoVvbU5pHpxS1tN/YBeWE8bs6Tt
	Ej5tAkWy4ueXNC/JksVpGEueSBjvSwMbYEtYYdIlmunvgbG6fkAz6CN594504uGpYx6t
	J2lfKJSuwxCcdJEy+d91CzsqFF/qjqWGiF26M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=grcJwzBTdM3xwuC1ZPKbdtrxAl36FLgAk/cUOatH4L7RXUg8jIgvE0xDUNwoOuPzgX
	hDQneoxjiLIN6c/lxUXHSr3qWY3kbzRnxf0FAWZjSMFsliLgyxgmOipzTzVEPk/0kA16
	dePzzN1z+B5pB1Xtmuc7KKmddD/lAAGk5lIuc=
Received: by 10.100.164.1 with SMTP id m1mr2845871ane.36.1292260216652;
	Mon, 13 Dec 2010 09:10:16 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id x36sm317202anx.34.2010.12.13.09.10.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 13 Dec 2010 09:10:16 -0800 (PST)
From: Melissa Watkins <mwatkins.ti@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Dec 2010 07:19:48 -0600
Message-Id: <1292246388-5903-1-git-send-email-m-watkins@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.161.179
X-SA-Exim-Mail-From: mwatkins.ti@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=AWL,BAYES_00,
	DATE_IN_PAST_03_06, RCVD_IN_DNSWL_LOW,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Melissa Watkins <m-watkins@ti.com>, Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 2/4] ti-pru-sw-edma-driver: do not strip driver
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
X-List-Received-Date: Mon, 13 Dec 2010 17:11:53 -0000

* Added PACKAGE_STRIP = "no" so that the module will not be
  stripped and can be insmoded into the kernel.  Failure to
  do so results in errors like:
    <module>: module has no symbols (stripped?)
* Changed PR setting to key off changes to MACHINE_KERNEL_PR
  or the SRCREV of the module repository.
* Updated SRC_REV.
* Updated COMAPTIBLE_MACHINE

Signed-off-by: Melissa Watkins <m-watkins@ti.com>
Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb b/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb
index e315f8e..b975d78 100644
--- a/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb
+++ b/recipes/ti/ti-pru-sw-edma-driver_1.00.00.bb
@@ -1,16 +1,18 @@
 DESCRIPTION = "Builds eDMA module used by eDMA libraries for PRU sw example applications"
 HOMEPAGE = "https://gforge.ti.com/gf/project/pru_sw/"
 LICENSE = "GPLv2"
-PR = "r0+svnr${SRCPV}"
 
-COMPATIBLE_MACHINE = "omapl138|am180x-evm|am181x-evm"
+COMPATIBLE_MACHINE = "omapl138"
 
 SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-SRCREV = "18"
+SRCREV = "20"
 S = "${WORKDIR}/trunk/peripheral_lib/edma_driver/module"
 
+PACKAGE_STRIP = "no"
+
 inherit module
+PR = "${MACHINE_KERNEL_PR}+svnr${SRCPV}"
 
 do_install () {
         install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/pru
-- 
1.7.0.4



