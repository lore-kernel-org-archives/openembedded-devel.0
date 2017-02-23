Return-Path: <amarnath.valluri@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2418672FD9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 09:09:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Feb 2017 01:09:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,197,1484035200"; d="scan'208";a="937176348"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2017 01:09:28 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 11:05:35 +0200
Message-Id: <1487840743-23198-2-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487840743-23198-1-git-send-email-amarnath.valluri@intel.com>
References: <1487840743-23198-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH 1/9] aufs-utils: Replace install paths with appropriate bitbake environment
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
X-List-Received-Date: Thu, 23 Feb 2017 09:09:28 -0000

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


