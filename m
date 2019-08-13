Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DEEF07ED48
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 09:22:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7D9MQqG017109
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2019 02:22:26 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 13 Aug 2019 02:22:26 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 05:21:07 -0400
Message-ID: <20190813092118.113213-6-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190813092118.113213-1-kai.kang@windriver.com>
References: <20190813092118.113213-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 05/16] garcon: 0.6.3 -> 0.6.4
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
X-List-Received-Date: Tue, 13 Aug 2019 09:22:26 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../garcon/{garcon_0.6.3.bb => garcon_0.6.4.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/garcon/{garcon_0.6.3.bb => garcon_0.6.4.bb} (70%)

diff --git a/meta-xfce/recipes-xfce/garcon/garcon_0.6.3.bb b/meta-xfce/recipes-xfce/garcon/garcon_0.6.4.bb
similarity index 70%
rename from meta-xfce/recipes-xfce/garcon/garcon_0.6.3.bb
rename to meta-xfce/recipes-xfce/garcon/garcon_0.6.4.bb
index dc44eae03..62c789019 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_0.6.3.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_0.6.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION="Xfce Menu Library"
+DESCRIPTION = "Xfce Menu Library"
 SECTION = "x11/libs"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=04a01abcbdabffae1ca26335a293276b"
@@ -9,8 +9,8 @@ inherit xfce gtk-doc distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch"
-SRC_URI[md5sum] = "3b54d210adec3b6be781a1da26b53da2"
-SRC_URI[sha256sum] = "76b1fea531363e9c5e767f1899039b4fe854edf23f6c0f260807e5551f798401"
+SRC_URI[md5sum] = "9715aa8214be9c553d9b8c44fde90b9f"
+SRC_URI[sha256sum] = "d75e4753037a74733c07b71b8db7a656d869869f0f107f6411a306bbc87a762d"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
-- 
2.20.0


