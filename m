Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BCE227E668
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 14:13:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6GEDx0j013565
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Jul 2019 07:13:59 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 16 Jul 2019 07:13:58 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 16 Jul 2019 10:12:25 -0400
Message-ID: <20190716141231.77957-10-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190716141231.77957-1-kai.kang@windriver.com>
References: <20190716141231.77957-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 09/15] xfce4-power-manager: 1.6.2 -> 1.6.3
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
X-List-Received-Date: Tue, 16 Jul 2019 14:13:58 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

* clean DEPENDS
  - dbus-glib has been replaced by gdbus
  - gtk+3 glib-2.0 xfconf and libxfce4util are required by libxfce4ui
    which is required by xfce4-panel

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...power-manager_1.6.2.bb => xfce4-power-manager_1.6.3.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.6.2.bb => xfce4-power-manager_1.6.3.bb} (79%)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.2.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.3.bb
similarity index 79%
rename from meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.2.bb
rename to meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.3.bb
index 0a44b1f5d..b03adc46b 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.3.bb
@@ -9,11 +9,10 @@ inherit xfce distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-DEPENDS += "gtk+3 glib-2.0 dbus-glib xfconf libxfce4ui libxfce4util libnotify \
-           libxrandr virtual/libx11 libxext xfce4-panel upower libxscrnsaver"
+DEPENDS += "libnotify libxrandr virtual/libx11 libxext xfce4-panel upower libxscrnsaver"
 
-SRC_URI[md5sum] = "2a49be4eca78fb519984db5aae38e4ab"
-SRC_URI[sha256sum] = "66ac34b33a2021b5af04c0181dfab6e6ee2bfab0ae07ed4527ca4552a66e1c01"
+SRC_URI[md5sum] = "b5ed83dd7f30a54f95d1fae1c84fa33c"
+SRC_URI[sha256sum] = "debd8ac2409b5ac230593894b8bb668298f78bd12891623edbfc32ac87c64011"
 
 EXTRA_OECONF = " \
     --enable-network-manager \
-- 
2.20.0


