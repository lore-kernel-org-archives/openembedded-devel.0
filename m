Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF4D07E562
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2019 08:46:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4V8kAgh026506
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 May 2019 01:46:30 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 31 May 2019 01:46:25 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 31 May 2019 04:44:23 -0400
Message-ID: <20190531084423.172617-11-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190531084423.172617-1-kai.kang@windriver.com>
References: <20190531084423.172617-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 10/10] xfce4-power-manager: 1.6.1 -> 1.6.2
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
X-List-Received-Date: Fri, 31 May 2019 08:46:49 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

* update FILES because it 'Install Appdata in metainfo' by upstream:
  https://github.com/xfce-mirror/xfce4-power-manager/commit/e40a57'

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...-power-manager_1.6.1.bb => xfce4-power-manager_1.6.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.6.1.bb => xfce4-power-manager_1.6.2.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.2.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb
rename to meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.2.bb
index 1cdcb4160..0a44b1f5d 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.2.bb
@@ -12,8 +12,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 DEPENDS += "gtk+3 glib-2.0 dbus-glib xfconf libxfce4ui libxfce4util libnotify \
            libxrandr virtual/libx11 libxext xfce4-panel upower libxscrnsaver"
 
-SRC_URI[md5sum] = "17f0e6464ad6b3bc6a657f595bf91430"
-SRC_URI[sha256sum] = "1ea825452343b895566068018b6d5078608f8f46ce8075ba6bbb4b848f48656b"
+SRC_URI[md5sum] = "2a49be4eca78fb519984db5aae38e4ab"
+SRC_URI[sha256sum] = "66ac34b33a2021b5af04c0181dfab6e6ee2bfab0ae07ed4527ca4552a66e1c01"
 
 EXTRA_OECONF = " \
     --enable-network-manager \
@@ -27,7 +27,7 @@ PACKAGES += "xfce4-powermanager-plugin"
 
 FILES_${PN} += " \
     ${datadir}/polkit-1 \
-    ${datadir}/appdata \
+    ${datadir}/metainfo \
 "
 
 FILES_xfce4-powermanager-plugin = " \
-- 
2.20.0


