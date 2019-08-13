Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 413AF7E3AA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 09:23:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7D9N1Jx010553
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2019 02:23:01 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 13 Aug 2019 02:23:00 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 05:21:11 -0400
Message-ID: <20190813092118.113213-10-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190813092118.113213-1-kai.kang@windriver.com>
References: <20190813092118.113213-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 09/16] xfce4-appfinder: 4.13.3 -> 4.14.0
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
X-List-Received-Date: Tue, 13 Aug 2019 09:23:00 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update xfce4-appfinder from 4.13.3 to 4.14.0.

* remove dbus-glib from DEPENDS that xfce4-appfinder ports to gdbus

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...fce4-appfinder_4.13.3.bb => xfce4-appfinder_4.14.0.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.13.3.bb => xfce4-appfinder_4.14.0.bb} (46%)

diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.3.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.14.0.bb
similarity index 46%
rename from meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.3.bb
rename to meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.14.0.bb
index 309559646..2d6b7a550 100644
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.14.0.bb
@@ -1,14 +1,14 @@
-DESCRIPTION="Xfce4 Application Finder"
+DESCRIPTION = "Xfce4 Application Finder"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS="glib-2.0 gtk+3 libxfce4util libxfce4ui garcon dbus-glib xfconf"
+DEPENDS = "glib-2.0 gtk+3 libxfce4util libxfce4ui garcon xfconf"
 
 inherit xfce distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "c2069a14c85c8a3e537b2d4c552d36d2"
-SRC_URI[sha256sum] = "d738082a5fb01e42ea6333803012fd80258061f444afbbbd7b05a0f620a32ba6"
+SRC_URI[md5sum] = "03b226a2ee20f95243e74d1868e94e0e"
+SRC_URI[sha256sum] = "7ec175d4954fceb2e76cbfbca76ac4a4f53fe799d097a14117e7de68e88a4d98"
 
 FILES_${PN} += "${datadir}/metainfo"
-- 
2.20.0


