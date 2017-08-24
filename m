Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C2170607F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 07:29:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7O7TeIW026329
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 00:29:40 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 24 Aug 2017 00:29:39 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Aug 2017 15:28:57 +0800
Message-ID: <20170824072857.19137-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] logwarn: set correct paths and add missing dependency
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
X-List-Received-Date: Thu, 24 Aug 2017 07:29:39 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* Set correct paths for programs (bash, cat, rm and sed)
  to avoid QA issue:
  | ERROR: logwarn-1.0.14-r0 do_package_qa: QA Issue:
  | /usr/lib/nagios/plugins/check_logwarn contained in package
  | logwarn-nagios requires /builddir/tmp/hosttools/bash,
  |  but no providers found in RDEPENDS_logwarn-nagios? [file-rdeps]

* Add missing dependency on coreutils and sed.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-support/logwarn/logwarn_1.0.14.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/logwarn/logwarn_1.0.14.bb b/meta-oe/recipes-support/logwarn/logwarn_1.0.14.bb
index 00e5d497b..5ae36bb67 100644
--- a/meta-oe/recipes-support/logwarn/logwarn_1.0.14.bb
+++ b/meta-oe/recipes-support/logwarn/logwarn_1.0.14.bb
@@ -22,6 +22,12 @@ lcl_default_state_dir = "${localstatedir}/lib/logwarn"
 
 CFLAGS += '-DDEFAULT_STATE_DIR=\""${lcl_default_state_dir}\""'
 
+CACHED_CONFIGUREVARS += " \
+    ac_cv_path_BASH_SHELL=${base_bindir}/bash \
+    ac_cv_path_CAT=${base_bindir}/cat \
+    ac_cv_path_RM=${base_bindir}/rm \
+    ac_cv_path_SED=${base_bindir}/sed \
+"
 
 # Make sure some files exist for autoreconf.
 #
@@ -43,4 +49,4 @@ PACKAGES += "${PN}-nagios"
 
 FILES_${PN}-nagios = "${nonarch_libdir}/nagios"
 
-RDEPENDS_${PN}-nagios += "bash"
+RDEPENDS_${PN}-nagios += "bash coreutils sed"
-- 
2.11.0


