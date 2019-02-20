Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1161F7C942
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 09:35:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1K9Z1aS028042
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Feb 2019 01:35:11 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Wed, 20 Feb 2019 01:34:50 -0800
From: <mingli.yu@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Feb 2019 17:34:47 +0800
Message-ID: <1550655287-207471-2-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550655287-207471-1-git-send-email-mingli.yu@windriver.com>
References: <1550655287-207471-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] upower: add REQUIRED_DISTRO_FEATURES for polkit
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
X-List-Received-Date: Wed, 20 Feb 2019 09:35:41 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

After below commits to add polkit as a required
distro feature:
97a1a55 polkit: add polkit as a required distro feature
c049e02 polkit: inherit distro_features_check

Need to add REQUIRED_DISTRO_FEATURES for polkit to
fix below error for these packages which depend on
polkit:
$ bitbake upower
ERROR: Nothing PROVIDES 'polkit' (but /build/layers/meta-openembedded/meta-oe/recipes-support/upower/upower_0.99.7.bb DEPENDS on or otherwise requires it)

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-oe/recipes-support/upower/upower_0.99.7.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/upower/upower_0.99.7.bb b/meta-oe/recipes-support/upower/upower_0.99.7.bb
index 2cf3163..3fd91e9 100644
--- a/meta-oe/recipes-support/upower/upower_0.99.7.bb
+++ b/meta-oe/recipes-support/upower/upower_0.99.7.bb
@@ -11,7 +11,9 @@ SRC_URI = " \
 SRC_URI[md5sum] = "236bb439d9ff1151450b3d8582399532"
 SRC_URI[sha256sum] = "24bcc2f6ab25a2533bac70b587bcb019e591293076920f5b5e04bdedc140a401"
 
-inherit autotools pkgconfig gettext gobject-introspection systemd
+inherit autotools pkgconfig gettext gobject-introspection systemd distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "polkit"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[idevice] = "--with-idevice,--without-idevice,libimobiledevice libplist"
-- 
2.7.4


