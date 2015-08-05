Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id AAFE7755F8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2015 03:21:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99277609"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Aug 2015 11:25:14 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t753JplO026974
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Aug 2015 11:19:51 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 5 Aug 2015 11:21:44 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Aug 2015 11:21:37 +0800
Message-ID: <1438744897-1635-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH] gradm: upgrade 3.0 -> 3.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Aug 2015 03:21:51 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/gradm/{gradm_3.0.bb => gradm_3.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/gradm/{gradm_3.0.bb => gradm_3.1.bb} (89%)

diff --git a/meta-oe/recipes-support/gradm/gradm_3.0.bb b/meta-oe/recipes-support/gradm/gradm_3.1.bb
similarity index 89%
rename from meta-oe/recipes-support/gradm/gradm_3.0.bb
rename to meta-oe/recipes-support/gradm/gradm_3.1.bb
index 2f1d39d..fe36fba 100644
--- a/meta-oe/recipes-support/gradm/gradm_3.0.bb
+++ b/meta-oe/recipes-support/gradm/gradm_3.1.bb
@@ -11,10 +11,10 @@ LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4641e94ec96f98fabc56ff9cc48be14b"
 DEPENDS = "flex-native bison-native ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-SRC_URI = "http://grsecurity.net/stable/${BP}-201408301734.tar.gz \
+SRC_URI = "http://grsecurity.net/stable/${BP}-201507191652.tar.gz \
            file://0001-Makefile-remove-strip.patch"
-SRC_URI[md5sum] = "79ec912e6544c5e58753f658623763f9"
-SRC_URI[sha256sum] = "b190e5afecdf3ac5020a4e5e4b698645f1c01b20d036129dd8b609c4bd0c319c"
+SRC_URI[md5sum] = "ecec72d3a9b6d84c00eda97957b707b6"
+SRC_URI[sha256sum] = "2f14c357bf0459e502a4e108b76c3f6240aa484762d07bb1687796b9b9297a50"
 
 S = "${WORKDIR}/gradm"
 
-- 
1.8.4.2


