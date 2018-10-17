Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 715D271BEE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 08:16:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9H8Fl20025148
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Oct 2018 01:15:57 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 17 Oct 2018 01:15:36 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Wed, 17 Oct 2018 01:15:36 -0700
Message-ID: <20181017081536.121521-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] udisks2: Upgrade to 2.7.8
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
X-List-Received-Date: Wed, 17 Oct 2018 08:16:23 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

This is a bugfix release for UDisks 2.7. Included fixes:
- Fix string format vulnerability
- Fix CVE-2018-17336

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../udisks/{udisks2_2.7.7.bb => udisks2_2.7.8.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/udisks/{udisks2_2.7.7.bb => udisks2_2.7.8.bb} (89%)

diff --git a/meta-oe/recipes-support/udisks/udisks2_2.7.7.bb b/meta-oe/recipes-support/udisks/udisks2_2.7.8.bb
similarity index 89%
rename from meta-oe/recipes-support/udisks/udisks2_2.7.7.bb
rename to meta-oe/recipes-support/udisks/udisks2_2.7.8.bb
index ac86a69ee..64b338f11 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.7.7.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.7.8.bb
@@ -19,10 +19,10 @@ DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 RDEPENDS_${PN} = "acl"
 
 SRC_URI = " \
-    git://github.com/storaged-project/udisks.git \
+    git://github.com/storaged-project/udisks.git;branch=2.7.x-branch \
     file://non-gnu-libc.patch \
 "
-SRCREV = "fcf888ca00980f75ce0c47041629b3d77e9f352e"
+SRCREV = "47bc0141cb84624ba1e2242d596a89a30df1f5ea"
 S = "${WORKDIR}/git"
 
 CVE_PRODUCT = "udisks"
-- 
2.17.1


