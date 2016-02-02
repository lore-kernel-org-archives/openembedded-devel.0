Return-Path: <alexandru.but@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id A740F60745
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Feb 2016 17:40:03 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u12He3NG005243 for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Feb 2016 11:40:03 -0600
Received: from zdravan.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016020211400381-565379 ;
	Tue, 2 Feb 2016 11:40:03 -0600 
From: Alexandru But <alexandru.but@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 2 Feb 2016 19:40:02 +0200
Message-Id: <1454434802-29633-1-git-send-email-alexandru.but@ni.com>
X-Mailer: git-send-email 2.6.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/02/2016 11:40:03 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/02/2016 11:40:04 AM,
	Serialize complete at 02/02/2016 11:40:04 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-02_11:, , signatures=0
Subject: [meta-oe][PATCH] efivar: nvme header was renamed in linux 4.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Feb 2016 17:40:03 -0000

nvme.h was renamed to nvme_ioctl.h in linux uapi headers since 4.4. Patch
taken from the gentoo repository.

Signed-off-by: Alexandru But <alexandru.but@ni.com>
---
 .../efivar/efivar/0.21-nvme_ioctl.h.patch          | 30 ++++++++++++++++++++++
 meta-oe/recipes-extended/efivar/efivar_0.21.bb     |  3 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/efivar/efivar/0.21-nvme_ioctl.h.patch

diff --git a/meta-oe/recipes-extended/efivar/efivar/0.21-nvme_ioctl.h.patch b/meta-oe/recipes-extended/efivar/efivar/0.21-nvme_ioctl.h.patch
new file mode 100644
index 0000000..221ec5a
--- /dev/null
+++ b/meta-oe/recipes-extended/efivar/efivar/0.21-nvme_ioctl.h.patch
@@ -0,0 +1,30 @@
+From ae0869b71a90bc14e67f3c917bd9c96db25c99a6 Mon Sep 17 00:00:00 2001
+From: Mike Gilbert <floppym@gentoo.org>
+Date: Thu, 14 Jan 2016 17:02:31 -0500
+Subject: [PATCH] Workaround rename of linux/nvme.h
+
+Bug: https://bugs.gentoo.org/571548
+---
+ src/linux.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/linux.c b/src/linux.c
+index 5ebc151..e551377 100644
+--- a/src/linux.c
++++ b/src/linux.c
+@@ -22,7 +22,12 @@
+ #include <inttypes.h>
+ #include <limits.h>
+ #include <linux/ethtool.h>
++#include <linux/version.h>
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 4, 0)
++#include <linux/nvme_ioctl.h>
++#else
+ #include <linux/nvme.h>
++#endif
+ #include <linux/sockios.h>
+ #include <net/if.h>
+ #include <scsi/scsi.h>
+-- 
+2.7.0
+
diff --git a/meta-oe/recipes-extended/efivar/efivar_0.21.bb b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
index 1684a10..3c34a7b 100644
--- a/meta-oe/recipes-extended/efivar/efivar_0.21.bb
+++ b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
@@ -9,7 +9,8 @@ DEPENDS_class-target = "popt efivar-native"
 
 SRCREV = "aab6c2a64d90b6e5a63661fb5bd6be8d878b0784"
 SRC_URI = "git://github.com/rhinstaller/efivar.git \
-           file://0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch"
+           file://0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch \
+           file://0.21-nvme_ioctl.h.patch"
 SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch"
 SRC_URI_append_class-native = " file://efivar-drop-options-not-supported-by-lower-version-gcc.patch"
 
-- 
2.6.1


