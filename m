Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9718A7680D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2015 07:43:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8E7hCHv011397
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2015 00:43:12 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 14 Sep 2015 00:43:11 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Sep 2015 15:37:28 +0800
Message-ID: <1442216248-8695-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] net-snmp: make it be able to be compiled by gcc5 with "-O0"
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
X-List-Received-Date: Mon, 14 Sep 2015 07:43:13 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...-functions-work-with-both-gnu11-and-gnu89.patch | 85 ++++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get-inline-functions-work-with-both-gnu11-and-gnu89.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get-inline-functions-work-with-both-gnu11-and-gnu89.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get-inline-functions-work-with-both-gnu11-and-gnu89.patch
new file mode 100644
index 0000000..2d7ba57
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get-inline-functions-work-with-both-gnu11-and-gnu89.patch
@@ -0,0 +1,85 @@
+From 6f319d981ee190c7e858a4b0382617c469cfa77a Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Mon, 14 Sep 2015 13:52:12 +0800
+Subject: [PATCH] get inline functions work with both gnu11 and gnu89
+
+Upstream-status: Pending
+
+After gcc upgraded to gcc5, and if the codes are compiled without optimization(-O0),
+and the below error will happen:
+
+./.libs/libnetsnmpagent.so: undefined reference to `netsnmp_subtree_change_prev'
+./.libs/libnetsnmpagent.so: undefined reference to `netsnmp_table_dataset_delete_data'
+./.libs/libnetsnmpagent.so: undefined reference to `netsnmp_subtree_change_next'
+collect2: error: ld returned 1 exit status
+
+gcc5 defaults to -std=gnu11 instead of -std=gnu89, and it requires that exactly one C
+source file has the callable copy of the inline function. Consider the following
+program:
+
+  inline int
+  foo (void)
+  {
+    return 42;
+  }
+
+  int
+  main (void)
+  {
+    return foo ();
+  }
+
+The program above will not link with the C99 inline semantics, because no out-of-line
+function foo is generated. To fix this, either mark the function foo as static, or
+add the following declaration:
+  static inline int foo (void);
+
+more information refer to: https://gcc.gnu.org/gcc-5/porting_to.html;
+
+but the use of "extern inline" will lead to the compilation issue if gcc is not
+gcc5, so replace inline with "static inline"
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ agent/agent_registry.c        | 4 ++--
+ agent/helpers/table_dataset.c | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/agent/agent_registry.c b/agent/agent_registry.c
+index 1e2482a..3f0aa12 100644
+--- a/agent/agent_registry.c
++++ b/agent/agent_registry.c
+@@ -528,7 +528,7 @@ netsnmp_subtree_deepcopy(netsnmp_subtree *a)
+ /** @private
+  *  Replaces next subtree pointer in given subtree.
+  */
+-NETSNMP_INLINE void
++NETSNMP_STATIC_INLINE void
+ netsnmp_subtree_change_next(netsnmp_subtree *ptr, netsnmp_subtree *thenext)
+ {
+     ptr->next = thenext;
+@@ -543,7 +543,7 @@ netsnmp_subtree_change_next(netsnmp_subtree *ptr, netsnmp_subtree *thenext)
+ /** @private
+  *  Replaces previous subtree pointer in given subtree.
+  */
+-NETSNMP_INLINE void
++NETSNMP_STATIC_INLINE void
+ netsnmp_subtree_change_prev(netsnmp_subtree *ptr, netsnmp_subtree *theprev)
+ {
+     ptr->prev = theprev;
+diff --git a/agent/helpers/table_dataset.c b/agent/helpers/table_dataset.c
+index 0949a8a..d993993 100644
+--- a/agent/helpers/table_dataset.c
++++ b/agent/helpers/table_dataset.c
+@@ -107,7 +107,7 @@ netsnmp_init_table_dataset(void) {
+ /** deletes a single dataset table data.
+  *  returns the (possibly still good) next pointer of the deleted data object.
+  */
+-NETSNMP_INLINE netsnmp_table_data_set_storage *
++NETSNMP_STATIC_INLINE netsnmp_table_data_set_storage *
+ netsnmp_table_dataset_delete_data(netsnmp_table_data_set_storage *data)
+ {
+     netsnmp_table_data_set_storage *nextPtr = NULL;
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
index 464473e..f3fa3ba 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
@@ -23,6 +23,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
         file://0001-Fix-CVE-2014-2285.patch \
         file://dont-return-incompletely-parsed-varbinds.patch \
         file://net-snmp-5.7.2-fix-mib-timeout-values.patch \
+        file://0001-get-inline-functions-work-with-both-gnu11-and-gnu89.patch \
 "
 
 SRC_URI[md5sum] = "a2c83518648b0f2a5d378625e45c0e18"
-- 
1.9.1


