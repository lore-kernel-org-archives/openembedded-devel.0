Received: from [209.85.219.168] (helo=mail-ew0-f168.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M6r0I-0008U8-CV
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 May 2009 20:59:02 +0200
Received: by ewy12 with SMTP id 12so166317ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 11:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=++nflMm5Kcyk/rNCsrcEh5MmPCVGhuo4JC/TclgMY8I=;
	b=Fe+PuF7BjfSw+mGb5XLR1tvJcPbIGZ/I8wQEPJ8D4tF6PpxUneqrEfmLjm15YaQmK0
	oqazSP1W57MGjdT+gIYidesbrrhWT2qTgdossufQLA3ofKA6HJYTAgLuxI0gxW6F6DXb
	MiplWQoNL2zgdJMNcu7AujDj3QS0VOZ0x6uLc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=AW8x87LCJb/aW8eRUyBvqQDpmKAnePvyxxjXIUREp0CF9DsRxP/p4IBwYO+3ShvLSv
	dy8xCp4PEykrw0mB9w03GSX2M0Tw/CIanD+m86xayLHk+/5OZQ0UiRC/HsxGiItZ9oaO
	pmOrlMJo4EXkHYd6kM+NDODkIWPTbqlWy399Y=
Received: by 10.216.16.212 with SMTP id h62mr382228weh.201.1242845490177;
	Wed, 20 May 2009 11:51:30 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 28sm2472484eye.6.2009.05.20.11.51.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 May 2009 11:51:25 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 20:51:23 +0200
Message-Id: <1242845483-10904-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] kernel, module-base class, bitbake.conf: introduce MACHINE_KERNEL_PR
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
X-List-Received-Date: Wed, 20 May 2009 18:59:03 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 classes/kernel.bbclass      |    4 ++++
 classes/module-base.bbclass |    4 ++++
 conf/bitbake.conf           |    4 ++++
 3 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 17e8941..954c407 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -64,6 +64,10 @@ export CMDLINE_CONSOLE = "console=${@bb.data.getVar("KERNEL_CONSOLE",d,1) or "tt
 KERNEL_VERSION = "${@get_kernelversion('${S}')}"
 KERNEL_MAJOR_VERSION = "${@get_kernelmajorversion('${KERNEL_VERSION}')}"
 
+# A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
+# rebuilds for kernel and external modules
+PR = "${MACHINE_KERNEL_PR}"
+
 KERNEL_LOCALVERSION ?= ""
 
 # kernels are generally machine specific
diff --git a/classes/module-base.bbclass b/classes/module-base.bbclass
index c98bace..bc53e1b 100644
--- a/classes/module-base.bbclass
+++ b/classes/module-base.bbclass
@@ -5,6 +5,10 @@ inherit kernel-arch
 export OS = "${TARGET_OS}"
 export CROSS_COMPILE = "${TARGET_PREFIX}"
 
+# A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
+# rebuilds for kernel and external modules
+PR = "${MACHINE_KERNEL_PR}"
+
 export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
 export KERNEL_SOURCE = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-source')}"
 KERNEL_OBJECT_SUFFIX = "${@[".o", ".ko"][base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion') > "2.6.0"]}"
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 1738f19..c411b95 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -157,6 +157,10 @@ EXTENDPEVER = "${@['','${PE\x7d:'][bb.data.getVar('PE',d,1) > 0]}"
 EXTENDPV = "${EXTENDPEVER}${PV}-${PR}${DISTRO_PR}"
 P = "${PN}-${PV}"
 
+# Define a PR for kernels that machines can override so things like
+# modules get rebuilt
+MACHINE_KERNEL_PR ?= "r0"
+
 # Base package name
 # Automatically derives "foo" from "foo-native", "foo-cross" or "foo-initial"
 # otherwise it is the same as PN and P
-- 
1.6.1



