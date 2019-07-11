Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 000F27F0AA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 05:53:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6B5rNNJ018670
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 22:53:34 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 10 Jul 2019 22:53:12 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Jul 2019 13:52:55 +0800
Message-ID: <1562824377-198719-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562824377-198719-1-git-send-email-changqing.li@windriver.com>
References: <1562824377-198719-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] volume-key: fix "Nothing RPROVIDES" when multilib enabled
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
X-List-Received-Date: Thu, 11 Jul 2019 05:53:43 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Multilib enabled, and add IMAGE_INSTALL_append = " python3-volume-key"
in local.conf

fix below problem:
ERROR: Required build target 'lib32-core-image-minimal' has no buildable providers.
Missing or unbuildable dependency chain was: ['lib32-core-image-minimal', 'lib32-python3-volume-key']

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
index 398ca5c..3103748 100644
--- a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
+++ b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
@@ -31,8 +31,7 @@ PACKAGECONFIG ??= "python3"
 PACKAGECONFIG[python] = "--with-python,--without-python,python,python"
 PACKAGECONFIG[python3] = "--with-python3,--without-python3,python3,python3"
 
-RDEPENDS_python3-${PN} += "${PN}"
-
-PACKAGES += "python3-${PN}"
-FILES_python3-${PN} = "${PYTHON_SITEPACKAGES_DIR}/*"
+RDEPENDS_python3-${BPN} += "${PN}"
 
+PACKAGES += "python3-${BPN}"
+FILES_python3-${BPN} = "${PYTHON_SITEPACKAGES_DIR}/*"
-- 
2.7.4


