Return-Path: <amarnath.valluri@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6CB7C71C7B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 13:06:41 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Feb 2017 05:06:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="222792701"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by fmsmga004.fm.intel.com with ESMTP; 08 Feb 2017 05:06:27 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 15:07:15 +0200
Message-Id: <1486559235-22891-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe] openct: Replace /lib/udev with ${nonarch_base_libdir}/udev.
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
X-List-Received-Date: Wed, 08 Feb 2017 13:06:41 -0000

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta-oe/recipes-support/openct/openct_0.6.20.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb b/meta-oe/recipes-support/openct/openct_0.6.20.bb
index d4ad9c1..85ca851 100644
--- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
+++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
@@ -34,7 +34,7 @@ EXTRA_OECONF=" \
     --enable-pcsc \
     --enable-doc \
     --enable-api-doc \
-    --with-udev=/lib/udev \
+    --with-udev=${nonarch_base_libdir}/udev \
     --with-bundle=${libdir}/pcsc/drivers \
 "
 
@@ -42,7 +42,7 @@ inherit autotools pkgconfig
 
 FILES_${PN} += " \
     ${libdir}/ctapi \
-    /lib/udev \
+    ${nonarch_base_libdir}/udev \
     ${libdir}/openct-ifd.so \
     ${libdir}/pcsc \
     /run/openct/status \
@@ -62,7 +62,7 @@ do_install_append() {
 do_install () {
     rm -rf ${D}
     install -d ${D}/etc
-    install -dm 755 ${D}/lib/udev
+    install -dm 755 ${D}${nonarch_base_libdir}/udev
     # fix up hardcoded paths
     sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir}/,' \
         ${WORKDIR}/openct.service ${WORKDIR}/openct.init
-- 
2.7.4


