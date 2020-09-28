Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.26478.1601255180174233968
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2020 18:06:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: ovvxb7lwiiDI3TNuM/5dpFrbXJbpbiO967q/UXhrVPsZMdaMQbq9xy80ChJG9gJiSN+gDkLaKQ
 KByf/4PcadCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9757"; a="246664913"
X-IronPort-AV: E=Sophos;i="5.77,312,1596524400"; 
   d="scan'208";a="246664913"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2020 18:06:18 -0700
IronPort-SDR: ez9PfeGXGeZCjpSZJeGG7yeJLS6TjsQujP0irveIyLQioWx9nO+ybYlRnROz6HBD5vWm41xT1i
 oCYzo+vxO8Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,312,1596524400"; 
   d="scan'208";a="344671537"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga002.fm.intel.com with ESMTP; 27 Sep 2020 18:06:18 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] libgphoto2: improve reproducibility
Date: Mon, 28 Sep 2020 09:06:17 +0800
Message-Id: <20200928010617.3050-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

remove WORKDIR information from config to improve reproducibility.
libgphoto2_port recheck config during compile will set the WORKDIR
info again, so remove this steps after configure.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.25.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.25.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.25.bb
index 8daf737a5..fe7657f54 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.25.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.25.bb
@@ -29,6 +29,12 @@ do_configure_append() {
     cp ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/libgphoto2_port/po/
     cd ${S}/libgphoto2_port/
     autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
+
+    # remove WORKDIR information from config to improve reproducibility
+    # libgphoto2_port recheck config will set the WORKDIR info again, so dont do that
+    sed -i 's/'$(echo ${WORKDIR} | sed 's_/_\\/_g')'/../g' ${B}/config.h
+    sed -i 's/'$(echo ${WORKDIR} | sed 's_/_\\/_g')'/../g' ${B}/libgphoto2_port/config.status
+    sed -i '/config\.status/ s/\-\-recheck//' ${B}/libgphoto2_port/Makefile
     cd ${S}
 }
 
-- 
2.17.1

