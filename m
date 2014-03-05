Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 891006EA1C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Mar 2014 00:04:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Mar 2014 15:59:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,589,1389772800"; d="scan'208";a="494146807"
Received: from garethcl-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.79])
	by orsmga002.jf.intel.com with ESMTP; 04 Mar 2014 16:03:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Mar 2014 00:03:41 +0000
Message-Id: <1393977821-27278-2-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1393977821-27278-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1393977821-27278-1-git-send-email-paul.eggleton@linux.intel.com>
Subject: [meta-handheld][PATCH 2/2] zaurusd: enable support for collie
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
X-List-Received-Date: Wed, 05 Mar 2014 00:04:08 -0000

From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../0001-zaurusd-add-support-for-collie.patch      | 50 ++++++++++++++++++++++
 recipes-bsp/zaurusd/zaurusd_git.bb                 |  3 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 recipes-bsp/zaurusd/zaurusd/0001-zaurusd-add-support-for-collie.patch

diff --git a/recipes-bsp/zaurusd/zaurusd/0001-zaurusd-add-support-for-collie.patch b/recipes-bsp/zaurusd/zaurusd/0001-zaurusd-add-support-for-collie.patch
new file mode 100644
index 0000000..36ded13
--- /dev/null
+++ b/recipes-bsp/zaurusd/zaurusd/0001-zaurusd-add-support-for-collie.patch
@@ -0,0 +1,50 @@
+From 85b94bed1feab70bc529a59fb80c26da825b9abe Mon Sep 17 00:00:00 2001
+From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+Date: Fri, 5 Aug 2011 16:00:10 +0400
+Subject: [PATCH] zaurusd: add support for collie
+Upstream-Status: Pending
+
+Note: alsa mixer support is disabled, as collie doesn't support sound (yet).
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+---
+ config/mach-config/mach-collie-functions |    4 ++++
+ config/mach-config/mach-collie-vars.in   |    3 +++
+ configure.ac                             |    1 +
+ 3 files changed, 8 insertions(+), 0 deletions(-)
+ create mode 100644 config/mach-config/mach-collie-functions
+ create mode 100644 config/mach-config/mach-collie-vars.in
+
+diff --git a/config/mach-config/mach-collie-functions b/config/mach-config/mach-collie-functions
+new file mode 100644
+index 0000000..4d77c53
+--- /dev/null
++++ b/config/mach-config/mach-collie-functions
+@@ -0,0 +1,4 @@
++HAVE_INPUT_SWITCHES=0
++HAVE_TSKEYS=0
++HAVE_ALSA_MIXER=0
++
+diff --git a/config/mach-config/mach-collie-vars.in b/config/mach-config/mach-collie-vars.in
+new file mode 100644
+index 0000000..ec1bfb8
+--- /dev/null
++++ b/config/mach-config/mach-collie-vars.in
+@@ -0,0 +1,3 @@
++MACHINE=collie
++
++ALSA_MIXER_INIT=@appconfdir@/alsa/5500-default.state
+diff --git a/configure.ac b/configure.ac
+index 78ea2ae..5160fab 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -65,6 +65,7 @@ AC_CONFIG_FILES([
+   config/config
+   config/mach-config/mach-akita-vars
+   config/mach-config/mach-borzoi-vars
++  config/mach-config/mach-collie-vars
+   config/mach-config/mach-corgi-vars
+   config/mach-config/mach-husky-vars
+   config/mach-config/mach-poodle-vars
+--
+1.7.2.5
diff --git a/recipes-bsp/zaurusd/zaurusd_git.bb b/recipes-bsp/zaurusd/zaurusd_git.bb
index 468b8f2..9eb8b1a 100644
--- a/recipes-bsp/zaurusd/zaurusd_git.bb
+++ b/recipes-bsp/zaurusd/zaurusd_git.bb
@@ -22,7 +22,8 @@ SRC_URI = "git://git.yoctoproject.org/${BPN} \
            file://zaurus-hinge.bl-off \
            file://01-check-toggle-landscape \
            file://01-check-toggle-portait \
-           file://use-ts-symlink-instead-of-hardcoding.diff "
+           file://use-ts-symlink-instead-of-hardcoding.diff \
+           file://0001-zaurusd-add-support-for-collie.patch"
 
 
 S = "${WORKDIR}/git"
-- 
1.8.5.3


