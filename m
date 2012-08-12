Received: from mail-wg0-f49.google.com ([74.125.82.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1T0fmA-0003GF-RO
	for openembedded-devel@lists.linuxtogo.org;
	Sun, 12 Aug 2012 23:32:46 +0200
Received: by wgbez12 with SMTP id ez12so2805894wgb.6
	for <openembedded-devel@lists.linuxtogo.org>;
	Sun, 12 Aug 2012 14:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=xQnPdqkImy0D0HHkZnWbDruAHp2m5YDYOLzXtm4/TDE=;
	b=t/UeQT/fuZvsGUQ2jYm/nGnGPRGzVGACKFpUIerZJyNMHWA9Rc5CpPEd4EXfJL7TjO
	qEmSNe/szSbjpkIeyYGdU5eSqfOVjNseYyLImXlfAFV/73LxsU09yua52vYyKB5F8v7S
	dZFc6e+UnkemvW1pvyiFCcMWIUt7caEd+B/vy6Pl4rEexpBRGGvGOTeW2cysAW9a1hgm
	Iw3iUzj1CYVdmTV0+ZvvoZIVSg6MLnuGjcMZqkaib8BqJ1+VYDEIRBIykqd3UbBRXl0N
	Z62oq1SswIbliYGGqkJIejzzQb5wmSV72gXynwmmESDI0ODvvBrMndP/aIYL85SWMlGa
	1RwQ==
Received: by 10.180.94.164 with SMTP id dd4mr13009576wib.1.1344806454223;
	Sun, 12 Aug 2012 14:20:54 -0700 (PDT)
Received: from mizar.localdomain
	(host84-251-dynamic.9-87-r.retail.telecomitalia.it. [87.9.251.84])
	by mx.google.com with ESMTPS id t8sm12784327wiy.3.2012.08.12.14.20.52
	(version=SSLv3 cipher=OTHER); Sun, 12 Aug 2012 14:20:53 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.linuxtogo.org
Date: Sun, 12 Aug 2012 23:20:49 +0200
Message-Id: <1344806449-16934-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][meta-initramfs][PATCH] initramfs-kexecboot-image: fix dependency chain was: ['ubiattach']
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
X-List-Received-Date: Sun, 12 Aug 2012 21:32:46 -0000

* unfortunately there is no package-split for the mtd-utils recipe
* to have ubiattach we need to install the full package
* (or use ubiattach-klibc)

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../images/initramfs-kexecboot-image.bb            |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
index 2368699..33ceca4 100644
--- a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
@@ -9,7 +9,9 @@ IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 # avoid circular dependencies
 EXTRA_IMAGEDEPENDS = ""
 
-IMAGE_INSTALL = "kexec kexecboot ubiattach"
+# for ubiattach we have to install full mtd-utils (>700KiB)
+# or use ubiattach-klibc instead
+IMAGE_INSTALL = "kexec kexecboot mtd-utils"
 
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
-- 
1.7.8.6



