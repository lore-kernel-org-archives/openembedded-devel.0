Received: from [67.18.134.219] (helo=compulab.co.il)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mike@compulab.co.il>) id 1MlcPQ-0001b4-IS
	for openembedded-devel@openembedded.org; Thu, 10 Sep 2009 07:41:31 +0200
Received: from mail.linux-boards.com ([192.114.83.142]
	helo=zimbra-mta.compulab.co.il)
	by compulab.site5.com with esmtp (Exim 4.69)
	(envelope-from <mike@compulab.co.il>) id 1MlcOy-0003cb-5i
	for openembedded-devel@openembedded.org; Thu, 10 Sep 2009 00:41:00 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra-mta.compulab.co.il (Postfix) with ESMTP id 2A6B69A034F
	for <openembedded-devel@openembedded.org>;
	Thu, 10 Sep 2009 08:40:59 +0300 (IDT)
X-Virus-Scanned: amavisd-new at compulab.co.il
Received: from zimbra-mta.compulab.co.il ([127.0.0.1])
	by localhost (zimbra-mta.compulab.co.il [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id kxEAn9BPLmwX; Thu, 10 Sep 2009 08:40:58 +0300 (IDT)
Received: from droid.compulab.local (droid.compulab.local [10.1.1.77])
	by zimbra-mta.compulab.co.il (Postfix) with ESMTP id 8B07D9A0349;
	Thu, 10 Sep 2009 08:40:58 +0300 (IDT)
Received: from droid.compulab.local (localhost [127.0.0.1])
	by droid.compulab.local (8.14.0/8.14.0) with ESMTP id n8A5d581005553;
	Thu, 10 Sep 2009 08:39:05 +0300
Received: (from mike@localhost)
	by droid.compulab.local (8.14.0/8.14.0/Submit) id n8A5d4kZ005552;
	Thu, 10 Sep 2009 08:39:04 +0300
X-Authentication-Warning: droid.compulab.local: mike set sender to
	mike@compulab.co.il using -f
From: Mike Rapoport <mike@compulab.co.il>
To: openembedded-devel@openembedded.org
Date: Thu, 10 Sep 2009 08:39:04 +0300
Message-Id: <1252561144-5528-1-git-send-email-mike@compulab.co.il>
X-Mailer: git-send-email 1.6.0.6
X-ACL-Warn: {
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - compulab.site5.com
X-AntiAbuse: Original Domain - openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - compulab.co.il
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 67.18.134.219
X-SA-Exim-Mail-From: mike@compulab.co.il
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] omap3-sgx-modules: fix proc related build errors
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
X-List-Received-Date: Thu, 10 Sep 2009 05:41:32 -0000

Signed-off-by: Mike Rapoport <mike@compulab.co.il>
---
 .../fix-proc-compile-errors.patch                  |   36 ++++++++++++++++++++
 .../omap3-sgx-modules_1.3.13.1607.bb               |    1 +
 2 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 recipes/powervr-drivers/omap3-sgx-modules/fix-proc-compile-errors.patch

diff --git a/recipes/powervr-drivers/omap3-sgx-modules/fix-proc-compile-errors.patch b/recipes/powervr-drivers/omap3-sgx-modules/fix-proc-compile-errors.patch
new file mode 100644
index 0000000..890dc67
--- /dev/null
+++ b/recipes/powervr-drivers/omap3-sgx-modules/fix-proc-compile-errors.patch
@@ -0,0 +1,36 @@
+From af0a5882ad56d484c94555940c7987ad1a50930f Mon Sep 17 00:00:00 2001
+From: Mike Rapoport <mike@compulab.co.il>
+Date: Wed, 9 Sep 2009 18:09:04 +0300
+Subject: [PATCH] Fix proc compile errors
+
+---
+ services4/srvkm/env/linux/proc.c |    3 ---
+ 1 files changed, 0 insertions(+), 3 deletions(-)
+ mode change 100755 => 100644 services4/srvkm/env/linux/proc.c
+
+diff --git a/services4/srvkm/env/linux/proc.c b/services4/srvkm/env/linux/proc.c
+old mode 100755
+new mode 100644
+index 274c35f..8470f5a
+--- a/services4/srvkm/env/linux/proc.c
++++ b/services4/srvkm/env/linux/proc.c
+@@ -134,7 +134,6 @@ int CreateProcEntry(const char * name, read_proc_t rhandler, write_proc_t whandl
+ 
+     if (file)
+     {
+-        file->owner = THIS_MODULE;
+ 		file->read_proc = rhandler;
+ 		file->write_proc = whandler;
+ 		file->data = data;
+@@ -165,8 +164,6 @@ int CreateProcReadEntry(const char * name, pvr_read_proc_t handler)
+ 
+     if (file)
+     {
+-        file->owner = THIS_MODULE;
+-
+         return 0;
+     }
+ 
+-- 
+1.6.0.6
+
diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1607.bb b/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1607.bb
index 8e4d2a2..527ef2c 100644
--- a/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1607.bb
+++ b/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1607.bb
@@ -7,6 +7,7 @@ SRC_URI = "file://omap3-sgx-modules-${PV}.tar.bz2 \
            file://0002-Compile-fixes-for-DSS2.patch;patch=1 \
            file://rotation-dss2.patch;patch=1 \
            file://build_es3.x_sgx.patch;patch=1 \
+	   file://fix-proc-compile-errors.patch;patch=1 \
 "
 
 PVRBUILD = "release"
-- 
1.6.0.6



