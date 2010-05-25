Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OGuuQ-0005Ij-Pb
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 16:15:07 +0200
Received: by fxm9 with SMTP id 9so1144116fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 May 2010 07:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=QXfH2xHyvPsTQnO+YHD/ol7Vr9qWP7KrIDCi7p/txg0=;
	b=AqBysUPJK+U1YDc0CwQU6H2BVnfhJRLYf/ppzTpLFNhDzo5kVzKjBaRzyc03vqC3Hb
	ZZEmIrI1Kd6/YQNQk6/TDe/A/rZTiVwpw1H6uYmR468SSF5Mu4o6Y7u5v2iNEO5VmSaI
	LP/lvGKUDa0mr0BigA1TCnWhT49pixwpR+kg4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=sIxd4XmnwKKI9miylXtUUl7ARbCZY/judGKESivHGnCo4XTZunvKWpYKQm4XlWhGyp
	dYTnJO+ZjVG/SFJOfYlprqYhcib0URTT/YGVv9Jg+sO9wIGO149JDmdHYHSZgB2a14/b
	Ff/thlAOhNxAHtZ4oNZsHprQaS8VxhH6XkV0U=
Received: by 10.223.17.90 with SMTP id r26mr6309186faa.5.1274796659935;
	Tue, 25 May 2010 07:10:59 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id g10sm24996836fai.0.2010.05.25.07.10.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 May 2010 07:10:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 May 2010 16:09:50 +0200
Message-Id: <1274796590-1788-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1274794225-16222-4-git-send-email-Martin.Jansa@gmail.com>
References: <1274794225-16222-4-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] linux-openmoko: move DESCRIPTION to .inc, remove OEV, KERNEL_RELEASE and KERNEL_VERSION
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
X-List-Received-Date: Tue, 25 May 2010 14:15:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/linux/linux-openmoko.inc        |    2 ++
 recipes/linux/linux-openmoko_2.6.24.bb  |   10 ++--------
 recipes/linux/linux-openmoko_2.6.28.bb  |   10 ++--------
 recipes/linux/linux-openmoko_2.6.29.bb  |   10 ++--------
 recipes/linux/linux-openmoko_2.6.32.bb  |   10 +++-------
 recipes/linux/linux-openmoko_2.6.34_git |    8 ++------
 6 files changed, 13 insertions(+), 37 deletions(-)

diff --git a/recipes/linux/linux-openmoko.inc b/recipes/linux/linux-openmoko.inc
index 99865c9..c8c38d0 100644
--- a/recipes/linux/linux-openmoko.inc
+++ b/recipes/linux/linux-openmoko.inc
@@ -7,6 +7,8 @@ UBOOT_ENTRYPOINT = "30008000"
 COMPATIBLE_HOST = "arm.*-linux"
 COMPATIBLE_MACHINE = "om-gta01|om-gta02|om-3d7k"
 
+DESCRIPTION_${PN} = "Linux kernel for the Openmoko Neo GSM Smartphones"
+
 KERNEL_IMAGE_SYMLINK_NAME_om-gta01 = "uImage-GTA01.bin"
 KERNEL_IMAGE_SYMLINK_NAME_om-gta02 = "uImage-GTA02.bin"
 KERNEL_IMAGE_SYMLINK_NAME_om-3d7k  = "uImage-OM3D7K.bin"
diff --git a/recipes/linux/linux-openmoko_2.6.24.bb b/recipes/linux/linux-openmoko_2.6.24.bb
index f7f7e32..792facd 100644
--- a/recipes/linux/linux-openmoko_2.6.24.bb
+++ b/recipes/linux/linux-openmoko_2.6.24.bb
@@ -1,15 +1,9 @@
 require linux.inc
 require linux-openmoko.inc
 
-DESCRIPTION = "The Linux kernel for the Openmoko devices GTA01 (Neo1973) and GTA02 (Neo FreeRunner)"
-
-KERNEL_RELEASE = "2.6.24"
-KERNEL_VERSION = "${KERNEL_RELEASE}"
-
 SRCREV = "fb42ce6724576fc173faf8abfb04aa2c36d213b7"
-OEV = "oe5"
-PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCPV}"
-PR = "r1"
+PR = "r2"
+PR_append = "+gitr${SRCPV}"
 
 SRC_URI = "\
   git://git.openmoko.org/git/kernel.git;protocol=git;branch=stable \
diff --git a/recipes/linux/linux-openmoko_2.6.28.bb b/recipes/linux/linux-openmoko_2.6.28.bb
index cc5ab90..b2a4312 100644
--- a/recipes/linux/linux-openmoko_2.6.28.bb
+++ b/recipes/linux/linux-openmoko_2.6.28.bb
@@ -1,15 +1,9 @@
 require linux.inc
 require linux-openmoko.inc
 
