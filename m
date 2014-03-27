Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 813306F8E8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 09:46:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2R9krtR017797
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 02:46:53 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 27 Mar 2014 02:46:53 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Mar 2014 17:52:55 +0800
Message-ID: <1395913975-24059-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [meta-networking] [PATCH] quagga: work with new readline
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
X-List-Received-Date: Thu, 27 Mar 2014 09:46:54 -0000
Content-Type: text/plain

The Function and CPPFunction had been removed by in readline 6.3, use
the new functions to replace them.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../quagga/files/work-with-new-readline.patch      | 34 ++++++++++++++++++++++
 .../recipes-protocols/quagga/quagga_0.99.21.bb     |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/quagga/files/work-with-new-readline.patch

diff --git a/meta-networking/recipes-protocols/quagga/files/work-with-new-readline.patch b/meta-networking/recipes-protocols/quagga/files/work-with-new-readline.patch
new file mode 100644
index 0000000..2bd333a
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/work-with-new-readline.patch
@@ -0,0 +1,34 @@
+From 66df315d2a270a254c613a4d2e72c0ea47f15a71 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 27 Mar 2014 09:35:29 +0000
+Subject: [PATCH] vtysh/vtysh.c: works with new readline
+
+The Function and CPPFunction had been removed by in readline 6.3, use
+the new functions to replace them.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ vtysh/vtysh.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/vtysh/vtysh.c b/vtysh/vtysh.c
+index 431c08e..fdd82fb 100644
+--- a/vtysh/vtysh.c
++++ b/vtysh/vtysh.c
+@@ -2212,9 +2212,9 @@ void
+ vtysh_readline_init (void)
+ {
+   /* readline related settings. */
+-  rl_bind_key ('?', (Function *) vtysh_rl_describe);
++  rl_bind_key ('?', (rl_command_func_t *) vtysh_rl_describe);
+   rl_completion_entry_function = vtysh_completion_entry_function;
+-  rl_attempted_completion_function = (CPPFunction *)new_completion;
++  rl_attempted_completion_function = (rl_completion_func_t *)new_completion;
+   /* do not append space after completion. It will be appended
+    * in new_completion() function explicitly. */
+   rl_completion_append_character = '\0';
+-- 
+1.8.3.4
+
diff --git a/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb b/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
index db2a67b..0988b70 100644
--- a/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
+++ b/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://0001-doc-fix-makeinfo-errors-and-one-warning.patch \
             file://lingering-IP-address-after-deletion-BZ-486.patch \
             file://build-fix-extract.pl-for-cross-compilation.patch \
             file://babel-close-the-stdout-stderr-as-in-other-daemons.patch \
+            file://work-with-new-readline.patch \
 "
 
 SRC_URI[quagga-0.99.21.md5sum] = "99840adbe57047c90dfba6b6ed9aec7f"
-- 
1.8.3.1


