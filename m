Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BAE407C9AB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 08:56:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1K8uvNT012038
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 00:56:58 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Wed, 20 Feb 2019 00:56:57 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Feb 2019 16:56:20 +0800
Message-ID: <1550652980-292761-6-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550652980-292761-1-git-send-email-changqing.li@windriver.com>
References: <1550652980-292761-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] udisk2: 2.7.8 -> 2.8.1
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
X-List-Received-Date: Wed, 20 Feb 2019 08:56:57 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-support/udisks/{udisks2_2.7.8.bb => udisks2_2.8.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/udisks/{udisks2_2.7.8.bb => udisks2_2.8.1.bb} (89%)

diff --git a/meta-oe/recipes-support/udisks/udisks2_2.7.8.bb b/meta-oe/recipes-support/udisks/udisks2_2.8.1.bb
similarity index 89%
rename from meta-oe/recipes-support/udisks/udisks2_2.7.8.bb
rename to meta-oe/recipes-support/udisks/udisks2_2.8.1.bb
index 64b338f..ee23a63 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.7.8.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.8.1.bb
@@ -19,10 +19,10 @@ DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 RDEPENDS_${PN} = "acl"
 
 SRC_URI = " \
-    git://github.com/storaged-project/udisks.git;branch=2.7.x-branch \
+    git://github.com/storaged-project/udisks.git;branch=master \
     file://non-gnu-libc.patch \
 "
-SRCREV = "47bc0141cb84624ba1e2242d596a89a30df1f5ea"
+SRCREV = "05ae471be3c2adf2255b3a01edb00bba06e02afb"
 S = "${WORKDIR}/git"
 
 CVE_PRODUCT = "udisks"
-- 
2.7.4


