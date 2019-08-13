Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 76C6D60017
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 09:24:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7D9O8Ug027702
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2019 02:24:18 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 13 Aug 2019 02:23:57 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 05:21:18 -0400
Message-ID: <20190813092118.113213-17-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190813092118.113213-1-kai.kang@windriver.com>
References: <20190813092118.113213-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 16/16] xfwm4: 4.13.3 -> 4.14.0
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
X-List-Received-Date: Tue, 13 Aug 2019 09:24:43 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-xfce/xfwm4/{xfwm4_4.13.3.bb => xfwm4_4.14.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.13.3.bb => xfwm4_4.14.0.bb} (87%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.3.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.0.bb
similarity index 87%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.3.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.0.bb
index 591580b84..77b45a7c9 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.3.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION="Xfce4 Window Manager"
+DESCRIPTION = "Xfce4 Window Manager"
 SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
@@ -9,8 +9,8 @@ inherit xfce update-alternatives distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch"
-SRC_URI[md5sum] = "e53081e5928d401604d158429716e699"
-SRC_URI[sha256sum] = "12ad274f6662c8afee35fd9b9310e73bd462c423578d448b2d7353e3c8eda6c1"
+SRC_URI[md5sum] = "c33847836958d540e3ecd0a27f131c0f"
+SRC_URI[sha256sum] = "b4182bf8dc63d092f120a51fcae0eb54b9bd4aa4f8486f47e5a65a108322b615"
 
 PACKAGECONFIG ?= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'epoxy', '', d)} \
-- 
2.20.0


