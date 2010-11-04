Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anarsoul@gmail.com>) id 1PDwU9-0000Nn-QW
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 10:51:58 +0100
Received: by mail-ew0-f47.google.com with SMTP id 2so836616ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 02:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=7AfShIn2ljPA+I0EYgvFeWwOm3LzpJpVMmLuRPGW8DU=;
	b=DZEuOQCSDCOo13s6Xxw/DVgg1b096BLvLFPEfYYPRZQmOwP2HM6bkhaW8CpwZgzVLV
	UMU7mZCgcL1dBl5muJZOtC1lQ6KTXDK9nvBeurvlx6HWTq8KPDZ3aUSYkjRvsm2MXlQN
	+vAH6FMlP7Le2NuOKUtBcBEXvO+JCvD1Awkps=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=i1p/yZWCNtFfIOXAOIG5pMJfVaVNZxIHxJIXKggIMUU1ykwGTrfLiu7E7OtUfns9ks
	6a9xqFxhGoQL26XzLc21JSZbRqc4C2tIdgfcsCiX23BfWpB7o/pVfuypIEePKC7vL7L5
	QiBh11fnS69Xa6Z5kxSqAnir2qmd+LIJTj87o=
Received: by 10.213.36.5 with SMTP id r5mr124867ebd.97.1288864266491;
	Thu, 04 Nov 2010 02:51:06 -0700 (PDT)
Received: from localhost.localdomain ([86.57.155.118])
	by mx.google.com with ESMTPS id w20sm7571839eeh.6.2010.11.04.02.51.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 04 Nov 2010 02:51:05 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Nov 2010 11:50:27 +0200
Message-Id: <1288864227-8685-2-git-send-email-anarsoul@gmail.com>
X-Mailer: git-send-email 1.7.3.2
In-Reply-To: <1288864227-8685-1-git-send-email-anarsoul@gmail.com>
References: <1288864227-8685-1-git-send-email-anarsoul@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: anarsoul@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] busybox: fix build issue with make-3.82
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
X-List-Received-Date: Thu, 04 Nov 2010 09:51:59 -0000

make-3.82 complains about mixed implicit and normal rules
on busybox 1.15.x/1.16.x Makefile. 1.17.x versions are not affected.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 recipes/busybox/busybox_1.15.3.bb             |    3 ++-
 recipes/busybox/busybox_1.16.2.bb             |    6 +++++-
 recipes/busybox/files/busybox-make-3-82.patch |   20 ++++++++++++++++++++
 3 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 recipes/busybox/files/busybox-make-3-82.patch

diff --git a/recipes/busybox/busybox_1.15.3.bb b/recipes/busybox/busybox_1.15.3.bb
index 5fa6225..987b9c5 100644
--- a/recipes/busybox/busybox_1.15.3.bb
+++ b/recipes/busybox/busybox_1.15.3.bb
@@ -1,8 +1,9 @@
 require busybox_1.1x.inc
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
 
 SRC_URI += "\
   file://0000-wget-no-check-certificate.patch \
+  file://busybox-make-3-82.patch \
 "
 
 SRC_URI[md5sum] = "6059ac9456de6fb18dc8ee4cd0ec9240"
diff --git a/recipes/busybox/busybox_1.16.2.bb b/recipes/busybox/busybox_1.16.2.bb
index 982b49b..fb80b52 100644
--- a/recipes/busybox/busybox_1.16.2.bb
+++ b/recipes/busybox/busybox_1.16.2.bb
@@ -1,5 +1,9 @@
 require busybox_1.1x.inc
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
+
+SRC_URI += "\
+  file://busybox-make-3-82.patch \
+"
 
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_shr = "1"
diff --git a/recipes/busybox/files/busybox-make-3-82.patch b/recipes/busybox/files/busybox-make-3-82.patch
new file mode 100644
index 0000000..5c5c3b6
--- /dev/null
+++ b/recipes/busybox/files/busybox-make-3-82.patch
@@ -0,0 +1,20 @@
+--- busybox-1.7.4/Makefile.1	2010-10-26 19:31:29.040000217 +0300
++++ busybox-1.7.4/Makefile	2010-10-26 19:39:14.010000218 +0300
+@@ -402,7 +402,7 @@ ifeq ($(config-targets),1)
+ -include $(srctree)/arch/$(ARCH)/Makefile
+ export KBUILD_DEFCONFIG
+ 
+-config %config: scripts_basic outputmakefile FORCE
++%config: scripts_basic outputmakefile FORCE
+ 	$(Q)mkdir -p include
+ 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
+ 	$(Q)$(MAKE) -C $(srctree) KBUILD_SRC= .kernelrelease
+@@ -1240,7 +1240,7 @@ endif
+ 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
+ 
+ # Modules
+-/ %/: prepare scripts FORCE
++%/: prepare scripts FORCE
+ 	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
+ 	$(build)=$(build-dir)
+ %.ko: prepare scripts FORCE
-- 
1.7.3.2



