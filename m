Return-Path: <amarnath.valluri@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7C4EB72FE4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 09:09:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Feb 2017 01:09:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,197,1484035200"; d="scan'208";a="937176369"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2017 01:09:32 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 11:05:38 +0200
Message-Id: <1487840743-23198-5-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487840743-23198-1-git-send-email-amarnath.valluri@intel.com>
References: <1487840743-23198-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH 4/9] netcf_git: Check if src != dst while moving files.
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
X-List-Received-Date: Thu, 23 Feb 2017 09:09:31 -0000

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


