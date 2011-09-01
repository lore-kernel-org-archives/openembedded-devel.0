Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qz9TY-00053y-1U
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 17:46:44 +0200
Received: by mail-fx0-f47.google.com with SMTP id 11so871094fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 08:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=OqgHPBPzkp5ouxU4dNp7rAUyLEWNoL2njA1H05kUPpw=;
	b=Q4/arcwQYPojWlWi/goKrZgOVmYkr4ARMTJf4wlL7Rm5+ldJfhaO4vPl66+wfcX+Ix
	yBVhdR6g44lFzU5g4WGsksrhuqnbon3g3m4+fCd0aRlUJ5muf6owMs02ESxgjA/jY5AX
	OZK6Rc2FtyomB2Oo8rQvy35jixsK0pp6k0bz0=
Received: by 10.223.7.66 with SMTP id c2mr13496fac.0.1314891710573;
	Thu, 01 Sep 2011 08:41:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 16sm128363faw.18.2011.09.01.08.41.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Sep 2011 08:41:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2011 17:39:17 +0200
Message-Id: <52474e220091dd5e48fffa0e330d816cbf99ec4c.1314891222.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <d5fa6ed7bc46990f2652da9019d9531de1cd443d.1314891222.git.Martin.Jansa@gmail.com>
References: <d5fa6ed7bc46990f2652da9019d9531de1cd443d.1314891222.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1314891222.git.Martin.Jansa@gmail.com>
References: <cover.1314891222.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld][PATCH 10/10] initramfs-kexecboot*image: import from meta-zaurus
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
X-List-Received-Date: Thu, 01 Sep 2011 15:46:44 -0000

* from rev 36ad029194d2b57efa07896b5cda3231bc71f357 in meta-smartphone repo
  http://git.shr-project.org/git/?p=meta-smartphone.git;a=commit;h=36ad029194d2b57efa07896b5cda3231bc71f357

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-bsp/images/initramfs-kexecboot-image.bb    |   23 ++++++++++++++++++++
 .../images/initramfs-kexecboot-klibc-image.bb      |    3 ++
 2 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/images/initramfs-kexecboot-image.bb
 create mode 100644 recipes-bsp/images/initramfs-kexecboot-klibc-image.bb

diff --git a/recipes-bsp/images/initramfs-kexecboot-image.bb b/recipes-bsp/images/initramfs-kexecboot-image.bb
new file mode 100644
index 0000000..a1609d6
--- /dev/null
+++ b/recipes-bsp/images/initramfs-kexecboot-image.bb
@@ -0,0 +1,23 @@
+# Initramfs image providing kexecboot
+# a linux as bootloader implementation
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+IMAGE_FSTYPES = "cpio.gz cpio.lzma"
+
+# avoid circular dependencies
+EXTRA_IMAGEDEPENDS = ""
+
+IMAGE_INSTALL = "kexecboot"
+
+IMAGE_LINGUAS = ""
+IMAGE_LOGIN_MANAGER = ""
+IMAGE_INIT_MANAGER = ""
+IMAGE_INITSCRIPTS = ""
+IMAGE_DEV_MANAGER = ""
+
+FEED_DEPLOYDIR_BASE_URI = ""
+ONLINE_PACKAGE_MANAGEMENT = "none"
+
+inherit image
diff --git a/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb b/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
new file mode 100644
index 0000000..d8e92ca
--- /dev/null
+++ b/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
@@ -0,0 +1,3 @@
+require initramfs-kexecboot-image.bb
+
+IMAGE_INSTALL = "kexecboot-klibc"
-- 
1.7.6.1



