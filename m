Return-Path: <amarnath.valluri@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 14AB960621
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 13:16:11 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 08 Feb 2017 05:16:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="1104645062"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by fmsmga001.fm.intel.com with ESMTP; 08 Feb 2017 05:16:05 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 15:16:51 +0200
Message-Id: <1486559811-23341-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking] netcf_git: Check if src != dst while moving files.
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
X-List-Received-Date: Wed, 08 Feb 2017 13:16:13 -0000

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta-networking/recipes-support/netcf/netcf_git.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-networking/recipes-support/netcf/netcf_git.bb
index ed713ac..4ffd3db 100644
--- a/meta-networking/recipes-support/netcf/netcf_git.bb
+++ b/meta-networking/recipes-support/netcf/netcf_git.bb
@@ -47,9 +47,11 @@ do_install_append() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
        install -d ${D}${systemd_unitdir}/system
        if [ -d "${D}${libdir}/systemd/system" ]; then
-           mv ${D}${libdir}/systemd/system/* ${D}${systemd_unitdir}/system/
-           rm -rf ${D}${libdir}/systemd/
-       else
+           if [ "${systemd_unitdir}" != "${libdir}/systemd" ] ; then 
+               mv ${D}${libdir}/systemd/system/* ${D}${systemd_unitdir}/system/
+               rm -rf ${D}${libdir}/systemd/
+	   fi
+       elif [ "${systemd_unitdir}" != "${nonarch_libdir}/systemd" ] ; then 
            mv ${D}${nonarch_libdir}/systemd/system/* ${D}${systemd_unitdir}/system/
            rm -rf ${D}${nonarch_libdir}/systemd/
        fi
-- 
2.7.4


