Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.45907.1590474495883476575
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 May 2020 23:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04Q6RbBn022045
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 25 May 2020 23:27:48 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Mon, 25 May 2020
 23:27:14 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] multipath-tools: fix compiling parallel issue
Date: Mon, 25 May 2020 23:27:14 -0700
Message-ID: <20200526062714.4000-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add explicit dependency on libraries
[snip]
gcc/i686-overc-linux/10.1.0/ld: cannot find -lmpathpersist
collect2: error: ld returned 1 exit status
Makefile:36: recipe for target 'multipathd' failed
make[1]: *** [multipathd] Error 1
make[1]: Leaving directory 'git/multipathd'
Makefile:29: recipe for target 'multipathd' failed
make: *** [multipathd] Error 2
ln -sf libmpathpersist.so.0 libmpathpersist.so
[snip]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...add-explicit-dependency-on-libraries.patch | 40 +++++++++++++++++++
 .../multipath-tools/multipath-tools_0.8.4.bb  |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-add-explicit-dependency-on-libraries.patch

diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-add-explicit-dependency-on-libraries.patch b/meta-oe/recipes-support/multipath-tools/files/0001-add-explicit-dependency-on-libraries.patch
new file mode 100644
index 000000000..2827bb874
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-add-explicit-dependency-on-libraries.patch
@@ -0,0 +1,40 @@
+From 04884263d1de8c427a7a15bd1cf6466ea65d3a0b Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 25 May 2020 23:22:55 -0700
+Subject: [PATCH] add explicit dependency on libraries
+
+[snip]
+gcc/i686-overc-linux/10.1.0/ld: cannot find -lmpathpersist
+collect2: error: ld returned 1 exit status
+Makefile:36: recipe for target 'multipathd' failed
+make[1]: *** [multipathd] Error 1
+make[1]: Leaving directory 'git/multipathd'
+Makefile:29: recipe for target 'multipathd' failed
+make: *** [multipathd] Error 2
+ln -sf libmpathpersist.so.0 libmpathpersist.so
+[snip]
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index bea0a0b2..37a77129 100644
+--- a/Makefile
++++ b/Makefile
+@@ -29,7 +29,8 @@ $(BUILDDIRS):
+ 	$(MAKE) -C $@
+ 
+ multipath multipathd mpathpersist libmpathpersist : libmultipath
+-mpathpersist:  libmpathpersist
++mpathpersist multipathd:  libmpathpersist
++libdmmp libmultipath mpathpersist multipath multipathd: libmpathcmd
+ 
+ DEPS_ON_MULTIPATH := \
+ 	multipath \
+-- 
+2.21.0
+
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index 2795a8d09..af34a4b39 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -44,6 +44,7 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
            file://0030-Always-use-devmapper.patch \
            file://0031-Always-use-devmapper-for-kpartx.patch \
            file://0001-fix-bug-of-do_compile-and-do_install.patch \
+           file://0001-add-explicit-dependency-on-libraries.patch \
            "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-- 
2.21.0

