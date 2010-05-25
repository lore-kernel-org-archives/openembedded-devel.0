Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OGuII-0000cG-Vf
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 15:35:44 +0200
Received: by fxm9 with SMTP id 9so1099622fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 May 2010 06:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Lf6pFf9FCKe/uwgJEw/YDges3OvHFiei9gZ7RiYATT8=;
	b=FHoZnE51phng6hv1x1eEmxCqsUEP5pPu3gCoJ4o301uYA+O0RwrFCjbeyAz/xfhjPW
	MCHSoLmOxJ7Y3OyYidJ0zyF7n5X5s0BV1RgcH1B6bDVK2wC1ZMINaPhbazJxJ6DnWkaD
	NcMWc+BlCZWnB/qg/t8deiDyA+Pra4kS96c6M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=BHwmaaWRAI9MUnnVCELJ6/X9m1keBDBxeB2L/oR6CohHTyzroP28znLusksJBsk9cE
	dysKkUre43Y+jlBlyIzWPgJueQsYY0s6ZhsRlg58KaePGIxme11xfQj+FDDA3u7OcPgj
	lc/iFmlaMzQy3WOF4Ygwbt4JKP1TsAFhXkC/U=
Received: by 10.223.92.152 with SMTP id r24mr6225751fam.74.1274794296070;
	Tue, 25 May 2010 06:31:36 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u12sm24844525fah.4.2010.05.25.06.31.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 May 2010 06:31:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 May 2010 15:30:24 +0200
Message-Id: <1274794225-16222-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1274794225-16222-1-git-send-email-Martin.Jansa@gmail.com>
References: <1274794225-16222-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/3] linux-openmoko: remove linux-openmoko-devel as it will be merged with linux-openmoko-shr-devel to linux-openmoko_2.6.29
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
X-List-Received-Date: Tue, 25 May 2010 13:35:44 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../linux/linux-openmoko-devel/defconfig-oe.patch  |   12 -------
 recipes/linux/linux-openmoko-devel_git.bb          |   34 --------------------
 2 files changed, 0 insertions(+), 46 deletions(-)
 delete mode 100644 recipes/linux/linux-openmoko-devel/defconfig-oe.patch
 delete mode 100644 recipes/linux/linux-openmoko-devel_git.bb

diff --git a/recipes/linux/linux-openmoko-devel/defconfig-oe.patch b/recipes/linux/linux-openmoko-devel/defconfig-oe.patch
deleted file mode 100644
index 3f65387..0000000
--- a/recipes/linux/linux-openmoko-devel/defconfig-oe.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- gta02-packaging-defconfig	2009-01-12 13:09:33.000000000 +0000
-+++ defconfig-oe	2009-01-12 13:18:23.000000000 +0000
-@@ -337,9 +337,6 @@
- #
- # At least one emulation must be selected
- #
--CONFIG_FPE_NWFPE=y
--# CONFIG_FPE_NWFPE_XP is not set
--# CONFIG_FPE_FASTFPE is not set
- 
- #
- # Userspace binary formats
diff --git a/recipes/linux/linux-openmoko-devel_git.bb b/recipes/linux/linux-openmoko-devel_git.bb
deleted file mode 100644
index 9d4aa22..0000000
--- a/recipes/linux/linux-openmoko-devel_git.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-require linux.inc
-require linux-openmoko.inc
-
-DEFAULT_PREFERENCE = "-1"
-
-KERNEL_RELEASE = "2.6.29"
-KERNEL_VERSION = "${KERNEL_RELEASE}"
-
-SRCREV = "a15608f241a40b41fed5bffe511355c2067c4e88"
-OEV = "oe1"
-PV = "${KERNEL_RELEASE}-${OEV}+gitr${SRCPV}"
-PR = "r2"
-
-SRC_URI = "\
-  git://git.openmoko.org/git/kernel.git;protocol=git;branch=andy-tracking \
-"
-S = "${WORKDIR}/git"
-
-CONFIG_NAME_om-gta01 = "gta01_moredrivers_defconfig"
-CONFIG_NAME_om-gta02 = "gta02_packaging_defconfig"
-
-do_configure_prepend() {
-
-        # Rename getline in ./scripts/unifdef.c
-        # Kernels up to 2.6.29 are currently failing to build unifdef.c,
-        # clashing with exposed getline() from <stdio.h>
-        # see https://patchwork.kernel.org/patch/11166/
-        # committed in 2.6.29 (commit d15bd1067b1fcb2b7250d22bc0c7c7fea0b759f7)
-
-        sed -i -e 's/getline/parseline/g' ${S}/scripts/unifdef.c
-
-	install -m 644 ./arch/arm/configs/${CONFIG_NAME} ${WORKDIR}/defconfig-oe
-	cat ${WORKDIR}/defconfig-oe.patch | patch -p0 -d ${WORKDIR}
-}
-- 
1.7.1



