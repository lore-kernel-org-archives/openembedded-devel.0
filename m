Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EF04D7E668
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 14:14:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6GEDhFW019609
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Jul 2019 07:13:53 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 16 Jul 2019 07:13:32 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 16 Jul 2019 10:12:24 -0400
Message-ID: <20190716141231.77957-9-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190716141231.77957-1-kai.kang@windriver.com>
References: <20190716141231.77957-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 08/15] xfdesktop: 4.13.4 -> 4.13.5
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
X-List-Received-Date: Tue, 16 Jul 2019 14:14:18 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

* clean DEPENDS
  - dbus-glib has been replaced by gdbus
  - libxfce4util and xfconf are required by libxfce4ui

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xfdesktop/{xfdesktop_4.13.4.bb => xfdesktop_4.13.5.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.13.4.bb => xfdesktop_4.13.5.bb} (60%)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.4.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.5.bb
similarity index 60%
rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.4.bb
rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.5.bb
index f02a6bffe..c1aac7243 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.4.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.13.5.bb
@@ -2,14 +2,14 @@ SUMMARY = "Xfce4 Desktop Manager"
 SECTION = "x11/base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "libxfce4util libxfce4ui libwnck xfconf dbus-glib dbus-glib-native thunar garcon exo"
+DEPENDS = "libxfce4ui libwnck thunar garcon exo"
 
 inherit xfce distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "d1174af12148141a07b62cc051c43c84"
-SRC_URI[sha256sum] = "f4f7fa5162512971c25066eb04ef78f0d075656da79b6f7425ffb619a5119ca0"
+SRC_URI[md5sum] = "6a58fe3119b9fb3eb6bb563e14689739"
+SRC_URI[sha256sum] = "b7d273d36f5f39a446c4d0303148bc595ed7b0f36269619c91526edd1d1caeb6"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.20.0


