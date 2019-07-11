Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AACBF7F09D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 05:53:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6B5raWi022780
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 22:53:36 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 10 Jul 2019 22:53:36 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Jul 2019 13:52:57 +0800
Message-ID: <1562824377-198719-4-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562824377-198719-1-git-send-email-changqing.li@windriver.com>
References: <1562824377-198719-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] satyr: fix "Nothing RPROVIDES" when multilib enabled
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
X-List-Received-Date: Thu, 11 Jul 2019 05:53:35 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Multilib enabled, and add IMAGE_INSTALL_append = " python3-satyr"
in local.conf

fix below problem:
ERROR: Required build target 'lib32-core-image-minimal' has no buildable providers.
Missing or unbuildable dependency chain was: ['lib32-core-image-minimal', 'lib32-python3-satyr']

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-support/satyr/satyr_0.27.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/satyr/satyr_0.27.bb b/meta-oe/recipes-support/satyr/satyr_0.27.bb
index 10dfc2b..cc07dcb 100644
--- a/meta-oe/recipes-support/satyr/satyr_0.27.bb
+++ b/meta-oe/recipes-support/satyr/satyr_0.27.bb
@@ -19,8 +19,8 @@ DEPENDS += " \
     gdb \
 "
 
-PACKAGES += "python3-${PN}"
-FILES_python3-${PN} = "${PYTHON_SITEPACKAGES_DIR}/${BPN}"
+PACKAGES += "python3-${BPN}"
+FILES_python3-${BPN} = "${PYTHON_SITEPACKAGES_DIR}/${BPN}"
 
 PACKAGECONFIG ??= "python3 rpm"
 PACKAGECONFIG[python2] = "--with-python2, --without-python2,,python2"
-- 
2.7.4


