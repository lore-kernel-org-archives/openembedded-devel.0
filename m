Return-Path: <amarnath.valluri@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 9983071C27
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 13:16:35 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 08 Feb 2017 05:16:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="818468695"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Feb 2017 05:16:34 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 15:17:16 +0200
Message-Id: <1486559836-23439-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking] inetutils: Move files only when src != dst.
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
X-List-Received-Date: Wed, 08 Feb 2017 13:16:37 -0000

While moving files from ${bindir} to ${base_bindir} check if both are same.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index a8c4025..c43aa64 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -58,14 +58,16 @@ do_configure_prepend () {
 }
 
 do_install_append () {
-    install -m 0755 -d ${D}${base_bindir}
     install -m 0755 -d ${D}${base_sbindir}
     install -m 0755 -d ${D}${sbindir}
     install -m 0755 -d ${D}${sysconfdir}/xinetd.d
-    mv ${D}${bindir}/ping* ${D}${base_bindir}/
+    if [ "${base_bindir}" != "${bindir}" ] ; then
+         install -m 0755 -d ${D}${base_bindir}
+         mv ${D}${bindir}/ping* ${D}${base_bindir}/
+         mv ${D}${bindir}/hostname ${D}${base_bindir}/
+    fi
     mv ${D}${bindir}/ifconfig ${D}${base_sbindir}/
     mv ${D}${libexecdir}/syslogd ${D}${base_sbindir}/
-    mv ${D}${bindir}/hostname ${D}${base_bindir}/
     mv ${D}${libexecdir}/tftpd ${D}${sbindir}/in.tftpd
     mv ${D}${libexecdir}/telnetd ${D}${sbindir}/in.telnetd
     mv ${D}${libexecdir}/rexecd ${D}${sbindir}/in.rexecd
-- 
2.7.4


