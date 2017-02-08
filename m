Return-Path: <amarnath.valluri@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AF22860621
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 13:21:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 08 Feb 2017 05:21:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="41467153"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga002.jf.intel.com with ESMTP; 08 Feb 2017 05:21:03 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 15:17:45 +0200
Message-Id: <1486559865-23488-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-filesystem] aufs-utils: Replace install paths with appropriate bitbake environment
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
X-List-Received-Date: Wed, 08 Feb 2017 13:21:05 -0000

autf-utils Makefile is using hardcoded /bin, /sbin paths, instead we should
respect the bitbake environment. This change makes the recipe portable to
environments where ${base_bindir} != /bin or ${base_sbindir} != /sbin.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
index 8980980..3d59e50 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
@@ -18,6 +18,13 @@ PV = "3.14+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
+do_configure_prepend() {
+   # Replace sbin,bin paths with bitbake environment
+   sed -i -e 's;install_sbin: Tgt = ${DESTDIR}/sbin;install_sbin: Tgt = ${DESTDIR}/${base_sbindir};' \
+          -e 's;install_ubin: Tgt = ${DESTDIR}/usr/sbin;install_sbin: Tgt = ${DESTDIR}/${bindir};' \
+	  ${S}/Makefile
+}
+
 do_configure_append () {
     install -d ${S}/include/linux/
     cp ${WORKDIR}/aufs_type.h ${S}/include/linux/
-- 
2.7.4


