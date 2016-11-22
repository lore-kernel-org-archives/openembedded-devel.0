Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B0AEE719BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 07:33:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAM7XSJC010607
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 23:33:28 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 21 Nov 2016 23:33:27 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Nov 2016 15:31:05 +0800
Message-ID: <4217b01025c0f58083acadac5f8ad4abf433b409.1479795970.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1479795970.git.jackie.huang@windriver.com>
References: <cover.1479795970.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 20/27] thunar-volman: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 22 Nov 2016 07:33:26 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

thunar-volman depends on gtk+ and libxfce4ui which
require x11 distro feature.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.1.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.1.bb
index 44e3777..c61d451 100644
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.1.bb
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.1.bb
@@ -4,7 +4,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "exo glib-2.0 gtk+ libxfce4ui libxfce4util xfconf libnotify libgudev"
 
-inherit xfce
+inherit xfce distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-Fix-return-with-no-value-in-function-returning-non-v.patch"
 SRC_URI[md5sum] = "65ab6e05b2e808d1dcc8d36683a59b7e"
-- 
2.8.3


