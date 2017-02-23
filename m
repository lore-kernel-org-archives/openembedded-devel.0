Return-Path: <amarnath.valluri@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2741772FD9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 09:09:29 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Feb 2017 01:09:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,197,1484035200"; d="scan'208";a="937176352"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2017 01:09:29 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 11:05:36 +0200
Message-Id: <1487840743-23198-3-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487840743-23198-1-git-send-email-amarnath.valluri@intel.com>
References: <1487840743-23198-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH 2/9] inetutils: Move files only when src != dst.
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
X-List-Received-Date: Thu, 23 Feb 2017 09:09:29 -0000

While moving files from ${bindir} to ${base_bindir} check if both are same.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index e3f5aa3..fd5ff4d 100644
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


