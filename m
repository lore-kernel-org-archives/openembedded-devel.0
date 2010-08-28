Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpRy2-0001t8-Oc
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:25:50 +0200
Received: by pxi11 with SMTP id 11so1624356pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Pv1gibRJqiOt08nj22+QCTfsvKylhY8OyIZrRXVTxiY=;
	b=cuO09cn8alIjDOu+DyD7HFR1nUEgjIpGk2HuHWi3ZuEOy/S1LRXguAPbGHU0uINp+2
	N+XN2NuXdGzjdZr0WjEAd0l+jeOUngpBDJMmoVqeZeI2BCcWVHHEe5AaLf0ySiMnZJtZ
	skPc177YC8eMmPQOiAge97MyGL9drBdM21100=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=boDuOtFRa2zbUWBzeQzCv2n4mNX/RxrkpyVmrHyP6FF7DdsEEeQ5HiWU2BWkOrQP1Z
	VCuIjeKa4+7BSOV525wjqKOfcMefePT74XZkdkOtUd+z41UyhMv9+EZidOe87HoawkCy
	TOOYgf5zGV9P5oXsyVJXc32c2diqME6QKv+xw=
Received: by 10.142.229.13 with SMTP id b13mr2641495wfh.349.1283027103614;
	Sat, 28 Aug 2010 13:25:03 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm6649371wfl.13.2010.08.28.13.25.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Aug 2010 13:25:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 13:24:28 -0700
Message-Id: <1283027073-12308-19-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 18/23] initramfs-module-bootmenu_1.0.bb, initramfs-module-kexecboot_1.0.bb: Rename klibc-utils-static-fstype -> klibc-static-utils-fstype
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
X-List-Received-Date: Sat, 28 Aug 2010 20:25:51 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../initrdscripts/initramfs-module-bootmenu_1.0.bb |    2 +-
 .../initramfs-module-kexecboot_1.0.bb              |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/initrdscripts/initramfs-module-bootmenu_1.0.bb b/recipes/initrdscripts/initramfs-module-bootmenu_1.0.bb
index 890fef3..f662cb4 100644
--- a/recipes/initrdscripts/initramfs-module-bootmenu_1.0.bb
+++ b/recipes/initrdscripts/initramfs-module-bootmenu_1.0.bb
@@ -1,7 +1,7 @@
 SRC_URI = "file://30-bootmenu.sh"
 PR = "r19"
 DESCRIPTION = "An initramfs module with UI for selection of boot device."
-RDEPENDS_${PN} = "klibc-utils-static-fstype initramfs-uniboot initramfs-module-block initramfs-module-loop initramfs-module-nfs"
+RDEPENDS_${PN} = "klibc-static-utils-fstype initramfs-uniboot initramfs-module-block initramfs-module-loop initramfs-module-nfs"
 # For VFAT mounting.
 RRECOMMENDS_${PN} = "kernel-module-nls-cp437 kernel-module-nls-iso8859-1"
 
diff --git a/recipes/initrdscripts/initramfs-module-kexecboot_1.0.bb b/recipes/initrdscripts/initramfs-module-kexecboot_1.0.bb
index e153d2b..a973b06 100644
--- a/recipes/initrdscripts/initramfs-module-kexecboot_1.0.bb
+++ b/recipes/initrdscripts/initramfs-module-kexecboot_1.0.bb
@@ -1,7 +1,7 @@
 SRC_URI = "file://87-kexecboot.sh"
 PR = "r3"
 DESCRIPTION = "An initramfs module for kexecing kernel from rootfs."
-RDEPENDS_${PN} = "initramfs-uniboot kexec-klibc-static"
+RDEPENDS_${PN} = "initramfs-uniboot kexec-tools-klibc"
 
 do_install() {
 	install -d ${D}/initrd.d
-- 
1.7.1



