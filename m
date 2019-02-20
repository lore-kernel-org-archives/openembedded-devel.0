Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2BC097C942
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 09:34:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1K9YnXC004743
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Feb 2019 01:34:49 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Wed, 20 Feb 2019 01:34:48 -0800
From: <mingli.yu@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Feb 2019 17:34:46 +0800
Message-ID: <1550655287-207471-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] udisks2: add REQUIRED_DISTRO_FEATURES for polkit
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
X-List-Received-Date: Wed, 20 Feb 2019 09:34:50 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

After below commits to add polkit as a required
distro feature:
97a1a55 polkit: add polkit as a required distro feature
c049e02 polkit: inherit distro_features_check

Need to add REQUIRED_DISTRO_FEATURES for polkit to
fix below error for these packages which depend on
polkit:
$ bitbake udisk2
ERROR: Nothing PROVIDES 'polkit' (but /build/layers/meta-openembedded/meta-oe/recipes-support/udisks/udisks2_2.7.8.bb  DEPENDS on or otherwise requires it)

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-oe/recipes-support/udisks/udisks2_2.7.8.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/udisks/udisks2_2.7.8.bb b/meta-oe/recipes-support/udisks/udisks2_2.7.8.bb
index 64b338f..95f8e22 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.7.8.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.7.8.bb
@@ -27,7 +27,9 @@ S = "${WORKDIR}/git"
 
 CVE_PRODUCT = "udisks"
 
-inherit autotools systemd gtk-doc gobject-introspection
+inherit autotools systemd gtk-doc gobject-introspection distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "polkit"
 
 EXTRA_OECONF = "--disable-man --disable-gtk-doc"
 
-- 
2.7.4