-DESCRIPTION_${PN} = "Linux ${KERNEL_RELEASE} kernel for the Openmoko Neo GSM Smartphones"
-
-KERNEL_RELEASE = "2.6.28"
-KERNEL_VERSION = "${KERNEL_RELEASE}"
-
 SRCREV = "8c65792a5c83c76d662a617a7c4e1ae8104bb6a5"
-OEV = "oe2"
-PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCPV}"
-PR = "r0"
+PR = "r1"
+PR_append = "+gitr${SRCPV}"
 
 SRC_URI = "\
   git://git.openmoko.org/git/kernel.git;protocol=git;branch=stable \
diff --git a/recipes/linux/linux-openmoko_2.6.29.bb b/recipes/linux/linux-openmoko_2.6.29.bb
index 8753d65..3d9c58a 100644
--- a/recipes/linux/linux-openmoko_2.6.29.bb
+++ b/recipes/linux/linux-openmoko_2.6.29.bb
@@ -1,15 +1,9 @@
 require linux.inc
 require linux-openmoko.inc
 
-DESCRIPTION_${PN} = "Linux ${KERNEL_VERSION} kernel for the Openmoko Neo GSM Smartphones"
-
-KERNEL_RELEASE = "2.6.29"
-KERNEL_VERSION = "2.6.29-rc3"
-
 SRCREV = "973a41fce60e5f6edfcf0eaf94056a57eee65e16"
-OMV = "oe11"
-PV = "${KERNEL_RELEASE}-${OMV}+gitr${SRCPV}"
-PR = "r8"
+PR = "r9"
+PR_append = "+gitr${SRCPV}"
 
 SRC_URI = "\
   git://git.openmoko.org/git/kernel.git;protocol=git;branch=andy-tracking \
diff --git a/recipes/linux/linux-openmoko_2.6.32.bb b/recipes/linux/linux-openmoko_2.6.32.bb
index 133e5af..b7161ea 100644
--- a/recipes/linux/linux-openmoko_2.6.32.bb
+++ b/recipes/linux/linux-openmoko_2.6.32.bb
@@ -1,19 +1,15 @@
 require linux.inc
 require linux-openmoko.inc
 
-DESCRIPTION_${PN} = "Linux ${KERNEL_RELEASE} kernel for the Openmoko Neo GSM Smartphones"
-
-KERNEL_RELEASE="2.6.32.13"
-
 SRCREV = "a9254be10ac2294ea20165a87c09ea6afcf66d94"
-OEV = "oe2"
-PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCPV}"
+PR = "r1"
+PR_append = "+gitr${SRCPV}"
 
 SRC_URI = "\
   git://git.openmoko.org/git/kernel.git;protocol=git;branch=om-gta02-2.6.32 \
   file://0001-Revert-s3cmci-initialize-default-platform-data-no_wp.patch;patch=1 \
 # latest stable patch for ubi fix 943e167cb3e8fb191894bde8a4a75db78531a7c8
-  ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${KERNEL_RELEASE}.bz2;patch=1;name=stablepatch \
+  ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-2.6.32.13.bz2;patch=1;name=stablepatch \
 # build fix
   file://0001-wm8753-fix-build-with-gcc-4.4.2-which-works-ok-with-.patch;patch=1 \
 # patches from Radek Polak used in qtmoko
diff --git a/recipes/linux/linux-openmoko_2.6.34_git b/recipes/linux/linux-openmoko_2.6.34_git
index 6d3b52b..0ff0351 100644
--- a/recipes/linux/linux-openmoko_2.6.34_git
+++ b/recipes/linux/linux-openmoko_2.6.34_git
@@ -1,13 +1,9 @@
 require linux.inc
 require linux-openmoko.inc
 
-DESCRIPTION_${PN} = "Linux ${KERNEL_RELEASE} kernel for the Openmoko Neo GSM Smartphones"
-
-KERNEL_RELEASE="2.6.34"
-
 SRCREV = "dd1225cc08c3375bf80289ac1965c724881b149a"
-OEV = "oe2"
-PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCPV}"
+PR = "r1"
+PR_append = "+gitr${SRCPV}"
 
 SRC_URI = "\
   git://git.openmoko.org/git/kernel.git;protocol=git;branch=om-gta02-2.6.34 \
-- 
1.7.1



