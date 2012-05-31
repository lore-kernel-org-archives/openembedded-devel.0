Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Sa0Gp-0005BL-FK
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 May 2012 09:58:11 +0200
Received: by wgbds1 with SMTP id ds1so3748068wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2012 00:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=qBxCwfj/gExadDlopqngkGdgF/6TW1CCW2KBhVCp308=;
	b=djy/0n6gb2DAyDRllks4m7XiACyq2hPQK5PbrBIghl6/B9aZE96B1HkI6/aaNd0DP/
	aIqwOVs7vts0asP8hR4ZSgCa+yAT5FG+uVr9+5Ta4kaPki0jntTB4j0HiDvzJVCgQceY
	tgSTXndev4pIE3JmCjWDyNGB+K2wHAmOlScgJLIaCovYxcgpPCfalUWoVJ6HaAy+aN6K
	OB45Pv5SeUuReL9En/fyc4jJAmoSWyOA1pjbHKNvAsQ+xLU9+uTjps4GqoUZDpgHiwTe
	8AESzNZjGuUmHtR2Mwg7RC98cL//McdCofAL47vLYm1BXOiY8n2gUlE9Y9uzECx9QvcO
	LqjA==
Received: by 10.216.217.228 with SMTP id i78mr12772711wep.126.1338450471114;
	Thu, 31 May 2012 00:47:51 -0700 (PDT)
Received: from localhost.localdomain
	(197.Red-79-150-15.dynamicIP.rima-tde.net. [79.150.15.197])
	by mx.google.com with ESMTPS id gv7sm2265377wib.4.2012.05.31.00.47.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 00:47:50 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 May 2012 09:47:49 +0200
Message-Id: <1338450469-22322-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-xilinx] util-linux_2.21.bbappend: Rename to util-linux_2.21.1.bbappend.
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
X-List-Received-Date: Thu, 31 May 2012 07:58:11 -0000

This commit renames util-linux_2.21.bbappend to util-linux_2.21.1.bbappend
to match the corresponding change in version to the
poky/meta/recipes-core/util-linux/util-linux_2.21.1.bb recipe.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 recipes-core/util-linux/util-linux_2.21.1.bbappend |    3 +++
 recipes-core/util-linux/util-linux_2.21.bbappend   |    3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)
 create mode 100644 recipes-core/util-linux/util-linux_2.21.1.bbappend
 delete mode 100644 recipes-core/util-linux/util-linux_2.21.bbappend

diff --git a/recipes-core/util-linux/util-linux_2.21.1.bbappend b/recipes-core/util-linux/util-linux_2.21.1.bbappend
new file mode 100644
index 0000000..5199eb2
--- /dev/null
+++ b/recipes-core/util-linux/util-linux_2.21.1.bbappend
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS := "${THISDIR}/${PN}"
+# Disable microblaze ncurses support
+EXTRA_OECONF_microblaze += " --without-ncurses "
diff --git a/recipes-core/util-linux/util-linux_2.21.bbappend b/recipes-core/util-linux/util-linux_2.21.bbappend
deleted file mode 100644
index 5199eb2..0000000
--- a/recipes-core/util-linux/util-linux_2.21.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-FILESEXTRAPATHS := "${THISDIR}/${PN}"
-# Disable microblaze ncurses support
-EXTRA_OECONF_microblaze += " --without-ncurses "
-- 
1.7.9.5



