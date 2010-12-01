Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PNfrk-0000FV-0X
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 07:08:33 +0100
Received: by fxm17 with SMTP id 17so4313761fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 22:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=+JRw792sLP7bHFABovi1LmAYTtgUzftXvaKyv0PMs2k=;
	b=vflnP01oM7wOi1Vv6XCoI/69WOM06q+Ow/xhlFHtcI1Te6GOGbcmees7XPPEdeggFC
	4iUWDrYPouX/aZuKVw9fJEqjSi8H9q+YO/3PJSe8pmDadnQkiUEHr5NFTTLTvmClf0ea
	aHD50LrS8qnrhRCXtj3Kcfqu4PYYCXC+8QA/w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=jAv9JrNE95w//76fq5xrspZz+mvqVISUHAHNFvNAbmmMQyzTFGd//87hM03/JDEnTc
	MaQo45JLTG2bSlXnwPfM/FqrrJlrT+P1qbonlMOIlNbxjVxSCkDQK+/9jOp1qH66wvoj
	7B3S+LcADuu9yE8vix2lBlSRWl9n1p5D0PLCs=
Received: by 10.223.93.206 with SMTP id w14mr7764810fam.71.1291183630613;
	Tue, 30 Nov 2010 22:07:10 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id c10sm1921346fat.6.2010.11.30.22.07.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 30 Nov 2010 22:07:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Dec 2010 07:07:05 +0100
Message-Id: <1291183625-26106-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.2
In-Reply-To: <AANLkTi=Jcih2tFQYB2Qr2RJMAouZFFShfYmoWgE8M1rC@mail.gmail.com>
References: <AANLkTi=Jcih2tFQYB2Qr2RJMAouZFFShfYmoWgE8M1rC@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCHv2] kernel.bbclass: put bluez-dtl1-workaround to DEPENDS directly
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
X-List-Received-Date: Wed, 01 Dec 2010 06:08:33 -0000

* DEPENDS_kernel-module-dtl1-cs aren't probably included in run queue
* RDEPENDS_kernel-module-dtl1-cs probably also doesn't put it to run queue,
  because kernel-module-* are created by
  PACKAGES_DYNAMIC += "kernel-module-*"
  so not even known before even building kernel, but does work ok in runtime
* bluez-dtl1-workaround is small and fast to build so won't hurt to
  build even when kernel doesn't have this bluez module enabled in
  defconfig

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/kernel.bbclass     |    3 +--
 recipes/tasks/task-base.bb |    4 ----
 2 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 7039d27..422bcd7 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -1,7 +1,7 @@
 inherit linux-kernel-base module_strip
 
 PROVIDES += "virtual/kernel"
-DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}depmod-${@get_kernelmajorversion('${PV}')} virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
+DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}depmod-${@get_kernelmajorversion('${PV}')} virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules bluez-dtl1-workaround"
 
 # we include gcc above, we dont need virtual/libc
 INHIBIT_DEFAULT_DEPS = "1"
@@ -268,7 +268,6 @@ ALLOW_EMPTY_kernel-image = "1"
 
 # Userspace workarounds for kernel modules issues
 # This is shame, fix the kernel instead!
-DEPENDS_kernel-module-dtl1-cs = "bluez-dtl1-workaround"
 RDEPENDS_kernel-module-dtl1-cs = "bluez-dtl1-workaround"
 
 # renamed modules
diff --git a/recipes/tasks/task-base.bb b/recipes/tasks/task-base.bb
index ecc5278..6e2d9f0 100644
--- a/recipes/tasks/task-base.bb
+++ b/recipes/tasks/task-base.bb
@@ -266,11 +266,7 @@ RRECOMMENDS_task-base-bluetooth = "\
     ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluecard-cs', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluetoothuart-cs', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-dtl1-cs', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'bluez-dtl1-workaround', '',d)} \
     "
-# bluez-dtl1-workaround above is workaround for bitbake not handling DEPENDS on it in
-# kernel.bbclass. It should be there as long as kernel-module-dtl1-cs is, but not longer.
-
 RDEPENDS_task-base-irda = "\
     irda-utils"
 
-- 
1.7.3.2



