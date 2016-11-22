Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B9C060616
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 07:33:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAM7XMRb005562
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 23:33:23 -0800
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 21 Nov 2016 23:33:22 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Nov 2016 15:31:01 +0800
Message-ID: <6bd85e26dc8c4eb50bc5e55443eee41a84f477d1.1479795970.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1479795970.git.jackie.huang@windriver.com>
References: <cover.1479795970.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 16/27] garcon: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 22 Nov 2016 07:33:21 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

garcon depends on libxfce4ui which requires x11 distro feature

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-xfce/recipes-xfce/garcon/garcon_0.4.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/garcon/garcon_0.4.0.bb b/meta-xfce/recipes-xfce/garcon/garcon_0.4.0.bb
index 81143b5..8a3260a 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_0.4.0.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_0.4.0.bb
@@ -4,7 +4,9 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=04a01abcbdabffae1ca26335a293276b"
 DEPENDS = "xfce4-dev-tools-native libxfce4util libxfce4ui intltool-native"
 
-inherit xfce gtk-doc
+inherit xfce gtk-doc distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch"
 SRC_URI[md5sum] = "aba62b80787aac295083bf7afd419ffb"
-- 
2.8.3


