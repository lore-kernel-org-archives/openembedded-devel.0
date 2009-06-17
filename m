Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MGudu-0006Bp-Uk
	for openembedded-devel@openembedded.org; Wed, 17 Jun 2009 14:53:31 +0200
Received: (qmail 10731 invoked by uid 813007); 17 Jun 2009 12:43:05 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 17 Jun 2009 12:43:05 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jun 2009 14:42:53 +0200
Message-Id: <1245242573-5006-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1245240653-436-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1245240653-436-1-git-send-email-marcin@juszkiewicz.com.pl>
Subject: [STABLE][PATCH] fix for MACHINE_KERNEL_PR stuff
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
X-List-Received-Date: Wed, 17 Jun 2009 12:53:31 -0000

This patch unbreaks current behaviour which was introduced by
MACHINE_KERNEL_PR variable.

As most of target machines do not use it they have PR with broken value
(set to "r0" instead of value in recipe). I took other way which makes
both types of users happy -- those with MACHINE_KERNEL_PR in use and
those without it.

By default we set M_K_PR to empty string instead of "r0" - this allows
to check is it set at all or not. If it is set then we set PR to this value.
Otherwise we ignore existance of that variable and use PR from recipe.

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 classes/kernel.bbclass |    9 +++++----
 conf/bitbake.conf      |    2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 954c407..278aec1 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -20,6 +20,11 @@ python __anonymous () {
     image = bb.data.getVar('INITRAMFS_IMAGE', d, True)
     if image != '' and image is not None:
         bb.data.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs', d)
+
+    machine_kernel_pr = bb.data.getVar('MACHINE_KERNEL_PR', d, True)
+
+    if machine_kernel_pr:
+       bb.data.setVar('PR', machine_kernel_pr, d)
 }
 
 INITRAMFS_IMAGE ?= ""
@@ -64,10 +69,6 @@ export CMDLINE_CONSOLE = "console=${@bb.data.getVar("KERNEL_CONSOLE",d,1) or "tt
 KERNEL_VERSION = "${@get_kernelversion('${S}')}"
 KERNEL_MAJOR_VERSION = "${@get_kernelmajorversion('${KERNEL_VERSION}')}"
 
-# A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
-# rebuilds for kernel and external modules
-PR = "${MACHINE_KERNEL_PR}"
-
 KERNEL_LOCALVERSION ?= ""
 
 # kernels are generally machine specific
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index c411b95..9333b4e 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -159,7 +159,7 @@ P = "${PN}-${PV}"
 
 # Define a PR for kernels that machines can override so things like
 # modules get rebuilt
-MACHINE_KERNEL_PR ?= "r0"
+MACHINE_KERNEL_PR = ""
 
 # Base package name
 # Automatically derives "foo" from "foo-native", "foo-cross" or "foo-initial"
-- 
1.6.3.1





