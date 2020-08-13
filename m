Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.3183.1597347634727506626
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 12:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 07DJeXYP018560
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 12:40:33 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Thu, 13 Aug 2020
 12:40:15 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-networking][PATCH 1/1] aoetool: make builds reproducible
Date: Thu, 13 Aug 2020 12:40:15 -0700
Message-ID: <20200813194015.3412-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Strip host path infomation out of binaries by not suppressing
default CFLAGS.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../aoetools/aoetools/reproducible-build.patch       | 12 ++++++++++++
 .../recipes-support/aoetools/aoetools_36.bb          |  1 +
 2 files changed, 13 insertions(+)
 create mode 100644 meta-networking/recipes-support/aoetools/aoetools/reproducible-build.patch

diff --git a/meta-networking/recipes-support/aoetools/aoetools/reproducible-build.patch b/meta-networking/recipes-support/aoetools/aoetools/reproducible-build.patch
new file mode 100644
index 000000000..4939ab25c
--- /dev/null
+++ b/meta-networking/recipes-support/aoetools/aoetools/reproducible-build.patch
@@ -0,0 +1,12 @@
+--- a/Makefile
++++ b/Makefile
+@@ -40,7 +40,8 @@ NPERSHELF=16
+ CONF_SCRIPTS = aoe-discover aoe-interfaces aoe-mkshelf aoe-revalidate aoe-flush aoe-stat
+ PROGS = aoeping aoecfg aoe-sancheck
+ COMMANDS := ${CONF_SCRIPTS} aoe-mkdevs aoe-version coraid-update ${PROGS}
+-CFLAGS = -Wall -O -g
++# We could still override this on the command line.
++CFLAGS += -Wall -O -g
+ SANCHECKLIBS = -lpthread
+ 
+ AOE_PING_OBJ = aoeping.o linux.o
diff --git a/meta-networking/recipes-support/aoetools/aoetools_36.bb b/meta-networking/recipes-support/aoetools/aoetools_36.bb
index 9b73b442a..60f3dc9b2 100644
--- a/meta-networking/recipes-support/aoetools/aoetools_36.bb
+++ b/meta-networking/recipes-support/aoetools/aoetools_36.bb
@@ -13,6 +13,7 @@ RRECOMMENDS_${PN} = "kernel-module-aoe"
 SRC_URI = "http://sourceforge.net/projects/${BPN}/files/${BPN}/${BPN}-${PV}.tar.gz \
            file://aoe-stat-no-bashism.patch \
            file://makefile-add-ldflags.patch \
+           file://reproducible-build.patch \
         "
 SRC_URI[md5sum] = "bff30daa988a65f69d4448ce4726a6db"
 SRC_URI[sha256sum] = "fb5e2cd0de7644cc1ec04ee3aeb43211cf7445a0c19e13d6b3ed5a8fbdf215ff"
-- 
2.24.1

