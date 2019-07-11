Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 495D47F09B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 05:53:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6B5rZ3A006235
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 22:53:35 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 10 Jul 2019 22:53:34 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Jul 2019 13:52:56 +0800
Message-ID: <1562824377-198719-3-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562824377-198719-1-git-send-email-changqing.li@windriver.com>
References: <1562824377-198719-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] isomd5sum: fix "Nothing RPROVIDES" when multilib enabled
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
X-List-Received-Date: Thu, 11 Jul 2019 05:53:34 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Multilib enabled, and add IMAGE_INSTALL_append = " python3-isomd5sum"
in local.conf

fix below problem:
ERROR: Required build target 'lib32-core-image-minimal' has no buildable providers.
Missing or unbuildable dependency chain was: ['lib32-core-image-minimal', 'lib32-python3-isomd5sum']

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.3.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.3.bb b/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.3.bb
index 83e8385..b7899a1 100644
--- a/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.3.bb
+++ b/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Tools for taking the MD5 sum of ISO images"
 DESCRIPTION = "Tools for taking the MD5 sum of ISO images"
 
 DEPENDS = "popt python3 openssl curl popt-native"
-RDEPENDS_${PN} = "openssl curl"
+RDEPENDS_${BPN} = "openssl curl"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
@@ -25,11 +25,11 @@ do_install () {
     oe_runmake install
 }
 
-PACKAGES += "${PYTHON_PN}-${PN}"
+PACKAGES += "${PYTHON_PN}-${BPN}"
 
-RPROVIDES_${PN}-dbg += "${PYTHON_PN}-${PN}-dbg"
+RPROVIDES_${BPN}-dbg += "${PYTHON_PN}-${BPN}-dbg"
 
-FILES_${PYTHON_PN}-${PN} = "${PYTHON_SITEPACKAGES_DIR}/pyisomd5sum.so"
+FILES_${PYTHON_PN}-${BPN} = "${PYTHON_SITEPACKAGES_DIR}/pyisomd5sum.so"
 
 SRCREV = "7860901f726f5d92689cb67243cc7f981f21f74b"
 
-- 
2.7.4


