Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A9F1A6098F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 07:03:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5H740oT004491
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 00:04:00 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 17 Jun 2013 00:03:59 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Jun 2013 15:04:00 +0800
Message-ID: <1371452640-28576-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: Joe.macdonald@windriver.com
Subject: [PATCH meta-networking] arptables: fix the redefinition of 'arpt_get_target' error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Jun 2013 07:04:00 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../arptables-arpt-get-target-fix.patch            |   30 ++++++++++++++++++++
 .../recipes-support/arptables/arptables_0.0.3-4.bb |    1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-arpt-get-target-fix.patch

diff --git a/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-arpt-get-target-fix.patch b/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-arpt-get-target-fix.patch
new file mode 100644
index 0000000..3f5948b
--- /dev/null
+++ b/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-arpt-get-target-fix.patch
@@ -0,0 +1,30 @@
+arptables: fix the redefinition of 'arpt_get_target'
+    
+Upstream-Status: Pending
+
+This function is already defined as a static inline function in 
+include/linux/netfilter_arp/arp_tables.h, once GCC uses -O0, the
+inline will not work, and the redefinition error will happen
+
+Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
+Signed-off-by: Roy.Li <rongqing.li@windriver.com> 
+
+diff --git a/libarptc/libarptc_incl.c b/libarptc/libarptc_incl.c
+index 35736db..addd3f9 100644
+--- a/libarptc/libarptc_incl.c
++++ b/libarptc/libarptc_incl.c
+@@ -11,14 +11,6 @@
+ /* (C)1999 Paul ``Rusty'' Russell - Placed under the GNU GPL (See
+    COPYING for details). */
+ 
+-#ifndef __OPTIMIZE__
+-STRUCT_ENTRY_TARGET *
+-GET_TARGET(STRUCT_ENTRY *e)
+-{
+-	return (void *)e + e->target_offset;
+-}
+-#endif
+-
+ static int sockfd = -1;
+ static void *arptc_fn = NULL;
+ 
diff --git a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
index fe14b61..f3deaeb 100644
--- a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
+++ b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     ${SOURCEFORGE_MIRROR}/ebtables/arptables-v${PV}.tar.gz;name=arptables \
     file://arptables-compile-install.patch \
     file://arptables-init-busybox.patch \
+    file://arptables-arpt-get-target-fix.patch \
 "
 SRC_URI[arptables.md5sum] = "1d4ab05761f063b0751645d8f2b8f8e5"
 SRC_URI[arptables.sha256sum] = "e529fd465c67d69ad335299a043516e6b38cdcd337a5ed21718413e96073f928"
-- 
1.7.10.4


