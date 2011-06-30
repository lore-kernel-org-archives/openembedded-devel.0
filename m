Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1QcHXS-0001c0-Eg
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jun 2011 15:44:15 +0200
Received: by yib18 with SMTP id 18so934317yib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2011 06:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=p/z0Q9FkG9EVqjgmjJ+mAC5fUbP51LB8k6UyNjEPnqM=;
	b=xGiaRaLuJTqNwBmtG3M0ZHfznje8asmys3z07v9Wt9uP/TNkhYJscfueKeUvHdVs/a
	fPGnKo8t2AhrGQORdpJiYZaxhrZn1R5xtmV4tgFOYTimXwDBwrez+K4DBrhN1Mvj6VbN
	UqUhcLvrvv+vD27/SfbTnvroTNd6BkMq8yTMM=
Received: by 10.236.170.169 with SMTP id p29mr2601502yhl.213.1309441228101;
	Thu, 30 Jun 2011 06:40:28 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id v4sm1637241yhm.76.2011.06.30.06.40.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 06:40:27 -0700 (PDT)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Jun 2011 08:38:08 -0500
Message-Id: <1309441088-15753-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH v3 1/1] am-benchmarks: Remove platform dependencies
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
X-List-Received-Date: Thu, 30 Jun 2011 13:44:15 -0000

* Remove platform dependencies and use architecture dependencies instead
* Use OE BASE_PACKAGE_ARCH to determine architecture
* Update the SRCREV to revision 66
* Update the recipe revision to 1.3
* Removed INSANE_SKIP
NOTE - architecture dependency can be removed once CFLAGS can be passed into CCSv5 project makefile

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
Update in version 3:
  Fix "sed" commands to apply to all dhrystone projects
---
 .../{am-benchmarks_1.2.bb => am-benchmarks_1.3.bb} |   27 ++++++++++---------
 1 files changed, 14 insertions(+), 13 deletions(-)
 copy recipes/ti/{am-benchmarks_1.2.bb => am-benchmarks_1.3.bb} (61%)

diff --git a/recipes/ti/am-benchmarks_1.2.bb b/recipes/ti/am-benchmarks_1.3.bb
similarity index 61%
copy from recipes/ti/am-benchmarks_1.2.bb
copy to recipes/ti/am-benchmarks_1.3.bb
index 21e62a7..6070fe8 100644
--- a/recipes/ti/am-benchmarks_1.2.bb
+++ b/recipes/ti/am-benchmarks_1.3.bb
@@ -8,30 +8,31 @@ LICENSE = "BSD"
 SECTION = "system"
 PRIORITY = "optional"
 
-SRCREV = "61"
+SRCREV = "66"
 PR = "r2+svnr${SRCPV}"
 
-COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x|ti814x)"
-
-ARCHITECTURE_dm365 = "arm9"
-ARCHITECTURE_omapl138 = "arm9"
-ARCHITECTURE_omap3 = "cortex-a8"
-ARCHITECTURE_ti816x = "cortex-a8"
-ARCHITECTURE_ti814x = "cortex-a8"
-
-INSANE_SKIP_${PN} = "True"
-
 SRC_URI = "svn://gforge.ti.com/svn/am_benchmarks/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-S = "${WORKDIR}/trunk/${ARCHITECTURE}"
+S = "${WORKDIR}/trunk"
+
+do_configure() {
+    # Find all the objects.mk files for the Release target
+    files=`find ${BASE_PACKAGE_ARCH} -name "objects.mk" | grep Release`
+    for f in $files
+    do
+        sed -i -e 's|LIBS :=|LIBS := ${LDFLAGS} |' $f
+    done
+}
 
 do_compile() {
 	# don't build debug version
 	touch debug
 	export CROSS_COMPILE=${TARGET_PREFIX}
-	make release
+	export ARCH=${BASE_PACKAGE_ARCH}
+	make release 
 }
 
 do_install() {
+	export ARCH=${BASE_PACKAGE_ARCH}
 	make DESTDIR=${D} install
 }
-- 
1.7.0.4



